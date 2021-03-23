//
//  Tritangle.m
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import "Tritangle.h"

@implementation Tritangle

+ (instancetype)tritangleWithX:(int)x withY:(int)y{
    return [[self alloc] initWithX:x initWithY:y];
}

//  实现多态的第一步:
//  重写override 父类有得方法子类重新给出自己的实现版本
- (void)draw{
    NSLog(@"△");
}

- (double)perimeter{
    return _a + _b + _c;
}

- (double)area{
    double p = (_a + _b + _c) / 2;
    return sqrt(p*(p - _a) * (p - _b) * (p - _c));
}

//  该方法与对象无关。在创建对象之前就要调用的方法
//  所以在设计上将其设计为类方法而不是对象方法
+ (BOOL)isValidWithEdgeA:(double)a edgeB:(double)b edgeC:(double)c{
    return a + b > c && a + c > b && b + c >a;
}

@end
