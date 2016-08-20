//
//  FriendGroup.h
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject

@property(nonatomic, copy) NSString *name;
/**
 *  数组中是 Friends 模型
 */
@property(nonatomic, strong) NSArray *friends;

@property(nonatomic, assign) int online;
/**
 *  标识这一组是否需要展开，YES 开发，NO 关闭
 */
@property(nonatomic, assign, getter=isOpened) BOOL opened;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
