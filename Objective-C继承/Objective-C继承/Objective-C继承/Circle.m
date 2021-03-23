//
//  Circle.m
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import "Circle.h"

@implementation Circle

+ (instancetype)circleWithX:(int)x initWithY:(int)y{
    return [[self alloc] initWithX:x initWithY:y];
}

- (void)draw{
    NSLog(@"○");
}

- (double)perimeter{
    return 2*M_PI*_radius;
}

- (double)area{
    return M_PI*_radius*_radius;
}

@end
