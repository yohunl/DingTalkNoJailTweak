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
#import "YLTextFeildTableViewCell.h"
#import "DingTalkConfig.h"
static NSString *const kYLObserverHongBaoEnabledDefaultsKey = @"com.yohunl.YLObserverHongBao.config.v1";

DingTalkConfig *gDingtalkConfig = nil;
@interface YLHongBaoViewController ()
@property (nonatomic, copy) NSMutableArray<UITableViewCell *> *cells;
@property (nonatomic,strong) DingTalkConfig *dingtalkConfig;
@end

@implementation YLHongBaoViewController
+ (void)load {
  
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
          Class class = objc_getClass("DTConversationListDataSource");
          void (^hook_block)(id<AspectInfo> aspectinfo,id controller,id didChangeObject) = ^(id<AspectInfo> aspectinfo,id controller,id didChangeObject){
            if (!gDingtalkConfig) {
              NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kYLObserverHongBaoEnabledDefaultsKey];
              gDingtalkConfig = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            }
            if (!gDingtalkConfig.enableRedEnvolop) {
              NSLog(@" 红包分析 走原来的逻辑");
              return;
            }
            NSMutableArray *attachArr = [DingTalkRedEnvelop disposeConversation:didChangeObject];
            [self disposeRedEnvelop:attachArr];
          };
          
          aspect_add(class, @selector(controller:didChangeObject:atIndex:forChangeType:newIndex:), AspectPositionAfter, hook_block, nil);
        });
}


+ (void) disposeRedEnvelop :(NSMutableArray *)attachArr {
  [attachArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    DTRedEnvelopServiceIMP *imp = [objc_getClass("DTRedEnvelopServiceFactory") defaultServiceIMP];
    long long sid = [obj[@"sid"] longLongValue];
    NSString *cluseId = obj[@"clusterid"];
    NSLog(@"lingdaiping_sid = %lld,cluseid = %@",sid,cluseId);
    if (cluseId.length > 0){
      
      [imp pickRedEnvelopCluster:sid clusterId:cluseId successBlock:nil failureBlock:nil];
    }
  }];
  
}



- (DingTalkConfig *)dingtalkConfig {
  if (!_dingtalkConfig) {
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kYLObserverHongBaoEnabledDefaultsKey];
    _dingtalkConfig = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    
    if (!_dingtalkConfig) {
      _dingtalkConfig = [DingTalkConfig new];
    }
    
  }
  return _dingtalkConfig;
}

- (void)synchronousConfig {
  NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
  NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.dingtalkConfig];
  [currentDefaults setObject:data forKey:kYLObserverHongBaoEnabledDefaultsKey];
  
}



- (YLTextFeildTableViewCell *)createDelayCell {
  YLTextFeildTableViewCell *cell = [YLTextFeildTableViewCell new];
  NSString *strValue = [NSString stringWithFormat:@"%.3f",self.dingtalkConfig.delayTime];
  [cell setTitle:@"延迟多少秒" feildText:strValue];
  cell.textField.keyboardType = UIKeyboardTypeNumberPad;
  [cell.textField addTarget:self action:@selector(delayCellFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
  return cell;
}

- (YLTextFeildTableViewCell *)createRegular {
  YLTextFeildTableViewCell *cell = [YLTextFeildTableViewCell new];
  [cell setTitle:@"抢红包的规则" feildText:self.dingtalkConfig.regularText];
  [cell.textField addTarget:self action:@selector(regularCellFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
  return cell;
}

- (YLSwitchTableViewCell *)createPickOwnerRedEnvelopCell{
  YLSwitchTableViewCell *cell = [[YLSwitchTableViewCell alloc] init];
  [cell setWithTitle:@"是否抢自己发出的" isOn:self.dingtalkConfig.pickOwnerRedEnvelop];
  [cell.theSwitch addTarget:self action:@selector(pickOwnerToggled:) forControlEvents:UIControlEventValueChanged];
  return cell;
}

- (UITableViewCell *)switchCellWithTitle:(NSString *)title toggleAction:(SEL)toggleAction isOn:(BOOL)isOn
{
  
  YLSwitchTableViewCell *cell = [[YLSwitchTableViewCell alloc] init];
  [cell setWithTitle:title isOn:isOn];
  [cell.theSwitch addTarget:self action:toggleAction forControlEvents:UIControlEventValueChanged];
  return cell;
}

- (NSMutableArray<UITableViewCell *> *)createCells {
  NSMutableArray *mutableCells = [NSMutableArray array];
  UITableViewCell *hongbaoCell = [self switchCellWithTitle:@"抢红包功能" toggleAction:@selector(hongBaoToggled:) isOn:self.dingtalkConfig.enableRedEnvolop];
  [mutableCells addObject:hongbaoCell];
  
  if (self.dingtalkConfig.enableRedEnvolop) {
    [mutableCells addObject:[self createPickOwnerRedEnvelopCell]];
    [mutableCells addObject:[self createDelayCell]];
    [mutableCells addObject:[self createRegular]];
  }
  return mutableCells;
  
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"红包设置";
  self.cells = [self createCells];
  UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
  [self.tableView addGestureRecognizer:gestureRecognizer];
  self.tableView.tableFooterView = [UIView new];
}






- (void)reloadAllData{
  self.cells = [self createCells];
  [self.tableView reloadData];
}




- (void)hongBaoToggled:(UISwitch *)sender
{
  self.dingtalkConfig.enableRedEnvolop = sender.isOn;
  [self synchronousConfig];
  [self reloadAllData];
  
  
}

- (void)pickOwnerToggled:(UISwitch *)sender
{
  self.dingtalkConfig.enableRedEnvolop = sender.isOn;
  [self synchronousConfig];
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



- (void)delayCellFieldDidChange:(UITextField *)textField {
  NSString *string = textField.text;
  CGFloat delay = [string floatValue];
  if (delay < 0) {
    delay = 0;
  }
  self.dingtalkConfig.delayTime = delay;
  [self synchronousConfig];
}

- (void)regularCellFieldDidChange:(UITextField *)textField {
  self.dingtalkConfig.regularText = textField.text;
  [self synchronousConfig];
}





- (void) hideKeyboard {
  [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

  //-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
  //{
  //  
  //  [self.view endEditing:YES];
  //}


@end
