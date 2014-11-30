//
//  AttributeRK.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class InfixUpgradeRK;

@interface AttributeRK : NSManagedObject

@property (nonatomic, retain) NSString * attributeName;
@property (nonatomic, retain) NSNumber * modifier;
@property (nonatomic, retain) InfixUpgradeRK *infixUpgrade;

@end
