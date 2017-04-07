//
//  ViewController.m
//  DDNoticePopView
//
//  Created by dd2333 on 2017/4/7.
//  Copyright © 2017年 dd2333. All rights reserved.
//

#import "ViewController.h"
#import "DDNoticePopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popClick:(id)sender {
    
    //加载本地图片或者网络图片
    UIImage *img = [UIImage imageNamed:@"t.jpeg"];
    
    [[DDNoticePopView sharedInstance] show:img btnClick:^{
        [[DDNoticePopView sharedInstance] hide];
        NSLog(@"open");
    } closeClick:^{
        NSLog(@"close");
    }];
}

@end
