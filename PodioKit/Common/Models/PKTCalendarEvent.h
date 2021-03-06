//
//  PKTCalendarEvent.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 08/05/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTModel.h"
#import "PKTConstants.h"

@class PKTApp, PKTAsyncTask;

@interface PKTCalendarEvent : PKTModel

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *descr;
@property (nonatomic, copy, readonly) NSString *source;
@property (nonatomic, copy, readonly) NSString *UID;
@property (nonatomic, copy, readonly) NSString *location;
@property (nonatomic, copy, readonly) NSDate *startDate;
@property (nonatomic, copy, readonly) NSDate *startTime;
@property (nonatomic, copy, readonly) NSDate *endDate;
@property (nonatomic, copy, readonly) NSDate *endTime;
@property (nonatomic, copy, readonly) NSURL *linkURL;
@property (nonatomic, copy, readonly) PKTApp *app;
@property (nonatomic, copy, readonly) NSString *colorString;
@property (nonatomic, copy, readonly) NSString *categoryText;
@property (nonatomic, assign, readonly) BOOL busy;
@property (nonatomic, assign, readonly) PKTReferenceType referenceType;
@property (nonatomic, assign, readonly) NSUInteger referenceID;
@property (nonatomic, assign, readonly) BOOL forged;


#pragma mark - API

+ (PKTAsyncTask *)fetchAllFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (PKTAsyncTask *)fetchAllFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority;
+ (PKTAsyncTask *)fetchEventsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (PKTAsyncTask *)fetchEventsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority;

+ (PKTAsyncTask *)fetchAllForSpace:(NSInteger)spaceId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (PKTAsyncTask *)fetchAllForSpace:(NSInteger)spaceId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority;
+ (PKTAsyncTask *)fetchEventsForSpace:(NSInteger)spaceId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
+ (PKTAsyncTask *)fetchEventsForSpace:(NSInteger)spaceId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority;

@end
