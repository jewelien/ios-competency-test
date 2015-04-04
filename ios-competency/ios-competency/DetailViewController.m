//
//  DetailViewController.m
//  ios-competency
//
//  Created by Julien Guanzon on 4/3/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailViewController.h"
#import "FriendsController.h"
#import "UIKit+AFNetworking.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *phone = [[UILabel alloc] initWithFrame:CGRectMake(130, 70, 200, 30)];
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(130, 80, 200, 100)]; //y + height of above + 10
    address.numberOfLines = 0;
    UILabel *cityState = [[UILabel alloc] initWithFrame:CGRectMake(130, 150, 300, 30)];
    UILabel *bio = [[UILabel alloc] initWithFrame:CGRectMake(20, 170, 300, 150)];
    bio.numberOfLines = 0;
    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 70, 100, 100)];
    UIImageView *imageView = [UIImageView new];
    UITextView *statusesView = [[UITextView alloc] initWithFrame:CGRectMake(20, 300, 325, 150)];

    
    [[FriendsController sharedInstance] getFriendsDetail:^(BOOL success) {
        if (success) {
            NSLog(@"success");
            NSDictionary *dictionary = [FriendsController sharedInstance].details;
            self.title = [NSString stringWithFormat:@"%@ %@", dictionary[@"first_name"], dictionary[@"last_name"]];
            phone.text = [NSString stringWithFormat:@"Phone: %@", dictionary[@"phone"]];
            address.text = [NSString stringWithFormat:@"Address: %@", dictionary[@"address_1"]];
            cityState.text = [NSString stringWithFormat:@"%@, %@ %@", dictionary[@"city"], dictionary[@"state"], dictionary[@"zipcode"]];
            bio.text = [NSString stringWithFormat:@"Bio: %@", dictionary[@"bio"]];
            statusesView.text = [NSString stringWithFormat:@"Statuses: %@", dictionary[@"statuses"]];
            
            [profileImageView setImageWithURL:[NSURL URLWithString:dictionary[@"img"]]];
            
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[dictionary[@"photos"] objectAtIndex:2]]];
            [imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                NSLog(@"retrieved photo");
            } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                NSLog(@"failed to retrieve photo");
            }];
            NSLog(@"%@", [dictionary[@"photos"] objectAtIndex:1]);

        } else {
            NSLog(@"failed");
        }
    }];
    
    [self.view addSubview:imageView];
    NSArray *labelsArray = @[phone, address, cityState, bio, statusesView, profileImageView];
    
    for (UILabel *label in labelsArray) {
        [self.view addSubview:label];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
