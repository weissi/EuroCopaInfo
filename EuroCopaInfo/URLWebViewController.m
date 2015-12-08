    //
//  HTMLViewController.m
//  dPadProto
//
//  Created by Stefan Wehr on 15.03.10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "URLWebViewController.h"
#import "FRLayeredNavigationController/FRLayeredNavigation.h"

@interface URLWebViewController ()
@property (nonatomic, retain) NSURL *initialURL;
@property (nonatomic, retain) NSURL *currentURL;
@property (nonatomic, retain) UIWebView *webView;
@end

@implementation URLWebViewController

#pragma mark WebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    self.application.networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)aWebView {
    self.webView.opaque = YES;
    self.application.networkActivityIndicatorVisible = YES;
}

- (void)webView:(UIWebView *)aWebView didFailLoadWithError:(NSError *)error {
    if ([error code] == NSURLErrorCancelled) {
        NSLog(@"Simultanes Laden auf UIWebView %@: %@", aWebView, error);
        return;
    }
    self.application.networkActivityIndicatorVisible = NO;

    if (error.code == 102 && [error.domain isEqual:@"WebKitErrorDomain"]) {
        /* Ignore "Frame Load Interrupted" errors. Simply load it again! */
        NSLog(@"Wired frame load interrupted, url=%@", [error.userInfo valueForKey:@"NSErrorFailingURLKey"]);
        [self loadURL:[error.userInfo valueForKey:@"NSErrorFailingURLKey"]];
    } else {
        NSLog(@"ERROR: %@", error);
    }
}

- (BOOL)webView:(UIWebView *)aWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"webView:%@ shouldStartLoadWithRequest:%@ navigationType:%d", aWebView, request, navigationType);
    return !aWebView.loading;
}

#pragma mark View methods
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
    UIWebView *w = [[UIWebView alloc] initWithFrame:webFrame];
    w.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    w.delegate = self;
    w.userInteractionEnabled = YES;
    w.scalesPageToFit = YES;
    w.backgroundColor = [UIColor whiteColor];
    w.opaque = NO;
    self.webView = w;
    self.view = w;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadURL:self.initialURL];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.layeredNavigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                    initWithImage:[UIImage imageNamed:@"back.png"]
                                                    style:UIBarButtonItemStylePlain
                                                    target:self.webView
                                                    action:@selector(goBack)];
    self.layeredNavigationItem.leftBarButtonItem.style = UIBarButtonItemStyleBordered;
}

- (void)loadURL:(NSURL *)url {
    self.currentURL = url;
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
}

- (void)goBack {
    [self.webView goBack];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
    [super viewDidUnload];
    self.webView = nil;
}

#pragma mark Suspend/resume

#pragma mark Initialization/deallocation

- (id) initWithURL:(NSURL *)url {
    if ((self = [super initWithNibName:nil bundle:nil])) {
        self.initialURL = url;
    }
    return self;
}

@synthesize webView, initialURL, application, currentURL;

@end
