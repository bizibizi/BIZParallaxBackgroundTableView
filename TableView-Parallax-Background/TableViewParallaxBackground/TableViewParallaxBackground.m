//
//  TableViewParallaxBackground.m
//  TableView-Parallax-Background
//
//  Created by Igor Bizi Mineev on 5/9/14.
//  Copyright (c) 2014 Igor Bizi Mineev. All rights reserved.
//

#import "TableViewParallaxBackground.h"

@implementation TableViewParallaxBackground

- (id)initWithFrame:(CGRect)frame_ parallaxImage:(UIImage *)parallaxImage_ andDelegate:(id<UITableViewDelegate>)parallaxDelegate_
{
    self = [super initWithFrame:frame_ style:UITableViewStyleGrouped];
    if (self) {
        self.backgroundView = [UIView new];
        self.parallaxDelegate = parallaxDelegate_;
        _parallaxImage = parallaxImage_;
        _parallaxImageView = [[UIImageView alloc] init];
        _parallaxImageView.frame = frame_;
        _parallaxImageView.contentMode = UIViewContentModeScaleAspectFill;
        _parallaxImageView.clipsToBounds = NO;
        [self.backgroundView addSubview:_parallaxImageView];
        
        _parallaxScrollSpeed = ParallaxScrollSpeedNormal;
        _screenHeight = [UIScreen mainScreen].bounds.size.height;
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        for (int i = 0; i < 2; i ++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:_parallaxImage];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = NO;
            imageView.frame = CGRectMake(0, -_parallaxImage.size.height/2 + _parallaxImageView.subviews.count * _parallaxImage.size.height, _screenWidth, _parallaxImage.size.height);
            [_parallaxImageView addSubview:imageView];
        }
        
        [self.backgroundView addSubview:_parallaxImageView];
        [self setDelegate:self];
        
        self.parallaxScrollSpeed = ParallaxScrollSpeedNormal;
    }
    return self;
}

#pragma mark - TableView Parallax Background


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _scrollViewOffsetY = scrollView.contentOffset.y;
    [self updateParallexOffset];
}

- (void)updateParallexOffset
{
    CGRect frame = _parallaxImageView.frame;
    frame.origin.y = -_scrollViewOffsetY / _parallaxScrollSpeed;
    
    if (_scrollViewOffsetY > (_parallaxImageView.subviews.count-1)*_parallaxImage.size.height - _screenHeight)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:_parallaxImage];
        imageView.frame = CGRectMake(0, -_parallaxImage.size.height/2 + _parallaxImageView.subviews.count*_parallaxImage.size.height, _screenWidth, _parallaxImage.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = NO;
        [_parallaxImageView addSubview:imageView];
    }
    
    [UIView animateWithDuration:0.075 animations:^{
        [_parallaxImageView setFrame:frame];
    }];
}


#pragma mark - TableViewDelegate


- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return self.numberOfSections;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([_parallaxDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)])
        return [_parallaxDelegate tableView:tableView heightForFooterInSection:section];
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([_parallaxDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)])
        return [_parallaxDelegate tableView:tableView heightForHeaderInSection:section];
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_parallaxDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
}


@end
