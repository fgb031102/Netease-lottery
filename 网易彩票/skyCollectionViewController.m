//
//  skyCollectionViewController.m
//  网易彩票
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "skyCollectionViewController.h"
#import "skyProduct.h"
#import "skyProductCell.h"

@interface skyCollectionViewController ()

@property (nonatomic,strong)NSArray *data;

@end

@implementation skyCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
        //在数据容器数组中，加载数据进行展示。
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
        NSMutableArray *pArray = [NSMutableArray arrayWithCapacity:jsonArray.count];
        for (NSDictionary *dic in jsonArray) {
            skyProduct *product = [skyProduct productWithDic:dic];
            [pArray addObject:product];
        }
        _data = pArray;
    }
    return _data;
}

- (id)init //为了保证程序的扩展性 使用UICollectionView一定要设置布局参数
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 30;
    layout.sectionInset = UIEdgeInsetsMake(15, 15, 0, 15);
    return [super initWithCollectionViewLayout:layout];//一定要调用父类的方法。
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.collectionView registerClass:[skyProductCell class] forCellWithReuseIdentifier:@"cell"]; //当一个cell直接用类创建时，调用这个方法进行注册。
    UINib *nib = [UINib nibWithNibName:@"skyProductCell" bundle:nil];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];//当一个cell用nib创建时，调用这个方法进行注册。
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%d",self.data.count);
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    skyProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.product = self.data[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    skyProduct *p = self.data[indexPath.item];
    NSLog(@"%@",p.title);
}

@end
