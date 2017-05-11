//
//  AppDelegate+GuideView.m
//  Demo-OC
//
//  Created by nuoda on 2017/5/2.
//  Copyright © 2017年 heheheheh. All rights reserved.
//

#import "AppDelegate+GuideView.h"
#import "FZGuideView.h"
#import "FZGuideUtil.h"

#define SaveVersion [[NSUserDefaults standardUserDefaults] objectForKey:@"CFBundleShortVersionString"]
#define BundleVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@implementation AppDelegate (GuideView)

-(void)initWithGuideView{

    
    if (!SaveVersion) {
        [FZGuideUtil initGuideData];
        [[NSUserDefaults standardUserDefaults] setObject:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] forKey:@"CFBundleShortVersionString"];
    }else if(![SaveVersion isEqual:BundleVersion]){
        [FZGuideUtil initGuideData];
        [[NSUserDefaults standardUserDefaults] setObject:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] forKey:@"CFBundleShortVersionString"];
    }else{
    
         [[NSUserDefaults standardUserDefaults] setObject:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] forKey:@"CFBundleShortVersionString"];
    }
    
}



@end
