//
//  Common.h
//  QHTrade
//
//  Created by user on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#ifndef Common_h
#define Common_h
//版本号
#define IOS_VERSION         [[[UIDevice currentDevice] systemVersion] floatValue]

#define isRetina            ([[UIScreen mainScreen] scale] == 2 )

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define getLeft(v)          (v.frame.size.width + v.frame.origin.x)
#define getTop(v)           (v.frame.size.height + v.frame.origin.y)

#define WS(weakself)   __weak __typeof(&*self) weakSelf = self;

#define NavigationBarHeight 64

#define showMassage(msg) [MBProgressHUD showSuccess:msg];

#define hiddenHUD        [MBProgressHUD hideHUD];

#define loading(msg)     [MBProgressHUD showMessage:msg];


#define RGB(r, g, b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define DEFAULT_COLOR RGB(255, 165, 33)

#define DEFAULT_BG_COLOR RGB(255, 255, 255)




#define HostUrlBak                @"http://210.13.218.130:3299/rdfuture"



#endif /* Common_h */
