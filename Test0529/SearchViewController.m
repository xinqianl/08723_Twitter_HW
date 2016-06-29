//
//  SearchViewController.m
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Search"
                                  style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(search:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)search:(id)sender {
    ResultViewController *testController = [[ResultViewController alloc] init];
    [self.navigationController pushViewController:testController animated:YES];
    testController.results = self.results;
    testController.input = self.input.text;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Back"
                                   style:UIBarButtonItemStyleDone
                                   target:nil
                                   action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
}
@end
