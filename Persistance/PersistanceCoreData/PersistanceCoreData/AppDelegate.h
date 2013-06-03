//
//  AppDelegate.h
//  PersistanceCoreData
//
//  Created by Tibor Udvari on 6/3/13.
//  Copyright (c) 2013 Tibor Udvari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VocabulariesViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UINavigationController* navigationController;
@property (strong, nonatomic) VocabulariesViewController* vocaulariesViewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
