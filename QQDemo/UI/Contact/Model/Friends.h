//
//  Friends.h
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friends : NSObject

/**
 *  名字
 */
@property(nonatomic, strong) NSString *name;
/**
 *  头像
 */
@property(nonatomic, strong) NSString *icon;
/**
 *  简介
 */
@property(nonatomic, strong) NSString *intro;
/**
 *  是否是 VIP
 */
@property(nonatomic, assign, getter=isVip) BOOL vip;


+ (instancetype)friendWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
