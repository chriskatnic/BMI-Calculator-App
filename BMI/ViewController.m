//
//  ViewController.m
//  BMI
//
//  Created by Christopher Katnic on 2/10/15.
//  Copyright (c) 2015 Christopher Katnic. All rights reserved.
//  TESTS:    68 inches, 90, 110, 120, 150, 180, 210, 250, 300

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *totalBMILabel;
@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UISwitch *convertSwitch;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UIImageView *fatnessRepresentation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchMeasurementType:(id)sender {

    
    if([_convertSwitch isOn])
    {
        [_heightLabel setText:@"in"];
        [_weightLabel setText:@"lbs"];
        float height = [[_height text] floatValue];
        float weight = [[_weight text] floatValue];
        
        height *= .3937008;
        weight *= 2.2046;
        
        NSString* heightTotal = [ NSString stringWithFormat:@"%.02f", height];
        NSString* weightTotal = [ NSString stringWithFormat:@"%.02f", weight];
        
        [_height setText:heightTotal];
        [_weight setText:weightTotal];
    }
    else
    {
        [_heightLabel setText:@"cm"];
        [_weightLabel setText:@"kg"];
        float height = [[_height text] floatValue];
        float weight = [[_weight text] floatValue];
        
        height *= 2.54;
        weight /= 2.2046;
        NSString* heightTotal = [ NSString stringWithFormat:@"%.02f", height];
        NSString* weightTotal = [ NSString stringWithFormat:@"%.02f", weight];
        
        [_height setText:heightTotal];
        [_weight setText:weightTotal];

    }
}

void getMessage(UILabel *_totalBMILabel, float bmi, UIImageView *_fatnessRepresentation) {
    if (bmi < 16.00)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Severe Thinness.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"SevereThinness.png"]];
    }
    
    else if (bmi < 16.99)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Moderate Thinness.", bmi];
        [_totalBMILabel setText:displaymessage];
         [_fatnessRepresentation setImage:[UIImage imageNamed:@"ModerateThinness.png"]];
    }
    else if (bmi < 18.49)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Mild Thinness.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"MildThinness.png"]];
    }
    else if(bmi < 24.99)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Normal Weight.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"Normal.png"]];
        
    }
    else if(bmi < 29.99)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Overweight.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"Overweight.png"]];
    }
    else if (bmi < 34.99)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Obese Class I.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"ObeseI.png"]];
    }
    else if (bmi < 39.99)
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Obese Class II.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"ObeseII.png"]];
    }
    
    else
    {
        NSString* displaymessage = [NSString stringWithFormat:@"Your BMI is: %.02f\nCategory: Obese Class III. See a doctor.", bmi];
        [_totalBMILabel setText:displaymessage];
        [_fatnessRepresentation setImage:[UIImage imageNamed:@"ObeseIII.png"]];
    }
}

- (IBAction)calculateBMI:(id)sender {
    
    
    
    if([_convertSwitch isOn])  //king's system
    {
        
        float height = [[_height text] floatValue];
        float weight = [[_weight text] floatValue];
        
        float bmi = (weight/(height * height)) * 703;
        
        getMessage(_totalBMILabel, bmi, _fatnessRepresentation);
           }
    
    
    
    
    if(![_convertSwitch isOn]) //logical system
    {
        
        float height = [[_height text] floatValue];
        float weight = [[_weight text] floatValue];
        float bmi = weight/((height / 100) * (height / 100) );
        
        
        
        
        getMessage(_totalBMILabel, bmi, _fatnessRepresentation);
        
    }
    
    
    //if the switch is on, do english
    
    //if off, do metric
}
@end
