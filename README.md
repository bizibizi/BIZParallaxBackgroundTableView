# BIZParallaxBackgroundTableView

Wait for gif presentation, it's loading...

![alt tag](https://github.com/bizibizi/BIZTableViewParallaxBackground/blob/master/presentation.gif)


BIZParallaxBackgroundTableView is a sublcass of UITableView that adds ability add add custom image as background of tableView and scroll it with scrolling tableView.

# Usage

```objective-c
//add parallax background 
[self.tableView addParallaxWithBackgroundWithImage:[UIImage imageNamed:@"image.jpg"] delegate:self];
//remove parallax background 
[self.imageView removeParallaxBackground];
```

# Installation

 - Copy BIZParallaxBackgroundTableView folder to your project 
 - ```#import "BIZParallaxBackgroundTableView.h"```
 - Create UITableView via code or storyboard
 - implement```addParallaxWithBackgroundWithImage:delegate:```
