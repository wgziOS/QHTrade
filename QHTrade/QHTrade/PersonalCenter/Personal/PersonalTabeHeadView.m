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
    [self addSubview:self.lineView];
    
    

}
/*
 @property (nonatomic,strong) UIImageView *headImgView;
 @property (nonatomic,strong) UILabel *nickNameLabel;
 @property (nonatomic,strong) UILabel *IdLabel;
 @property (nonatomic,strong) UIImageView *sexImgView;
 @property (nonatomic,strong) UIButton *diamondButton;
 @property (nonatomic,strong) UIButton *setButton;
 @property (nonatomic,strong) UIView *lineView;
*/
-(UIButton *)diamondButton{
    
    if (!_diamondButton) {
        _diamondButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _diamondImgView.image = [UIImage imageNamed:@"personal_diamond_icon"];
        
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
        _headImgView.layer.cornerRadius = 30;
        _headImgView.layer.masksToBounds = YES;
        _headImgView.image = [UIImage imageNamed:@"login_biglogo"];
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
