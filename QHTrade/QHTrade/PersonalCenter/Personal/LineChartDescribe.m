//
//  LineChartDescribe.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "LineChartDescribe.h"

@interface LineChartDescribe()

@end

@implementation LineChartDescribe
{
    NSArray * types;
    CGFloat startTime;
    CGFloat duration;
}
@synthesize containerView;
@synthesize type;
@synthesize shapeLayers;
@synthesize basicAnimation;

-(id)initWithtype:(QHAnimationType)qh_type inView:(UIView *)view{

    self = [super init];
    if (self) {
        
        self.type = qh_type;
        self.containerView = view;
        shapeLayers = [NSArray array];
        types = @[@"strokeEnd",@"ceshi"];
    }
    return self;
}

-(void)setStartTime:(CGFloat)qh_startTime andDuration:(CGFloat)qh_duration{

    startTime = qh_startTime;
    duration = qh_duration;
    basicAnimation = [CABasicAnimation animationWithKeyPath:types[type]];
    basicAnimation.delegate = (id <CAAnimationDelegate>)containerView;
    basicAnimation.duration = qh_duration+ qh_startTime;
    basicAnimation.fromValue = [NSNumber numberWithFloat:-qh_startTime/qh_duration];
    basicAnimation.toValue = [NSNumber numberWithFloat:1.0];
}

-(void)addLineFrom:(CGPoint)from toPoint:(CGPoint)to color:(UIColor *)color{
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:from];
    [path addLineToPoint:to];
    
    CAShapeLayer * pathlayer= [CAShapeLayer layer];;
    pathlayer.frame = containerView.bounds;
    pathlayer.path = path.CGPath;
    pathlayer.strokeColor = color.CGColor;
    pathlayer.lineWidth = 1.0f;
    pathlayer.lineJoin = kCALineJoinRound;
//    pathlayer.lineCap = kCALineCapRound;
    [pathlayer addAnimation:basicAnimation forKey:types[type]];
    
    NSMutableArray * array = [NSMutableArray arrayWithArray:shapeLayers];
    [array addObject:pathlayer];
    shapeLayers = [NSArray arrayWithArray:array];
    [containerView.layer addSublayer:pathlayer];

}

@end
