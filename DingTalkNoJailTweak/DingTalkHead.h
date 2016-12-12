//
//  DingTalkHead.h
//  TestTweak
//
//  Created by lingyohunl on 2016/12/8.
//  Copyright © 2016年 yohunl. All rights reserved.
//

  //#ifndef DingTalkHead_h
  //#define DingTalkHead_h
  //controller:<LWFetchedResultsController: 0x1482d9cc0> didChangeObject:<WKBizConversation: 0x1481abbd0> atIndex:0 forChangeType:4 newIndex:0]
#import <Foundation/Foundation.h>
@interface OpenModel : NSObject
@end



@interface WKBizMessage : OpenModel
@property(nonatomic) unsigned long long isDecrypt; // @synthesize isDecrypt=_isDecrypt;
@property(nonatomic) _Bool isDel; // @synthesize isDel=_isDel;
@property(nonatomic) _Bool hasGap; // @synthesize hasGap=_hasGap;
@property(nonatomic) long long recallStatus; // @synthesize recallStatus=_recallStatus;
@property(copy, nonatomic) NSString *atListJson; // @synthesize atListJson=_atListJson;
@property(copy, nonatomic) NSString *privateExtensionJson; // @synthesize privateExtensionJson=_privateExtensionJson;
@property(copy, nonatomic) NSString *extensionJson; // @synthesize extensionJson=_extensionJson;
@property(retain, nonatomic) NSString *attachmentsJson; // @synthesize attachmentsJson=_attachmentsJson;
@property(nonatomic) unsigned long long primaryKey; // @synthesize primaryKey=_primaryKey;
@property(nonatomic) long long privateTag; // @synthesize privateTag=_privateTag;
@property(nonatomic) long long tag; // @synthesize tag=_tag;
@property(nonatomic) _Bool isMine; // @synthesize isMine=_isMine;
@property(nonatomic) long long originalMessageId; // @synthesize originalMessageId=_originalMessageId;
@property(nonatomic) long long attachmentsType; // 类型,901,902是红包
@property(copy, nonatomic) NSString *content; // @synthesize content=_content;
@property(nonatomic) unsigned long long sendStatus; // @synthesize sendStatus=_sendStatus;
@property(nonatomic) long long senderTag; // @synthesize senderTag=_senderTag;
@property(nonatomic) long long senderId; // @synthesize senderId=_senderId;
@property(nonatomic) _Bool isView; // @synthesize isView=_isView;
@property(nonatomic) _Bool isRead; // @synthesize isRead=_isRead;
@property(nonatomic) long long receiverCount; // @synthesize receiverCount=_receiverCount;
@property(nonatomic) long long unreadCount; // @synthesize unreadCount=_unreadCount;
@property(nonatomic) long long localSentTime; // @synthesize localSentTime=_localSentTime;
@property(nonatomic) long long createdAt; // @synthesize createdAt=_createdAt;
@property(nonatomic) long long creatorType; // @synthesize creatorType=_creatorType;
@property(nonatomic) long long messageType; // @synthesize messageType=_messageType;
@property(copy, nonatomic) NSString *conversationId; // @synthesize conversationId=_conversationId;
@property(nonatomic) long long messageId; // @synthesize messageId=_messageId;
@property(copy, nonatomic) NSString *localMid; // @synthesize localMid=_localMid;
@property(nonatomic) int priority; // @synthesize priority=_priority;
@end



@interface WKBizConversation : OpenModel
@property(retain, nonatomic) NSString *latestMessageJson;//最新一条消息的json字符串
@property(retain, nonatomic) WKBizMessage *latestMessage;//最新一条消息
@end



@interface DTRedEnvelopServiceFactory : NSObject
{
}

+ (id)createServiceIMPWithPersistence:(id)arg1 network:(id)arg2;
+ (id)defaultServiceIMP;

@end

@interface DTRedEnvelopServiceIMP : NSObject

- (void)pickRedEnvelopCluster:(long long)sid clusterId:(NSString *)arg2 successBlock:(id)arg3 failureBlock:(id)arg4;


@end


@interface DTConversationListDataSource : NSObject
- (void)controller:(id)arg1 didChangeObject:(id)arg2 atIndex:(unsigned long long)arg3 forChangeType:(long long)arg4 newIndex:(unsigned long long)arg5;
@end

  //#endif /* DingTalkHead_h */
