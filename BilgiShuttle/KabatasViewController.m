//
//  KabatasViewController.m
//  BilgiShuttle
//
//  Created by Sami Sen on 11/28/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import "KabatasViewController.h"

@interface KabatasViewController ()

@end

@implementation KabatasViewController

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
-(void) updateSantral{//THERE IS WEEKENDS ALSO
    NSDateFormatter *formatter = [NSDateFormatter new]; //formatter yaratıldı
    [formatter setDateFormat:@"HH"];//format 24saatlik Saat kısmı
    NSString *saat = [formatter stringFromDate:[NSDate date]]; //current date to current hour
    [formatter setDateFormat:@"mm"];//format 60dakikalık dakika kısmı olarak değiştirildi
    NSString *dakika =[formatter stringFromDate:[NSDate date]];//current date to current minutes
    
    [formatter setDateFormat:@"cccc"];
    NSString *today =[formatter stringFromDate:[NSDate date]];
   
    NSString *Saturday=@"Saturday";
    NSString *Sunday=@"Sunday";

    int ringsaatint=[saat intValue];//hours in int
    int ringdakikaint=[dakika intValue];//minutes in int
    int ringshuttle=((ringsaatint*100)+ringdakikaint);
    
    if ([today isEqualToString:Sunday]) {
     [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10], [NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30],[NSNumber numberWithInt:30], nil]:kabatasSantral];
     }
     else if ([today isEqualToString:Saturday]) {
     [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], [NSNumber numberWithInt:11],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],[NSNumber numberWithInt:19],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil]:kabatasSantral];
     }

    else if (ringshuttle>=800 && ringshuttle<2000) {
        [kabatasSantral setText:@"Ring"];
    }
    
    else{

    [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:20],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil]:kabatasSantral];
    }
}

-(void) updateDolapdere{
    NSDateFormatter *formatter = [NSDateFormatter new]; //formatter yaratıldı
    [formatter setDateFormat:@"HH"];//format 24saatlik Saat kısmı
    NSString *saat = [formatter stringFromDate:[NSDate date]]; //current date to current hour
    [formatter setDateFormat:@"mm"];//format 60dakikalık dakika kısmı olarak değiştirildi
    NSString *dakika =[formatter stringFromDate:[NSDate date]];//current date to current minutes
    
    [formatter setDateFormat:@"cccc"];
    NSString *today =[formatter stringFromDate:[NSDate date]];
   
    NSString *Saturday=@"Saturday";
    NSString *Sunday=@"Sunday";
    
    
    int ringsaatint=[saat intValue];//hours in int
    int ringdakikaint=[dakika intValue];//minutes in int
    int ringshuttle=((ringsaatint*100)+ringdakikaint);
    
    if ([today isEqualToString:Saturday]) {
        [kabatasDolapdere setText:@"No Bus"];
    }
    else if([today isEqualToString:Sunday]){
        [kabatasDolapdere setText:@"No Bus"];
    }
    
    else if (ringshuttle>=800 && ringshuttle<1000) {
        [kabatasDolapdere setText:@"Ring"];
    }
    else if (ringshuttle>=1700 && ringshuttle<1730) {
        [kabatasDolapdere setText:@"Ring"];
    }
    else{

    [self updateClock: [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:11], [NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],nil]: [NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil]:kabatasDolapdere];
    }
    
}

-(void) updateall{
    [self updateSantral];
    [self updateDolapdere];
    


}
- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:TRUE];
    for (CALayer* layer in [self.view.layer sublayers])
    {
        [layer removeAllAnimations];
    }
    [self removeFromParentViewController];
    
}
-(IBAction)back:(id)sender
{   [timery invalidate];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateall];
	timery= [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateall) userInfo:nil repeats:YES];}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
