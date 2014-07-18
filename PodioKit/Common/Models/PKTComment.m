//
//  PKTComment.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 22/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTComment.h"
#import "PKTEmbed.h"
#import "PKTFile.h"
#import "PKTCommentsAPI.h"
#import "NSValueTransformer+PKTTransformers.h"

@implementation PKTComment

#pragma mark - PKTModel

+ (NSDictionary *)dictionaryKeyPathsForPropertyNames {
  return @{
    @"commentID": @"comment_id",
    @"referenceType": @"ref.type",
    @"referenceID": @"ref.id",
    @"value": @"value",
    @"richValue": @"rich_value",
    @"createdOn": @"created_on",
    @"embed": @"embed",
    @"embedFile": @"embed_file",
    @"files": @"files"
  };
}

+ (NSValueTransformer *)referenceTypeValueTransformer {
  return [NSValueTransformer pkt_referenceTypeTransformer];
}

+ (NSValueTransformer *)createdOnValueTransformer {
  return [NSValueTransformer pkt_dateValueTransformer];
}

+ (NSValueTransformer *)embedValueTransformer {
  return [NSValueTransformer pkt_transformerWithModelClass:[PKTEmbed class]];
}

+ (NSValueTransformer *)embedFileValueTransformer {
  return [NSValueTransformer pkt_transformerWithModelClass:[PKTFile class]];
}

+ (NSValueTransformer *)filesValueTransformer {
  return [NSValueTransformer pkt_transformerWithModelClass:[PKTFile class]];
}

#pragma mark - API

+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType completion:(void (^)(PKTComment *comment, NSError *error))completion {
  return [self addCommentForObjectWithText:text referenceID:referenceID referenceType:referenceType files:nil completion:completion];
}

+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files completion:(void (^)(PKTComment *comment, NSError *error))completion {
  return [self addCommentForObjectWithText:text referenceID:referenceID referenceType:referenceType files:files embedID:0 completion:completion];
}

+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files embedID:(NSUInteger)embedID completion:(void (^)(PKTComment *comment, NSError *error))completion {
  return [self addCommentForObjectWithText:text referenceID:referenceID referenceType:referenceType files:files embedID:embedID embedURL:nil completion:completion];
}

+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files embedURL:(NSURL *)embedURL completion:(void (^)(PKTComment *comment, NSError *error))completion {
  return [self addCommentForObjectWithText:text referenceID:referenceID referenceType:referenceType files:files embedID:0 embedURL:embedURL completion:completion];
}

+ (PKTRequestTaskHandle *)addCommentForObjectWithText:(NSString *)text referenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType files:(NSArray *)files embedID:(NSUInteger)embedID embedURL:(NSURL *)embedURL completion:(void (^)(PKTComment *comment, NSError *error))completion {
  NSArray *fileIDs = [files valueForKey:@"fileID"];
  
  Class objectClass = [self class];
  PKTRequest *request = [PKTCommentsAPI requestToAddCommentToObjectWithReferenceID:referenceID
                                                                    referenceType:referenceType
                                                                            value:text
                                                                            files:fileIDs
                                                                          embedID:embedID
                                                                         embedURL:embedURL];
  PKTRequestTaskHandle *handle = [[PKTClient currentClient] performRequest:request completion:^(PKTResponse *response, NSError *error) {
    PKTComment *comment = nil;
    
    if (!error) {
      comment = [[objectClass alloc] initWithDictionary:response.body];
    }
    
    if (comment) completion(comment, error);
  }];

  return handle;
}

@end
