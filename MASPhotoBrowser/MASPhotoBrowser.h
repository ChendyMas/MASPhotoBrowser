//
//  MASPhotoBrowser.h
//
//  Created by Chendy on 16-6-13.
//  Copyright (c) 2016年 Chendy. All rights reserved.

#import <UIKit/UIKit.h>

@protocol MASPhotoBrowserDelegate;
@interface MASPhotoBrowser : UIViewController <UIScrollViewDelegate>
// 代理
@property (nonatomic, weak) id<MASPhotoBrowserDelegate> delegate;
// 所有的图片对象
@property (nonatomic, strong) NSMutableArray *photos;
// 当前展示的图片索引
@property (nonatomic, assign) NSUInteger currentPhotoIndex;

// 显示
- (void)show;
@end

@protocol MASPhotoBrowserDelegate <NSObject>
@optional
// 切换到某一页图片
- (void)photoBrowser:(MASPhotoBrowser *)photoBrowser didChangedToPageAtIndex:(NSUInteger)index;
@end