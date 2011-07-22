//
//  EgoDb.m
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EgoDb.h"
#import "ClassObj.h"

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

- (void)dealloc {
	[db close];
    [db release];
    [super dealloc];
}

@end