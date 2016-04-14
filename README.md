# WSYFPSLabelDemo

WSYFPSLabel-简单的FPS监测小工具

使用方法：

1直接将WSYFPSLabel.h WSYFPSLabel.m文件拖入工程

2引入头文件#import "WSYFPSLabel.h"

3添加属性

@property (nonatomic, strong) WSYFPSLabel *wsyFPSLabel;

4在需要使用的地方添加以下方法

// 配置WSYFPSLabel的方法

 -(void)configureWSYFPSLabel{
 
    _wsyFPSLabel = [[WSYFPSLabel alloc]init];

    _wsyFPSLabel.frame = CGRectMake(10, 74, 50, 30);
    
    [self.view addSubview:_wsyFPSLabel];
    
}

//开启FPS监测的方法

 -(void)startTheFPSLabel{
 
    if (_wsyFPSLabel == nil) {

        [self configureWSYFPSLabel];
        
    }
    
}

//关闭FPS监测方法

 -(void)closeTheFPSLabel{
 
    [_wsyFPSLabel stopDisplayLink];

    _wsyFPSLabel = nil;
    
}

方法添加完后在需要的地方调用即可

