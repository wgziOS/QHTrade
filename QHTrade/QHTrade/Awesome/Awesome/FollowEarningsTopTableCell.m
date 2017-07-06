//
//  FollowEarningsTopTableCell.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningsTopTableCell.h"

@interface FollowEarningsTopTableCell()
@property(nonatomic,strong)UIImageView *icon;//头像
@property(nonatomic,strong)UILabel *name;//名称
@property(nonatomic,strong)UILabel *followAmount;//跟单人数
@property(nonatomic,strong)UILabel *earningsRate;//收益率
@property(nonatomic,strong)UILabel *totalProfit;//总盈利
@end


@implementation FollowEarningsTopTableCell
-(void)setupViews{
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.followAmount];
    [self.contentView addSubview:self.earningsRate];
    [self.contentView addSubview:self.totalProfit];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.icon.mas_right);
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(80,15));
    }];
    [self.followAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.icon.mas_right);
        make.top.equalTo(weakSelf.name.mas_bottom).with.offset(10);
        make.size.mas_offset(CGSizeMake(80,15));
    }];
    [self.earningsRate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView).with.offset(SCREEN_WIDTH*0.5);
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(50,32));
    }];
    [self.totalProfit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-10);
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.size.mas_offset(CGSizeMake(50,32));
    }];
}
-(NSAttributedString*)labelAddAttributedStringWith:(NSString*)text withRange:(NSRange)range{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    paragraph.lineSpacing = 2; // 行距
    NSDictionary *attributedDic = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGB(87, 88, 89),NSParagraphStyleAttributeName:paragraph};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributedDic];
    [attributedString addAttribute:NSForegroundColorAttributeName value:RGB(156, 157, 158) range:range];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:range];
    return attributedString;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor greenColor];
    }
    return _icon;
}
-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:15];
        _name.text = @"I'm rookie";
        
    }
    return _name;
}
-(UILabel *)followAmount{
    if (!_followAmount) {
        _followAmount = [[UILabel alloc] init];
        _followAmount.font = [UIFont systemFontOfSize:13];
        _followAmount.text = @"跟单:1341人";
    }
    return _followAmount;
}
-(UILabel *)earningsRate{
    if (!_earningsRate) {
        _earningsRate = [[UILabel alloc] init];
        _earningsRate.attributedText = [self labelAddAttributedStringWith:@"收益率\n818%" withRange:NSMakeRange(0, 3)];
        _earningsRate.numberOfLines =2;
    }
    return _earningsRate;
}
-(UILabel *)totalProfit{
    if (!_totalProfit) {
        _totalProfit = [[UILabel alloc] init];
        _totalProfit.attributedText = [self labelAddAttributedStringWith:@"总盈利\n1234567890" withRange:NSMakeRange(0, 3)];
        _totalProfit.numberOfLines =2;
    }
    return _totalProfit;
}
@end
