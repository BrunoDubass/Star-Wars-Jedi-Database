//
//  BDBJediTableViewController.h
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 12/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDBKnightViewController.h"

@interface BDBJediTableViewController : UITableViewController

-(id)initWithModelKnight:(NSArray*)aKnight Master:(NSArray*)aMaster Grand:(NSArray*)aGrand;

@end
