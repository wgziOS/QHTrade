//
//  DataReportMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/10.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DataReportMainView.h"
#import "SettingPhoneCell.h"
@interface DataReportMainView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DataReportMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (DataReportViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)layoutSubviews{
    
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
-(void)setupViews{
    
    [self addSubview:self.tableView];
    [self addSubview:self.timeLabel];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}
-(void)updateConstraints{
    
    WS(weakSelf)
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.right.left.equalTo(weakSelf);
        make.height.mas_equalTo(25);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(weakSelf);
        make.top.equalTo(weakSelf.timeLabel.mas_bottom);
        make.right.left.bottom.equalTo(weakSelf);
        
    }];
    [super updateConstraints];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingPhoneCell * cell = [tableView dequeueReusableCellWithIdentifier:kSettingPhoneCell];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(RateOfEarningsView *)rateOfEaringsView{


    if (!_rateOfEaringsView) {
        _rateOfEaringsView = [[RateOfEarningsView alloc]initWithViewModel:self.viewModel];
        _rateOfEaringsView.array = [NSMutableArray arrayWithObjects:@"", nil];
        
    }
    return _rateOfEaringsView;
}

-(EarningsSumView *)earningsSumView{

    if (!_earningsSumView) {
        _earningsSumView = [[EarningsSumView alloc]initWithViewModel:self.viewModel];
        
        _earningsSumView.array = [NSMutableArray arrayWithObjects:@"", nil];
    }
    return _earningsSumView;
}
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:kSettingPhoneCell bundle:nil] forCellReuseIdentifier:kSettingPhoneCell];
        
        [_tableView setTableHeaderView:self.earningsSumView];
        [_tableView setTableFooterView:self.rateOfEaringsView];
        
    }
    return _tableView;
}


-(UILabel *)timeLabel{

    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textColor = RGB(102, 102, 102);
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:12.0f];
        _timeLabel.text = @"更新时间：2000/00/00";
    }
    return _timeLabel;
}

@end
