//
//  BarChartView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface BarChartView : UIView
{
    CAShapeLayer *backgroundLayer; //背景层
    UIBezierPath *backgroundPath; //背景赛贝尔路径
    CAShapeLayer *barLayer; //柱状层
    UIBezierPath *barPath; //柱状赛贝尔路径
    CATextLayer *textLayer; //数值文字显示层
    CATextLayer *tittleLayer; //标题文字说明层
}

@property (nonatomic) UIColor *backgroundColor;//背景色
@property (nonatomic) UIColor *barColor;//柱的颜色
@property (nonatomic) float barProgress;//柱子长度 0-1之间
@property (nonatomic) float barWidth;//柱子宽度
@property (nonatomic) NSString *barText;//数值
@property (nonatomic) NSString *barTittle;//标题
@end
