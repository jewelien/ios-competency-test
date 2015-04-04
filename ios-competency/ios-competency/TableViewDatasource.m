//
//  TableViewDatasource.m
//  ios-competency
//
//  Created by Julien Guanzon on 3/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "TableViewDatasource.h"
#import "FriendsController.h"
#import "UIKit+AFNetworking.h"

static NSString * const cellKey = @"cell";

@implementation TableViewDatasource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellKey];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [FriendsController sharedInstance].friends.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellKey];
    
    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellKey];
    }
    
    NSDictionary *friends = [FriendsController sharedInstance].friends[indexPath.row];
    cell.textLabel.text = friends[@"first_name"];
    cell.detailTextLabel.text = friends[@"status"];
    [cell.imageView setImageWithURL: [NSURL URLWithString: friends[@"img"] ] ] ;
    return cell;
}

@end
