//
//  DetailTableViewDatasource.m
//  ios-competency
//
//  Created by Julien Guanzon on 4/3/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailTableViewDatasource.h"
#import "FriendsController.h"

@implementation DetailTableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [FriendsController sharedInstance].details.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = 
    return cell;
}


@end
