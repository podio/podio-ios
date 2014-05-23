//
//  PKTFile.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 27/04/14.
//  Copyright (c) 2014 Citrix Systems, Inc. All rights reserved.
//

#import "PKTFile.h"
#import "PKTFileAPI.h"
#import "NSValueTransformer+PKTTransformers.h"

@implementation PKTFile

#pragma mark - PKTModel

+ (NSDictionary *)dictionaryKeyPathsForPropertyNames {
  return @{
           @"fileID" : @"file_id",
           @"mimeType" : @"mimetype",
           @"hostedBy" : @"hosted_by",
           @"link" : @"link",
           @"thumbnailLink" : @"thumbnail_link",
           @"createdOn" : @"created_on"
           };
}

+ (NSValueTransformer *)linkValueTransformer {
  return [NSValueTransformer pkt_URLTransformer];
}

+ (NSValueTransformer *)thumbnailLinkValueTransformer {
  return [NSValueTransformer pkt_URLTransformer];
}

+ (NSValueTransformer *)createdOnValueTransformer {
  return [NSValueTransformer pkt_dateValueTransformer];
}

#pragma mrk - API

+ (void)uploadWithData:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType completion:(void (^)(PKTFile *file, NSError *error))completion {
  PKTRequest *request = [PKTFileAPI requestToUploadFileWithData:data fileName:fileName mimeType:mimeType];
  
  [[self client] performRequest:request completion:^(PKTResponse *response, NSError *error) {
    PKTFile *file = nil;
    
    if (!error) {
      file = [[PKTFile alloc] initWithDictionary:response.body];
    }
    
    if (completion) completion(file, error);
  }];
}

- (void)attachWithReferenceID:(NSUInteger)referenceID referenceType:(PKTReferenceType)referenceType completion:(PKTRequestCompletionBlock)completion {
  PKTRequest *request = [PKTFileAPI requestToAttachFileWithID:self.fileID referenceID:referenceID referenceType:referenceType];
  
  [[[self class] client] performRequest:request completion:^(PKTResponse *response, NSError *error) {
    if (completion) completion(response, error);
  }];
}

@end