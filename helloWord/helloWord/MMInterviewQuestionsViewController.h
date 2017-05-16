//
//  MMInterviewQuestionsViewController.h
//  helloWord
//
//  Created by 曹明亮 on 2017/3/15.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMInterviewQuestionsViewController : UIViewController

@property(nonatomic, copy)NSString * name;


@end

/**
 1：person中有一个成员变量：NSString * name;给此变量重写setter方法，（非ARC模式下）
 
 2：简述一下oc的内存管理模式，包括alloc，retain，copy，release，autorelease，dealloc这些方法的理解
 
 3：简述autorelease 对象释放时机，简述autoreleasePoll的工作机制
 
 4：在OC中如何判定两个对象完全相同
 
 5：- (void)clickButton {
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"......");
        });
    }
    以上方法作为UIButton的响应方法会有什么问题，能看到log吗？
 
 6：在一个类中retain一个NSTimer 类型的成员变量会有问题吗？如果有，说明其根本原因
 
 7：oc中category的实现原理和runtime有关么？如果有关，请解释一下相关联系
 
 8：是否使用过 NSOperationQueue 和 GCD 来管理线程？两者有什么区别？两者的实现机制的根本不同之处？（如果觉得要写的太多，可以写面谈）
 
 9：列举在 iOS 开发中擅长的模块和其特点，使用时的注意问题等。（例如：音频录制和播放，mapKit定位等）
 
 10：简述自己在开发中经常使用的第三方库和其优缺点，（列举1，2个即可）
 
 
开放题：
 
 关于你：
 1:如果你和以下tag有关，请打勾
    * 有微博
    * 经常熬夜
    * 写过5篇技术blog
    * 写过C
    * 写过c++
    * 会给iphone越狱
    * 买很多技术书籍
    * 会下载很多应用
 2:对自己的技术能力做一个评价，列举优点和缺点

扩展题：
 1:简述c的函数调用和oc的消息传递的机制的区别
 
*/












