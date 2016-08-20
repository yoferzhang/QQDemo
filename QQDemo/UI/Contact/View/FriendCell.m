//
//  FriendCell.m
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import "FriendCell.h"
#import "Friends.h"

@implementation FriendCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"friend";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)setFriendData:(Friends *)friendData {
    _friendData = friendData;
    
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
    self.detailTextLabel.text = friendData.intro;
    
}

@end
