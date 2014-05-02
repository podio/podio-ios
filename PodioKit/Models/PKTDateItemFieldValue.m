//
//  PKTDateItemFieldValue.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 28/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTDateItemFieldValue.h"
#import "NSDateFormatter+PKTAdditions.h"

static NSString * const kStartDateKey = @"start";
static NSString * const kEndDateKey = @"end";

static NSDateFormatter *sFormatter = nil;

@implementation PKTDateItemFieldValue

+ (void)initialize {
  if (self == [PKTDateItemFieldValue class]) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sFormatter = [NSDateFormatter pkt_UTCDateFormatter];
    });
  }
}

- (instancetype)initFromValueDictionary:(NSDictionary *)valueDictionary {
  self = [super init];
  if (!self) return nil;
  
  self.startDate = [[self class] dateFromString:valueDictionary[kStartDateKey]];
  self.endDate = [[self class] dateFromString:valueDictionary[kEndDateKey]];
  
  return self;
}

- (NSDictionary *)valueDictionary {
  return @{kStartDateKey : [[self class] stringFromDate:self.startDate],
           kEndDateKey : [[self class] stringFromDate:self.endDate]};
}

- (void)setUnboxedValue:(id)unboxedValue {
  self.startDate = unboxedValue[kStartDateKey];
  self.endDate =unboxedValue[kEndDateKey];
}

- (id)unboxedValue {
  return @{kStartDateKey : self.startDate,
           kEndDateKey : self.endDate};
}

+ (BOOL)supportsBoxingOfValue:(id)value {
  return [value isKindOfClass:[NSDictionary class]] &&
  [value[kStartDateKey] isKindOfClass:[NSDate class]] &&
  [value[kEndDateKey] isKindOfClass:[NSDate class]];
}

#pragma mark - Private

+ (NSDate *)dateFromString:(NSString *)dateString {
  return [sFormatter dateFromString:dateString];
}

+ (NSString *)stringFromDate:(NSDate *)date {
  return [sFormatter stringFromDate:date];
}

@end
