//
//  YLLocationCaluate.h
//  DingTalkNoJailTweak
//
//  Created by yohunl on 2016/12/21.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface YLLocationCaluate : NSObject
/**
 *  地理编码 （通过地址获取经纬度）
 *
 *  @param address       输入的地址
 *  @param success       成功block，返回pm
 *  @param failure       失败block
 */
- (void)geocode:(NSString *)address success:(void(^)(CLPlacemark *pm))success failure:(void(^)())failure;


/**
 *  反地理编码 （通过经纬度获取地址）
 *
 *  @param latitude      输入的纬度
 *  @param longitude     输入经度
 *  @param success       成功block，返回pm
 *  @param failure       失败block
 */
- (void)reverseGeocodeWithlatitude:(CLLocationDegrees )latitude longitude:(CLLocationDegrees)longitude success:(void(^)(NSString *address))success failure:(void(^)())failure;

/**
 *  经纬度计算两地之间距离
 *
 *  @param lon1      目标的的经度
 *  @param lat1      目标的纬度
 *  @param lon2      自己的经度
 *  @param lat2      自己的纬度
 *  @param 返回值     距离（米）
 */
-(double) LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2;


- (double)countLineDistanceDest:(double)lon1 dest_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2;
@end
