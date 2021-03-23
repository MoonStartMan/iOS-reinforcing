//
//  Shape.m
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import "Shape.h"

@implementation Shape

- (instancetype)initWithX:(int)x initWithY:(int)y{
    if(self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}

- (void)draw{
    
}

- (double)perimeter{
    return 0;
}

- (double)area{
    return 0;
}

@end
