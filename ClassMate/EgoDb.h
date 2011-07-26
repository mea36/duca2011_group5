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
- (NSArray*)getListofCourses;
- (NSArray*)getListOfClasses; 
- (NSArray*)getHomeworkForClass:(int)classID;
- (NSArray*)getTestsForClass:(int)classID;
- (NSArray*)getProjectsForClass:(int)classID;
- (void)addClasstoDatabaseWithClassName:(NSString*)className; 
- (void)addEventToDatabaseWithType:(NSString*)type withTitle:(NSString*)title withDescription:(NSString*)description withDate:(NSDate*)date withAssociatedClass:(int)classID;
- (void)deleteEventFromDatabaseWithEventID:(int)eventID;

@end