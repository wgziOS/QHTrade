//
//  TradingSignalsCell.m
//  QHTrade
//
//  Created by user on 2017/7/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "TradingSignalsCell.h"


@interface TradingSignalsCell()
@property(nonatomic,strong)UIImageView *signalsImage;
@property(nonatomic,strong)UILabel *name;//物品名称
@property(nonatomic,strong)UILabel *price;//价格
@property(nonatomic,strong)UILabel *moreEmpty;//开多开空
@property(nonatomic,strong)UILabel *volume;//成交量 列如 100手
@end

@implementation TradingSignalsCell

-(void)setupViews{
    [self.contentView addSubview:self.signalsImage];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.price];
    [self.contentView addSubview:self.moreEmpty];
    [self.contentView addSubview:self.volume];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.signalsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).with.offset(8);
        make.left.equalTo(weakSelf.contentView).with.offset(16);
        make.size.mas_offset(CGSizeMake(10, 10));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).with.offset(4);
        make.left.equalTo(weakSelf.signalsImage.mas_right).with.offset(10);
        make.size.mas_offset(CGSizeMake(86, 42));
    }];
    
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).with.offset(15);
        make.left.equalTo(weakSelf.contentView).with.offset(SCREEN_WIDTH*0.4);
        make.size.mas_offset(CGSizeMake(85, 15));
    }];
    
    [self.moreEmpty mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).with.offset(15);
        make.left.equalTo(weakSelf.contentView).with.offset(SCREEN_WIDTH*0.6);
        make.size.mas_offset(CGSizeMake(32, 15));
    }];
    
    [self.volume mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView).with.offset(15);
        make.left.equalTo(weakSelf.contentView).with.offset(SCREEN_WIDTH*0.8);
        make.size.mas_offset(CGSizeMake(60, 15));
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UIImageView *)signalsImage{
    if (!_signalsImage) {
        _signalsImage = [[UIImageView alloc] init];
        [_signalsImage setImage:[UIImage imageNamed:@"Awesome_TradingSignals"]];
    }
    return _signalsImage;
}
-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont fontWithName:@"STHeitiSC-Light" size:15];
        _name.text = @"2017/03/12\n焦炭1705";
        _name.numberOfLines = 2;
        _name.textAlignment = NSTextAlignmentCenter;
    }
    return _name;
}
-(UILabel *)price{
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.font = [UIFont fontWithName:@"STHeitiSC-Light" size:15];
        _price.text = @"6732";
    }
    return _price;
}
-(UILabel *)moreEmpty{
    if (!_moreEmpty) {
        _moreEmpty = [[UILabel alloc] init];
        _moreEmpty.font = [UIFont fontWithName:@"STHeitiSC-Light" size:15];
        _moreEmpty.text = @"开空";
        
    }
    return _moreEmpty;
}
-(UILabel *)volume{
    if (!_volume) {
        _volume = [[UILabel alloc] init];
        _volume.font = [UIFont fontWithName:@"STHeitiSC-Light" size:15];
        _volume.text = @"10000手";
        
    }
    return _volume;
}
-(void)drawRect:(CGRect)rect{
    int startY = 0;
    int endY = 44;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 2);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 251 / 255.0, 189 / 255.0, 59 / 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 21, startY);  //起点坐标
    CGContextAddLineToPoint(context, 21, endY);   //终点坐标
    
    CGContextStrokePath(context);
}
@end
