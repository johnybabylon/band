//
//  ABCBand.m
//  Band
//
//  Created by elliott chavis on 12/2/15.
//  Copyright (c) 2015 elliott chavis. All rights reserved.
//

#import "ABCBand.h"


static NSString *nameKey = @"BANameKey";
static NSString *notesKey = @"BANotesKey";
static NSString *ratingKey = @"BARatingKey";
static NSString *tourStatusKey = @"BATourStatusKey";
static NSString *haveSeenLiveKey = @"BAHaveSeenLiveKey";


@implementation ABCBand

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.name = [aDecoder decodeObjectForKey:nameKey];
    self.notes = [aDecoder decodeObjectForKey:notesKey];
    self.rating = [aDecoder decodeIntegerForKey:ratingKey];
    self.touringStatus = [aDecoder decodeIntegerForKey:tourStatusKey];
    self.haveSeenLive = [aDecoder decodeBoolForKey:haveSeenLiveKey];

    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:nameKey];
    [aCoder encodeObject:self.notes forKey:notesKey];
    [aCoder encodeInteger:self.rating forKey:ratingKey];
    [aCoder encodeInteger:self.touringStatus forKey:tourStatusKey];
    [aCoder encodeBool:self.haveSeenLive forKey:haveSeenLiveKey];
}

- (NSComparisonResult)compare:(ABCBand *)otherObject
{
    return [self.name compare:otherObject.name];
}


@end
