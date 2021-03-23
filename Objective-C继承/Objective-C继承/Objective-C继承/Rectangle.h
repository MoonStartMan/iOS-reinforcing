//
//  Rectangle.h
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//
#import "Shape.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : Shape

@property (nonatomic, assign) double width;

@property (nonatomic, assign) double height;

+ (instancetype)rectangleWithX:(int) x withY:(int) y;

@end

NS_ASSUME_NONNULL_END
