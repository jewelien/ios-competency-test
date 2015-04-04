//
//  FriendsController.h
//  ios-competency
//
//  Created by Julien Guanzon on 3/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsController : NSObject

@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) NSDictionary *details;

+ (FriendsController *)sharedInstance;

- (void)getFriendsWithcompletion:(void (^)(BOOL success))completion;
- (void)getFriendsDetail:(void(^)(BOOL success))completion;
@end
