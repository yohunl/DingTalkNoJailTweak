//
//  YLSwitchTableViewCell.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLSwitchTableViewCell.h"
#import "YLUtility.h"

@implementation YLSwitchTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialInternal];
    }
    return self;
}

- (void)awakeFromNib
{
  [super awakeFromNib];
    [self initialInternal];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialInternal];
    }
    return self;
    
}


-(void)initialInternal{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textLabel.font = [YLUtility defaultFontOfSize:14];

    
    _theSwitch = [[UISwitch alloc] init];
    [self.contentView addSubview:_theSwitch];

    
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat switchOriginY = round((self.contentView.frame.size.height - _theSwitch.frame.size.height) / 2.0);
    CGFloat switchOriginX = CGRectGetMaxX(self.contentView.frame) - _theSwitch.frame.size.width - self.tableview.separatorInset.left;
    _theSwitch.frame = CGRectMake(switchOriginX, switchOriginY, _theSwitch.frame.size.width, _theSwitch.frame.size.height);
    _theSwitch.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
}


- (void)setWithTitle:(NSString *)title isOn:(BOOL)isOn{
    _theSwitch.on = isOn;
    self.textLabel.text = title;
}
@end
