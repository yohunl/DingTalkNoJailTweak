//
//  DingTalkRedEnvelop.m
//  TestTweak
//
//  Created by lingyohunl on 2016/12/8.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "DingTalkRedEnvelop.h"
#import "DingTalkHead.h"
#import "YLAssitManager.h"
/*
 {
 "contentType" : 901,
 "@Type" : "WKIDLContentModel",
 "attachments" : [
 {
 "@Type" : "WKIDLAttachmentModel",
 "size" : 0,
 "type" : 0,
 "extension" : {
 "amount" : "0.01",
 "clusterid" : "5PnPxu8C",
 "sname" : "林晓然",
 "size" : "1",
 "congrats" : "恭喜发财，大吉大利！",
 "sid" : "45049990",
 "type" : "0",
 "oid" : "0"
 },
 "isPreload" : false
 }
 ]
 }
 
 "contentType" : 905,
 "@Type" : "WKIDLContentModel",
 "attachments" : [
 {
 "isPreload" : false,
 "@Type" : "WKIDLAttachmentModel",
 "size" : 0,
 "type" : 905,
 "extension" : {
 "amount" : "0.88",
 "clusterid" : "8Wgs7WF9",
 "p_name" : "圣诞红包",
 "p_mediaId" : "@lA_OlIjCfc47tmQkzgQzyLg",
 "bg_mediaId" : "@lALOlGDyZ80B780Bdw",
 "type" : "0",
 "size" : "3",
 "theme_id" : "1",
 "oid" : "0",
 "sid" : "45049990",
 "congrats" : "圣诞快乐，预祝元旦快乐，顺便拜个早年",
 "receivers" : "null"
 },
 "url" : "url"
 }
 ]
	}
 
*/
@interface DingTalkRedEnvelop ()

@end
@implementation DingTalkRedEnvelop
+ (instancetype)sharedInstance
{
    static DingTalkRedEnvelop *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

//红包有很多类型,我们需要判断这种类型我们可以不可以抢,目前已知有 901,902,905 是节日红包
+ (BOOL)canDisposeRedenvelopType:(NSInteger) type {
    __block BOOL canDisposeFlag = NO;
    NSMutableArray<NSNumber *> * redEnvelopTypeArr = [YLAssitManager sharedManager].redEnvelopTypeArr;
    [redEnvelopTypeArr enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (type == obj.integerValue) {
            canDisposeFlag = YES;
            *stop = YES;
        }
    }];
    return canDisposeFlag;
}
+ (NSMutableArray *)disposeConversation:(WKBizConversation *)converdation {
    
  NSLog(@"disposeConversation_sation = %@", converdation);
    //WKBizConversation *converdation = sation;
  NSMutableArray *retArr = [NSMutableArray new];
  NSLog(@"disposeConversation_converdation.latestMessage = %@", converdation.latestMessage);
  NSString *attachmentsJson = converdation.latestMessage.attachmentsJson;
  NSLog(@"disposeConversation_attachmentsJson = %@", attachmentsJson);
  if (attachmentsJson.length > 0) {
    NSData* jsonData = [attachmentsJson dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"disposeConversation_dict = %@", dict);
    NSNumber *contentType = dict[@"contentType"];
    NSLog(@"disposeConversation_contentType = %@", contentType);
    if ([self canDisposeRedenvelopType:contentType.integerValue] ) {//红包
      NSMutableDictionary *retDict = [NSMutableDictionary new];
      retDict[@"contentType"] = contentType;
      NSArray *arr = dict[@"attachments"];
      NSLog(@"disposeConversation_arr = %@", arr);
      if (arr.count > 0) {
        [arr enumerateObjectsUsingBlock:^(NSDictionary *attachmentDict, NSUInteger idx, BOOL * _Nonnull stop) {
          NSDictionary *extension = attachmentDict[@"extension"];
          NSLog(@"disposeConversation_extension = %@", extension);
          retDict[@"clusterid"] = extension[@"clusterid"];
          retDict[@"sid"] = extension[@"sid"];
          retDict[@"isMine"] = @([converdation.latestMessage isMine]);
          retDict[@"congrats"] = extension[@"congrats"];
          retDict[@"sname"] = extension[@"sname"];
          
          NSLog(@"disposeConversation_retDict = %@", retDict);
          [retArr addObject:retDict];
        }];
      }
      
    }
  }
  return retArr;  
}

//+ (void)controller:(id)arg1 didChangeObject:(id)arg2 atIndex:(unsigned long long)arg3 forChangeType:(long long)arg4 newIndex:(unsigned long long)arg5
//{ 
//    //%log; %orig; 
//    //在这里处理
//  NSMutableArray *attachArr = [self disposeConversation:arg2];
//  [attachArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//    DTRedEnvelopServiceIMP *imp = [DTRedEnvelopServiceFactory defaultServiceIMP];
//    long long sid = [obj[@"sid"] longLongValue];
//    NSString *cluseId = obj[@"clusterid"];
//    [imp pickRedEnvelopCluster:sid clusterId:cluseId successBlock:nil failureBlock:nil];
//  }];
//}
@end
