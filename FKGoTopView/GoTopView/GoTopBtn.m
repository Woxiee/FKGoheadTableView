//
//  GoTopBtn.m
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "GoTopBtn.h"

@implementation GoTopBtn

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundImage:[UIImage imageNamed:@"gotop"] forState:UIControlStateNormal];
    }
    return self;
}

@end
