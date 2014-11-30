//
//  WeaponRK.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class InfixUpgradeRK, ItemRK;

@interface WeaponRK : NSManagedObject

@property (nonatomic, retain) NSString * damageType;
@property (nonatomic, retain) NSNumber * defence;
@property (nonatomic, retain) id infusionSlots;
@property (nonatomic, retain) NSNumber * itemID;
@property (nonatomic, retain) NSNumber * maxPowerValue;
@property (nonatomic, retain) NSNumber * minPowerValue;
@property (nonatomic, retain) NSNumber * secondarySuffixItemId;
@property (nonatomic, retain) NSNumber * suffixitemId;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSSet *infixUpgrade;
@property (nonatomic, retain) ItemRK *item;
@end

@interface WeaponRK (CoreDataGeneratedAccessors)

- (void)addInfixUpgradeObject:(InfixUpgradeRK *)value;
- (void)removeInfixUpgradeObject:(InfixUpgradeRK *)value;
- (void)addInfixUpgrade:(NSSet *)values;
- (void)removeInfixUpgrade:(NSSet *)values;

@end
