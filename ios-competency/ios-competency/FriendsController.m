//
//  FriendsController.m
//  ios-competency
//
//  Created by Julien Guanzon on 3/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "FriendsController.h"
#import "NetworkController.h"

@implementation FriendsController

+ (FriendsController *)sharedInstance {
    static FriendsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [FriendsController new];
    });
    return sharedInstance;
}

- (void)getFriendsWithcompletion:(void (^)(BOOL success))completion {
    [[NetworkController api] GET:@"friends" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.friends = responseObject;
        NSLog(@"success %@", responseObject);
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed to GET /friends");
        completion(NO);
    }];
}

- (void)getFriendsDetail:(void(^)(BOOL success))completion {
    [[NetworkController api] GET:@"friends/id" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.details = responseObject;
        NSLog(@"responseObject %@", responseObject);
        completion(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed to GET details");
        completion(NO);
    }];
}


@end
