//
//  VideoBaseViewController.m
//  SinaNews
//
//  Created by MS on 16/2/21.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "VideoBaseViewController.h"
#import "AFNetworking.h"
#import "TTModel.h"
#import "VideoCell.h"
#import "FMGVideoPlayView.h"

@interface VideoBaseViewController ()<UITableViewDelegate, UITableViewDataSource,VideoCellDelegate> {
    
    NSMutableArray *_dataArray;
    
    FMGVideoPlayView *_fmgVideoPlayView;
}

@end

@implementation VideoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fmgVideoPlayView = [FMGVideoPlayView videoPlayView];
    [self createTableView];
    
}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStyleGrouped];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.view addSubview: self.tableView];
    
}


- (void)createDataWithURL:(NSString *)url {
    
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return _dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_dataArray[section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    if (cell == nil) {
        
        cell = [[VideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
        
    }
    cell.delegate = self;
    
    TTModel *model = _dataArray[indexPath.section][indexPath.row];
    
    [cell configCellWithModel:model];
    
    cell.model = model;
    cell.indexPath = indexPath;
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 260;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0.1;
    }
    
    return 3;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    VideoCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    if (cell.player.moviePlayer.readyForDisplay) {
//        [cell.player.view removeFromSuperview];
//        
//        NSLog(@"aaaa");
//    }else {
//        
//        NSLog(@"bbbb");
//    }
    
}


- (void)playerVideoWithIndexPath:(NSIndexPath *)indexPath {
    _fmgVideoPlayView.hidden = YES;
//    _fmgVideoPlayView.index = indexPath.row;
    TTModel *model = _dataArray[indexPath.section][indexPath.row];
    [_fmgVideoPlayView setUrlString:model.video_info[@"url"]];
    VideoCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    _fmgVideoPlayView.frame = cell.picView.frame;
    [cell.contentView addSubview:_fmgVideoPlayView];
    _fmgVideoPlayView.contrainerViewController = self;
    [_fmgVideoPlayView.player play];
//    [_fmgVideoPlayView showToolView:NO];
    _fmgVideoPlayView.playOrPauseBtn.selected = YES;
    _fmgVideoPlayView.hidden = NO;
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
