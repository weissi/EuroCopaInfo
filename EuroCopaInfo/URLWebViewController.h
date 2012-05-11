//
//  HTMLViewController.h
//  dPadProto
//
//  Created by Stefan Wehr on 15.03.10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URLWebViewController : UIViewController <UIWebViewDelegate> {
  @private
    NSURL *initialURL;
    NSURL *currentURL;
    UIWebView *webView;
    UIApplication *application;
}

@property (nonatomic, retain) UIApplication *application;

- (void)loadURL:(NSURL *)url;
- (id)initWithURL:(NSURL *)url;
- (void)goBack;

@end
