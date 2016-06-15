//
//  MASPhotoLoadingView.h
//
//  Created by Chendy on 16-6-13.
//  Copyright (c) 2016年 Chendy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMinProgress 0.0001

@class MASPhotoBrowser;
@class MASPhoto;

@interface MASPhotoLoadingView : UIView
@property (nonatomic) float progress;

- (void)showLoading;
- (void)showFailure;
@end