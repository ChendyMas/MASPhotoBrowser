//
//  ViewController.m
//  MASPhotoBrowserDemo
//
//  Created by Chendy on 16/6/14.
//  Copyright © 2016年 Chendy. All rights reserved.
//

#import "ViewController.h"
#import "MASPhoto.h"
#import "MASPhotoView.h"
#import "MASPhotoBrowser.h"
#import <YYWebImage/YYWebImage.h>

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *photosArray;

@property (nonatomic, strong) UIView *bgView;

@end

@implementation ViewController

- (NSMutableArray *)photosArray {
    
    if (!_photosArray) {
        
        _photosArray = [NSMutableArray arrayWithArray:@[@"http://7xozpn.com2.z0.glb.qiniucdn.com/IMG_14610446455364140.jpg",@"http://7xozpn.com2.z0.glb.qiniucdn.com/IMG_14610446487051816.jpg",@"http://7xozpn.com2.z0.glb.qiniucdn.com/IMG_14610446552799490.jpg",@"http://7xozpn.com2.z0.glb.qiniucdn.com/IMG_14610446576634896.jpg"]];
    }
    
    return _photosArray;
}

- (UIView *)bgView {
    
    if (!_bgView) {
        
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor orangeColor];
        _bgView.bounds = CGRectMake(0, 0, 320, 320);
        _bgView.center = self.view.center;
    }
    
    return _bgView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.bgView];
    
    [self.photosArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIImageView *imageView = [UIImageView new];
        imageView.frame = CGRectMake(10+(80+10)*(idx%2), 10+(90*(idx/2)), 80, 80);
        [imageView yy_setImageWithURL:[NSURL URLWithString:obj] options:YYWebImageOptionShowNetworkActivity];
        
        UITapGestureRecognizer *imageViewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPhoto:)];
        imageView.tag = idx;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:imageViewtap];
        [self.bgView addSubview:imageView];
    }];
    

}

- (void)tapPhoto:(UITapGestureRecognizer *)recognizer {
    //1.创建图片浏览器
    MASPhotoBrowser *brower = [[MASPhotoBrowser alloc] init];
    
    //2.告诉图片浏览器显示所有的图片
    NSMutableArray *photos = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i < self.photosArray.count; i++) {
        NSString *str = self.photosArray[i];
        //传递数据给浏览器
        MASPhoto *photo = [[MASPhoto alloc] init];
        photo.url = [NSURL URLWithString:str];
        photo.srcImageView = self.bgView.subviews[i]; //设置来源哪一个UIImageView
        [photos addObject:photo];
    }
    brower.photos = photos;
    
    //3.设置默认显示的图片索引
    brower.currentPhotoIndex = recognizer.view.tag;
    
    //4.显示浏览器
    [brower show];
}

@end
