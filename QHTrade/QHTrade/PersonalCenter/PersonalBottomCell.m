//
//  PersonalBottomCell.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalBottomCell.h"
#import "TradeRecordsCell.h"
#import "QHChartView.h"
@interface PersonalBottomCell ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation PersonalBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_tableView registerNib:[UINib nibWithNibName:kTradeRecordsCell bundle:nil] forCellReuseIdentifier:kTradeRecordsCell];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableView.hidden = YES;
    
    //柱状
//    QHChartView *chart = [[QHChartView alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, 300)];
//    chart.numLabels = [NSArray arrayWithObjects:@10,@20,@3,@4, nil];
//    chart.nameLabels = [NSArray arrayWithObjects:@"第一",@"第二",@"第三",@"第四", nil];
//    [self addSubview:chart];
//    chart.maxNum = 100.0;
//
//    [chart show];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TradeRecordsCell * cell = [tableView dequeueReusableCellWithIdentifier:kTradeRecordsCell];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
