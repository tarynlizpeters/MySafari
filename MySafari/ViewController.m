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
    if([textField.text containsString:@"http://www."] == YES) {
        textField.text = textField.text;
    }else if ([textField.text containsString:@"https://www."] == YES) {
        textField.text = textField.text;
    }else if ([textField.text containsString:@"www."] == YES) {
        textField.text = [NSString stringWithFormat:@"http://%@", textField.text];
    }else {
        textField.text = [NSString stringWithFormat:@"http://www.%@", textField.text];
    }

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
    [self.WebView goBack];
    
}
- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    [self.WebView goForward];
    
}

- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    [self.WebView stopLoading];
}

- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.WebView reload];
}

@end
