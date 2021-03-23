//
//  Shape.h
//  Objective-C继承
//
//  Created by 王潇 on 2021/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Shape : NSObject

/** 横坐标 */
@property (nonatomic, assign) int x;
/** 纵坐标 */
@property (nonatomic, assign) int y;
/** 颜色 */
@property (nonatomic, copy) NSString *color;
/** 线条粗细 */
@property (nonatomic, assign) int lineWidth;
/** 初始化方法 */
- (instancetype) initWithX: (int) x initWithY: (int) y;

- (void) draw;

- (double) perimeter;

- (double) area;

@end

NS_ASSUME_NONNULL_END
