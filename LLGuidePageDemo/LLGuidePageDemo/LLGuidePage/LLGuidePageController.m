//
//  LLGuidePageController.m
//  LLGuidePage
//
//  Created by 陈晓龙 on 17/1/22.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "LLGuidePageController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LLGuidePageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property(nonatomic,copy)GuidePageSetupCellHandler setupCellHandler;//数据源的回调
@property(nonatomic,copy)GuidePageFinisBtnHandler finishBtnHandler;//点击下一步按钮的回调
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,assign)NSInteger pageCount;
@end
static NSString * const cellId = @"cellId";
@implementation LLGuidePageController
- (instancetype)initWithPageCount:(NSInteger)count setupCellHandler:(GuidePageSetupCellHandler)setupCellHandler finishBtnHandler:(GuidePageFinisBtnHandler)finishBtnHander{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        _setupCellHandler = setupCellHandler;
        _finishBtnHandler = finishBtnHander;
        //初始化
        _pageCount = count;
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageControl];
        
        [self.collectionView registerClass:[LLGuidePageCell class] forCellWithReuseIdentifier:cellId];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//懒加载
- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = ({
            UIPageControl * pageControl = [[UIPageControl alloc]init];
            //控制器的页数
            pageControl.numberOfPages = self.pageCount;
            //控制器的当前页
            pageControl.currentPage = 0;
            //通过页数获取控制器的大小
            CGSize pageControlSize = [pageControl sizeForNumberOfPages:5];
            CGFloat pageControlX = SCREEN_WIDTH/2-pageControlSize.width/2;//居中
            CGFloat pageControlY = SCREEN_HEIGHT-pageControlSize.height-100;
            pageControl.frame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
            pageControl;
        });
    }
    return _pageControl;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = self.view.frame.size;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        _collectionView.pagingEnabled = YES;//分割成分页效果
        _collectionView.bounces = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    LLGuidePageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (indexPath.row != self.pageCount-1) {
        cell.finishBtn.hidden = YES;
    }else{
        cell.finishBtn.hidden = NO;
    }
    //将cell 给调用者
    if (self.setupCellHandler) {
        self.setupCellHandler(cell,indexPath);
    }
    
    cell.finishBtnClicked = ^(UIButton * finishBtn){
        if (weakSelf.finishBtnHandler) {
            weakSelf.finishBtnHandler(finishBtn);
        }
    };
    return cell;
}

#pragma  UIScroollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat width = scrollView.bounds.size.width;
    NSLog(@"contentOffsetX--->%lf",contentOffsetX);
    NSLog(@"scrollViewWitdh-->%lf",width);
    NSInteger currentPage = contentOffsetX/width+0.5;//当滑动一半时更改pageControl的页面
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
}

@end
