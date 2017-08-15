//
//  LCLoopView.m
//  DiscuzApp
//
//  Created by Liu-Mac on 6/22/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import "LCLoopView.h"
#import "LCLoopViewLayout.h"
#import "LCLoopViewCell.h"

#import <Masonry.h>

NSString * const LCLoopViewCellID = @"LCLoopViewCellID";

@interface LCLoopView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) NSTimer *timer;

@end

// 独立的处理轮播器相关的代码逻辑!
@implementation LCLoopView

- (instancetype)init {
    
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[LCLoopViewLayout alloc] init]];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[LCLoopViewCell class] forCellWithReuseIdentifier:LCLoopViewCellID];
    }
    return self;
}

- (void)setUrls:(NSArray<NSString *> *)urls {
    
    _urls = urls;
    
    [self reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _urls.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LCLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LCLoopViewCellID forIndexPath:indexPath];
    
    cell.url = _urls[indexPath.item % _urls.count];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1) {
        
        // 最开始
        if (offset == 0) {
            offset = _urls.count;
        } else {
            offset = _urls.count - 1;
        }
        // 通过 offset 重新调整 contentOffset
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSUInteger currentPage = (int)(0.5 + (scrollView.contentOffset.x) / (scrollView.frame.size.width));
    
    if ([_loopViewDelegate respondsToSelector:@selector(loopView:currentPage:)]) {
        [_loopViewDelegate loopView:self currentPage:currentPage % _urls.count];
    };
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self startTimer];
}

- (void)setLoopInterval:(CGFloat)loopInterval {
    
    _loopInterval = loopInterval;
    
    [self stopTimer];
    [self startTimer];
}

#pragma mark - 定时器相关

- (void)startTimer {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:_loopInterval target:self selector:@selector(changePage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    
    [self.timer invalidate];
}

- (void)changePage {
    
    if (_urls.count == 0) return;
    
    NSInteger offset = self.contentOffset.x / self.bounds.size.width;
    
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1) {
        
        // 最开始
        if (offset == 0) {
            offset = _urls.count;
        } else {
            offset = _urls.count - 1;
        }
        // 通过 offset 重新调整 contentOffset
        self.contentOffset = CGPointMake(offset * self.bounds.size.width, 0);
    }
    
    NSUInteger nextPage = offset + 1;
    [self setContentOffset:CGPointMake(nextPage * self.frame.size.width, 0) animated:YES];
}

@end
