//
//  YLWindow.h
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/18.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YLWindowEventDelegate;
@interface YLWindow : UIWindow
@property (nonatomic, weak) id <YLWindowEventDelegate> eventDelegate;
@end

@protocol YLWindowEventDelegate <NSObject>

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow;
- (BOOL)canBecomeKeyWindow;

@end
