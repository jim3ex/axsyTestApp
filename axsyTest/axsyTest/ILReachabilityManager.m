//
//  ILReachabilityManager.m
//  ILProto4
//
//  Created by James Holland on 31/01/2014.
//  Copyright (c) 2014 James Holland. All rights reserved.
//

#import "ILReachabilityManager.h"
#import "Reachability.h"

@implementation ILReachabilityManager
#pragma mark -
#pragma mark Default Manager
+ (ILReachabilityManager *)sharedManager {
    static ILReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}
#pragma mark -
#pragma mark Memory Management
- (void)dealloc {
    // Stop Notifier
    if (_reachability) {
        [_reachability stopNotifier];
    }
}
#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable {
    return [[[ILReachabilityManager sharedManager] reachability] isReachable];
}
+ (BOOL)isUnreachable {
    return ![[[ILReachabilityManager sharedManager] reachability] isReachable];
}
+ (BOOL)isReachableViaWWAN {
    return [[[ILReachabilityManager sharedManager] reachability] isReachableViaWWAN];
}
+ (BOOL)isReachableViaWiFi {
    return [[[ILReachabilityManager sharedManager] reachability] isReachableViaWiFi];
}
#pragma mark -
#pragma mark Private Initialization
- (id)init {
    self = [super init];
    if (self) {
        // Initialize Reachability
        self.reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        // Start Monitoring
        [self.reachability startNotifier];
    }
    return self;
}
@end
