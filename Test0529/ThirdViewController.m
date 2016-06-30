//
//  ThirdViewController.m
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/26/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "ThirdViewController.h"
#import "EventAnnotation.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController



+ (CGFloat)annotationPadding;
{
    return 10.0f;
}

+ (CGFloat)calloutHeight;
{
    return 40.0f;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label.text = self.result.name;
    self.view.backgroundColor = [UIColor whiteColor];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    [self startButtonPress];
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Location Disabled"
                                                                       message:@"Please enable location services in the Settings app."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.mapView.showsUserLocation = YES;
    }
}
- (IBAction)myLocation:(UIBarButtonItem *)sender {
    float spanX = 0.00725;
    float spanY = 0.00725;
    self.location = self.locationManager.location;
    MKCoordinateRegion region;
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span = MKCoordinateSpanMake(spanX, spanY);
    [self.mapView setRegion:region animated:YES];
}

-(void)generatePlaces:(NSString *)location{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    if (location.length!=0) {
        [geocoder geocodeAddressString:location
                     completionHandler:^(NSArray* placemarks, NSError* error){
                             float spanX = 0.00725;
                             float spanY = 0.00725;
                             MKCoordinateRegion region;
                             region.center.latitude = self.result.location.coordinate.latitude;
                             region.center.longitude = self.result.location.coordinate.longitude;
                             region.span = MKCoordinateSpanMake(spanX, spanY);
                             [self.mapView setRegion:region animated:YES];
                         NSArray *add = [self.result.addressDictionary objectForKey:@"FormattedAddressLines"];
                         NSMutableString *address = [[NSMutableString alloc]init];
                         for (id myArrayElement in add) {
                             [address appendString:myArrayElement];
                             [address appendString:@","];
                         }
                         EventAnnotation *annotation = [[EventAnnotation alloc] init];
                         annotation.coordinate = self.result.coordinate;
                         annotation.title = [NSString stringWithFormat:@"%@%@%@", self.result.name, @",",address];
                         self.label2.text = address;
                         [self.mapView addAnnotation:annotation];
                     }
         ];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
   
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView *annotationView = nil;
    if ([annotation isKindOfClass:[EventAnnotation class]])
    {
        annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
        if (annotationView == nil)
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
            annotationView.canShowCallout = YES;
            annotationView.animatesDrop = YES;
            annotationView.pinColor = MKPinAnnotationColorPurple;
            return annotationView;
        }
        else
        {
            annotationView.annotation = annotation;
        }
        return annotationView;
    }
    return nil;
}


- (void)startButtonPress {
    [self.mapView removeAnnotations:self.mapView.annotations];
   
    [self generatePlaces:self.result.name];
    
}


@end
