//
//  PersonalTabeHeadView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalTabeHeadView.h"

@interface PersonalTabeHeadView ()

@end

@implementation PersonalTabeHeadView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (PersonalViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)addChildView{

    [self addSubview:self.headImgView];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.IdLabel];
    [self addSubview:self.sexImgView];
    [self addSubview:self.diamondButton];
    [self addSubview:self.setButton];
//    [self addSubview:self.lineView];
    
    WS(weakSelf)
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).with.offset(5);
        make.left.equalTo(weakSelf.headImgView.mas_right).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(60, 18));
    }];
    
    [self.sexImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf.nickNameLabel);
        make.left.equalTo(weakSelf.nickNameLabel.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(11, 11));
    }];
    
    [self.IdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.nickNameLabel.mas_bottom).with.offset(3);
        make.left.equalTo(weakSelf.headImgView.mas_right).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
    [self.diamondButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.nickNameLabel.mas_bottom).with.offset(0);
        make.centerY.equalTo(weakSelf.IdLabel);
        make.left.equalTo(weakSelf.IdLabel.mas_right).with.offset(8);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [self.setButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
}


-(UIView *)lineView{
    
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor redColor];
    }
    return _lineView;
}
-(UILabel *)IdLabel{

    if (!_IdLabel) {
        _IdLabel = [[UILabel alloc]init];
        _IdLabel.font = [UIFont systemFontOfSize:12.0f];
        _IdLabel.textColor = RGB(68, 68, 68);
        _IdLabel.text = @"ID:000";
    }
    return _IdLabel;
}
-(UIButton *)setButton{
    
    if (!_setButton) {
        _setButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setButton setBackgroundImage:[UIImage imageNamed:@"personal_shezhi"] forState:UIControlStateNormal];
        
        [[_setButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.viewModel.setBtnClick sendNext:nil];
        }];
    }
    return _setButton;
}

-(UIButton *)diamondButton{
    
    if (!_diamondButton) {
        _diamondButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_diamondButton setImage:[UIImage imageNamed:@"personal_zuanshi"] forState:UIControlStateNormal];
        [_diamondButton setTitle:@"0000" forState:UIControlStateNormal];
        _diamondButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_diamondButton setTitleColor:RGB(68, 68, 68) forState:UIControlStateNormal];

        [[_diamondButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.viewModel.diamondBtnClick sendNext:nil];
        }];
    }
    return _diamondButton;
}
-(UIImageView *)sexImgView{
    
    if (!_sexImgView) {
        _sexImgView = [[UIImageView alloc]init];
        _sexImgView.image = [UIImage imageNamed:@"personal_woman_icon"];
    }
    return _sexImgView;
}
-(UILabel *)nickNameLabel{
    
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc]init];
        _nickNameLabel.font = [UIFont systemFontOfSize:16.0f];
        _nickNameLabel.textColor = RGB(100, 100, 100);
        _nickNameLabel.text = @"昵称";
    }
    return _nickNameLabel;
}
-(UIImageView *)headImgView{

    if (!_headImgView) {
        _headImgView = [[UIImageView alloc]init];
        _headImgView.image = [UIImage imageNamed:@"login_biglogo"];
        _headImgView.layer.cornerRadius = 15;
        _headImgView.layer.masksToBounds = YES;
        
//        _headImgView.userInteractionEnabled = YES;
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
//        [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
//            [self.viewModel.headImgClick sendNext:nil];
//        }];
//        [_headImgView addGestureRecognizer:tap];
    };
    return _headImgView;
}

@end
