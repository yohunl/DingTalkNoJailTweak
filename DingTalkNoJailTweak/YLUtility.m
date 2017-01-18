//
//  YLUtility.m
//  WeChatAssistant
//
//  Created by lingyohunl on 16/8/19.
//  Copyright © 2016年 yohunl. All rights reserved.
//

#import "YLUtility.h"




@implementation YLUtility
+ (UIFont *)defaultFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)defaultTableViewCellLabelFont
{
    return [self defaultFontOfSize:12.0];
}


+ (BOOL)writeData:(NSData *)data toFile:(NSString *)fileName {
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:fileName]];
    return [data writeToFile:databasePath atomically:YES];
}

+ (NSData *)readDataFromFile:(NSString *)fileName {
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:fileName]];
    
    NSData *data = [NSData dataWithContentsOfFile:databasePath];
    return data;
}
@end
