//
//  AwesomeDetailsView.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AwesomeDetailsView.h"
#import "AwesomeDetailsModel.h"
#import "AwesomeDetailsViewModel.h"
#import "AwesomeDetailsHeadView.h"

@interface AwesomeDetailsView()
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)AwesomeDetailsHeadView *headView;
@property(nonatomic,strong)AwesomeDetailsViewModel *viewModel;
@end

@implementation AwesomeDetailsView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (AwesomeDetailsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews{
    [self addSubview:self.scroll];
    [self.scroll addSubview:self.headView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints{
    [super updateConstraints];
    @weakify(self)
    [self.scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.edges.equalTo(self);
    }];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.top.equalTo(self.scroll);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 150));
    }];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(UIScrollView *)scroll{
    if (!_scroll) {
        _scroll = [[UIScrollView alloc] init];
        _scroll.contentSize = CGSizeMake(0.5,800);
    }
    return _scroll;
}
-(AwesomeDetailsHeadView *)headView{
    if (!_headView) {
        _headView = [[AwesomeDetailsHeadView alloc] initWithViewModel:self.viewModel];
        _headView.layer.shadowOpacity = 0.3;// 阴影透明度
        
        _headView.layer.shadowColor = [UIColor lightGrayColor].CGColor;// 阴影的颜色
        
        _headView.layer.shadowRadius = 1;// 阴影扩散的范围控制
        
        _headView.layer.shadowOffset  = CGSizeMake(1, 1);// 阴影的范围
    }
    return _headView;
}
@end
