//
//  HaliciogluViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface HaliciogluViewController : ViewController{
    
    IBOutlet UILabel *haliciogluSantral;
    
    
    NSTimer *timerd;
    NSString *d;
    
    
    
    
}
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;



@end
