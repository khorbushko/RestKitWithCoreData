//
//  MappingProvider.m
//  RESTKitGuildWarCoreData
//
//  Created by Kirill on 11/30/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "MappingProvider.h"
#import "ItemRK.h"
#import "WeaponRK.h"
#import "BaseObjectManager.h"
#import "RKBaseObjectManager.h"

static NSString *const MPItemEntityName = @"ItemRK";
static NSString *const MPWeaponEntityName = @"WeaponRK";
static NSString *const MPAttributeEntityName = @"AttributeRK";

@implementation MappingProvider

#pragma mark - EntityMapping

+ (RKEntityMapping *)mappingForItemRKEntity
{
    BaseObjectManager *manager = [BaseObjectManager sharedManager];
    RKEntityMapping *itemEntityMapping = [RKEntityMapping mappingForEntityForName:MPItemEntityName inManagedObjectStore:manager.managedObjectStore];

    itemEntityMapping.identificationAttributes = @[@"itemID"];
    [itemEntityMapping addAttributeMappingsFromDictionary:[MappingProvider mappingDictionaryForItem]];
    
    [itemEntityMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"weapon" toKeyPath:@"weapon" withMapping: [MappingProvider mappingForWeaponRKEntity]]];
    
    return itemEntityMapping;
}

+ (RKEntityMapping *)mappingForWeaponRKEntity
{
    BaseObjectManager *manager = [BaseObjectManager sharedManager];
    RKEntityMapping *weaponEntityMapping = [RKEntityMapping mappingForEntityForName:MPWeaponEntityName inManagedObjectStore:manager.managedObjectStore];
    weaponEntityMapping.identificationAttributes = @[@"suffixitemId"];
    [weaponEntityMapping addAttributeMappingsFromDictionary:[MappingProvider mappingDictionaryForWeapon]];
    return weaponEntityMapping;
}

#pragma mark - Private

+ (NSDictionary *)mappingDictionaryForItem
{
    NSDictionary *dictionary = @{
                                 @"item_id" : @"itemID",
                                 @"name" : @"name",
                                 @"description" : @"itemDescription",
                                 @"type" : @"type",
                                 @"level" : @"level",
                                 @"rarity" : @"rarity",
                                 @"vendor_value" : @"vendorValue",
                                 @"icon_file_id" : @"iconFileId",
                                 @"icon_file_signature" : @"iconFileSignature",
                                 @"default_skin" : @"defaultScin",
                                 @"game_types" : @"gameTypes",
                                 @"flags" : @"flags",
                                 @"restrictions" : @"restrictions"
                                 };
    return dictionary;
}

+ (NSDictionary *)mappingDictionaryForWeapon
{
    NSDictionary *dictionary = @{
                                  @"type" : @"type",
                                  @"damage_type" : @"damageType",
                                  @"min_power" : @"minPowerValue",
                                  @"max_power" : @"maxPowerValue",
                                  @"defense" : @"defence",
                                  @"suffix_item_id" : @"suffixitemId",
                                  @"secondary_suffix_item_id" : @"secondarySuffixItemId",
                                  @"infusion_slots" : @"infusionSlots"
                                  };
    return dictionary;
}


//sample response
//{
//    "item_id": "28445",
//    "name": "Strong Soft Wood Longbow of Fire",
//    "description": "",
//    "type": "Weapon",
//    "level": "44",
//    "rarity": "Masterwork",
//    "vendor_value": "120",
//    "icon_file_id": "65015",
//    "icon_file_signature": "C6110F52DF5AFE0F00A56F9E143E9732176DDDE9",
//    "default_skin": "3942",
//    "game_types": [
//                   "Activity",
//                   "Dungeon",
//                   "Pve",
//                   "Wvw"
//                   ],
//    "flags": [
//              "SoulBindOnUse"
//              ],
//    "restrictions": [],
//    "weapon": {
//        "type": "LongBow",
//        "damage_type": "Physical",
//        "min_power": "385",
//        "max_power": "452",
//        "defense": "0",
//        "infusion_slots": [],
//        "infix_upgrade": {
//            "attributes": [
//                           {
//                               "attribute": "Power",
//                               "modifier": "62"
//                           },
//                           {
//                               "attribute": "Precision",
//                               "modifier": "44"
//                           }
//                           ]
//        },
//        "suffix_item_id": "24547",
//        "secondary_suffix_item_id": ""
//    }
//}

@end
