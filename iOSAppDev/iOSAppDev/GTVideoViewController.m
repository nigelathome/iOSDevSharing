//
//  GTVideoViewController.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/15.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation GTVideoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_1"];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_2"];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_3"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (indexPath.item % 3 == 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
    } else if (indexPath.item % 3 == 1) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_2" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_3" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}

@end
