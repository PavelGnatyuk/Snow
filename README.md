Snow
====

Snow Effect. Demo project. CAEmitterLayer

![Alt text](Screenshot.png "iPhone 5 screenshot")

It's a simple class derived from UIView:

`````objective-c
@interface SnowEmitterView : UIView

- (void)start;
- (void)stop;

@end
`````

Just add it to your view:

`````objective-c
    CGRect bounds = [[self view] bounds];
    SnowEmitterView *viewSnow = [[SnowEmitterView alloc] initWithFrame:bounds];
    [[self view] addSubview:viewSnow];
    [viewSnow start];
`````
