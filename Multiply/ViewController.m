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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//change multiplierLabel.text with UISlider
- (IBAction)vauleChangedSlider:(UISlider *)sender
{
    self.multiplierLabel.text = [NSString stringWithFormat:@"%ld", (NSInteger)sender.value];
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender
{

//retrieve numberTextField.text and convert it to an int
    NSInteger valueNumber = self.numberTextField.text.integerValue;

//retrieve multiplierLabel.text and convert it to an int
    NSInteger valueMultiplier = self.multiplierLabel.text.integerValue;

//Use different method to calculate the value of valueFinal based on the index of Segment
    NSInteger valueFinal = (self.operatorSegmentControl.selectedSegmentIndex == 0) ? valueNumber * valueMultiplier : valueNumber / valueMultiplier;

//assign the value of valueFinal to answerLabel.text
    self.answerLabel.text = [NSString stringWithFormat:@"%ld", valueFinal];

//change view.backgroundColor based on the value of valueFinal
    self.view.backgroundColor = (valueFinal >= 20.0) ? [UIColor greenColor] : [UIColor whiteColor];

//change answerLabel.text based on the value of valueFinal
    BOOL valueIsMultipleOf5 = valueFinal >= 5 && valueFinal % 5 == 0;

    BOOL valueIsMultipleOf3 = valueFinal >= 3 && valueFinal % 3 == 0;

    if (valueIsMultipleOf5 && valueIsMultipleOf3)
    {
        self.answerLabel.text = @"fizzbuzz";
    }
    else
        if (valueIsMultipleOf5)
        {
            self.answerLabel.text = @"buzz";
        }
    else
        if (valueIsMultipleOf3)
        {
            self.answerLabel.text = @"fizz";
        }

//dismiss keyboard of numberTextField
    [self.numberTextField resignFirstResponder];

}

@end
