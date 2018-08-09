//
//  EGBStudent.h
//  13MultithreadingHW
//
//  Created by Eddie on 08.08.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EGBStudent : NSObject

@property (strong, nonatomic) NSString *name;

// Level "Master"
+ (dispatch_queue_t) studentsQueue;

// Level "Learner
//- (void) guesNumber:(NSInteger) number value:(NSInteger) range;

// Level "Student"
- (void) guesNumber:(NSInteger) number value:(NSInteger) range resultBlock:(void(^)(NSString *, NSInteger, CGFloat)) resultBlock;

@end
