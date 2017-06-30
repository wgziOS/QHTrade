//
//  QHBarChart.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "QHBarChart.h"
#import "BarChart.h"

@implementation QHBarChart

-(instancetype)initWithFrame:(CGRect)frame redText:(NSString *)redText
                   greenText:(NSString *)greenText
                   bottomArray:(NSArray *)bottomArray
                   valueArray:(NSArray *)valueArray
                      barMax:(CGFloat)barMax{

    self = [super initWithFrame:frame];
    if (self) {
        
        _redText = redText;
        _greenText = greenText;
        _bottomArray = bottomArray;
        _valuesArray = valueArray;
        _barMax = barMax;
        
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews{
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    int valueCount = (int)_valuesArray.count;
    
    for (int i = 0; i<valueCount; i++) {
        NSArray * arr = [NSArray arrayWithObject:_valuesArray[i]];
        BarChart * barChart = [[BarChart alloc]initWithFrame:CGRectMake((40)*i+ ((i+1)%2)*10, 45, 30, height-70) values:arr maxValue:100];
        [self addSubview:barChart];
        barChart.valueLabel.text = [NSString stringWithFormat:@"%@",arr[0]];
        
        if (i%2 == 0) {
            barChart.barColor = [UIColor redColor];
        }else barChart.barColor = [UIColor greenColor];
        
    }

    
    int bottomCount = (int)_bottomArray.count;
    
    for (int i = 0; i< bottomCount; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10+(60)*i + i*20, height-25, 60, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12.0f];
        label.text = _bottomArray[i];
        label.backgroundColor = [UIColor yellowColor];
        [self addSubview:label];
    }
    
    
    _greenLabel = [[UILabel alloc]initWithFrame:CGRectMake(width-60, 8, 60, 18)];
    _greenLabel.text = _greenText;
    _greenLabel.font = [UIFont systemFontOfSize:12.0f];
    _greenLabel.textColor = [UIColor blackColor];
    [self addSubview:_greenLabel];
    
    _greenSquare = [[UIView alloc]initWithFrame:CGRectMake(width-78, 8, 15, 15)];
    _greenSquare.backgroundColor = [UIColor greenColor];
    [self addSubview:_greenSquare];
    
    _redLabel = [[UILabel alloc]initWithFrame:CGRectMake(width-151, 8, 70, 18)];
    _redLabel.text = _redText;
    _redLabel.font = [UIFont systemFontOfSize:12.0f];
    _redLabel.textColor = [UIColor blackColor];
    [self addSubview:_redLabel];
    
    _redSquare = [[UIView alloc]initWithFrame:CGRectMake(width-168, 8, 15, 15)];
    _redSquare.backgroundColor = [UIColor redColor];
    [self addSubview:_redSquare];

}

//-(UIView *)redSquare{
//
//    if (!_redSquare) {
//        _redSquare = [[UIView alloc]init];
//        _redSquare.backgroundColor = [UIColor redColor];
//    }
//    return _redSquare;
//}

@end
