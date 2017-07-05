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
#import "TradersInstructionsView.h"
#import "TradingInformationView.h"


@interface AwesomeDetailsView()
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)AwesomeDetailsHeadView *awesomeDetailsHeadView;//牛人信息
@property(nonatomic,strong)TradersInstructionsView *tradersInstructionsView;//操盘说明View
@property(nonatomic,strong)TradingInformationView *tradingInformationView;//交易信息view
@property(nonatomic,strong)AwesomeDetailsViewModel *viewModel;
@property(nonatomic,strong)UIButton *followAction;//跟单按钮
@property(nonatomic,assign)CGFloat tradersInstructionsHeight;//操作说明ViewHeight
@end

@implementation AwesomeDetailsView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (AwesomeDetailsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)setupViews{
//    [self addSubview:self.scroll];
    [self addSubview:self.awesomeDetailsHeadView];
    [self addSubview:self.tradersInstructionsView];
    [self addSubview:self.tradingInformationView];
    [self addSubview:self.followAction];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)bindViewModel{
    WS(weakSelf)
    [[self.viewModel.tradersInstructionsOpenSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        weakSelf.tradersInstructionsHeight =[x intValue]==1?150:100;
        [weakSelf updateConstraints];
    }];
    
}
-(void)updateConstraints{
    [super updateConstraints];
    
    @weakify(self)
//    [self.scroll mas_makeConstraints:^(MASConstraintMaker *make){
//        @strongify(self)
//        make.edges.equalTo(self);
//    }];
    [self.awesomeDetailsHeadView mas_makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.left.top.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 150));
    }];
    
    [self.tradersInstructionsView mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.leftMargin.rightMargin.equalTo(self);
        make.top.equalTo(self.awesomeDetailsHeadView.mas_bottom).with.offset(5);
        make.height.mas_offset(self.tradersInstructionsHeight);
    }];
    [self.tradingInformationView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.leftMargin.rightMargin.equalTo(self);
        make.top.equalTo(self.tradersInstructionsView.mas_bottom).with.offset(5);
        make.height.mas_offset(SCREEN_HEIGHT-395);
    }];
    [self.followAction mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.centerX.bottom.equalTo(self);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, 40));
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
        _scroll.contentSize = CGSizeMake(0.5,SCREEN_HEIGHT-64);
    }
    return _scroll;
}
-(AwesomeDetailsHeadView *)awesomeDetailsHeadView{
    if (!_awesomeDetailsHeadView) {
        _awesomeDetailsHeadView = [[AwesomeDetailsHeadView alloc] initWithViewModel:self.viewModel];
        _awesomeDetailsHeadView.layer.shadowOpacity = 0.3;// 阴影透明度
        
        _awesomeDetailsHeadView.layer.shadowColor = [UIColor lightGrayColor].CGColor;// 阴影的颜色
        
        _awesomeDetailsHeadView.layer.shadowRadius = 1;// 阴影扩散的范围控制
        
        _awesomeDetailsHeadView.layer.shadowOffset  = CGSizeMake(0, 1);// 阴影的范围
    }
    return _awesomeDetailsHeadView;
}
-(TradersInstructionsView *)tradersInstructionsView{
    if (!_tradersInstructionsView) {
        _tradersInstructionsView = [[TradersInstructionsView alloc] initWithViewModel:self.viewModel];
    }
    return _tradersInstructionsView;
}
-(TradingInformationView *)tradingInformationView{
    if (!_tradingInformationView) {
        _tradingInformationView = [[TradingInformationView alloc] initWithViewModel:self.viewModel];
        
    }
    return _tradingInformationView;
}
-(UIButton *)followAction{
    if (!_followAction) {
        _followAction = [UIButton buttonWithType:UIButtonTypeCustom];
        _followAction.backgroundColor = RGB(250, 99, 32);
        [_followAction setTitle:@"跟单" forState:UIControlStateNormal];
        [_followAction setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [[_followAction rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
        }];
    }
    return _followAction;
}
-(CGFloat)tradersInstructionsHeight{
    if (!_tradersInstructionsHeight) {
        _tradersInstructionsHeight = 100.0f;
    }
    return _tradersInstructionsHeight;
}
@end
