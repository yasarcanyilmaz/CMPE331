//
//  TophaneViewController.m
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "TophaneViewController.h"

@interface TophaneViewController ()

@end

@implementation TophaneViewController

-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label {
    
    
    NSDateFormatter *formatter = [NSDateFormatter new]; //formatter yaratıldı
    [formatter setDateFormat:@"HH"];//format 24saatlik Saat kısmı
    NSString *saat = [formatter stringFromDate:[NSDate date]]; //current date to current hour
    [formatter setDateFormat:@"mm"];//format 60dakikalık dakika kısmı olarak değiştirildi
    NSString *dakika =[formatter stringFromDate:[NSDate date]];//current date to current minutes
    int saatint=[saat intValue];//hours in int
    int dakikaint=[dakika intValue];//minutes in int
    
    int shuttlehour=0;
    int shuttleminutes=0;
    BOOL x=false;
    for(int i=0;i<[shuttlehours count];i++)
    {
        int hesap=([shuttlehours[i] intValue]-saatint)*60;
        hesap+=[shuttleminutess[i] intValue]-dakikaint;
        if(hesap>0){
            shuttlehour=[shuttlehours[i] intValue];
            shuttleminutes=[shuttleminutess[i] intValue];
            x=true;
            break;
        }
        if(!x){
            
            shuttlehour=[shuttlehours[0] intValue];
            shuttleminutes=[shuttleminutess[0] intValue];
        }
    }
    
    
    dakikaint = shuttleminutes-dakikaint;//shuttle minutes-current minutes
    if(dakikaint<0) //when dakikaint is less than 0 it means that we need to take a carry from hour
    {
        dakikaint+=60;
        shuttlehour-=1;
    }
    
    saatint = shuttlehour-saatint;//shuttle hour -shuttle minutes
    if(saatint<0){
        saatint+=24;
    }
    
    NSString *shownsaat =[NSString stringWithFormat:@"%d",saatint];
    NSString *showndakika =[NSString stringWithFormat:@"%d",dakikaint];
    NSString *timetoshuttle;
    
    timetoshuttle=[NSString stringWithFormat:@"%@%@%@%@", shownsaat,@"h:",showndakika, @"m"];
    
    
    [label setText:timetoshuttle];
    
    
    
}
-(void) updateSantral{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"cccc"];
    NSString *today =[formatter stringFromDate:[NSDate date]];
    
    NSString *Saturday=@"Saturday";
    NSString *Sunday=@"Sunday";
    
    if ([today isEqualToString:Saturday]) {
        [tophaneSantral setText:@"No Bus"];
    }
    else if([today isEqualToString:Sunday]){
        [tophaneSantral setText:@"No Bus"];
    }
    
    else{

    [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9], [NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:45], nil]:tophaneSantral];}
}
-(void) updateDolapdere{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"cccc"];
    NSString *today =[formatter stringFromDate:[NSDate date]];
    
    NSString *Saturday=@"Saturday";
    NSString *Sunday=@"Sunday";
    
    if ([today isEqualToString:Saturday]) {
        [tophaneDolapdere setText:@"No Bus"];
    }
    else if([today isEqualToString:Sunday]){
        [tophaneDolapdere setText:@"No Bus"];
    }
    
    else{

    [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9], [NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30], nil]:tophaneDolapdere];}
}
-(void) updateKustepe{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"cccc"];
    NSString *today =[formatter stringFromDate:[NSDate date]];
    
    NSString *Saturday=@"Saturday";
    NSString *Sunday=@"Sunday";
    
    if ([today isEqualToString:Saturday]) {
        [tophaneKustepe setText:@"No Bus"];
    }
    else if([today isEqualToString:Sunday]){
        [tophaneKustepe setText:@"No Bus"];
    }
    
    else{

    [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:8], [NSNumber numberWithInt:9],[NSNumber numberWithInt:10],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:50],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil]:tophaneKustepe];}
}

-(void) updateall{
    
    [self updateSantral];
    [self updateDolapdere];
    [self updateKustepe];
}
-(IBAction)back:(id)sender
{   [timere invalidate];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    
    
    //   [self finalize];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateall];
	timere= [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateall) userInfo:nil repeats:YES];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
