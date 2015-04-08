//
//  ViewController.m
//  LocalDataStorageDemo
//
//  Created by Prateek Gianchandani on 07/10/13.
//  Copyright (c) 2013 Prateek Gianchandani. All rights reserved.
//

#import "ViewController.h"
#import "PDKeychainBindings.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) IBOutlet UITextField *userDefaultsTextField;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *keychainTextField;

- (IBAction)saveInUserDefaultsTapped:(id)sender;
- (IBAction)saveInPlistFileTapped:(id)sender;
- (IBAction)saveInKeychainTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  [self.scrollView setContentSize:CGSizeMake(320.0, 750.0)];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveInUserDefaultsTapped:(id)sender {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:self.userDefaultsTextField.text forKey:@"DemoValue"];
  [defaults synchronize];
}

- (IBAction)saveInPlistFileTapped:(id)sender {
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *filePath = [documentsDirectory stringByAppendingString:@"/userInfo.plist"];
  NSMutableDictionary* plist = [[NSMutableDictionary alloc] init];
  [plist setValue:self.usernameTextField.text forKey:@"username"];
  [plist setValue:self.passwordTextField.text forKey:@"passwprd"];
  [plist writeToFile:filePath atomically:YES];
}

- (IBAction)saveInKeychainTapped:(id)sender {
  PDKeychainBindings *bindings = [PDKeychainBindings sharedKeychainBindings];
  [bindings setObject:self.keychainTextField.text forKey:@"keychainValue"];
}


@end
