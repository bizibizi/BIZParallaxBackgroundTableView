//
//  TableViewParallaxBackground.h
//  TableView-Parallax-Background
//
//  Created by Igor Bizi Mineev on 5/9/14.
//  Copyright (c) 2014 Igor Bizi Mineev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ParallaxScrollSpeedFast = 2,
    ParallaxScrollSpeedNormal, // default speeed
    ParallaxScrollSpeedSlow,
} ParallaxScrollSpeed;



@interface TableViewParallaxBackground : UITableView <UITableViewDelegate>


- (id)initWithFrame:(CGRect)frame parallaxImage:(UIImage *)parallaxImage andDelegate:(id<UITableViewDelegate>)parallaxDelegate;

@property (weak, nonatomic) id <UITableViewDelegate> parallaxDelegate;

@property (nonatomic) CGFloat scrollViewOffsetY;
@property (strong, nonatomic) UIImageView *parallaxImageView;
@property (assign, nonatomic) ParallaxScrollSpeed parallaxScrollSpeed;
@property (nonatomic, strong) UIImage *parallaxImage;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) CGFloat screenWidth;

@end
