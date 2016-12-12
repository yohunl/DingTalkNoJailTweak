//
//  YLSwitchTableViewCell.h
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLSwitchTableViewCell : UITableViewCell
@property (nonatomic,weak) UITableView *tableview;
@property (nonatomic,strong) UISwitch *theSwitch;

- (void)setWithTitle:(NSString *)title isOn:(BOOL)isOn;
@end
