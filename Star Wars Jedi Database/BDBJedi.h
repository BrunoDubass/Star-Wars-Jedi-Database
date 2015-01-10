//
//  BDBJedi.h
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBStarWarsCharacter.h"
@class BDBLightSaber;

@interface BDBJedi : BDBStarWarsCharacter

#pragma mark - PROPERTIES

@property (nonatomic) int midichlorians;
@property (copy, nonatomic) NSString* jediRange;
@property (strong, nonatomic) BDBLightSaber* lightSaber;
@property (strong, nonatomic) BDBJedi* padawanOf;

#pragma mark - CLASS CONSTRUCTORS

+(id)jediWithName:(NSString *)aName
    midichlorians:(int)nMidichlorians
        jediRange:(NSString*)aRange
       lightSaber:(BDBLightSaber*)aLightSaber
        padawanOf:(BDBJedi*)aPadawanOf;

+(id)jediWithName:(NSString *)aName;
+(id)jediWithJediMasterWithName:(NSString*)aName;

#pragma mark - INITS

-(id)initWithName:(NSString *)aName
    midichlorians:(int)nMidichlorians
        jediRange:(NSString*)aRange
       lightSaber:(BDBLightSaber*)aLightSaber
        padawanOf:(BDBJedi*)aPadawanOf;

-(id)initWithName:(NSString *)aName;
-(id)initJediMasterWithName:(NSString*)aName;

#pragma mark - UTILS

-(NSString*)unsheathe;

@end
