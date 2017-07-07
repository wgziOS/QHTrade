//
//  DiamondMainView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/7.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseView.h"
#import "DiamondViewModel.h"


@interface DiamondMainView : BaseView

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) DiamondViewModel *viewModel;

@property (nonatomic,strong) UIView *footView;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UITextField *moneyTextfield;
@end
