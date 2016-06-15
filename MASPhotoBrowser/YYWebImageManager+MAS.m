//
//  YYWebImageManager+MAS.m
//  HttpCategroy
//
//  Created by Chendy on 16/6/14.
//  Copyright © 2016年 Chendy. All rights reserved.
//

#import "YYWebImageManager+MAS.h"

@implementation YYWebImageManager (MAS)

+ (void)downloadWithURL:(NSURL *)url {
    // cmp不能为空
    [[self sharedManager] requestImageWithURL:url
                                      options:YYWebImageOptionIgnoreFailedURL |YYWebImageOptionShowNetworkActivity
                                     progress:nil
                                    transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                                        return image;
                                    } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        
                                    }];
     
     
     
     
}

@end
