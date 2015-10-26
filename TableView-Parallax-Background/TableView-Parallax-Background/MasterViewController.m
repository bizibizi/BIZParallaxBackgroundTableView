//
//  MasterViewController.m
//  TableView-Parallax-Background
//
//  Created by Igor Bizi Mineev on 5/9/14.
//  Copyright (c) 2014 Igor Bizi Mineev. All rights reserved.
//

#import "MasterViewController.h"

 
@interface MasterViewController ()
@property (nonatomic) NSArray *dataSource;
@property (nonatomic) UITableView *tableView;
@end


@implementation MasterViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = @[@"abruptest",
                 @"absolutest",
                 @"abstractest",
                 @"acutest",
                 @"adeptest",
                 @"adroitest",
                 @"alertest",
                 @"ancientest",
                 @"aptest",
                 @"attest",
                 @"attestation",
                 @"attestations",
                 @"attested",
                 @"attester",
                 @"attesters",
                 @"attesting",
                 @"attestor",
                 @"attestors",
                 @"attests",
                 @"augustest",
                 @"bluntest",
                 @"brightest",
                 @"chastest",
                 @"coattest",
                 @"coattested",
                 @"coattesting",
                 @"coattests",
                 @"compactest",
                 @"completest",
                 @"contest",
                 @"contestable",
                 @"contestant",
                 @"contestants",
                 @"contestation",
                 @"contestations",
                 @"contested",
                 @"contester",
                 @"contesters",
                 @"contesting",
                 @"contests",
                 @"correctest",
                 @"corruptest",
                 @"counterprotest",
                 @"counterprotests",
                 @"curtest",
                 @"cutest",
                 @"absolutest",
                 @"abstractest",
                 @"acutest",
                 @"adeptest",
                 @"adroitest",
                 @"alertest",
                 @"ancientest",
                 @"aptest",
                 @"attest",
                 @"attestation",
                 @"attestations",
                 @"attested",
                 @"attester",
                 @"attesters",
                 @"attesting",
                 @"attestor",
                 @"attestors",
                 @"attests",
                 @"augustest",
                 @"bluntest",
                 @"brightest",
                 @"chastest",
                 @"coattest",
                 @"coattested",
                 @"coattesting",
                 @"coattests",
                 @"compactest",
                 @"completest",
                 @"contest",
                 @"contestable",
                 @"contestant",
                 @"contestants",
                 @"contestation",
                 @"contestations",
                 @"contested",
                 @"contester",
                 @"contesters",
                 @"contesting",
                 @"contests",
                 @"correctest",
                 @"corruptest",
                 @"counterprotest",
                 @"counterprotests",
                 @"curtest",
                 @"cutest",
                 @"absolutest",
                 @"abstractest",
                 @"acutest",
                 @"adeptest",
                 @"adroitest",
                 @"alertest",
                 @"ancientest",
                 @"aptest",
                 @"attest",
                 @"attestation",
                 @"attestations",
                 @"attested",
                 @"attester",
                 @"attesters",
                 @"attesting",
                 @"attestor",
                 @"attestors",
                 @"attests",
                 @"augustest",
                 @"bluntest",
                 @"brightest",
                 @"chastest",
                 @"coattest",
                 @"coattested",
                 @"coattesting",
                 @"coattests",
                 @"compactest",
                 @"completest",
                 @"contest",
                 @"contestable",
                 @"contestant",
                 @"contestants",
                 @"contestation",
                 @"contestations",
                 @"contested",
                 @"contester",
                 @"contesters",
                 @"contesting",
                 @"contests",
                 @"correctest",
                 @"corruptest",
                 @"counterprotest",
                 @"counterprotests",
                 @"curtest",
                 @"cutest",
                 @"absolutest",
                 @"abstractest",
                 @"acutest",
                 @"adeptest",
                 @"adroitest",
                 @"alertest",
                 @"ancientest",
                 @"aptest",
                 @"attest",
                 @"attestation",
                 @"attestations",
                 @"attested",
                 @"attester",
                 @"attesters",
                 @"attesting",
                 @"attestor",
                 @"attestors",
                 @"attests",
                 @"augustest",
                 @"bluntest",
                 @"brightest",
                 @"chastest",
                 @"coattest",
                 @"coattested",
                 @"coattesting",
                 @"coattests",
                 @"compactest",
                 @"completest",
                 @"contest",
                 @"contestable",
                 @"contestant",
                 @"contestants",
                 @"contestation",
                 @"contestations",
                 @"contested",
                 @"contester",
                 @"contesters",
                 @"contesting",
                 @"contests",
                 @"correctest",
                 @"corruptest",
                 @"counterprotest",
                 @"counterprotests",
                 @"curtest",
                 @"cutest",
                 @"absolutest",
                 @"abstractest",
                 @"acutest",
                 @"adeptest",
                 @"adroitest",
                 @"alertest",
                 @"ancientest",
                 @"aptest",
                 @"attest",
                 @"attestation",
                 @"attestations",
                 @"attested",
                 @"attester",
                 @"attesters",
                 @"attesting",
                 @"attestor",
                 @"attestors",
                 @"attests",
                 @"augustest",
                 @"bluntest",
                 @"brightest",
                 @"chastest",
                 @"coattest",
                 @"coattested",
                 @"coattesting",
                 @"coattests",
                 @"compactest",
                 @"completest",
                 @"contest",
                 @"contestable",
                 @"contestant",
                 @"contestants",
                 @"contestation",
                 @"contestations",
                 @"contested",
                 @"contester",
                 @"contesters",
                 @"contesting",
                 @"contests",
                 @"correctest",
                 @"corruptest",
                 @"counterprotest",
                 @"counterprotests",
                 @"curtest",
                 @"cutest",
                 @"absolutest",
                 @"abstractest",
                 @"acutest",
                 @"adeptest",
                 @"adroitest",
                 @"alertest",
                 @"ancientest",
                 @"aptest",
                 @"attest",
                 @"attestation",
                 @"attestations",
                 @"attested",
                 @"attester",
                 @"attesters",
                 @"attesting",
                 @"attestor",
                 @"attestors",
                 @"attests",
                 @"augustest",
                 @"bluntest",
                 @"brightest",
                 @"chastest",
                 @"coattest",
                 @"coattested",
                 @"coattesting",
                 @"coattests",
                 @"compactest",
                 @"completest",
                 @"contest",
                 @"contestable",
                 @"contestant",
                 @"contestants",
                 @"contestation",
                 @"contestations",
                 @"contested",
                 @"contester",
                 @"contesters",
                 @"contesting",
                 @"contests",
                 @"correctest",
                 @"corruptest",
                 @"counterprotest",
                 @"counterprotests",
                 @"curtest",
                 @"cutest"
                 ];
    
    
    self.tableView = [[TableViewParallaxBackground alloc] initWithFrame:self.view.bounds parallaxImage:[UIImage imageNamed:@"nyc.jpg"] andDelegate:self];
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor clearColor];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = UIColor.whiteColor;
    }
    NSDate *object = self.dataSource[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %@", (long)indexPath.row, [object description]];
    
    return cell;
}

@end