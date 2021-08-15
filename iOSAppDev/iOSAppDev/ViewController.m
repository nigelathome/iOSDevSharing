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
    
    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(150, 150, 200, 300)];
    view.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushViewController:)];
    [view addGestureRecognizer:tapGesture];
    [self.view addSubview:view];
}

- (void)pushViewController:(id)sender {
    if (![sender isKindOfClass:[UITapGestureRecognizer class]]) {
        return;
    }
    UIViewController *vc = [[UIViewController alloc] init];
    vc.navigationItem.title = @"二级页面";
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边的标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
