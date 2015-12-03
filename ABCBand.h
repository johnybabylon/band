//
//  ABCBand.h
//  Band
//
//  Created by elliott chavis on 12/2/15.
//  Copyright (c) 2015 elliott chavis. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ABCTouringStatusOnTour,
    ABCTouringStatusOffTour,
    ABCTouringStatusDisbanded,
}ABCTouringStatus;

@interface ABCBand : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, assign) int rating;
@property (nonatomic, assign) ABCTouringStatus touringStatus;
@property (nonatomic, assign) BOOL haveSeenLive;

@end
