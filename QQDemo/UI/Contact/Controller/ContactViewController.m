//
//  ContactViewController.m
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import "ContactViewController.h"
#import "FriendGroup.h"
#import "Friends.h"
#import "HeaderView.h"
#import "FriendCell.h"

@interface ContactViewController () <UITableViewDataSource, UITableViewDelegate, HeaderViewDelegate>

@property(nonatomic, strong) NSArray *groups;

@property(nonatomic, weak) UITableView *tableView;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawTableView];
}

#pragma mark - Access 方法

- (NSArray *)groups {
    if (_groups == nil) {
        NSArray *dickArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict in dickArray) {
            FriendGroup *group = [FriendGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        
        _groups = groupArray;
    }
    return _groups;
}

#pragma mark - 绘制tableview

- (void)drawTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    tableView.sectionHeaderHeight = 44;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - 数据源方法
/**
 *  有多少组取决于groups的长度
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

/**
 *  每一节有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FriendGroup *group = self.groups[section];
    return (group.isOpened ? group.friends.count : 0);
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    return <#heightForRow#>
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建 cell
    FriendCell *cell = [FriendCell cellWithTableView:tableView];
    
    // 2.设置cell的数据
    FriendGroup *group = self.groups[indexPath.section];
    cell.friendData = group.friends[indexPath.row];

    return cell;
}

/**
 *  返回每一组需要显示的头部标题（字符串）
 */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    FriendGroup *group = self.groups[section];
//    return group.name;
//}


/**
 *  The returned object can be a UILabel or UIImageView object, as well as a custom view. This method only works correctly when tableView:heightForHeaderInSection: is also implemented.
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    // 1.创建头部控件
    HeaderView *headerView = [HeaderView headerViewWithTableView:tableView];
    
    headerView.delegate = self;
    
    // 2.给headerView设置数据（给header传递模型）
    headerView.group = self.groups[section];
    
    NSLog(@"%p --- %ld", headerView, (long)section);
    
    return headerView;
}

/**
 *  这个方法不实现，就无法调用上面方法，- tableView:viewForHeaderInSection:，调了好久才发现，血崩
 * 或者设置 tableView.sectionHeaderHeight = 44;
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 44;
//}，

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - HeaderViewDelegate代理方法
/**
 *  点击了headerView上面的名字按钮时就会调用
 */
- (void)headerViewDidClickedName:(HeaderView *)headerView
{
    [self.tableView reloadData];
}


@end
