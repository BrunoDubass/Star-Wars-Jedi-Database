//
//  BDBLightSaber.h
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIKit.h>





@interface BDBLightSaber : NSObject

#pragma mark - PROPERTIES

@property (strong, nonatomic) UIColor* color;

#pragma mark - CLASS CONSTRUCTORS

+(id)lightSaberWithRed:(CGFloat)aRed Green:(CGFloat)aGreen Blue:(CGFloat)aBlue;
+(id)lightSaberWithRed;
+(id)lightSaberWithBlue;
+(id)lightSaberWithGreen;
+(id)lightSaberWithPurple;

#pragma mark - INITS

-(id)initWithRed:(CGFloat)aRed Green:(CGFloat)aGreen Blue:(CGFloat)aBlue;
-(id)initWithRed;
-(id)initWithBlue;
-(id)initWithGreen;
-(id)initWithPurple;


@end
