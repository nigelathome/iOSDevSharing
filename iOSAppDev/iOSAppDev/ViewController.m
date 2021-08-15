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
        
//    //frame的位置是相对父视图原点的位置 也就是v1相对self.view的位置
//    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 90)];
//    v1.backgroundColor = [UIColor magentaColor];
//    [self.view addSubview:v1];
//    printf("bounds: (%.1f %.1f %.1f %.1f)\n", v1.bounds.origin.x, v1.bounds.origin.y, v1.bounds.size.width, v1.bounds.size.height);
//    printf("frame: (%.1f %.1f %.1f %.1f)\n", v1.frame.origin.x, v1.frame.origin.y, v1.frame.size.width, v1.frame.size.height);
//
//    //bounds的位置v2原点 默认是(0,0)也就是左上角 改变bounds的位置不影响v2本身 但会影响v2的子视图 因为子视图都是基于他们的父视图来确定位置
//    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 90)];
//    v2.bounds = CGRectMake(80, 0, 160, 90);
//    v2.backgroundColor = [UIColor orangeColor];
//    printf("bounds: (%.1f %.1f %.1f %.1f)\n", v2.bounds.origin.x, v2.bounds.origin.y, v2.bounds.size.width, v2.bounds.size.height);
//    printf("frame: (%.1f %.1f %.1f %.1f)\n", v2.frame.origin.x, v2.frame.origin.y, v2.frame.size.width, v2.frame.size.height);
//    [self.view addSubview:v2];
//
//    //改变bounds的大小 中心点保持不变 v3中心点是(80, 45) 长宽改变从而影响v3位置
//    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 90)];
//    v3.bounds = CGRectMake(0, 0, 320, 90);
//    v3.backgroundColor = [UIColor orangeColor];
//    printf("bounds: (%.1f %.1f %.1f %.1f)\n", v3.bounds.origin.x, v3.bounds.origin.y, v3.bounds.size.width, v3.bounds.size.height);
//    printf("frame: (%.1f %.1f %.1f %.1f)\n", v3.frame.origin.x, v3.frame.origin.y, v3.frame.size.width, v3.frame.size.height);
//    [self.view addSubview:v3];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 200, 100)];
    view.backgroundColor = [UIColor magentaColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController:)];
    [view addGestureRecognizer:tapGesture];
    [self.view addSubview:view];
}

- (void)pushController:(id)sender {
    if (![sender isKindOfClass:[UITapGestureRecognizer class]]) {
        return;
    }
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor magentaColor];
    vc.navigationItem.title = @"二级页面";
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
