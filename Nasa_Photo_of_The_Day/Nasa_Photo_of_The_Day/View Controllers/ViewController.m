//
//  ViewController.m
//  Nasa_Photo_of_The_Day
//
//  Created by Kenny on 6/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *checkItOutButton;

@end

@implementation ViewController

// MARK: - View Lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    _checkItOutButton.layer.cornerRadius = _checkItOutButton.frame.size.height / 2;
}

// MARK: - Dev -
- (IBAction)checkItOutButtonTapped:(id)sender {
    NSLog(@"%@", _checkItOutButton.currentTitle);
}


@end
