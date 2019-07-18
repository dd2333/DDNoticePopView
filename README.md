
# DDNoticePopView

[![LICENSE](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/dd2333/DDNoticePopView/blob/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/DDNoticePopView.svg?style=flat)](http://cocoapods.org/?q=DDNoticePopView)&nbsp;
[![SUPPORT](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://en.wikipedia.org/wiki/IOS_7)&nbsp;
[![BLOG](https://img.shields.io/badge/blog-www.dd2333.com-orange.svg?style=flat)](http://www.dd2333.com)&nbsp;

  DDNoticePopView / 公告弹出控件.<br />
  
  ![github](https://github.com/dd2333/DDNoticePopView/blob/master/demo.gif "github")
  
Installation
-----------------------------------
  Download NoticePopView and try out the included iPhone example apps<br />

Usage
-----------------------------------

### Cocoapods import:
* NoticePopView is available on CocoaPods. Just add the following to your project Podfile:<br />
  ```pod 'DDNoticePopView'```
* Use by including the following import:<br />
```#import <DDNoticePopView.h>```

### Manual import：
* Drag All files in the DDNoticePopView folder to project<br />
* Use by including the following import:<br />
```#import "DDNoticePopView.h"```

### show
    //加载本地图片或者网络图片
    UIImage *img = [UIImage imageNamed:@"t.jpeg"];
    
    [[DDNoticePopView sharedInstance] show:img btnClick:^{
        [[DDNoticePopView sharedInstance] hide];
        NSLog(@"open");
    } closeClick:^{
        NSLog(@"close");
    }];

