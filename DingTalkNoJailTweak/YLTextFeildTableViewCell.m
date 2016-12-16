//
//  YLTextFeildTableViewCell.m
//  DingTalkNoJailTweak
//
//  Created by lingyohunl on 2016/12/16.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLTextFeildTableViewCell.h"
#import "YLUtility.h"

@interface YLTextFeildTableViewCell ()
@property (nonatomic,assign) CGFloat textWidth;
@end
@implementation YLTextFeildTableViewCell

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
  _textWidth = 100;
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  self.textLabel.font = [YLUtility defaultFontOfSize:14];
  
   [self.contentView addSubview:self.textField];
  
}

-(void)layoutSubviews {
  [super layoutSubviews];
  
  _textField.frameSize = CGSizeMake(100, self.frameSizeHeight);
  [self.textField rightAlignForSuperViewOffset:5];
  [self.textField centerAlignVerticalForSuperView];
  
  
  
}




-(UITextField *)textField
{
  if (!_textField) {
    _textField = [UITextField new];
    [_textField setFont:[UIFont systemFontOfSize:15]];
    _textField.textColor = UIColorHexFromRGB(0x000000);
    _textField.frameSize = CGSizeMake(100, 40);
  
  }
  return _textField;
}

- (void)setTitle:(NSString *)title feildText:(NSString *)feildText{
  self.textLabel.text = title;
  self.textField.text = feildText;
}
@end
