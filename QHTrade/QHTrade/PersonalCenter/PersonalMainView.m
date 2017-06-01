//
//  PersonalMainView.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalMainView.h"
#import "PersonalViewModel.h"

@interface PersonalMainView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)PersonalViewModel * viewModel;
@end

@implementation PersonalMainView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (PersonalViewModel *)viewModel;
    return [super initWithViewModel:viewModel];

}
-(void)layoutSubviews{

}

-(void)setupViews{

    [self addSubview:self.tableView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];

}

-(void)updateConstraints{

    WS(weakself)
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [super updateConstraints];
}

#pragma mark - tableView代理
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}


-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
