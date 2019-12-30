//
//  MainViewController.m
//  HXCustomTabBarDemo
//
//  Created by Tam on 2019/12/30.
//  Copyright © 2019年 devhxuan. All rights reserved.
//

#import "MainViewController.h"
#import "HXProfileViewController.h"
#import "HXHomeViewController.h"
#import "HXFunctionViewController.h"
#import "HXCommunityViewController.h"

#import "HXCustomTabBar.h"

@interface MainViewController ()<CustomTabBarDelegate>

@property(nonatomic,strong)HXCustomTabBar *customTabbar;

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addChildVC];
}


- (void)addChildVC{
    
    // 首页
    HXHomeViewController *homeVC = [[HXHomeViewController alloc]init];
    [self setViewController:homeVC title:@"首页" image:@"TB_home_normal" selectImage:@"TB_home_press" index:0];
    // 功能
    HXFunctionViewController *funcVC = [[HXFunctionViewController alloc]init];
    [self setViewController:funcVC title:@"功能" image:@"TB_function_normal" selectImage:@"TB_function_press" index:1];
    // 社区
    HXCommunityViewController *commVC = [[HXCommunityViewController alloc]init];
    [self setViewController:commVC title:@"社区" image:@"TB_community_normal" selectImage:@"TB_community_press" index:2];
    // 我的
    HXProfileViewController *mineVC = [[HXProfileViewController alloc]init];
    [self setViewController:mineVC title:@"我的" image:@"TB_mine_normal" selectImage:@"TB_mine_press" index:3];
    
    self.customTabbar = [[HXCustomTabBar alloc]init];
    self.customTabbar.customDelegate = self;
    [self setValue:self.customTabbar forKey:@"tabBar"];
}


#pragma mark - 添加子控制器
-(void)setViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage index:(NSInteger)index{
   
   // viewController.title = title;
    viewController.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.tag = index;

    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self addChildViewController:nav];
}




- (void)didSelectedCenterBtn{
    
    
    NSLog(@" didSelectedCenterBtn ");
    
    
    
}



@end
