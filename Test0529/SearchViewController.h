//
//  SearchViewController.h
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <MapKit/MapKit.h>
#import "ResultViewController.h"
@interface SearchViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property NSMutableArray *results;
@property ResultViewController *testController;
@end
