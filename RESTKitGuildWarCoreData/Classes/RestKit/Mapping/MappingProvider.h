//
//  MappingProvider.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MappingProvider : NSObject

+ (RKEntityMapping *)mappingForItemRKEntity;
+ (RKEntityMapping *)mappingForWeaponRKEntity;

@end
