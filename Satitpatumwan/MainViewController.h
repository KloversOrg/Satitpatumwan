//
//  MainViewController.h
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorLoading;

@property(nonatomic) NSString *urlString; // @property(nonatomic) BOOL *isSomethingEnabled;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end
