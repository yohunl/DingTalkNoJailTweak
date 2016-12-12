//
//  YLUtility.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLUtility.h"

@implementation YLUtility
+ (UIFont *)defaultFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)defaultTableViewCellLabelFont
{
    return [self defaultFontOfSize:12.0];
}
@end
