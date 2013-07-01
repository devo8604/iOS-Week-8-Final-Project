//
//  UserPrefViewController.h
//  Week 8 Final Project
//
//  Created by Devon Smith on 6/25/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserPrefViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *homeCity;
@property (weak, nonatomic) IBOutlet UITextField *homeState;
@property UITextField *currentTextField;
@property BOOL keyboardIsShown;


- (IBAction)saveButton:(id)sender;


@end
