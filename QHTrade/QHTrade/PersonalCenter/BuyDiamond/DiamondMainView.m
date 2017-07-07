//
//  DiamondMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DiamondMainView.h"
#import "DiamondPayCell.h"

@interface DiamondMainView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray * payImgArr;
@property (nonatomic,assign) int selectedIndex;
@end

@implementation DiamondMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (DiamondViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)bindViewModel{
}
-(void)layoutSubviews{
    
    WS(weakSelf)
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(weakSelf);
        make.top.equalTo(weakSelf);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf).with.offset(-90);
    }];
    
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.footView.mas_bottom).with.offset(25);
        make.left.equalTo(weakSelf).with.offset(16);
        make.right.equalTo(weakSelf).with.offset(-16);
        make.bottom.equalTo(weakSelf).with.offset(-25);
        make.height.mas_equalTo(40);
    }];
    
    [super layoutSubviews];
}
-(void)setupViews{

    [self addSubview:self.tableView];
    [self addSubview:self.commitButton];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

#pragma mark - table协议方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = (int)indexPath.row;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiamondPayCell * cell = [tableView dequeueReusableCellWithIdentifier:kDiamondPayCell];
    
    cell.imageView.image = [UIImage imageNamed:self.payImgArr[indexPath.row]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
#pragma mark --提交按钮
-(UIButton *)commitButton{
    
    if (!_commitButton) {
        _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commitButton setTitle:@"确定" forState:UIControlStateNormal];
        [_commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _commitButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_commitButton setBackgroundImage:[UIImage imageNamed:@"btn_ablebg_image"] forState:UIControlStateNormal];
        [[_commitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.viewModel.commitBtnSubjet sendNext:nil];
        }];
    }
    return _commitButton;
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
        
        UIView * line = [[UIView alloc]init];
        line.backgroundColor = RGB(207, 205, 205);
        [_footView addSubview:line];
        [_footView addSubview:label];

        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_footView);
            make.left.equalTo(_footView);
            make.right.equalTo(_footView);
            make.height.mas_equalTo(@1);
        }];
//        WS(weakSelf)
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_footView).with.insets(UIEdgeInsetsMake(10, 16, 16, 16));
            
        }];
        
        //默认
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return _footView;
}


-(DiamondHeadView *)headView{

    if (!_headView) {
        _headView = [[DiamondHeadView alloc]initWithViewModel:self.viewModel];
//        _headView.backgroundColor = [UIColor greenColor];
    }
    return _headView;
}

#pragma mark tableView 懒加载
-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:kDiamondPayCell bundle:nil] forCellReuseIdentifier:kDiamondPayCell];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setTableFooterView:self.footView];
        [_tableView setTableHeaderView:self.headView];
        [_tableView.tableHeaderView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 290)];
        [_tableView.tableFooterView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
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
