//
//  DingTalkConfig.m
//  DingTalkNoJailTweak
//
//  Created by lingyohunl on 2016/12/16.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "DingTalkConfig.h"

@implementation DingTalkConfig
- (void)encodeWithCoder:(NSCoder *)encoder 
{
  [encoder encodeBool:self.enableRedEnvolop forKey:@"enableRedEnvolop"];
  [encoder encodeFloat:self.delayTime forKey:@"delayTime"];
  [encoder encodeBool:self.pickOwnerRedEnvelop forKey:@"pickOwnerRedEnvelop"];
  [encoder encodeObject:self.regularText forKey:@"regularText"];
}

- (id)initWithCoder:(NSCoder *)decoder 
{
  self = [super init];
  if (self) {
    self.enableRedEnvolop = [decoder decodeBoolForKey:@"enableRedEnvolop"];
    self.delayTime = [decoder decodeFloatForKey:@"delayTime"];
    self.pickOwnerRedEnvelop = [decoder decodeBoolForKey:@"pickOwnerRedEnvelop"];
    self.regularText = [decoder decodeObjectForKey:@"regularText"];
  }
  return self;
}
@end
