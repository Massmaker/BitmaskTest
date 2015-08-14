//
//  ViewController.m
//  EnumBitmask
//
//  Created by CloudCraft on 13.08.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "ViewController.h"

typedef NS_OPTIONS(NSInteger, ElementOptions)
{
    ElementOptionsNone = 0,
    ElementOptionsIdea = (1 << 1),
    ElementOptionsDone = (1 << 2),
    ElementOptionsDecision = (1 << 3),
    ElementOptionsReservedValue1 = (1 << 4)
};


@interface ViewController ()
@property (nonatomic, assign) NSInteger currentMask;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.currentMask = ElementOptionsNone;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateButtonColors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) buttonTapped:(UIButton *)button
{
    [self switchByButton:button];
    [self updateButtonColors];
}

-(void) switchByButton:(UIButton *)button
{
    NSInteger buttonTag = button.tag;
    
    switch (buttonTag) {
        case 1:
            if (self.currentMask & ElementOptionsIdea)
            {
                self.currentMask  = self.currentMask & ~ElementOptionsIdea;
            }
            else
            {
                self.currentMask = self.currentMask | ElementOptionsIdea;
            }
            break;
        case 2:
        {
            if (self.currentMask & ElementOptionsDone)
            {
                self.currentMask = self.currentMask & ~ElementOptionsDone;
            }
            else
            {
                self.currentMask = self.currentMask | ElementOptionsDone;
            }
        }
            break;
        case 3:
        {
            if (self.currentMask & ElementOptionsDecision)
            {
                self.currentMask = self.currentMask & ~ElementOptionsDecision;
            }
            else
            {
                self.currentMask = self.currentMask | ElementOptionsDecision;
            }
        }
            break;
        case 4:
        {
            
            if (self.currentMask & ElementOptionsReservedValue1)
            {
                self.currentMask = self.currentMask & ~ElementOptionsReservedValue1;
            }
            else
            {
                self.currentMask = self.currentMask | ElementOptionsReservedValue1;
            }
        }
            break;
        default:
            break;
    }
    NSLog(@"Current Mask: \nReal value: %ld \nBitmaskValue:%@", (long)self.currentMask, binaryStringFromInteger(self.currentMask));
    
}

-(void) updateButtonColors
{
    UIButton *firstButton = (UIButton *)[self.view viewWithTag:1];
    UIButton *secondButton = (UIButton *)[self.view viewWithTag:2];
    UIButton *thirdButton = (UIButton *)[self.view viewWithTag:3];
    UIButton *fourthButton = (UIButton *)[self.view viewWithTag:4];
    
    UIColor *activeColor = [UIColor greenColor];
    UIColor *inactiveColor = [UIColor grayColor];
    
    firstButton.backgroundColor = ((self.currentMask & ElementOptionsIdea) == ElementOptionsIdea) ? activeColor : inactiveColor;
    secondButton.backgroundColor = ((self.currentMask & ElementOptionsDone) == ElementOptionsDone) ? activeColor : inactiveColor;
    thirdButton.backgroundColor = ((self.currentMask & ElementOptionsDecision) == ElementOptionsDecision)? activeColor : inactiveColor;
    fourthButton.backgroundColor = ((self.currentMask & ElementOptionsReservedValue1) == ElementOptionsReservedValue1) ? activeColor : inactiveColor;
}

NSString * binaryStringFromInteger( NSInteger number )
{
    NSMutableString * string = [[NSMutableString alloc] init];
    
    NSInteger spacing = pow( 2, 3 );
    NSInteger width = ( sizeof( number ) ) * spacing;
    NSInteger binaryDigit = 0;
    NSInteger integer = number;
    
    while( binaryDigit < width )
    {
        binaryDigit++;
        
        [string insertString:( (integer & 1) ? @"1" : @"0" )atIndex:0];
        
        if( binaryDigit % spacing == 0 && binaryDigit != width )
        {
            [string insertString:@" " atIndex:0];
        }
        
        integer = integer >> 1;
    }
    
    return string;
}



@end
