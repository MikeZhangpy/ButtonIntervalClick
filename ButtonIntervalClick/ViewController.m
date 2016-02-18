//
//  ViewController.m
//  ButtonIntervalClick
//
//  Created by ZpyZp on 16/2/16.
//  Copyright © 2016年 zpy. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+IntervalClick.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *runtimeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.runtimeBtn.py_eventInterval = 1;
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)commonClick:(id)sender {
    
    NSLog(@"common按钮被点击了");
}
- (IBAction)runtimeClick:(id)sender {
    NSLog(@"runtime按钮被点击了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
