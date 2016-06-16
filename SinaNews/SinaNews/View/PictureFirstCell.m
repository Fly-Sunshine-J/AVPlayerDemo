//
//  PictureFirstCell.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "PictureFirstCell.h"
#import "UIImageView+AFNetworking.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation PictureFirstCell

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
    CGFloat FViewH = FViewW / 130 * 172 + 10;
    
    self.firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, FViewW, FViewH)];
    
    self.secImageView = [[UIImageView alloc] initWithFrame:CGRectMake(FViewW + 2, 5, FViewW, FViewH)];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, FViewH + 10, WIDTH - 120, 20)];
    
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 110, FViewH + 10, 100, 20)];
    
    self.commentCountLabel.font = [UIFont systemFontOfSize:10];
    
    self.commentCountLabel.textAlignment = NSTextAlignmentRight;
    
    self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, FViewH + 40, WIDTH - 20, 20)];
    
    self.introLabel.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:self.firstImageView];
    
    [self.contentView addSubview:self.secImageView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.commentCountLabel];
    
    [self.contentView addSubview:self.introLabel];
    
}

- (void)configCellWithModel:(TTModel *)model {
    
    [self.firstImageView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][0][@"pic"]]];
    
    [self.secImageView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][1][@"pic"]]];
    
    self.titleLabel.text = model.title;
    
    self.introLabel.text = model.intro;
    
    self.commentCountLabel.text = [[model.comment_count_info[@"total"] stringValue] stringByAppendingString:@"评论"];
    
}



@end
