//
//  DetailViewController.m
//  Test5
//
//  Created by Sophie Jeong on 3/25/14.
//  Copyright (c) 2014 CarnegieMellonUniversity. All rights reserved.
//

#import "ThirdViewController.h"
#import "EventAnnotation.h"
#import <AddressBookUI/AddressBookUI.h>
@interface ThirdViewController ()

@end

@implementation ThirdViewController

//
//+ (CGFloat)annotationPadding;
//{
//    return 10.0f;
//}
//
//+ (CGFloat)calloutHeight;
//{
//    return 40.0f;
//}
//
//#pragma mark - Managing the detail item
//
//- (void)setDetailItem:(id)newDetailItem
//{
////    if (_detailItem != newDetailItem) {
////        _detailItem = newDetailItem;
////        
////        // Update the view.
////        [self configureView];
////    }
//    
//    if (self.masterPopoverController != nil) {
//        [self.masterPopoverController dismissPopoverAnimated:YES];
//    }
//}

- (void)configureView
{
    
//    if (self.detailItem) {
//        
//        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"eventName"] description];
//        self.eventTime.text = [[self.detailItem valueForKey:@"eventTime"] description];
//        self.eventLocation.text = [[self.detailItem valueForKey:@"eventLocation"] description];
//        
//    }
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    
//    [self generatePlaces];
    // self.title = [self.detailItem description];
//    NSString *baseString=[[self.detailItem valueForKey:@"eventName"] description];
//    NSString *coordString=[[self.detailItem valueForKey:@"eventLocation"] description];
//    
//    NSArray * dateOrTime = [baseString componentsSeparatedByString:@" "];
//    NSArray * coords = [coordString componentsSeparatedByString:@","];
//    
//    NSLog([coords objectAtIndex: 0]);
//    //    NSLog([coords objectAtIndex: 1]);
//    
//    self.title=self.detailDescriptionLabel.text ;
//    self.title= [@" " stringByAppendingFormat:@" %@", dateOrTime[0]];
//    self.title=self.eventTime.text;
//    
//    self.mapView.showsBuildings=YES;
//    self.mapView.showsUserLocation = YES;
//    
//    //MKUserLocation *userLocation = self.mapView.userLocation;
//    //self.mapView.centerCoordinate =userLocation.location.coordinate;
//    
//    //CLLocationCoordinate2D center = CLLocationCoordinate2DMake(_mapView.userLocation.location.coordinate.latitude,_mapView.userLocation.location.coordinate.longitude) ;
//    if (_mapItemList.count==1){
//        
//        MKMapItem *mapItem = [self.mapItemList objectAtIndex:0];
//        
//        self.title = mapItem.name;
//        MKPlacemark *mPlacemark = [[MKPlacemark alloc] initWithCoordinate:_selectedCoordinate addressDictionary:nil] ;
//        
//        
//        [_mapView addAnnotation:mPlacemark];
//        // add the single annotation to our map
//        EventAnnotation *annotation = [[EventAnnotation alloc] init];
//        annotation.coordinate = _selectedCoordinate;
//        
//        annotation.title = self.detailDescriptionLabel.text;
//        annotation.subTitle = self.eventTime.text;
//        [self.mapView addAnnotation:annotation];
//        
//        // we have only one annotation, select it's callout
//        [self.mapView selectAnnotation:[self.mapView.annotations objectAtIndex:0] animated:YES];
//        
//        // center the region around this map item's coordinate
//        self.mapView.centerCoordinate = mapItem.placemark.coordinate;
//    }
//    
//    // otherwise display the list of results
//    // CLPlacemark *placemark = _searchPlacemarksCache[0];
//    
//    NSString *addressStr = self.eventLocation.text;
//    NSLog(addressStr);
//    
//}
///*
// - (IBAction)zoomIn:(id)sender {
// MKUserLocation *userLocation = _mapView.userLocation;
// MKCoordinateRegion region =
// MKCoordinateRegionMakeWithDistance (
// userLocation.location.coordinate, 20000, 20000);
// [_mapView setRegion:region animated:NO];
// }
// */
//
//
//- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
//    if (status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Location Disabled"
//                                                                       message:@"Please enable location services in the Settings app."
//                                                                preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
//                                                  style:UIAlertActionStyleDefault
//                                                handler:nil]];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
//    else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
//        // This will implicitly try to get the user's location, so this can't be set
//        // until we know the user granted this app location access
//        self.mapView.showsUserLocation = YES;
//    }
//}
//
//-(void)generatePlaces{
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    if (self.eventLocation.text.length!=0) {
//        [geocoder geocodeAddressString:self.eventLocation.text
//                     completionHandler:^(NSArray* placemarks, NSError* error){
//                         if ([placemarks count] > 0) {
//                             NSLog(@"Co-ordinate geocode is %@", [placemarks objectAtIndex:0]);
//                             for (CLPlacemark* aPlacemark in placemarks)
//                                 
//                             {
//                                 CLPlacemark *topResult = [placemarks objectAtIndex:0];
//                                 MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
//                                 //EDITED
//                                 MKPlacemark *mPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.mapView.userLocation.coordinate addressDictionary:nil];
//                                 
//                                 
//                                 
//                                 MKCoordinateRegion region = _mapView.region;
//                                 region.center = placemark.region.center;
//                                 
//                                 [_mapView addAnnotation:placemark];
//                                 
//                                 [_mapView addAnnotation:mPlacemark];
//                                 
//                             }
//                         }
//                     }
//         ];
//        
//        
//    }
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - Split view
//
//- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
//{
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
//    self.masterPopoverController = popoverController;
//}
//
//- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
//{
//    // Called when the view is shown again in the split view, invalidating the button and popover controller.
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
//    self.masterPopoverController = nil;
//}
//
//#pragma mark - MKMapViewDelegate
//
//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    
//    // in case it's the user location, we already have an annotation, so just return nil
//    if ([annotation isKindOfClass:[MKUserLocation class]])
//    {
//        return nil;
//    }
//    static NSString *identifier = @"myAnnotation";
//    MKPinAnnotationView *annotationView = nil;
//    if ([annotation isKindOfClass:[EventAnnotation class]])
//    {
//        annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
//        if (annotationView == nil)
//        {
//            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
//            annotationView.canShowCallout = YES;
//            annotationView.animatesDrop = YES;
//            annotationView.pinColor = MKPinAnnotationColorPurple;
//            return annotationView;
//        }
//        else
//        {
//            annotationView.annotation = annotation;
//        }
//        return annotationView;
//    }
//    return nil;
}

@end
