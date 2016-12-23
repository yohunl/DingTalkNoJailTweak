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
#import <objc/runtime.h>
#import "UICKeyChainStore.h"
#import "YLUtility.h"
#define kIdentifierName @"YLAssitManagerUdid"
#define kConfigDataFileName @"dingTalkRedEnvelopConfigFile"
static NSString *const kYLObserverHongBaoEnabledDefaultsKey = @"com.yohunl.YLObserverHongBao.config.v1";
__attribute((constructor)) void injected_function(){
    NSLog(@"注入代码成功");
    
    [[NSNotificationCenter defaultCenter] addObserver:[YLAssitManager sharedManager]
                                             selector:@selector(showExplorer)
                                                 name:UIApplicationDidFinishLaunchingNotification
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


- (void)readConfig {
    
    //Class deviC = objc_getClass("AADeviceInfo");
    //SEL selector = NSSelectorFromString(@"udid");
    //_udid = [(id)deviC performSelector:selector];
    //  udid在非越狱手机上,没有权限,所以只能使用其它方式
    
    
    NSError *error = nil;
    NSData *data = [YLUtility readDataFromFile:kConfigDataFileName];
    if (data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        _gloabalConfigDict = dict;
        if (_gloabalConfigDict) {
            NSArray *arr = _gloabalConfigDict[@"redEnvelopType"];
            if (arr.count > 0) {
                _redEnvelopTypeArr = [NSMutableArray new];
                [_redEnvelopTypeArr addObjectsFromArray:arr];
            }
            
            
        }
    }
    
    UICKeyChainStore *wrapper = [UICKeyChainStore keyChainStoreWithService:kIdentifierName];
    _udid = wrapper[@"udid"];
    //_udid = @"BE8D685F-C5FD-4DE1-A9A3-628D1C2E6EA5";
    if (_udid.length == 0) {
        _udid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        if (_udid.length > 0) {
            wrapper[@"udid"] = _udid;
        }
        
    }
    
    if (_redEnvelopTypeArr || _redEnvelopTypeArr.count == 0) {
        _redEnvelopTypeArr = [NSMutableArray new];
        [_redEnvelopTypeArr addObject:@(901)];
        [_redEnvelopTypeArr addObject:@(902)];
        [_redEnvelopTypeArr addObject:@(905)];
    }

}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self readConfig];
    }
    return self;
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [self getControlJSon];
    });
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


- (void)getControlJSon{
  
  NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  /* Create session, and optionally set a NSURLSessionDelegate. */
  NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
  
  
  NSURL* URL = [NSURL URLWithString:@"https://raw.githubusercontent.com/yohunl/DingTalkNoJailTweak/develop/DingTalkNoJailTweak/gloabalConfig.json"];
  
  NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
  request.HTTPMethod = @"GET";
  
  
  /* Start a new Task */
  NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error == nil && ((NSHTTPURLResponse*)response).statusCode == 200) {
        [YLUtility writeData:data toFile:kConfigDataFileName];
    }
    else {
        // Failure
      NSLog(@"URL Session Task Failed: %@", [error localizedDescription]);
    }
  }];
  [task resume];
  [session finishTasksAndInvalidate];
}



- (DingTalkConfig *)dingtalkConfig {
    if (!_dingtalkConfig) {
        
            NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kYLObserverHongBaoEnabledDefaultsKey];
            _dingtalkConfig = [NSKeyedUnarchiver unarchiveObjectWithData:data];
       
        
        
        if (!_dingtalkConfig) {
            _dingtalkConfig = [DingTalkConfig new];
            
            //22.549308, 113.944137  科兴的

        }
        if (_dingtalkConfig.latitude == 0) {
            _dingtalkConfig.latitude = 22.549308;
            _dingtalkConfig.longitude = 113.944137;
        }
        
    }
    return _dingtalkConfig;
}

- (void)synchronousConfig {
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.dingtalkConfig];
    [currentDefaults setObject:data forKey:kYLObserverHongBaoEnabledDefaultsKey];
    
}


@end
