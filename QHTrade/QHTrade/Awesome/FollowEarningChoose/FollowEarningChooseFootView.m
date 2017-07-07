//
//  FollowEarningChooseFootView.m
//  QHTrade
//
//  Created by user on 2017/7/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningChooseFootView.h"

@interface FollowEarningChooseFootView()
@property(nonatomic,strong)UILabel *prompt;
@end



@implementation FollowEarningChooseFootView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.prompt];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UILabel *)prompt{
    if (!_prompt) {
        _prompt = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, SCREEN_WIDTH-32, self.frame.size.height)];
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineSpacing = 2; // 行距
        NSDictionary *attributedDic = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGB(85, 86, 87),NSParagraphStyleAttributeName:paragraph};
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"跟单说明：\n跟单后按照牛人的成交手数1比1跟单，若发生滑点情况，2秒内不能成交，撤单，以牛人成交价+1跳跟单，2秒内不能成交，撤单并再加2跳点后再报；再报后2秒内还不能成交，撤单，以再加2跳点再报，如还未成交则牛人该笔交易不跟单。\n半自动跟单需用户每日两次登录资金账户后，才会开始自动跟单，登录一次持续一个白盘或夜盘。" attributes:attributedDic];
        [attributedString addAttribute:NSForegroundColorAttributeName value:RGB(50, 51, 52) range:NSMakeRange(0, 5)];
        _prompt.attributedText = attributedString;
        _prompt.numberOfLines =0;
    }
    return _prompt;
}
@end
