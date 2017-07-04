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
@property(nonatomic,strong)UILabel *title;//标题
@property(nonatomic,strong)UILabel *price;//价格
@end

@implementation FollowEarningChooseCell

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
        [_selecBtn setTitle:@"选中" forState:UIControlStateNormal];
        [_selecBtn setTitle:@"未选中" forState:UIControlStateNormal];
    }
    return _selecBtn;
}
-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.text = @"订阅信号\n仅订阅牛人成交信号，不自动跟单";
    }
    return _title;
}
-(UILabel *)price{
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.text = @"30钻石/月";
    }
    return _price;
}
@end
