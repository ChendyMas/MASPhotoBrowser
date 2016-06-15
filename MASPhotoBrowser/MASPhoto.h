//
//  MASPhoto.h
//
//  Created by Chendy on 16-6-13.
//  Copyright (c) 2016年 Chendy. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MASPhoto : NSObject
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) UIImage *image; // 完整的图片

@property (nonatomic, strong) UIImageView *srcImageView; // 来源view
@property (nonatomic, strong, readonly) UIImage *placeholder;
@property (nonatomic, strong, readonly) UIImage *capture;

@property (nonatomic, assign) BOOL firstShow;

// 是否已经保存到相册
@property (nonatomic, assign) BOOL save;
@property (nonatomic, assign) NSInteger index; // 索引
@end