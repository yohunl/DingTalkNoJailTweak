//
//  YLExplorerViewController.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/18.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLExplorerViewController.h"
#import "YLAssitManager.h"
#import "YLGlobalViewController.h"
@interface YLExplorerViewController ()<YLGlobalViewControllerDelegate>

@end

@implementation YLExplorerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Toolbar
    self.explorerToolbar = [[YLExplorerToolBar alloc] init];
    CGSize toolbarSize = CGSizeMake(110, 50);
    // Start the toolbar off below any bars that may be at the top of the view.
    CGFloat toolbarOriginY = 100.0;
    self.explorerToolbar.frame = CGRectMake(0.0, toolbarOriginY, toolbarSize.width, toolbarSize.height);
    self.explorerToolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:self.explorerToolbar];
    
    
    [_explorerToolbar.menuBtn addTarget:self action:@selector(mentAction:) forControlEvents:UIControlEventTouchUpInside];
    [_explorerToolbar.closrBtn addTarget:self action:@selector(closrBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.movePanGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleMovePan:)];
    [self.view addGestureRecognizer:self.movePanGR];
    
}



- (void)mentAction:(id)sender {
    YLGlobalViewController *vc = [YLGlobalViewController new];
    vc.delegate = self;
    [YLGlobalViewController setApplicationWindow:[[UIApplication sharedApplication] keyWindow]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self makeKeyAndPresentViewController:navigationController animated:YES completion:nil];
    
}

- (void)closrBtnAction:(id)sender {
    [[YLAssitManager sharedManager]hideExplorer];
    
}


#pragma mark - Selected View Moving

- (void)handleMovePan:(UIPanGestureRecognizer *)movePanGR
{
    switch (movePanGR.state) {
        case UIGestureRecognizerStateBegan:
            self.selectedViewFrameBeforeDragging = self.explorerToolbar.frame;
            [self updateSelectedViewPositionWithDragGesture:movePanGR];
            break;
            
        case UIGestureRecognizerStateChanged:
        case UIGestureRecognizerStateEnded:
            [self updateSelectedViewPositionWithDragGesture:movePanGR];
            break;
            
        default:
            break;
    }
}

- (void)updateSelectedViewPositionWithDragGesture:(UIPanGestureRecognizer *)movePanGR
{
    CGPoint translation = [movePanGR translationInView:self.view];
    CGRect newSelectedViewFrame = self.selectedViewFrameBeforeDragging;
    newSelectedViewFrame.origin.x = (newSelectedViewFrame.origin.x + translation.x);
    newSelectedViewFrame.origin.y = (newSelectedViewFrame.origin.y + translation.y);
    self.explorerToolbar.frame = newSelectedViewFrame;
}



- (BOOL)shouldReceiveTouchAtWindowPoint:(CGPoint)pointInWindowCoordinates
{
    BOOL shouldReceiveTouch = NO;
    
    CGPoint pointInLocalCoordinates = [self.view convertPoint:pointInWindowCoordinates fromView:nil];
    
    // Always if it's on the toolbar
    if (CGRectContainsPoint(self.explorerToolbar.frame, pointInLocalCoordinates)) {
        shouldReceiveTouch = YES;
    }
    
   
   
    
    // Always if we have a modal presented
    if (!shouldReceiveTouch && self.presentedViewController) {
        shouldReceiveTouch = YES;
    }
    
    return shouldReceiveTouch;
}

- (BOOL)wantsWindowToBecomeKey
{
    return self.previousKeyWindow != nil;
}


#pragma mark - YLGlobalViewControllerDelegate
- (void)globalsViewControllerDidFinish:(YLGlobalViewController *)globalsViewController;{
    [self resignKeyAndDismissViewControllerAnimated:YES completion:nil];
}


- (void)resignKeyAndDismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    UIWindow *previousKeyWindow = self.previousKeyWindow;
    self.previousKeyWindow = nil;
    [previousKeyWindow makeKeyWindow];
    [[previousKeyWindow rootViewController] setNeedsStatusBarAppearanceUpdate];
    
    [self dismissViewControllerAnimated:animated completion:completion];
}

- (void)makeKeyAndPresentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion
{
    // Save the current key window so we can restore it following dismissal.
    self.previousKeyWindow = [[UIApplication sharedApplication] keyWindow];
    
    // Make our window key to correctly handle input.
    [self.view.window makeKeyWindow];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // Show the view controller.
    [self presentViewController:viewController animated:animated completion:completion];
}


@end
