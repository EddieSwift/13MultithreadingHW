//
//  EGBStudentOperation.h
//  13MultithreadingHW
//
//  Created by Eddie on 09.08.2018.
//  Copyright © 2018 Eddie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EGBStudentOperation : NSObject

@property (strong, nonatomic) NSString *name;

// Level "SuperMan"
+ (NSOperationQueue *) studentsQueue;

- (void) guesNumber:(NSInteger) number value:(NSInteger) range resultBlock:(void(^)(NSString *, NSInteger, CGFloat)) resultBlock;

@end
