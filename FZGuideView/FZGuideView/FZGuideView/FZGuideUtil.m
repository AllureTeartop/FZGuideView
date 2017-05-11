//
//  FZGuideUtil.m
//  FZGuideView
//
//  Created by Florence on 2017/5/2.
//  Copyright © 2017年 AllureTeartop. All rights reserved.
//

#import "FZGuideUtil.h"

#define GuidePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"GuideData.strings"]
#define kHeight [UIScreen mainScreen].bounds.size.height


@implementation FZGuideUtil

+(void)initGuideData{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"GuideData" ofType:@"strings"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:file];
    
    [dic writeToFile:GuidePath atomically:YES];
}
+(NSArray *)getGuideDataWithClassName:(NSString *)className{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:GuidePath];
    NSString *realClassName = [self converScreen:className];
    NSString *dataStr = dic[realClassName];
    
    if (dataStr) {
        return [dataStr componentsSeparatedByString:@","];
    }else{
        
        return nil;
    }
}

+(void)deleteGuideDataWithClassName:(NSString *)className{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:GuidePath];
    NSString *realClassName = [self converScreen:className];
    [dic removeObjectForKey:realClassName];
    [dic writeToFile:GuidePath atomically:YES];
}
+(NSString *)converScreen:(NSString *)className{
    if (kHeight>=736) {
        
        return [NSString stringWithFormat:@"%@_6p",className];
    }else if (kHeight >= 667){
        
        return [NSString stringWithFormat:@"%@_6",className];
    }else if (kHeight >= 568){
        
        return [NSString stringWithFormat:@"%@_5",className];
    }else{
        return [NSString stringWithFormat:@"%@_4",className];
    }
}



@end
