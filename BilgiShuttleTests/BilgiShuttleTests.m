//
//  BilgiShuttleTests.m
//  BilgiShuttleTests
//
//  Created by Sami Sen on 11/27/13.
//  Copyright (c) 2013 Sami Sen. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface BilgiShuttleTests : XCTestCase

@end

@implementation BilgiShuttleTests
-(void) updateClock:(NSArray*) shuttlehours :(NSArray*) shuttleminutess :(UILabel*) label {
    
    
    NSDateFormatter *formatter = [NSDateFormatter new]; //formatter yaratıldı
    [formatter setDateFormat:@"HH"];//format 24saatlik Saat kısmı
  // NSString *saat = [formatter stringFromDate:[NSDate date]]; //current date to current hour
    [formatter setDateFormat:@"mm"];//format 60dakikalık dakika kısmı olarak değiştirildi
  // NSString *dakika =[formatter stringFromDate:[NSDate date]];//current date to current minutes
    int saatint=12;//hours in int
    int dakikaint=30;//minutes in int
    
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

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testSantralKabatasSundayUpdateClock
{
    
    UILabel *testLabel = [[UILabel alloc]init];
   
    NSArray *testArray =[NSArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:10], [NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],nil];
    NSArray *testArray1 =[NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    
    [self updateClock:testArray :testArray1 :testLabel];
    
    XCTAssertTrue([testLabel.text isEqualToString: @"0h:30m"]);
   
   }
//----------------------------------------------------------------------
- (void)testSantralKabatasSaturdayUpdateClock
{
    UILabel *testLabelSat = [[UILabel alloc]init];
    
    NSArray *testArraySat =[NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], [NSNumber numberWithInt:11],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],[NSNumber numberWithInt:19],nil];
    NSArray *testArray1Sat = [NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil];
    
    [self updateClock:testArraySat :testArray1Sat :testLabelSat];
   
    XCTAssertTrue([testLabelSat.text isEqualToString: @"0h:30m"]);

}
//----------------------------------------------------------------------
//Ring Test
- (void)testSantralKabatasRing{
    
    UILabel *testLabelRing = [[UILabel alloc]init];

    int ringsaatint=12;//hours in int
    int ringdakikaint=30;//minutes in int
    int ringshuttle=((ringsaatint*100)+ringdakikaint);
    
    if (ringshuttle>=830 && ringshuttle<2000) {
        [testLabelRing setText:@"Ring"];
    }

    XCTAssertTrue([testLabelRing.text isEqualToString:@"Ring"]);
}
- (void)testSantralKabatas{

    UILabel *testLabelHaftaIci = [[UILabel alloc]init];
    
    NSArray*santral=[NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:20], [NSNumber numberWithInt:20],[NSNumber numberWithInt:21],[NSNumber numberWithInt:21],[NSNumber numberWithInt:21],[NSNumber numberWithInt:22],[NSNumber numberWithInt:22],nil];
    NSArray*santraldk=[NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil];
    [self updateClock:santral :santraldk :testLabelHaftaIci];
    
    XCTAssertTrue([testLabelHaftaIci.text isEqualToString:@"7h:50m"]);
    
}
//-------NO BUS---------------------
-(void) testSantralKustepeNoBus{
    UILabel *testLabelNoBus = [[UILabel alloc]init];
    NSString*today = @"Saturday";

    if ([today isEqualToString:@"Saturday"]) {
        [testLabelNoBus setText:@"No Bus"];
    }
    XCTAssertTrue([testLabelNoBus.text isEqualToString:@"No Bus"]);
}

-(void) testSantralKustepe{
    UILabel *testLabelKustepe = [[UILabel alloc]init];
    
    NSArray *test = [NSArray arrayWithObjects:[NSNumber numberWithInt:8], [NSNumber numberWithInt:8],[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],[NSNumber numberWithInt:19],nil];
    
    NSArray *test2 = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:50],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:50],[NSNumber numberWithInt:50],[NSNumber numberWithInt:50],[NSNumber numberWithInt:50],[NSNumber numberWithInt:50],[NSNumber numberWithInt:50],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil];
    
    [self updateClock:test :test2 :testLabelKustepe];
    
    XCTAssertTrue([testLabelKustepe.text isEqualToString:@"0h:20m"]);

}

- (void) testSantralDolapdere {

    UILabel *testLabelDolapdere = [[UILabel alloc]init];
   
    NSArray *test =[NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:8], [NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:11],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],nil];
    
    NSArray *test2 =[NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0],[NSNumber numberWithInt:20],[NSNumber numberWithInt:40],[NSNumber numberWithInt:0], nil];
   
    [self updateClock:test :test2 :testLabelDolapdere];
   
   XCTAssertTrue([testLabelDolapdere.text isEqualToString:@"0h:10m"]);
    
    
}

- (void)testSantralHalicioglu{

    UILabel *testLabelHalicioglu = [[UILabel alloc]init];
    
    NSArray *test =[NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:8], [NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],[NSNumber numberWithInt:19],[NSNumber numberWithInt:20],[NSNumber numberWithInt:20],[NSNumber numberWithInt:21],[NSNumber numberWithInt:21],[NSNumber numberWithInt:22],[NSNumber numberWithInt:22],nil];
    
    
    NSArray *test2 =[NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:45],[NSNumber numberWithInt:0],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:30], nil];
    
    [self updateClock:test :test2 :testLabelHalicioglu];
   
     XCTAssertTrue([testLabelHalicioglu.text isEqualToString:@"0h:15m"]);
    
     }

-(void) testSantralTophane {

    UILabel *testLabelHalicioglu = [[UILabel alloc]init];

    NSArray *test =[NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9], [NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],nil];
    
    
    NSArray *test2 =[NSArray arrayWithObjects:[NSNumber numberWithInt:45],[NSNumber numberWithInt:45],[NSNumber numberWithInt:45],[NSNumber numberWithInt:45],[NSNumber numberWithInt:45],[NSNumber numberWithInt:45],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15], nil];

    [self updateClock:test :test2 :testLabelHalicioglu];
    
    XCTAssertTrue([testLabelHalicioglu.text isEqualToString:@"0h:15m"]);
    

}

-(void) testKabatasSantralSaturday {

    UILabel *testLabelKabatas = [[UILabel alloc]init];
    
    NSArray *test = [NSArray arrayWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], [NSNumber numberWithInt:11],[NSNumber numberWithInt:11],[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13],[NSNumber numberWithInt:13],[NSNumber numberWithInt:14],[NSNumber numberWithInt:14],[NSNumber numberWithInt:15],[NSNumber numberWithInt:15],[NSNumber numberWithInt:16],[NSNumber numberWithInt:16],[NSNumber numberWithInt:17],[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19],[NSNumber numberWithInt:19],nil];
    
    
    NSArray *test2 =[NSArray arrayWithObjects:[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30],[NSNumber numberWithInt:0],[NSNumber numberWithInt:30], nil];
    
    [self updateClock:test :test2 :testLabelKabatas];
    
    XCTAssertTrue([testLabelKabatas.text isEqualToString:@"0h:30m"]);
    

    
}





@end
