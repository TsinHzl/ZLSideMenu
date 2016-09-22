//
//  ZLRightViewController.m
//  ZLSideMenu
//
//  Created by hezhonglin on 16/8/2.
//  Copyright © 2016年 111. All rights reserved.
//

#import "ZLRightViewController.h"
#import "UIView+ZLExtension.h"

@interface ZLRightViewController()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak)UITableView *tableView;

@end

@implementation ZLRightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self setUpView];
}

- (void)setUpView
{
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:bgImageView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
#pragma mark - 代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID1"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID1"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = @"cellHGHHHH";
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}
//这句代理方法实现cell显示的时候的动画效果,这是在cell即将显示的时候会自动调用的一句代理方法，可以在这个方法里面实现很多漂亮的cell动画显示效果
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    //设置Cell的动画效果为3D效果
//    //设置x和y的初始值为0.1；
//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    //x和y的最终值为1
//    [UIView animateWithDuration:0.5 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
    cell.zl_x = -[UIScreen mainScreen].bounds.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        cell.zl_x = 0;
    } completion:nil];
}
@end
