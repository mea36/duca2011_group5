//
//  C.m
//  GitIntro
//
//  Created by CS Admin on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "A.h"
#import "B.h"
#import "C.h"
#import "D.h"


@implementation C

- (IBAction) gotoA
{
    A *aView = [[A alloc] initWithNibName:@"A" bundle:nil];
    [self.navigationController pushViewController:aView animated:YES];
    [aView release];
}

- (IBAction) gotoB
{
    B *bView = [[B alloc] initWithNibName:@"B" bundle:nil];
    [self.navigationController pushViewController:bView animated:YES];
    [bView release];
}

- (IBAction) gotoD
{
    D *dView = [[D alloc] initWithNibName:@"D" bundle:nil];
    [self.navigationController pushViewController:dView animated:YES];
    [dView release];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
