//
//  BaseViewController.h
//  SinaNews
//
//  Created by MS on 16/2/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UITabBarController

@property (nonatomic, strong) UIScrollView *tabBarView;

@property (nonatomic, strong) UIButton *selectedButton;

@property (nonatomic, strong) UILabel *selectedLabel;

- (void)createTabBarViewWithNameArray:(NSArray *)nameArray;

@end
