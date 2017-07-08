//
//  TradeAccountMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#define LINECOLOE [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0f]
#import "TradeAccountMainView.h"

@interface TradeAccountMainView ()

@end


@implementation TradeAccountMainView


-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (TradeAccountViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}
-(void)layoutSubviews{
    
    WS(weakSelf)
    
    [self.companyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).with.offset(35);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.companyTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf.companyImgView);
        make.left.equalTo(weakSelf.companyImgView.mas_right).with.offset(12);
        make.right.equalTo(weakSelf).with.offset(-66);
        make.height.mas_equalTo(30);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.companyTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(58);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
   
    [self.searchImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.companyTextfield);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    
    [self.accountTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.companyTextfield.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(58);
        make.right.equalTo(weakSelf).with.offset(-5);
        make.height.mas_equalTo(30);
    }];
    
    [self.accountImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.accountTextfield).with.offset(-2);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.accountTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(58);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    
    [self.passWordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.accountTextfield.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(58);
        make.right.equalTo(weakSelf).with.offset(-5);
        make.height.mas_equalTo(30);
    }];
    
    [self.passwordImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.passWordTextfield).with.offset(-2);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.passWordTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(58);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    
    [self.shengmingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.line2.mas_bottom).with.offset(15);
        make.left.equalTo(weakSelf).with.offset(40);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.height.mas_equalTo(20);
    }];
    
    [self.tickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf.shengmingLabel);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_offset(CGSizeMake(20, 20));
    }];
    
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.shengmingLabel.mas_bottom).with.offset(45);
        make.left.equalTo(weakSelf).with.offset(16);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.height.mas_equalTo(40);
    }];

    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.loginButton.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf).with.offset(16);
        make.right.equalTo(weakSelf);
        make.height.mas_equalTo(20);
        
    }];
    
    
    [super layoutSubviews];
}
-(void)setupViews{
    
    [self addSubview:self.companyTextfield];
    [self addSubview:self.companyImgView];
    [self addSubview:self.line];
    [self addSubview:self.searchImgView];
    [self addSubview:self.accountTextfield];
    [self addSubview:self.accountImgView];
    [self addSubview:self.line1];
    [self addSubview:self.passwordImgView];
    [self addSubview:self.passWordTextfield];
    [self addSubview:self.line2];
    [self addSubview:self.tickButton];
    [self addSubview:self.shengmingLabel];
    [self addSubview:self.loginButton];
    [self addSubview:self.bottomLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{

    [super updateConstraints];
}

-(void)bindViewModel{

}

-(void)tickBtnClick:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        NSLog(@"选中");
        [self.viewModel.tickClickSubject sendNext:@"1"];
    }else{
        
        NSLog(@"未选中");
        [self.viewModel.tickClickSubject sendNext:@"0"];
    }
}
-(UIButton *)tickButton{
    
    if (!_tickButton) {
        _tickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _tickButton.selected = NO;
        [_tickButton setImage:[UIImage imageNamed:@"register_tickBtn"] forState:UIControlStateNormal];
        [_tickButton setImage:[UIImage imageNamed:@"register_tickBtn_xuan"] forState:UIControlStateSelected];
        [_tickButton addTarget:self action:@selector(tickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tickButton;
}

-(UILabel *)bottomLabel{
    
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]init];
        _bottomLabel.textAlignment = NSTextAlignmentLeft;
        _bottomLabel.textColor = RGB(68,68,68);
        _bottomLabel.font = [UIFont systemFontOfSize:12.0f];
        
        _bottomLabel.text = @"说明：暂只支持CTP账户，如需开通TCP账户请咨询开户公司。";
        
    }
    return _bottomLabel;
    
}
-(UILabel *)shengmingLabel{
    
    if (!_shengmingLabel) {
        _shengmingLabel = [[UILabel alloc]init];
        _shengmingLabel.textAlignment = NSTextAlignmentLeft;
        _shengmingLabel.textColor = RGB(254,104,12);
        _shengmingLabel.font = [UIFont systemFontOfSize:12.0f];
        
        _shengmingLabel.text = @"《跟单协议及免责声明》";
        _shengmingLabel.userInteractionEnabled = YES;
        
    }
    return _shengmingLabel;
}

-(UIView *)line2{
    
    if (!_line2) {
        _line2 =[[UIView alloc]init];
        _line2.backgroundColor = LINECOLOE;
    }
    return _line2;
}
-(UIView *)line1{
    
    if (!_line1) {
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = LINECOLOE;
    }
    return _line1;
}

-(UIView *)line{
    
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = LINECOLOE;
    }
    return _line;
}
-(UIButton *)loginButton{
    
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"btn_ablebg_image"] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"btn_unable_bg_image"] forState:UIControlStateDisabled];
    }
    return _loginButton;
}



-(UITextField *)passWordTextfield{
    
    if (!_passWordTextfield) {
        _passWordTextfield = [[UITextField alloc]init];
        _passWordTextfield.placeholder = @"请输入登录密码";
        _passWordTextfield.font = [UIFont systemFontOfSize:15.0f];
        _passWordTextfield.borderStyle = UITextBorderStyleNone;
        _passWordTextfield.secureTextEntry = YES;
    }
    return _passWordTextfield;
}

-(UITextField *)accountTextfield{
    
    if (!_accountTextfield) {
        _accountTextfield = [[UITextField alloc]init];
        _accountTextfield.placeholder = @"请输入资金账户";
        _accountTextfield.font = [UIFont systemFontOfSize:15.0f];
        _accountTextfield.borderStyle = UITextBorderStyleNone;
        _accountTextfield.backgroundColor =[UIColor whiteColor];
    }
    return _accountTextfield;
}
-(UITextField *)companyTextfield{
    
    if (!_companyTextfield) {
        _companyTextfield = [[UITextField alloc]init];
        _companyTextfield.placeholder = @"瑞达期货";
        _companyTextfield.font = [UIFont systemFontOfSize:15.0f];
        _companyTextfield.borderStyle = UITextBorderStyleNone;
        _companyTextfield.backgroundColor =[UIColor whiteColor];
    }
    return _companyTextfield;
}
-(UIImageView *)passwordImgView{
    
    if (!_passwordImgView) {
        _passwordImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"register_mima"]];
        
    }
    return _passwordImgView;
}
-(UIImageView *)companyImgView{
    
    if (!_companyImgView) {
        _companyImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tradeAccount_kaihugongsi"]];
        
    }
    return _companyImgView;
}
-(UIImageView *)accountImgView{
    
    if (!_accountImgView) {
        _accountImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tradeAccount_zijinzhanghu"]];
        
    }
    return _accountImgView;
}

-(UIImageView *)searchImgView{
    
    if (!_searchImgView) {
        _searchImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tradeAccount_sousuo"]];
        _searchImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [[tap rac_gestureSignal] subscribeNext:^(id x) {
            [self.viewModel.searchSubject sendNext:nil];
        }];
        [_searchImgView addGestureRecognizer:tap];
    }
    return _searchImgView;
}


@end
