//
//  PersonalMasterView.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/30.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "BaseView.h"
#import "PersonalTabeHeadView.h"
#import "PersonalTableFootView.h"
@interface PersonalMasterView : BaseView
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UILabel *topViewLabel;
@property (nonatomic,strong) UILabel *topViewLabel1;
@property (nonatomic,strong) UIButton *topLogButton;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) PersonalTabeHeadView *tableHeadView;
@property (nonatomic,strong) PersonalTableFootView *tableFootView;
@end
