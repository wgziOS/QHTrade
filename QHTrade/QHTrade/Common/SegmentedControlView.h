//
//  SegmentedControlView.h
//  QHTrade
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedControlView : UIView
@property(nonatomic,strong)void (^itemClick)(int index);
-(instancetype)initWithSize:(CGSize)size defultTitle:(UIColor *)defultTitle selectedTitle:(UIColor*)selectedTitle defultBg:(UIColor *)defultColor selectedBg:(UIColor*)selectedColor withFont:(CGFloat )font borderWithColor:(UIColor*)border itemsArray:(NSArray*)array;
@end
