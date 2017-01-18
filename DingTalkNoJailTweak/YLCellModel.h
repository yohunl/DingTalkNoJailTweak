//
//  YLCellModel.h
//  DingTalkNoJailTweak
//
//  Created by lingyohunl on 2016/12/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YLCellModel : NSObject
@property (nonatomic,assign) Class cellClass;
@property (nonatomic,strong) id data;
@property (nonatomic,weak) id delegate;
@property (nonatomic,assign) NSInteger cellHeight;
@property (nonatomic,strong) UITableViewCell *cellObj;///<有些是静态的cell.所以我们直接传过来
+ (instancetype) modelFromClass:(Class)cellClass data:(id)data delegate:(id)delegate height:(NSInteger)height;
@end
