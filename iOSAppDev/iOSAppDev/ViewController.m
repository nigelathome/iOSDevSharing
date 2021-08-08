//
//  ViewController.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/8.
//

#import "ViewController.h"

@implementation MyView

- (void)willMoveToSuperview:(nullable UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:({
        MyView *view = [[MyView alloc] initWithFrame:CGRectMake(150, 150, 200, 300)];
        view.backgroundColor = [UIColor redColor];
        view;
    })];
    
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Hello, World";
        [label sizeToFit];
        label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
        label;
    })];
}

@end
