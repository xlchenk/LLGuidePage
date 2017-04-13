//
//  LLGuidePageCell.h
//  LLGuidePage
//
//  Created by 陈晓龙 on 17/1/22.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLGuidePageCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)UIButton * finishBtn;
@property(nonatomic,copy)void (^finishBtnClicked)(UIButton *butotn);
@end
