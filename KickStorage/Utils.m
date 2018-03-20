//
//  Utils.m
//  KickTracker
//
//  Created by Jessica Lachewitz on 3/20/18.
//  Copyright © 2018 Jessica Lachewitz. All rights reserved.
//

#import "Utils.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation Utils

// https://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
// Assumes input like "#00FF00" (#RRGGBB).
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

// https://stackoverflow.com/questions/14051807/how-can-i-get-a-hex-string-from-uicolor-or-from-rgb/40018698
+(NSString*)hexStringFromColor:(UIColor*)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    size_t count = CGColorGetNumberOfComponents(color.CGColor);
    
    if(count == 2){
        return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                lroundf(components[0] * 255.0),
                lroundf(components[0] * 255.0),
                lroundf(components[0] * 255.0)];
    }else{
        return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
                lroundf(components[0] * 255.0),
                lroundf(components[1] * 255.0),
                lroundf(components[2] * 255.0)];
    }
}
@end

