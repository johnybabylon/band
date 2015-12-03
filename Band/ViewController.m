//
//  ViewController.m
//  Band
//
//  Created by elliott chavis on 12/2/15.
//  Copyright (c) 2015 elliott chavis. All rights reserved.
//

#import "ABCBandDetailsViewController.h"
#import "ABCBand.h"

static NSString *bandObjectKey = @"BABandObjectKey";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Title is %@", self.titleLabel.text);
    
    [self loadBandObject];
    
    if(!self.bandObject)
        self.bandObject = [[ABCBand alloc]init];
    [self setUserInterfaceValues];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveBandObject
{
    NSData *bandObjectData = [NSKeyedArchiver archivedDataWithRootObject:self.bandObject];
    [[NSUserDefaults standardUserDefaults] setObject:bandObjectData forKey:bandObjectKey];
    
}

- (void)loadBandObject
{
    NSData *bandObjectData = [[NSUserDefaults standardUserDefaults]objectForKey:bandObjectKey];
    
    if(bandObjectData)
        self.bandObject = [NSKeyedUnarchiver unarchiveObjectWithData:bandObjectData];

}

- (void)setUserInterfaceValues
{
    self.nameTextField.text = self.bandObject.name;
    self.notesTextView.text = self.bandObject.notes;
    self.ratingsStepper.value = self.bandObject.rating;
    self.ratingValueLabel.text = [NSString stringWithFormat:@"%g", self.ratingsStepper.value];
    self.touringStatusSegmentedControl.selectedSegmentIndex = self.bandObject.touringStatus;
    self.haveSeenLiveSwitch.on = self.bandObject.haveSeenLive;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.bandObject.name = self.nameTextField.text;
    [self saveBandObject];
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.saveNotesButton.enabled = YES;
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    self.bandObject.notes = self.notesTextView.text;
    [self saveBandObject];
    [self.notesTextView resignFirstResponder];
    self.saveNotesButton.enabled = NO;
    return YES;
}


- (IBAction)saveNotesButtonTouched:(id)sender
{
    [self textViewShouldEndEditing:self.notesTextView];
}

- (IBAction)ratingStepperValueChanged:(id)sender
{
    self.ratingValueLabel.text = [NSString stringWithFormat:@"%g", self.ratingsStepper.value];
    self.bandObject.rating = (int)self.ratingsStepper.value;
    [self saveBandObject];
}


- (IBAction)tourStatusSegmentedControlValueChanged:(id)sender
{
    self.bandObject.touringStatus = self.touringStatusSegmentedControl.selectedSegmentIndex;
    [self saveBandObject];
}

- (IBAction)haveSeenLiveSwitchValueChanged:(id)sender
{
    self.bandObject.haveSeenLive = self.haveSeenLiveSwitch.on;
    [self saveBandObject];
}

- (IBAction)deleteButtonTouched:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"Delete Draft"
                              style:UIAlertActionStyleDestructive
                            handler:^(UIAlertAction *action) {
                                
                                self.bandObject = nil;
                                [self setUserInterfaceValues];
                                
                                [[NSUserDefaults standardUserDefaults] setObject:nil forKey:bandObjectKey];
                                NSLog(@"delete draft...");
                            }]];
    [alertController addAction:
     [UIAlertAction actionWithTitle:@"Cancel"
                              style:UIAlertActionStyleCancel
                            handler:^(UIAlertAction *action) {
                                NSLog(@"cancel cancellation...");
                            }]];
    
    [self presentViewController:alertController
                                  animated:YES
                                completion:NULL];
}








@end
