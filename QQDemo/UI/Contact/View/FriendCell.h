//
//  FriendCell.h
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friends.h"

@class Friends;

@interface FriendCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) Friends *friendData;

@end
