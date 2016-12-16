//
//  YLTextFeildTableViewCell.h
//  DingTalkNoJailTweak
//
//  Created by lingyohunl on 2016/12/16.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLTextFeildTableViewCell : UITableViewCell
  //@property (nonatomic, readonly) UILabel * textLabel;
@property (nonatomic, strong) UITextField * textField;
- (void)setTitle:(NSString *)title feildText:(NSString *)feildText;
@end
