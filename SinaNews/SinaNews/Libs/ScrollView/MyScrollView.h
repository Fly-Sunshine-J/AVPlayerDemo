//
//  MyScrollView.h
//  MyScrollView
//
//  Created by My on 15/11/25.
//  Copyright (c) 2015年 My. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyScrollViewDelegate <NSObject>
/*!
 调用代理方法 传递点击图片事件 可以自行更改
 */
-(void)clickImageTag:(NSInteger)tag;

@end

@interface MyScrollView : UIView<UIScrollViewDelegate>
@property (nonatomic,weak)id<MyScrollViewDelegate>delegate;
/*!
 传图片名字数组或者网络图片URL生成的数组,IsFromWeb代表是否加载网络图片 PlaceHolderImage 代表占位图,如果没有传nil
 */
-(void)addImageArrayWithArray:(NSArray *)imageArray IsFromWeb:(BOOL)isFromWeb PlaceHolderImage:(UIImage *)image TitleArray:(NSArray *)titleArray;
@end
