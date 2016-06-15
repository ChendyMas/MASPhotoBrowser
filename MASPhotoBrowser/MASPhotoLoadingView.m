//
//  MASPhotoLoadingView.m
//
//  Created by Chendy on 16-6-13.
//  Copyright (c) 2016年 Chendy. All rights reserved.
//

#import "MASPhotoLoadingView.h"
#import "MASPhotoBrowser.h"
#import <QuartzCore/QuartzCore.h>
#import "MASPhotoProgressView.h"

@interface MASPhotoLoadingView () {
    
    UILabel *_failureLabel;
    MASPhotoProgressView *_progressView;
}

@end

@implementation MASPhotoLoadingView

- (void)setFrame:(CGRect)frame {
    
    [super setFrame:[UIScreen mainScreen].bounds];
}

- (void)showFailure {
    
    [_progressView removeFromSuperview];
    
    if (_failureLabel == nil) {
        _failureLabel = [[UILabel alloc] init];
        _failureLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, 44);
        _failureLabel.textAlignment = NSTextAlignmentCenter;
        _failureLabel.center = self.center;
        _failureLabel.text = @"网络不给力，图片下载失败";
        _failureLabel.font = [UIFont boldSystemFontOfSize:20];
        _failureLabel.textColor = [UIColor whiteColor];
        _failureLabel.backgroundColor = [UIColor clearColor];
        _failureLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    [self addSubview:_failureLabel];
}

- (void)showLoading {
    
    [_failureLabel removeFromSuperview];
    
    if (_progressView == nil) {
        _progressView = [[MASPhotoProgressView alloc] init];
        _progressView.bounds = CGRectMake( 0, 0, 60, 60);
        _progressView.center = self.center;
    }
    _progressView.progress = kMinProgress;
    [self addSubview:_progressView];
}

#pragma mark - customlize method
- (void)setProgress:(float)progress {
    
    _progress = progress;
    _progressView.progress = progress;
    if (progress >= 1.0) {
        [_progressView removeFromSuperview];
    }
}
@end
