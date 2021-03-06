//
//  TMKCoreDataManager.h
//  TMKLocationChaser
//
//  Created by ryutamaki on 2014/10/11.
//  Copyright (c) 2014年 Ryu Tamaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Location.h"

@interface TMKCoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (TMKCoreDataManager *)sharedCoreDataManager;

- (NSMutableArray *)fetch:(NSString *)entityName sortKey:(NSString *)key limit:(int)limit;
- (NSManagedObject *)entityForInsert:(NSString *)entityName;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
