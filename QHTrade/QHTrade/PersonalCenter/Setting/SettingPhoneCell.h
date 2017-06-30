//
//  SettingPhoneCell.h
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/26.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const kSettingPhoneCell  = @"SettingPhoneCell";
@interface SettingPhoneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (nonatomic,strong) void (^changeBlock)();
@property (nonatomic,strong) NSString *phoneNumStr;
-(void)addPhoneNumStr:(NSString *)phoneNumStr;
@end
