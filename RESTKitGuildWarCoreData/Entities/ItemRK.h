//
//  ItemRK.h
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WeaponRK;

@interface ItemRK : NSManagedObject

@property (nonatomic, retain) NSNumber * defaultScin;
@property (nonatomic, retain) id flags;
@property (nonatomic, retain) NSNumber * iconFileId;
@property (nonatomic, retain) NSString * iconFileSignature;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSNumber * itemID;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * rarity;
@property (nonatomic, retain) id restrictions;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * vendorValue;
@property (nonatomic, retain) id gameTypes;
@property (nonatomic, retain) WeaponRK *weapon;

@end
