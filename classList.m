//
//  classList.m
//  ClassMate
//
//  Created by CS Admin on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "classList.h"
#import "classView.h"
#import "EgoDb.h"
#import "ClassObj.h"
#import "addClass.h"

#define CLASS 0

@implementation classList

@synthesize classViewController;
@synthesize classes;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Classes";
	
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
																	style:UIBarButtonSystemItemDone target:self action:@selector(addClassList:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	
	
	[rightButton release];
	
	
	//NSArray *classes = [[EgoDb database] getListOfClasses];
	//self.classes = [[NSMutableArray alloc] initWithObjects:nil];
	
	/*for(id class in classes) {
		[self.classes addObject:[class class_name]];
		classView *view = [[[classView alloc] initWithNibName:@"classList" bundle:nil] autorelease];
		
		
		
	}*/
			//classView *viewController = [[classView alloc] initWithNibName:@"classList" bundle:[NSBundle mainBundle]];
	
	/*if(self.classViewController == nil)
	{
		classView *viewController = [[classView alloc] initWithNibName:@"classList" bundle:[NSBundle mainBundle]];
		self.classViewController = viewController;
		[viewController release];
	}
	
	[viewController release];
	[self.navigationController pushViewController:self.classViewController animated:YES];*/
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	self.classes = [[EgoDb database] getListOfClasses];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.classes count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	[cell setText:[[self.classes objectAtIndex:indexPath.row]class_name]];
	
	return cell;
    // Configure the cell...
}

-(void)addClassList:(id)sender {
	addClass *addClassView = [[[addClass alloc] init] autorelease];
    [addClassView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve]; 
	[self presentModalViewController:addClassView animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
	

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	
	
	

	classView *viewController = [[classView alloc] initWithNibName:@"classList" bundle:[NSBundle mainBundle]];


	viewController.classID = [[self.classes objectAtIndex:indexPath.row] class_id];
	viewController.className = [[self.classes objectAtIndex:indexPath.row] class_name];
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];	
	
	return;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	
	[classes release];
    [super dealloc];
}

@end
