//
//  PictureFourCell.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "PictureFourCell.h"
#import "UIImageView+AFNetworking.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation PictureFourCell

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
    
    CGFloat FViewW = WIDTH / 2 - 1;
    CGFloat FViewH = FViewW / 720 * 469 + 20;
    
    self.firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, FViewW, FViewH)];
    
    self.secImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstImageView.frame) + 2, 5, FViewW, FViewH)];
    
    self.thirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.firstImageView.frame) + 2, FViewW, FViewH)];
    
    self.fourImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.thirdImageView.frame) + 2, CGRectGetMaxY(self.firstImageView.frame) + 2, FViewW, FViewH)];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.fourImageView.frame) + 10, WIDTH - 120, 20)];
    
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame), 100, 20)];
    
    self.commentCountLabel.font = [UIFont systemFontOfSize:10];
    
    self.commentCountLabel.textAlignment = NSTextAlignmentRight;
    
    self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 5, WIDTH - 20, 20)];
    
    self.introLabel.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:self.firstImageView];
    
    [self.contentView addSubview:self.secImageView];
    
    [self.contentView addSubview:self.thirdImageView];
    
    [self.contentView addSubview:self.fourImageView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.commentCountLabel];
    
    [self.contentView addSubview:self.introLabel];
    
}

- (void)configCellWithModel:(TTModel *)model {
    
    [self.firstImageView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][0][@"pic"]]];
    
    [self.secImageView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][1][@"pic"]]];
    
    [self.thirdImageView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][2][@"pic"]]];
    
    [self.fourImageView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][3][@"pic"]]];
    
    self.titleLabel.text = model.title;
    
    self.introLabel.text = model.intro;
    
    self.commentCountLabel.text = [[model.comment_count_info[@"total"] stringValue] stringByAppendingString:@"评论"];
    
}


@end
