//
//  QHChartView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QHChartView : UIView
{
        CGSize size;//图表大小
}
@property (nonatomic)NSArray *numLabels;//值
@property (nonatomic)NSArray *nameLabels;//名称
@property (nonatomic)float maxNum;//最大值

@property (nonatomic)NSInteger barSpacing;//两根柱状图的间距

@property (nonatomic) CGFloat chartMarginLeft;
@property (nonatomic) CGFloat chartMarginRight;
@property (nonatomic) CGFloat chartMarginTop;
@property (nonatomic) CGFloat chartMarginBottom;

 - (void)show;//现实图标
@end
