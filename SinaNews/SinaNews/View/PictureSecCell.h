//
//  PictureSecCell.h
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTModel.h"

@interface PictureSecCell : UITableViewCell

@property (nonatomic, strong) UIImageView *firstImageView;

@property (nonatomic, strong) UIImageView *secImageView;

@property (nonatomic, strong) UIImageView *thirdImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *introLabel;

@property (nonatomic, strong) UILabel *commentCountLabel;

- (void)configCellWithModel:(TTModel *)model;

@end
