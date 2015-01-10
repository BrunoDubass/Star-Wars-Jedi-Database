//
//  BDBKnightViewController.h
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBJediViewController.h"

#import "BDBMasterOfPadawanTableViewController.h"

@protocol BDBKnightViewControllerDelegate <NSObject>

-(void)arraysTableWithKnights:(NSArray*)knightArray
                      Masters:(NSArray*)masterArray
                 GrandMasters:(NSArray*)granMasterArray;

@end

@interface BDBKnightViewController : BDBJediViewController <UIPickerViewDelegate, UIPickerViewDataSource, BDBMasterOfPadawanTableViewControlerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *midiChloriansField;
@property (weak, nonatomic) IBOutlet UISlider *midiChloriansSlider;

@property (weak, nonatomic) IBOutlet UIPickerView *lighSaberPicker;
@property (weak, nonatomic) IBOutlet UIImageView *imageField;
@property (strong, nonatomic) UIImage* image;
@property (weak, nonatomic) IBOutlet UILabel *kindOfJedi;
@property (weak, nonatomic) IBOutlet UILabel *padawanOfField;

@property (strong, nonatomic) id<BDBKnightViewControllerDelegate>delegate;

- (IBAction)midiChloriansAction:(id)sender;
- (IBAction)sliderAction:(id)sender;
- (IBAction)setMaster:(id)sender;

- (IBAction)createJedi:(id)sender;

-(void)kindOfJediFunc;

@end
