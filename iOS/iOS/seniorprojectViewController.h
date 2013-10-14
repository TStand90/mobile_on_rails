//
//  seniorprojectViewController.h
//  iOS
//
//  Created by Tyler Standridge on 9/15/13.
//  Copyright (c) 2013 Tyler Standridge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface seniorprojectViewController : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UITextField *titleField;
    __weak IBOutlet UITextView *textField;
    __weak IBOutlet UITableView *latestTable;
    
}

- (IBAction)submitButtonPressed:(id)sender;
- (IBAction)draftButtonPressed:(id)sender;
- (IBAction)done:(UIStoryboardSegue *)seque;
- (IBAction)showLatestButtonPressed:(id)sender;
- (NSString*)createJSONForRequest:(int)requestType withValues:(NSArray *)values;
- (NSString *)latestPostsJSONBuilder:(NSArray *)values;
- (NSString *)newPostJSONBuilder:(NSArray *)values;
@end
