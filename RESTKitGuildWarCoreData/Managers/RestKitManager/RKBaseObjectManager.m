//
//  RKBaseObjectManager.m
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "RKBaseObjectManager.h"
#import "MappingProvider.h"

@implementation RKBaseObjectManager

#pragma mark - Public

+ (instancetype)sharedManager
{
    RKBaseObjectManager *sharedManager = [self managerWithBaseURL:[NSURL URLWithString:kBaseApiUrl]];
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    [sharedManager setupRestKitWithRKObjectManager:sharedManager];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    return sharedManager;
}

#pragma mark - Getters

- (NSManagedObjectContext *)managedObjectContext
{
    return self.managedObjectStore.mainQueueManagedObjectContext;
}

#pragma mark - Private

- (void)setupRestKitWithRKObjectManager:(RKObjectManager *)manager
{
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    manager.managedObjectStore = managedObjectStore;
    [self coreDataStackInitialisationWithRKManagedObjectStore:managedObjectStore];
}

- (void)coreDataStackInitialisationWithRKManagedObjectStore:(RKManagedObjectStore *)managedObjectStore
{
    [managedObjectStore createPersistentStoreCoordinator];
    NSString *dbName = [NSString stringWithFormat:@"%@.sqlite", kDataBaseName];
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:dbName];
    NSError *error;
    NSPersistentStore *persistentStore =
    [managedObjectStore addSQLitePersistentStoreAtPath:storePath
                                fromSeedDatabaseAtPath:nil
                                     withConfiguration:nil
                                               options:@{
                                                         NSMigratePersistentStoresAutomaticallyOption:@YES,
                                                         NSInferMappingModelAutomaticallyOption:@YES
                                                         }
                                                 error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store with error: %@", error);
    [managedObjectStore createManagedObjectContexts];
    managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
}

@end
