//
//  GCDStudyViewController.m
//  helloWord
//
//  Created by 曹明亮 on 2017/3/22.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import "GCDStudyViewController.h"

@interface GCDStudyViewController ()

@end

@implementation GCDStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//----------------------------------------------------------------------------------------------------
//dispatch_barrier_async
- (void)dispatch_barrier_async {
    //并行处理中，之间添加别的处理。高效处理 数据库（或者文件的）访问，和 读写
}

//----------------------------------------------------------------------------------------------------

// dispatch_group
// dispatch_group_notify
// dispatch_group_wait
- (void)dispatch_group {
    
}

//----------------------------------------------------------------------------------------------------

//dispatch_after
- (void)dispatch_after {
    /** dispatch_after : 在指定时间后执行处理的情况，使用该函数来实现
     1- 在3秒后将指定的Block追加到Main Dispatch Queue 中
     2- 此函数并不是在指定时间后执行处理，而是 在指定时间追加处理到 Dispatch Queue
     3- 时间上的延迟并不是很准确，举例：因为在 Main Dispatch Queue 在主线程的 RunLoop 中执行，所以在比如：每隔 1/60 秒执行的 RunLoop 中，
        Block 最快在 3 秒后执行，最慢在 3秒 + 1/60 秒后执行，并且在 Main Dispatch Queue 中有大量处理追加或者在主线程的处理本身有延迟的时候，
        这个时间会更长。
     4- “ull”是 c 语言的数值字面量，是显示表明类型的时使用的字符串（表示“unsigned long long”）
     */
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    });
    
    // dispatch_after_f(<#dispatch_time_t when#>, <#dispatch_queue_t  _Nonnull queue#>, <#void * _Nullable context#>, <#dispatch_function_t  _Nonnull work#>)
}

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
//----------------------------------------------------------------------------------------------------

//set_target_queue变更生成的执行处理的等待队列（Dispatch Queue） 优先级 使用的API
- (void)setTargetQueue {
    /**
     如果在多个 Serial Dispatch Queue 中用 set_target_queue 函数指定目标为某一个 Serial Dispatch Queue，那么原本应该并行执行的多个
     Serial Dispatch Queue，在目标 Serial Dispatch Queue 上只能同时执行一个处理。
     */
    dispatch_queue_t serialQueue = dispatch_queue_create("com.example.gcd.SerialQueue", NULL);
    dispatch_queue_t globalQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_set_target_queue(serialQueue, globalQueueBackground);
    //学习就是一个来回看和理解，和背的过程。
    
}
//----------------------------------------------------------------------------------------------------

//一种方法是 获取系统标准提供的 Dispatch Queue
- (void)systemStandardsDispatchQueue {
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globalQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t globalQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t globalQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t globalQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);

    //举例：
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //可以并行执行的处理
        dispatch_async(dispatch_get_main_queue(), ^{
            //只能在主线程中执行的处理
        });
    });
}
//----------------------------------------------------------------------------------------------------

//dispatch_queue_create 函数
//一种方法是通过 GCD 的 API 生成 Dispatch Queue
- (void)createSerailDispatchQueue {
    dispatch_queue_t serialQueue = dispatch_queue_create("", NULL);
    dispatch_queue_t conCurrentQueue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(conCurrentQueue, ^{
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
