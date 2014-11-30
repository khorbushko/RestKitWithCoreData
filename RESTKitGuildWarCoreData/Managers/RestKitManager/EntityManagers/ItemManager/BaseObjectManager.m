//
//  ItemManager.m
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "BaseObjectManager.h"
#import "ItemRK.h"

@implementation BaseObjectManager

#pragma mark - Singleton

+ (instancetype)sharedManager
{
    static BaseObjectManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedManager = [super sharedManager];
    });
    return sharedManager;
}

#pragma mark - Public

- (void)loadItemWithId:(NSInteger)itemId success:(ItemSuccess)success failure:(ObjectFailure)failure
{
    NSDictionary *parameters = @{ @"item_id" : @(itemId) };
    [self getObjectsAtPath:kItemsDetailsPathPattern parameters:parameters success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            success(mappingResult.array);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure (operation, error);
        }
    }];
}

@end
