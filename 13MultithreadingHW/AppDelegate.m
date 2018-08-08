//
//  AppDelegate.m
//  13MultithreadingHW
//
//  Created by Eddie on 08.08.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "AppDelegate.h"
#import "EGBStudent.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSArray *allStudents;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    EGBStudent *student1 = [[EGBStudent alloc] init];
    student1.name = @"John";
    
    EGBStudent *student2 = [[EGBStudent alloc] init];
    student2.name = @"Richard";
    
    EGBStudent *student3 = [[EGBStudent alloc] init];
    student3.name = @"Steve";
    
    EGBStudent *student4 = [[EGBStudent alloc] init];
    student4.name = @"Gary";
    
    EGBStudent *student5 = [[EGBStudent alloc] init];
    student5.name = @"Hanry";
    
    self.allStudents = [NSArray arrayWithObjects:student1, student2, student3, student4, student5, nil];
    
    NSInteger value = 10000;
    NSInteger ramdomNum = arc4random() % value;
    
    NSLog(@"Number that students need to gues is %ld", ramdomNum);
    NSLog(@" ");
    
    // Block for printing results
    void (^resulBlock) (NSString *, NSInteger, CGFloat) = ^(NSString *name, NSInteger ramdomNum, CGFloat time) {
        NSLog(@"%@ guessed the right number: %ld in %f sec", name, (long)ramdomNum, time);
    };

    for (EGBStudent *student in self.allStudents) {
        [student guesNumber:ramdomNum value:value resultBlock:resulBlock];
    }
    
    return YES;
}
    
    
    // Level "Learner
    /*
    dispatch_queue_t gues = dispatch_queue_create("com.egbgalchenko.guessing.number", DISPATCH_QUEUE_SERIAL);
    dispatch_async(gues, ^{
        [student1 guesNumber:ramdomNum value:value];
        [student2 guesNumber:ramdomNum value:value];
        [student3 guesNumber:ramdomNum value:value];
        [student4 guesNumber:ramdomNum value:value];
        [student5 guesNumber:ramdomNum value:value];
    });
     */
    
    
    /*
     dispatch_async(gues, ^{
     [student2 guesNumber:ramdomNum value:value];
     });
     
     
     dispatch_async(gues, ^{
     [student3 guesNumber:ramdomNum value:value];
     });
     
     dispatch_async(gues, ^{
     [student4 guesNumber:ramdomNum value:value];
     });
     
     dispatch_async(gues, ^{
     [student5 guesNumber:ramdomNum value:value];
     });
     */
    
    /*
     dispatch_async(dispatch_get_main_queue(), ^{
     NSLog(@"Main thread %@", [[NSThread currentThread] name]);
     });
     */
    
    
    
    
    
    //NSThread *thread1 = [[NSThread alloc] initWithTarget:student1 selector:@selector(guesNumber:ramdomNum: value:value:) object:nil];
    
    //[thread1 start];
    
    


/*
 - (void) guesNumber:(NSInteger) number value:(NSInteger) range {
 
 NSInteger quessingNum = 0;
 
 double startTime = CACurrentMediaTime();
 
 if (quessingNum == number) {
 NSLog(@"Student guessed number, it is %ld", quessingNum);
 } else {
 while (quessingNum != number) {
 quessingNum = arc4random() % range;
 NSLog(@"Trying to ques %ld", quessingNum);
 }
 }
 NSLog(@"Student guessed number, it is %ld", quessingNum);
 
 NSLog(@"Student finished in %f", CACurrentMediaTime() - startTime);
 }
 */



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
