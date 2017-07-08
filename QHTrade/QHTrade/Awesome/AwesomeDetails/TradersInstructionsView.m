//
//  TradersInstructionsView.m
//  QHTrade
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "TradersInstructionsView.h"
#import "AwesomeDetailsViewModel.h"



@interface TradersInstructionsView()
@property(nonatomic,strong)AwesomeDetailsViewModel *viewModel;
@property(nonatomic,strong)UILabel *prompt;
@property(nonatomic,strong)UILabel *textBody;
@property(nonatomic,strong)UIButton *switchButton;
@property(nonatomic,assign)CGFloat textBodyHeight;//文本高度

@end

@implementation TradersInstructionsView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (AwesomeDetailsViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.prompt];
    [self addSubview:self.textBody];
    [self addSubview:self.switchButton];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.prompt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).with.offset(10);
        make.left.equalTo(weakSelf).with.offset(16);
        make.size.mas_offset(CGSizeMake(200, 20));
    }];
    
    [self.textBody mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(16);
        make.top.equalTo(weakSelf.prompt.mas_bottom).with.offset(4);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH-32, weakSelf.textBodyHeight));
    }];
    
    [self.switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-1);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-5);
        make.size.mas_offset(CGSizeMake(40, 20));
    }];
}
-(void)bindViewModel{
    [self.viewModel.earningsSumDataSubject subscribeNext:^(id  _Nullable x) {
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}@property(nonatomic,strong)RACSubject *tradersInstructionsOpenSubject;//操作说明展开
*/
-(UILabel *)prompt{
    if (!_prompt){
        _prompt = [[UILabel alloc] init];
        _prompt.text = @"操盘说明:";
        _prompt.textColor = RGB(67, 68, 69);
        _prompt.font = [UIFont systemFontOfSize:12];
    }
    return _prompt;
}
-(UILabel *)textBody{
    if (!_textBody) {
        _textBody = [[UILabel alloc] init];
        _textBody.textColor = RGB(67, 68, 69);
        _textBody.numberOfLines = 1;
        _textBody.text = self.viewModel.tradersInstructionsString;
        _textBody.font = [UIFont systemFontOfSize:12];

    }
    return _textBody;
}
-(UIButton *)switchButton{
    if (!_switchButton) {
        _switchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_switchButton setImage:[UIImage imageNamed:@"Awesome_Switch_image_nomal"] forState:UIControlStateNormal];
        [_switchButton setImage:[UIImage imageNamed:@"Awesome_Switch_image_selected"] forState:UIControlStateSelected];
        WS(weakSelf)
        [[_switchButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x){
            _switchButton.selected = !_switchButton.selected;
            if (weakSelf.viewModel.tradersInstructionsHeight) {
                weakSelf.textBodyHeight = _switchButton.selected == YES ? weakSelf.viewModel.tradersInstructionsHeight:15;
                weakSelf.textBody.numberOfLines =_switchButton.selected == YES ? 0: 1;
                [weakSelf.viewModel.tradersInstructionsOpenSubject
                 sendNext:[NSString stringWithFormat:@"%d",_switchButton.selected]];
                [self updateConstraints];
            }
        }];
    }
    return _switchButton;
}
-(CGFloat)textBodyHeight{
    if (!_textBodyHeight) {
        _textBodyHeight = 15;
    }
    return _textBodyHeight;
}
@end
