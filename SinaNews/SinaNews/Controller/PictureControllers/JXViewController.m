//
//  JXViewController.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "JXViewController.h"

@interface JXViewController ()

@end

@implementation JXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDataWithURLString:@"http://api.sina.cn/sinago/list.json?channel=hdpic_toutiao"];
    
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
