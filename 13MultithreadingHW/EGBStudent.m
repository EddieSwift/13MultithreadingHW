//
//  EGBStudent.m
//  13MultithreadingHW
//
//  Created by Eddie on 08.08.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "EGBStudent.h"
#import <UIKit/UIKit.h>


@implementation EGBStudent

- (void) guesNumber:(NSInteger) number value:(NSInteger) range resultBlock:(void(^)(NSString *, NSInteger, CGFloat)) resultBlock {
    
    //Level "Student"
    
    //dispatch_queue_t gueue = dispatch_get_global_queue(DISPATCH_TARGET_QUEUE_DEFAULT, 0);
    dispatch_queue_t gueue = dispatch_queue_create("com.egbgalchenko.guessing.number", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(gueue, ^{
        NSInteger quessingNum = arc4random() % range;
        
        double startTime = CACurrentMediaTime();
        
        if (quessingNum == number) {
            
            NSLog(@"Student %@ guessed number, it is %ld", self.name, quessingNum);
            
        } else {
            
            while (quessingNum != number) {
                quessingNum = arc4random() % range;
            }
        }
        
        resultBlock(self.name, number, CACurrentMediaTime() - startTime);
        
    });
}

@end

