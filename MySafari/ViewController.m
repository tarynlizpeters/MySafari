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

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Spinner;
@property (weak, nonatomic) IBOutlet UIButton *backButton;


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
    [self.webView loadRequest:destination];
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.Spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.Spinner stopAnimating];
    
    if ([webView canGoBack]){
        [self.backButton setEnabled:YES];
    }
        else{
            [self.backButton setEnabled:NO];
    
}

}
- (IBAction)onBackButtonPressed:(UIButton *)sender {
    [self.webView goBack];
    
}
- (IBAction)onForwardButtonPressed:(UIButton *)sender {
    [self.webView goForward];
    
}

- (IBAction)onStopLoadingButtonPressed:(UIButton *)sender {
    [self.webView stopLoading];
}

- (IBAction)onReloadButtonPressed:(UIButton *)sender {
    [self.webView reload];
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    UIAlertController *comingSoonButton = [UIAlertController alertControllerWithTitle:@"Coming Soon!" message:@"New Stuff!" preferredStyle:
                                           UIAlertControllerStyleAlert];
    UIAlertAction *neat = [UIAlertAction actionWithTitle:@"Neato!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    [self presentViewController:comingSoonButton animated:YES completion:^{
        nil;
    }];
    [comingSoonButton addAction:neat];

        
   
}


@end
