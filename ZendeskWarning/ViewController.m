//
//  ViewController.m
//  ZendeskWarning
//
//  Created by Jeff Remer on 5/9/18.
//  Copyright © 2018 Strava. All rights reserved.
//

#import "ViewController.h"

@import ZendeskCoreSDK;
@import ZendeskSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [ZDKZendesk initializeWithAppId:@"appID" clientId:@"secret" zendeskUrl:@"https://support.strava.com"];
    [ZDKSupport initializeWithZendesk:[ZDKZendesk instance]];
    id<ZDKObjCIdentity> userIdentity = [[ZDKObjCAnonymous alloc] initWithName:nil email:nil];
    [[ZDKZendesk instance] setIdentity:userIdentity];
}

- (IBAction)showArticle:(id)sender
{
    UIViewController *articleController = [ZDKHelpCenterUi buildHelpCenterArticleWithArticleId:@"216919427"
                                                                                    andConfigs:@[]];
    [self.navigationController pushViewController:articleController animated:YES];
}

@end
