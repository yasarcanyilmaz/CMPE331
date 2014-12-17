//
//  KustepeViewController.h
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "ViewController.h"

@interface KustepeViewController : ViewController{
    
    IBOutlet UILabel *kustepeMecidiyekoy;
    IBOutlet UILabel *kustepeDolapdere;
    IBOutlet UILabel *kustepeTophane;
    IBOutlet UILabel *kustepeSantral;
    
    NSTimer *timerz;
    NSString *z;
    
    
    
    
}
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label;


@end
