//
//  AccountSetViewController.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/27.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "AccountSetViewController.h"
#import "AccountSetViewModel.h"
#import "AccountSetMainView.h"
#import "ChooseSexView.h"
#import "ChangeNickNameViewController.h"

@interface AccountSetViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong)AccountSetMainView * mainView;
@property (nonatomic,strong)AccountSetViewModel * viewModel;
@end

@implementation AccountSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainView];
    
    self.title = @"账户设置";
    
}
-(void)updateViewConstraints{

    WS(weakSelf)
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf.view);
    }];

    [super updateViewConstraints];
}
#pragma mark - 相机代理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    //  获取
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.mainView.headImage  = image;
    [self.mainView.tableView reloadData];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    [self dismissViewControllerAnimated:YES completion:nil];
    //更新
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)bindViewModel{
    
    WS(weakSelf)
    
    [[weakSelf.viewModel.cellClick takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSMutableDictionary* x) {
        
        NSString * section = [x objectForKey:@"section"];
        NSString * row = [x objectForKey:@"row"];
        
        if ([section intValue] == 0) {
            NSLog(@"account 0-%@",row);
            
            switch ([row intValue]) {
                case 0:
                {//头像点击
                    [weakSelf chooseHeadImage];
                }
                    break;
                case 1:
                {//用户名
                    ChangeNickNameViewController * CVC = [[ChangeNickNameViewController alloc]init];
                    [weakSelf.navigationController pushViewController:CVC animated:YES];
                    
                }
                    break;
                case 2:
                {//期货ID
                    
                }
                    break;
                case 3:
                {//性别
                    ChooseSexView * sexView = [[ChooseSexView alloc]initWithDataArray:@[@"男",@"女"]];
                    [sexView show];
                    sexView.callBackBlock = ^(NSString * str){
                        NSLog(@"%@",str);
                        weakSelf.mainView.sexStr = str;
                        [weakSelf.mainView.tableView reloadData];
                    };
                }
                    break;
                case 4:
                {//生日
                    
                }
                    break;
                    
                default:
                    break;
            }
        }else{
            NSLog(@"1-%@",row);
            
            switch ([row intValue]) {
                case 0:
                {//公司
                
                }
                    break;
                case 1:
                {//职位
                    
                }
                    break;
                case 2:
                {//常住地
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
    }];

}
-(AccountSetViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[AccountSetViewModel alloc]init];
    }
    return _viewModel;
}
-(AccountSetMainView *)mainView{

    if (!_mainView) {
        _mainView = [[AccountSetMainView alloc]initWithViewModel:self.viewModel];
    }
    return _mainView;
}
#pragma mark - 选择头像
-(void)chooseHeadImage{
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction * cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [cancle setValue:[UIColor blackColor] forKey:@"_titleTextColor"];
   
    UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    [camera setValue:[UIColor blackColor] forKey:@"_titleTextColor"];
    
    UIAlertAction * picture = [UIAlertAction actionWithTitle:@"相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController * pickerImage = [[UIImagePickerController alloc]init];
        pickerImage.delegate = self;
        pickerImage.allowsEditing = NO;
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        }
        
        [self presentViewController:pickerImage animated:YES completion:nil];
    }];
    [picture setValue:[UIColor blackColor] forKey:@"_titleTextColor"];
    
    [alert addAction:cancle];
    [alert addAction:picture];
    [alert addAction:camera];
    
    
    [self presentViewController:alert animated:YES completion:nil];
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
