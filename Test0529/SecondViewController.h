//
//  MasterViewController.h
//  Test0529
//
//  Created by Sophie Jeong on 5/31/16.
//  Copyright (c) 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <TwitterKit/TwitterKit.h>

@class EventDetailViewController;

@interface SecondViewController : UITableViewController

@property (strong, nonatomic) EventDetailViewController *detailViewController;

//@property (strong, nonatomic) NSArray *eventName;
//@property (strong, nonatomic) NSArray *eventDate;
//@property (strong, nonatomic) NSDictionary *myDict;
@property (strong, nonatomic) NSMutableArray *myArr;

@end

