//
//  NSAttributedString+Extension.m
//  QHTrade
//
//  Created by user on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)
+(CGSize)getTextSizeWithText:(NSString *)text withMaxSize:(CGSize)size withLineSpacing:(int)LineSpacing{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:LineSpacing];
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    CGRect rect = [text boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
    return rect.size;
}
+(NSMutableAttributedString*)getAttributedStringWithString:(NSString*)string  littlefont:(CGFloat)little bigFont:(CGFloat)big defultTextColor:(UIColor*)defult specialColor:(UIColor*)special range:(NSRange)range {
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    paragraph.lineSpacing = 2; // 行距
    NSDictionary *attributedDic = @{NSFontAttributeName:[UIFont systemFontOfSize:big],NSForegroundColorAttributeName:defult,NSParagraphStyleAttributeName:paragraph};
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributedDic];
    [attributedString addAttribute:NSForegroundColorAttributeName value:special range:range];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:little] range:range];
    return attributedString;
}
@end
