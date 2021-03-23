//
//  Tritangle.h
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import "Shape.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tritangle : Shape

@property (nonatomic, assign) double a;

@property (nonatomic, assign) double b;

@property (nonatomic, assign) double c;

+ (instancetype)tritangleWithX:(int) x withY:(int) y;

/// 判断三条边是否可以构成一个合格的三角形

+ (BOOL)isValidWithEdgeA:(double) a edgeB:(double) b edgeC:(double) c;

@end

NS_ASSUME_NONNULL_END
