//
//  QHLineChartView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "QHLineChartView.h"
#import "LineChartDescribe.h"
@implementation QHLineChartView
{
    CGFloat w;
    CGFloat h;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        w = frame.size.width;
        h = frame.size.height;
//        self.backgroundColor = [UIColor lightGrayColor];
//        self.layer.cornerRadius = w*0.5;
        
    }
    return self;
}

-(void)setData:(NSArray *)data{

    _data = [NSArray arrayWithArray:data];
    [self addAXis];
    
    CGFloat startTime = 1.0f;
    for (int i = 1; i<data.count; i++) {
        
        CGPoint s = [data[i-1] CGPointValue];
        CGPoint e = [data[i] CGPointValue];
        
        s.x = (s.x - _min_X)* 0.8*w/(_max_X - _min_X) + 0.125*w;
        s.y = 0.875*h - (s.y - _min_Y)*0.8*h/(_max_Y - _min_Y);
        e.x = (e.x - _min_X)*0.8*w/(_max_X - _min_X) + 0.125*w;
        e.y = 0.875*h - (e.y - _min_Y)*0.8*h/(_max_Y - _min_Y);
        
        LineChartDescribe * describe = [[LineChartDescribe alloc]initWithtype:QHAnimationStrokeEnd inView:self];
        [describe setStartTime:startTime andDuration:0.5f];
        [describe addLineFrom:s toPoint:e color:[UIColor greenColor]];
//        startTime += 0.5f;
        
        UIView * point = [[UIView alloc]initWithFrame:CGRectMake(s.x-1, s.y-1, 2, 2)];
        point.backgroundColor = [UIColor redColor];
        [self addSubview:point];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:point.bounds];
        CAShapeLayer * pathLayer = [CAShapeLayer layer];
        pathLayer.lineWidth = 4;
        pathLayer.strokeColor = [UIColor blackColor].CGColor;
        pathLayer.path = path.CGPath;
        point.layer.mask = pathLayer;
    }
}

-(void)setX_labels:(NSArray *)x_labels{

    _x_labels = [NSArray arrayWithArray:x_labels];
    CGFloat num = (CGFloat)_x_labels.count -1.0;
    CGFloat x_interval = 0.8* w/num;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0.9*h, w, 0.1*h)];
    view.alpha = 0;
    
    for (int i = 0; i<_x_labels.count; i++) {
        NSString * string = _x_labels[i];
        UILabel * label= [[UILabel alloc]initWithFrame:CGRectMake(0.025*w+i*x_interval, 0, 0.2*w, 0.1*h)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:w/28.0];
        label.text = string;
        [view addSubview:label];
    }
    
    [self addSubview:view];
    [UIView animateWithDuration:1.5f animations:^{
       
        view.alpha = 1.0f;
    }];

}

-(void)setY_labels:(NSArray *)y_labels{

    _y_labels = [NSArray arrayWithArray:y_labels];
    CGFloat num = ((CGFloat)_y_labels.count) -1.0;
    CGFloat y_interval = 0.8*h/num;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0.1*w, h)];
    view.alpha = 0;
    
    for (int i = 0; i<_y_labels.count; i++) {
        
        NSString * string = _y_labels[i];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.875*h - 6 - y_interval*i, 0.08*w, w/28.0+2)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:w/28.0];
        label.text = string;
        [view addSubview:label];
    }
    
    [self addSubview:view];
    [UIView animateWithDuration:1.5f animations:^{
        view.alpha = 1.0f;
    }];
}

//轴
-(void)addAXis{

    LineChartDescribe * axis = [[LineChartDescribe alloc]initWithtype:QHAnimationStrokeEnd inView:self];
    [axis setStartTime:0.0f andDuration:1.0f];
    [axis addLineFrom:CGPointMake(w*0.1, h*0.9)
              toPoint:CGPointMake(w*0.1, h*0.05) color:[UIColor blackColor]];
    
    [axis addLineFrom:CGPointMake(w*0.1, h*0.9)
              toPoint:CGPointMake(w*0.95, h*0.9) color:[UIColor blackColor]];
    
    
}
@end
