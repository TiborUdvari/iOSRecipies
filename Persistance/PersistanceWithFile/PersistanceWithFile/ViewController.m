//
//  ViewController.m
//  PersistanceWithFile
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
    self.fileNameTextField.delegate = self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (NSString* ) currentContentFIlePath
{
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:self.fileNameTextField.text];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) saveContentToFile : (NSString*) filePath
{
    NSString* content = self.contentTextView.text;
    
    NSError* error;
    
    BOOL success = [content writeToFile:filePath atomically:YES encoding:NSUnicodeStringEncoding error:&error];
    
    if(!success)
    {
        NSLog(@"Error has occured saving to file : %@", error);
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        // User tapped yes buttonm OK to overwrite file
        NSString* filePath = self.fileNameTextField.text;
        [self saveContentToFile:filePath];
    }
}

- (IBAction)saveContent:(id)sender {
    
    NSString* filePath = [self currentContentFIlePath];

    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:filePath])
    {
        UIAlertView* overwriteAlert = [[UIAlertView alloc] initWithTitle:@"File exists" message:@"Do you want to replace the file ?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [overwriteAlert show];
    }
    else
    {
        [self saveContentToFile:filePath];
    }
 
}

- (IBAction)loadContent:(id)sender
{
    NSString* filePath = [self currentContentFIlePath];
    
    NSError* error;
    
    NSString* content = [NSString stringWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:&error];
    
    if (error)
    {
        NSLog(@"Unable to load the file");
    }
    
    self.contentTextView.text = content;

}

- (IBAction)clearContent:(id)sender
{
    self.contentTextView.text = nil;
    
    
}
@end
