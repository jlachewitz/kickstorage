//
//  ViewController.m
//  KickTracker
//
//  Created by Jessica Lachewitz on 3/19/18.
//  Copyright © 2018 Jessica Lachewitz. All rights reserved.
//

#import "SneakerCollectionViewController.h"
#import "Sneaker.h"
#import "SneakerCell.h"
#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "Utils.h"

@interface SneakerCollectionViewController ()

#define SNEAKER_CELL_IDENTIFIER			@"SneakerCell"
@property (nonatomic, strong) NSMutableArray<Sneaker*>* sneakers;

@end

@implementation SneakerCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM-dd-yyyy";*/

    Sneaker* sneaker1 = [[Sneaker alloc] init];
    sneaker1.colorway = @"Aunt Pearl";
    sneaker1.shoeLine = @"KDX";
    sneaker1.primaryColor = [Utils hexStringFromColor:UIColor.whiteColor];
    sneaker1.releaseDate = /*[dateFormatter dateFromString:*/@"02-28-2018";//];
    
    Sneaker* sneaker2 = [[Sneaker alloc] init];
    sneaker2.colorway = @"BHM";
    sneaker2.shoeLine = @"KD 8";
    sneaker2.primaryColor = [Utils hexStringFromColor:UIColor.orangeColor];
    sneaker2.releaseDate = /*[dateFormatter dateFromString:*/@"01-23-2016";//];
    
    Sneaker* sneaker3 = [[Sneaker alloc] init];
    sneaker3.colorway = @"BHM";
    sneaker3.shoeLine = @"KD 7";
    sneaker3.primaryColor = [Utils hexStringFromColor:UIColor.blackColor];
    sneaker3.releaseDate = /*[dateFormatter dateFromString:*/@"01-24-2015";//];
    
    Sneaker* sneaker4 = [[Sneaker alloc] init];
    sneaker4.colorway = @"BHM";
    sneaker4.shoeLine = @"Lebron 12";
    sneaker4.primaryColor = [Utils hexStringFromColor:UIColor.blackColor];
    sneaker4.releaseDate = /*[dateFormatter dateFromString:*/@"01-24-2015";//];
    
    Sneaker* sneaker5 = [[Sneaker alloc] init];
    sneaker5.colorway = @"BHM";
    sneaker5.shoeLine = @"Kyrie 2";
    sneaker5.primaryColor = [Utils hexStringFromColor:UIColor.redColor];
    sneaker5.releaseDate = /*[dateFormatter dateFromString:*/@"01-18-2016";//];
    
    Sneaker* sneaker6 = [[Sneaker alloc] init];
    sneaker6.colorway = @"Summit Lake Hornets";
    sneaker6.shoeLine = @"Lebron 9";
    sneaker6.primaryColor = [Utils hexStringFromColor:UIColor.purpleColor];
    sneaker6.releaseDate = /*[dateFormatter dateFromString:*/@"03-30-2012";//];
    
    Sneaker* sneaker7 = [[Sneaker alloc] init];
    sneaker7.colorway = @"Aunt Pearl";
    sneaker7.shoeLine = @"KD 7";
    sneaker7.primaryColor = [Utils hexStringFromColor:UIColor.whiteColor];
    sneaker7.releaseDate = /*[dateFormatter dateFromString:*/@"02-18-2015";//];
    
    Sneaker* sneaker8 = [[Sneaker alloc] init];
    sneaker8.colorway = @"Data";
    sneaker8.shoeLine = @"Lebron 12";
    sneaker8.primaryColor = [Utils hexStringFromColor:UIColor.magentaColor];
    sneaker8.releaseDate = /*[dateFormatter dateFromString:*/@"11-11-2014";//];
    
    Sneaker* sneaker9 = [[Sneaker alloc] init];
    sneaker9.colorway = @"Instinct";
    sneaker9.shoeLine = @"Lebron 12";
    sneaker9.primaryColor = [Utils hexStringFromColor:UIColor.purpleColor];
    
    Sneaker* sneaker10 = [[Sneaker alloc] init];
    sneaker10.colorway = @"Galaxy/Extraterrestrial";
    sneaker10.shoeLine = @"Lebron 10";
    sneaker10.primaryColor = [Utils hexStringFromColor:UIColor.purpleColor];
    
    Sneaker* sneaker11 = [[Sneaker alloc] init];
    sneaker11.colorway = @"NYC";
    sneaker11.shoeLine = @"Jordan 10";
    sneaker11.primaryColor = [Utils hexStringFromColor:UIColor.blackColor];
    
    Sneaker* sneaker12 = [[Sneaker alloc] init];
    sneaker12.colorway = @"Charlotte";
    sneaker12.shoeLine = @"Jordan 10";
    sneaker12.primaryColor = [Utils hexStringFromColor:UIColor.blueColor];
    
    Sneaker* sneaker13 = [[Sneaker alloc] init];
    sneaker13.colorway = @"All-Star/Chameleon";
    sneaker13.shoeLine = @"Jordan 31";
    sneaker13.primaryColor = [Utils hexStringFromColor:UIColor.greenColor];
    
    Sneaker* sneaker14 = [[Sneaker alloc] init];
    sneaker14.colorway = @"All-Star";
    sneaker14.shoeLine = @"Kyrie 1";
    sneaker14.primaryColor = [Utils hexStringFromColor:UIColor.grayColor];
    
    Sneaker* sneaker15 = [[Sneaker alloc] init];
    sneaker15.colorway = @"Sweater";
    sneaker15.shoeLine = @"Jordan 7";
    sneaker15.primaryColor = [Utils hexStringFromColor:UIColor.redColor];
    
    Sneaker* sneaker16 = [[Sneaker alloc] init];
    sneaker16.colorway = @"South Beach";
    sneaker16.shoeLine = @"Lebron 9";
    sneaker16.primaryColor = [Utils hexStringFromColor:UIColor.greenColor];
    
    Sneaker* sneaker17 = [[Sneaker alloc] init];
    sneaker17.colorway = @"Nike ID (Black/White/Silver)";
    sneaker17.shoeLine = @"Kyrie 2";
    sneaker17.primaryColor = [Utils hexStringFromColor:UIColor.blackColor];
    
    Sneaker* sneaker18 = [[Sneaker alloc] init];
    sneaker18.colorway = @"Mulberry";
    sneaker18.shoeLine = @"Jordan 7";
    sneaker18.primaryColor = [Utils hexStringFromColor:UIColor.magentaColor];
    
    Sneaker* sneaker19 = [[Sneaker alloc] init];
    sneaker19.colorway = @"3D";
    sneaker19.shoeLine = @"Kobe 11";
    sneaker19.primaryColor = [Utils hexStringFromColor:UIColor.orangeColor];
    
    Sneaker* sneaker20 = [[Sneaker alloc] init];
    sneaker20.colorway = @"TV";
    sneaker20.shoeLine = @"Kobe 11";
    sneaker20.primaryColor = [Utils hexStringFromColor:UIColor.grayColor];
    
    Sneaker* sneaker21 = [[Sneaker alloc] init];
    sneaker21.colorway = @"Doernbecher (Chehayla)";
    sneaker21.shoeLine = @"Air Max Zero";
    sneaker21.primaryColor = [Utils hexStringFromColor:UIColor.purpleColor];

    
    Sneaker* sneaker22 = [[Sneaker alloc] init];
    sneaker22.colorway = @"Christmas";
    sneaker22.shoeLine = @"KD 8";
    sneaker22.primaryColor = [Utils hexStringFromColor:UIColor.redColor];
    
    self.sneakers = [[NSMutableArray alloc] initWithObjects:sneaker1,sneaker2,sneaker3,sneaker4,sneaker5,sneaker6,sneaker7,sneaker8,sneaker9,sneaker10,sneaker11,sneaker12,sneaker13,sneaker14,sneaker15,sneaker16,sneaker17,sneaker18,sneaker19,sneaker20,sneaker21,sneaker22, nil];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObjects: self.sneakers];
    }];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SneakerCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:SNEAKER_CELL_IDENTIFIER forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[SneakerCell alloc] init];
    }
    
    [cell.shoeLineLabel setText: self.sneakers[indexPath.row].shoeLine];
    [cell.colorwayLabel setText: self.sneakers[indexPath.row].colorway];
    
    [cell.primaryColorView setBackgroundColor: [Utils colorFromHexString: self.sneakers[indexPath.row].primaryColor]];
    cell.primaryColorView.layer.borderColor = UIColor.blackColor.CGColor;
    cell.primaryColorView.layer.borderWidth = 1;
    
    [cell.releaseDateLabel setText: [NSString stringWithFormat: @"Released: %@", self.sneakers[indexPath.row].releaseDate != nil ? self.sneakers[indexPath.row].releaseDate : @"unknown"]];
    
    cell.layer.borderColor = UIColor.blackColor.CGColor;
    cell.layer.borderWidth = 1;
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sneakers.count;
}

@end
