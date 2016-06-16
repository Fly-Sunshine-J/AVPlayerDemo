//
//  VideoCell.m
//  SinaNews
//
//  Created by MS on 16/2/21.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "VideoCell.h"
#import "UIImageView+AFNetworking.h"
#import "FMGVideoPlayView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation VideoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
        
    }
    
    return self;
}

- (void)createUI {
    
    self.picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, WIDTH, WIDTH * 9 / 16)];
    
    self.picView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    
    [self.picView addGestureRecognizer:tap];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.picView.frame) + 10, 250, 30)];
    
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    self.playnumLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 100 - 10, CGRectGetMaxY(self.picView.frame) + 10, 100, 30)];
    
    self.playnumLabel.font = [UIFont systemFontOfSize:10];
    
    self.playnumLabel.textAlignment = NSTextAlignmentRight;
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    playButton.frame = CGRectMake(0, 0, 77, 77);
    
    playButton.center = self.picView.center;
    
    playButton.layer.cornerRadius = 77 / 2;
    
    playButton.layer.masksToBounds = YES;
    
    [playButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [playButton setImage:[UIImage imageNamed:@"video_cell_videoIcon"] forState:UIControlStateNormal];
    
    [self.picView addSubview:playButton];
    
    [self.contentView addSubview:self.picView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.playnumLabel];
    
    
}


- (void)click {
    
//    self.player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:self.model.video_info[@"url"]]];
//
//    self.player.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
//    
//    self.player.view.frame = self.picView.frame;
//    
//    [self.player.moviePlayer prepareToPlay];
//    
//    [self.player.moviePlayer play];
//    
//    [self.contentView addSubview:self.player.view];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removePlayer) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(playerVideoWithIndexPath:)]) {
        [self.delegate playerVideoWithIndexPath:self.indexPath];
    }
 
}

- (void)removePlayer {
    
    [self.player.view removeFromSuperview];
    
}


- (void)configCellWithModel:(TTModel *)model {
    
    [self.picView setImageWithURL:[NSURL URLWithString:model.kpic]];
    
    self.titleLabel.text = model.title;
    
    int playNum= [model.video_info[@"playnumber"] intValue];
    
    if (playNum > 10000) {
    
        self.playnumLabel.text = [NSString stringWithFormat:@"%d万播放", playNum / 10000];
        
    }else {
        
        self.playnumLabel.text = [NSString stringWithFormat:@"%d播放", playNum];
        
    }
    
    
    
    
}


@end
