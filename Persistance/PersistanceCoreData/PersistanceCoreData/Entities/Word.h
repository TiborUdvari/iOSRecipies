//
//  Word.h
//  PersistanceCoreData
//
//  Created by Tibor Udvari on 6/3/13.
//  Copyright (c) 2013 Tibor Udvari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Vocabulary;

@interface Word : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * translation;
@property (nonatomic, retain) Vocabulary *vocabulary;

@end
