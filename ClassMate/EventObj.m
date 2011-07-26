//
//  EventObj.m
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventObj.h"

@implementation EventObj

@synthesize event_id, event_type, event_title, event_description, event_due_date, associated_class;

- (id)init 
{
    return self;
}

- (NSString *)toString
{
    return [NSString stringWithFormat:@"ID: %d, Event Type: %@, Event Description: %@, Date: %@", self.event_id, self.event_type, self.event_description, self.event_due_date];
}


@end
