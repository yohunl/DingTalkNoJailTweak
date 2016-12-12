//
//  YLAssitManager.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/18.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLAssitManager.h"
#import "YLWindow.h"
#import "YLExplorerViewController.h"

__attribute((constructor)) void injected_function(){
    NSLog(@"注入代码成功");
    
    [[NSNotificationCenter defaultCenter] addObserver:[YLAssitManager sharedManager]
                                             selector:@selector(showExplorer)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}




@interface YLAssitManager ()<YLWindowEventDelegate>
@property (nonatomic, strong) YLWindow *explorerWindow;
@property (nonatomic, strong) YLExplorerViewController *explorerViewController;

@end



@implementation YLAssitManager
+ (instancetype)sharedManager
{
    static YLAssitManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[[self class] alloc] init];
    });
    return sharedManager;
}

- (YLWindow *)explorerWindow
{
    NSAssert([NSThread isMainThread], @"You must use %@ from the main thread only.", NSStringFromClass([self class]));
    
    if (!_explorerWindow) {
        _explorerWindow = [[YLWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _explorerWindow.eventDelegate = self;
        _explorerWindow.rootViewController = self.explorerViewController;
    }
    
    return _explorerWindow;
}

- (YLExplorerViewController *)explorerViewController
{
    if (!_explorerViewController) {
        _explorerViewController = [[YLExplorerViewController alloc] init];
        //_explorerViewController.delegate = self;
    }
    
    return _explorerViewController;
}


- (void)showExplorer
{
    self.explorerWindow.hidden = NO;
}

- (void)hideExplorer
{
    self.explorerWindow.hidden = YES;
}

- (void)toggleExplorer {
    if (self.explorerWindow.isHidden) {
        [self showExplorer];
    } else {
        [self hideExplorer];
    }
}


#pragma mark - YLWindowEventDelegate

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow
{
    // Ask the explorer view controller
    return [self.explorerViewController shouldReceiveTouchAtWindowPoint:pointInWindow];
}

- (BOOL)canBecomeKeyWindow
{
    // Only when the explorer view controller wants it because it needs to accept key input & affect the status bar.
    return [self.explorerViewController wantsWindowToBecomeKey];
}
@end
