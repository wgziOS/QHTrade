//
//  EarningsSumDayView.m
//  QHTrade
//
//  Created by user on 2017/7/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "EarningsSumDayView.h"
#import "QHLineChartView.h"

@interface EarningsSumDayView()
@property(nonatomic,strong)QHLineChartView *lineChartView;
@end

@implementation EarningsSumDayView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    [self addSubview:self.lineChartView];
}

-(void)bindViewModel{
    
}
-(void)setArray:(NSArray *)array{
    NSArray *dataa = [NSArray arrayWithObjects:
                      
                      [NSValue valueWithCGPoint:CGPointMake(1, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(1.2, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(1.4, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(1.6, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(2, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(2.2, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(2.4, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(2.6, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(3, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(3.2, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(3.4, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(3.6, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(4, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(4.2, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(4.4, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(4.6, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(5, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(5.2, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(5.4, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(5.6, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(6, arc4random()%120)],
                      [NSValue valueWithCGPoint:CGPointMake(6.6, arc4random()%120)],
                      nil];
    
    [self.lineChartView setMin_X:1];
    [self.lineChartView setMax_X:6.6];
    [self.lineChartView setMin_Y:0];
    [self.lineChartView setMax_Y:120];
    [self.lineChartView setData:dataa];
    [self.lineChartView setX_labels:@[@"2036/12",@"2036/12",@"2326/13",@"1236/14",@"1236/25",@"1236/26"]];
    [self.lineChartView setY_labels:@[@"0",@"10",@"20",@"30",@"40",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120"]];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//-setda
-(QHLineChartView *)lineChartView{
    if(!_lineChartView){
        _lineChartView = [[QHLineChartView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-385)];
//        _lineChartView.backgroundColor = [UIColor greenColor];
        
    }
    return _lineChartView;
}
@end
