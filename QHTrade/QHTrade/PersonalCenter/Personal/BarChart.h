//
//  BarChart.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarChart : UIView
{
    NSArray * values;
}
@property (nonatomic,strong) UIColor *barColor;
@property (nonatomic,strong) UILabel *valueLabel;//值
@property (nonatomic,assign) float max;//最大值

-(id)initWithFrame:(CGRect)frame values:(NSArray *)aValues maxValue:(CGFloat)maxValue;
@end
