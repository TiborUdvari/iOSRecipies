//
//  ViewController.m
//  PersitanceNSUserDefaults
//
//  Created by Tibor Udvari on 6/3/13.
//  Copyright (c) 2013 Tibor Udvari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstNameTextField.delegate = self;
    self.lastNameTextField.delegate = self;
    
    [self loadPersistantData:self];
    
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savePersistentData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void) savePersistentData: (id) sender
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    // Set Object/ Value to persist
    [userDefaults setObject:self.firstNameTextField.text forKey:@"firstName"];
    [userDefaults setObject:self.lastNameTextField forKey:@"lastName"];
    [userDefaults setBool:self.activitySwitch.on forKey:@"activityOn"];
    
    // Save changes
    [userDefaults synchronize];
}

-(void) loadPersistantData : (id) sender
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];

    self.firstNameTextField.text = [userDefaults objectForKey:@"firstName"];
    self.lastNameTextField.text = [userDefaults objectForKey:@"lastName"];
    self.activitySwitch.on = [userDefaults boolForKey:@"activityOn"];
    
    if (self.activitySwitch.on)
    {
        [self.activityIndicator startAnimating];
    }
    
}

-(void) toggleActivity:(id)sender
{
    if (self.activitySwitch.on)
    {
        [self.activityIndicator startAnimating];
    }
    else
    {
        [self.activityIndicator stopAnimating];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
