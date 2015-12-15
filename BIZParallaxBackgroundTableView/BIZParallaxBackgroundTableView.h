//
//  BIZParallaxBackgroundTableView.h
//  BIZParallaxBackgroundTableView.h
//
//  Created by IgorBizi@mail.ru on 5/9/15.
//  Copyright (c) 2015 IgorBizi@mail.ru. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    kParallaxScrollSpeedFast = 2,
    kParallaxScrollSpeedNormal, // default
    kParallaxScrollSpeedSlow,
} kParallaxScrollSpeed;


@interface BIZParallaxBackgroundTableView : UITableView
//! Designated initializer
- (void)setParallaxBackgroundImage:(UIImage *)image delegate:(id<UITableViewDelegate>)delegate;
//! Getter
@property (weak, nonatomic) id <UITableViewDelegate> parallaxDelegate;
//! Remove parallax
- (void)removeParallax;

//! Speed of parallax motion
@property (assign, nonatomic) kParallaxScrollSpeed parallaxScrollSpeed;
//! Overlay background color. Alpha should be less then 1.0
@property (nonatomic, strong) UIColor *overlayColor;


@end
