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
    [ts setObject:@"abcd" forKey:@"author"];
    [ts setObject:@"efgh" forKey:@"title"];
    [ts setObject:@"ijkl" forKey:@"text"];
    NSMutableArray* jsonArray = [NSMutableArray arrayWithObject:ts];
    [jsonArray addObject:ts];
    NSData *js = [NSJSONSerialization dataWithJSONObject:jsonArray options:NSJSONReadingMutableContainers error: nil];
    
    NSString *title = [titleField text];
    NSString *text = [textField text];
    // BEGIN NETWORKING CODE
    NSString *urlAsString = @"http://107.210.9.246:3000/receive";
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSString *body;
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [urlRequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://107.210.9.246:3000/receive"]]];
    [urlRequest setHTTPMethod:@"POST"];
    
    //body = [NSString stringWithFormat:@"{\"posting\": {\"title\": \"%@\", \"author\": \"Test\", \"text\": \"%@\"}}", title, text];
    body = [NSString stringWithFormat:@"{\"title\": \"%@\", \"author\": \"Test\", \"text\": \"%@\"}", title, text];
    //body = [NSString stringWithFormat:@"{title: %@, author: Test, text: %@}", title, text];
    //body = [NSString stringWithFormat:@"post: {title: %@, author: Test, text: %@}", title, text];
    NSLog(body);
    //body = @"{\"post\": {\"title\": \"a\", \"author\": \"Test\", \"text\": \"x\"}";

    [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection
     sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response,
                                                                        NSData *data,
                                                                        NSError *error) {
         if ([data length] > 0 && error == nil) {
             NSString *html = [[NSString alloc] initWithData:data
                                                    encoding:NSUTF8StringEncoding];
             NSLog(@"Html = %@", html);
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

@end
