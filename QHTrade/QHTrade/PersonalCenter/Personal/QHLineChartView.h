//
//  QHLineChartView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QHLineChartView : UIView
@property (nonatomic,assign) CGFloat min_X;
@property (nonatomic,assign) CGFloat min_Y;
@property (nonatomic,assign) CGFloat max_X;
@property (nonatomic,assign) CGFloat max_Y;

@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) NSArray *x_labels;
@property (nonatomic,strong) NSArray *y_labels;

@end
