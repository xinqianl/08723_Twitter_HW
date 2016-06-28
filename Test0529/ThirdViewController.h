//
//  ThirdViewController.h
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/26/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ThirdViewController : UIViewController <UISplitViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UITextField *myAddress;
//@property NSString *myAddress;
@property (nonatomic, strong) CLGeocoder *geocoder;

// location manager for current location
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (readonly) CLLocationCoordinate2D selectedCoordinate;
@property (nonatomic, strong) MKPlacemark *placemark;

@property (nonatomic, strong) NSArray *searchPlacemarksCache;
@property (nonatomic, strong) NSArray *mapItemList;

@property (nonatomic, strong) NSMutableArray *mapAnnotations;

@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (strong, nonatomic) NSString *coordString;
@property (assign, nonatomic) MKCoordinateRegion *region;
//@property (nonatomic, strong) EventAnnotation *annotation;

- (void)configureView;
@end
