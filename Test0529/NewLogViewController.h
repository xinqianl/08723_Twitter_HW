//
//  myTestViewController.h
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/6/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface NewLogViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (strong, nonatomic) UILabel *startLabel;
@property (strong, nonatomic) UILabel *endLabel;
@property NSDate *startDate;
@property NSDate *endDate;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *endButton;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
-(void) viewDidLoad;
@end
