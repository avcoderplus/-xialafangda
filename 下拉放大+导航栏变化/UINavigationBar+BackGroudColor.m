//
//  UINavigationBar+BackGroudColor.m
//  下拉放大+导航栏变化
//
//  Created by dllo on 15/11/2.
//  Copyright © 2015年 刘志强. All rights reserved.
//

#import "UINavigationBar+BackGroudColor.h"
#import <objc/runtime.h>


@implementation UINavigationBar (BackGroudColor)
static char overlayKey;
- (UIView *)overlay
{    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{    if (!self.overlay) {
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:[UIImage new]];        // insert an overlay into the view hierarchy
    self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
    [self insertSubview:self.overlay atIndex:0];
}    self.overlay.backgroundColor = backgroundColor;
}
@end


