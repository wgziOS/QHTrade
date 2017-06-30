//
//  PersonalBottomCell.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalBottomCell.h"
#import "TradeRecordsCell.h"
#import "BarChart.h"
#import "QHBarChart.h"
#import "QHLineChartView.h"

@interface PersonalBottomCell ()<UITableViewDelegate,UITableViewDataSource>
{
    QHBarChart * qhBarChartofCount;//手数
    
    QHBarChart * qhBarChartofMoney;//金额
    
    QHLineChartView *lineChartView;
}
@end
@implementation PersonalBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    

    
    //tableview
    [_tableView registerNib:[UINib nibWithNibName:kTradeRecordsCell bundle:nil] forCellReuseIdentifier:kTradeRecordsCell];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.hidden = NO;
    

    //封装柱状
    qhBarChartofCount = [[QHBarChart alloc]initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 220) redText:@"盈利手数" greenText:@"亏损手数" bottomArray:@[@"黄大豆2号",@"白糖",@"石油"] valueArray:@[@50,@70,@80,@90,@10,@20] barMax:100];
    [self addSubview:qhBarChartofCount];
    qhBarChartofCount .hidden = YES;
    
    qhBarChartofMoney = [[QHBarChart alloc]initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 220) redText:@"盈利金额" greenText:@"亏损金额" bottomArray:@[@"黄大豆2号",@"白糖",@"石油"] valueArray:@[@20,@40,@80,@100,@30,@60] barMax:100];
    [self addSubview:qhBarChartofMoney];
    qhBarChartofMoney .hidden = YES;
    
    //折线图
    
    NSArray *data = [NSArray arrayWithObjects:
                     [NSValue valueWithCGPoint:CGPointMake(1, 40)],
                     [NSValue valueWithCGPoint:CGPointMake(2, 20)],
                     [NSValue valueWithCGPoint:CGPointMake(3, 30)],
                     [NSValue valueWithCGPoint:CGPointMake(4, 0)],
                     [NSValue valueWithCGPoint:CGPointMake(5, 100)],
                     [NSValue valueWithCGPoint:CGPointMake(6, 60)],
                     [NSValue valueWithCGPoint:CGPointMake(7, 80)],
                     [NSValue valueWithCGPoint:CGPointMake(8, 40)],
                     nil];
    lineChartView = [[QHLineChartView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 220)];
    [lineChartView setMin_X:1];
    [lineChartView setMax_X:8];
    [lineChartView setMin_Y:0];
    [lineChartView setMax_Y:100];
    [lineChartView setData:data];
    [lineChartView setX_labels:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]];
    [lineChartView setY_labels:@[@"0",@"20",@"40",@"60",@"80",@"100"]];
    
    [self addSubview:lineChartView];
    lineChartView.hidden = YES;
    //左滑更新数据源
    
    //注册通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"personalBottomCellNotification" object:nil] subscribeNext:^(NSNotification *notification) {
        
        NSLog(@"%@",[notification.object objectForKey:@"value"]);
        int x = [[notification.object objectForKey:@"value"] intValue];
        switch (x) {
            case 0:
            {
                _tableView.hidden = NO;
                qhBarChartofMoney.hidden = YES;
                qhBarChartofCount.hidden = YES;
                lineChartView.hidden = YES;
            }
                break;
            case 1:
            {
                _tableView.hidden = YES;
                qhBarChartofMoney.hidden = YES;
                qhBarChartofCount.hidden = YES;
                lineChartView.hidden = NO;
            }
                break;
            case 2:
            {
                _tableView.hidden = YES;
                qhBarChartofMoney.hidden = NO;
                qhBarChartofCount.hidden = YES;
                lineChartView.hidden = YES;
            }
                break;
            case 3:
            {
                _tableView.hidden = YES;
                qhBarChartofMoney.hidden = YES;
                qhBarChartofCount.hidden = NO;
                lineChartView.hidden = YES;
            }
                break;
                
            default:
                break;
        }
        
    }];
    
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
