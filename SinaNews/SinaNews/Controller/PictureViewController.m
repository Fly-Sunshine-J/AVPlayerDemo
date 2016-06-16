//
//  PictureViewController.m
//  SinaNews
//
//  Created by MS on 16/2/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "PictureViewController.h"
#import "JXViewController.h"
#import "QQViewController.h"
#import "MXViewController.h"
#import "JJViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self createTabBarViewWithNameArray:@[@"精选", @"奇趣", @"明星", @"竞技"]];
    
    [self createControllers];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backItem;
}




- (void)createControllers {
    
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"JXViewController", @"QQViewController",@"MXViewController", @"JJViewController", nil];
    
    for (int i = 0; i < array.count; i++) {
        
        Class class = NSClassFromString(array[i]);
        
        UIViewController *viewController = [[class alloc] init];
        
        [array replaceObjectAtIndex:i withObject:viewController];
        
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
