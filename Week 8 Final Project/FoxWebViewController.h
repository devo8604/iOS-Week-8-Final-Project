//
//  FoxWebViewController.h
//  Week 8 Final Project
//
//  Created by Devon Smith on 6/25/13.
//  Copyright (c) 2013 Devon Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoxWebViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;


@end
