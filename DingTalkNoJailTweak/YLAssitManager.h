//
//  YLAssitManager.h
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/18.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLAssitManager : NSObject
+ (instancetype)sharedManager;
- (void)showExplorer;
- (void)hideExplorer;
@end
