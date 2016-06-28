//
//  FirstViewController.m
//  Test0528
//
//  Created by Sophie Jeong on 5/28/15.
//  Copyright (c) 2015 CarnegieMellonUniversity. All rights reserved.
//

#import "FirstViewController.h"
#import <sys/sysctl.h>
@interface FirstViewController ()

@end

@implementation FirstViewController
NSString *info;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Info" ;
    NSString *andrewIdLabel = @"ANDREW ID: ";
    NSString *andrewId = @"xinqianl ";
    
    NSString *localDate = [self getCurrentTimeString:([NSDate date])];
    NSString *timeZoneName = [[NSTimeZone systemTimeZone] abbreviation];
    NSString *curDate = [NSString stringWithFormat:@"%@%@%@", localDate, @" ", timeZoneName];
    NSString *dateLabel = @"CURRENT DATE: ";
    NSString *deviceLabel = @"DEVICE MODEL & VERSION: ";
    NSString *iOSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *device = [self platformNiceString];
    NSString *deviceAndVersion =[NSString stringWithFormat:@"%@%@%@", device, @" ", iOSVersion];
    
    
    UILabel *label1 = [[UILabel alloc]
                       initWithFrame:CGRectMake (10.0f, 100.0f, 250.0f, 100.0f)];
    label1.text = [NSString stringWithFormat:@"%@%@", andrewIdLabel, andrewId];
    label1.numberOfLines=0;
    [self.view addSubview: label1];
    
    UILabel *label2 = [[UILabel alloc]
                       initWithFrame:CGRectMake (10.0f, 200.0f, 500.0f, 100.0f)];
    label2.text = [NSString stringWithFormat:@"%@%@", dateLabel, curDate];
    label2.numberOfLines=0;
    [self.view addSubview: label2];
    
    UILabel *label3 = [[UILabel alloc]
                       initWithFrame:CGRectMake (10.0f, 300.0f, 500.0f, 100.0f)];
    label3.text = [NSString stringWithFormat:@"%@%@", deviceLabel, deviceAndVersion];
    label3.numberOfLines = 0;
    [self.view addSubview: label3];
    
    UIButton *tweetButton = [UIButton buttonWithType: UIButtonTypeCustom];
    
    tweetButton.frame = CGRectMake(100, 400, 150, 44);
    [tweetButton setBackgroundImage:[UIImage imageNamed:@"tweet.png"]
                           forState:UIControlStateNormal];
    [tweetButton addTarget:self
                    action:@selector (tweetButtonPress)
          forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview: tweetButton];
    
    
    
    
    
    info =[NSString stringWithFormat:@"%@%@%@\n%@%@\n%@%@",@"@MobileApp4 ",andrewIdLabel, andrewId, dateLabel, curDate, deviceLabel, deviceAndVersion];
    NSLog(@"%@%@\n%@%@\n%@%@",andrewIdLabel, andrewId, dateLabel, curDate, deviceLabel, deviceAndVersion);
}
-(void)tweetButtonPress{
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText: info];
        
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
        
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
    }
}

- (NSString *)platformRawString {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}
//refer to http://www.techrepublic.com/blog/software-engineer/better-code-determine-device-types-and-ios-versions/
- (NSString *)platformNiceString {
    NSString *platform = [self platformRawString];
    static NSDictionary* deviceNamesByCode = nil;
    deviceNamesByCode = @{@"i386"      :@"Simulator",
                          @"x86_64"    :@"Simulator",
                          @"iPod1,1"   :@"iPod Touch",        // (Original)
                          @"iPod2,1"   :@"iPod Touch",        // (Second Generation)
                          @"iPod3,1"   :@"iPod Touch",        // (Third Generation)
                          @"iPod4,1"   :@"iPod Touch",        // (Fourth Generation)
                          @"iPod7,1"   :@"iPod Touch",        // (6th Generation)
                          @"iPhone1,1" :@"iPhone",            // (Original)
                          @"iPhone1,2" :@"iPhone",            // (3G)
                          @"iPhone2,1" :@"iPhone",            // (3GS)
                          @"iPad1,1"   :@"iPad",              // (Original)
                          @"iPad2,1"   :@"iPad 2",            //
                          @"iPad3,1"   :@"iPad",              // (3rd Generation)
                          @"iPhone3,1" :@"iPhone 4",          // (GSM)
                          @"iPhone3,3" :@"iPhone 4",          // (CDMA/Verizon/Sprint)
                          @"iPhone4,1" :@"iPhone 4S",         //
                          @"iPhone5,1" :@"iPhone 5",          // (model A1428, AT&T/Canada)
                          @"iPhone5,2" :@"iPhone 5",          // (model A1429, everything else)
                          @"iPad3,4"   :@"iPad",              // (4th Generation)
                          @"iPad2,5"   :@"iPad Mini",         // (Original)
                          @"iPhone5,3" :@"iPhone 5c",         // (model A1456, A1532 | GSM)
                          @"iPhone5,4" :@"iPhone 5c",         // (model A1507, A1516, A1526 (China), A1529 | Global)
                          @"iPhone6,1" :@"iPhone 5s",         // (model A1433, A1533 | GSM)
                          @"iPhone6,2" :@"iPhone 5s",         // (model A1457, A1518, A1528 (China), A1530 | Global)
                          @"iPhone7,1" :@"iPhone 6 Plus",     //
                          @"iPhone7,2" :@"iPhone 6",          //
                          @"iPhone8,1" :@"iPhone 6S",         //
                          @"iPhone8,2" :@"iPhone 6S Plus",    //
                          @"iPhone8,4" :@"iPhone SE",         //
                          @"iPad4,1"   :@"iPad Air",          // 5th Generation iPad (iPad Air) - Wifi
                          @"iPad4,2"   :@"iPad Air",          // 5th Generation iPad (iPad Air) - Cellular
                          @"iPad4,4"   :@"iPad Mini",         // (2nd Generation iPad Mini - Wifi)
                          @"iPad4,5"   :@"iPad Mini",         // (2nd Generation iPad Mini - Cellular)
                          @"iPad4,7"   :@"iPad Mini",         // (3rd Generation iPad Mini - Wifi (model A1599))
                          @"iPad6,7"   :@"iPad Pro (12.9\")", // iPad Pro 12.9 inches - (model A1584)
                          @"iPad6,8"   :@"iPad Pro (12.9\")", // iPad Pro 12.9 inches - (model A1652)
                          @"iPad6,3"   :@"iPad Pro (9.7\")",  // iPad Pro 9.7 inches - (model A1673)
                          @"iPad6,4"   :@"iPad Pro (9.7\")"   // iPad Pro 9.7 inches - (models A1674 and A1675)
                          };
    return [deviceNamesByCode objectForKey:platform];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *) getCurrentTimeString: (NSDate *) nowDate{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [gregorian components:
                                        (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay|
                                         NSCalendarUnitHour  | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                                    fromDate:nowDate];
    
    NSInteger hour = [dateComponents hour];
    NSInteger minute = [dateComponents minute];
    NSInteger second = [dateComponents second];
    
    NSInteger year = [dateComponents year];
    NSInteger month = [dateComponents month];
    NSInteger day = [dateComponents day];
    
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld:%02ld",
            (long)year, (long) month, (long)day,(long)hour, (long)minute, (long)second];
    
    
}


@end
