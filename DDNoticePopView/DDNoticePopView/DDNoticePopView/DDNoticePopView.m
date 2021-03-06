//
//  DDNoticePopView.m
//  Travel
//
//  Created by dd2333 on 2017/4/6.
//  Copyright © 2017年 dd2333. All rights reserved.
//

#import "DDNoticePopView.h"

#define WIDTH_SPACE 30          //左右间距
#define HEIGHT_SPACE 110        //上下间距

#define BTN_R 35

@interface DDNoticePopView()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIButton *closeBtn;

@property (nonatomic, copy) void (^btnClick)(void);
@property (nonatomic, copy) void (^closeClick)(void);

@end

@implementation DDNoticePopView

+ (instancetype)sharedInstance{
    static DDNoticePopView *sharedInstance = nil;
    @synchronized (self) {
        if (!sharedInstance) {
            sharedInstance = [[self alloc]init];
        }
    }
    return sharedInstance;
}

- (instancetype)init{
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
        
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setFrame:CGRectMake((self.frame.size.width-BTN_R)/2, self.frame.size.height-(HEIGHT_SPACE+BTN_R)/2, BTN_R, BTN_R)];
        [_closeBtn setImage:[UIImage imageNamed:@"DDNoticePopView.bundle/close@2x.png"] forState:0];
        [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setAlpha:0];
        [_closeBtn setBackgroundColor:[UIColor whiteColor]];
        _closeBtn.layer.cornerRadius = BTN_R/2;
        _closeBtn.clipsToBounds = YES;
        [_closeBtn setAdjustsImageWhenHighlighted:NO];
        [self addSubview:_closeBtn];
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setFrame:CGRectMake(WIDTH_SPACE, -self.frame.size.height, self.frame.size.width-2*WIDTH_SPACE, self.frame.size.height-2*HEIGHT_SPACE)];
        _btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_btn setAdjustsImageWhenHighlighted:NO];
        [_btn addTarget:self action:@selector(btnBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
        
        self.alpha = 0;
    }
    return self;
}

- (void)show:(UIImage*)image btnClick:(void(^)(void))btnClick{
    [self show:image closeBtnHidden:NO btnClick:btnClick closeClick:nil];
}

- (void)show:(UIImage*)image btnClick:(void(^)(void))btnClick closeClick:(void(^)(void))closeClick{
    [self show:image closeBtnHidden:NO btnClick:btnClick closeClick:closeClick];
}

- (void)show:(UIImage*)image closeBtnHidden:(BOOL)isHidden btnClick:(void(^)(void))btnClick closeClick:(void(^)(void))closeClick{
    
    if (image) {
        
        [_closeBtn setHidden:isHidden];
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        [_btn setImage:[self imageWithCorner:image radius:8] forState:0];
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 1;
            [_btn setFrame:CGRectMake(WIDTH_SPACE, HEIGHT_SPACE+20, self.frame.size.width-2*WIDTH_SPACE, self.frame.size.height-2*HEIGHT_SPACE)];
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                [_btn setFrame:CGRectMake(WIDTH_SPACE, HEIGHT_SPACE, self.frame.size.width-2*WIDTH_SPACE, self.frame.size.height-2*HEIGHT_SPACE)];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.4 animations:^{
                    [_closeBtn setAlpha:1];
                } completion:nil];
            }];
        }];
        
        self.btnClick = btnClick;
        self.closeClick = closeClick;
    }
    

}

- (void)closeBtnClick{
    
    if (self.closeClick) {
        self.closeClick();
    }

    [self hide];
}

- (void)btnBtnClick{
    
    if (self.btnClick) {
        self.btnClick();
    }

}

- (void)hide{
    
    [UIView animateWithDuration:0.2 animations:^{
        [_closeBtn setAlpha:0];
        [_btn setFrame:CGRectMake(WIDTH_SPACE, HEIGHT_SPACE+20, self.frame.size.width-2*WIDTH_SPACE, self.frame.size.height-2*HEIGHT_SPACE)];
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 0;
            [_btn setFrame:CGRectMake(WIDTH_SPACE, -self.frame.size.height, self.frame.size.width-2*WIDTH_SPACE, self.frame.size.height-2*HEIGHT_SPACE)];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
    
}

#pragma mark - image

-(UIImage*)imageWithCorner:(UIImage*)img radius:(CGFloat)radius{

    CGRect r = CGRectMake(0, 0, img.size.width, img.size.height);

    UIGraphicsBeginImageContextWithOptions(img.size, NO, img.scale);
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    CGContextAddPath(ctr, [UIBezierPath bezierPathWithRoundedRect:r cornerRadius:radius].CGPath);
    CGContextClip(ctr);
    [img drawInRect:r];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


@end
