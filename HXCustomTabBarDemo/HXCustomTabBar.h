//
//  HXCustomTabBar.h
//  HXCustomTabBarDemo
//
//  Created by Tam on 2019/12/30.
//  Copyright © 2019年 devhxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CustomTabBarDelegate <NSObject>


- (void)didSelectedCenterBtn;

@end



@interface HXCustomTabBar : UITabBar


@property(nonatomic,weak)id <CustomTabBarDelegate> customDelegate;


@end

NS_ASSUME_NONNULL_END
