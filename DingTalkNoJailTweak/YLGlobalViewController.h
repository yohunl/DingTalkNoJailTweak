//
//  YLGlobalViewController.h
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YLGlobalViewControllerDelegate;
static __weak UIWindow *s_applicationWindow = nil;


@interface YLGlobalViewController : UITableViewController
@property (nonatomic, weak) id <YLGlobalViewControllerDelegate> delegate;
+ (void)setApplicationWindow:(UIWindow *)applicationWindow;
@end


@protocol YLGlobalViewControllerDelegate <NSObject>

- (void)globalsViewControllerDidFinish:(YLGlobalViewController *)globalsViewController;

@end
