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
     self.results = [[NSMutableArray alloc]init];
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Macy";
    request.region = _mapView.region;
    
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse
                                         *response, NSError *error) {
       
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
//
            for (MKMapItem *item in response.mapItems)
            {
                NSLog(@"placemark = %@", item.placemark);
                [self.results addObject:(NSString *)item.placemark];
                
                NSLog(@"name = %@", item.name);
                NSLog(@"Phone = %@", item.phoneNumber);
            }
        NSLog(@"%lul",(unsigned long)self.results.count);
    }];
    NSLog(@"TEST");
    NSLog(@"%lul",(unsigned long)self.results.count);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)search:(id)sender {
   
    ResultViewController *testController = [[ResultViewController alloc] init];
    
    [self.navigationController pushViewController:testController animated:YES];
    
    testController.results = self.results;
    NSLog(@"%lul",(unsigned long)testController.results.count);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Back"
                                   /// remember to change the target & action parameter to "nil"
                                   style:UIBarButtonItemStyleDone
                                   target:nil
                                   action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
}
@end
