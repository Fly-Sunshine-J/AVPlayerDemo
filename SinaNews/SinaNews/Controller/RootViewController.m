//
//  RootViewController.m
//  SinaNews
//
//  Created by MS on 16/2/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "RootViewController.h"
#import "BaseViewController.h"
#import "NewsViewController.h"
#import "PictureViewController.h"
#import "VideoViewController.h"
#import "MeViewController.h"
#import "AppDelegate.h"


@interface RootViewController () {
    
    AppDelegate *_appDelegate;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _appDelegate= [UIApplication sharedApplication].delegate;
    
    [self createControllers];
    
    [self createTabBarView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBar.hidden = YES;
}


- (void)createTabBarView {
    
    _appDelegate.tabBarView = [[UIView alloc] initWithFrame:self.tabBar.frame];
    
    UIView *tabBarView = _appDelegate.tabBarView;
    
    tabBarView.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
    
    [self.view addSubview:tabBarView];
    
    NSArray *nameArray = @[@"新闻", @"图片", @"视频", @"我的"];
    
    NSArray *normalImageArray = @[@"tabbar_news", @"tabbar_picture", @"tabbar_video", @"tabbar_setting"];
    
    NSArray *HLImageArray = @[@"tabbar_news_hl", @"tabbar_picture_hl", @"tabbar_video_hl", @"tabbar_setting_hl"];
    
    CGFloat xSpace = (self.view.frame.size.width - nameArray.count * 22) / (nameArray.count + 1);
    
    for (int i = 0; i < nameArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(xSpace + (xSpace + 22) * i, 10, 22, 22);
        
        [button setImage:[UIImage imageNamed:normalImageArray[i]] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:HLImageArray[i]] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 10 + i;
        
        [tabBarView addSubview:button];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(xSpace + (xSpace + 22) * i, 32, 22, 12)];
        
        label.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
        
        label.textColor = [UIColor colorWithRed:110 / 255.0 green:110 / 255.0 blue:110 / 255.0 alpha:1];
        
        label.text = nameArray[i];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.font = [UIFont systemFontOfSize:10];
        
        label.tag = 10000 + i;
        
        [tabBarView addSubview:label];
        
        if (button.tag == 10 && label.tag == 10000) {
            
            button.selected = YES;
            
            self.selectedButton = button;
            
            self.selectedLabel = label;
            
            label.textColor = [UIColor colorWithRed:226 / 255.0 green:77 / 255.0 blue:83 / 255.0 alpha:1];
            
        }
        
    }
    
    
}


- (void)click:(UIButton *)button {
    
    self.selectedIndex = button.tag - 10;
    
    self.selectedButton.selected = NO;
    
    button.selected = YES;
    
    self.selectedButton = button;
    
    UILabel *label = [self.view viewWithTag:button.tag + 9990];
    
    self.selectedLabel.textColor = [UIColor colorWithRed:110 / 255.0 green:110 / 255.0 blue:110 / 255.0 alpha:1];
    
    label.textColor = [UIColor colorWithRed:226 / 255.0 green:77 / 255.0 blue:83 / 255.0 alpha:1];
    
    self.selectedLabel = label;
    
}


- (void)createControllers {
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"NewsViewController", @"PictureViewController", @"VideoViewController", @"MeViewController", nil];
    
    for (int i = 0; i < array.count; i++) {
        
        Class class = NSClassFromString(array[i]);
        
        UIViewController *viewController = [[class alloc] init];
    
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        nav.navigationBarHidden = YES;
        
        [array replaceObjectAtIndex:i withObject:nav];
        
    }
    
    self.viewControllers = array;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
