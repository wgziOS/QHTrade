//
//  BarChart.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BarChart.h"

@implementation BarChart

-(id)initWithFrame:(CGRect)frame values:(NSArray *)aValues maxValue:(CGFloat)maxValue{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        values = aValues;
        _max = maxValue;
        [self addLabel];
    }
    return self;
}

-(void)addLabel{
    _valueLabel = [[UILabel alloc]init];
    _valueLabel.textColor = [UIColor blackColor];
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    _valueLabel.font = [UIFont systemFontOfSize:10.0f];
    _valueLabel.text = @"test";
    [self addSubview:_valueLabel];
    _valueLabel.frame = CGRectMake(0, 0, 30, 16);
}

-(void)setBarColor:(UIColor *)barColor{

    _barColor = barColor;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{

    [self.barColor setFill];
    [self.barColor setStroke];//
    
    float height = self.frame.size.height;
    float width = self.frame.size.width;
    float space = 10;
//    float barWidth = width - 10;
    float barWidth = (width - space*(values.count+1))/values.count;

//    NSArray * sortedValues = [values sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        return [obj1 compare:obj2];
//    }];
    
//    float min = [[sortedValues objectAtIndex:0] floatValue];
//    float max = [[sortedValues lastObject] floatValue];
    float min = 0;
//    _max = 100;
    
//    [self drawLineFrom:CGPointMake(0, height) to:CGPointMake(width, height)];
    
    for (int i = 0 ; i<values.count; i++) {
        float value = [values[i] floatValue];
        float barHeight = height;
        
        
        if (_max != min) {
            barHeight = ((value -min)/(_max-min)) * (height - 20)+20;
        }
        
        _valueLabel.frame = CGRectMake(0, height-barHeight-16, 30, 16);
        
        CGRect bar = CGRectMake(space*(i+1)+barWidth*i, height-barHeight, barWidth, barHeight);
        
        [self drawRectangle:bar];
    }
    
    
    
}
//矩形
-(void)drawRectangle:(CGRect)rect
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef pathRef = [self pathwithFrame:rect withRadius:0];
    
    CGContextAddPath(context, pathRef);
    CGContextDrawPath(context,kCGPathFillStroke);
    
    CGPathRelease(pathRef);
}

-(CGMutablePathRef)pathwithFrame:(CGRect)frame withRadius:(float)radius
{
    CGPoint x1,x2,x3,x4; //x为4个顶点
    CGPoint y1,y2,y3,y4,y5,y6,y7,y8; //y为4个控制点
    //从左上角顶点开始，顺时针旋转,x1->y1->y2->x2
    
    x1 = frame.origin;
    x2 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y);
    x3 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height);
    x4 = CGPointMake(frame.origin.x                 , frame.origin.y+frame.size.height);
    
    
    y1 = CGPointMake(frame.origin.x+radius, frame.origin.y);
    y2 = CGPointMake(frame.origin.x+frame.size.width-radius, frame.origin.y);
    y3 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+radius);
    y4 = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height-radius);
    
    y5 = CGPointMake(frame.origin.x+frame.size.width-radius, frame.origin.y+frame.size.height);
    y6 = CGPointMake(frame.origin.x+radius, frame.origin.y+frame.size.height);
    y7 = CGPointMake(frame.origin.x, frame.origin.y+frame.size.height-radius);
    y8 = CGPointMake(frame.origin.x, frame.origin.y+radius);
    
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    if (radius<=0) {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, x1.x,x1.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x2.x,x2.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x3.x,x3.y);
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, x4.x,x4.y);
    }else
    {
        CGPathMoveToPoint(pathRef,    &CGAffineTransformIdentity, y1.x,y1.y);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y2.x,y2.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x2.x,x2.y,y3.x,y3.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y4.x,y4.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x3.x,x3.y,y5.x,y5.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y6.x,y6.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x4.x,x4.y,y7.x,y7.y,radius);
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, y8.x,y8.y);
        CGPathAddArcToPoint(pathRef, &CGAffineTransformIdentity,  x1.x,x1.y,y1.x,y1.y,radius);
        
    }
    
    
    CGPathCloseSubpath(pathRef);
    
    //[[UIColor whiteColor] setFill];
    //[[UIColor blackColor] setStroke];
    
    return pathRef;
}

//直线
-(void)drawLineFrom:(CGPoint)startPoint
                 to:(CGPoint)endPoint
{
    CGContextRef     context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x,endPoint.y);
    
    CGContextStrokePath(context);
}
@end
