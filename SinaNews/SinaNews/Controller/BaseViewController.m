//
//  BaseViewController.m
//  SinaNews
//
//  Created by MS on 16/2/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBarView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBar.hidden = YES;
    
}


- (void)createBarView {
    
    self.tabBarView= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    
    self.tabBarView.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
    
    self.tabBarView.bounces = NO;
    
    self.tabBarView.showsHorizontalScrollIndicator = NO;
    
    self.tabBarView.contentOffset = CGPointZero;
    
    [self.view addSubview:self.tabBarView];
    
    
}

- (void)createTabBarViewWithNameArray:(NSArray *)nameArray {
        
    if (nameArray.count >= 9) {
        
        self.tabBarView.contentSize = CGSizeMake(10 + (20 + 45) * nameArray.count, 64);
        
    }else {
        
        self.tabBarView.contentSize = CGSizeMake(self.view.frame.size.width, 64);
        
    }
        
        for (int i = 0; i < nameArray.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [button setTitle:nameArray[i] forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [button addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
            
            button.tag = 1000 + i;
            
            [self.tabBarView addSubview:button];
            
            UILabel *label = [[UILabel alloc] init];
            
            label.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
            
            label.tag = 500 + i;
            
            [self.tabBarView addSubview:label];
            
            if (button.tag == 1000 && label.tag == 500) {
                
                button.selected = YES;
                
                self.selectedButton = button;
                
                label.backgroundColor = [UIColor redColor];
                
                self.selectedLabel = label;
                
            }
            
            if (nameArray.count >= 8) {
                
                button.frame = CGRectMake(10 + (20 + 45) * i, 30, 45, 20);
                
                CGFloat labelY =  CGRectGetMaxY(button.frame) + 12;
                
                label.frame = CGRectMake(10 + (20 + 45) * i, labelY, 45, 2);
        
            }else {
                
                CGFloat xSpace = (self.view.frame.size.width - nameArray.count * 45) / (nameArray.count + 1);
                
                button.frame = CGRectMake(xSpace + (xSpace + 45) * i, 30, 45, 20);
                
                label.frame = CGRectMake(xSpace + (xSpace + 45) * i, 62, 45, 2);
                
            }
            
    }
    
}


- (void)click1:(UIButton *)button {
    
    self.selectedIndex = button.tag - 1000;
    
    self.selectedButton.selected = NO;
    
    button.selected = YES;
    
    self.selectedButton = button;
    
    UILabel *label = [self.tabBarView viewWithTag:button.tag - 500];
    
    self.selectedLabel.backgroundColor = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
    
    label.backgroundColor = [UIColor redColor];
    
    self.selectedLabel = label;
    
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
