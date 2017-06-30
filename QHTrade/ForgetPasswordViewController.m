//
//  ForgetPasswordViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/29.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ForgetInputCodeViewController.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextBtnClick:(id)sender {
    
    ForgetInputCodeViewController * FVC = [[ForgetInputCodeViewController alloc]init];
    FVC.title = @"密码找回";
    [self.navigationController pushViewController:FVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
