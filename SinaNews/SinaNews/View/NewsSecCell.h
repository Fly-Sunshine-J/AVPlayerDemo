//
//  NewsSecCell.h
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTModel.h"

@interface NewsSecCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *firstPicView;

@property (nonatomic, strong) UIImageView *secPicView;

@property (nonatomic, strong) UIImageView *thirdPicView;

@property (nonatomic, strong) UILabel *commentCountLabel;


- (void)configCellWithModel:(TTModel *)model;

@end
