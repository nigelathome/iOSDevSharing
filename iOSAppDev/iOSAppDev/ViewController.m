//
//  ViewController.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Hello, World";
        [label sizeToFit];
        label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
        label;
    })];
}

@end
