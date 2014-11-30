//
//  RKBaseObjectManager.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "RKObjectManager.h"

@interface RKBaseObjectManager : RKObjectManager

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (instancetype)sharedManager;

@end
