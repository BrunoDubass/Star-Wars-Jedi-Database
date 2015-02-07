//
//  BDBJedi.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBJedi.h"
#import "BDBLightSaber.h"

@implementation BDBJedi

#pragma mark - CLASS CONSTRUCTORS

+(id)jediWithName:(NSString *)aName
    midichlorians:(NSUInteger)nMidichlorians
        jediRange:(NSString*)aRange
       lightSaber:(BDBLightSaber*)aLightSaber
        padawanOf:(BDBJedi*)aPadawanOf{
    
    return [[BDBJedi alloc]initWithName:aName midichlorians:nMidichlorians jediRange:aRange lightSaber:aLightSaber padawanOf:aPadawanOf];
}

+(id)jediWithName:(NSString *)aName{
    return [[BDBJedi alloc]initWithName:aName];
}
+(id)jediWithJediMasterWithName:(NSString*)aName{
    return [[BDBJedi alloc]initJediMasterWithName:aName];
}

#pragma mark - INITS

-(id)initWithName:(NSString *)aName
    midichlorians:(NSUInteger) nMidichlorians
        jediRange:(NSString*)aRange
       lightSaber:(BDBLightSaber*)aLightSaber
        padawanOf:(BDBJedi*)aPadawanOf{
    
    if (self = [super initWithName:aName]) {
        _midichlorians = nMidichlorians;
        _lightSaber = [[BDBLightSaber alloc]init];
        _lightSaber = aLightSaber;
        _padawanOf = aPadawanOf;
    }
    return self;
}

-(id)initWithName:(NSString *)aName{
    return [self initWithName:aName midichlorians:100 jediRange:nil lightSaber:nil padawanOf:nil];
}
-(id)initJediMasterWithName:(NSString*)aName{
    return [self initWithName:aName midichlorians:1000 jediRange:nil lightSaber:nil padawanOf:nil];
}

#pragma mark - UTILS

-(NSString*)unsheathe{
    return @"█||||||(•)█Ξ█████████████████████";
}

-(NSString*)description{
    return [NSString stringWithFormat:@"Jedi Name: %@ Midichlorians: %lu LightSaber: %@ PadawanOf: %@ ",
            [self name], (unsigned long)[self midichlorians], self.lightSaber, self.padawanOf];
}

-(BOOL)isEqual:(BDBJedi*)aJedi{
    if ([self.name isEqual:aJedi.name] && self.midichlorians == aJedi.midichlorians && [self.lightSaber isEqual:aJedi.lightSaber] && [self.padawanOf isEqual:aJedi.padawanOf]) {
        return YES;
    }
    return NO;
}
@end
