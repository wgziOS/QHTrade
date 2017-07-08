//
//  DiamondRecordMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/7/6.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "DiamondRecordMainView.h"
#import "DiamondRecordCell.h"

@interface DiamondRecordMainView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DiamondRecordMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (DiamondRecordViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DiamondRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:kDiamondRecordCell];
    
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(void)addChildView{

    [self addSubview:self.tableView];
    
    WS(weakSelf)
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}

-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:kDiamondRecordCell bundle:nil] forCellReuseIdentifier:kDiamondRecordCell];
        
        _tableView.backgroundColor = RGB(244, 244, 244);
        _tableView.separatorStyle = UITableViewCellAccessoryNone;
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5)];
        view.backgroundColor = RGB(244, 244, 244);
        UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 4, SCREEN_WIDTH, 1)];
        view1.backgroundColor = RGB(180, 180, 180);
        [view addSubview:view1];
        [_tableView setTableHeaderView:view];
        _tableView.tableHeaderView.height = 5;
        
    }
    return _tableView;
}

-(DiamondRecordViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[DiamondRecordViewModel alloc]init];
    }
    return _viewModel;
}

@end
