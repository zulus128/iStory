//
//  Page12Layer.m
//  iStrory
//
//  Created by Mac on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Page13Layer.h"


@implementation Page13Layer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Page13Layer *layer = [Page13Layer node];
	
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
        
        CCSprite* bg1 = [CCSprite spriteWithFile:@"13nebo.jpg"];
        bg1.position = ccp(size.width/2, 591);
        [self addChild:bg1 z:0];

        CCSprite* bg = [CCSprite spriteWithFile:@"13Zabor_celiy.png"];
        bg.position = ccp(size.width/2, size.height/2);
        [self addChild:bg z:5];

        CCSprite* bg0 = [CCSprite spriteWithFile:@"13Zabor_dirka.png"];
        bg0.position = ccp(size.width/2, size.height/2);
        bg0.visible = NO;
        [self addChild:bg0 z:5];

        CCSprite* gr = [CCSprite spriteWithFile:@"13grass.png"];
        gr.position = ccp(size.width/2, 69);
        [self addChild:gr z:10];

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
