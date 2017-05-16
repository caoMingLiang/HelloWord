//
//  MMInterviewQuestionsViewController.m
//  helloWord
//
//  Created by 曹明亮 on 2017/3/15.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import "MMInterviewQuestionsViewController.h"

@interface MMInterviewQuestionsViewController ()

@end

@implementation MMInterviewQuestionsViewController
//----------------------------------------------------------------------------------------------------
//http://www.cnblogs.com/YouXianMing/p/3713945.html
//用来区分属性名和变量名必须添加
@synthesize name = _name;
- (void)setName:(NSString *)name {
    if (_name != name) {
        //        [_name release];
        name = [_name copy];
    }
}
- (NSString *)name {
    return _name;
}
// - ARC 下
//- (void)setName:(NSString *)name {
//    _name = name;
//}
//1. 一旦你重写了getter.setter方法,你必须使用@synthesize variable = _variable来区分属性名与方法名.
//2. ARC与MRC的getter方法一致,就setter方法有着略微区别.
//----------------------------------------------------------------------------------------------------
/**
 http://blog.csdn.net/benzhang007/article/details/40212705
 2：简述一下oc的内存管理模式，包括alloc，retain，copy，release，autorelease，dealloc这些方法的理解
 
 */
//----------------------------------------------------------------------------------------------------

/**
 http://blog.sunnyxx.com/2014/10/15/behind-autorelease/
 3：描述autorelease 对象释放时机，简述autoreleasePoll的工作机制
 */


//----------------------------------------------------------------------------------------------------

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //在主线程，串行队列，追加同步串行队列，在主线程添加的，主线程执行任务，主线程执行完，执行，下边的，下边的等等待主线程执行完毕，他自己又是主线程执行任务的一部分，主线程等待他执行完毕，互相等待，形成死锁。闭环
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
