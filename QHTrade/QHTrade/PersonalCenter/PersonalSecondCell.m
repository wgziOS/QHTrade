//
//  PersonalSecondCell.m
//  QHTrade
//
//  Created by 吴桂钊 on 2017/6/1.
//  Copyright © 2017年 qihuo.RDTrade.com. All rights reserved.
//

#import "PersonalSecondCell.h"
#import "PersonalCollectionCell.h"

@interface PersonalSecondCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end


@implementation PersonalSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];

    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    [flowLayout setItemSize:CGSizeMake((SCREEN_WIDTH-30)/3, (self.collectionView.frame.size.height-35)/3)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView registerNib:[UINib nibWithNibName:kPersonalCollectionCell bundle:nil] forCellWithReuseIdentifier:kPersonalCollectionCell];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    PersonalCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPersonalCollectionCell forIndexPath:indexPath];
    
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
