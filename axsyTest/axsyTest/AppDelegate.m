//
//  AppDelegate.m
//  axsyTest
//
//  Created by James Holland on 08/12/2015.
//  Copyright © 2015 The Digital Forge. All rights reserved.
//
// mogenerator --template-var arc=true -m axsyTest/axsyTest.xcdatamodeld -M axsyTest -H axsyTest

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"
#import "User.h"
#import "Album.h"
#import "Picture.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate

NSUInteger downloadState =0;

+ (AppDelegate *)sharedAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;

    UINavigationController *masterNavigationController = splitViewController.viewControllers[0];
    MasterViewController *controller = (MasterViewController *)masterNavigationController.topViewController;
    controller.managedObjectContext = self.managedObjectContext;
    
    

    [self downloadDataFromRoute:@"/users"];
    
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.thedigitalforge.axsyTest" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"axsyTest" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"axsyTest.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Utilities

-(NSArray *)getAllEntities:(NSString *)entityToGet withPredicate:(NSPredicate *)thisPredicate {

    
    DLog(@"%@",thisPredicate.description);
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:entityToGet inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    if(thisPredicate) [fetchRequest setPredicate:thisPredicate];
    
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:SORT_KEY_POPULARITY ascending:YES];
    //NSArray *sortDescriptors = @[sortDescriptor];
    //[fetchRequest setSortDescriptors:sortDescriptors];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:100];
    
    //[fetchRequest setPropertiesToFetch:[NSArray arrayWithObjects:@"name", nil]];
    
    NSError *error;
    NSArray *results = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(!error) {
        return [NSMutableArray arrayWithArray:results];
    } else {
        DLog(@"getAllEntities (%@) in EntityAdd",entityToGet);
        return nil;
    }
}

-(NSInteger)countEntity:(NSString *)entity withPredicate:(NSPredicate *)predicate inManagedObjectContext:(NSManagedObjectContext *)moc {
    if(!moc) moc = _managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    //See if it exists
    if(!moc) return -1;
    NSEntityDescription *thisEntity = [NSEntityDescription entityForName:entity inManagedObjectContext:moc];
    [request setEntity:thisEntity];

    if (predicate) [request setPredicate:predicate];
    NSError *error = nil;
    NSUInteger count = [moc countForFetchRequest:request error:&error];
    if(!error) return count;
    else {
        ALog(@"countEntity: ]Unresolved error %@, %@", error, [error userInfo]);
        return -1;
    }
}

#pragma mark - Downloader

-(void)downloadDataFromRoute:(NSString *)route {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://jsonplaceholder.typicode.com%@",route]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[request addValue: myEmail forHTTPHeaderField:@"user-email"]; JWH No auth required for this API
    //[request addValue: mySessionToken forHTTPHeaderField:@"user-token"];
    
    
    NSError *error = nil;
    
    
    if (!error) {
        
        NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
                if (httpResp.statusCode == 200) {
                    
                    
                    NSDictionary* json = [NSJSONSerialization
                                          JSONObjectWithData:data
                                          options:kNilOptions
                                          error:&error];
                    
                    if([route isEqualToString:@"/users"]) {
                        NSLog(@"process user JSON");
                        [self processUser:json];
                    } else if([route isEqualToString:@"/albums"]) {
                        NSLog(@"process user JSON");
                        [self processAlbums:json];
                    } else if([route isEqualToString:@"/photos"]) {
                        NSLog(@"process user JSON");
                        [self processPhotos:json];
                    }
                    
                    NSLog(@"%@",json);
                    
                    
                }
            }
            
        }];
        
        
        [downloadTask resume];
        
    }
}


#pragma mark - JSON Parsers

-(void)processUser:(NSDictionary *)json {
    if(json) {
        //See if user exists in Core Data
        for(NSDictionary *thisUser in json) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(id == %@)",[thisUser objectForKey:@"id"]];
            if([self countEntity:CDE_USER withPredicate:predicate inManagedObjectContext:_managedObjectContext] == 0) {
                //New user
                DLog(@"Storing User %@",[thisUser objectForKey:@"id"]);
                User *newUser = [User insertInManagedObjectContext:_managedObjectContext];
                newUser.id = [thisUser objectForKey:@"id"];
                newUser.name = [thisUser objectForKey:@"name"];
                newUser.username = [thisUser objectForKey:@"name"];
                newUser.email = [thisUser objectForKey:@"email"];
                //Not in brief just now so not storing all data STUB
            }
        }
        [self saveContext];
    }
    [self downloadDataFromRoute:@"/albums"];
}

-(void)processAlbums:(NSDictionary *)json {
    if(json) {
        //See if user exists in Core Data
        for(NSDictionary *thisAlbum in json) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(id == %@)",[thisAlbum objectForKey:@"id"]];
            if([self countEntity:CDE_ALBUM withPredicate:predicate inManagedObjectContext:_managedObjectContext] == 0) {
                //New Album
                DLog(@"Storing Album %@",[thisAlbum objectForKey:@"id"]);
                Album *newAlbum = [Album insertInManagedObjectContext:_managedObjectContext];
                newAlbum.id = [thisAlbum objectForKey:@"id"];
                newAlbum.userId = [thisAlbum objectForKey:@"userId"];
                newAlbum.title = [thisAlbum objectForKey:@"title"];
                //Connect Album to User
                //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(id == %@)",[thisAlbum objectForKey:@"userId"]];
                //NSArray  *users = [self getAllEntities:CDE_USER withPredicate:predicate];
                //DLog(@"users %@",users);
                //if(users.count == 1) {
                //    User *thisUser = users[0];
                //    [thisUser addAlbumsObject:newAlbum];
                //    [newAlbum setUser:thisUser];
                //}
                [self saveContext];
            }
        }
        
    }
    [self downloadDataFromRoute:@"/photos"];
}


-(void)processPhotos:(NSDictionary *)json {
    if(json) {
        //See if user exists in Core Data
        for(NSDictionary *thisPictureMeta in json) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(id == %@)",[thisPictureMeta objectForKey:@"id"]];
            if([self countEntity:CDE_PICTURE withPredicate:predicate inManagedObjectContext:_managedObjectContext] == 0) {
                //New user
                DLog(@"Storing Picture Meta Data %@",[thisPictureMeta objectForKey:@"id"]);
                Picture *newPicture = [Picture insertInManagedObjectContext:_managedObjectContext];
                newPicture.id = [thisPictureMeta objectForKey:@"id"];
                newPicture.albumId = [thisPictureMeta objectForKey:@"albumId"];
                newPicture.title = [thisPictureMeta objectForKey:@"title"];
                newPicture.url = [thisPictureMeta objectForKey:@"url"];
                newPicture.thumbnailURL = [thisPictureMeta objectForKey:@"thumbnailUrl"];
                
                //Connect Photo to Album
                
                //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(id == %@)",[thisPictureMeta objectForKey:@"albumId"]];
                //NSArray  *albums = [[AppDelegate sharedAppDelegate] getAllEntities:CDE_ALBUM withPredicate:predicate ];
                //if(albums.count == 1) {
                //    Album *thisAlbum = albums[0];
                //    [thisAlbum addPicturesObject:newPicture];
                //    [newPicture addAlbumsObject:thisAlbum];
                //}
                 
                [self saveContext];
            }
        }
        
    }
    
    [self buildConnections];
}

-(void)buildConnections {
    
    NSArray *allUsers = [self getAllEntities:CDE_USER withPredicate:nil];
    NSArray *allPictures = [self getAllEntities:CDE_PICTURE withPredicate:nil];
    NSArray *allAlbums = [self getAllEntities:CDE_ALBUM withPredicate:nil];
    
    for(User *thisUser in allUsers) {
        for(Album *thisAlbum in allAlbums) {
            if([thisAlbum.userId integerValue] == [thisUser.id integerValue]) {
                [thisUser addAlbumsObject:thisAlbum];
                [thisAlbum setUser:thisUser];
            }
        }
        [self saveContext];
    }
    DLog(@"Albums linked to users");
    
    for(Picture *thisPicture in allPictures) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.id == %@",thisPicture.albumId];
        NSMutableArray *searchResults = [NSMutableArray arrayWithArray:[allAlbums filteredArrayUsingPredicate:predicate]];
        if(searchResults.count == 1) {
            Album *thisAlbum = searchResults[0];
            [thisAlbum addPicturesObject:thisPicture];
            [thisPicture addAlbumsObject:thisAlbum];
        }
        
    }
    DLog(@"Pictures linked to albums");
    [self saveContext];
    
    
}


@end
