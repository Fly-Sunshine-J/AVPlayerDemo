//
//  MeViewController.m
//  SinaNews
//
//  Created by MS on 16/2/19.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *_tableView;
    
    NSMutableArray *_dataArray;
}

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
    
    [self createTableView];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    
    backItem.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backItem;
    
}

- (void)createData {
    
    _dataArray =[NSMutableArray array];
    
    NSArray *array1 = @[@"积分商城"];
    
    [_dataArray addObject:array1];
    
    NSArray *array2 = @[@"离线设置", @"离线下载", @"夜间模式", @"头条推送", @"仅Wi-Fi下载图片", @"正文字号", @"清除缓存"];
    
    [_dataArray addObject:array2];
    
    NSArray *array3 = @[@"Wi-Fi自动升级客户端", @"检测更新"];
    
    [_dataArray addObject:array3];
    
    NSArray *array4 = @[@"反馈", @"关于"];
    
    [_dataArray addObject:array4];
    
}

- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_dataArray[section] count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    cell.accessoryView = label;
    
    label.text = @"aaa";
    
    
    
    return cell;
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
