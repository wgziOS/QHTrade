//
//  QHChartView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "QHChartView.h"
#import "BarChartView.h"
@implementation QHChartView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        size = frame.size;
        _chartMarginTop = 30.0;
        _chartMarginBottom = 30.0;
        _chartMarginLeft = 30.0;
        _chartMarginRight = 30.0;
        _barSpacing = 20;
    }
    return self;
}
 -(void)show{
     [self setMaxNum];

     float barCount = [_numLabels count];
     float barMaxWidth = size.width - _chartMarginLeft - _chartMarginRight ;
     float barHeight = (size.height - _chartMarginTop - _chartMarginBottom) / barCount - _barSpacing;
     //防止柱状图太粗
     if(barHeight > 25){
            barHeight = 25;
    }
    float barWidth = 0;

    for(int i = 0;i<barCount;i++){
        BarChartView *bar = [[BarChartView alloc] initWithFrame:CGRectMake(_chartMarginLeft, _chartMarginTop + i*(barHeight + _barSpacing), barMaxWidth, barHeight)];
        barWidth = [_numLabels[i] floatValue];
    
        bar.barProgress = barWidth/_maxNum;
        bar.barWidth = barHeight;
        bar.barText = [NSString stringWithFormat:@"%.1f",barWidth];
        bar.barColor = [UIColor redColor];
        bar.barTittle = [NSString stringWithFormat:@"%@",_nameLabels[i]];
        [self addSubview:bar];
    }
}

 -(void)setMaxNum{
    _maxNum = 0;
    for (id num in _numLabels) {
        if ([num floatValue] > _maxNum) {
            _maxNum = [num floatValue] ;
        }
    }
}

@end
