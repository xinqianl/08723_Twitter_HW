//
//  Event.h
//  Test0529
//
//  Created by Sophie Jeong on 6/1/15.
//  Copyright (c) 2015 CarnegieMellonUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * start;
@property (nonatomic, retain) NSDate * stop;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSData * video;

@end
