//
//  InfixUpgradeRK.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AttributeRK, WeaponRK;

@interface InfixUpgradeRK : NSManagedObject

@property (nonatomic, retain) NSSet *attributes;
@property (nonatomic, retain) WeaponRK *weapon;
@end

@interface InfixUpgradeRK (CoreDataGeneratedAccessors)

- (void)addAttributesObject:(AttributeRK *)value;
- (void)removeAttributesObject:(AttributeRK *)value;
- (void)addAttributes:(NSSet *)values;
- (void)removeAttributes:(NSSet *)values;

@end
