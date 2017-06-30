//
//  PersonalBottomCell.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/2.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const kPersonalBottomCell  = @"PersonalBottomCell";
@interface PersonalBottomCell : UITableViewCell
//@property (nonatomic,strong) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
