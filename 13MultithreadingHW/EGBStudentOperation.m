//
//  EGBStudentOperation.m
//  13MultithreadingHW
//
//  Created by Eddie on 09.08.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import "EGBStudentOperation.h"
#import <UIKit/UIKit.h>

@implementation EGBStudentOperation

// Level "SuperMan"

+ (NSOperationQueue *) studentsQueue {
    static NSOperationQueue *queue = nil;
    static dispatch_once_t task;
    
    dispatch_once(&task, ^{
        queue = [[NSOperationQueue alloc] init];
    });
    
    return queue;
}

- (void) guesNumber:(NSInteger) number value:(NSInteger) range resultBlock:(void(^)(NSString *, NSInteger, CGFloat)) resultBlock {
    
    [[EGBStudentOperation studentsQueue] addOperationWithBlock:^{
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
        
    }];
}

@end
