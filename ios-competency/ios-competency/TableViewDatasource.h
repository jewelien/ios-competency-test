//
//  TableViewDatasource.h
//  ios-competency
//
//  Created by Julien Guanzon on 3/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewDatasource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
