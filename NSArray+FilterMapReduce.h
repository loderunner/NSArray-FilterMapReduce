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

#import <Foundation/Foundation.h>

typedef BOOL(^FilterBlock)(id obj);
typedef id(^MapBlock)(id obj);
typedef id(^ReduceBlock)(id obj, id current);


/** ----------------------------------------------------------------------------
 
 This category adds functional programming methods to NSArray using blocks.
 
 
 
 ---------------------------------------------------------------------------- */

@interface NSArray (FilterMapReduce)

/// Returns an array containing the elements of the array for which `block(obj)`
/// evaluates to `true`.
- (NSArray*)filter:(FilterBlock)block;

/// Calls `block(obj)` on each of the elements and returns an array of the results.
- (NSArray*)map:(MapBlock)block;

/// Reduces the array to a single value by calling `block(obj, current)` cumulatively
/// on each element from left to right and using the result as `current` for the
/// next element. An `initializer` is given for the first value of `current`.
- (id)reduce:(ReduceBlock)block withInitializer:(id<NSCopying>)initializer;

@end
