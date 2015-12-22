//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"

@interface C4QCatFactsDetailViewController ()

@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.chosenCatLabel.text = self.chosenCatFact;
    
    self.randomCatImage.clipsToBounds = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSArray *data = responseObject[@"data"];
             
             int randomNumber = (arc4random() % data.count) + 1;
             
             NSString *imageURLString = data[randomNumber][@"images"][@"fixed_height_still"][@"url"];
             
             NSURL *imageURL = [NSURL URLWithString:imageURLString];
             
             NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
             
             UIImage *image = [UIImage imageWithData:imageData];
             
             [self.randomCatImage setImage:image];
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"Error: %@", error);
         }];
}


@end
