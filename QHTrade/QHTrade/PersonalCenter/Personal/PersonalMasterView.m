//
//  PersonalMasterView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalMasterView.h"
#import "PersonalViewModel.h"
#import "PersonalSecondCell.h"
#import "PersonalButtonCell.h"
@interface PersonalMasterView()<UITableViewDelegate,UITableViewDataSource>
{

    CGFloat topViewHeight;
}

@property(nonatomic,strong)PersonalViewModel * viewModel;
@property (nonatomic,strong)UIView *lineView;
@end

@implementation PersonalMasterView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (PersonalViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)bindViewModel{

}
-(void)layoutSubviews{
    WS(weakSelf)
    
    topViewHeight = 50;
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.height.mas_equalTo(topViewHeight);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.topView.mas_bottom);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
    }];
    
    [super layoutSubviews];
}
-(void)setupViews{
    [self addSubview:self.topView];
    [self addSubview:self.tableView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)updateConstraints{


    
    [super updateConstraints];
}

//登录账户
-(void)tradeAccountBtnClick{


    //隐藏topView
//    WS(weakSelf)
    [self updateConstraints];
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top);
//    }];
    topViewHeight = 0;
    [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(0);
    }];

    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:2.0 animations:^{
        [self layoutIfNeeded];
        self.topLogButton.hidden = YES;
        self.topViewLabel.hidden = YES;
        self.topViewLabel1.hidden = YES;

    }];
    //2秒后执行
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(topViewAppear) userInfo:nil repeats:NO];
    
}
-(void)topViewAppear{
//    WS(weakSelf)
    
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(weakSelf.topView.mas_bottom);
//
//    }];
    [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(60);
    }];
//    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:2.0 animations:^{
        [self layoutIfNeeded];
        self.topLogButton.hidden = NO;
        self.topViewLabel.hidden = NO;
        self.topViewLabel1.hidden = NO;
        
    }];
    


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    PersonalSecondCell *colectCell = [tableView dequeueReusableCellWithIdentifier:kPersonalSecondCell];
    PersonalButtonCell * btnCell = [tableView dequeueReusableCellWithIdentifier:kPersonalButtonCell];
    
    switch (indexPath.row) {
        case 0:
        {
            return colectCell;
        }
            break;
        case 1:
        {
            
            btnCell.manageBlock = ^{
                [self.viewModel.middleCellClick sendNext:@"1"];
            };
            btnCell.signalBlock = ^{
                [self.viewModel.middleCellClick sendNext:@"2"];
            };
            btnCell.statisticBlock = ^{
                [self.viewModel.middleCellClick sendNext:@"3"];
            };
            btnCell.reportBlock = ^{
                [self.viewModel.middleCellClick sendNext:@"4"];
            };
            return btnCell;
        }
            break;
        default:
            break;
    }
    return colectCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 135;
    }else return 85;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
#pragma mark -- 交易账户登录按钮
-(UIButton *)topLogButton{

    if (!_topLogButton) {
        _topLogButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_topLogButton setBackgroundColor:RGB(255,98,1)];
        _topLogButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_topLogButton setTitle:@"登录并跟单" forState:UIControlStateNormal];

        [[_topLogButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            [self tradeAccountBtnClick];
            [self.viewModel.tradeAccountLoginBtnClick sendNext:nil];
            
        }];
        
        _topLogButton.layer.cornerRadius = 12.5;
        _topLogButton.layer.masksToBounds = YES;
    }
    return _topLogButton;
}
-(UILabel *)topViewLabel{

    if (!_topViewLabel) {
        _topViewLabel = [[UILabel alloc]init];
        _topViewLabel.text = @"交易账户未登录";
        _topViewLabel.font = [UIFont systemFontOfSize:14.0f];
        _topViewLabel.textColor = RGB(68, 68, 68);
    }
    return _topViewLabel;
}
-(UILabel *)topViewLabel1{

    if (!_topViewLabel1) {
        _topViewLabel1 = [[UILabel alloc]init];
        _topViewLabel1.text = @"交易账户登录后开始自动跟单";
        _topViewLabel1.font = [UIFont systemFontOfSize:12.0f];
        _topViewLabel1.textColor = RGB(68, 68, 68);
    }
    return _topViewLabel1;
}
-(UIView *)lineView{

    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGB(243, 244, 245);
    }
    return _lineView;
}
-(UIView *)topView{

    if (!_topView) {
        _topView = [[UIView alloc]init];
        _topView.backgroundColor = [UIColor whiteColor];
        
        [_topView addSubview:self.topViewLabel];
        
        [_topView addSubview:self.topViewLabel1];
        
        [_topView addSubview:self.topLogButton];
        
        [_topView addSubview:self.lineView];
        
        [self.topLogButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_topView).with.offset(-2.5);
            make.right.equalTo(_topView).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake(90, 25));
        }];
        
        [self.topViewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topView).with.offset(5);
            make.left.equalTo(_topView).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(180, 16));
        }];
        
        [self.topViewLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topViewLabel.mas_bottom).with.offset(0);
            make.left.equalTo(_topView).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(180, 16));
        }];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.bottom.left.right.equalTo(_topView);
            make.height.mas_equalTo(5);
        }];
    }
    return _topView;
}
-(PersonalTableFootView *)tableFootView{

    if (!_tableFootView) {
        _tableFootView = [[PersonalTableFootView alloc]initWithViewModel:self.viewModel];
        _tableFootView.backgroundColor = [UIColor whiteColor];
    }
    return _tableFootView;
}
-(PersonalTabeHeadView *)tableHeadView{

    if (!_tableHeadView) {
        _tableHeadView = [[PersonalTabeHeadView alloc]initWithViewModel:self.viewModel];
        
    }
    return _tableHeadView;
}
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:kPersonalSecondCell bundle:nil] forCellReuseIdentifier:kPersonalSecondCell];
        [_tableView registerNib:[UINib nibWithNibName:kPersonalButtonCell bundle:nil] forCellReuseIdentifier:kPersonalButtonCell];
        
        [_tableView setTableHeaderView:self.tableHeadView];
        [_tableView.tableHeaderView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        [_tableView setTableFooterView:self.tableFootView];
        [_tableView.tableFooterView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    }
    return _tableView;
}

@end
