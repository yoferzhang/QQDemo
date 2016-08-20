//
//  HeaderView.h
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendGroup, HeaderView;

@protocol HeaderViewDelegate <NSObject>

@optional
- (void)headerViewDidClickedName:(HeaderView *)headerView;

@end


@interface HeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) FriendGroup *group;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@end
