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
    
}

- (IBAction)submitButtonPressed:(id)sender;
- (IBAction)draftButtonPressed:(id)sender;
-(IBAction)done:(UIStoryboardSegue *)seque;

@end
