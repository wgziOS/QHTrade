//
//  LoginView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/9.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#define LINECOLOE [UIColor colorWithRed:177.0/255.0 green:134.0/255.0 blue:65.0/255.0 alpha:1.0f]
#define FORGETCOLOE [UIColor colorWithRed:196.0/255.0 green:159.0/255.0 blue:81.0/255.0 alpha:1.0f]
#define QUICKCOLOE [UIColor colorWithRed:80.0/255.0 green:78.0/255.0 blue:78.0/255.0 alpha:1.0f]
#import "LoginView.h"


@interface LoginView ()

@end

@implementation LoginView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (LoginViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setupViews];

    }
    return self;
}
-(void)bindViewModel{
    
}
-(void)quickBtnClick:(id)sender{
    
    [self.viewModel.quickSubject sendNext:nil];
}
-(void)forgetBtnClick:(id)sender{
    
    [self.viewModel.forgetSubject sendNext:nil];
}

-(void)setupViews{

    [self addSubview:self.logoImageView];
    [self addSubview:self.phoneNumTextfield];
    [self addSubview:self.line];
    [self addSubview:self.passWordTextfield];
    [self addSubview:self.line1];
    [self addSubview:self.forgetButton];
    [self addSubview:self.quickLoginButton];
    [self addSubview:self.smallLogoImgView];
    [self addSubview:self.loginButton];
    
    [self setNeedsUpdateConstraints];
//    [self updateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    WS(weakself)
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf).with.offset(45);
        make.size.mas_offset(CGSizeMake(85, 85));
    }];
    
    [self.phoneNumTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logoImageView.mas_bottom).with.offset(40);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.phoneNumTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [self.passWordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.phoneNumTextfield.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.passWordTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.line1.mas_bottom).with.offset(30);
        make.left.equalTo(weakSelf).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(95, 30));
    }];
    
    [self.quickLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.forgetButton);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(165, 30));
    }];
    
    
    [self.smallLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.quickLoginButton);
        make.right.equalTo(weakSelf.quickLoginButton.mas_left).with.offset(-2);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.forgetButton.mas_bottom).with.offset(100);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(40);
    }];

    [super updateConstraints];
}



-(UIButton *)loginButton{
    
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"btn_bg_image"] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"btn_unable_bg_image"] forState:UIControlStateDisabled];
    
    }
    return _loginButton;
}

-(UIButton *)quickLoginButton{
    
    if (!_quickLoginButton) {
        _quickLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_quickLoginButton setTitle:@"使用奇获账号可直接登录" forState:UIControlStateNormal];
        [_quickLoginButton setTitleColor:QUICKCOLOE forState:UIControlStateNormal];
        _quickLoginButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_quickLoginButton setBackgroundColor:[UIColor whiteColor]];
        [_quickLoginButton addTarget:self action:@selector(quickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _quickLoginButton;
}

-(UIButton *)forgetButton{

    if (!_forgetButton) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetButton setTitle:@"忘记密码了？" forState:UIControlStateNormal];
        [_forgetButton setTitleColor:FORGETCOLOE forState:UIControlStateNormal];
        _forgetButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_forgetButton setBackgroundColor:[UIColor whiteColor]];
        [_forgetButton addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetButton;
}

-(UITextField *)passWordTextfield{

    if (!_passWordTextfield) {
        _passWordTextfield = [[UITextField alloc]init];
        _passWordTextfield.placeholder = @"请输入密码";
        _passWordTextfield.font = [UIFont systemFontOfSize:15.0f];
        _passWordTextfield.borderStyle = UITextBorderStyleNone;
        _passWordTextfield.secureTextEntry = YES;
    }
    return _passWordTextfield;
}

-(UITextField *)phoneNumTextfield{
    
    if (!_phoneNumTextfield) {
        _phoneNumTextfield = [[UITextField alloc]init];
        _phoneNumTextfield.placeholder = @"请输入手机号";
        _phoneNumTextfield.font = [UIFont systemFontOfSize:15.0f];
        _phoneNumTextfield.borderStyle = UITextBorderStyleNone;
        _phoneNumTextfield.backgroundColor =[UIColor whiteColor];
    }
    return _phoneNumTextfield;
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

-(UIImageView *)smallLogoImgView{

    if (!_smallLogoImgView) {
        _smallLogoImgView = [[UIImageView alloc]init];
        _smallLogoImgView.image = [UIImage imageNamed:@"login_minilogo"];
    }
    return _smallLogoImgView;
}

-(UIImageView *)logoImageView{

    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]init];
        _logoImageView.image = [UIImage imageNamed:@"login_biglogo"];//
    }
    return _logoImageView;
}


@end

