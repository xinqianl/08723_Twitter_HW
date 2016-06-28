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
    NSLog(@"aaa");
    NSLog(@"%@", self.results.firstObject);
    self.thirdViewController = [[ThirdViewController alloc]init];
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
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"%@",[segue identifier]);
//    if ([[segue identifier] isEqualToString:@"show"]) {
//        
//        NSLog(@"show");
//        self.thirdViewController = [segue destinationViewController];
//        
//    }
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // self.detailViewController.detailItem =  [NSMutableDictionary dictionaryWithObject:_eventDate[indexPath.row] forKey:_eventName[indexPath.row]];
    self.thirdViewController.myAddress.text = @"Macy";
    self.thirdViewController.mapView = [[MKMapView alloc]init];
    //    self.detailViewController.eventDate = _eventDate[indexPath.row];
    
    
    [self.navigationController pushViewController:self.thirdViewController animated:YES];
    
    
}
@end
