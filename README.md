# iOS-reinforcing

<p align="center">
  <img src="https://img.shields.io/badge/Objective--C-blue.svg" alt="Objective-C">
  <img src="https://img.shields.io/badge/iOS-9.0+-blue.svg" alt="iOS 9.0+">
  <img src="https://img.shields.io/badge/Xcode-8.0+-brightgreen.svg" alt="Xcode 8.0+">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License">
</p>

<p align="center">
  <b>iOS 知识点强化练习代码</b>
</p>

## 项目简介

这是一个 iOS 知识点强化练习代码仓库，收录了在学习 iOS 开发过程中针对各个知识点进行的代码练习。本仓库旨在通过实际编码来巩固和加深对 iOS 开发核心概念的理解。

## 学习目标

- 巩固 iOS 开发基础知识
- 深入理解 Objective-C 语言特性
- 掌握常用框架的使用方法
- 提升代码实践能力
- 积累开发经验

## 内容涵盖

### Objective-C 语言基础
- 类和对象
- 属性和方法
- 内存管理 (MRC/ARC)
- Block 和 GCD
- KVO/KVC
- 协议和委托
- 类别和扩展

### UIKit 框架
- UIView 和 CALayer
- 常用控件 (UIButton, UILabel, UIImageView 等)
- 视图控制器生命周期
- 导航和转场
- 自动布局
- 动画效果

### 数据存储
- NSUserDefaults
- Plist 文件
- Core Data
- SQLite
- 文件系统操作

### 网络编程
- NSURLSession
- 网络请求封装
- JSON 解析
- 数据缓存

### 多线程
- NSThread
- GCD (Grand Central Dispatch)
- NSOperation
- 线程同步

### 其他知识点
- 通知机制
- 事件传递和响应链
- 运行时 (Runtime)
- 方法交换 (Method Swizzling)

## 项目结构

```
iOS-reinforcing/
├── iOS-reinforcing.xcodeproj
├── iOS-reinforcing/
│   ├── AppDelegate.h/m
│   ├── ViewController.h/m
│   ├── Objective-C-Basics/          # Objective-C 基础
│   │   ├── ClassAndObject/
│   │   ├── PropertyAndMethod/
│   │   ├── MemoryManagement/
│   │   └── Block/
│   ├── UIKit-Practice/              # UIKit 练习
│   │   ├── UIView/
│   │   ├── Controls/
│   │   ├── Layout/
│   │   └── Animation/
│   ├── DataStorage/                 # 数据存储
│   │   ├── NSUserDefaults/
│   │   ├── CoreData/
│   │   └── FileOperation/
│   ├── Networking/                  # 网络编程
│   │   ├── NSURLSession/
│   │   └── JSONParsing/
│   ├── Multithreading/              # 多线程
│   │   ├── GCD/
│   │   ├── NSThread/
│   │   └── NSOperation/
│   └── Advanced/                    # 进阶知识
│       ├── Runtime/
│       └── MethodSwizzling/
└── README.md
```

## 示例代码

### Block 使用示例

```objc
// Block 定义和使用
// 1. Block 作为属性
typedef void(^CompletionBlock)(BOOL success, NSString *message);

@interface MyClass : NSObject
@property (nonatomic, copy) CompletionBlock completion;
@end

// 2. Block 作为参数
- (void)doSomethingWithCompletion:(void(^)(NSString *result))completion {
    // 执行操作
    NSString *result = @"操作完成";
    
    // 回调
    if (completion) {
        completion(result);
    }
}

// 3. Block 使用
MyClass *obj = [[MyClass alloc] init];
[obj doSomethingWithCompletion:^(NSString *result) {
    NSLog(@"结果: %@", result);
}];
```

### GCD 多线程示例

```objc
// 1. 异步执行
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     // 耗时操作
     NSData *data = [self downloadData];
     
     // 回到主线程更新 UI
     dispatch_async(dispatch_get_main_queue(), ^{
         self.imageView.image = [UIImage imageWithData:data];
     });
 });

// 2. 延迟执行
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"2秒后执行");
});

// 3. 一次性执行
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    NSLog(@"只执行一次");
});

// 4. 组队列
dispatch_group_t group = dispatch_group_create();

dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
    NSLog(@"任务1");
});

dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
    NSLog(@"任务2");
});

dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    NSLog(@"所有任务完成");
});
```

### KVO 使用示例

```objc
// 1. 注册观察者
[self.person addObserver:self 
              forKeyPath:@"name" 
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld 
                 context:nil];

// 2. 实现观察方法
- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change 
                       context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSString *newValue = change[NSKeyValueChangeNewKey];
        NSString *oldValue = change[NSKeyValueChangeOldKey];
        NSLog(@"name 从 %@ 变为 %@", oldValue, newValue);
    }
}

// 3. 移除观察者
- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"name"];
}
```

### 运行时 (Runtime) 示例

```objc
#import <objc/runtime.h>

// 1. 获取类的方法列表
unsigned int count;
Method *methods = class_copyMethodList([UIView class], &count);
for (int i = 0; i < count; i++) {
    Method method = methods[i];
    SEL selector = method_getName(method);
    NSString *name = NSStringFromSelector(selector);
    NSLog(@"方法名: %@", name);
}
free(methods);

// 2. 动态添加方法
class_addMethod([MyClass class], @selector(newMethod), (IMP)newMethodImplementation, "v@:");

// 3. 方法交换 (Method Swizzling)
Method originalMethod = class_getInstanceMethod([UIViewController class], @selector(viewDidLoad));
Method swizzledMethod = class_getInstanceMethod([UIViewController class], @selector(my_viewDidLoad));
method_exchangeImplementations(originalMethod, swizzledMethod);
```

## 学习建议

1. **循序渐进**: 从基础概念开始，逐步深入
2. **动手实践**: 每个知识点都要编写代码练习
3. **理解原理**: 不仅要知道怎么用，还要理解为什么
4. **总结归纳**: 定期回顾和总结学习内容
5. **项目实战**: 将所学知识应用到实际项目中

## 安装和运行

### 环境要求

- macOS 10.12 或更高版本
- Xcode 8.0 或更高版本
- iOS 9.0+ 模拟器或真机

### 安装步骤

1. 克隆仓库

```bash
git clone https://github.com/MoonStartMan/iOS-reinforcing.git
```

2. 进入项目目录

```bash
cd iOS-reinforcing
```

3. 打开 Xcode 工程

```bash
open iOS-reinforcing.xcodeproj
```

4. 选择目标设备，点击运行按钮 (Cmd+R)

## 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b add/new-practice`)
3. 添加练习代码
4. 提交更改 (`git commit -m 'Add: 知识点练习'`)
5. 推送到分支 (`git push origin add/new-practice`)
6. 打开 Pull Request

## 推荐学习资源

- [Apple 官方文档](https://developer.apple.com/documentation/)
- [Objective-C 编程](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/)
- [iOS 开发指南](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/)

## 许可证

本项目采用 MIT 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件

## 联系方式

- GitHub: [@MoonStartMan](https://github.com/MoonStartMan)

---

<p align="center">如果这个项目对您有帮助，请给个 ⭐️ 支持一下！<br>坚持练习，成为更好的 iOS 开发者！</p>
