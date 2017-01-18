//
//  YLCellModel.m
//  DingTalkNoJailTweak
//
//  Created by lingyohunl on 2016/12/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLCellModel.h"

@implementation YLCellModel
+ (instancetype) modelFromClass:(Class)cellClass data:(id)data delegate:(id)delegate height:(NSInteger)height {
  YLCellModel *model = [[self alloc]init];
  model.cellClass = cellClass;
  model.data = data;
  model.delegate = delegate;
  model.cellHeight = height;
  return model;
}
@end
