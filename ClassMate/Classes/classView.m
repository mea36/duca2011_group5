//
//  classView.m
//  ClassMate
//
//  Created by CS Admin on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "classView.h"
#import "EgoDb.h"
#import "EventObj.h"
#import "DescriptionView.h"
#import "addEvent.h"

#define HOMEWORKS 0
#define PROJECTS 1
#define TEST_SECTION 2

@implementation classView

@synthesize homework, tests, projects;
@synthesize descriptionViewController;
@synthesize classID;
@synthesize className;
#pragma mark -
#pragma mark View lifecycle

- (void)loadAddEvent:(id)sender {
	addEvent *addEventView = [[[addEvent alloc] init] autorelease];
    addEventView.associatedClass = classID;
    [self.navigationController pushViewController:addEventView animated:YES];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = className;
	
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
												style:UIBarButtonItemStylePlain target:self action:@selector(loadAddEvent:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	
	[rightButton release];

}


- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
	self.homework = [[EgoDb database] getHomeworkForClass:self.classID];
	self.tests = [[EgoDb database] getTestsForClass:self.classID];
	self.projects = [[EgoDb database] getProjectsForClass:self.classID];
    [(UITableView* )self.view reloadData];

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
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    // Return the number of rows in the section.
    if (section == HOMEWORKS) {
		return [self.homework count];
	}else if (section == PROJECTS) {
		return [self.projects count];
	}else if (section == TEST_SECTION){
		return [self.tests count]; 
	}
	return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	//HAVE AN IF STATEMENT CHECKING THE SECTION AND FILLING IN WITH THE CORRECT ARRAY ACCORDINGLY
    //[cell setText:@"stuff"];
	
	if (indexPath.section == HOMEWORKS) {
		//[cell setText:[[self.homework  objectAtIndex:indexPath.row] event_description]];
		cell.textLabel.text = [[self.homework  objectAtIndex:indexPath.row] event_description];
		
	}
	else if (indexPath.section == TEST_SECTION){
		cell.textLabel.text = [[self.tests  objectAtIndex:indexPath.row] event_title];
		cell.detailTextLabel.text = [[self.tests  objectAtIndex:indexPath.row] event_description];
	}
	else {
		cell.textLabel.text = [[self.projects  objectAtIndex:indexPath.row] event_title];
		cell.detailTextLabel.text = [[self.projects objectAtIndex:indexPath.row] event_description];
	}
	
    
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
	self.descriptionViewController = [[DescriptionView alloc] initWithNibName:@"DescriptionView" bundle:[NSBundle mainBundle]];
	
	if (indexPath.section == HOMEWORKS) {
		descriptionViewController.eventDescription = [[self.homework objectAtIndex:indexPath.row] event_description];
		descriptionViewController.eventDueDate = [[self.homework objectAtIndex:indexPath.row] event_due_date];
		descriptionViewController.eventTitle = [[self.homework objectAtIndex:indexPath.row] event_description];
	}
	else if (indexPath.section == TEST_SECTION) {
		descriptionViewController.eventDescription = [[self.tests objectAtIndex:indexPath.row] event_description];
		descriptionViewController.eventDueDate = [[self.tests objectAtIndex:indexPath.row] event_due_date];
		descriptionViewController.eventTitle = [[self.tests objectAtIndex:indexPath.row] event_title];
	}
	else {
		descriptionViewController.eventDescription = [[self.projects objectAtIndex:indexPath.row] event_description];
		descriptionViewController.eventDueDate = [[self.projects objectAtIndex:indexPath.row] event_due_date];
		descriptionViewController.eventTitle = [[self.projects objectAtIndex:indexPath.row] event_title];
	}

	
	
	
	[self.navigationController pushViewController:self.descriptionViewController animated:YES];
	//[viewController release];
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
	[tests release];
	[projects release];
	[homework release];
    [super dealloc];
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(section == HOMEWORKS)
		if ([self.homework count] == 0) 
		{
			return NULL;
		}
		else 
		{
		return @"Homework";
		}
		
	else if (section == TEST_SECTION)
	{
		if ([self.tests count] == 0) 
		{
			return NULL;
		}
		else 
		{
			return @"Tests";
		}
	}
	else 
	{
		if ([self.projects count] == 0) 
		{
			return NULL;
		}
		else 
		{
			return @"Projects";
		}
	}
}


//THIS PART IS USED TO DELETE HOMEWORK WHEN IT IS DONE
//CHECK HERE BECAUSE MELISSA WILL WANT TO SEE IT.
- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	int event;
	if(editingStyle == UITableViewCellEditingStyleDelete) {
		
		if (indexPath.section == HOMEWORKS) {
			event = [[self.homework objectAtIndex:indexPath.row] event_id];
			[self.homework removeObjectAtIndex:indexPath.row];
		}
		else if (indexPath.section == TEST_SECTION)
		{
			event = [[self.tests objectAtIndex:indexPath.row] event_id];
			[self.tests removeObjectAtIndex:indexPath.row];
		}
		else {
			event = [[self.projects objectAtIndex:indexPath.row] event_id];
			[self.projects removeObjectAtIndex:indexPath.row];
		}
		//SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
		[[EgoDb database] deleteEventFromDatabaseWithEventID:event];
		
		//[tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		[tv reloadData];
		

		
	}
}
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}
@end

