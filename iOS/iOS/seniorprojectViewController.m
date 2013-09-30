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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonPressed:(id)sender
{
    NSLog(@"Submit Button Pressed!");
}

- (IBAction)draftButtonPressed:(id)sender
{
    NSLog(@"Draft Button Pressed!");    
}

-(IBAction)done:(UIStoryboardSegue *)seque{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
