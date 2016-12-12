//
//  YLExplorerToolBar.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/18.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLExplorerToolBar.h"

@implementation YLExplorerToolBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_menuBtn setTitle:@"菜单" forState:UIControlStateNormal];
        _menuBtn.frame = CGRectMake(15, 0, 44, 44) ;
        
        _menuBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_menuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _closrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closrBtn setTitle:@"关闭" forState:UIControlStateNormal];
        _closrBtn.frame = CGRectMake(60, 0, 44, 44) ;
        
         _closrBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_closrBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_menuBtn];
        [self addSubview:_closrBtn];
        
        self.backgroundColor = [UIColor colorWithRed:0.4275 green:0.4275 blue:0.4275 alpha:0.5];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}


@end
