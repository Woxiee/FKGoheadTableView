//
//  FKGotoHeaderAndShowCountView.h
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FKGotoHeaderAndShowCountViewBlock)();

@interface FKGotoHeaderAndShowCountView : UIView
+ (instancetype)shareFKHeaderAndShowCountViewWithFrame:(CGRect)frame view:(UIView*) view block:(FKGotoHeaderAndShowCountViewBlock)block;

- (void)fkGotoHeaderAndShowCountViewWhitCurrentCout:(NSInteger)cCount max:(NSInteger)mCount;

- (void)fkGotoHeaderAndShowCountViewWithScrollView:(UIScrollView *)scrollView;

- (void)removeGotoHeaderAndShowCountView;

- (void)addGotoHeaderAndShowCountView;
@end
