//
//  BDBMasterOfPadawanTableViewController.h
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 09/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDBJedi;

@protocol BDBMasterOfPadawanTableViewControlerDelegate <NSObject>

@optional
-(void)masterOfPadawan:(BDBJedi*)master;

@end


@interface BDBMasterOfPadawanTableViewController : UITableViewController

#pragma mark - PROPERTIES

@property (strong, nonatomic) id<BDBMasterOfPadawanTableViewControlerDelegate> delegate;

#pragma mark - INITS

-(id)initWithModelKnight:(NSArray*)aKnight Master:(NSArray*)aMaster Grand:(NSArray*)aGrand;

@end

