//
//  PersonalTabeHeadView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseView.h"
#import "PersonalViewModel.h"
@interface PersonalTabeHeadView : BaseView

@property (nonatomic,strong) UIImageView *headImgView;
@property (nonatomic,strong) UILabel *nickNameLabel;
@property (nonatomic,strong) UILabel *IdLabel;
@property (nonatomic,strong) UIImageView *sexImgView;
@property (nonatomic,strong) UIButton *diamondButton;
@property (nonatomic,strong) UIButton *setButton;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) PersonalViewModel *viewModel;
@end
