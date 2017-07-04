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

@interface PersonalMasterView()<UITableViewDelegate,UITableViewDataSource>
{

    CGFloat topViewHeight;
}

@property(nonatomic,strong)PersonalViewModel * viewModel;
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
    
    topViewHeight = 60;
    [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        
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


-(void)tradeAccountBtnClick:(id)sender{


    //隐藏topView
//    WS(weakSelf)
    [self updateConstraints];
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.mas_top);
//    }];
    topViewHeight = 0;
    [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(topViewHeight);
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

    PersonalSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:kPersonalSecondCell];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}

-(UIButton *)topLogButton{

    if (!_topLogButton) {
        _topLogButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_topLogButton setBackgroundColor:[UIColor redColor]];
        [_topLogButton setTitle:@"登录" forState:UIControlStateNormal];
        [_topLogButton addTarget:self action:@selector(tradeAccountBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topLogButton;
}
-(UILabel *)topViewLabel{

    if (!_topViewLabel) {
        _topViewLabel = [[UILabel alloc]init];
        _topViewLabel.text = @"交易账户未登录";
        _topViewLabel.font = [UIFont systemFontOfSize:13.0f];
    }
    return _topViewLabel;
}
-(UILabel *)topViewLabel1{

    if (!_topViewLabel1) {
        _topViewLabel1 = [[UILabel alloc]init];
        _topViewLabel1.text = @"交易账户登录后开始自动跟单";
        _topViewLabel1.font = [UIFont systemFontOfSize:13.0f];
    }
    return _topViewLabel1;
}
-(UIView *)topView{

    if (!_topView) {
        _topView = [[UIView alloc]init];
        _topView.backgroundColor = [UIColor greenColor];
        
        
        [_topView addSubview:self.topViewLabel];
        
        
        [_topView addSubview:self.topViewLabel1];
        
        [_topView addSubview:self.topLogButton];
        
        [self.topLogButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_topView);
            make.right.equalTo(_topView).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake(70, 30));
        }];
        
        [self.topViewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topView).with.offset(8);
            make.left.equalTo(_topView).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(180, 20));
        }];
        
        [self.topViewLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topViewLabel.mas_bottom).with.offset(5);
            make.left.equalTo(_topView).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(180, 20));
        }];
        
        
    }
    return _topView;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:kPersonalSecondCell bundle:nil] forCellReuseIdentifier:kPersonalSecondCell];
        [_tableView.tableHeaderView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 125)];
    
    }
    return _tableView;
}

@end
