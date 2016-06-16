//
//  DetialViewController.m
//  SinaNews
//
//  Created by MS on 16/2/22.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "DetialViewController.h"

@interface DetialViewController ()

@end

@implementation DetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.link]];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
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
