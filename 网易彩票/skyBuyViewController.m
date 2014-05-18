//
//  skyBuyViewController.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyBuyViewController.h"
#import "UIImage+sky.h"

@interface skyBuyViewController ()

@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation skyBuyViewController

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
    [super viewDidLoad];
    
    [self.login setBackgroundImage:[UIImage imageWithName:@"NavButton"] forState:UIControlStateNormal];
    [self.login setBackgroundImage:[UIImage imageWithName:@"NavButtonPressed"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
