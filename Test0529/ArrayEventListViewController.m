//
//  EventListTableViewController.m
//  Test0529
//
//  Created by Sophie Jeong on 5/30/16.
//  Copyright © 2016 CarnegieMellonUniversity. All rights reserved.
//

#import "ArrayEventListViewController.h"

@interface ArrayEventListViewController ()

@end

@implementation ArrayEventListViewController
{
    NSArray *eventLists;
    //cf.NSMutableArray - read/write
    NSArray *eventDate;
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"PVGP Event Lists" ;
    // Initialize table data
    eventLists = [NSArray arrayWithObjects:@"Kick-off Rallye", @"Black Tie Gala at Longue Vue Club Verona", @"PVGP Historic Races at Pitt Race Complex", @"Walnut Street Car Show", @"Car Cruise at Waterfront in Homestead", @"Downtown Parade and Car Display", @"Grand Prix Tune-Up Party", @"Countryside Tour to Coventry Inn, Indiana PA", @"Schenley Park International Car Show", @"Schenley Park Vintage Car Racing Day", nil];
    eventDate = [NSArray arrayWithObjects:@"July 5 11am to 12pm", @"July 10 7pm to 11pm", @"July 11-12 to 2014 July 13", @"July 13 5pm to 9pm", @"July 14 5pm to 10pm", @"July 15 11am to 2pm", @"July 15 6pm to 9pm", @"July 16 9am to 3pm", @"July 18 9:30am to 5pm", @"July 19 9:30am to 5pm", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //return 10;
      return [eventLists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //In Storyboard, Cell should be identified as "EventCell"
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [eventLists objectAtIndex:indexPath.row];

    cell.detailTextLabel.text = [eventDate objectAtIndex:indexPath.row];
    NSLog(cell.textLabel.text);
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
