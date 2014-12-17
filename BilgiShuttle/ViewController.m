//
//  ViewController.m
//  BilgiShuttle
//
//  Created by Sami Sen on 11/27/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear
{

    [super viewDidAppear:YES];
   


}
-(IBAction)back:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}



@end
