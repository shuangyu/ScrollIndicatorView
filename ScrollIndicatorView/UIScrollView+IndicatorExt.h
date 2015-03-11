//
//  UIImage+ScrollIndicatorExt.h
//  ScrollIndicatorView
//
//  Created by hupeng on 15/3/11.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

const static NSInteger kILSDefaultSliderSize = 25;
const static NSInteger kILSDefaultSliderMargin = 20;

typedef enum {
    
    ILSSliderStatusTop,
    ILSSliderStatusCenter,
    ILSSliderStatusBottom

} ILSSliderStatus;

@interface ILSSlider : UIControl

@property (nonatomic, assign) ILSSliderStatus status;

@end

@interface ILSIndicatorView : UIControl

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) ILSSlider *slider;
@property (nonatomic, assign) float value;

@end

@interface UIScrollView (IndicatorExt)

@property (nonatomic, strong) ILSIndicatorView *indicator;

- (void)registerILSIndicator;

@end
