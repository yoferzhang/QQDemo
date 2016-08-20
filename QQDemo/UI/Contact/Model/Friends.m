//
//  Friends.m
//  TabBarController
//
//  Created by yoferzhang on 16/8/18.
//  Copyright © 2016年 yoferzhang. All rights reserved.
//

#import "Friends.h"

@implementation Friends

+ (instancetype)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
