//
//  DingTalkConfig.h
//  DingTalkNoJailTweak
//
//  Created by lingyohunl on 2016/12/16.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DingTalkConfig : NSObject<NSCoding>
@property (nonatomic,assign) BOOL enableRedEnvolop;///< 是否开启红包
@property (nonatomic,assign) CGFloat delayTime;///<延迟多少秒抢
@property (nonatomic,assign) BOOL pickOwnerRedEnvelop; ///< 是否抢自己发出去的红包
@property (nonatomic,strong) NSString *regularText;///< 其他情况的正则表达式

@end
