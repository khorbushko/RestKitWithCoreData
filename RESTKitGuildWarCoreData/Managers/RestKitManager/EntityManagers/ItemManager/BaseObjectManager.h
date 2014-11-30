//
//  ItemManager.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

@class ItemRK;

#import "RKBaseObjectManager.h"

typedef void(^ItemSuccess)(NSArray *result);
typedef void(^ObjectFailure)(RKObjectRequestOperation *operation, NSError *error);

@interface BaseObjectManager : RKBaseObjectManager

+ (instancetype)sharedManager;

- (void)loadItemWithId:(NSInteger)itemId success:(ItemSuccess)success failure:(ObjectFailure)failure;

@end
