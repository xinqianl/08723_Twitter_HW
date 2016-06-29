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
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EventList" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
        NSDictionary *myDict = [[NSDictionary alloc] init];
        myDict = [NSDictionary dictionaryWithObjects:[dict objectForKey:@"eventName"] forKeys:[dict objectForKey:@"eventDate"]];


        
    }
}

@end
