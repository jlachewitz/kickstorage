//
//  Sneaker.h
//  KickTracker
//
//  Created by Jessica Lachewitz on 3/19/18.
//  Copyright © 2018 Jessica Lachewitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Sneaker : RLMObject
@property (strong, nonatomic) NSString *colorway;
@property (strong, nonatomic) NSString *shoeLine;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSString *primaryColor;

- (instancetype)initWithShoeLine:(NSString *)shoeLine andColorway:(NSString *)colorway andReleaseDate:(NSString *)releaseDate andPrimaryColor:(UIColor *)primaryColor;

@end
