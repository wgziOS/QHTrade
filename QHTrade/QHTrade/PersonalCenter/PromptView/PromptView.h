//
//  PromptView.h
//  RDFuturesApp
//
//  Created by 吴桂钊 on 2017/5/10.
//  Copyright © 2017年 FuturesApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromptView : UIView
{

}
@property (nonatomic, strong) UILabel * title;
@property (nonatomic, strong) UILabel * subTitle;
@property (nonatomic, strong) UIButton * closeButton;
@property (nonatomic, strong) UIButton * goonBtn;
@property (nonatomic, strong) UIView  * backImageView;

@property(nonatomic,copy) void (^goonBlock)();
@property (nonatomic,copy) void (^closeBlock)();

-(id)initWithTitle:(NSString *)title SubTitle:(NSString *)subTitle
      LeftBtnTitle:(NSString *)leftBtnTitle RightBtnTitle:(NSString *)rightBtnTitle;

-(id)initWithTitleString:(NSString *)titleString SubTitleString:(NSString *)subTitleString;

- (void)show;

- (void)showCachAccount;
@end
