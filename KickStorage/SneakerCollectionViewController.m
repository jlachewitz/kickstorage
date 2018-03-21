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
#import "SneakerSectionHeader.h"
#import <Realm/Realm.h>
#import <UIKit/UIKit.h>
#import "Utils.h"

@interface SneakerCollectionViewController ()

#define SNEAKER_CELL_IDENTIFIER							@"SneakerCell"
#define SNEAKER_SECTION_HEADER_IDENTIFIER            	@"SneakerSectionHeader"

@property (nonatomic, strong) NSMutableArray<Sneaker*>* sneakers;

@end

@implementation SneakerCollectionViewController

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    if (self)
    {
        [self setupTestData];
    }

    return  self;
}

// TODO: convert to plist file
- (void)setupTestData
{
    Sneaker* sneaker1 = [[Sneaker alloc] initWithShoeLine:@"KDX"
                                              andColorway:@"Aunt Pearl"
                                           andReleaseDate:@"02-28-2018"
                                          andPrimaryColor:UIColor.whiteColor];
    
    Sneaker* sneaker2 = [[Sneaker alloc] initWithShoeLine:@"KD 8"
                                              andColorway:@"BHM"
                                           andReleaseDate:@"01-23-2016"
                                          andPrimaryColor:UIColor.orangeColor];
    
    Sneaker* sneaker3 = [[Sneaker alloc] initWithShoeLine:@"KD 7"
                                              andColorway:@"BHM"
                                           andReleaseDate:@"01-24-2015"
                                          andPrimaryColor:UIColor.blackColor];
    
    Sneaker* sneaker4 = [[Sneaker alloc] initWithShoeLine:@"Lebron 12"
                                              andColorway:@"BHM"
                                           andReleaseDate:@"01-24-2015"
                                          andPrimaryColor:UIColor.blackColor];
    
    Sneaker* sneaker5 = [[Sneaker alloc] initWithShoeLine:@"Kyrie 2"
                                              andColorway:@"BHM"
                                           andReleaseDate:@"01-18-2016"
                                          andPrimaryColor:UIColor.redColor];
    
    Sneaker* sneaker6 = [[Sneaker alloc] initWithShoeLine:@"Lebron 9"
                                              andColorway:@"Summit Lake Hornets"
                                           andReleaseDate:@"03-30-2012"
                                          andPrimaryColor:UIColor.purpleColor];
    
    Sneaker* sneaker7 = [[Sneaker alloc] initWithShoeLine:@"KD 7"
                                              andColorway:@"Aunt Pearl"
                                           andReleaseDate:@"02-18-2015"
                                          andPrimaryColor:UIColor.whiteColor];
    
    Sneaker* sneaker8 = [[Sneaker alloc] initWithShoeLine:@"Lebron 12"
                                              andColorway:@"Data"
                                           andReleaseDate:@"11-11-2014"
                                          andPrimaryColor:UIColor.magentaColor];
    
    Sneaker* sneaker9 = [[Sneaker alloc] initWithShoeLine:@"Lebron 12"
                                              andColorway:@"Instinct"
                                           andReleaseDate:nil
                                          andPrimaryColor:UIColor.purpleColor];
    
    Sneaker* sneaker10 = [[Sneaker alloc] initWithShoeLine:@"Lebron 10"
                                               andColorway:@"Galaxy/Extraterrestrial"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.purpleColor];
    
    Sneaker* sneaker11 = [[Sneaker alloc] initWithShoeLine:@"Jordan 10"
                                               andColorway:@"NYC"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.blackColor];
    
    Sneaker* sneaker12 = [[Sneaker alloc] initWithShoeLine:@"Jordan 10"
                                               andColorway:@"Charlotte"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.blueColor];
    
    Sneaker* sneaker13 = [[Sneaker alloc] initWithShoeLine:@"Jordan 31"
                                               andColorway:@"All-Star/Chameleon"
                                            andReleaseDate:@"02-28-2018"
                                           andPrimaryColor:UIColor.greenColor];
    
    Sneaker* sneaker14 = [[Sneaker alloc] initWithShoeLine:@"Kyrie 1"
                                               andColorway:@"All-Star"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.grayColor];
    
    Sneaker* sneaker15 = [[Sneaker alloc] initWithShoeLine:@"Jordan 7"
                                               andColorway:@"Sweater"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.redColor];
    
    Sneaker* sneaker16 = [[Sneaker alloc] initWithShoeLine:@"Lebron 9"
                                               andColorway:@"South Beach"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.greenColor];
    
    Sneaker* sneaker17 = [[Sneaker alloc] initWithShoeLine:@"Kyrie 2"
                                               andColorway:@"Nike ID (Black/White/Silver)"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.blackColor];
    
    Sneaker* sneaker18 = [[Sneaker alloc] initWithShoeLine:@"Jordan 7"
                                               andColorway:@"Mulberry"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.magentaColor];
    
    Sneaker* sneaker19 = [[Sneaker alloc] initWithShoeLine:@"Kobe 11"
                                               andColorway:@"3D"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.orangeColor];
    
    Sneaker* sneaker20 = [[Sneaker alloc] initWithShoeLine:@"Kobe 11"
                                               andColorway:@"TV"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.grayColor];
    
    Sneaker* sneaker21 = [[Sneaker alloc] initWithShoeLine:@"Air Max Zero"
                                               andColorway:@"Doernbecher (Chehayla)"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.purpleColor];
    
    Sneaker* sneaker22 = [[Sneaker alloc] initWithShoeLine:@"KD 8"
                                               andColorway:@"Christmas"
                                            andReleaseDate:nil
                                           andPrimaryColor:UIColor.redColor];
    
    self.sneakers = [[NSMutableArray alloc] initWithObjects:sneaker1,sneaker2,sneaker3,sneaker4,sneaker5,sneaker6,sneaker7,sneaker8,sneaker9,sneaker10,sneaker11,sneaker12,sneaker13,sneaker14,sneaker15,sneaker16,sneaker17,sneaker18,sneaker19,sneaker20,sneaker21, sneaker22, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// TODO: make this less hard-coded, clean up repeated coded; re-add info button
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults* results = [[Sneaker objectsInRealm:realm where:@"shoeLine != nil"] sortedResultsUsingKeyPath:@"shoeLine" ascending:YES];
    RLMResults* distinctResults = [results distinctResultsUsingKeyPaths:[NSArray arrayWithObject:@"shoeLine"]];
    NSLog(@"number of distinct shoe lines is %lu", distinctResults.count);
    
    NSString* currentShoeLine = ((Sneaker*)[distinctResults objectAtIndex:indexPath.section]).shoeLine;
    
    NSLog(@"currentShoeLine is %@", currentShoeLine);
    
    RLMResults* currentShoeLineResults = [Sneaker objectsWhere:[NSString stringWithFormat:@"shoeLine = '%@'", currentShoeLine]];
    Sneaker* currentShoe = ((Sneaker*)[currentShoeLineResults objectAtIndex:indexPath.row]);
    
    SneakerCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:SNEAKER_CELL_IDENTIFIER forIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [[SneakerCell alloc] init];
    }
    
    [cell.shoeLineLabel setText: currentShoe.shoeLine];
    [cell.colorwayLabel setText: currentShoe.colorway];
    
    [cell.primaryColorView setBackgroundColor: [Utils colorFromHexString: currentShoe.primaryColor]];
    cell.primaryColorView.layer.borderColor = UIColor.blackColor.CGColor;
    cell.primaryColorView.layer.borderWidth = 1;
    
    [cell.releaseDateLabel setText: [NSString stringWithFormat: @"Released: %@", currentShoe.releaseDate != nil ? currentShoe.releaseDate : @"unknown"]];
    
    cell.layer.borderColor = UIColor.blackColor.CGColor;
    cell.layer.borderWidth = 1;
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults* results = [[Sneaker objectsInRealm:realm where:@"shoeLine != nil"] sortedResultsUsingKeyPath:@"shoeLine" ascending:YES];
    RLMResults* distinctResults = [results distinctResultsUsingKeyPaths:[NSArray arrayWithObject:@"shoeLine"]];
    return [distinctResults count];
}

// TODO: make this less hard-coded, clean up repeated coded
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SneakerSectionHeader* cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SNEAKER_SECTION_HEADER_IDENTIFIER forIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [[SneakerSectionHeader alloc] init];
    }
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults* results = [[Sneaker objectsInRealm:realm where:@"shoeLine != nil"] sortedResultsUsingKeyPath:@"shoeLine" ascending:YES];
    RLMResults* distinctResults = [results distinctResultsUsingKeyPaths:[NSArray arrayWithObject:@"shoeLine"]];
    
    [cell.sortingCriteriaLabel setText:((Sneaker*)[distinctResults objectAtIndex:indexPath.section]).shoeLine];
    
    return cell;
}

// get all the distinct shoe lines sorted alphabetically, then query to get the number of sneakers for the shoe line for the current section
// TODO: clean this up; make this less hard-coded, more dynamic (want to be able to sort in a variety of different ways, not just by shoe line)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    RLMResults* results = [[Sneaker objectsInRealm:realm where:@"shoeLine != nil"] sortedResultsUsingKeyPath:@"shoeLine" ascending:YES];
    RLMResults* distinctResults = [results distinctResultsUsingKeyPaths:[NSArray arrayWithObject:@"shoeLine"]];
    NSLog(@"number of distinct shoe lines is %lu", distinctResults.count);

    NSString* currentShoeLine = ((Sneaker*)[distinctResults objectAtIndex:section]).shoeLine;
    NSLog(@"currentShoeLine is %@", currentShoeLine);
    
    RLMResults* currentShoeLineResults = [Sneaker objectsWhere:[NSString stringWithFormat:@"shoeLine = '%@'", currentShoeLine]];
    NSLog(@"currentShowLineResults.count is %lu", (unsigned long)currentShoeLineResults.count);
    
    return currentShoeLineResults.count;
}

@end
