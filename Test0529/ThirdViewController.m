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
     self.view.backgroundColor = [UIColor whiteColor];
    UIButton *startButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    
    // set the frame to the start button
    startButton.frame = CGRectMake(70.0f,80.0f,150.0f,30.0f);
    
    [startButton setTitle:@"Search" forState:UIControlStateNormal];
    startButton.backgroundColor = [UIColor yellowColor];
    
    // add a ib action to start button
    [startButton addTarget:self
                    action:@selector (startButtonPress)
          forControlEvents: UIControlEventTouchUpInside];
   
    [self.view addSubview: startButton];

    
    
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

-(void)generatePlaces:(NSString *)location{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    if (location.length!=0) {
        [geocoder geocodeAddressString:location
                     completionHandler:^(NSArray* placemarks, NSError* error){
                         if ([placemarks count] > 0) {
                             NSLog(@"%lu",(unsigned long)placemarks.count);
                             NSLog(@"Co-ordinate geocode is %@", [placemarks objectAtIndex:0]);
                             for (CLPlacemark* aPlacemark in placemarks)
                                 
                             {
                                 CLPlacemark *topResult = [placemarks objectAtIndex:0];
                                 MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                                 //EDITED
                                 MKPlacemark *mPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.mapView.userLocation.coordinate addressDictionary:nil];
                                 
                                 
                                 
                                 MKCoordinateRegion region = _mapView.region;
                                 region.center = placemark.region.center;
                                 
                                 [_mapView addAnnotation:placemark];
                                 
                                 [_mapView addAnnotation:mPlacemark];
                                 
                             }
                         }
                     }
         ];
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
   
    [self generatePlaces:self.myAddress.text];
    NSLog(@"%@", self.myAddress.text);
    self.mapView.showsBuildings=YES;
    self.mapView.showsUserLocation = YES;
    if (_mapItemList.count==1){
        
        MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
        
        self.title = mapItem.name;
        MKPlacemark *mPlacemark = [[MKPlacemark alloc] initWithCoordinate:_selectedCoordinate addressDictionary:nil] ;
        
        
        [_mapView addAnnotation:mPlacemark];
        EventAnnotation *annotation = [[EventAnnotation alloc] init];
        annotation.coordinate = _selectedCoordinate;
        annotation.title = self.myAddress.text;
        dispatch_async(dispatch_get_main_queue(),^{
            
            [self.mapView addAnnotation:annotation];
        
        });
        
        [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
        self.mapView.centerCoordinate = mapItem.placemark.coordinate;
    
    }
    
//     otherwise display the list of results
//     CLPlacemark *placemark = _searchPlacemarksCache[0];
    
    
}


@end
