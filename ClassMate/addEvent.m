//
//  addEvent.m
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "addEvent.h"
#import "EgoDb.h"

@implementation addEvent

@synthesize event_type, titleField, descriptionFIeld, dueDateField, eventSegmentedControl, dueDatePicker, associatedClass;  

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)addEventToClass:(id)sender
{
    [[EgoDb database] addEventToDatabaseWithType:self.event_type withTitle:titleField.text withDescription:descriptionFIeld.text withDate:dueDateField.text withAssociatedClass:self.associatedClass]; 
    
    [self dismissView]; 
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField 
{
    [theTextField resignFirstResponder];
    return YES;
}

- (void)showPicker:(id)sender {
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"Enter Due Date"
                                                      delegate:self
                                             cancelButtonTitle:@"Done"
                                        destructiveButtonTitle:@"Cancel"
                                             otherButtonTitles:nil];
    
    [menu addSubview:self.dueDatePicker];
    [menu showInView:self.view];
    [menu setBounds:CGRectMake(0,0,320, 625)];
    
    [menu release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"clicked cancel");
    }
    
    if (buttonIndex == 1) {
        NSLog(@"I picked due date %@", [self.dueDatePicker date]);
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        dueDateField.text = [dateFormat stringFromDate:[self.dueDatePicker date]];
        [dateFormat release];
        [dueDateField resignFirstResponder]; 
    }
}

- (IBAction)segmentedControlIndexChanged
{
    switch (eventSegmentedControl.selectedSegmentIndex) {
        case 0:
            self.event_type = @"homework";
            break;
        case 1:
            self.event_type = @"test";
            break;
        case 2:
            self.event_type = @"project";
            break;
            
        default:
            break;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField 
{
    if (textField == dueDateField) {
        [self showPicker:textField];
    }
}

- (void)dismissView
{
	[[self navigationController] popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    self.title = @"Add Event";
    self.dueDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,185,0,0)];
    self.dueDatePicker.datePickerMode = UIDatePickerModeDate; 
        
    NSDate *current_date = [NSDate date]; 
    self.dueDatePicker.minimumDate = current_date; 
    
    self.event_type = @"homework";

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissView)]; 
    self.navigationItem.leftBarButtonItem = cancelButton; 
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [event_type release];
    [titleField release];
    [descriptionFIeld release];
    [eventSegmentedControl release];
    [dueDateField release]; 
    [dueDatePicker release]; 
    [super dealloc];
}

@end
