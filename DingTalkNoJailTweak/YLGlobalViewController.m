//
//  YLGlobalViewController.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLGlobalViewController.h"
#import "YLHongBaoViewController.h"
#import "YLCoordinatesViewController.h"
#import "YLAssitManager.h"
#import "YLCellModel.h"
#import "UIView+Helpers.h"
@interface YLGlobalViewController ()
@property (nonatomic,strong) NSMutableArray<YLCellModel *> *cellModelArr;
@property (nonatomic,strong) UITextField *tableFootView;
@end
@implementation YLGlobalViewController
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"功能列表";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"JJRClientBaseViewID"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
  _cellModelArr = [NSMutableArray new];
  NSDictionary *dataDict ;
  YLCellModel *model ;
  
  NSDictionary *globalDict = [YLAssitManager sharedManager].gloabalConfigDict;
  NSString *udid = [YLAssitManager sharedManager].udid;
  if (udid.length > 0 && globalDict.count > 0) {
    NSDictionary *ondDict = globalDict[udid];
    
    if ([ondDict[@"redEnvelop"] boolValue]) {
      dataDict = @{@"data":@"红包配置",@"selector":@"enterHongBaoAction"};
      model = [YLCellModel modelFromClass:UITableViewCell.class data:dataDict delegate:nil height:44];
      [_cellModelArr addObject:model];
    }
    
    if ([ondDict[@"longitudeAndlatitude"] boolValue]) {
      dataDict = @{@"data":@"经纬度配置",@"selector":@"enterLatitudeAction"};
      model = [YLCellModel modelFromClass:UITableViewCell.class data:dataDict delegate:nil height:44];
      [_cellModelArr addObject:model];
    }
    
  }
    
    _tableFootView = [UITextField new];
    _tableFootView.textColor = [UIColor redColor];
    _tableFootView.font = [UIFont systemFontOfSize:13];
    _tableFootView.frameSize = CGSizeMake(self.tableView.frameSizeWidth, 44);
    _tableFootView.text = udid;
    self.tableView.tableFooterView = _tableFootView;
    
    
}

- (void)donePressed:(id)sender
{
    [self.delegate globalsViewControllerDidFinish:self];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _cellModelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JJRClientBaseViewID" forIndexPath:indexPath];
  NSDictionary *data = _cellModelArr[indexPath.row].data;
  cell.textLabel.text = data[@"data"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  NSDictionary *data = _cellModelArr[indexPath.row].data;
  SEL slector = NSSelectorFromString(data[@"selector"]);
  [self performSelector:slector];
    
}

+ (void)setApplicationWindow:(UIWindow *)applicationWindow
{
    s_applicationWindow = applicationWindow;
}



- (void)enterHongBaoAction{
    YLHongBaoViewController *vc = [YLHongBaoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (void)enterLatitudeAction{
    YLCoordinatesViewController *vc = [YLCoordinatesViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
