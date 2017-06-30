//
//  SettingMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/26.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "SettingMainView.h"
#import "SettingViewModel.h"
#import "SettingHeadImgCell.h"
#import "SettingPhoneCell.h"
#import "SettingDefaultCell.h"
#import "SettingSwitchCell.h"

@interface SettingMainView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)SettingViewModel * viewModel;
@end

@implementation SettingMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (SettingViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)layoutSubviews{


}
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
-(void)setupViews{
    
    [self addSubview:self.tableView];
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}
-(void)updateConstraints{

    WS(weakself)
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [super updateConstraints];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSString stringWithFormat:@"%ld",(long)section] forKey:@"section"];
    [dic setObject:[NSString stringWithFormat:@"%ld",(long)row] forKey:@"row"];
    
    [self.viewModel.cellClick sendNext:dic];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SettingHeadImgCell * headCell = [tableView dequeueReusableCellWithIdentifier:kSettingHeadImgCell];
    SettingPhoneCell * phoneCell = [tableView dequeueReusableCellWithIdentifier:kSettingPhoneCell];
    SettingDefaultCell * defaultCell = [tableView dequeueReusableCellWithIdentifier:kSettingDefaultCell];
    SettingSwitchCell * switchCell = [tableView dequeueReusableCellWithIdentifier:kSettingSwitchCell];
    WS(weakself)
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
//                headCell.headImgView.image
                return headCell;
            }
                break;
            case 1:
            {
                [phoneCell addPhoneNumStr:@"15160718888"];
                phoneCell.changeBlock = ^(){
                    NSLog(@"更换");
                    [weakSelf.viewModel.changePhoneClick sendNext:nil];
                };
                return phoneCell;
            }
                break;
            case 2:
            {
                defaultCell.leftLabel.text = @"更换密码";
                defaultCell.rightLabel.text = @"";
                return defaultCell;
            }
                break;
            case 3:
            {
                
                switchCell.leftLabel.text = @"委托确认";
                switchCell.switchBlock = ^(NSString * str){
                    NSLog(@"…%@",str);
                };
                return switchCell;
            }
                break;
            case 4:
            {
                
                switchCell.leftLabel.text = @"接收通知";
                switchCell.switchBlock = ^(NSString * str){
                    NSLog(@"…%@",str);
                };
                return switchCell;
            }
                break;
                
            default:
                break;
        }
    }else {
        
        switch (indexPath.row) {
            case 0:
            {
                defaultCell.leftLabel.text = @"意见反馈";
                defaultCell.rightLabel.text = @"";
                return defaultCell;
            }
                break;
            case 1:
            {
                defaultCell.leftLabel.text = @"检查更新";
                defaultCell.rightLabel.text = @"最新版本";
                return defaultCell;
            }
                break;
            case 2:
            {
                defaultCell.leftLabel.text = @"关于我们";
                defaultCell.rightLabel.text = @"";
                return defaultCell;
            }
                break;
                
            default:
                break;
        }
 
    }
    return defaultCell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
        {
            return 5;
        }
            break;
        case 1:
        {
            return 3;
        }
            break;
            
        default:
            break;
    }
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 60;
    }else return 50;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:kSettingHeadImgCell bundle:nil] forCellReuseIdentifier:kSettingHeadImgCell];
        [_tableView registerNib:[UINib nibWithNibName:kSettingPhoneCell bundle:nil] forCellReuseIdentifier:kSettingPhoneCell];
        [_tableView registerNib:[UINib nibWithNibName:kSettingDefaultCell bundle:nil] forCellReuseIdentifier:kSettingDefaultCell];
        [_tableView registerNib:[UINib nibWithNibName:kSettingSwitchCell bundle:nil]    forCellReuseIdentifier:kSettingSwitchCell];
        
    }
    return _tableView;
}

@end
