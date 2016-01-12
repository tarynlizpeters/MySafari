//
//  ViewController.m
//  MySafari
//
//  Created by Taryn Parker on 1/12/16.
//  Copyright © 2016 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>;
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@property (weak, nonatomic) IBOutlet UIWebView *WebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Spinner;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSURL *url = [NSURL URLWithString:textField.text];
    NSURLRequest *destination = [NSURLRequest requestWithURL:url];
    [self.WebView loadRequest:destination];
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.Spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.Spinner stopAnimating];
    
}

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    -(void)goBack;
    
}


@end
