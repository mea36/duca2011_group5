//
//  addClass.h
//  ClassMate
//
//  Created by CS Admin on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EgoDb.h"
#import "ClassObj.h"



@interface addClass : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
	
	IBOutlet UIPickerView *pickerView;
	IBOutlet UIBarButtonItem *cancel;
	NSArray *courses;

}

@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancel; 
@property (nonatomic, retain) NSArray *courses;

- (IBAction)dismissView; 

@end
