//
//  Sneaker.m
//  KickTracker
//
//  Created by Jessica Lachewitz on 3/19/18.
//  Copyright © 2018 Jessica Lachewitz. All rights reserved.
//

#import "Sneaker.h"
#import <Realm/Realm.h>
#import "Utils.h"

@interface Sneaker()

@property (strong, nonatomic) NSString *shoePrimaryKey;

@end

@implementation Sneaker

- (instancetype)initWithShoeLine:(NSString *)shoeLine andColorway:(NSString *)colorway andReleaseDate:(NSString *)releaseDate andPrimaryColor:(UIColor *)primaryColor
{
    self = [super init];
    
    if (self)
    {
        self.shoeLine = shoeLine;
        self.colorway = colorway;
        self.releaseDate = releaseDate;
        self.primaryColor = [Utils hexStringFromColor:primaryColor];
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addOrUpdateObject:self];
        [realm commitWriteTransaction];
    }
    
    return self;
}

+ (NSString *)primaryKey
{
    return @"shoePrimaryKey";
}

+ (NSArray *)indexedProperties
{
    return @[@"colorway", @"shoeLine", @"primaryColor"];
}

- (NSString *)getShoePrimaryKey
{
    if (!self.shoePrimaryKey)
    {
        self.shoePrimaryKey = [NSString stringWithFormat:@"%@ %@", self.shoeLine, self.colorway];
    }
    return self.shoePrimaryKey;
}

@end
