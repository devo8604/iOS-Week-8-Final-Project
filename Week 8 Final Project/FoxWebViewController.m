//
//  FoxWebViewController.m
//  Week 8 Final Project
//
//  Created by Devon Smith on 6/25/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import "FoxWebViewController.h"

@interface FoxWebViewController ()

@end

@implementation FoxWebViewController

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

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.foxnews.mobi/"];
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
