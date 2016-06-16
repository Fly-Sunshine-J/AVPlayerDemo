//
//  VideoCell.h
//  SinaNews
//
//  Created by MS on 16/2/21.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "TTModel.h"
#import <AVKit/AVKit.h>

@protocol VideoCellDelegate <NSObject>

- (void)playerVideoWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface VideoCell : UITableViewCell

@property (nonatomic, weak) id<VideoCellDelegate>delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UIImageView *picView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *playnumLabel;

@property (nonatomic, strong) TTModel *model;

@property (nonatomic, strong) MPMoviePlayerViewController *player;


- (void)configCellWithModel:(TTModel *)model;

@end
