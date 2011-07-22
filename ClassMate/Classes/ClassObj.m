//
//  ClassesObj.m
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ClassObj.h"


@implementation ClassObj

@synthesize class_id, class_name;

- (id)init 
{
    return self;
}

- (NSString *)toString
{
    return [NSString stringWithFormat:@"ID: %d, Classname: %@", self.class_id, self.class_name];
}

@end
