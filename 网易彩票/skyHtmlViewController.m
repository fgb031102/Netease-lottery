//
//  skyHtmlViewController.m
//  网易彩票
//
//  Created by sky on 14-5-19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyHtmlViewController.h"
#import "skyHtml.h"

@interface skyHtmlViewController () <UIWebViewDelegate>

@end

@implementation skyHtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setLeftBtn];
    
    UIWebView *webView = (UIWebView *)self.view;
    self.title = self.html.title;
    webView.delegate = self;
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.html.html withExtension:nil];
    
    NSLog(@"%@",url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)setLeftBtn
{
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(diss:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
}

- (void)diss:(UIBarButtonItem *)barItem
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


//利用webView来加载js代码，让网页实现定位滚动。
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%@",self.html.ID);
    NSString *str = [NSString stringWithFormat:@"window.location.href = '#%@';",self.html.ID];
    [webView stringByEvaluatingJavaScriptFromString:str];
}

@end
