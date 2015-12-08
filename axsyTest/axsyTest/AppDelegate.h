//
//  AppDelegate.h
//  axsyTest
//
//  Created by James Holland on 08/12/2015.
//  Copyright © 2015 The Digital Forge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


#define CDE_USER @"User" //DO NOT TRANSLATE
#define CDE_ALBUM @"Album" //DO NOT TRANSLATE
#define CDE_PICTURE @"Picture" //DO NOT TRANSLATE

#ifdef DEBUG
    #define MCRelease(x) [x release]
    #define DLog(...) NSLog(@"%s(%p) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#define ALog(...) {NSLog(@"%s(%p) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__]);[[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__];}
#else
#define MCRelease(x) [x release], x = nil
    #define DLog(...) do { } while (0)
#ifndef NS_BLOCK_ASSERTIONS
    #define NS_BLOCK_ASSERTIONS
#endif

#define ALog(...) NSLog(@"%s(%p) %@", __PRETTY_FUNCTION__, self, [NSString stringWithFormat:__VA_ARGS__])
#endif

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(NSArray *)getAllEntities:(NSString *)entityToGet withPredicate:(NSPredicate *)thisPredicate inManagedObjectContext:(NSManagedObjectContext *)moc;
-(NSInteger)countEntity:(NSString *)entity withPredicate:(NSPredicate *)predicate inManagedObjectContext:(NSManagedObjectContext *)moc;

+ (AppDelegate *)sharedAppDelegate;


@end

