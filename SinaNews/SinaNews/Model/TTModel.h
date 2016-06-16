//
//  TTModel.h
//  SinaNews
//
//  Created by MS on 16/2/20.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *link;

@property (nonatomic, strong) NSString *pic;

@property (nonatomic, strong) NSString *kpic;

@property (nonatomic, strong) NSString *intro;

@property (nonatomic, strong) NSDictionary *pics;

@property (nonatomic, strong) NSString *category;

@property (nonatomic, assign) BOOL is_focus;

@property (nonatomic, strong) NSDictionary *comment_count_info;

@property (nonatomic, strong) NSDictionary *video_info;

@end
