//
//  MagAppDelegate.h
//  vttt
//
//  Created by Grails on 24/08/12.
//  Copyright (c) 2012 algos. All rights reserved.
//  Copia

#import <UIKit/UIKit.h>

@interface MagAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
