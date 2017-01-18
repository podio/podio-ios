//
//  PKTCalendarAPI.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 08/05/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTCalendarAPI.h"
#import "NSDate+PKTAdditions.h"

@implementation PKTCalendarAPI

+ (PKTRequest *)requestForGlobalCalendarWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority {
  
  NSMutableDictionary *parameters = [NSMutableDictionary new];
  
  if (fromDate) {
    parameters[@"date_from"] = [fromDate pkt_UTCDateString];
  }
  
  if (toDate) {
    parameters[@"date_to"] = [toDate pkt_UTCDateString];
  }
  
  if (priority > 0) {
    parameters[@"priority"] = @(priority);
  }
  
  return [PKTRequest  GETRequestWithPath:@"/calendar/" parameters:parameters];
}

+ (PKTRequest *)requestForGlobalCalendarWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority includeTasks:(BOOL)tasksIncluded {
  
  NSMutableDictionary *parameters = [NSMutableDictionary new];
  
  if (fromDate) {
    parameters[@"date_from"] = [fromDate pkt_UTCDateString];
  }
  
  if (toDate) {
    parameters[@"date_to"] = [toDate pkt_UTCDateString];
  }
  
  if (priority > 0) {
    parameters[@"priority"] = @(priority);
  }
  
  if (!tasksIncluded) {
    parameters[@"tasks"] = @(NO);
  }
  
  return [PKTRequest  GETRequestWithPath:@"/calendar/" parameters:parameters];
}

+ (PKTRequest *)requestForAppCalendarWithAppId:(NSUInteger)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority {
  
  NSMutableDictionary *parameters = [NSMutableDictionary new];
  
  if (fromDate) {
    parameters[@"date_from"] = [fromDate pkt_UTCDateString];
  }
  
  if (toDate) {
    parameters[@"date_to"] = [toDate pkt_UTCDateString];
  }
  
  if (priority > 0) {
    parameters[@"priority"] = @(priority);
  }
  
  NSString *requestPath = [NSString stringWithFormat:@"/calendar/app/%u", appId];
  
  return [PKTRequest  GETRequestWithPath:requestPath parameters:parameters];
}

+ (PKTRequest *)requestForAppCalendarWithAppId:(NSUInteger)appId fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate priority:(NSUInteger)priority includeTasks:(BOOL)tasksIncluded {
  NSMutableDictionary *parameters = [NSMutableDictionary new];
  
  if (fromDate) {
    parameters[@"date_from"] = [fromDate pkt_UTCDateString];
  }
  
  if (toDate) {
    parameters[@"date_to"] = [toDate pkt_UTCDateString];
  }
  
  if (priority > 0) {
    parameters[@"priority"] = @(priority);
  }
  
  if (!tasksIncluded) {
    parameters[@"tasks"] = @(NO);
  }
  
  NSString *requestPath = [NSString stringWithFormat:@"/calendar/app/%u", appId];
  
  return [PKTRequest  GETRequestWithPath:requestPath parameters:parameters];
}

@end
