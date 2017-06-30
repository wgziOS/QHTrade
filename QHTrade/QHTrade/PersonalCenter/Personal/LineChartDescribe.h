//
//  LineChartDescribe.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    QHAnimationStrokeEnd = 0
}QHAnimationType;

@interface LineChartDescribe : NSObject

@property (nonatomic,weak) UIView *containerView;
@property (nonatomic) QHAnimationType type;
@property (nonatomic,strong) NSArray *shapeLayers;
@property (nonatomic,strong) CABasicAnimation *basicAnimation;

- (id)initWithtype:(QHAnimationType)qh_type inView:(UIView *)view;

- (void)setStartTime:(CGFloat)qh_startTime andDuration:(CGFloat)qh_duration;

- (void)addLineFrom:(CGPoint)from toPoint:(CGPoint)to color:(UIColor *)color;
@end
