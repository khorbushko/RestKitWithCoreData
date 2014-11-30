//
//  MainViewController.m
//  RESTKitGuildWar
//
//  Created by Kirill on 11/29/14.
//  Copyright (c) 2014 Kirill Gorbushko. All rights reserved.
//

#import "MainViewController.h"
#import "ItemRK.h"
#import "WeaponRK.h"
#import "BaseObjectManager.h"
#import "ResponseDescriptorProvider.h"

@interface MainViewController ()

@property (strong, nonatomic) NSMutableArray *storedItems;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getItemFromAPI];
    //[self getItemsFromDB];
}

#pragma mark - Private

- (void)getItemFromAPI
{
    [[BaseObjectManager sharedManager] addResponseDescriptor:[ResponseDescriptorProvider itemResponseDescriptor]];
    [[BaseObjectManager sharedManager] loadItemWithId:28445 success:^(NSArray *result) {
        NSArray *arout = result;
        NSLog(@"Result: Item -  %@ and nested Weapon - %@", (ItemRK *)[arout firstObject], ((WeaponRK *)((ItemRK *)[arout firstObject]).weapon).type );
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Error response': %@", error);
    }];

}

- (void)getItemsFromDB
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityForSearch = [NSEntityDescription entityForName:@"ItemRK" inManagedObjectContext:[ItemManager sharedManager].managedObjectContext];
    [fetchRequest setEntity:entityForSearch];
    
    NSError *error;
    NSArray *result = [[ItemManager sharedManager].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (ItemRK *item in result) {
        if (!self.storedItems) {
            self.storedItems = [[NSMutableArray alloc] init];
        }
        [self.storedItems addObject:item];
    }
}

@end
