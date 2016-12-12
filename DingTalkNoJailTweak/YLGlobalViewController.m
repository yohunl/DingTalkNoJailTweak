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
@interface YLGlobalViewController ()
@property (nonatomic,strong) NSMutableArray *datas;
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
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JJRClientBaseViewID" forIndexPath:indexPath];
    //cell.textLabel.text = [NSString stringWithFormat:@"index = %@",indexPath ];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"红包";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"经纬度";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self enterHongBaoAction];
    }
    else if (indexPath.row == 1) {
        [self enterLatitudeAction];
    }
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
