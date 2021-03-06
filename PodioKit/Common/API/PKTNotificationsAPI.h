//
//  PKTNotificationsAPI.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 08/09/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTBaseAPI.h"
#import "PKTNotificationsRequestParameters.h"

@interface PKTNotificationsAPI : PKTBaseAPI

+ (PKTRequest *)requestForNotificationsWithOffset:(NSUInteger)offset limit:(NSUInteger)limit;

+ (PKTRequest *)requestForNotificationsWithParameters:(PKTNotificationsRequestParameters *)parameters offset:(NSUInteger)offset limit:(NSUInteger)limit;

+ (PKTRequest *)requestToMarkAllkNotificationsAsViewed;

+ (PKTRequest *)requestToMarkNotificationsAsViewedWithReferenceID:(NSUInteger)referenceID type:(PKTReferenceType)referenceType;

+ (PKTRequest *)requestToMarkNotificationsAsUnviewedWithReferenceID:(NSUInteger)referenceID type:(PKTReferenceType)referenceType;

+ (PKTRequest *)requestToMarkNotificationAsViewedWithID:(NSUInteger)notificationID;

+ (PKTRequest *)requestToMarkNotificationAsUnviewedWithID:(NSUInteger)notificationID;

+ (PKTRequest *)requestToStarNotificationWithID:(NSUInteger)notificationID;

+ (PKTRequest *)requestToUnstarNotificationWithID:(NSUInteger)notificationID;

@end
