//
//  XKViewController.m
//  SinaNews
//
//  Created by MS on 16/2/21.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "XKViewController.h"

@interface XKViewController ()

@end

@implementation XKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDataWithURL:@"http://api.sina.cn/sinago/list.json?channel=video_funny"];
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
