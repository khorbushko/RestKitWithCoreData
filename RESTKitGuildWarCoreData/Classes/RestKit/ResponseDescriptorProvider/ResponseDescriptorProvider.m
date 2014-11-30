//
//  ResponseDescriptorProvider.m
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "ResponseDescriptorProvider.h"
#import "BaseObjectManager.h"
#import "MappingProvider.h"

@implementation ResponseDescriptorProvider

+ (RKResponseDescriptor *)itemResponseDescriptor
{
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider mappingForItemRKEntity]
                                                 method:RKRequestMethodGET
                                            pathPattern:kItemsDetailsPathPattern
                                                keyPath:nil
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return responseDescriptor;
}

+ (RKResponseDescriptor *)weaponResponseDescriptor
{
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider mappingForWeaponRKEntity]
                                                 method:RKRequestMethodGET
                                            pathPattern:kItemsDetailsPathPattern
                                                keyPath:kWeaponDetailsKeyPath
                                            statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return responseDescriptor;
}

@end
