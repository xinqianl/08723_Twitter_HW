//
//  ViewController.h
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/26/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UISplitViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) CLGeocoder *geocoder;

// location manager for current location
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (readonly) CLLocationCoordinate2D selectedCoordinate;
@property (nonatomic, strong) MKPlacemark *placemark;

@property (nonatomic, strong) NSArray *searchPlacemarksCache;
@property (nonatomic, strong) NSArray *mapItemList;

@property (nonatomic, strong) NSMutableArray *mapAnnotations;

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

//@property (nonatomic, strong) EventAnnotation *annotation;

- (void)configureView;

@end
