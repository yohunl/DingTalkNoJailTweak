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
@property (nonatomic,strong) NSString *regularText;///< 内容的正则表达式
@property (nonatomic,strong) NSString *nameregularText;///< 名字正则表达式


@property (nonatomic,assign) BOOL enableCoordinate;///< 是否开启经纬度
@property (nonatomic,assign)double latitude;//经度
@property (nonatomic,assign)double longitude;//纬度


@property (nonatomic,assign) BOOL useOriginalCordinate;//在我们进行坐标选择的时候,需要使用原始的

@property (nonatomic,strong) NSString *redenvelopTypeText;//红包的类型,目前支持的是 901,902,905

@end
