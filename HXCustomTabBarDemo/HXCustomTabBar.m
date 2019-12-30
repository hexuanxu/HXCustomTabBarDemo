//
//  HXCustomTabBar.m
//  HXCustomTabBarDemo
//
//  Created by Tam on 2019/12/30.
//  Copyright © 2019年 devhxuan. All rights reserved.
//

#import "HXCustomTabBar.h"

@interface HXCustomTabBar()

@property (strong, nonatomic) UIButton *centerButton;

@end


@implementation HXCustomTabBar


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    
    self.userInteractionEnabled = YES;
    self.translucent = YES;
    [self.centerButton setBackgroundImage:[UIImage imageNamed:@"homePage_saoyisao"] forState:UIControlStateNormal];
    [self.centerButton setBackgroundImage:[UIImage imageNamed:@"homePage_saoyisao"] forState:UIControlStateHighlighted];
    [self.centerButton setBackgroundImage:[UIImage imageNamed:@"homePage_saoyisao"] forState:UIControlStateSelected];
    [self.centerButton addTarget:self action:@selector(centerButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.centerButton];
    
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat centerW = self.centerButton.currentBackgroundImage.size.width;
    CGFloat centerH = self.centerButton.currentBackgroundImage.size.height;
    
    self.centerButton.frame = CGRectMake((self.frame.size.width-centerW)/2, -14, centerW, centerH);
    CGFloat itemW  = self.frame.size.width / 5;
    CGFloat itemIndex = 0;
    
    // 计算每个item位置
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.frame = CGRectMake(itemIndex *itemW, child.frame.origin.y, itemW, child.frame.size.height);
            itemIndex ++;
            if (itemIndex == 2) {
                itemIndex ++;
            }
        }
    }
}


- (void)centerButtonEvent:(UIButton *)sender{
    
    if ([self.customDelegate respondsToSelector:@selector(didSelectedCenterBtn)]) {
        [self.customDelegate didSelectedCenterBtn];
    }
    
}


#pragma mark - 重写hitTest方法
// TODO: 如果不重写此方法，centerButton超出tabbar的部分点击无效
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 1. isHidden==NO 表示当前在tabbar页面
    if (self.isHidden == NO) {
        // 1.1 获取触摸点坐标系转化到centerButton上的CGPoint
        CGPoint newPoint = [self convertPoint:point toView:self.centerButton];
        // 1.2 判断point是否在centerButton上，如果在，centerButton来处理点击事件
        if ( [self.centerButton pointInside:newPoint withEvent:event]) {
            return self.centerButton;
        }
        // 1.3 如不在，系统自行处理
        else{
            return [super hitTest:point withEvent:event];
        }
    }
    // 2. 不在tabbar页面，系统自行处理点击事件
    else {
        return [super hitTest:point withEvent:event];
    }
}


- (UIButton *)centerButton {
    if (_centerButton == nil) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _centerButton;
}

@end
