//
//  GTNewsViewController.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/17.
//

#import "GTNewsViewController.h"

@interface GTNewsViewController () <UIScrollViewDelegate>

@end

@implementation GTNewsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"潮流";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *colorArray = @[
        [UIColor redColor],
        [UIColor orangeColor],
        [UIColor yellowColor],
        [UIColor greenColor],
        [UIColor cyanColor],
        [UIColor blueColor],
        [UIColor purpleColor],
    ];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * colorArray.count, self.view.bounds.size.height);
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    for (NSUInteger i = 0; i < colorArray.count; i++) {
        [scrollView addSubview:({
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake(scrollView.frame.size.width * i, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
            v.backgroundColor = [colorArray objectAtIndex:i];
            v;
        })];
    }
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    printf("scrollViewDidScroll \n");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    printf("scrollViewWillBeginDragging \n");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    printf("scrollViewDidEndDragging: \n");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    printf("scrollViewWillBeginDecelerating: \n");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    printf("scrollViewDidEndDecelerating: \n");
}

@end
