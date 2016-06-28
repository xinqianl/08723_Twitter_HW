#import "SecondViewController.h"
#import "EventDetailViewController.h"

@interface SecondViewController ()

@property NSMutableArray *objects;
@end

@implementation SecondViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    self.myArr=[[NSMutableArray alloc]init];
    
    [self readTweet];
    NSLog(@"%@",self.myArr);
   
}

- (void)didReceiveMemoryWarning {
    [self readTweet];
    [super didReceiveMemoryWarning];
   }

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
   
    return self.myArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text =[self.myArr objectAtIndex:indexPath.row];
    
    return cell;
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSLog(@"showDetail");
        self.detailViewController = [segue destinationViewController];
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // self.detailViewController.detailItem =  [NSMutableDictionary dictionaryWithObject:_eventDate[indexPath.row] forKey:_eventName[indexPath.row]];
    self.detailViewController.tweet = self.myArr[indexPath.row];
//    self.detailViewController.eventDate = _eventDate[indexPath.row];
    
    
    //[self.navigationController pushViewController:self.detailViewController animated:YES];
    
    
}
- (void)readTweet {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
       
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }

    //    [_posting startAnimating];
    NSArray *tweets = [[NSArray alloc]init];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(160, 140);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    // Create an account store
    ACAccountStore *twitter = [[ACAccountStore alloc] init];
    
    // Create an account type
    ACAccountType *twAccountType = [twitter accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    // Request Access to the twitter account
    [twitter requestAccessToAccountsWithType:twAccountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             // Create an Account
             ACAccount *twAccount = [[ACAccount alloc] initWithAccountType:twAccountType];
             NSArray *accounts = [twitter accountsWithAccountType:twAccountType];
             twAccount = [accounts lastObject];
             
             
             
             // Version 1.1 of the Twitter API only supports JSON responses.
             // Create an NSURL instance variable that points to the home_timeline end point.
             NSURL *twitterURL = [[NSURL alloc] initWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
             
             
             // Version 1.0 of the Twiter API supports XML responses.
             // Use this URL if you want to see an XML response.
             //NSURL *twitterURL2 = [[NSURL alloc] initWithString:@"http://api.twitter.com/1/statuses/home_timeline.xml"];
             
             
             // Create a request
             SLRequest *requestUsersTweets = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                                requestMethod:SLRequestMethodGET
                                                                          URL:twitterURL
                                                                   parameters:nil];
             
             // Set the account to be used with the request
             [requestUsersTweets setAccount:twAccount];
             
             // Perform the request
             [requestUsersTweets performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error2)
              {
                  // The output of the request is placed in the log.
                  NSLog(@"HTTP Response: %i", [urlResponse statusCode]);
                  // The output of the request is placed in the log.
                  NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                  
                 
                  NSArray *timeline = (NSArray*)jsonResponse;
                  for (int i=0; i<[timeline count]; i++) {
                      NSString *text = [[timeline objectAtIndex:i] valueForKey:(@"text")];
                      if([text containsString:@"@MobileApp4"]){
                          [self.myArr addObject: text];
                      }
                  }
                  
                  NSLog(@"%@",self.myArr);
                  dispatch_async(dispatch_get_main_queue(), ^{
                      [self.tableView reloadData];
                  });
                  
                  
              }
              ];
             NSLog(@"%@",self.myArr);
             // Tidy Up
             twAccount = nil;
             accounts = nil;
             twitterURL = nil;
             requestUsersTweets = nil;
         }
         
         // If permission is not granted to use the Twitter account...
         
         else
             
         {
             NSLog(@"Permission Not Granted");
             NSLog(@"Error: %@", error);
         }
     }];
    
    // Tidy up
    //    [_posting stopAnimating];
    [spinner stopAnimating];
    twAccountType = nil;
    
    
}


@end

