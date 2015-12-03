//
//  ViewController.h
//  Band
//
//  Created by elliott chavis on 12/2/15.
//  Copyright (c) 2015 elliott chavis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCBand.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UITextFieldDelegate, UIActionSheetDelegate>

@property (nonatomic, strong) ABCBand *bandObject;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextView *notesTextView;
@property (nonatomic, weak) IBOutlet UIButton *saveNotesButton;
@property (nonatomic, weak) IBOutlet UIStepper *ratingsStepper;
@property (nonatomic, weak) IBOutlet UILabel *ratingValueLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *touringStatusSegmentedControl;
@property (nonatomic, weak) IBOutlet UISwitch *haveSeenLiveSwitch;

- (IBAction)saveNotesButtonTouched:(id)sender;
- (IBAction)ratingStepperValueChanged:(id)sender;
- (IBAction)tourStatusSegmentedControlValueChanged:(id)sender;
- (IBAction)haveSeenLiveSwitchValueChanged:(id)sender;
- (IBAction)deleteButtonTouched:(id)sender;

- (void)saveBandObject;
- (void)loadBandObject;
- (void)setUserInterfaceValues;
@end

