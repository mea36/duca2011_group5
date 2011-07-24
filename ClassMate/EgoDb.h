//
//  EgoDb.h
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EGODatabase.h"

@interface EgoDb : EGODatabase {
    
}

+ (EgoDb*) database;
- (id)init;
- (void)createEditableCopyOfDatabaseIfNeeded;
- (NSArray*)getListOfClasses; 
- (NSArray*)getHomeworkForClass:(int)classID;
- (NSArray*)getTestsForClass:(int)classID;
- (NSArray*)getProjectsForClass:(int)classID;

//other methods for the db will go here
@end