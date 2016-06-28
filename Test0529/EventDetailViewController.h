//
//  DetailViewController.h
//  Test0529
//
//  Created by Sophie Jeong on 5/31/16.
//  Copyright (c) 2016 CarnegieMellonUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController

//@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) NSString *tweet;


@end

