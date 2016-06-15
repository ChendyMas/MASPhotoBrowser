//
//  MASPhotoView.h
//
//  Created by Chendy on 16-6-13.
//  Copyright (c) 2016年 Chendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MASPhotoBrowser, MASPhoto, MASPhotoView;

@protocol MASPhotoViewDelegate <NSObject>
- (void)photoViewImageFinishLoad:(MASPhotoView *)photoView;
- (void)photoViewSingleTap:(MASPhotoView *)photoView;
- (void)photoViewDidEndZoom:(MASPhotoView *)photoView;
@end

@interface MASPhotoView : UIScrollView <UIScrollViewDelegate>
// 图片
@property (nonatomic, strong) MASPhoto *photo;
// 代理
@property (nonatomic, weak) id<MASPhotoViewDelegate> photoViewDelegate;
@end