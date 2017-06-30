//
//  RegisterView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/21.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//
#define QUICKCOLOE [UIColor colorWithRed:80.0/255.0 green:78.0/255.0 blue:78.0/255.0 alpha:1.0f]
#define LINECOLOE [UIColor colorWithRed:177.0/255.0 green:134.0/255.0 blue:65.0/255.0 alpha:1.0f]
#import "RegisterView.h"


@implementation RegisterView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (RegisterViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
        
    }
    return self;
}

-(void)quickBtnClick:(id)sender{

    [self.viewModel.quickSubject sendNext:nil];
}
-(void)codeLblClick{
    
    [self.viewModel.getCodeSubject sendNext:nil];

}
-(void)bindViewModel{
    
}
-(void)setupViews{
    
    [self addSubview:self.topLabel];
    [self addSubview:self.phoneNumTextfield];
    [self addSubview:self.codeTextfield];
    [self addSubview:self.codeLabel];
    [self addSubview:self.passWordTextfield];
    [self addSubview:self.line2];
    [self addSubview:self.line];
    [self addSubview:self.line1];
    [self addSubview:self.quickLoginButton];
    [self addSubview:self.smallLogoImgView];
    [self addSubview:self.registerButton];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    WS(weakSelf)
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).with.offset(45);
        make.right.equalTo(weakSelf).with.offset(-40);
        make.left.equalTo(weakSelf).with.offset(40);
        make.height.mas_offset(25);
    }];
    
    [self.phoneNumTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.topLabel.mas_bottom).with.offset(40);
        make.left.equalTo(weakSelf).with.offset(15);
        make.right.equalTo(weakSelf).with.offset(-15);
        make.height.mas_offset(30);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.phoneNumTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
//        make.centerY.equalTo(weakSelf.forgetButton);
        make.top.equalTo(weakSelf.phoneNumTextfield.mas_bottom).with.offset(25);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [self.codeTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.phoneNumTextfield.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf.codeLabel.mas_left).with.offset(-5);
        make.height.mas_equalTo(30);
    }];
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.codeTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [self.passWordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.codeTextfield.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.passWordTextfield.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [self.quickLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.line2.mas_bottom).with.offset(20);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(125, 30));
    }];
    
    
    [self.smallLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf.quickLoginButton);
        make.right.equalTo(weakSelf.quickLoginButton.mas_left).with.offset(-2);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.quickLoginButton.mas_bottom).with.offset(75);
        make.left.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [super updateConstraints];
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
-(UIButton *)registerButton{
    
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"提交" forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_registerButton setBackgroundImage:[UIImage imageNamed:@"btn_bg_image"] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[UIImage imageNamed:@"btn_unable_bg_image"] forState:UIControlStateDisabled];
    }
    return _registerButton;
}

-(UIImageView *)smallLogoImgView{
    
    if (!_smallLogoImgView) {
        _smallLogoImgView = [[UIImageView alloc]init];
        _smallLogoImgView.image = [UIImage imageNamed:@"login_minilogo"];
    }
    return _smallLogoImgView;
}

-(UIButton *)quickLoginButton{
    
    if (!_quickLoginButton) {
        _quickLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_quickLoginButton setTitle:@"使用奇获账号登录" forState:UIControlStateNormal];
        [_quickLoginButton setTitleColor:QUICKCOLOE forState:UIControlStateNormal];
        _quickLoginButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_quickLoginButton setBackgroundColor:[UIColor whiteColor]];
        [_quickLoginButton addTarget:self action:@selector(quickBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _quickLoginButton;
}

-(UILabel *)codeLabel{

    if (!_codeLabel) {
        _codeLabel = [[UILabel alloc]init];
        _codeLabel.textAlignment = NSTextAlignmentLeft;
        _codeLabel.textColor = RGB(196, 159, 94);
        _codeLabel.font = [UIFont systemFontOfSize:14.0f];
        _codeLabel.text = @"获取验证码";
        _codeLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(codeLblClick)];
        [_codeLabel addGestureRecognizer:tap];
    }
    return _codeLabel;
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

-(UITextField *)codeTextfield{

    if (!_codeTextfield) {
        _codeTextfield = [[UITextField alloc]init];
        _codeTextfield.placeholder = @"请输入验证码";
        _codeTextfield.font = [UIFont systemFontOfSize:15.0f];
        _codeTextfield.borderStyle = UITextBorderStyleNone;
        _codeTextfield.backgroundColor =[UIColor whiteColor];
    }
    return _codeTextfield;
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

-(UILabel *)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.textColor = RGB(83, 82, 82);
        _topLabel.font = [UIFont systemFontOfSize:20];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.text = @"手机号注册";
    }
    return _topLabel;
}
@end
