//
//  ILReachabilityManager.h
//  ILProto4
//
//  Created by James Holland on 31/01/2014.
//  Copyright (c) 2014 James Holland. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Reachability;
@interface ILReachabilityManager : NSObject
@property (strong, nonatomic) Reachability *reachability;
#pragma mark -
#pragma mark Shared Manager
+ (ILReachabilityManager *)sharedManager;
#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable;
+ (BOOL)isUnreachable;
+ (BOOL)isReachableViaWWAN;
+ (BOOL)isReachableViaWiFi;
@end
