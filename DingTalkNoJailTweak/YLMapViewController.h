//
//  YLMapViewController.h
//  DingTalkNoJailTweak
//
//  Created by yohunl on 2016/12/21.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLMapViewController : UIViewController
@property (strong,nonatomic) UIView *backBGView;
@property (strong, nonatomic)  UILabel *addressLabel;
@property (strong, nonatomic)  UILabel *longitudeLabel;//经度
@property (strong, nonatomic)  UILabel *latitudeLabel;//纬度

@property (strong,nonatomic) UIButton *currentLocationBtn;


@end
