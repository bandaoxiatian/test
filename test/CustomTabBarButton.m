//
//  CustomTabBarButton.m
//  test
//
//  Created by 李国强 on 15/6/8.
//  Copyright (c) 2015年 李国强. All rights reserved.
//

#import "CustomTabBarButton.h"
#import <objc/runtime.h>

typedef long (^BlkSum)(int, int);
@implementation CustomTabBarButton

{
    NSString *name;
    int b;
}

//更改button里image的rect
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    int c = 0;
    NSLog(@"!!!%p", &c);
    printf("-=--%p", name);
    return CGRectZero;
}

//更改button的title的rect
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    long a = [self sumBlock](1, 2);
    NSLog(@"---%p", &a);
    name = [[NSString alloc]initWithFormat:@"%d%@", 1, @"abc"];
    b = 0;
    NSLog(@"---%p", &b);
    NSMutableString *name2 = [name mutableCopy];
    printf("-=--%p---%p", name, name2);
    NSLog(@"adasd");
    return CGRectMake(0, contentRect.size.height/2, self.bounds.size.width, contentRect.size.height/2);
}
//以上两个方法可以实现按钮图片在上标题在下的按钮样式，比更改titleEdgeInsets更全面更强大！



- (BlkSum) sumBlock {
    int base = 100;
    BlkSum blk = ^ long (int a, int b) {
        return base + a + b;
    };
    return blk;
}
@end
