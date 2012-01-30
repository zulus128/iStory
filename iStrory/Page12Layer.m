//
//  Page12Layer.m
//  iStrory
//
//  Created by Mac on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleAudioEngine.h"
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
		
        self.isTouchEnabled = YES;
        
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* bg = [CCSprite spriteWithFile:@"12background12.jpg"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:0];

        CCSprite* bgh = [CCSprite spriteWithFile:@"12Holm.png"];
        bgh.position = ccp(131 + size.width/2, size.height/2 - 138);
        [self addChild:bgh z:10];

        CCSprite* tx = [CCSprite spriteWithFile:@"12text.png"];
        tx.position = ccp(790, 690);
        [self addChild:tx z:20];

        houseX = 840;
        houseY = 360;
        house = [[CCSprite spriteWithFile:@"12Lisa_v_Dome_00000.png"] retain];
		house.position = ccp(houseX, houseY);
		[self addChild:house z:5];

        zayacX = 909;
        zayacY = 114;
        rabbit = [[CCSprite spriteWithFile:@"12rabbit.png"]retain];
		rabbit.position = ccp(zayacX, zayacY);
		[self addChild:rabbit z:15];
       
//        [rabbit runAction: [CCRepeatForever actionWithAction: [CCSequence actions:
//                                                               
//                                                               [CCFadeTo actionWithDuration:1.8f opacity:0.0f],
//                                                               [CCFadeTo actionWithDuration:0.0001f opacity:255],
//                                                               [CCDelayTime actionWithDuration:3.0f],
//                                                               
//                                                               nil]]];

        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"12_01.aac" loop:YES];

                                                                                                                                 
        rabbit_eyes = [CCSprite spriteWithFile:@"12rabbit_eyes.png"];
		rabbit_eyes.position = ccp(zayacX, zayacY);
        rabbit_eyes.opacity = 0;
		[self addChild:rabbit_eyes z:16];

//       [rabbit_eyes runAction: [CCRepeatForever actionWithAction: [CCSequence actions:
//                                                               
//                                                               [CCFadeTo actionWithDuration:1.8f opacity:255.0f],
//                                                                   [CCFadeTo actionWithDuration:0.0001f opacity:0.0f],
//                                                               [CCDelayTime actionWithDuration:3.0f],
//                                                               
//                                                               nil]]];

	
        anim1 = [[CCAnimation animation] retain];
        anim1.delay = 0.09f;
        for( int j = 0; j <= 16; j++) {
            NSString* s = [NSString stringWithFormat:@"12Lisa_v_Dome_%05d.png", j];
//            NSLog(@"s = %@", s);
            [anim1 addFrameWithFilename:s];
        }
        
//        [house runAction: [CCRepeatForever actionWithAction: [CCSequence actions:[CCDelayTime actionWithDuration:3.0f], [CCAnimate actionWithAnimation:anim1 restoreOriginalFrame:NO], nil]]];

        dimX = 810;
        dimY = 630;
        smoke = [[CCSprite spriteWithFile:@"12smoke_0000.png"]retain];
		smoke.position = ccp(dimX, dimY);
		[self addChild:smoke z:5];

		anim2 = [[CCAnimation animation] retain];
        anim2.delay = 0.04f;
        for( int j = 0; j <= 49; j++) {
            NSString* s = [NSString stringWithFormat:@"12smoke_%04d.png", j];
//            NSLog(@"s = %@", s);
            [anim2 addFrameWithFilename:s];
        }

//        [smoke runAction: [CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:anim2 restoreOriginalFrame:NO]]];

        
        bull = [[CCSprite spriteWithFile:@"12bull.png"] retain];
        x = 360;
        y = 340;
		bull.position = ccp(x, y);
        bull.scale = 0.5f;
		[self addChild:bull z:5];
        
//        [bull runAction: [CCRepeatForever actionWithAction: [CCSequence actions:
//                                                             
//                                                             [CCScaleTo actionWithDuration:0.0001f scale:0.5f],
//                                                             [CCScaleTo actionWithDuration:0.5f scale:1.0f],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+10, y+10)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-10, y+10)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+10, y-10)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-10, y-10)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+30, y+30)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-30, y+30)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x+30, y-30)],
//                                                             [CCMoveTo actionWithDuration:0.1f position:ccp(x-30, y-30)],
//
//                                                             [CCDelayTime actionWithDuration:3.0f],
//                                                             
//                                                             nil]]];

        //		CCMenuItemImage* item1 = [CCMenuItemImage itemFromNormalImage:@"next.png" selectedImage:@"next_activ.png" target:self selector:@selector(pCallback1:)];
//        
//		CCMenu* menu = [CCMenu menuWithItems:item1, nil];
//		menu.position = ccp(0,0);
//		item1.position = ccp(size.width - 82, 59);	
//		
//		[self addChild: menu z:500];
        

        bBull = NO;
        bLisa = NO;
        bAdd = NO;
        
        [self start];
	}
	return self;
}

- (void) start {

    [[SimpleAudioEngine sharedEngine] playEffect:@"12_01_VO1.aac"];

    [bull runAction: [CCSequence actions:                
//                      [CCScaleTo actionWithDuration:0.0001f scale:0.5f],
                      [CCScaleTo actionWithDuration:1.0f scale:1.0f],
                      [CCCallFuncN actionWithTarget:self selector:@selector(razblokBull)],
                      nil]];

}

- (void) razblokBull {

    bBull = YES;
}

- (void) revet {
 
    [[SimpleAudioEngine sharedEngine] playEffect:@"12_01_VO2.aac"];
//    for (int i = 0; i < 2; i++) {
    [bull runAction: [CCRepeat actionWithAction:[CCSequence actions: 
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x+10, y+10)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x-10, y+10)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x+10, y-10)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x-10, y-10)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x+30, y+30)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x-30, y+30)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x+30, y-30)],
                      [CCMoveTo actionWithDuration:0.1f position:ccp(x-30, y-30)],
                      [CCCallFuncN actionWithTarget:self selector:@selector(razblokBull)],
                      nil] times:2]];
//    }    
    bLisa = YES;
    

}

- (void) lisa {
    
    
    [house runAction: [CCSequence actions:
//                       [CCDelayTime actionWithDuration:3.0f],
                       [CCAnimate actionWithAnimation:anim1 restoreOriginalFrame:NO],
                       nil]];
    [[SimpleAudioEngine sharedEngine] playEffect:@"Lisa1.aac"];
    
    bAdd = YES;

}

- (void) dim {
 
    [[SimpleAudioEngine sharedEngine] playEffect:@"Dym_iz_truby.aac"];
    [smoke runAction: [CCAnimate actionWithAnimation:anim2 restoreOriginalFrame:NO]];

}

- (void) zayac {
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"Zajka.aac"];
    [rabbit runAction: [CCSequence actions:
                                                           
                                                           [CCFadeTo actionWithDuration:1.8f opacity:0.0f],
                                                           [CCFadeTo actionWithDuration:0.0001f opacity:255],
                                                           [CCDelayTime actionWithDuration:3.0f],
                                                           
                                                           nil]];

    [rabbit_eyes runAction:  [CCSequence actions:
                                                                
                                                                [CCFadeTo actionWithDuration:1.8f opacity:255.0f],
                                                                [CCFadeTo actionWithDuration:0.0001f opacity:0.0f],
                                                                [CCDelayTime actionWithDuration:3.0f],
                                                                
                                                                nil]];

}

- (void) ccTouchesBegan: (NSSet *)touches withEvent: (UIEvent *)event {
 
	for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];		
		location = [[CCDirector sharedDirector] convertToGL: location];		
        NSLog(@"touch x = %f, y = %f",location.x,location.y);
        CGRect r = CGRectMake(x - 300, y - 300, 600, 600);
        if(bBull && CGRectContainsPoint(r, location)) {
        
            [self revet];
        }
        CGRect r1 = CGRectMake(houseX - 100, houseY - 100, 200, 200);
        if(bLisa && CGRectContainsPoint(r1, location)) {
            
            [self lisa];
        }
        CGRect r2 = CGRectMake(dimX - 30, dimY - 150, 60, 60);
        if(bAdd && CGRectContainsPoint(r2, location)) {
            
            [self dim];
        }
        CGRect r3 = CGRectMake(zayacX - 100, zayacY - 100, 200, 200);
        if(bAdd && CGRectContainsPoint(r3, location)) {
            
            [self zayac];
        }

	}
 
 }
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [bull release];
    [house release];
    [smoke release];
    [anim1 release];
    [anim2 release];
    [rabbit release];
    [rabbit_eyes release];
    
	[super dealloc];
}

@end
