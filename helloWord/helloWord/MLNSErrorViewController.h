//
//  MLNSErrorViewController.h
//  helloWord
//
//  Created by 曹明亮 on 2017/11/2.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import "MLBaseViewController.h"

@interface MLNSErrorViewController : MLBaseViewController

@end

/** 理解 Objective-C 错误模型
 * 1.
 当前很多编程语言都有异常（exception）机制，
 首先注意的是自动引用计数，在默认情况下不是“异常安全的”（exception safe）。
 具体的说，这意味着，如果抛出异常，那么本应该在作用域末尾释放的对象，现在不会自动释放了。
 如果想生成“异常安全”的代码，可以通过设置编译器的标志来实现，不过，这将引入一些额外代码，在不抛出异常的时候，
 也照样执行这部分代码，需要打开编译器的标志叫做 -fobjc-arc-exceptions。
 * 2.既然异常只用于处理严重错误（fatal error，致命错误）。那么针对其他错误，不那么严重的错误（nonfatal error， 非致命错误）时，
 OC语言所使用的编程范式为：另方法返回nil／0，或是使用NSError，以表明其中错误的发生，
 * 3.NSError介绍：封装了三条信息：
    * Error domain （错误范围，类型为字符串）产生错误的根源，通常用一个特有的全局变量来定义。比如：从URL中解析或取得数据的时候如果出错了
      那么就会使用NSURLErrorDomain来表示错误范围。
    * Error Code （错误码， 类型为整数）：在某个范围内具体发生何种错误，一系列用enum来定义。
    * Uesr Info （用户信息，其类型为字典）：包含一条本地化的描述（localized description），错误会串成一条错误链（chain of errors）
 * 4.NSError 的另一种常见用法，经由方法的“输出参数” ，返回给调用者，
 
 */
