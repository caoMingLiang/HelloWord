//
//  MLValueAndObjectViewController.h
//  helloWord
//
//  Created by 曹明亮 on 2017/5/16.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import "MLBaseViewController.h"

@interface MLValueAndObjectViewController : MLBaseViewController

@end


/**
 区别是针对调用者是dictionary而言的。
 setobject中的key和value可以为除了nil外的任何对象
 setValue中的key只能为字符串 value可以为nil也可以为空对象[NSNull null]以及全部对象
 
 错位信息 --- http://www.cocoachina.com/bbs/read.php?tid=1685934
 NSUserDefaults保存数组时因为有<NULL>出错
 错误信息：Attempt to set a non-property-list object 。。。。 as an NSUserDefaults/CFPreferences value for key LoginUser
 崩溃原因：我是在用NSUserDefaults做本地缓存，数据是请求的服务器，因为返回的json里面有<NULL>值，这样肯定会报错的。
 让后台处理是别想了，那位不会改。
 是一个结构比较复杂的数组，里面包括字典啊，数组啊...字典里面有些为空，那就不能像我在做传值的时候，因为可以精确的知道哪些key值可能为空加个判断。像这样：
 if (![_userMsg[@"MobilePhoneNumber"] isKindOfClass:[NSNull class]]) {
 [[NSUserDefaults standardUserDefaults] setObject:_userMsg[@"MobilePhoneNumber"] forKey:PHONENUMBER];
 }
 现在是要存整个数组，代码如下，大神们看看怎么修改：
 NSArray *array = [NSArray arrayWithArray:_userMsg];
 [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"LoginUser"];
 */
/**
 setValue和setObject的区别
 http://blog.csdn.net/itianyi/article/details/8661997
 
 
 以 @ 符号开头的Key值也会有区别的 取值的时候
 http://www.360doc.com/content/15/0130/21/20918780_445084641.shtml
 */

