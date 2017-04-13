//
//  LLGuidePageCell.m
//  LLGuidePage
//
//  Created by 陈晓龙 on 17/1/22.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "LLGuidePageCell.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation LLGuidePageCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.finishBtn];
    }
    return self;
}
- (UIButton *)finishBtn{
    if (!_finishBtn) {
        CGFloat btnW = 100;
        CGFloat btnH = 40;
        _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishBtn.frame = CGRectMake(SCREEN_WIDTH/2-btnW/2, SCREEN_HEIGHT-btnH-40, btnW, btnH);
        _finishBtn.backgroundColor = [UIColor purpleColor];
        [_finishBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _finishBtn.layer.cornerRadius = 10;
        _finishBtn.layer.masksToBounds = YES;
        [_finishBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _finishBtn;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.finishBtn sizeToFit];
}
- (void)btnClicked:(UIButton *)button{
    if (_finishBtnClicked) {
        _finishBtnClicked(button);
    }
}
@end
