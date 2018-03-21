//
//  SneakerCell.h
//  KickStorage
//
//  Created by Jessica Lachewitz on 3/19/18.
//  Copyright © 2018 Jessica Lachewitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SneakerCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *colorwayLabel;
@property (weak, nonatomic) IBOutlet UILabel *shoeLineLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *extraInfoButton;
@property (weak, nonatomic) IBOutlet UIView *primaryColorView;

@end
