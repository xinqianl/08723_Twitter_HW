//
//  TabBarControllerDelegate.m
//  Test0529
//
//  Created by Xinqian Li on 6/8/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "TabBarControllerDelegate.h"


@implementation TabBarControllerDelegate
-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if(tabBarController.selectedIndex == 1){
        // Find out the path of eventlist
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EventList" ofType:@"plist"];
        
        // Load the file content and read the data into arrays
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        NSDictionary *myDict = [[NSDictionary alloc] init];
        myDict = [NSDictionary dictionaryWithObjects:[dict objectForKey:@"eventName"] forKeys:[dict objectForKey:@"eventDate"]];
//        NSLog(@"Pringting event list with event date and event name pair....");
//        NSLog(@"%@", myDict);

        
    }
}

@end
