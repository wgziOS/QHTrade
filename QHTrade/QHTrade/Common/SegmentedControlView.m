//
//  SegmentedControlView.m
//  QHTrade
//
//  Created by user on 2017/7/4.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "SegmentedControlView.h"

#define kWidth self.size.width
#define kHeight self.size.height
#define kCount self.titleArray.count

@interface SegmentedControlView()
@property(nonatomic,strong)UIView  *segmentedView;
@property(nonatomic,strong)UIColor *defultTitleColor;//默认标题颜色
@property(nonatomic,strong)UIColor *selectedTitleColor;//选中标题颜色
@property(nonatomic,strong)UIColor *defultBackgroundColor;//默认背景颜色
@property(nonatomic,strong)UIColor *selectedBackgroundColor;//选中背景颜色
@property(nonatomic,strong)UIColor *borderColor;//边框颜色
@property(nonatomic,assign)CGFloat font;//字号大小
@property(nonatomic,strong)NSArray *titleArray;//字号大小
@property(nonatomic,strong)NSMutableArray *itemsArray;//字号大小
@property(nonatomic,assign)CGSize size;//字号大小
@property(nonatomic,assign)int  oldIndex;
@end

@implementation SegmentedControlView

-(void)creatItemUI{
    [self addSubview:self.segmentedView];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}
-(void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf)
    [self.segmentedView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithSize:(CGSize)size defultTitle:(UIColor *)defultTitle selectedTitle:(UIColor*)selectedTitle defultBg:(UIColor *)defultColor selectedBg:(UIColor*)selectedColor withFont:(CGFloat )font borderWithColor:(UIColor *)border itemsArray:(NSArray *)array{
    if (self= [super init]) {
        self.size = size;
        self.defultTitleColor = defultTitle;
        self.selectedTitleColor = selectedTitle;
        self.defultBackgroundColor = defultColor;
        self.selectedBackgroundColor = selectedColor;
        self.borderColor = border;
        self.font = font;
        self.titleArray = array;
        [self creatItemUI];
    }
    return self;
}

-(UIButton *)buttonWithTitle:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.titleLabel setFont:[UIFont systemFontOfSize:self.font]];
    [button setTitleColor:self.defultTitleColor forState:UIControlStateNormal];
    [button setTitleColor:self.selectedTitleColor forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage createImageWithColor:self.defultBackgroundColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage createImageWithColor:self.selectedBackgroundColor] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderColor = self.borderColor.CGColor;
    button.layer.borderWidth = 0.5f;
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    return button;
}

-(void)buttonClick:(UIButton*)button{
    if((int)button.tag==self.oldIndex) return;
    UIButton*oldButton = self.itemsArray[self.oldIndex];
    oldButton.selected = NO;
    button.selected = YES;
    self.oldIndex = (int)button.tag;
    self.itemClick(self.oldIndex);
}

-(UIView *)segmentedView{
    if (!_segmentedView) {
        _segmentedView = [[UIView alloc] init];
        for (int i=0; i<self.titleArray.count; i++) {
            UIButton *button = [self buttonWithTitle:self.titleArray[i]];
            button.tag = i;
            button.frame = CGRectMake(kWidth/kCount*i-0.5, 0, kWidth/kCount+1, kHeight);
            button.selected = i == 0 ? YES:NO;
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_segmentedView addSubview:button];
            [self.itemsArray addObject:button];
        }
    }
    return _segmentedView;
}

-(NSMutableArray *)itemsArray{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}
-(int)oldIndex{
    if (!_oldIndex) {
        _oldIndex = 0;
    }
    return _oldIndex;
}
@end
