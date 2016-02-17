//
//  UIControl+IntervalClick.m
//  ButtonIntervalClick
//
//  Created by ZpyZp on 16/2/16.
//  Copyright © 2016年 zpy. All rights reserved.
//

#import "UIControl+IntervalClick.h"
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation UIControl (IntervalClick)

+(void)load
{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__py_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__py_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
//    if (self.uxy_ignoreEvent) return;
    if (self.py_eventInterval > 0)
    {
//        self.uxy_ignoreEvent = YES;
        [self performSelector:@selector(setUxy_ignoreEvent:) withObject:@(NO) afterDelay:self.py_eventInterval];
    }
    [self __py_sendAction:action to:target forEvent:event];
}


- (NSTimeInterval)py_eventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

-(void)setPy_eventInterval:(NSTimeInterval)py_eventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(py_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end


