//
//  FollowEarningChooseView.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "FollowEarningChooseView.h"
#import "FollowEarningChooseViewModel.h"
#import "FollowEarningChooseCell.h"


@interface FollowEarningChooseView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)FollowEarningChooseViewModel *viewModel;
@property(nonatomic,strong)UITableView *table;

@end

@implementation FollowEarningChooseView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    self.viewModel = (FollowEarningChooseViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}
-(void)setupViews{
    
}
-(void)updateConstraints{
    [super updateConstraints];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int a = 1;
    return a==1 ? 3:3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FollowEarningChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([FollowEarningChooseCell class])]];
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _table.dataSource = self;
        _table.delegate = self;
        [_table registerClass:[FollowEarningChooseCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([FollowEarningChooseCell class])]];
    }
    return _table;
}
@end
