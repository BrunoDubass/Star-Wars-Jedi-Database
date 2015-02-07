//
//  BDBKnightViewController.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBKnightViewController.h"
#import "BDBJedi.h"
#import "BDBLightSaber.h"
#import "BDBMasterOfPadawanTableViewController.h"
#import "BDBJediTableViewController.h"

@interface BDBKnightViewController ()

#pragma mark - PROPERTIES

@property (strong, nonatomic) NSArray* pickerArray;
@property (copy, nonatomic) NSString* selected;
@property (strong, nonatomic) NSMutableArray* knightArray;
@property (strong, nonatomic) NSMutableArray* masterArray;
@property (strong, nonatomic) NSMutableArray* grandMasterArray;
@property (strong, nonatomic) BDBLightSaber* ls;
@property (strong, nonatomic) BDBJedi* jedi;
@property (strong, nonatomic) BDBMasterOfPadawanTableViewController* masterVC;
@property (strong, nonatomic) BDBJedi* padawanOf;

@end

@implementation BDBKnightViewController

#pragma mark - INITS

-(id)init{
    if (self = [super init]) {
        _selected = @"None";
        _knightArray = [[NSMutableArray alloc]init];
        _masterArray = [[NSMutableArray alloc]init];
        _grandMasterArray = [[NSMutableArray alloc]init];
        
        _midiChloriansSlider.value = 100;
        
        
        
    }
    return self;
}

#pragma mark - CYCLE LIFE

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.pickerArray = @[@"None", @"Red", @"Green", @"Blue", @"Purple"];
    self.image = [UIImage imageNamed:@"light saber horizontal"];
    self.imageField.image = self.image;
    self.imageBackground = [UIImage imageNamed:@"darth"];
    self.imageBackgroundField.image = self.imageBackground;
    [self.view addSubview:self.imageField];
    [self.view addSubview:self.imageBackgroundField];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - PICKER VIEW

//REQUIRED

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerArray count];
}

//OPTIONALS


// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.selected = [self.pickerArray objectAtIndex:[self.lighSaberPicker selectedRowInComponent:component]];
    
    if ([self.selected isEqualToString:@"Red"]) {
        
        self.ls = [[BDBLightSaber alloc]initWithRed];
        self.imageField.backgroundColor = self.ls.color;
        
    }else if ([self.selected isEqualToString:@"Green"]){
        
        self.ls = [[BDBLightSaber alloc]initWithGreen];
        self.imageField.backgroundColor = self.ls.color;
        
    }else if ([self.selected isEqualToString:@"Blue"]){
        
        self.ls = [[BDBLightSaber alloc]initWithBlue];
        self.imageField.backgroundColor = self.ls.color;
        
    }else if ([self.selected isEqualToString:@"Purple"]){
        
        self.ls = [[BDBLightSaber alloc]initWithPurple];
        self.imageField.backgroundColor = self.ls.color;
    }else{
        self.imageField.backgroundColor = nil;
        self.ls = nil;
    }
    
}


#pragma mark - UTILS

- (IBAction)jediTable:(id)sender {
    BDBJediTableViewController* jediVC = [[BDBJediTableViewController alloc]initWithModelKnight:self.knightArray Master:self.masterArray Grand:self.grandMasterArray];
    jediVC.title = @"Jedi Table";
    [self.navigationController pushViewController:jediVC animated:YES];
    
}

- (IBAction)midiChloriansAction:(id)sender{
    self.midiChloriansSlider.value = [self.midiChloriansField.text integerValue];
    [self kindOfJediFunc];
}
- (IBAction)sliderAction:(id)sender{
    self.midiChloriansField.text = [NSString stringWithFormat:@"%i", (int) self.midiChloriansSlider.value];
    [self kindOfJediFunc];
}

- (IBAction)setMaster:(id)sender {
    self.masterVC = [[BDBMasterOfPadawanTableViewController alloc]initWithModelKnight:self.knightArray Master:self.masterArray Grand:self.grandMasterArray];
    self.masterVC.title = @"MASTERS TABLE";
    [self.navigationController pushViewController:self.masterVC animated:YES];
    self.masterVC.delegate = self;
}

-(void)masterOfPadawan:(BDBJedi *)master{
    self.padawanOf = [[BDBJedi alloc]initWithName:master.name midichlorians:master.midichlorians jediRange:master.jediRange lightSaber:master.lightSaber padawanOf:master.padawanOf];
    self.padawanOfField.text = self.padawanOf.name;
}

-(void)kindOfJediFunc{
    if ([self.midiChloriansField.text integerValue]<1000) {
        _kindOfJedi.text = @"JEDI KNIGHT";
    }else if ([self.midiChloriansField.text integerValue]<10000){
        _kindOfJedi.text = @"JEDI MASTER";
    }else{
        _kindOfJedi.text = @"JEDI GRAND MASTER";
    }
}

- (IBAction)createJedi:(id)sender{
    self.jedi = [[BDBJedi alloc]init];
    if ([self.nameField.text  isEqual: @""] || [self.midiChloriansField.text  isEqual: @""]) {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Please, fill all the required fields."
                                                       message:nil
                                                      delegate:self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles: nil];
        [alert show];
    }else if ([self.selected  isEqual: @"None"]){
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Please, choose a lightSaber."
                                                       message:nil
                                                      delegate:self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles: nil];
        [alert show];
        
    }else{
        
        self.jedi.name = self.nameField.text;
        self.jedi.midichlorians = [self.midiChloriansField.text integerValue];
        self.jedi.jediRange = self.kindOfJedi.text;
        self.jedi.lightSaber = self.ls;
        self.jedi.padawanOf = self.padawanOf;
        
        
        
        

        if (self.jedi.midichlorians<1000) {
            
            if ([self jediInKnightArray]) {
                [self jediExists];
            }else{
                [self.knightArray addObject:self.jedi];
                [self sendToDelegate];
                [self resetAndCreateJedi];

            }
        }else if (self.jedi.midichlorians<10000) {
            
            if ([self jediInMasterArray]) {
                [self jediExists];
            
            }else{
                [self.masterArray addObject:self.jedi];
                [self sendToDelegate];
                [self resetAndCreateJedi];
              
            }

            
        }else{
            
            if ([self jediInGrandMasterArray]) {
                [self jediExists];
            }else{
                [self.grandMasterArray addObject:self.jedi];
                [self sendToDelegate];
                [self resetAndCreateJedi];
                }
                
            }
            
        }
        
        
    
    
    
    NSLog(@"KNIGHTS");
    NSLog(@"%@", self.knightArray);
    NSLog(@"MASTERS");
    NSLog(@"%@", self.masterArray);
    NSLog(@"GRAND MASTERS");
    NSLog(@"%@", self.grandMasterArray);

}

-(void)sendToDelegate{
    [self.delegate arraysTableWithKnights:self.knightArray
                                  Masters:self.masterArray
                             GrandMasters:self.grandMasterArray];
}

-(BOOL)jediInKnightArray{
    for (int i = 0; i<self.knightArray.count; i++) {
        if ([self.jedi.name isEqualToString:[[self.knightArray objectAtIndex:i]name] ] && self.jedi.midichlorians == [[self.knightArray objectAtIndex:i]midichlorians]) {
            return YES;
        }
        
    }
    return NO;
}

-(BOOL)jediInMasterArray{
    for (int i = 0; i<self.masterArray.count; i++) {
        if ([self.jedi.name isEqualToString:[[self.masterArray objectAtIndex:i]name] ] && self.jedi.midichlorians == [[self.masterArray objectAtIndex:i]midichlorians]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)jediInGrandMasterArray{
    for (int i = 0; i<self.grandMasterArray.count; i++) {
        if ([self.jedi.name isEqualToString:[[self.grandMasterArray objectAtIndex:i]name] ] && self.jedi.midichlorians == [[self.grandMasterArray objectAtIndex:i]midichlorians]) {
            return YES;
        }
    }
    return NO;
}



-(void)jediExists{
    [self reset];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat: @"Jedi Knight %@ Exists", self.jedi.name]
                                                   message:nil
                                                  delegate:self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles: nil];
    
    [alert show];

}

-(void)reset{
    self.nameField.text = @"";
    self.midiChloriansSlider.value = 100;
    self.midiChloriansField.text = @"";
    self.padawanOfField.text = @"";
    [self.lighSaberPicker selectRow:0 inComponent:0 animated:YES];
    self.imageField.backgroundColor = nil;
    self.kindOfJedi.text = @"";
}

-(void)resetAndCreateJedi{
    
    
    
    
    [self reset];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Jedi Knight Created"
                                                   message:nil
                                                  delegate:self
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles: nil];
    
    [alert show];

}





@end
