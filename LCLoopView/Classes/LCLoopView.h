//
//  LCLoopView.h
//  DiscuzApp
//
//  Created by Liu-Mac on 6/22/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCLoopView;

@protocol LCLoopViewDelegate <NSObject>

@optional
- (void)loopView:(LCLoopView *)loopView currentPage:(NSUInteger)page;

@end

@interface LCLoopView : UICollectionView

/** 需要显示的图片的 URL */
@property (nonatomic, strong) NSArray <NSString *> *urls;
/** 切换的时间间隔 */
@property (nonatomic, assign) CGFloat loopInterval;

@property (nonatomic, weak) id<LCLoopViewDelegate> loopViewDelegate;

@end
