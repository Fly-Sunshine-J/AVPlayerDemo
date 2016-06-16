//
//  PictureBaseController.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "PictureBaseController.h"
#import "AFNetworking.h"
#import "TTModel.h"
#import "PictureFirstCell.h"
#import "PictureSecCell.h"
#import "PictureFourCell.h"
#import "DetialViewController.h"

@interface PictureBaseController ()<UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableArray *_dataArray;
    
}

@end

@implementation PictureBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}


- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
}


- (void)createDataWithURLString:(NSString *)url {
    
    _dataArray = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array = rootDic[@"data"][@"list"];
        
        for (NSDictionary *dict in array) {
            
            TTModel *model = [[TTModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dict];
            
            NSArray *array = [NSArray arrayWithObject:model];
            
            [_dataArray addObject:array];
            
        }
        
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_dataArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTModel *model = _dataArray[indexPath.section][indexPath.row];
    
    NSArray *listArray = model.pics[@"list"];
    
    if (listArray.count == 2) {
        
        PictureFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
        
        if (cell == nil) {
            
            cell = [[PictureFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
            
        }
        
        [cell configCellWithModel:model];
        
        return cell;
        
    }else if (listArray.count == 3) {
        
        PictureSecCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID1"];
        
        if (cell == nil) {
            
            cell = [[PictureSecCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID1"];
            
        }
        
        [cell configCellWithModel:model];
        
        return cell;
        
    }else{
        
        PictureFourCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID2"];
        
        if (cell == nil) {
            
            cell = [[PictureFourCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID2"];
            
        }
        
        [cell configCellWithModel:model];
        
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTModel *model = _dataArray[indexPath.section][indexPath.row];
    
    NSArray *listArray = model.pics[@"list"];
    
    if (listArray.count == 2) {
        ;
        return 320;
        
    }else if (listArray.count == 3) {
        
        return 380;
        
    }else{
       
        return 350;
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 0.1;
        
    }
    
    return 3;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 3;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TTModel *model = _dataArray[indexPath.section][indexPath.row];
    
    DetialViewController *detail = [[DetialViewController alloc] init];
    
    detail.link = model.link;
    
    [self.navigationController pushViewController:detail animated:YES];
    
}


@end
