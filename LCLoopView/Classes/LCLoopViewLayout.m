//
//  LCLoopViewLayout.m
//  DiscuzApp
//
//  Created by Liu-Mac on 6/22/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import "LCLoopViewLayout.h"

@implementation LCLoopViewLayout

// 在 collectionView 的第一次布局的时候, 被调用, 此时 collectionView 的 frame 已经设置完毕
- (void)prepareLayout {
    
    // 一定要super
    [super prepareLayout];
    
    // 直接利用 collectionView 的属性设置布局
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
