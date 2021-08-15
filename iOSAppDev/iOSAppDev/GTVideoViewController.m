//
//  GTVideoViewController.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/15.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation GTVideoViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.minimumLineSpacing = 10;
//    flowLayout.minimumInteritemSpacing = 10;
//    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10 * 2) / 2, 60);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_id1"];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_id2"];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell_id3"];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    
    if (indexPath.item % 3 == 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_id1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
    } else if (indexPath.item % 3 == 1) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_id2" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_id3" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item % 3 == 0) {
        return CGSizeMake((self.view.frame.size.width - 10 * 2) / 2, 60);
    } else if (indexPath.item % 3 == 1) {
        return CGSizeMake((self.view.frame.size.width - 10 * 2) / 2, 80);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10 * 2) / 2, 120);
    }
    
    return CGSizeZero;
}

@end
