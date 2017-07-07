//
//  FollowEarningChooseCell.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningChooseCell.h"

@interface FollowEarningChooseCell()
@property(nonatomic,strong)UIButton *selecBtn;//选中按钮
@property(nonatomic,strong)UILabel *titleLabel;//标题
@property(nonatomic,strong)UILabel *text;//标题
@property(nonatomic,strong)UILabel *priceLabel;//价格
@property(nonatomic,strong)UILabel *unit;//单元
@property(nonatomic,strong)UIImageView *diamond;//图标
@end

@implementation FollowEarningChooseCell

-(void)setupViews{
    [self.contentView addSubview:self.selecBtn];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.text];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.diamond];
    [self.contentView addSubview:self.unit];
    [self.contentView setBackgroundColor:RGB(243, 244, 243)];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    
}

-(void)updateConstraints{
    [super updateConstraints];
    [self.selecBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10);
        make.left.equalTo(self.contentView).with.offset(16);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10);
        make.left.equalTo(self.selecBtn.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(100, 15));
    }];
    [self.text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.selecBtn.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(278, 15));
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10);
        make.right.equalTo(self.diamond.mas_left);
        make.size.mas_offset(CGSizeMake(28, 20));
    }];
    [self.diamond mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(13);
        make.right.equalTo(self.unit.mas_left);
        make.size.mas_offset(CGSizeMake(16, 15));
    }];
    [self.unit mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-9);
        make.size.mas_offset(CGSizeMake(18, 20));
    }];
}

-(void)setTextBody:(NSString *)textBody{
    self.text.text = textBody;
}
-(void)setPrice:(NSString *)price{
    self.priceLabel.text = price;
}
-(void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    self.selecBtn.selected = selected;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIButton *)selecBtn{
    if (!_selecBtn) {
        _selecBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selecBtn setImage:[UIImage imageNamed:@"Awesome_FollowAction_choose_Normal"] forState:UIControlStateNormal];
        [_selecBtn setImage:[UIImage imageNamed:@"Awesome_FollowAction_choose_Selected"] forState:UIControlStateSelected];
        _selecBtn.userInteractionEnabled = NO;
//        if (self.tag == 0) {
            _selecBtn.selected = YES;
//        }
    }
    return _selecBtn;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = RGB(50, 51, 51);
    }
    return _titleLabel;
}

-(UILabel *)text{
    if (!_text) {
        _text = [[UILabel alloc] init];
        _text.textColor = RGB(84, 85, 86);
        _text.font = [UIFont systemFontOfSize:12];
    }
    return _text;
}

-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = RGB(84, 85, 86);
        _priceLabel.textAlignment = NSTextAlignmentRight;
    }
    return _priceLabel;
}
//钻石图标
-(UIImageView *)diamond{
    if (!_diamond) {
        _diamond = [[UIImageView alloc] init];
        _diamond.image = [UIImage imageNamed:@"Awesome_FollowChoose_diamond"];
    }
    return _diamond;
}
-(UILabel *)unit{
    if (!_unit) {
        _unit = [[UILabel alloc] init];
        _unit.font = [UIFont systemFontOfSize:12];
        _unit.textColor = RGB(84, 85, 86);
        _unit.text = @"/月";
    }
    return _unit;
}
@end
