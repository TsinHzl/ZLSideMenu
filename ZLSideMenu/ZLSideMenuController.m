//
//  ZLSideMenuController.m
//  ZLSideMenu
//
//  Created by hezhonglin on 16/8/2.
//  Copyright © 2016年 111. All rights reserved.
//

#import "ZLSideMenuController.h"

#define ZLSScreenW [UIScreen mainScreen].bounds.size.width
#define ZLSScreenH [UIScreen mainScreen].bounds.size.height
#define ZLMainVCFrame self.mainViewController.view.frame

static CGFloat ZLSScaleProportion = 0.7;

@implementation ZLSideMenuController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpView];
    [self addGestureR];
    
}

//设置view
- (void)setUpView
{
    self.leftViewController.view.frame = self.view.bounds;
    self.leftViewController.view.transform = CGAffineTransformScale(self.leftViewController.view.transform, ZLSScaleProportion, 1);
    CGRect frame = self.leftViewController.view.frame;
    frame.origin.x = 0;
    self.leftViewController.view.frame = frame;
    [self.view addSubview:self.leftViewController.view];
    
    ZLMainVCFrame = self.view.bounds;
    [self.view addSubview:self.mainViewController.view];
}

//添加收手势
- (void)addGestureR
{
    UIPanGestureRecognizer *panGr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGr:)];
    [self.mainViewController.view addGestureRecognizer:panGr];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGr:)];
    [self.mainViewController.view addGestureRecognizer:tapGr];
}

#pragma mark - 手势响应方法

- (void)panGr:(UIPanGestureRecognizer *)gr//垃圾代码啊我勒个去
{
    CGPoint point = [gr translationInView:self.mainViewController.view];
    if (gr.state == UIGestureRecognizerStateChanged) {
        __block CGFloat x0 = -1.0;
        if (point.x > 0 && ZLMainVCFrame.origin.x < ZLSScreenW * ZLSScaleProportion) {
            x0 = point.x;
        }else if (point.x < 0 && self.mainViewController.view.frame.origin.x > 0) {
            x0 = ZLSScreenW * ZLSScaleProportion + point.x;
            x0 = x0 < 0 ? 0 : x0;
        }
        
        if (x0 >= 0) {
            CGRect frame = ZLMainVCFrame;
            frame.origin.x = x0;
            ZLMainVCFrame = frame;
        }
        
    }else if (UIGestureRecognizerStateEnded == gr.state) {
        
        __block CGFloat x1 = 0;
        
        if (self.mainViewController.view.frame.origin.x > ZLSScreenW * 0.5 * ZLSScaleProportion) {
            x1 = self.view.frame.size.width * ZLSScaleProportion;
        }else {
            x1 = 0;
        }
        
        [UIView animateWithDuration:0.15 animations:^{
            CGRect frame = self.mainViewController.view.frame;
            frame.origin.x = x1;
            self.mainViewController.view.frame = frame;
        }];
    }
    
}

- (void)tapGr:(UITapGestureRecognizer *)tapGr
{
    if (self.mainViewController.view.frame.origin.x == ZLSScreenW * ZLSScaleProportion) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.mainViewController.view.frame;
            frame.origin.x = 0;
            self.mainViewController.view.frame = frame;
        }];
    }
}
@end
