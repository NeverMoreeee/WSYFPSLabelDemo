//
//  ViewController.m
//  WSYFPSLabel
//
//  Created by Wang.Siyuan on 16/4/14.
//  Copyright © 2016年 Wang.Siyuan. All rights reserved.
//

#import "ViewController.h"
#import "WSYFPSLabel.h"

@interface ViewController ()
@property (nonatomic, strong) WSYFPSLabel *wsyFPSLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    [self configureWSYFPSLabel];
    
    UIButton *startButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    startButton.frame = CGRectMake(10, 30, 50, 30);
    [startButton setTitle:@"start" forState:(UIControlStateNormal)];
    [startButton addTarget:self action:@selector(startTheFPSLabel) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:startButton];
    
    UIButton *closeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    closeButton.frame = CGRectMake(70, 30, 50, 30);
    [closeButton setTitle:@"close" forState:(UIControlStateNormal)];
    [closeButton addTarget:self action:@selector(closeTheFPSLabel) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:closeButton];
}

- (void)configureWSYFPSLabel{
    _wsyFPSLabel = [[WSYFPSLabel alloc]init];
    _wsyFPSLabel.frame = CGRectMake(10, 74, 50, 30);
    [self.view addSubview:_wsyFPSLabel];
}

- (void)startTheFPSLabel{
    if (_wsyFPSLabel == nil) {
        [self configureWSYFPSLabel];
    }
}

- (void)closeTheFPSLabel{
    [_wsyFPSLabel stopDisplayLink];
    _wsyFPSLabel = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
