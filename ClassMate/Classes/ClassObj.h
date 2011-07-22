//
//  ClassesObj.h
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// danny needs function to retreive all the events with an associated class
// Alex needs a cretae a event class
// tom needs the lsit of classes and their associated ID's

#import <Foundation/Foundation.h>
#import "EgoDb.h"


@interface ClassObj : NSObject {
    int class_id;
    NSString *class_name;
}

@property (nonatomic) int class_id;
@property (nonatomic, retain) NSString *class_name; 

- (id)init; 
- (NSString*)toString;

@end
