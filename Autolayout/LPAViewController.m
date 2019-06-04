//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint1;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint1;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint2;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint2;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint3;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint3;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [framingView addSubview:purpleBox];
    
    
    UIView *redBox = [[UIView alloc]initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [framingView addSubview:redBox];
    
    UIView *orangeBox1 = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [redBox addSubview:orangeBox1];
    
    UIView *orangeBox2 = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [redBox addSubview:orangeBox2];
    
    UIView *blueBox1 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox1];
    
    UIView *blueBox2 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox2];
    
    UIView *blueBox3 = [[UIView alloc]initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [framingView addSubview:blueBox3];
    
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                                    options:NSLayoutFormatAlignAllCenterY
                                                                                    metrics:nil
                                                                                      views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                   multiplier:1.0
                                                                                     constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:500.0];
    self.framingViewWidthConstraint.active = YES;
    
    //PURPLE BOX START
    [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRightMargin multiplier:1 constant:-20.0].active =YES;
    
    
    [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeBottomMargin relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:-20.0].active =YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:0.61 constant:1.0].active = YES;
    
    //RED BOX START
    [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeRightMargin relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRightMargin multiplier:1 constant:-20.0].active =YES;
    
    
    [NSLayoutConstraint constraintWithItem:redBox attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:20.0].active =YES;
    
    
    //ORANGE BOXES
    //1
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[orangeBox1(==70)]-10-[orangeBox2(==30)]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(orangeBox1,orangeBox2)]];


    [NSLayoutConstraint activateConstraints:  [NSLayoutConstraint
                                               constraintsWithVisualFormat:@"V:|-[orangeBox1(==30)]-|"
                                               options:0
                                               metrics:nil
                                               views:NSDictionaryOfVariableBindings(orangeBox1)]];
    
    [NSLayoutConstraint activateConstraints:  [NSLayoutConstraint
                                               constraintsWithVisualFormat:@"V:|-[orangeBox2(==30)]-|"
                                               options:0
                                               metrics:nil
                                               views:NSDictionaryOfVariableBindings(orangeBox2)]];

    for(int i = 1; i < 4; i++) {
        
        UIView *blueBox1 = [[UIView alloc]initWithFrame:CGRectZero];
        blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
        blueBox1.backgroundColor = [UIColor blueColor];
        [framingView addSubview:blueBox1];
      
        
        [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:1.0].active =YES;


        [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:(i * 0.5) constant:0.0].active =YES;
        
        [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:blueBox1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50.0].active = YES;
        
        
    }
    
    
    
    


    
    
    
    
    
    // Set up your views and constraints here
    
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
