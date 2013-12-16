// The MIT License (MIT)
// Copyright © 2013 Charles Francoise

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the “Software”), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSArray+FilterMapReduce.h"

@implementation NSArray (FilterMapReduce)

- (NSArray*)filter:(FilterBlock)block
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        if (block(obj))
        {
            [ret addObject:obj];
        }
    }];
    return ret;
}

- (NSArray*)map:(MapBlock)block
{
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
             [ret addObject:block(obj)];
     }];
    return ret;
}

- (id)reduce:(ReduceBlock)block withInitializer:(id<NSCopying>)initializer
{
    __block id ret = [((NSObject*)initializer) copy];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         ret = block(obj, ret);
     }];
#if !__has_feature(objc_arc)
    return [ret autorelease];
#else
    return ret;
#endif
}

@end
