//
//  EventDetailViewController.h
//  Test0529
//
//  Created by Sophie Jeong on 06/01/15.
//  Copyright (c) 2015 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogDetailViewController : UIViewController
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
