# BIZParallaxBackgroundTableView

*Wait for gif presentation, it's loading...*

![alt tag](https://github.com/bizibizi/BIZTableViewParallaxBackground/blob/master/presentation.gif)


BIZParallaxBackgroundTableView is a sublcass of UITableView that adds custom image as background of tableView and scrolls it with Parallax effect.


# Installation

### Manually
- Copy ```BIZParallaxBackgroundTableView``` folder to your project 

### From CocoaPods:
```objective-c
pod 'BIZParallaxBackgroundTableView' 
```


# Usage

 - Create UITableView via code or storyboard
 - implement```addParallaxWithBackgroundWithImage:delegate:```
```objective-c
//add parallax background 
[self.tableView addParallaxWithBackgroundWithImage:[UIImage imageNamed:@"image.jpg"] delegate:self];
//remove parallax background 
[self.imageView removeParallaxBackground];
```


# Contact
Igor Bizi
- https://www.linkedin.com/in/igorbizi
- igorbizi@mail.ru


# License
 
 The MIT License (MIT)

Copyright (c) 2015-present Igor Bizi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
