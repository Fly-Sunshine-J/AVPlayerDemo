//
//  NewsSecCell.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "NewsSecCell.h"
#import "UIImageView+AFNetworking.h"

@implementation NewsSecCell

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
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 355, 30)];
    
    self.firstPicView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 112, 73)];
    
    self.secPicView = [[UIImageView alloc] initWithFrame:CGRectMake(132, 50, 112, 73)];
    
    self.thirdPicView = [[UIImageView alloc] initWithFrame:CGRectMake(254, 50, 112, 73)];
    
    self.commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 113, 100, 20)];
    
    self.commentCountLabel.textAlignment = NSTextAlignmentRight;
    
    self.commentCountLabel.font = [UIFont systemFontOfSize:10];
    
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.firstPicView];
    
    [self.contentView addSubview:self.secPicView];
    
    [self.contentView addSubview:self.thirdPicView];
    
    [self.contentView addSubview:self.commentCountLabel];
    
}


- (void)configCellWithModel:(TTModel *)model {
    
    self.titleLabel.text = model.title;
    
    [self.firstPicView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][0][@"pic"]]];
    
    [self.secPicView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][1][@"pic"]]];
    
    [self.thirdPicView setImageWithURL:[NSURL URLWithString:model.pics[@"list"][2][@"pic"]]];
    
    self.commentCountLabel.text = [[model.comment_count_info[@"tatal"] stringValue] stringByAppendingString:@"评论"];
    
}


@end
