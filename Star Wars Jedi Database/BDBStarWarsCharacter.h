//
//  BDBStarWarsCharacter.h
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDBStarWarsCharacter : NSObject

#pragma mark - PROPERTIES

@property (copy, nonatomic) NSString* name;

#pragma mark - CLASS CONSTRUCTORS

+(id)starWarsCharaterWithName:(NSString*)aName;

#pragma mark - INITS

-(id)initWithName:(NSString*)aName;

@end
