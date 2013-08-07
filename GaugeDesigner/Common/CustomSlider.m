//
//  CustomSlider.m
//  GaugeDesigner
//
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import "CustomSlider.h"

#import <QuartzCore/CALayer.h>

@interface CustomSlider()
{
    UILabel *valueLabel;
    UISlider *slider;
}
@end

@implementation CustomSlider

-(id)initWithTitle:(NSString*)title withTarget:(id)target andCallback:(SEL)callbackFunc
{
    self = [super initWithFrame:CGRectMake(0, 0, 620, 30)];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
        titleLabel.text = [NSString stringWithFormat:@"%@:", title];
        titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:titleLabel];
        
        valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(570, 0, 80, 30)];
        valueLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:valueLabel];
        
        slider = [[UISlider alloc] initWithFrame:CGRectMake(150, 0, 400, 30)];
        [slider addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
        [slider addTarget:target action:callbackFunc forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
    }
    return self;
}

-(void)updateValue:(UISlider*)sender
{
    valueLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
}

#pragma mark - UISlider Forwarding

-(float)value
{
    return slider.value;
}

-(void)setValue:(float)value
{
    slider.value = value;
    [self updateValue:slider];
}

-(void)setMinimumValue:(float)value
{
    slider.minimumValue = value;
    _minimumValue = value;
}

-(void)setMaximumValue:(float)value
{
    slider.maximumValue = value;
    _maximumValue = value;
}

@end
