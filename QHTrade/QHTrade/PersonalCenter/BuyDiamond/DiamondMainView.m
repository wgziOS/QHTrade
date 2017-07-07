//
//  DiamondMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DiamondMainView.h"

@interface DiamondMainView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray * payImgArr;
@end

@implementation DiamondMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (DiamondViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

#pragma mark - table协议方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
#pragma mark - 尾视图
-(UIView *)footView{

    if (!_footView) {
        _footView = [[UIView alloc]init];
        UILabel * label = [[UILabel alloc]init];
        label.text = @"温馨提示：\n1、购买的钻石仅限本应用内使用；\n2、1元人民币可购买1颗钻石；\n3、若购买后钻石余额长时间无变化，可致电本应用客户电话（0592-5523192）。\n4、厦门市奇获网络科技有限公司对本产品及服务享有最终解释权。";
        label.numberOfLines = 0;
        label.textColor = RGB(68, 68, 68);
        label.font = [UIFont systemFontOfSize:12.0f];
        [_footView addSubview:label];
//        WS(weakSelf)
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_footView).with.insets(UIEdgeInsetsMake(16, 16, 16, 16));
        }];
        
    }
    return _footView;
}
-(UITextField *)moneyTextfield{

    if (!_moneyTextfield) {
        _moneyTextfield = [[UITextField alloc]init];
        _moneyTextfield.placeholder = @"输入充值金额";
    }
    return _moneyTextfield;
}
-(UIView *)headView{

    if (!_headView) {
        _headView = [[UIView alloc]init];
        _headView.backgroundColor = [UIColor whiteColor];
        
        UIView * line = [[UIView alloc]init];
        line.backgroundColor = RGB(207, 205, 205);
        UIView * line1 = [[UIView alloc]init];
        line1.backgroundColor = RGB(207, 205, 205);
        [_headView addSubview:line];
        [_headView addSubview:line1];
        [_headView addSubview:self.moneyTextfield];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headView).with.offset(5);
            make.left.equalTo(_headView);
            make.right.equalTo(_headView);
            make.height.mas_equalTo(@1);
        }];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_headView);
            make.left.equalTo(_headView);
            make.right.equalTo(_headView);
            make.height.mas_equalTo(@1);
        }];
        
        [self.moneyTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_headView).with.insets(UIEdgeInsetsMake(5, 16, 5, 16));
        }];
        
    }
    return _headView;
}
#pragma mark tableView 懒加载
-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
    }
    return _tableView;
}
-(NSArray *)payImgArr{

    if (!_payImgArr) {
        _payImgArr = @[@"diamond_zhifubao",@"diamond_weixin"];
        
    }
    return _payImgArr;
}
@end
