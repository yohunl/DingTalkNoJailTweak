//
//  YLMyAnotation.m
//  DingTalkNoJailTweak
//
//  Created by yohunl on 2016/12/21.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLMyAnotation.h"
#import "YLUtility.h"
@implementation YLMyAnotation
+ (UIImage *)circularDoubleCircleWithDiamter:(NSUInteger)diameter {
    
    NSParameterAssert(diameter > 0);
    CGRect frame = CGRectMake(0.0f, 0.0f, diameter + diameter/4, diameter);
    
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat scale = screen.scale;
    
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGRect frameBlue = CGRectMake(diameter/4, 0, diameter, diameter);
    CGRect frameRed = CGRectMake(0, 0, diameter, diameter);
    
    
    //蓝色的渐变圆
    CGContextSaveGState(context);
    UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:frameBlue];
    [imgPath addClip];
    [self drawLinearGradient:context colorBottom:UIColorHexFromRGBAlpha(0x0874e8,0.95) topColor:UIColorHexFromRGBAlpha(0x028fe8,0.95) frame:frameBlue];
    CGContextRestoreGState(context);
    
    //红色圆的边框
    CGContextSaveGState(context);
    CGFloat lineWidth = 0.5;
    CGContextSetLineWidth(context, lineWidth);
    UIBezierPath *outlinePath = [UIBezierPath bezierPathWithOvalInRect:frameRed];
    UIColor *colorWhite = UIColorHexFromRGBAlpha(0xf5f3f0, 1.0);
    CGContextSetStrokeColorWithColor(context, colorWhite.CGColor);
    CGContextAddPath(context, outlinePath.CGPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    
    //红色的渐变圆
    CGRect framered2 = CGRectInset(frameRed, 0.25, 0.25);
    CGContextSaveGState(context);
    UIBezierPath *imgPath2 = [UIBezierPath bezierPathWithOvalInRect:framered2];
    [imgPath2 addClip];
    [self drawLinearGradient:context colorBottom:UIColorHexFromRGBAlpha(0xf34f18,0.95) topColor:UIColorHexFromRGBAlpha(0xfb6701,0.95) frame:framered2];
    CGContextRestoreGState(context);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return newImage;
}
+(void)drawLinearGradient:(CGContextRef)context colorBottom:(UIColor *)colorBottom topColor:(UIColor *)topColor frame:(CGRect)frame{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    //创建起点颜色
    CGColorRef
    beginColor = colorBottom.CGColor;
    
    //创建终点颜色
    CGColorRef
    endColor = topColor.CGColor;
    
    //创建颜色数组
    CFArrayRef
    colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor,
        endColor}, 2, nil);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)colorArray, NULL);
    
    
    /*绘制线性渐变
     context:图形上下文
     gradient:渐变色
     startPoint:起始位置
     endPoint:终止位置
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(frame.size.width, frame.size.height), kCGGradientDrawsAfterEndLocation);
    CFRelease(gradient);
    //释放颜色空间
    CFRelease(colorArray);
    CGColorSpaceRelease(colorSpace);
}

@end
