//
//  BIZParallaxBackgroundTableView.h
//  BIZParallaxBackgroundTableView.h
//
//  Created by IgorBizi@mail.ru on 5/9/15.
//  Copyright (c) 2015 IgorBizi@mail.ru. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    ParallaxScrollSpeedFast = 2,
    ParallaxScrollSpeedNormal, // default
    ParallaxScrollSpeedSlow,
} ParallaxScrollSpeed;


@interface BIZParallaxBackgroundTableView : UITableView
//! Designated initializer
- (void)setParallaxBackgroundImage:(UIImage *)image delegate:(id<UITableViewDelegate>)delegate;

@property (weak, nonatomic) id <UITableViewDelegate> parallaxDelegate;
@property (assign, nonatomic) ParallaxScrollSpeed parallaxScrollSpeed;

@end
