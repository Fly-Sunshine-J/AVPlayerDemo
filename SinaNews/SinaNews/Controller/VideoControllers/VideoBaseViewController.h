//
//  VideoBaseViewController.h
//  SinaNews
//
//  Created by MS on 16/2/21.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VideoBaseViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

- (void)createDataWithURL:(NSString *)url;

@end
