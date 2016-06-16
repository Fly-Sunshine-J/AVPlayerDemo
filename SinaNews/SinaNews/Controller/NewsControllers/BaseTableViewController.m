//
//  BaseTableViewController.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "BaseTableViewController.h"
#import "AFNetworking.h"
#import "TTModel.h"
#import "MyScrollView.h"
#import "NewsFirstCell.h"
#import "NewsSecCell.h"
#import "DetialViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface BaseTableViewController ()<UITableViewDelegate, UITableViewDataSource, MyScrollViewDelegate> {
    
    NSMutableArray *_newsArray;
    
    NSMutableArray *_adArray;
    
    NSMutableArray *_titleArray;
    
    NSMutableArray *_linkArray;
    
}

@end

@implementation BaseTableViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self createTableView];
    
}


- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

- (void)createDataWithURL:(NSString *)url {
    
    _newsArray = [NSMutableArray array];
    
    _adArray = [NSMutableArray array];
    
    _titleArray = [NSMutableArray array];
    
    _linkArray = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *array = rootDic[@"data"][@"list"];
        
        for (NSDictionary *dict in array) {
            
            TTModel *model = [[TTModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dict];
            
            if ([model.category isEqualToString:@"hdpic"] && model.is_focus == YES) {
                
                NSString *url = model.kpic;
                
                NSString *link = model.link;
                
                NSString *title = model.title;
                
                [_titleArray addObject:title];
                
                [_adArray addObject:url];
                
                [_linkArray addObject:link];
                
            }else{
                
                [_newsArray addObject:model];
                
            }
            
        }
        
        [self.tableView reloadData];
        
        [self createAdView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
    
}


- (void)createAdView {
    
    if (_adArray.count != 0) {
        
        MyScrollView *scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH / 2)];
        
        scrollView.delegate = self;
        
        [scrollView addImageArrayWithArray:_adArray IsFromWeb:YES PlaceHolderImage:nil TitleArray:_titleArray];
        
        self.tableView.tableHeaderView = scrollView;

        
    }
}


- (void)clickImageTag:(NSInteger)tag {
    
    DetialViewController *detail = [[DetialViewController alloc] init];
    
    detail.link = _linkArray[tag - 100];
    
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _newsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTModel *model = _newsArray[indexPath.row];
    
    if (![model.category isEqualToString:@"hdpic"]) {
        
        NewsFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
        
        if (cell == nil) {
            
            cell = [[NewsFirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
            
        }
        
        [cell configCellWithModel:model];
        
        return cell;
        
        
    }else{
        
    
        NewsSecCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID1"];
        
        if (cell == nil) {
            
            cell = [[NewsSecCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID1"];
            
        }
        
        [cell configCellWithModel:model];
        
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTModel *model = _newsArray[indexPath.row];
    
    if (![model.category isEqualToString:@"hdpic"]) {
        
        return 90;
        
    }else{
        
        return 143;
        
    }
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTModel *model = _newsArray[indexPath.row];
    
    DetialViewController *detail = [[DetialViewController alloc] init];
    
    detail.link = model.link;
    
    [self.navigationController pushViewController:detail animated:YES];
    
    
    
}


@end
