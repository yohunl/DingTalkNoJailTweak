//
//  YLHongBaoViewController.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLHongBaoViewController.h"
#import "YLSwitchTableViewCell.h"
#import <objc/runtime.h>
#import "DingTalkHead.h"
#import "DingTalkRedEnvelop.h"
#import "Aspects.h"
static NSString *const kYLObserverHongBaoEnabledDefaultsKey = @"com.yohunl.YLObserverHongBao.enableOnLaunch";
static NSString *const kYLHongBaoEnableNotification = @"com.yohunl.kYLHongbaoEnableNotification";


@interface YLHongBaoViewController ()
@property (nonatomic, copy) NSArray *cells;
@end

@implementation YLHongBaoViewController
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      Class class = objc_getClass("DTConversationListDataSource") ;//[self class];
      //- (void)controller:(id)arg1 didChangeObject:(id)arg2 atIndex:(unsigned long long)arg3 forChangeType:(long long)arg4 newIndex:(unsigned long long)arg5;

      void (^hook_block)(id<AspectInfo> aspectinfo,id controller,id didChangeObject,unsigned long long atIndex,long long forChangeType,unsigned long long newIndex) = ^(id<AspectInfo> aspectinfo,id controller,id didChangeObject,unsigned long long atIndex,long long forChangeType,unsigned long long newIndex){
        if (![YLHongBaoViewController isEnabled]) {
          NSLog(@" 红包分析 走原来的逻辑");
          return;
        }
        NSMutableArray *attachArr = [DingTalkRedEnvelop disposeConversation:didChangeObject];
        [attachArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
          DTRedEnvelopServiceIMP *imp = [objc_getClass("DTRedEnvelopServiceFactory") defaultServiceIMP];
          long long sid = [obj[@"sid"] longLongValue];
          NSString *cluseId = obj[@"clusterid"];
          NSLog(@"lingdaiping_sid = %lld,cluseid = %@",sid,cluseId);
          if (cluseId.length > 0){
            [imp pickRedEnvelopCluster:sid clusterId:cluseId successBlock:nil failureBlock:nil];
          }
          
        }];
        
        
      };
      aspect_add(class, @selector(controller:didChangeObject:atIndex:forChangeType:newIndex:), AspectPositionAfter, hook_block, nil);
    });
}







- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"红包设置";
    NSMutableArray *mutableCells = [NSMutableArray array];
    
    UITableViewCell *hongbaoCell = [self switchCellWithTitle:@"抢红包功能" toggleAction:@selector(hongBaoToggled:) isOn:[YLHongBaoViewController isEnabled]];
    [mutableCells addObject:hongbaoCell];
    
    
    self.cells = mutableCells;
}


- (UITableViewCell *)switchCellWithTitle:(NSString *)title toggleAction:(SEL)toggleAction isOn:(BOOL)isOn
{
   
    YLSwitchTableViewCell *cell = [[YLSwitchTableViewCell alloc] init];
    [cell setWithTitle:title isOn:isOn];
    [cell.theSwitch addTarget:self action:toggleAction forControlEvents:UIControlEventValueChanged];
    return cell;
}



+ (void)setEnabled:(BOOL)enabled
{
    BOOL previouslyEnabled = [self isEnabled];
    [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kYLObserverHongBaoEnabledDefaultsKey];
    
    if (enabled) {
        // Inject if needed. This injection is protected with a dispatch_once, so we're ok calling it multiple times.
        // By doing the injection lazily, we keep the impact of the tool lower when this feature isn't enabled.
        [self injectHongBaoClasses];
    }
    
    if (previouslyEnabled != enabled) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kYLHongBaoEnableNotification object:self];
    }
    
    
    
}

+ (BOOL)isEnabled
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kYLObserverHongBaoEnabledDefaultsKey] boolValue];
}


- (void)hongBaoToggled:(UISwitch *)sender
{
   [YLHongBaoViewController setEnabled:sender.isOn];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cells count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cells[indexPath.row];
}


+ (void)injectHongBaoClasses{
    
}


@end
