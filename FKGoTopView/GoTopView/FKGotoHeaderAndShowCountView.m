//
//  FKGotoHeaderAndShowCountView.m
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "FKGotoHeaderAndShowCountView.h"
#import "ShowCountView.h"

@interface FKGotoHeaderAndShowCountView()<ShowCountViewDelegate>

@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,weak) ShowCountView *countView;
@property (nonatomic,assign) BOOL death;

@property (nonatomic,copy) FKGotoHeaderAndShowCountViewBlock block;

@property (nonatomic,assign) NSInteger currentCount;
@property (nonatomic,assign) NSInteger maxCount;

@end

@implementation FKGotoHeaderAndShowCountView

+ (instancetype)shareFKHeaderAndShowCountViewWithFrame:(CGRect)frame view:(UIView *)view block:(FKGotoHeaderAndShowCountViewBlock)block
{
    return [[self alloc] initWithFrame:frame view:view block:block];
}


- (instancetype) initWithFrame:(CGRect)frame view:(UIView *)superView block:(FKGotoHeaderAndShowCountViewBlock)block
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.frame = frame;
        ShowCountView *countView = [[ShowCountView alloc] initWithFrame:self.bounds withSuperView:superView];
        [superView bringSubviewToFront:self];
        self.countView = countView;
        [self addSubview:countView];
        
        //UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //[window addSubview:self];
        [superView addSubview:self];
        
        countView.delegate = self;
        
        self.block = block;
        self.countView.hidden = YES;
    }
    return self;
}

- (void)removeGotoHeaderAndShowCountView
{
    self.death = YES;
    self.countView.hidden = YES;
}

- (void)addGotoHeaderAndShowCountView
{
    self.death = NO;
    if (_currentCount > 20) {
        self.countView.hidden = NO;
    }
}

- (void)fkGotoHeaderAndShowCountViewWhitCurrentCout:(NSInteger)cCount max:(NSInteger)mCount;
{
    _currentCount = cCount;
    if (_currentCount > mCount) {
        _currentCount = mCount;
    }
    _maxCount = mCount;
    
    if (self.death) {
        return;
    }
    
    if (cCount > 14) {
        self.countView.hidden = NO;
    }
    else
    {
        self.countView.hidden = YES;
    }
}

- (void)fkGotoHeaderAndShowCountViewWithScrollView:(UIScrollView *)scrollView
{
    if (self.death) {
        return;
    }
    
    if (scrollView.isDragging) {
        [self.countView showCountViewWithCurrentCount:self.currentCount withMaxCount:self.maxCount show:NO];
    }
    else
    {
        [self.countView showCountViewWithCurrentCount:self.currentCount withMaxCount:self.maxCount show:NO];
    }
}

- (void)showCountViewDidClick:(ShowCountView *)view
{
    if (self.block) {
        self.block();
    }
}

@end
