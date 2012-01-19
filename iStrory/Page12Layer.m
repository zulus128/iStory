//
//  Page12Layer.m
//  iStrory
//
//  Created by Mac on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Page12Layer.h"


@implementation Page12Layer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Page12Layer *layer = [Page12Layer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* bg = [CCSprite spriteWithFile:@"background12.jpg"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];

        CCSprite* bgh = [CCSprite spriteWithFile:@"Holm.png"];
        bgh.position = ccp(131 + size.width/2, size.height/2 - 138);
        [self addChild:bgh z:10];

        CCSprite* tx = [CCSprite spriteWithFile:@"text.png"];
        tx.position = ccp(790, 690);
        [self addChild:tx z:20];

        CCSprite* house = [CCSprite spriteWithFile:@"Lisa_v_Dome_00000.png"];
		house.position = ccp(840, 360);
		[self addChild:house z:5];

        CCSprite* rabbit = [CCSprite spriteWithFile:@"rabbit.png"];
		rabbit.position = ccp(909, 114);
		[self addChild:rabbit z:15];

        [rabbit runAction: [CCRepeatForever actionWithAction: [CCSequence actions:
                                                             
                                                            [CCFadeTo actionWithDuration:1.8f opacity:0.0f],
                                                               [CCFadeTo actionWithDuration:0.0001f opacity:255],
                                                             [CCDelayTime actionWithDuration:3.0f],
                                                             
                                                             nil]]];
                                                                                                                                 
        CCSprite* rabbit_eyes = [CCSprite spriteWithFile:@"rabbit_eyes.png"];
		rabbit_eyes.position = ccp(909, 114);
        rabbit_eyes.opacity = 0;
		[self addChild:rabbit_eyes z:16];

       [rabbit_eyes runAction: [CCRepeatForever actionWithAction: [CCSequence actions:
                                                               
                                                               [CCFadeTo actionWithDuration:1.8f opacity:255.0f],
                                                                   [CCFadeTo actionWithDuration:0.0001f opacity:0.0f],
                                                               [CCDelayTime actionWithDuration:3.0f],
                                                               
                                                               nil]]];

	
  CCAnimation* anim1 = [CCAnimation animation];
        anim1.delay = 0.09f;
        for( int j = 0; j <= 16; j++) {
            NSString* s = [NSString stringWithFormat:@"Lisa_v_Dome_%05d.png", j];
//            NSLog(@"s = %@", s);
            [anim1 addFrameWithFilename:s];
        }
        
        [house runAction: [CCRepeatForever actionWithAction: [CCSequence actions:[CCDelayTime actionWithDuration:3.0f], [CCAnimate actionWithAnimation:anim1 restoreOriginalFrame:NO], nil]]];

        CCSprite* smoke = [CCSprite spriteWithFile:@"12smoke_0000.png"];
		smoke.position = ccp(810, 630);
		[self addChild:smoke z:5];

		CCAnimation* anim2 = [CCAnimation animation];
        anim2.delay = 0.04f;
        for( int j = 0; j <= 49; j++) {
            NSString* s = [NSString stringWithFormat:@"12smoke_%04d.png", j];
//            NSLog(@"s = %@", s);
            [anim2 addFrameWithFilename:s];
        }

        [smoke runAction: [CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:anim2 restoreOriginalFrame:NO]]];

        
        CCSprite* bull = [CCSprite spriteWithFile:@"bull.png"];
        float x = 360;
        float y = 340;
		bull.position = ccp(x, y);
        bull.scale = 0.5f;
		[self addChild:bull z:5];
        
        [bull runAction: [CCRepeatForever actionWithAction: [CCSequence actions:
                                                             
                                                             [CCScaleTo actionWithDuration:0.0001f scale:0.5f],
                                                             [CCScaleTo actionWithDuration:0.5f scale:1.0f],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+10, y+10)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-10, y+10)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+10, y-10)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-10, y-10)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+30, y+30)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-30, y+30)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+30, y-30)],
                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-30, y-30)],

                                                             [CCDelayTime actionWithDuration:3.0f],
                                                             
                                                             nil]]];

        //		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"next.png" selectedImage:@"next_activ.png" target:self selector:@selector(pCallback1:)];
//        
//		CCMenu* menu = [CCMenu menuWithItems:item1, nil];
//		menu.position = ccp(0,0);
//		item1.position = ccp(size.width - 82, 59);	
//		
//		[self addChild: menu z:500];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
