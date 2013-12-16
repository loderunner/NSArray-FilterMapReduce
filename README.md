# NSArray-FilterMapReduce

An extension for NSArray adding functional programming methods to NSArray using blocks.

Using Objective-C **blocks**, this category adds `filter`, `map` and `reduce` functionality to NSArray, similar to the ones found in [Python](http://docs.python.org/2/tutorial/datastructures.html#functional-programming-tools).

## Description

The `FilterMapReduce` category adds three methods to `NSArray`.



## Usage

```objc
NSArray* numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];

// Returns (2, 4, 6, 8, 10)
NSArray* evenNumbers = [numbers filter:^BOOL(id obj) { return ([obj integerValue] % 2 == 0); }];

// Returns (1, 4, 9, 16, 25, 36, 49, 64, 81, 100)
NSArray* squares = [numbers map:^id(id obj) { return @([obj integerValue] * [obj integerValue]); }];
    
// Returns 55
NSNumber* sum = [numbers reduce:^id(id obj, id current) { return @([obj integerValue] + [current integerValue]); }
                withInitializer:@0];
```

## License

#### The MIT License (MIT)
Copyright © 2013 Charles Francoise

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the “Software”), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
