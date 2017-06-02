//
//  BarChartView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BarChartView.h"

@implementation BarChartView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        backgroundLayer = [CAShapeLayer new];
        [self.layer addSublayer:backgroundLayer];
        backgroundLayer.strokeColor = [UIColor grayColor].CGColor;
        backgroundLayer.frame = self.bounds;
        
        barLayer = [CAShapeLayer new];
        [self.layer addSublayer:barLayer];
        barLayer.strokeColor = [UIColor greenColor].CGColor;
        barLayer.lineCap = kCALineCapButt;
        barLayer.frame = self.bounds;
        
        self.barWidth = self.bounds.size.width;
        
    }
    return self;
}
//设置背景
- (void)setBackground
{
    backgroundPath = [UIBezierPath bezierPath];
    [backgroundPath moveToPoint:CGPointMake(self.bounds.origin.x, self.bounds.origin.y+self.bounds.origin.y+self.bounds.size.height/2)];
    [backgroundPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.origin.y+self.bounds.origin.y+self.bounds.size.height/2)];
    [backgroundPath setLineWidth:_barWidth];
    [backgroundPath setLineCapStyle:kCGLineCapSquare];
     backgroundLayer.path = backgroundPath.CGPath;
}

//设置百分百（显示动画）
- (void)setProgress
{
 barPath = [UIBezierPath bezierPath];
    [barPath moveToPoint:CGPointMake(self.bounds.origin.x, self.bounds.origin.y+self.bounds.origin.y+self.bounds.size.height/2)];
    [barPath addLineToPoint:CGPointMake(self.bounds.size.width*_barProgress, self.bounds.origin.y+self.bounds.origin.y+self.bounds.size.height/2)];
    [barPath setLineWidth:_barWidth];
    [barPath setLineCapStyle:kCGLineCapSquare];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = @0.0f;
     pathAnimation.toValue = @1.0f;
    [barLayer addAnimation:pathAnimation forKey:nil];

    barLayer.strokeEnd = 1.0;

    barLayer.path = barPath.CGPath;
}

//设置柱子的宽度
- (void)setBarWidth:(float)progressWidth
 {
     _barWidth = progressWidth;
     backgroundLayer.lineWidth = _barWidth;
     barLayer.lineWidth = _barWidth;

     [self setBackground];
     [self setProgress];
}

 //设置背景色
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    backgroundLayer.strokeColor = backgroundColor.CGColor;
}

 //设置柱子颜色
- (void)setBarColor:(UIColor *)barColor{
    barLayer.strokeColor = barColor.CGColor;
}

//设置柱子进度
 - (void)setBarProgress:(float)progress
{
    _barProgress = progress;
    [self setProgress];
}

 //设置数值
 - (void)setBarText:(NSString*)text{
     textLayer = [CATextLayer layer];
     textLayer.string = text;
     textLayer.foregroundColor = [[UIColor blackColor] CGColor];
     textLayer.fontSize = 16;
     textLayer.alignmentMode = kCAAlignmentLeft;

     textLayer.bounds = barLayer.bounds;
     textLayer.position = CGPointMake(self.bounds.size.width*3/2 + 5 , self.bounds.size.height/2);
     CABasicAnimation *fade = [self fadeAnimation];
     [textLayer addAnimation:fade forKey:nil];
     [self.layer addSublayer:textLayer];
}

 //设置标题
 - (void)setBarTittle:(NSString*)tittle{
     tittleLayer = [CATextLayer layer];
     tittleLayer.string = tittle;
     tittleLayer.foregroundColor = [[UIColor blackColor] CGColor];
     tittleLayer.fontSize = 16;
     tittleLayer.alignmentMode = kCAAlignmentRight;

     tittleLayer.bounds = barLayer.bounds;
     tittleLayer.position = CGPointMake(-self.bounds.size.width/2 - 5 , self.bounds.size.height/2);
     CABasicAnimation *fade = [self fadeAnimation];
     [tittleLayer addAnimation:fade forKey:nil];
     [self.layer addSublayer:tittleLayer];
}

 //渐变动画
-(CABasicAnimation*)fadeAnimation{
     CABasicAnimation* fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
     fadeAnimation.fromValue = [NSNumber numberWithFloat:0.0];
     fadeAnimation.toValue = [NSNumber numberWithFloat:1.0];
     fadeAnimation.duration = 2.0;
 
     return fadeAnimation;
}



@end
