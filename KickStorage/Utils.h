//
//  Utils.h
//  KickTracker
//
//  Created by Jessica Lachewitz on 3/20/18.
//  Copyright © 2018 Jessica Lachewitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (NSString *)hexStringFromColor:(UIColor *)color;

@end
