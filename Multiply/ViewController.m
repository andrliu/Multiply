//
//  ViewController.m
//  Multiply
//
//  Created by Andrew Liu on 10/20/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property (nonatomic) int valueFinal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//change multiplierLabel.text with UISlider
- (IBAction)vauleChangedSlider:(UISlider *)sender {
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", (int)sender.value];
}

- (IBAction)onCalculateButtonPressed:(id)sender {

//retrieve numberTextField.text and convert it to an int
    NSString *stringNumber = self.numberTextField.text;
    int valueNumber = [stringNumber intValue];

//retrieve multiplierLabel.text and convert it to an int
    NSString *stringMultiplier = self.multiplierLabel.text;
    int valueMultiplier = [stringMultiplier intValue];

//Use different method to calculate the value of valueFinal based on the index of Segment
    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        self.valueFinal = valueNumber * valueMultiplier;
    }
    else if (self.operatorSegmentControl.selectedSegmentIndex == 1){
        self.valueFinal = valueNumber / valueMultiplier;
    }

//assign the value of valueFinal to answerLabel.text
    NSString *stringFinal = [NSString stringWithFormat:@"%i", (int)self.valueFinal];
    self.answerLabel.text = stringFinal;

//change view.backgroundColor based on the value of valueFinal
    if(self.valueFinal >= 20){
        self.view.backgroundColor = [UIColor greenColor];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

//change answerLabel.text based on the value of valueFinal
    if (self.valueFinal % 3 == 0 && self.valueFinal % 5 == 0) {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if (self.valueFinal % 5 == 0) {
        self.answerLabel.text = @"buzz";
    }
    else if (self.valueFinal % 3 == 0) {
        self.answerLabel.text = @"fizz";
    }
    else {
        self.answerLabel.text = stringFinal;
    }

//dismiss keyboard of numberTextField
    [self.numberTextField resignFirstResponder];
}

@end
