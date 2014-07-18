//
//  PKTUser.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 30/06/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTUser.h"
#import "PKTUsersAPI.h"
#import "PKTClient.h"

@implementation PKTUser

#pragma mark - PKTModel

+ (NSDictionary *)dictionaryKeyPathsForPropertyNames {
  return @{
           @"userID" : @"user_id",
           };
}

#pragma mark - Public

+ (PKTRequestTaskHandle *)fetchCurrentWithCompletion:(void (^)(PKTUser *user, NSError *error))completion {
  NSParameterAssert(completion);
  
  PKTRequest *request = [PKTUsersAPI requestForUserStatus];
  
  Class klass = [self class];
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:^(PKTResponse *response, NSError *error) {
    PKTUser *user = nil;
    
    if (!error) {
      NSDictionary *userDict = [response.body objectForKey:@"user"];
      if (userDict) {
        user = [[klass alloc]  initWithDictionary:userDict];
      }
    }
    
    completion(user, error);
  }];

  return handle;
}

@end
