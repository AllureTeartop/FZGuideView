//
//  BaseViewController.m
//  Demo-OC
//
//  Created by nuoda on 2017/5/2.
//  Copyright © 2017年 heheheheh. All rights reserved.
//

#import "BaseViewController.h"
#import "FZGuideView.h"
@interface BaseViewController ()

@end

@implementation BaseViewController



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    FZGuideView *guideView = [[FZGuideView alloc] init];
    [guideView showGuideViewWithClassName:NSStringFromClass([self class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
