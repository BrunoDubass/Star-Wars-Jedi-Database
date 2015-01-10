//
//  BDBLightSaber.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "BDBLightSaber.h"

@implementation BDBLightSaber

#pragma mark - CLASS CONSTRUCTORS

+(id)lightSaberWithRed:(CGFloat)aRed Green:(CGFloat)aGreen Blue:(CGFloat)aBlue{
    return [[BDBLightSaber alloc]initWithRed:aRed Green:aGreen Blue:aBlue];
}

+(id)lightSaberWithRed{
    return [[BDBLightSaber alloc]initWithRed];
}
+(id)lightSaberWithBlue{
    return [[BDBLightSaber alloc]initWithBlue];
}
+(id)lightSaberWithGreen{
    return [[BDBLightSaber alloc]initWithGreen];
}
+(id)lightSaberWithPurple{
    return [[BDBLightSaber alloc]initWithPurple];
}

#pragma mark - INITS

-(id)initWithRed:(CGFloat) aRed Green:(CGFloat)aGreen Blue:(CGFloat)aBlue{
    
    if (self = [super init]) {
        _color = [UIColor colorWithRed: aRed green:aGreen blue:aBlue alpha:0];
    }
    return self;
}
-(id)initWithRed{
    if (self = [super init]) {
        _color = [UIColor redColor];
    }
    return self;
}
-(id)initWithBlue{
    if (self = [super init]) {
        _color = [UIColor blueColor];
    }
    return self;
}
-(id)initWithGreen{
    if (self = [super init]) {
        _color = [UIColor greenColor];
    }
    return self;
}
-(id)initWithPurple{
    if (self = [super init]) {
        _color = [UIColor purpleColor];
    }
    return self;
}

#pragma mark - UTILS

-(NSString*)description{
    return [NSString stringWithFormat:@"LightSaber color is %@ ", self.color];
}

-(BOOL)isEqual:(BDBLightSaber*)aLightSaber{
    if ([self.color isEqual:[aLightSaber color]]) {
        return YES;
    }
    return NO;
}

@end
