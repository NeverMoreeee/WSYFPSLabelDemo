//
//  WSYFPSLabel.m
//  WSYFPSLabel
//
//  Created by Wang.Siyuan on 16/4/14.
//  Copyright © 2016年 Wang.Siyuan. All rights reserved.
//

#import "WSYFPSLabel.h"

@interface WSYFPSLabel ()
{
    NSTimeInterval lastTime;
    NSUInteger count;
}
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UILabel *label;

@end

@implementation WSYFPSLabel
- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.500];
        self.font = [UIFont systemFontOfSize:14];
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
        
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)handleDisplayLink:(CADisplayLink *)displayLink
{
    if (lastTime == 0) {
        lastTime = self.displayLink.timestamp;
        return;
    }
    count++;
    NSTimeInterval timeout = self.displayLink.timestamp - lastTime;
    if (timeout < 1) return;
    lastTime = self.displayLink.timestamp;
    float fps = count / timeout;
    count = 0;
    self.text = [NSString stringWithFormat:@"%.f FPS",fps];
}

- (void)stopDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
    [self removeFromSuperview];
}
@end
