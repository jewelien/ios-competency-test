//
//  NetworkController.m
//  ios-competency
//
//  Created by Julien Guanzon on 3/26/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//


#import "NetworkController.h"

@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://private-5bdb3-friendmock.apiary-mock.com"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];

    });
    return api;
}



@end
