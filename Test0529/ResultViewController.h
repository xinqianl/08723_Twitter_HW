//
//  ResultViewController.h
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ThirdViewController.h"
@interface ResultViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *results;
@property NSString *input;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
