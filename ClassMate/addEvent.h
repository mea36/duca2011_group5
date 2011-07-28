//
//  addEvent.h
//  ClassMate
//
//  Created by Daniel Gorziglia on 7/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addEvent : UIViewController <UIActionSheetDelegate> {
    NSString *event_type;
    IBOutlet UITextField *titleField; 
    IBOutlet UITextField *descriptionField;
    IBOutlet UITextField *dueDateField; 
    IBOutlet UISegmentedControl *eventSegmentedControl; 
    UIDatePicker *dueDatePicker;
    int associatedClass;
}

@property (nonatomic, retain) NSString *event_type;
@property (nonatomic, retain) IBOutlet UITextField *titleField;
@property (nonatomic, retain) IBOutlet UITextField *descriptionFIeld;
@property (nonatomic, retain) IBOutlet UITextField *dueDateField; 
@property (nonatomic, retain) IBOutlet UISegmentedControl *eventSegmentedControl; 
@property (nonatomic, retain) UIDatePicker *dueDatePicker; 
@property (nonatomic) int associatedClass;

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex; 
- (void)dismissView;
- (IBAction)segmentedControlIndexChanged; 
- (IBAction)addEventToClass:(id)sender;

@end
