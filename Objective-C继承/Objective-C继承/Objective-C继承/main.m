//
//  main.m
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import <Foundation/Foundation.h>

#import "Circle.h"

#import "Rectangle.h"

#import "Tritangle.h"

//  instance实例是对象object的别称

//  encapsulation封装 inheritance继承 polymorphism:多态 OPP面向对象编程

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Circle *circle = [Circle circleWithX:5 initWithY:10];
        circle.radius = 10.2;
        circle.color = @"red";
        circle.lineWidth = 5;
        Circle *circle2 = [Circle circleWithX:2 initWithY:8];
        circle2.radius = 5.7;
        circle2.color = @"purple";
        circle2.lineWidth = 7;
        Rectangle *rectangle = [Rectangle rectangleWithX:20 withY:15];
        rectangle.height = 50;
        rectangle.width = 20;
        rectangle.color = @"black";
        rectangle.lineWidth = 2;
        Tritangle *triangle = nil;
        if ([Tritangle isValidWithEdgeA:3 edgeB:4 edgeC:5]) {
            triangle = [Tritangle tritangleWithX:1 withY:1];
            triangle.a = 3;
            triangle.b = 4;
            triangle.c = 5;
        }
        NSArray *shapesArray = @[circle,circle2,rectangle,triangle];
        
        for (Shape *shape in shapesArray) {
            [shape draw];// 同一个指针指向不同的子类对象,虽然调用的方法是一样的,
            //  但是结果不一样,因为子类对方法进行了不同的实现
            //  运行时才知道画圆还是画矩形,这就是运行时绑定(后绑定)
            //  也就是不看指针对象(指针不能决定方法到底干什么)
            NSLog(@"周长:%f\n",[shape perimeter]);//  面向对象的精髓:多态
            NSLog(@"面积:%f\n",[shape area]);//多态 不同的子类给出了不同的实现版本
            NSLog(@"--------------");
        }
    }
    return 0;
}
