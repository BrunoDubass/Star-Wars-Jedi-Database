//
//  BDBStarWarsCharacter.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBStarWarsCharacter.h"

@implementation BDBStarWarsCharacter

#pragma mark - CLASS CONSTRUCTORS

+(id)starWarsCharaterWithName:(NSString*)aName{
    
    return [[BDBStarWarsCharacter alloc]initWithName:aName];
}

#pragma mark - INITS

-(id)initWithName:(NSString*)aName{
    
    if (self = [super init]) {
        _name = aName;
    }
    return self;
}

#pragma mark - UTILS

-(NSString*)description{
    
    [super description];
    return [NSString stringWithFormat:@"StarWars Character Name: %@", [self name]];
}

-(BOOL)isEqual:(BDBStarWarsCharacter*)character{
    
    if (self.name == character.name) {
        return YES;
    }
    return NO;
}

@end
