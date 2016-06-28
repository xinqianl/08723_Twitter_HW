//
//  DetailViewController.m
//  Test0529
//
//  Created by Sophie Jeong on 5/31/16.
//  Copyright (c) 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailDescriptionLabel.numberOfLines = 0;
    self.detailDescriptionLabel.text = self.tweet;
//    self.title = self.eventName;
    //[self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
