//
//  LCLoopViewCell.m
//  DiscuzApp
//
//  Created by Liu-Mac on 6/22/17.
//  Copyright © 2017 Liu-Mac. All rights reserved.
//

#import "LCLoopViewCell.h"

#import <YYWebImage.h>

@implementation LCLoopViewCell {
    
    UIImageView *_imageView;
}

// collectionViewCell 的 frame 是根据之前的 layout 已经确定好的!
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 添加图像视图
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setUrl:(NSString *)url {
    
    _url = url;
    
    [_imageView yy_setImageWithURL:[NSURL URLWithString:url] placeholder:nil];
}

@end
