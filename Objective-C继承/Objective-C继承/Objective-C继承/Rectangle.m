//
//  Rectangle.m
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import "Rectangle.h"

@implementation Rectangle

+ (instancetype)rectangleWithX:(int)x withY:(int)y {
    return [[self alloc]initWithX:x initWithY:y];
}

- (void)draw{
    NSLog(@"□");
}

- (double)perimeter{
    return (_height + _width)*2;
}

- (double)area{
    return _height * _width;
}

@end
