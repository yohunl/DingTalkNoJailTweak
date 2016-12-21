//
//  YLMapViewController.m
//  DingTalkNoJailTweak
//
//  Created by yohunl on 2016/12/21.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLMapViewController.h"
#import "UIView+Helpers.h"
#import "YLUtility.h"
#import <MapKit/MapKit.h>
#import "YLLocationManager.h"
#import "YLMyAnotation.h"
#import "YLLocationCaluate.h"
#import "YLAssitManager.h"
@interface YLMapViewController ()<MKMapViewDelegate>
@property (strong, nonatomic) MKMapView *mapView;
@end

@implementation YLMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_mapView];
    
    _backBGView = [UIView new];
    _backBGView.backgroundColor = UIColorHexFromRGBAlpha(0xffffff, 0.7);
    [self.view addSubview:_backBGView];
    
    
    _addressLabel = [UILabel new];
    _addressLabel.textColor = [UIColor blackColor];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    [_backBGView addSubview:_addressLabel];
    
    _longitudeLabel = [UILabel new];
    _longitudeLabel.textColor = [UIColor blackColor];
    _longitudeLabel.font = [UIFont systemFontOfSize:12];
    [_backBGView addSubview:_longitudeLabel];
    
    _latitudeLabel = [UILabel new];
    _latitudeLabel.textColor = [UIColor blackColor];
    _latitudeLabel.font = [UIFont systemFontOfSize:12];
    [_backBGView addSubview:_latitudeLabel];
   
    
    _currentLocationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _currentLocationBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_currentLocationBtn setTitle:@"定位" forState:UIControlStateNormal];
    [_currentLocationBtn addTarget:self action:@selector(currentLocationBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    _currentLocationBtn.frameSize = CGSizeMake(40, 40);
    [self.view addSubview:_currentLocationBtn];
    
    
    
    YLLocationManager *loc = [YLLocationManager sharedManager];
    [loc getAuthorization];//授权
    [loc startLocation];//开始定位
    
    //跟踪用户位置
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    //地图类型
    //    self.mapView.mapType = MKMapTypeSatellite;
    self.mapView.delegate = self;
    
    
    
    YLMyAnotation *anno = [[YLMyAnotation alloc] init];
    anno.coordinate = CLLocationCoordinate2DMake([YLAssitManager sharedManager].dingtalkConfig.latitude, [YLAssitManager sharedManager].dingtalkConfig.longitude);
    anno.title = [NSString stringWithFormat:@"经度：%f",[YLAssitManager sharedManager].dingtalkConfig.longitude];
    anno.subtitle = [NSString stringWithFormat:@"纬度：%f",[YLAssitManager sharedManager].dingtalkConfig.latitude];
    
    self.longitudeLabel.text = [NSString stringWithFormat:@"经度：%f",[YLAssitManager sharedManager].dingtalkConfig.longitude];
    self.latitudeLabel.text = [NSString stringWithFormat:@"纬度：%f",[YLAssitManager sharedManager].dingtalkConfig.latitude];
    //反地理编码
    YLLocationCaluate *locManager = [[YLLocationCaluate alloc] init];
    [locManager reverseGeocodeWithlatitude:[YLAssitManager sharedManager].dingtalkConfig.latitude longitude:[YLAssitManager sharedManager].dingtalkConfig.longitude success:^(NSString *address) {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",address];
    } failure:^{
        
    }];

    [self.mapView addAnnotation:anno];
    
    
    NSLog(@"添加监听");
    [self.mapView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [YLAssitManager sharedManager].dingtalkConfig.useOriginalCordinate = YES;
}
- (void)viewDidDisappear:(BOOL)animated {
    [YLAssitManager sharedManager].dingtalkConfig.useOriginalCordinate = NO;
}
- (void)currentLocationBtnAction:(id)sender {
    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _backBGView.frameSize = CGSizeMake(self.view.frameSizeWidth, 80);
    [_backBGView bottomAlignForSuperView];
    
    _addressLabel.frameSize = CGSizeMake(_backBGView.frameSizeWidth, 13);
    [_addressLabel topAlignForSuperViewOffset:8];
    
    _longitudeLabel.frameSize = CGSizeMake(_backBGView.frameSizeWidth, 13);
    [_longitudeLabel setFrameOriginYBelowView:_addressLabel offset:8];
    
    _latitudeLabel.frameSize = CGSizeMake(_backBGView.frameSizeWidth, 13);
    [_latitudeLabel  setFrameOriginYBelowView:_longitudeLabel offset:8];
    
    [_currentLocationBtn setFrameOriginYAboveView:_backBGView offset:8];
    
    
}


/**
 * 当用户位置更新，就会调用
 *
 * userLocation 表示地图上面那可蓝色的大头针的数据
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    userLocation.title = [NSString stringWithFormat:@"经度：%f",center.longitude];
    userLocation.subtitle = [NSString stringWithFormat:@"纬度：%f",center.latitude];
    
    NSLog(@"定位：%f %f --- %i",center.latitude,center.longitude,mapView.showsUserLocation);
    
    
    
    
    //设置地图的中心点，（以用户所在的位置为中心点）
    //    [mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    //设置地图的显示范围
    //    MKCoordinateSpan span = MKCoordinateSpanMake(0.023666, 0.016093);
    //    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    //    [mapView setRegion:region animated:YES];
    
}

//- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
//{
//    //获取跨度
//    NSLog(@"%f  %f",mapView.region.span.latitudeDelta,mapView.region.span.longitudeDelta);
//}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //如果是定位的大头针就不用自定义
    if (![annotation isKindOfClass:[YLMyAnotation class]]) {
        return nil;
    }
    
    static NSString *ID = @"anno";
    MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    if (annoView == nil) {
        annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ID];
    }
    
    YLMyAnotation *anno = annotation;
    UIImage *img = [YLMyAnotation circularDoubleCircleWithDiamter:20];
    annoView.image = img;
    annoView.annotation = anno;
    
    return annoView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"didSelectAnnotationView--%@",view);
}


- (void)tap:(UITapGestureRecognizer *)tap
{
    CGPoint touchPoint = [tap locationInView:tap.view];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    [YLAssitManager sharedManager].dingtalkConfig.latitude = coordinate.latitude;
    [YLAssitManager sharedManager].dingtalkConfig.longitude = coordinate.longitude;
    [[YLAssitManager sharedManager]synchronousConfig];
    
    NSLog(@"%@",self.mapView.annotations);
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = self.mapView.annotations.count;
    if (count > 1) {
        for (id obj in self.mapView.annotations) {
            if (![obj isKindOfClass:[MKUserLocation class]]) {
                [array addObject:obj];
            }
        }
        [self.mapView removeAnnotations:array];
    }
    
    YLMyAnotation *anno = [[YLMyAnotation alloc] init];
    
    anno.coordinate = coordinate;
    anno.title = [NSString stringWithFormat:@"经度：%f",coordinate.longitude];
    anno.subtitle = [NSString stringWithFormat:@"纬度：%f",coordinate.latitude];
    
    self.longitudeLabel.text = [NSString stringWithFormat:@"经度：%f",coordinate.longitude];
    self.latitudeLabel.text = [NSString stringWithFormat:@"纬度：%f",coordinate.latitude];
    //反地理编码
    YLLocationCaluate *locManager = [[YLLocationCaluate alloc] init];
    [locManager reverseGeocodeWithlatitude:coordinate.latitude longitude:coordinate.longitude success:^(NSString *address) {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",address];
    } failure:^{
        
    }];
    
    
    
    [self.mapView addAnnotation:anno];
    [self.mapView setCenterCoordinate:coordinate animated:YES];
}


@end
