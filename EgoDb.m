//
//  EgoDb.m
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EgoDb.h"
#import "ClassObj.h"
#import "EventObj.h"

@implementation EgoDb

static EgoDb *db;	

+ (EgoDb*) database
{
	if (db == nil) {
		db = [[EgoDb alloc] init];
	}	
	return db;
}

- (id)init {
	if((self = [super initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ClassMate2.sqlite"]])) {
		[self createEditableCopyOfDatabaseIfNeeded];
		if (![self open]) {
			NSLog(@"Could not open db.");
		}
	}
	return self;
}

- (void)createEditableCopyOfDatabaseIfNeeded 
{
	NSString* writeablePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/ClassMate2.sqlite"];
	
	if(![[NSFileManager defaultManager] fileExistsAtPath:writeablePath]) {
		[[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"ClassMate2" ofType:@"sqlite"] toPath:writeablePath error:NULL];
	}
}

- (NSArray *)getListofCourses
{
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];

    EGODatabaseResult *rows = [db executeQuery:@"SELECT * FROM courses"];
    
    for(EGODatabaseRow* row in rows) {
        NSString *course_name = [row stringForColumn:@"course_name"];
        [retval addObject:course_name];
	}
    
    return retval; 
}

- (NSArray *)getListOfClasses
{
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];
    
    EGODatabaseResult *rows = [db executeQuery:@"SELECT * FROM classes"];
    
    for(EGODatabaseRow* row in rows) {
        //goes through each row
        ClassObj* class = [[ClassObj alloc] init];
        [class setClass_id:[row intForColumn:@"class_id"]];
        [class setClass_name:[row stringForColumn:@"class_name"]]; 
        [retval addObject:class];
        [class release];
	}
    
    return retval; 
}

- (NSArray *)getHomeworkForClass:(int)classID
{
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];
    
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM events WHERE type = 'homework' AND associated_class = %d", classID];
    EGODatabaseResult *rows = [db executeQuery:query];
        
    for(EGODatabaseRow* row in rows) {
        //goes through each row
        EventObj* event = [[EventObj alloc] init];
        [event setEvent_id:[row intForColumn:@"event_id"]];
        [event setEvent_type:[row stringForColumn:@"type"]]; 
        [event setEvent_title:[row stringForColumn:@"title"]];
        [event setEvent_description:[row stringForColumn:@"description"]];
        
        NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [event setEvent_due_date:[df dateFromString:[row stringForColumn:@"due_date"]]];
        [retval addObject:event];
        [event release];
	}

    return retval;
}

- (NSArray *)getProjectsForClass:(int)classID
{
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];
    
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM events WHERE type = 'project' AND associated_class = %d", classID];
    EGODatabaseResult *rows = [db executeQuery:query];
    
    for(EGODatabaseRow* row in rows) {
        //goes through each row
        EventObj* event = [[EventObj alloc] init];
        [event setEvent_id:[row intForColumn:@"event_id"]];
        [event setEvent_type:[row stringForColumn:@"type"]]; 
        [event setEvent_title:[row stringForColumn:@"title"]];
        [event setEvent_description:[row stringForColumn:@"description"]];
        
        NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [event setEvent_due_date:[df dateFromString:[row stringForColumn:@"due_date"]]];
        [retval addObject:event];
        [event release];
	}
    
    return retval;
}

- (NSArray *)getTestsForClass:(int)classID
{
    NSMutableArray *retval = [[[NSMutableArray alloc] init] autorelease];
    
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM events WHERE type = 'test' AND associated_class = %d", classID];
    EGODatabaseResult *rows = [db executeQuery:query];
    
    for(EGODatabaseRow* row in rows) {
        //goes through each row
        EventObj* event = [[EventObj alloc] init];
        [event setEvent_id:[row intForColumn:@"event_id"]];
        [event setEvent_type:[row stringForColumn:@"type"]]; 
        [event setEvent_title:[row stringForColumn:@"title"]];
        [event setEvent_description:[row stringForColumn:@"description"]];
        
        NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [event setEvent_due_date:[df dateFromString:[row stringForColumn:@"due_date"]]];
        [retval addObject:event];
        [event release];
	}
    
    return retval;
}

- (void)addClasstoDatabaseWithClassName:(NSString *)className
{
    NSString *query = [NSString stringWithFormat:@"INSERT INTO classes (class_name) VALUES ('%@')", className];
    
    [db executeUpdate:query];
}

- (void)addEventToDatabaseWithType:(NSString *)type withTitle:(NSString *)title withDescription:(NSString *)description withDate:(NSDate *)date withAssociatedClass:(int)classID
{
    NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *insert_date = [df stringFromDate:date];
    
    NSString *query; 
    
    if (title == nil) 
    {
        title = @"NULL";
        query = [NSString stringWithFormat:@"INSERT INTO events ('type', 'title', 'description', 'due_date', 'associated_class') VALUES ('%@', %@, '%@', '%@', '%d')", type, title, description, insert_date, classID];
    }
    else
    {
        query = [NSString stringWithFormat:@"INSERT INTO events ('type', 'title', 'description', 'due_date', 'associated_class') VALUES ('%@', '%@', '%@', '%@', '%d')", type, title, description, insert_date, classID];
    }
    
    [db executeUpdate:query];
}

- (void)deleteEventFromDatabaseWithEventID:(int)eventID
{
    NSString *query = [NSString stringWithFormat:@"DELETE FROM events WHERE event_id = %d", eventID];
    
    BOOL retval = [db executeUpdate:query]; 
	NSLog(@"retval = %d", retval);
}


- (void)dealloc {
	[db close];
    [db release];
    [super dealloc];
}



@end