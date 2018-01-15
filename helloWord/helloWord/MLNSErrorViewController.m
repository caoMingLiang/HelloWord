//
//  MLNSErrorViewController.m
//  helloWord
//
//  Created by 曹明亮 on 2017/11/2.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import "MLNSErrorViewController.h"

@interface MLNSErrorViewController ()

@end

@implementation MLNSErrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //error
    NSError * error = nil;
    BOOL ret = [self doSomething:&error];
    if (error) {
        
    }
    
    //
    NSArray * array = @[@"1", @"2", @3];
    [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        *stop = YES;
    }];
    
    
    
    
    
}
- (BOOL)doSomething:(NSError **)error {
    return YES;
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
