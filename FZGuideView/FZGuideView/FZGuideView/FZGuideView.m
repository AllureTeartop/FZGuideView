//
//  FZGuideView.m
//  FZGuideView
//
//  Created by Florence on 2017/5/2.
//  Copyright © 2017年 AllureTeartop. All rights reserved.
//


#import "FZGuideView.h"
#import "FZGuideUtil.h"
@interface FZGuideView ()

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSString *className;

@end


@implementation FZGuideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        self.index = 0;
    }
    return self;
}

-(UIImageView *)imageView{
 
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        _imageView.image = [UIImage imageNamed:self.dataArray[self.index]];
        [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    }
    return _imageView;
}
-(void)tap{
    
    if (self.index >=self.dataArray.count-1) {
        [FZGuideUtil deleteGuideDataWithClassName:self.className];
        [self removeFromSuperview];
    }else{
        self.imageView.image = [UIImage imageNamed:self.dataArray[++self.index]];
    
    }
}

-(void)showGuideViewWithClassName:(NSString *)className{

    self.dataArray = [FZGuideUtil getGuideDataWithClassName:className];
    
    if (!self.dataArray)return;
    self.className = className;
    [self addSubview:self.imageView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

@end
