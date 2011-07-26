//
//  EventObj.h
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EgoDb.h"

@interface EventObj : NSObject {
    int event_id;
    NSString *event_type;
    NSString *event_title;
    NSString *event_description;
    NSDate *event_due_date;
    int associated_class;
}

@property (nonatomic) int event_id;
@property (nonatomic, retain) NSString *event_type; 
@property (nonatomic, retain) NSString *event_title;
@property (nonatomic, retain) NSString *event_description;
@property (nonatomic, retain) NSDate *event_due_date;
@property (nonatomic) int associated_class; 

- (id)init; 
- (NSString*)toString;

@end