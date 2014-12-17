//
//  KabatasViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface KabatasViewController : ViewController{
    IBOutlet UILabel *kabatasSantral;
    IBOutlet UILabel *kabatasDolapdere;
    
    NSTimer *timery;
    NSString *y;
    
    
    
    
}
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;




@end
