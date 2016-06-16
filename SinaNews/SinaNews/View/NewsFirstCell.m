//
//  NewsFirstCell.m
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "NewsFirstCell.h"
#import "UIImageView+AFNetworking.h"

@implementation NewsFirstCell

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
    
    self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 86, 73)];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(106, 10, 2600, 25)];
    
    self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(106, 33, 260, 20)];
    
    self.introLabel.font = [UIFont systemFontOfSize:15];
    
    self.commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 65, 100, 20)];
    
    self.commentCountLabel.font = [UIFont systemFontOfSize:10];
    
    self.commentCountLabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:self.picImageView];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.introLabel];
    
    [self.contentView addSubview:self.commentCountLabel];
    
    
    
}

- (void)configCellWithModel:(TTModel *)model {
    
    
    [self.picImageView setImageWithURL:[NSURL URLWithString:model.pic]];
    
    self.titleLabel.text = model.title;
    
    self.introLabel.text = model.intro;
    
    self.commentCountLabel.text = [[model.comment_count_info[@"total"] stringValue] stringByAppendingString:@"评论"];
    
}



@end
