//
//  MNASUnderlineColor.m
//  Mac
//
//  Created by Jeremy Foo on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MNASUnderlineColor.h"

@implementation MNASUnderlineColor
@synthesize color = _color;

#pragma mark - NSCoding Protocol

-(id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super init])) {
		_color = [[aDecoder decodeObjectForKey:@"color"] retain];
	}
	
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.color forKey:@"color"];
}

#pragma mark - MNAttributedStringAttribute Protocol

+(BOOL)isSubstituteForObject:(void *)object {
#if TARGET_OS_IPHONE
	return [(id)object isEqualToString:(NSString *)kCTUnderlineColorAttributeName];
#else
	return [(id)object isEqualToString:NSUnderlineColorAttributeName];
#endif
}

-(id)initWithObject:(void *)object range:(NSRange)range forAttributedString:(NSAttributedString *)string {
	if ((self = [super init])) {
		_color = [[MNColor alloc] initWithSubsituteObject:object];
	}	
	return self;
}

-(NSDictionary *)platformRepresentation {
#if TARGET_OS_IPHONE
	CFStringRef keys[] = { kCTUnderlineColorAttributeName };
	CFTypeRef values[] = { [[self.color platformRepresentation] CGColor] };
	
	return [(NSDictionary *)CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys , (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks) autorelease];	
#else
	return [NSDictionary dictionaryWithObject:[self.color platformRepresentation] forKey:NSUnderlineColorAttributeName];
#endif
}

-(void)dealloc {
	[_color release], _color = nil;
	[super dealloc];
}


@end