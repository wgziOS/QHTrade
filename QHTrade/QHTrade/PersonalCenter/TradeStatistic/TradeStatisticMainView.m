//
//  TradeStatisticMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "TradeStatisticMainView.h"
#import "TradeStatisticViewModel.h"
#import "TradestatisticsCell.h"

@interface TradeStatisticMainView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)TradeStatisticViewModel * viewModel;
@property (nonatomic,strong)NSArray * titleArray;
@end

@implementation TradeStatisticMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (TradeStatisticViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
    }
    return self;
}

-(void)addChildView{

    WS(weakSelf)
    [self addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf);
    }];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TradestatisticsCell * cell = [tableView dequeueReusableCellWithIdentifier:kTradestatisticsCell];
    
    if (indexPath.row < 4) {
        cell.rightLabel.textColor = RGB(214, 82, 0);
    }
    cell.leftLabel.text = self.titleArray[indexPath.row];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 45;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArray.count;
}
-(NSArray *)titleArray{

    if (!_titleArray) {
        _titleArray  = @[@"总资产",@"总收益",@"收益率",@"上日收益",@"跟单",@"交易总笔数",@"交易总手数",@"交易时长"];
    }
    return _titleArray;
}
-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        [_tableView registerNib:[UINib nibWithNibName:kTradestatisticsCell bundle:nil] forCellReuseIdentifier:kTradestatisticsCell];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(244, 244, 244);
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
    }
    return _tableView;
    
}

@end
