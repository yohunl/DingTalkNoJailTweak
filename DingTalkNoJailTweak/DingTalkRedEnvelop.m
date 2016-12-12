//
//  DingTalkRedEnvelop.m
//  TestTweak
//
//  Created by lingyohunl on 2016/12/8.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "DingTalkRedEnvelop.h"
#import "DingTalkHead.h"
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
*/
@implementation DingTalkRedEnvelop
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
    if (contentType.integerValue == 902 || contentType.integerValue == 901) {//红包
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
