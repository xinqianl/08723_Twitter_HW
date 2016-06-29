//
//  ResultViewController.m
//  xinqianl_iOS
//
//  Created by Xinqian Li on 6/27/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.results = [[NSMutableArray alloc]init];
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = self.input;
    NSLog(@"%@", self.input);
    request.region = _mapView.region;
    
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse
                                         *response, NSError *error) {
        
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            
            for (MKMapItem *item in response.mapItems)
            {
                [self.results addObject:item.placemark];
                
            }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    
    return self.results.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text =[NSString stringWithFormat:@"%@%@", [self.results objectAtIndex:indexPath.row], @""];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    ThirdViewController *thirdViewController = [storyboard instantiateViewControllerWithIdentifier:@"setting"];
    
    thirdViewController.result = self.results[indexPath.row];
    [self.navigationController pushViewController:thirdViewController animated:YES];
    
    
}
@end
