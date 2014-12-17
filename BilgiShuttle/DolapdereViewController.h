//
//  DolapdereViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface DolapdereViewController : ViewController{
    
    IBOutlet UILabel *dolapdereSantral;
    IBOutlet UILabel *dolapdereKabatas;
    IBOutlet UILabel *dolapdereKustepe;
    IBOutlet UILabel *dolapderePangalti;
    IBOutlet UILabel *dolapdereTophane;
    id delegate;
    NSTimer *timera;
    NSString *a;
    
    
    
    
}
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;
    -(IBAction)back:(id)sender;


@end
