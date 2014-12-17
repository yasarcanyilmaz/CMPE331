//
//  SantralViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/27/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface SantralViewController : ViewController{
    
    
    IBOutlet UILabel *santralKabatas;
    IBOutlet UILabel *santralKustepe;
    IBOutlet UILabel *santralDolapdere;
    IBOutlet UILabel *santralHalicioglu;
    IBOutlet UILabel *santralTophane;
    
    NSTimer *timerw;
    //NSString *x;
    
    
    
    
}
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;



@end
