//
//  ABCBandsListTableTableViewController.h
//  Band
//
//  Created by elliott chavis on 12/3/15.
//  Copyright (c) 2015 elliott chavis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABCBand;
@interface ABCBandsListTableTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableDictionary *bandsDictionary;
@property (nonatomic, strong) NSMutableArray *firstLettersArray;

- (void)addNewBand:(ABCBand *)ABCBand;
- (void)saveBandsDictionary;
- (void)loadBandsDictionary;

@end

