//
//  RumorsWebViewController.m
//  Week 8 Final Project
//
//  Created by Devon Smith on 6/25/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import "RumorsWebViewController.h"

@interface RumorsWebViewController ()

@end

@implementation RumorsWebViewController

@synthesize webView;
@synthesize activity;

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
    NSURL *url = [NSURL URLWithString:@"http://iphone.macrumors.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.delegate = self;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [activity startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [activity stopAnimating];
    activity.hidden = TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
