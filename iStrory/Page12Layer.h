//
//  Page12Layer.h
//  iStrory
//
//  Created by Mac on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Page12Layer : CCLayer {
 
    CCSprite* bull;
    CCSprite* house;
    CCSprite* smoke;
    float x, y, houseX, houseY, dimX, dimY, zayacX, zayacY;
    BOOL bBull;
    BOOL bLisa;
    BOOL bAdd;
    CCAnimation* anim1;
    CCAnimation* anim2;
}

+(CCScene *) scene;

- (void) start;
- (void) revet;
- (void) lisa;
- (void) dim;
- (void) zayac;

@end
