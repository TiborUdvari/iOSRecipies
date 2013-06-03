//
//  ViewController.h
//  PersistanceWithFile
//
//  Created by Tibor Udvari on 6/3/13.
//  Copyright (c) 2013 Tibor Udvari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fileNameTextField;

@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

- (IBAction)saveContent:(id)sender;
- (IBAction)loadContent:(id)sender;
- (IBAction)clearContent:(id)sender;

@end
