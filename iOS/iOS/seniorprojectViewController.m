//
//  seniorprojectViewController.m
//  iOS
//
//  Created by Tyler Standridge on 9/15/13.
//  Copyright (c) 2013 Tyler Standridge. All rights reserved.
//

#import "seniorprojectViewController.h"

@interface seniorprojectViewController ()

@end

@implementation seniorprojectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    textField.delegate = self;
    titleField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonPressed:(id)sender
{
    NSLog(@"Submit Button Pressed!");
    
    NSMutableDictionary *ts = [[NSMutableDictionary alloc] init];
    NSMutableArray* jsonArray = [NSMutableArray arrayWithObject:ts];
    [jsonArray addObject:ts];
    
    NSString *author = @"Test Author";
    NSString *topics = @"Test Topic";
    NSString *title = [titleField text];
    NSString *text = [textField text];
    
    // BEGIN NETWORKING CODE
    NSArray *values = @[author, topics, title, text];

    NSString *body;
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [urlRequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.241.213.204:3000/receive"]]];
    [urlRequest setHTTPMethod:@"POST"];
    
    body = [self createJSONForRequest:1 withValues:values];
    [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection
     sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                                                                        NSData *data,
                                                                        NSError *error) {
         if ([data length] > 0 && error == nil) {
             NSString *html = [[NSString alloc] initWithData:data
                                                    encoding:NSUTF8StringEncoding];
             //NSLog(@"Html = %@", html);
         }
         else if ([data length] == 0 && error == nil) {
             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil) {
             NSLog(@"Error happened = %@", error);
         }
     }];
    // END NETWORKING CODE
    
}

- (IBAction)draftButtonPressed:(id)sender
{
    NSLog(@"Draft Button Pressed!");    
}

-(IBAction)done:(UIStoryboardSegue *)seque{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (NSString*)createJSONForRequest:(int)requestType withValues:(NSArray *)values {
    NSString *jsonRequest;
    switch (requestType) {
        case 1:
            jsonRequest = [self newPostJSONBuilder:values];
            break;
        case 2:
            jsonRequest = [self latestPostsJSONBuilder:values];
            break;
        default:
            NSLog(@"Invalid Request Type.");
    }
    
    return jsonRequest;
}

- (NSString *)latestPostsJSONBuilder:(NSArray *)values {
    NSDictionary *keys = @{@"count":values[0], @"author":values[1], @"topics":values[2]};
    NSDictionary *jsonDict = @{@"latest": keys};
    
    if ( [NSJSONSerialization isValidJSONObject:jsonDict]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    NSLog(@"Could not form JSON object");
    return nil;
}

- (NSString *)newPostJSONBuilder:(NSArray *)values {
    NSDictionary *keys = @{@"author":values[0], @"topics":values[1], @"title":values[2], @"text":values[3]};
    NSDictionary *jsonDict = @{@"newpost": keys};
    
    if ( [NSJSONSerialization isValidJSONObject:jsonDict]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    NSLog(@"Could not form JSON object");
    return nil;
}

@end
