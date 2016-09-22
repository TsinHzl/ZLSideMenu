//
//  ZLLeftViewController.m
//  ZLSideMenu
//
//  Created by hezhonglin on 16/8/2.
//  Copyright © 2016年 111. All rights reserved.
//

#import "ZLLeftViewController.h"

@interface ZLLeftViewController()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, weak)UITableView *tableView;

@end

@implementation ZLLeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpView];
}

- (void)setUpView
{
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:bgImageView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor clearColor];
    self.tableView = tableView;
}

#pragma mark - 代理、数据源放方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell ---- %ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//实现cell显示时候的动画效果
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
        //设置Cell的动画效果为3D效果
        //设置x和y的初始值为0.1；
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
        //x和y的最终值为1
        [UIView animateWithDuration:0.7 animations:^{
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }];
}
@end
