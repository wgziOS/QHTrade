//
//  PersonalHeadView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//
#define NICK_COLOR [UIColor colorWithRed:71.0/255.0 green:71.0/255.0 blue:71.0/255.0 alpha:1.0f]
#define ID_COLOR [UIColor colorWithRed:107.0/255.0 green:107.0/255.0 blue:107.0/255.0 alpha:1.0f]
#define FANS_COLOR [UIColor colorWithRed:142.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0f]
#import "PersonalHeadView.h"


@interface PersonalHeadView()
/*
@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) UILabel *nickNameLabel;//头像
@property (nonatomic,strong) UIImageView *sexImgView;//性别
@property (nonatomic,strong) UILabel *yearLabel;//年龄
@property (nonatomic,strong) UILabel *IDLabel;
@property (nonatomic,strong) UILabel *companyLabel;//公司信息
@property (nonatomic,strong) UIImageView *locationImgView;//定位小图片
@property (nonatomic,strong) UILabel *addressLabel;//常住地信息
@property (nonatomic,strong) UILabel *focusLabel;//关注数
@property (nonatomic,strong) UILabel *fansLabel;//粉丝数
@property (nonatomic,strong) UIImageView *diamondImgView;
@property (nonatomic,strong) UILabel *diamondLabel;//钻石数
@property (nonatomic,strong) UIImageView *questionImgView;//问号图片
@property (nonatomic,strong) UILabel *todayVisitorLabel;//今日访客
@property (nonatomic,strong) UILabel *totalVisitorsLabel;//总的访客量
 */
@end

@implementation PersonalHeadView


-(instancetype)initWithFrame:(CGRect)frame{
    
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
    [self addSubview:self.sexImgView];
    [self addSubview:self.yearLabel];
    [self addSubview:self.IDLabel];
    [self addSubview:self.companyLabel];
    [self addSubview:self.locationImgView];
    [self addSubview:self.addressLabel];
    [self addSubview:self.focusLabel];
    [self addSubview:self.fansLabel];
    [self addSubview:self.diamondLabel];
    [self addSubview:self.diamondImgView];
    [self addSubview:self.questionImgView];
    [self addSubview:self.todayVisitorLabel];
    [self addSubview:self.totalVisitorsLabel];
    
    
    self.yearLabel.text = @"30岁";
    
    WS(weakself)
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).with.offset(15);
        make.left.equalTo(weakSelf).with.offset(15);
        make.size.mas_offset(CGSizeMake(60, 60));
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).with.offset(15);
        make.left.equalTo(weakSelf.headImgView.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(75, 20));
    }];
    
    [self.sexImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).with.offset(20.5);
        make.left.equalTo(weakSelf.nickNameLabel.mas_right).with.offset(3);
        make.size.mas_offset(CGSizeMake(11, 11));
    }];
    
    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf).with.offset(15);
        make.left.equalTo(weakSelf.sexImgView.mas_right).with.offset(3);
        make.size.mas_offset(CGSizeMake(35, 20));
    }];
    
    [self.IDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nickNameLabel.mas_bottom).with.offset(3);
        make.left.equalTo(weakSelf.headImgView.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(65, 16));
    }];
    
    [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.IDLabel.mas_bottom).with.offset(2);
        make.left.equalTo(weakSelf.headImgView.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(95, 16));
    }];
    
    [self.locationImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.companyLabel.mas_bottom).with.offset(5);
        make.left.equalTo(weakSelf.headImgView.mas_right).with.offset(15);
        make.size.mas_offset(CGSizeMake(8, 11));
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.top.equalTo(weakSelf.companyLabel.mas_bottom).with.offset(12);
        make.centerY.equalTo(weakSelf.locationImgView);
        make.left.equalTo(weakSelf.locationImgView.mas_right).with.offset(3);
        make.size.mas_offset(CGSizeMake(120, 16));
    }];
    
    [self.focusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.headImgView.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(25);
        make.size.mas_offset(CGSizeMake(75, 20));
    }];
    
    [self.fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf.focusLabel);
        make.left.equalTo(weakSelf.focusLabel.mas_right).with.offset(20);
        make.size.mas_offset(CGSizeMake(75, 20));
    }];
    
    //钻石
    [self.questionImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.focusLabel);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.size.mas_offset(CGSizeMake(18, 18));
    }];
    
    [self.diamondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.focusLabel);
        make.right.equalTo(weakSelf.questionImgView.mas_left).with.offset(-3);
        make.size.mas_offset(CGSizeMake(65, 20));
    }];
    
    [self.diamondImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.focusLabel);
        make.right.equalTo(weakSelf.diamondLabel.mas_left).with.offset(-2);
        make.size.mas_offset(CGSizeMake(22, 17));
    }];
    
    //访客
    
    [self.todayVisitorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(weakSelf.companyLabel);
        make.right.equalTo(weakSelf).with.offset(-15);
        make.size.mas_offset(CGSizeMake(90, 20));
    }];
    
    [self.totalVisitorsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(weakSelf.addressLabel);
        make.right.equalTo(weakSelf).with.offset(-15);
        make.size.mas_offset(CGSizeMake(90, 20));
    }];
}

-(UILabel *)totalVisitorsLabel{
    if (!_totalVisitorsLabel) {
        _totalVisitorsLabel = [[UILabel alloc]init];
        _totalVisitorsLabel.font = [UIFont systemFontOfSize:12.0f];
        _totalVisitorsLabel.textColor = ID_COLOR;

        _totalVisitorsLabel.text = @"总访客量 | XXX";
    }
    return _totalVisitorsLabel;
    
}
-(UILabel *)todayVisitorLabel{
    if (!_todayVisitorLabel) {
        _todayVisitorLabel = [[UILabel alloc]init];
        _todayVisitorLabel.font = [UIFont systemFontOfSize:12.0f];
        _todayVisitorLabel.textColor = ID_COLOR;

        _todayVisitorLabel.text = @"今日访客 | XXX";
    }
    return _todayVisitorLabel;
    
}

-(UIImageView *)questionImgView{

    if (!_questionImgView) {
        _questionImgView = [[UIImageView alloc]init];
        _questionImgView.image = [UIImage imageNamed:@"personal_question_icon"];
    }
    return _questionImgView;
}
-(UILabel *)diamondLabel{
    
    if (!_diamondLabel) {
        _diamondLabel = [[UILabel alloc]init];
        _diamondLabel.font = [UIFont systemFontOfSize:14.0f];
        _diamondLabel.textColor = FANS_COLOR;
        _diamondLabel.text  = @"钻石 XX";
    }
    return _diamondLabel;
}
-(UIImageView *)diamondImgView{

    if (!_diamondImgView) {
        _diamondImgView = [[UIImageView alloc]init];
        _diamondImgView.image = [UIImage imageNamed:@"personal_diamond_icon"];
        
    }
    return _diamondImgView;
}
-(UILabel *)fansLabel{
    if (!_fansLabel) {
        _fansLabel = [[UILabel alloc]init];
        _fansLabel.font = [UIFont systemFontOfSize:14.0f];
        _fansLabel.textColor = FANS_COLOR;
        _fansLabel.text = @"粉丝：XX";
    }
    return _fansLabel;
    
}
-(UILabel *)focusLabel{
    if (!_focusLabel) {
        _focusLabel = [[UILabel alloc]init];
        _focusLabel.font = [UIFont systemFontOfSize:14.0f];
        _focusLabel.textColor = FANS_COLOR;
        _focusLabel.text = @"关注：XX";
    }
    return _focusLabel;
    
}
-(UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:12.0f];
        _addressLabel.textColor = ID_COLOR;
        _addressLabel.text = @"XXKM 常住地 XX XX";
    }
    return _addressLabel;
    
}
-(UIImageView *)locationImgView{

    if (!_locationImgView) {
        _locationImgView = [[UIImageView alloc]init];
        _locationImgView.image = [UIImage imageNamed:@"personal_location_icon"];
    }
    return _locationImgView;

}
-(UILabel *)companyLabel{
    if (!_companyLabel) {
        _companyLabel = [[UILabel alloc]init];
        _companyLabel.font = [UIFont systemFontOfSize:12.0f];
        _companyLabel.textColor = ID_COLOR;
        _companyLabel.text = @"XX公司 职员";
    }
    return _companyLabel;
    
}

-(UILabel *)IDLabel{
    if (!_IDLabel) {
        _IDLabel = [[UILabel alloc]init];
        _IDLabel.font = [UIFont systemFontOfSize:12.0f];
        _IDLabel.textColor = ID_COLOR;
        _IDLabel.text = @"ID:";
    }
    return _IDLabel;
    
}

-(UILabel *)yearLabel{
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc]init];
        _yearLabel.font = [UIFont systemFontOfSize:12.0f];
        _yearLabel.textColor = ID_COLOR;
    }
    return _yearLabel;

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
        _nickNameLabel.textColor = NICK_COLOR;
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
    };
    return _headImgView;
}
@end
