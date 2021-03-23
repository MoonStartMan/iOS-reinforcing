//
//  Circle.h
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//
#import "Shape.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : Shape

@property (nonatomic, assign) double radius;

+ (instancetype) circleWithX:(int) x initWithY:(int) y;

@end

NS_ASSUME_NONNULL_END
