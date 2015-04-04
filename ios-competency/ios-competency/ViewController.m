//
//  ViewController.m
//  ios-competency
//
//  Created by Julien Guanzon on 3/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDatasource.h"
#import "FriendsController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate>

@property (nonatomic, strong) TableViewDatasource *datasource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    self.datasource = [TableViewDatasource new];
    tableView.dataSource = self.datasource;
    tableView.delegate = self;
    [self.datasource registerTableView:tableView];
    
    [[FriendsController sharedInstance] getFriendsWithcompletion:^(BOOL success) {
        if (success){
            [tableView reloadData];
        } else {
            NSLog(@"SEARCH FAILED");
        }
    }];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailViewController *detailVC = [DetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
