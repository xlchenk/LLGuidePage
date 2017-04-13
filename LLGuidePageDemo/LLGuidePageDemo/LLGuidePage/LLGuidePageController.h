//
//  LLGuidePageController.h
//  LLGuidePage
//
//  Created by 陈晓龙 on 17/1/22.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLGuidePageCell.h"
//定义两个block 引导页 按钮  将承载引导图的控件 给调用者 使用
typedef void(^GuidePageSetupCellHandler)(LLGuidePageCell * cell,NSIndexPath * indexPath);
//点击下一步按钮的回调
typedef void(^GuidePageFinisBtnHandler)(UIButton * finishBtn);

@interface LLGuidePageController : UIViewController
@property(nonatomic,strong)UIPageControl * pageControl;
/**初始化方法 */
- (instancetype)initWithPageCount:(NSInteger)count
                 setupCellHandler:(GuidePageSetupCellHandler)setupCellHandler
                 finishBtnHandler:(GuidePageFinisBtnHandler)finishBtnHander;



@end
