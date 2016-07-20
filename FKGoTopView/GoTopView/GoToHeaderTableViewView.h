//
//  GoToHeaderTableViewView.h
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^GoToTopBlock)();

@interface GoToHeaderTableViewView : UIView
@property (nonatomic,copy) GoToTopBlock block;

+ (instancetype)shareHeaderViewWithFrame:(CGRect)frame block:(GoToTopBlock)block;
- (void)didScroll:(UIScrollView *)scrollView;
- (void)endScroll:(UIScrollView *)scrollView;
- (void)removeGotoHeaderView;
- (void)addGotoHeaderView;

@end
