//
//  RegisterView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/21.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseView.h"
#import "RegisterViewModel.h"

@interface RegisterView : BaseView

@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UITextField *phoneNumTextfield;
@property (nonatomic,strong) UITextField *codeTextfield;
@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UITextField *passWordTextfield;

@property (nonatomic,strong) UIImageView *smallLogoImgView;
@property (nonatomic,strong) UIButton *quickLoginButton;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIView *line1;
@property (nonatomic,strong) UIView *line2;

@property (nonatomic,strong) RegisterViewModel *viewModel;
@end
