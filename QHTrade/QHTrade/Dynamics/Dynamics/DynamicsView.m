//
//  DynamicsView.m
//  QHTrade
//
//  Created by user on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DynamicsView.h"
#import "DynamicsViewModel.h"

#define kControllerCount 7;


@interface DynamicsView()<UICollectionViewDelegate,UICollectionViewDataSource>
/*
 * Dynamics 主控制器下滑动底层view
 */
@property(nonatomic,strong)UICollectionView *dynamicsCollectionView;
/*
 * 主控制器的ViewModel
 */
@property(nonatomic,strong)DynamicsViewModel *viewModel;
/*
 * segmentedControl 页面切换按钮
 */
@property(nonatomic,strong)UISegmentedControl *segmentedControl;
/*
 * scrollView 页面切换按钮的父视图
 */
@property(nonatomic,strong)UIScrollView *segmentedControlScrollView;
@end


@implementation DynamicsView

/*
 * 绑定ViewModel(将当前View下的ViewModel指针指向主控制器的ViewModel)
 */
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (DynamicsViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}
/*
 * 添加子视图
 */
-(void)setupViews{
    [self addSubview:self.segmentedControlScrollView];
    [self.segmentedControlScrollView addSubview:self.segmentedControl];
    [self addSubview:self.dynamicsCollectionView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
/*
 * 更新约束
 */
-(void)updateConstraints{
    [super updateConstraints];
    @weakify(self)
    [self.segmentedControlScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.centerX.equalTo(self);
        make.topMargin.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 26));
    }];
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.leftMargin.equalTo(self.segmentedControlScrollView);
        make.topMargin.equalTo(self.segmentedControlScrollView);
        make.size.mas_offset(CGSizeMake(560, 26));
    }];
    [self.dynamicsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.centerX.equalTo(self);
        make.top.equalTo(self.segmentedControl.mas_bottom);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-134));
    }];
}
/*
 * collectionView的代理事件
 */
# pragma mark collection代理事件
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kControllerCount;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([UICollectionViewCell class])] forIndexPath:indexPath];
    cell.backgroundColor = RGB(indexPath.row*30, 255/indexPath.row, indexPath.row*20+15);
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-134);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*
 * dynamicsCollectionView的get方法(懒加载)
 */
-(UICollectionView *)dynamicsCollectionView{
    if (!_dynamicsCollectionView) {
        UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
        collectionLayout.minimumLineSpacing = 0;
        collectionLayout.minimumInteritemSpacing = 0;
        //设置滚动方向
        collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _dynamicsCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:collectionLayout];
        _dynamicsCollectionView.delegate = self;
        _dynamicsCollectionView.dataSource = self;
        _dynamicsCollectionView.pagingEnabled = YES;
        _dynamicsCollectionView.backgroundColor = [UIColor whiteColor];
        _dynamicsCollectionView.showsVerticalScrollIndicator = NO;
        [_dynamicsCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([UICollectionViewCell class])]];
    }
    return _dynamicsCollectionView;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isKindOfClass:[self.dynamicsCollectionView class]]) {
        NSLog(@"yes");
    }else{
        NSLog(@"no");
      
        
    }
}
-(UIScrollView *)segmentedControlScrollView{
    if (!_segmentedControlScrollView) {
        _segmentedControlScrollView = [[UIScrollView alloc] init];
        _segmentedControlScrollView.contentSize = CGSizeMake(560, 0);
        _segmentedControlScrollView.showsVerticalScrollIndicator = NO;
    }
    return _segmentedControlScrollView;
}
-(UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"我的合约",@"自选合约",@"主力合约",@"上期所",@"大商所",@"郑商所",@"中金所", nil]];
        _segmentedControl.selectedSegmentIndex = 0;
        _segmentedControl.tintColor = [UIColor clearColor];
        [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(125, 126, 127),
                                                    NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                         forState:UIControlStateNormal];
        [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(190, 155, 95),
                                                    NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                         forState:UIControlStateSelected];
    }
    return _segmentedControl;
}
@end
