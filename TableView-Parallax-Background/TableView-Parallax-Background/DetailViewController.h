//
//  DetailViewController.h
//  TableView-Parallax-Background
//
//  Created by Igor Bizi Mineev on 5/9/14.
//  Copyright (c) 2014 Igor Bizi Mineev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
