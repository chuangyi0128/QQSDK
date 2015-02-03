//
//  SLViewController.m
//  QQSDK
//
//  Created by SongLi on 01/30/2015.
//  Copyright (c) 2014 SongLi. All rights reserved.
//

#import "SLViewController.h"
#import "TencentOAuth.h"

@interface SLViewController () <TencentSessionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *loginoutButton;
@property (nonatomic, strong) TencentOAuth *oauth;
@end

@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.oauth = [[TencentOAuth alloc] initWithAppId:@"222222" andDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)handleLogInOut:(UIButton *)sender
{
    if (![self.oauth isSessionValid]) {
        [self.oauth authorize:@[kOPEN_PERMISSION_GET_INFO,
                                kOPEN_PERMISSION_ADD_TOPIC,
                                kOPEN_PERMISSION_ADD_PIC_T]];
    } else {
        [self.oauth logout:self];
    }
}


#pragma mark - TencentSessionDelegate

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
    if (self.oauth.accessToken.length > 0) {
        [self.loginoutButton setSelected:YES];
        
        if ([self.oauth getUserInfo]) {
            NSLog(@"Get User Info Succeed");
        } else {
            NSLog(@"Get User Info Failed");
        }
    } else {
        [self.loginoutButton setSelected:NO];
    }
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    [self.loginoutButton setSelected:NO];
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
    NSLog(@"%s", __func__);
}

/**
 * 退出登录的回调
 */
- (void)tencentDidLogout
{
    [self.loginoutButton setSelected:NO];
}

@end
