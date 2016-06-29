//
//  myTestViewController.m
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/6/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "NewLogViewController.h"
#import "EventLog.h"
#import "LogMasterViewController.h"
@implementation NewLogViewController


- (NSString *) getCurrentTimeString: (NSDate *) nowDate{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [gregorian components:
                                        (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|
                                         NSCalendarUnitHour  | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                                    fromDate:nowDate];
    
    NSInteger hour = [dateComponents hour];
    NSInteger minute = [dateComponents minute];
    NSInteger second = [dateComponents second];
    
    NSInteger year = [dateComponents year];
    NSInteger month = [dateComponents month];
    NSInteger day = [dateComponents day];
    
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",
            (long)year, (long) month, (long)day,(long)hour, (long)minute, (long)second];
    
    
}
-(void) viewDidLoad{
    [super viewDidLoad];
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *startButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    
    // set the frame to the start button
    startButton.frame = CGRectMake(70.0f,200.0f,150.0f,30.0f);
    
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    startButton.backgroundColor = [UIColor yellowColor];
    
    // add a ib action to start button
    [startButton addTarget:self
                    action:@selector (startButtonPress)
          forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview: startButton];
    
    UIButton *endButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    endButton.frame = CGRectMake(70.0f,400.0f,150.0f,30.0f);
    [endButton setTitle:@"End" forState:UIControlStateNormal];
    endButton.backgroundColor = [UIColor redColor];
    [endButton addTarget:self
                  action:@selector (endButtonPress)
        forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: endButton];
    
    self.startLabel = [[UILabel alloc]
                       initWithFrame:CGRectMake (70.0f, 300.0f, 250.0f, 30.0f)];
    self.startLabel.text = @"Tap button to get start time";
    [self.view addSubview: self.startLabel];
    
    
    
    self.endLabel = [[UILabel alloc]
                     initWithFrame:CGRectMake (70.0f, 500.0f, 250.0f, 30.0f)];
    
    self.endLabel.text = @"Tap button to get end time";
    [self.view addSubview: self.endLabel];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Save"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(saveButtonPress)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    
}

-(void) saveButtonPress
{
    if([self.startLabel.text rangeOfString:@"-"].location == NSNotFound
       || [self.endLabel.text rangeOfString:@"-"].location == NSNotFound){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR!"
                                                       message:@"Please get both start and end time."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        
    }else{
        
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
        
        [newManagedObject setValue: self.startDate forKey:@"startTime"];
        [newManagedObject setValue: self.startDate forKey:@"timeStamp"];
        [newManagedObject setValue: self.endDate forKey:@"endTime"];
        NSString *starttime = [self getCurrentTimeString:self.startDate];
        NSString *endtime = [self getCurrentTimeString:self.endDate];
        NSString *output = [[starttime stringByAppendingString:@" - "] stringByAppendingString:endtime];
        NSLog(@"Printing saved event....");
        NSLog(@"%@",output);
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
}
-(void) startButtonPress

{   self.startDate = [NSDate date];
    self.startLabel.text = [self getCurrentTimeString:_startDate];
}

-(void) endButtonPress
{
    self.endDate = [NSDate date];
    
    self.endLabel.text = [self getCurrentTimeString: _endDate];
}
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EventLog" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}
@end
