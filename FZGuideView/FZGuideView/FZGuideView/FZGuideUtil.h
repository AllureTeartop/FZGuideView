//
//  FZGuideUtil.h
//  FZGuideView
//
//  Created by Florence on 2017/5/2.
//  Copyright © 2017年 AllureTeartop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FZGuideUtil : NSObject
/** 将配置文件写入内存 */
+(void)initGuideData;
/** 根据控制器类名从字典中获取引导图数组 */
+(NSArray *)getGuideDataWithClassName:(NSString *)className;
/** 根据控制器类名从字典中获取引导图数组，然后删除点击过得引导图 */
+(void)deleteGuideDataWithClassName:(NSString *)className;


@end
