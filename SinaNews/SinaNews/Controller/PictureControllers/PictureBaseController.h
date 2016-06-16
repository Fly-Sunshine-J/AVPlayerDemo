//
//  PictureBaseController.h
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureBaseController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

- (void)createDataWithURLString:(NSString *)url;

@end
