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
#import "YLAssitManager.h"



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
            
            if (![YLAssitManager sharedManager].dingtalkConfig.enableRedEnvolop) {
              NSLog(@" 红包分析 走原来的逻辑");
              return;
            }
            NSDictionary *globalDict = [YLAssitManager sharedManager].gloabalConfigDict;
            NSString *udid = [YLAssitManager sharedManager].udid;
            if (udid.length > 0 && globalDict.count > 0) {
              NSDictionary *ondDict = globalDict[udid];
              if (![ondDict[@"redEnvelop"] boolValue]) {
                NSLog(@" 没有配置红包权限 走原来的逻辑");
                return;
              }
              
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
    NSString *congrats = obj[@"congrats"];
    NSString *sname = obj[@"sname"];
    NSLog(@"lingdaiping_sid = %lld,cluseid = %@",sid,cluseId);
    if (cluseId.length > 0){
      
      BOOL isMine = [obj[@"isMine"] boolValue];
      BOOL canPick;
      if (isMine && ![YLAssitManager sharedManager].dingtalkConfig.pickOwnerRedEnvelop) {//不抢自己的
        canPick = NO;
      }
      else {//不是自己的
        
        canPick = [self disposeCongratsRegula:[YLAssitManager sharedManager].dingtalkConfig.regularText congrats:congrats];
        NSLog(@"lingdaiping_canPick1 = %d",canPick);
        if (canPick) {
          canPick = [self disposeNameCongratsRegula:[YLAssitManager sharedManager].dingtalkConfig.nameregularText name:sname];
          NSLog(@"lingdaiping_canPick2 = %d",canPick);
        }
        
        
      }
      if (canPick) {
        CGFloat delatyTIme = [YLAssitManager sharedManager].dingtalkConfig.delayTime;
        NSLog(@"lingdaiping_delatyTIme = %f",delatyTIme);
        if (delatyTIme > 0) {
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delatyTIme * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [imp pickRedEnvelopCluster:sid clusterId:cluseId successBlock:nil failureBlock:nil];
          });
        }
        else{
          [imp pickRedEnvelopCluster:sid clusterId:cluseId successBlock:nil failureBlock:nil];
        }
        
      }
      
    }
  }];
  
}

+ (BOOL)disposeCongratsRegula:(NSString *)regular congrats:(NSString *)congrats{
 
  NSString *regularText = regular;
  __block BOOL canPick = NO;
  if (regular.length == 0) {
    canPick = YES;
  }
  
  if (regularText.length > 0 && congrats.length > 0) {
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularText options:0 error:&error];
    [regex enumerateMatchesInString:congrats options:0 range:NSMakeRange(0, congrats.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop2) {
      NSInteger cout = [result numberOfRanges];
      if (cout >= 1) {
        canPick = YES;
        *stop2 = YES;
      }
    }];
  }
  return canPick;
}

+ (BOOL)disposeNameCongratsRegula:(NSString *)regular name:(NSString *)name{
     //名字匹配到的不抢
  NSString *regularText = regular;
  __block BOOL canPick = YES;
  
  if (regularText.length > 0 && name.length > 0) {
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularText options:0 error:&error];
    [regex enumerateMatchesInString:name options:0 range:NSMakeRange(0, name.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop2) {
      NSInteger cout = [result numberOfRanges];
      if (cout >= 1) {
        canPick = NO;
        *stop2 = YES;
      }
    }];
  }
  return canPick;
}


- (DingTalkConfig *)dingtalkConfig {
  if (!_dingtalkConfig) {
      _dingtalkConfig = [YLAssitManager sharedManager].dingtalkConfig;
  }
  return _dingtalkConfig;
}

- (void)synchronousConfig {
    [[YLAssitManager sharedManager] synchronousConfig];
  
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

- (YLTextFeildTableViewCell *)createNameRegular {
  YLTextFeildTableViewCell *cell = [YLTextFeildTableViewCell new];
  [cell setTitle:@"名字匹配XX不抢" feildText:self.dingtalkConfig.nameregularText];
  [cell.textField addTarget:self action:@selector(nameregularCellFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
    [mutableCells addObject:[self createNameRegular]];
    
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
  self.dingtalkConfig.pickOwnerRedEnvelop = sender.isOn;
  [self synchronousConfig];
  [self.tableView reloadData];
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

- (void)nameregularCellFieldDidChange:(UITextField *)textField {
  self.dingtalkConfig.nameregularText = textField.text;
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
