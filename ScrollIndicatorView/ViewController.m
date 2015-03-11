//
//  ViewController.m
//  ScrollIndicatorView
//
//  Created by hupeng on 15/3/11.
//  Copyright (c) 2015年 hupeng. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+IndicatorExt.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // wrong register method
    // because in viewWillAppear function
    // table view actually still haven't setted content size
//    if (!_tableView.indicator) {
//        [_tableView registerILSIndicator];
//    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (!_tableView.indicator) {
        [_tableView registerILSIndicator];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // under this condition
    // no indicator will be appended
    // because self.contentSize.height <= self.frame.size.height
    // indicator is useless
    //return 2;

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}
@end
