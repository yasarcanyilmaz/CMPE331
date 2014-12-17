//
//  PangaltiViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface PangaltiViewController : ViewController{
    
    IBOutlet UILabel *pangaltiDolapdere;
    
    
    NSTimer *timerc;
    NSString *c;
    
    
    
    
}
-(void) updateClock: (NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;



@end
