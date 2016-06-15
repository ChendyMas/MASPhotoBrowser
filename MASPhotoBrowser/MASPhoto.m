//
//  MASPhoto.m
//
//  Created by Chendy on 16-6-13.
//  Copyright (c) 2016年 Chendy. All rights reserved.

#import <QuartzCore/QuartzCore.h>
#import "MASPhoto.h"

@implementation MASPhoto

#pragma mark 截图
- (UIImage *)capture:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)setSrcImageView:(UIImageView *)srcImageView {
    
    _srcImageView = srcImageView;
    _placeholder = srcImageView.image;
    if (srcImageView.clipsToBounds) {
        
        _capture = [self capture:srcImageView];
    }
}

@end