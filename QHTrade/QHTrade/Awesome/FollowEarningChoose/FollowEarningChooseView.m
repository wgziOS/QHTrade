//
//  FollowEarningChooseView.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningChooseView.h"
#import "FollowEarningChooseViewModel.h"
#import "FollowEarningChooseCell.h"
#import "FollowEarningChooseHeadView.h"
#import "FollowEarningChooseFootView.h"

@interface FollowEarningChooseView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)FollowEarningChooseViewModel *viewModel;
@property(nonatomic,strong)FollowEarningChooseHeadView *headView;
@property(nonatomic,strong)FollowEarningChooseFootView *footView;
@property(nonatomic,strong)NSMutableArray *textArray;
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray *priceArray;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UIButton *surePay;
@property(nonatomic,assign)int selectedIndex;
@end

@implementation FollowEarningChooseView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FollowEarningChooseViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self addSubview:self.table];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   
    NSString *text = [NSString stringWithFormat:@"跟单说明：\n跟单后按照牛人的成交手数1比1跟单，若发生滑点情况，2秒内不能成交，撤单，以牛人成交价+1跳跟单，2秒内不能成交，撤单并再加2跳点后再报；再报后2秒内还不能成交，撤单，以再加2跳点再报，如还未成交则牛人该笔交易不跟单。\n半自动跟单需用户每日两次登录资金账户后，才会开始自动跟单，登录一次持续一个白盘或夜盘。"];
    CGSize size = [NSAttributedString getTextSizeWithText:text withMaxSize:CGSizeMake(SCREEN_WIDTH-32, MAXFLOAT) withLineSpacing:2];
    return size.height+10;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FollowEarningChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([FollowEarningChooseCell class])]];
    cell.textBody = self.textArray[indexPath.row];
    cell.price = self.priceArray[indexPath.row];
    cell.title = self.titleArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = (int)indexPath.row;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.dataSource = self;
        _table.delegate = self;
        _table.tableHeaderView = self.headView;
        _table.tableFooterView = [self viewWithSurePay];
        [_table registerClass:[FollowEarningChooseCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([FollowEarningChooseCell class])]];
    }
    return _table;
}
-(FollowEarningChooseHeadView *)headView{
    if (!_headView) {
        _headView = [[FollowEarningChooseHeadView alloc] initWithViewModel:self.viewModel];
        [_headView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 210)];
    }
    return _headView;
}
-(FollowEarningChooseFootView *)footView{
    if (!_footView) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:2];
        NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:[UIFont systemFontOfSize:12]};
        NSString *text = [NSString stringWithFormat:@"跟单说明：\n跟单后按照牛人的成交手数1比1跟单，若发生滑点情况，2秒内不能成交，撤单，以牛人成交价+1跳跟单，2秒内不能成交，撤单并再加2跳点后再报；再报后2秒内还不能成交，撤单，以再加2跳点再报，如还未成交则牛人该笔交易不跟单。\n半自动跟单需用户每日两次登录资金账户后，才会开始自动跟单，登录一次持续一个白盘或夜盘。"];
        CGRect rect = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:attributes
                                         context:nil];
        _footView = [[FollowEarningChooseFootView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, rect.size.height)];
        [_footView setBackgroundColor:[UIColor whiteColor]];
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.table selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return _footView;
}
-(NSMutableArray *)textArray{
    if (!_textArray) {
        _textArray = [[NSMutableArray alloc] initWithObjects:@"仅订阅牛人成交信号,不自动跟单",@"订阅牛人成交信号,登录交易账户后自动跟单",@"订阅牛人成交信号并自动跟单,无需手动开启", nil];
    }
    return _textArray;
}
-(NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc] initWithObjects:@"订阅信号",@"半自动跟单",@"自动跟单", nil];
    }
    return _titleArray;
}
-(NSMutableArray *)priceArray{
    if (!_priceArray) {
        _priceArray = [[NSMutableArray alloc] initWithObjects:@"30",@"300",@"300", nil];
    }
    return _priceArray;
}
-(UIButton *)surePay{
    if (!_surePay) {
        _surePay = [UIButton buttonWithType:UIButtonTypeCustom];
        [_surePay setTitle:@"确认跟单并支付" forState:UIControlStateNormal];
        [_surePay setBackgroundColor:RGB(251, 108, 39)];
        [_surePay setFrame:CGRectMake(16, 47, SCREEN_WIDTH-32, 40)];
        [[_surePay rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            NSLog(@"yoyoyo");
        }];
    }
    return _surePay;
}
-(UIView*)viewWithSurePay{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 97);
    [view setBackgroundColor:[UIColor whiteColor]];
    [view addSubview:self.surePay];
    return view;
}
-(int)selectedIndex{
    if (!_selectedIndex) {
        _selectedIndex = 0;
    }
    return _selectedIndex;
}
@end
