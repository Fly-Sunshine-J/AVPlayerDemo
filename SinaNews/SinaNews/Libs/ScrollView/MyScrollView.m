//
//  MyScrollView.m
//   MyScrollView
//
//  Created by zhulei on 15/11/25.
//  Copyright (c) 2015年 My. All rights reserved.
//

#import "MyScrollView.h"
#import "UIImageView+WebCache.h"
@implementation  MyScrollView{
    
    NSTimer *_timer;
 
    UIPageControl *_pageControl;
   
    UIScrollView *_scrollView;
    
    NSInteger _imageTotalCount;
}


-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runLoopImages) userInfo:nil repeats:YES];
    }
    
    return self;
}

-(void)addImageArrayWithArray:(NSArray *)imageArray IsFromWeb:(BOOL)isFromWeb PlaceHolderImage:(UIImage *)image TitleArray:(NSArray *)titleArray{
   
    _imageTotalCount = imageArray.count;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    
    _scrollView.backgroundColor = [UIColor redColor];
    
    _scrollView.contentOffset = CGPointZero;
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
//    拖拽功能
    _scrollView.scrollEnabled = YES;
    
    _scrollView.contentSize = CGSizeMake(self.frame.size.width*(imageArray.count+1), self.frame.size.height);
    
    [self addSubview:_scrollView];
    
    for (int i = 0; i<imageArray.count ; i++) {
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        
        if (isFromWeb == NO) {
            
            [imageV setImage:[UIImage imageNamed:imageArray[i]]];

        }else{
            
            [imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",imageArray[i]]] placeholderImage:image];
        }
        
        imageV.userInteractionEnabled = YES;
        
        imageV.tag = 100+i;
       
        [_scrollView addSubview:imageV];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
        
        [imageV addGestureRecognizer:tap];
        
        if (titleArray.count != 0) {
            
            //图片标题
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame) - 30, self.frame.size.width, 30)];
            
            label.backgroundColor = [UIColor blackColor];
            
            label.alpha = 0.5;
            
            label.textColor = [UIColor whiteColor];
            
            label.text = titleArray[i];
            
            [imageV addSubview:label];
            
        }
    }
    
    UIImageView *lastView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width * imageArray.count, 0, self.frame.size.width, self.frame.size.height)];
    lastView.userInteractionEnabled = YES;
    lastView.tag = 100;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
    
    [lastView addGestureRecognizer:tap];
    
    //图片标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lastView.frame) - 30, self.frame.size.width, 30)];
    
    label.backgroundColor = [UIColor blackColor];
    
    label.alpha = 0.5;
    
    label.textColor = [UIColor whiteColor];
    
    label.text = titleArray[0];
    
    [lastView addSubview:label];
  
    if (isFromWeb == NO) {
        
        [lastView setImage:[UIImage imageNamed:imageArray[0]]];
        
    }else{
        
        [lastView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",imageArray[0]]] placeholderImage:image];
    }
    
    [_scrollView addSubview:lastView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width - 100, self.frame.size.height - 20 - 30, 100, 20)];
    
    _pageControl.currentPage = 1;
    
    _pageControl.backgroundColor = [UIColor clearColor];
    
    _pageControl.numberOfPages = imageArray.count;
    
    _pageControl.alpha = 0.5;
    
    [self addSubview:_pageControl];
    
    
    
}
-(void)clickImage:(UITapGestureRecognizer *)tap{
    
    [self.delegate clickImageTag:tap.view.tag];

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger page = scrollView.contentOffset.x/self.frame.size.width;
    _pageControl.currentPage = page;
    
}
-(void)runLoopImages{
    
    CGFloat w = self.frame.size.width;
    
    
    [UIView animateWithDuration:1 animations:^{
        
        
        _scrollView.contentOffset=CGPointMake(_scrollView.contentOffset.x+w, 0);
        
    } completion:^(BOOL finished) {
        
        
        if(_scrollView.contentOffset.x==self.frame.size.width*_imageTotalCount)
            
            _scrollView.contentOffset=CGPointMake(0, 0);
        
    }];
    
    _pageControl.currentPage = _scrollView.contentOffset.x/w  ;
   
    if (_scrollView.contentOffset.x == _imageTotalCount*self.frame.size.width) {
        
        _pageControl.currentPage = 0;
    }
}
@end
