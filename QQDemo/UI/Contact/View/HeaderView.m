//
//  HeaderView.m
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import "HeaderView.h"
#import "FriendGroup.h"

@interface HeaderView ()

@property (nonatomic, weak) UIButton *nameButton;
@property (nonatomic, weak) UILabel *countLabel;

@end

@implementation HeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    // 1.创建头部变量
    static NSString *identifier = @"header";
    HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    if (!headerView) {
        headerView = [[HeaderView alloc] initWithReuseIdentifier:identifier];
    }
    return headerView;
}

/**
 *  这个初始化方法中 HeaderView 的 frame/bounds 没有值
 */
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        // 1. 添加按钮
        UIButton *nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置背景图片
        [nameButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        // 设置箭头图片
        [nameButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        [nameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置按钮内容左对齐
        nameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内边距
        nameButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 添加按钮响应事件
        [nameButton addTarget:self action:@selector(nameButtonClick) forControlEvents:UIControlEventTouchUpInside];
        // 设置按钮内部的imageView 的内容模式为居中
        nameButton.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        nameButton.imageView.clipsToBounds = NO;
        
        self.nameButton = nameButton;
        
        [self.contentView addSubview:nameButton];
        
        // 2. 添加好友数
        UILabel *countLabel = [[UILabel alloc] init];
        countLabel.textAlignment = NSTextAlignmentRight;
        countLabel.text = @"1/10";
        countLabel.textColor = [UIColor grayColor];
        self.countLabel = countLabel;
        [self.contentView addSubview:countLabel];
        
    }
    
    return self;
    
}

/**
 * 当一个控件的 frame 发生改变的时候就会调用
 *
 *  一般在这里布局内部的子控件（设置子控件的 frame）
 */

- (void)layoutSubviews {
    
#warning 一定要调用 super 的方法
    [super layoutSubviews];
    
    // 1.设置按钮的 frame
    self.nameButton.frame = self.bounds;
    
    // 2.设置好友数的 frame

    CGFloat countY = 0;
    CGFloat countH = self.frame.size.height;
    CGFloat countW = self.frame.size.width / 8.0;
    
    CGFloat countX = self.frame.size.width - countW - 10;
    self.countLabel.frame = CGRectMake(countX, countY, countW, countH);
}

- (void)setGroup:(FriendGroup *)group {
    _group = group;
    
    // 1.设置按钮文字（组名）
    [self.nameButton setTitle:group.name forState:UIControlStateNormal];
    
    // 2.设置好友数（在线数\总数）
    self.countLabel.text = [NSString stringWithFormat:@"%d/%lu", group.online, (unsigned long)group.friends.count];
    
    // 3.覆盖箭头装套
    [self didMoveToSuperview];
}

#pragma mark - 按钮响应方法
/**
 *  监听组名按钮的点击
 */
- (void)nameButtonClick
{
    // 1.修改组模型的标记（状态取反）
    self.group.opened = !self.group.isOpened;
    
    
    // 2.刷新表格
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedName:)]) {
        [self.delegate headerViewDidClickedName:self];
    }
    


}

/**
 *  当一个控件被添加到父控件中就会调用，系统自动调用的
 */
- (void)didMoveToSuperview {
    if (self.group.opened) {
        self.nameButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameButton.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
