//
//  AppDelegate.m
//  XZNetworkTypeDemo
//
//  Created by 徐章 on 16/5/12.
//  Copyright © 2016年 徐章. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>  //为判断网络制式的主要文件
#import <CoreTelephony/CTCarrier.h> //添加获取客户端运营商 支持
#import "Reachability.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Reachability *reach = [Reachability reachabilityWithHostName:@"http://cn.bing.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:// 没有网络
        {
            
            NSLog(@"没有网络");
        }
            break;
            
        case ReachableViaWiFi:// Wifi
        {
            NSLog(@"WIfi");
        }
            break;
        case ReachableViaWWAN:
        {
        
            CTTelephonyNetworkInfo *networkStatus = [[CTTelephonyNetworkInfo alloc]init];  //创建一个CTTelephonyNetworkInfo对象
            NSString *currentStatus  = networkStatus.currentRadioAccessTechnology; //获取当前网络描述
            
            NSLog(@"%@",networkStatus.subscriberCellularProvider.carrierName);
            
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]){
                NSLog(@"GPRS网络");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]){
                //
                NSLog(@"2.75G");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
                //
                NSLog(@"3G WCDMA网络");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
                //
                NSLog(@"3.5G网络");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
                //
                NSLog(@"3.5G网络");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
                //CDMA2G网络
                NSLog(@"2G网络");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
                //CDMA的EVDORev0(应该算3G吧?)
                NSLog(@"3G");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
                //CDMA的EVDORevA(应该也算3G吧?)
                NSLog(@"3G");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
                //CDMA的EVDORev0(应该还是算吧?)
                NSLog(@"3G");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
                //
                NSLog(@"HRPD网络");
            }
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
                //
                NSLog(@"LTE4G网络");
            }

        }
            break;
        default:
            break;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
