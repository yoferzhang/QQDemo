//
//  DynamicViewController.m
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import "DynamicViewController.h"

@interface DynamicViewController () <UITableViewDataSource, UITabBarDelegate>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self drawTableView];
}

#pragma mark - 绘制tableview

- (void)drawTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    }
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"qq";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"found_icons_qzone"];
        cell.textLabel.text = @"好友动态";
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"found_icons_gamecenter"];
            cell.textLabel.text = @"游戏";
        } else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"found_icons_readcenter"];
            cell.textLabel.text = @"阅读";
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"found_icons_folder"];
            cell.textLabel.text = @"文件助手";
        } else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"found_icons_location"];
            cell.textLabel.text = @"附近的人";
        } else if (indexPath.row == 2) {
            cell.imageView.image = [UIImage imageNamed:@"found_icons_saosao"];
            cell.textLabel.text = @"扫一扫";
        }
    }
    
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
