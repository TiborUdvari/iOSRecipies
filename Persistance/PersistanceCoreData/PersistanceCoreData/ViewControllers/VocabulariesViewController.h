//
//  VocabulariesViewController.h
//  PersistanceCoreData
//
//  Created by Tibor Udvari on 6/3/13.
//  Copyright (c) 2013 Tibor Udvari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vocabulary.h"

@interface VocabulariesViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext * managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController* fetchedResultsController;

- (id) initWithManagedObjectContext: (NSManagedObjectContext*) context;

@end
