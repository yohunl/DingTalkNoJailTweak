//
//  YLExplorerViewController.h
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/18.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLExplorerToolBar.h"

@interface YLExplorerViewController : UIViewController
/// Tracked so we can restore the key window after dismissing a modal.
/// We need to become key after modal presentation so we can correctly capture intput.
/// If we're just showing the toolbar, we want the main app's window to remain key so that we don't interfere with input, status bar, etc.
@property (nonatomic, strong) UIWindow *previousKeyWindow;


@property (nonatomic, strong) YLExplorerToolBar *explorerToolbar;

@property (nonatomic, strong) UIPanGestureRecognizer *movePanGR;
@property (nonatomic, assign) CGRect selectedViewFrameBeforeDragging;


- (BOOL)shouldReceiveTouchAtWindowPoint:(CGPoint)pointInWindowCoordinates;
- (BOOL)wantsWindowToBecomeKey;
@end
