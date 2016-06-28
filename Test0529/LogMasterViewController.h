//
//  EventMasterViewController.h
//  Test0529
//
//  Created by Sophie Jeong on 06/01/15.
//  Copyright (c) 2015 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class LogDetailViewController;
@interface LogMasterViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) LogDetailViewController *eventDetailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;



@end
