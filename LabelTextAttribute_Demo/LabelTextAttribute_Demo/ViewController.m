//
//  ViewController.m
//  LabelTextAttribute_Demo
//
//  Created by YZL on 17/6/16.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import "ViewController.h"

#import "UILabel+TextAttribute.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

#pragma mark - lazy load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

#pragma mark - view Func
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UILabel分类测试";
    self.tableView.hidden = NO;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    NSString *leftPriceStr = @"¥ 12.5";
    if (indexPath.row == 0) {
        cell.textLabel.text = leftPriceStr;
        [cell.textLabel setLabelWithDelLine];//设置label带有删除线
    }else if (indexPath.row == 1) {
        cell.textLabel.text = leftPriceStr;
        [cell.textLabel setLabelWithUnderLine];//设置label带有下划线
    }else if (indexPath.row == 2) {//设置label文字的指定位置的文字颜色 设置第一个字符颜色为绿色
        [cell.textLabel setLabelText:leftPriceStr Color:[UIColor greenColor] Range:NSMakeRange(0, 1)];
    }else if (indexPath.row == 3) {//设置label指定位置的文字颜色(可设置多个位置) 设置(2,2)范围内文字颜色为绿色 (5,1)范围内文字颜色为红色
         [cell.textLabel setLabelText:leftPriceStr ColorArr:@[[UIColor greenColor],[UIColor redColor]] RangeArr:@[[NSValue valueWithRange:NSMakeRange(2, 2)],[NSValue valueWithRange:NSMakeRange(5, 1)]]];
    }else if (indexPath.row == 4) {//设置label指定位置的文字颜色 设置第一个字符字体为17，颜色为黄色
        [cell.textLabel setLabelText:leftPriceStr Color:[UIColor yellowColor] Font:[UIFont systemFontOfSize:17] Range:NSMakeRange(0, 1)];
    }else if (indexPath.row == 5) {//设置label指定位置的文字颜色及行间距 设置前20个字的字体大小为20，整体行间距为5
        cell.textLabel.numberOfLines = 0;
        [cell.textLabel setLabelText:@"我是一段测试的文字而已哈哈哈哈哈哈哈哈哈我是一段测试的文字而已哈哈哈哈哈哈哈哈哈" Color:[UIColor redColor] Font:[UIFont systemFontOfSize:20] Range:NSMakeRange(0, 20) LineSpaceWithSpace:5];
    }else {//改变行间距 行间距设置为5
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = @"我是一段测试的文字而已哈哈哈哈哈哈哈哈哈我是一段测试的文字而已哈哈哈哈哈哈哈哈哈";
        [cell.textLabel changeLineSpaceWithSpace:5];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= 5) {
        return 100;
    }else {
        return 60;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
