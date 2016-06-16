//
//  VideoViewController.m
//  SinaNews
//
//  Created by MS on 16/2/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "VideoViewController.h"
#import "XKViewController.h"
#import "ZJViewController.h"
#import "NXViewController.h"
#import "BGViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    [self createTabBarViewWithNameArray:@[@"笑cry", @"震惊", @"暖心", @"八卦"]];
    
    [self createViewCtrollers];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backItem;
}

- (void)createViewCtrollers {
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"XKViewController", @"ZJViewController", @"NXViewController", @"BGViewController", nil];
    
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
