//
//  RookieView.m
//  QHTrade
//
//  Created by user on 2017/7/3.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "RookieView.h"
#import "AwesomeTableViewCell.h"
#import "AwesomeViewModel.h"


@interface RookieView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)AwesomeViewModel *viewModel;
@end

@implementation RookieView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (AwesomeViewModel*)viewModel;
    return [super initWithViewModel:viewModel];
}

-(void)updateConstraints{
    [super updateConstraints];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
}

-(void)setupViews{
    [self addSubview:self.table];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.5f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int a = 1;
    return a==1 ? 3:self.viewModel.rookieDataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AwesomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName([AwesomeTableViewCell class])]];
    cell.tag = indexPath.row+5000;
    cell.viewModel = self.viewModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel.rookieCellClick sendNext:[NSString stringWithFormat:@"%ld",indexPath.row]];
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
        _table.backgroundColor = RGB(232, 233, 234);
        _table.separatorStyle = UITableViewCellSelectionStyleNone;
        [_table registerClass:[AwesomeTableViewCell class] forCellReuseIdentifier:[NSString stringWithUTF8String:object_getClassName([AwesomeTableViewCell class])]];
    }
    return _table;
}

@end
