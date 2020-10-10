//
//  NSObject+test.h
//  Demo
//
//  Created by C on 2020/10/10.
//  Copyright © 2020 大大东. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (test)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;

@end

NS_ASSUME_NONNULL_END
