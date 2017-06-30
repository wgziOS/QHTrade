//
//  QHBarChart.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/5.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QHBarChart : UIView


@property (nonatomic,strong) UIView *redSquare;//红方块
@property (nonatomic,strong) UIView *greenSquare;
@property (nonatomic,strong) UILabel *redLabel;
@property (nonatomic,strong) UILabel *greenLabel;
@property (nonatomic,strong) NSString *redText;
@property (nonatomic,strong) NSString *greenText;


@property (nonatomic,strong) NSArray *bottomArray;//底部label
@property (nonatomic,strong) NSArray *valuesArray;//valueArray
@property (nonatomic,assign) CGFloat barMax;//柱状图最大值

-(instancetype)initWithFrame:(CGRect)frame redText:(NSString *)redText
                   greenText:(NSString *)greenText
                 bottomArray:(NSArray *)bottomArray
                  valueArray:(NSArray *)valueArray
                      barMax:(CGFloat)barMax;
@end
