//
//  ViewController.m
//  helloWord
//
//  Created by 曹明亮 on 2017/1/25.
//  Copyright © 2017年 caoMingliang. All rights reserved.
//

#import "ViewController.h"
#import "MLValueAndObjectViewController.h"
//后台保活
#import "MLBackRunContinueViewController.h"
//NSError
#import "MLNSErrorViewController.h"

@interface ViewController ()

<UITableViewDelegate,
UITableViewDataSource>

/** 建表 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据源 */
@property (strong, nonatomic) NSMutableArray * dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"你好，GitHub！");
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [UIColor orangeColor];
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        NSArray * subArray = @[@"00-Objective-C",
                               @"01-陌陌面试题",
                               @"02-GCD学习",
                               @"03-Value&&Object",
                               @"04-WebServices请求",
                               @"05-TOTP",
                               @"06-静态库StaticLib",
                               @"07-WebRTC",
                               @"08-音量控制",
                               @"09-后台保活",
                               //理解OC错误模型
                               @"10-NSError"];
        _dataArray = [NSMutableArray arrayWithArray:subArray];
    }
    return _dataArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifer = @"cellIdentifer";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __func__);
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    [self goToNextControllerWithIndexPath:indexPath];
}
#pragma mark - 
- (void)goToNextControllerWithIndexPath:(NSIndexPath *)indexPath {
    if (3 == indexPath.row) {
        MLValueAndObjectViewController * valueVc = [[MLValueAndObjectViewController alloc] init];
        [self.navigationController pushViewController:valueVc animated:YES];
    } else if (8 == indexPath.row) {
        MLBackRunContinueViewController * valueVc = [[MLBackRunContinueViewController alloc] init];
        [self.navigationController pushViewController:valueVc animated:YES];
    } else if (10 == indexPath.row) {
        MLNSErrorViewController * errorVc = [[MLNSErrorViewController alloc] init];
        [self.navigationController pushViewController:errorVc animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
