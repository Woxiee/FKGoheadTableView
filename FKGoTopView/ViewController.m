//
//  ViewController.m
//  FKGoTopView
//
//  Created by Faker on 16/7/20.
//  Copyright © 2016年 Faker. All rights reserved.
//

#import "ViewController.h"
#import "FKGotoHeaderAndShowCountView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,weak) FKGotoHeaderAndShowCountView *countView;
@property (nonatomic, weak) UITableView *theTableview;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    
    [self initWithUI];
    [self addShowCountView];
    
    for (int i = 0; i< 30; i++) {
        NSString *str = [NSString stringWithFormat:@"我是测试数据%d",i];
        [_dataArray addObject:str];
    }
    [self.theTableview reloadData];
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return  _dataArray;
}

- (void) addShowCountView
{
    FKGotoHeaderAndShowCountView *countView = [FKGotoHeaderAndShowCountView shareFKHeaderAndShowCountViewWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 50 , [UIScreen mainScreen].bounds.size.height -60, 40, 40) view:self.view block:^{
        [self.theTableview setContentOffset:CGPointMake(0, 0) animated:YES];
    }];
    self.countView = countView;
}


- (void)initWithUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    self.theTableview = tableView;
    self.theTableview .delegate = self;
    self.theTableview .dataSource = self;
    self.theTableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.theTableview.tableFooterView = [[UIView alloc] init];
    self.theTableview.backgroundColor = [UIColor clearColor];
    self.theTableview.rowHeight = 60;
    
    
    
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndiffer = @"homePageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndiffer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndiffer];
        
    }
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger cCount = (indexPath.row + 1) ;
    
    [self.countView fkGotoHeaderAndShowCountViewWhitCurrentCout:cCount max:_dataArray.count];
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.countView fkGotoHeaderAndShowCountViewWithScrollView:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.countView fkGotoHeaderAndShowCountViewWithScrollView:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.countView removeGotoHeaderAndShowCountView];
}


@end
