//
//  ShowCountView.h
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShowCountView;

@protocol ShowCountViewDelegate <NSObject>

@optional

- (void)showCountViewDidClick:(ShowCountView *)view;

@end

@interface ShowCountView : UIView

@property (nonatomic,assign) id <ShowCountViewDelegate> delegate;

- (instancetype) initWithFrame:(CGRect)frame withSuperView:(UIView *)superView;
- (void)showCountViewWithCurrentCount:(NSInteger)cCount withMaxCount:(NSInteger)mCount show:(BOOL)show;
@end
