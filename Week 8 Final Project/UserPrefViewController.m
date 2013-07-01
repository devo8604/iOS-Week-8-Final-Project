//
//  UserPrefViewController.m
//  Week 8 Final Project
//
//  Created by Devon Smith on 6/25/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import "UserPrefViewController.h"

@implementation UserPrefViewController


@synthesize scrollView;
@synthesize currentTextField;
@synthesize keyboardIsShown;
@synthesize firstName;
@synthesize lastName;
@synthesize nickName;
@synthesize homeCity;
@synthesize homeState;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (void)viewDidLoad
{
    
    //Set up the user defaults stuff
    NSUserDefaults *defaultsLoad = [NSUserDefaults standardUserDefaults];
    NSString *firstNameString = [defaultsLoad objectForKey:@"First Name"];
    NSString *lastNameString = [defaultsLoad objectForKey:@"Last Name"];
    NSString *nickNameString = [defaultsLoad objectForKey:@"Nickname"];
    NSString *homeCityString = [defaultsLoad objectForKey:@"Home City"];
    NSString *homeStateString = [defaultsLoad objectForKey:@"Home State"];
    
    firstName.text = firstNameString;
    lastName.text = lastNameString;
    nickName.text = nickNameString;
    homeCity.text = homeCityString;
    homeState.text = homeStateString;
    
    
    //Sets up the scrollView
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320.0, 600.0)];
    
    
    //sets up the keyboard/view change action
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector:@selector(keyboardDidShow:)
     name:UIKeyboardDidShowNotification
     object:self.view.window];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardDidHide:)
     name:UIKeyboardDidHideNotification
     object:nil];

    [super viewDidLoad];
    [self showCityInfo];
    [defaultsLoad synchronize];
    
}

- (void) showCityInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL enabled = [defaults boolForKey:@"showLabelBool"];
    
    if (enabled) {
        homeCity.hidden=NO;
        homeState.hidden=NO;
    } else {
        homeCity.hidden=YES;
        homeState.hidden=YES;
    }
}

//Save button for the default info
- (IBAction)saveButton:(id)sender
{

    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [nickName resignFirstResponder];
    [homeCity resignFirstResponder];
    [homeState resignFirstResponder];

    NSString *firstNameString = [firstName text];
    NSString *lastNameString = [lastName text];
    NSString *nickNameString = [nickName text];
    NSString *homeCityString = [homeCity text];
    NSString *homeStateString = [homeState text];
    
    NSUserDefaults *defaulSave = [NSUserDefaults standardUserDefaults];
    [defaulSave setObject:firstNameString forKey:@"First Name"];
    [defaulSave setObject:lastNameString forKey:@"Last Name"];
    [defaulSave setObject:nickNameString forKey:@"Nickname"];
    [defaulSave setObject:homeCityString forKey:@"Home City"];
    [defaulSave setObject:homeStateString forKey:@"Home State"];
    NSLog(@"Defaults Saved");
    
    NSString *alertMessage = @"Data Saved";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: nil
                                                    message: alertMessage
                                                   delegate: sender
                                          cancelButtonTitle: @"Ok"
                                          otherButtonTitles: nil];
        [alert show];
    }

-(void) keyboardDidShow:(NSNotification *) notification {
    if (keyboardIsShown) return;
    
    NSDictionary* info = [notification userInfo];
    
    NSValue *aValue =
    [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect =
    [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    NSLog(@"%f", keyboardRect.size.height);
    
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height -= keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [currentTextField frame];
    [scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardIsShown = YES;
}

-(void) keyboardDidHide:(NSNotification *) notification {
    NSDictionary* info = [notification userInfo];
    
    NSValue* aValue =
    [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect =
    [self.view convertRect:[aValue CGRectValue] fromView:nil];
    
    CGRect viewFrame = [scrollView frame];
    viewFrame.size.height += keyboardRect.size.height;
    scrollView.frame = viewFrame;
    
    keyboardIsShown = NO;
}


@end
