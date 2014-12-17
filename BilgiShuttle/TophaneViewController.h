//
//  TophaneViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface TophaneViewController : ViewController{
    
    IBOutlet UILabel *tophaneSantral;
    IBOutlet UILabel *tophaneDolapdere;
    IBOutlet UILabel *tophaneKustepe;
    
    
    NSTimer *timere;
    NSString *e;
    
    
    
    
}
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;


@end
