//
//  GTHomeViewController.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/8.
//

#import "GTHomeViewController.h"

@interface  GTHomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readwrite) NSMutableDictionary *cellDict;

@end

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
    
//    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(150, 150, 200, 300)];
//    view.backgroundColor = [UIColor redColor];
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushViewController:)];
//    [view addGestureRecognizer:tapGesture];
//    [self.view addSubview:view];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_Id"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell_Id"];
    }
    
    cell.textLabel.text = @"主标题";
    cell.detailTextLabel.text = @"次标题";
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    
    NSString *key = [NSString stringWithFormat:@"%p", cell];
    if (![self.cellDict objectForKey:key]) {
        [self.cellDict setObject:[NSString stringWithFormat:@"%p", cell] forKey:key];
        printf("新创建的cell: %p\n", cell);
    } else {
        printf("复用的cell: %p\n", cell);
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.navigationItem.title = @"二级页面";
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边的标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - lazy method

- (NSMutableDictionary *)cellDict {
    if (!_cellDict) {
        _cellDict = [NSMutableDictionary dictionary];
    }
    
    return _cellDict;
}

@end
