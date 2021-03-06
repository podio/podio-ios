//
//  PKTConversationEvent.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 13/11/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTModel.h"

typedef NS_ENUM(NSUInteger, PKTConversationEventAction) {
  PKTConversationEventActionUnknown = 0,
  PKTConversationEventActionMessage,
  PKTConversationEventActionParticipantAdd,
  PKTConversationEventActionParticipantLeave,
  PKTConversationEventActionSubjectChange
};

@class PKTAsyncTask, PKTByLine;

@interface PKTConversationEvent : PKTModel

@property (nonatomic, readonly) NSUInteger eventID;
@property (nonatomic, readonly) NSUInteger conversationID;
@property (nonatomic, strong, readonly) PKTByLine *createdBy;
@property (nonatomic, copy, readonly) NSDate *createdOn;
@property (nonatomic, readonly) PKTConversationEventAction action;
@property (nonatomic, strong, readonly) id data;

+ (PKTAsyncTask *)fetchEventWithID:(NSUInteger)eventID;
+ (PKTAsyncTask *)fetchAllInConversationWithID:(NSUInteger)conversationID offset:(NSUInteger)offset limit:(NSUInteger)limit;

@end
