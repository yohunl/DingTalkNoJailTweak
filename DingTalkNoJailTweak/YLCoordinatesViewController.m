//
//  YLCoordinatesViewController.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLCoordinatesViewController.h"
#import "YLSwitchTableViewCell.h"
#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>
#import "YLAssitManager.h"
#import "YLMapViewController.h"
static NSString *const kYLCoordinatesEnabledDefaultsKey = @"com.yohunl.YLCoordinates.enableOnLaunch";
static NSString *const kYLCoordinatesEnableNotification = @"com.yohunl.kYLCoordinatesEnableNotification";

@implementation CLLocation(YLHook)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(coordinate);
        SEL swizzledSelector = @selector(yl_coordinate);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (CLLocationCoordinate2D)yl_coordinate{
		
    CLLocationCoordinate2D oldCoordinate = [self yl_coordinate];
  NSDictionary *globalDict = [YLAssitManager sharedManager].gloabalConfigDict;
  NSString *udid = [YLAssitManager sharedManager].udid;
  if (udid.length > 0 && globalDict.count > 0) {
    NSDictionary *ondDict = globalDict[udid];
    if (![ondDict[@"longitudeAndlatitude"] boolValue]) {
      NSLog(@" 没有配置修改经纬度权限 走原来的逻辑");
      return oldCoordinate;
    }
    
  }
  
    NSLog(@"yl_coordinate = %f,%f",oldCoordinate.latitude,oldCoordinate.longitude);
    if ([YLCoordinatesViewController isEnabled] && ![YLAssitManager sharedManager].dingtalkConfig.useOriginalCordinate) {
        //22.549308, 113.944137  科兴的
        //23.028591, 113.722010 东莞
        NSLog(@"oldCoordinate.latitude yl_coordinate");
        oldCoordinate.latitude = [YLAssitManager sharedManager].dingtalkConfig.latitude;//22.552582;//新的latitude
        oldCoordinate.longitude = [YLAssitManager sharedManager].dingtalkConfig.longitude;//113.939732;//新的longitude
        NSLog(@"yl_coordinate change = %f,%f",oldCoordinate.latitude,oldCoordinate.longitude);
    }
    
    return oldCoordinate;

}
@end


@interface YLCoordinatesViewController ()
@property (nonatomic, copy) NSArray *cells;
@property (nonatomic,strong) DingTalkConfig *dingtalkConfig;
@end

@implementation YLCoordinatesViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
     self.title = @"经纬度设置";
    self.cells = [self createCells];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self reloadAll];
}
- (DingTalkConfig *)dingtalkConfig {
    if (!_dingtalkConfig) {
        _dingtalkConfig = [YLAssitManager sharedManager].dingtalkConfig;
    }
    return _dingtalkConfig;
}

- (NSMutableArray *)createCells {
    NSMutableArray *cells = [NSMutableArray new];
    UITableViewCell *hongbaoCell = [self switchCellWithTitle:@"经纬度功能" toggleAction:@selector(coordinatesToggled:) isOn:[YLCoordinatesViewController isEnabled]];
    [cells addObject:hongbaoCell];
    if ([YLCoordinatesViewController isEnabled]) {
        hongbaoCell = [self createSelectCoordinatCell];
        [cells addObject:hongbaoCell];
    }
    
    return cells;
    
}

- (UITableViewCell *)createSelectCoordinatCell
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.text = [NSString stringWithFormat:@"经纬度:%.3f,%.3f",self.dingtalkConfig.latitude,self.dingtalkConfig.longitude];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (UITableViewCell *)switchCellWithTitle:(NSString *)title toggleAction:(SEL)toggleAction isOn:(BOOL)isOn
{
    
    YLSwitchTableViewCell *cell = [[YLSwitchTableViewCell alloc] init];
    [cell setWithTitle:title isOn:isOn];
    [cell.theSwitch addTarget:self action:toggleAction forControlEvents:UIControlEventValueChanged];
    return cell;
}


- (void)reloadAll {
    self.cells = [self createCells];
    [self.tableView reloadData];
}
+ (void)setEnabled:(BOOL)enabled
{
    BOOL previouslyEnabled = [self isEnabled];
    [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kYLCoordinatesEnabledDefaultsKey];
    if (enabled) {
        // Inject if needed. This injection is protected with a dispatch_once, so we're ok calling it multiple times.
        // By doing the injection lazily, we keep the impact of the tool lower when this feature isn't enabled.
        [self injectLocationClasses];
    }
    
    if (previouslyEnabled != enabled) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kYLCoordinatesEnableNotification object:self];
    }
    
}

+ (BOOL)isEnabled
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:kYLCoordinatesEnabledDefaultsKey] boolValue];
}


- (void)coordinatesToggled:(UISwitch *)sender
{
    [YLCoordinatesViewController setEnabled:sender.isOn];
    [self reloadAll];
    
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        YLMapViewController *vc = YLMapViewController.new;
        [self.navigationController pushViewController:vc animated:YES];
    }
}



+ (void)injectLocationClasses{
    
}


@end
