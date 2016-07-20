//
//  ShowCountView.m
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//


#import "ShowCountView.h"
#import "GoTopBtn.h"

@interface ShowCountView()

@property (weak,nonatomic) GoTopBtn *gotoBtn;
@property (nonatomic,weak) UILabel *cLabel;
@property (nonatomic,weak) UILabel *mLabel;
@property (nonatomic,weak) UIView *lView;

@end

@implementation ShowCountView

- (instancetype) initWithFrame:(CGRect)frame withSuperView:(UIView *)sView
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        
        UIImageView *backImg = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:backImg];
        [backImg setImage:[UIImage imageNamed:@"countbackgroung"]];
        
        GoTopBtn *btn = [[GoTopBtn alloc] initWithFrame:self.bounds];
        [btn setBackgroundImage:[UIImage imageNamed:@"to_top"] forState:UIControlStateNormal];
        self.gotoBtn = btn;
        [self addSubview:btn];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        [_gotoBtn addTarget:self action:@selector(clickToTopBtn) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *cLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, frame.size.width, frame.size.height * 0.5)];
        [self addSubview:cLabel];
        cLabel.textAlignment = NSTextAlignmentCenter;
        cLabel.textColor = [UIColor whiteColor];
        cLabel.font = [UIFont systemFontOfSize:11];
        cLabel.text = @"";
        self.cLabel = cLabel;
        
        UIView *lView = [[UIView alloc] initWithFrame:CGRectMake(5, frame.size.height * 0.5 - 0.25, frame.size.width - 10, 0.5)];
        [self addSubview:lView];
        lView.backgroundColor = [UIColor whiteColor];
        self.lView = lView;
        
        UILabel *mLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height * 0.5, frame.size.width, frame.size.height * 0.5 - 4)];
        [self addSubview:mLabel];
        mLabel.textAlignment = NSTextAlignmentCenter;
        mLabel.font = [UIFont systemFontOfSize:11];
        mLabel.textColor = [UIColor whiteColor];
        mLabel.text = @"";
        self.mLabel = mLabel;
        
        [self showCountViewWithCurrentCount:100 withMaxCount:1000 show:NO];
        
        [sView bringSubviewToFront:self];
    }
    return self;
}
- (void)showCountViewWithCurrentCount:(NSInteger)cCount withMaxCount:(NSInteger)mCount show:(BOOL)show
{
    if (show) {
        self.cLabel.text = [NSString stringWithFormat:@"%ld",(long)cCount];
        self.mLabel.text = [NSString stringWithFormat:@"%ld",(long)mCount];
        self.lView.hidden = NO;
        [self.gotoBtn setBackgroundImage:nil forState:UIControlStateNormal];
    }
    else
    {
        self.cLabel.text = @"";
        self.mLabel.text = @"";
        self.lView.hidden = YES;
        [self.gotoBtn setBackgroundImage:[UIImage imageNamed:@"to_top"] forState:UIControlStateNormal];
    }
}

- (void)clickToTopBtn
{
    if ([self.delegate respondsToSelector:@selector(showCountViewDidClick:)]) {
        [self.delegate showCountViewDidClick:self];
    }
}

@end
