//
//  ViewController.m
//  TestAlertController
//
//  Created by tomfriwel on 12/05/2017.
//  Copyright © 2017 tomfriwel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *myTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlert:(id)sender {
    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:@"title" message:@"pass the value in alertcontroller" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *myAlertControllerOKAction = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
    
    __weak typeof(self) weakSelf = self;
    
    [myAlertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.text = [weakSelf.myTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSLog(@"weak self:%@", weakSelf);
    }];
    [myAlertController addAction: myAlertControllerOKAction];
    
    [self presentViewController:myAlertController animated:YES completion:nil];
}



@end
