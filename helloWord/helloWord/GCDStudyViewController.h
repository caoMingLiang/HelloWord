//
//  GCDStudyViewController.h
//  helloWord
//
//  Created by 曹明亮 on 2017/3/22.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDStudyViewController : UIViewController

@end
//----------------------------------------------------------------------------------------------------

/**GCD
 官方描述：异步执行任务的技术之一。
 开发者 只需要定义想执行的任务并且追加到适当的Dispatch Queue 中，GCD就能生成必要的线程并计划执行任务。
 
 好处：
 1-相比performSelector系方法，GCD更为简洁
 2-使用GCD，不仅不必使用NSTread类或performSelector这些过时的API
 3-可以通过GCD提供的系统级线程管理提高执行效率。
 
 */
//----------------------------------------------------------------------------------------------------

/**线程的理解
 
 Objective-C 源代码 在Mac或者iPhone中如何执行的呢？
 1-通过编译器，转换为如下的CPU命令列，（二进制代码）
 2-汇集CPU命令列，将其作为一个应用程序安装到Mac或者iPhone上，
 3-Mac，iPhone 的操作系统OS X ，iOS，根据用户的指示启动 应用程序
 4-首先将包含在应用程序中的CPU命令列配置到内存中。
 5-CPU从应用程序指定的地址开始，一个 一个的执行CPU命令列。，不断循环下去
 
 一个CPU执行的CPU命令列为一条无分叉路径，即为线程
 
 */
//----------------------------------------------------------------------------------------------------

/** Dispatch Queue 理解 和 分类
 1- 等待执行的队列
 2- 在执行处理的时候存在两种 Dispatch Queue
 3- 一种是等待现在执行中处理的 Serial Dispatch Queue
    另一种是不等待现在执行中处理的 Concurrent Dispatch Queue
        在不能改变执行的处理顺序 或者 不想并行执行 多个处理时使用 Serial Dispatch Queue

 */
//----------------------------------------------------------------------------------------------------
/** Dispatch Queue 的创建
 */
/**dispatch_queue_create
 
 dispatch_queue_t serialQueue = dispatch_queue_create("", NULL);
 
 1- 可以使用这个函数 生成 任意多个 Dispatch Queue
 2- 系统对于一个Serial Dispatch Queue 就只生成并使用一个线程，如果生成 2000个Serial Dispatch Queue， 那么就生成2000个 线程
 3- 多个线程更新相同的资源导致数据竞争的时，可以使用Serrial Dispatch Queue。 是按顺序执行，线程安全的。 串行队列
 
 4- 但是 Serrial Dispatch Queue 的生成个数应当仅限所必须的数量。例子：更新数据库的时候，1个表生成一个 Serrial Dispatch Queue ，更新一个文件或是可以分割的一个文件块生成一个 Serrial Dispatch Queue 。
 5- 过多使用，消耗大量内存，引起大量的上下文切换，大幅度降低系统的响应性能。
 
 并行队列
 dispatch_queue_t conCurrentQueue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
 1- 当想 并行执行，并且不会发生数据竞争等问题的处理时候，使用 Conurrent Dispatch Queue。
 2- 不管生成多少，由于 XUN 内核 只使用，有效管理的 线程，因此不会发生 Serrial Dispatch Queue  的那些问题
 
 
 create 函数的介绍：
 1- 第一个参数指定 队列的名称，命名推荐使用：类似应用程序ID 这种逆序全程域名。该名称在 Xcode 和 instruments 的调试器中作为 Dispatch Queue 的名称表示。另外，该名称也出现在程序崩溃时所产生的CrashLog中。也可以设置为NULL。
 2- 释放队列，遗憾的是尽管有ARC这一通过编译器自动管理内存的优秀技术，但是生成的Dispatch Queue 必须由程序员来释放，因为：Dispatch Queue 并没有像block 那样具有 作为Objcctve-C对象来处理的技术
 3- 通过create函数生成的队列，在使用结束后，通过dispatch_release 函数释放。由此可以推断-存在 dispatch_retain 函数
 */
//----------------------------------------------------------------------------------------------------

/**
 Main Dispatch Queue ：是在主线程中执行的 Dispatch Queue。因为主线程只有一个，所以 Main Dispatch Queue 自然就是 Serial Dispatch Queue。串行队列
 
 1- 追加到主线程队列 Main Dispatch Queue 的处理，在主线程的 RunLoop中执行。由于在主线程中执行，因此要将用户界面的界面更新等一些必须在主线程中执行的处理追加到 Main Dispatch Queue 使用。
 
 Global Dispatch Queue 是所有应用程序都能够使用的 Concurrent Dispatch Queue。 没有必要通过 create 函数创建，只需要获取 Global Dispatch Queue 使用即可。
 1- 分为四个优先级：高，默认，低，后台优先级。
 
 
 总结：系统提供的线程队列，Dispatch Queue 种类 共5种，Main Dispatch Queue 和（四种优先级别不同的）Global Dispatch Queue
 */

//----------------------------------------------------------------------------------------------------

/**dispatch_set_target_queue
 1- set_target_queue变更生成的执行处理的等待队列（Dispatch Queue） 优先级 使用的API
 2- 如果在多个 Serial Dispatch Queue 中用 set_target_queue 函数指定目标为某一个 Serial Dispatch Queue，那么原本应该并行执行的多个
 Serial Dispatch Queue，在目标 Serial Dispatch Queue 上只能同时执行一个处理。
 */

//----------------------------------------------------------------------------------------------------
/** dispatch_after : 在指定时间后执行处理的情况，使用该函数来实现
 1- 在3秒后将指定的Block追加到Main Dispatch Queue 中
 2- 此函数并不是在指定时间后执行处理，而是 在指定时间追加处理到 Dispatch Queue
 3- 时间上的延迟并不是很准确，举例：因为在 Main Dispatch Queue 在主线程的 RunLoop 中执行，所以在比如：每隔 1/60 秒执行的 RunLoop 中，
 Block 最快在 3 秒后执行，最慢在 3秒 + 1/60 秒后执行，并且在 Main Dispatch Queue 中有大量处理追加或者在主线程的处理本身有延迟的时候，
 这个时间会更长。
 4- “ull”是 c 语言的数值字面量，是显示表明类型的时使用的字符串（表示“unsigned long long”）
 
 
 // 这种写法 ，没有见过
 dispatch_time_t getDispatchTimeByDate(NSDate * date)
 {
 //struct timespec 类型的时间 可以很轻松的 通过NSDate 类对象来合成；
 NSTimeInterval interval;
 double second, subsecond;
 struct timespec time;
 dispatch_time_t milestone;
 
 interval = [date timeIntervalSince1970];
 subsecond = modf(interval, &second);
 time.tv_sec = second;
 time.tv_nsec = subsecond * NSEC_PER_SEC;
 milestone = dispatch_walltime(&time, 0);
 
 return milestone;
 }
 */




//----------------------------------------------------------------------------------------------------

















