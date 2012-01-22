//
//  MNAttributedString.h
//  Mac
//
//  Created by Jeremy Foo on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCIntermediateObjectProtocol.h"

extern NSString *const kMNAttributedStringAttributeAttributKey;
extern NSString *const kMNAttributedStringAttributeRangeKey;

@protocol MNAttributedStringAttributeProtocol <NSObject, NSCoding>
@required
-(NSDictionary *)platformRepresentation;
+(BOOL)isSubstituteForObject:(void *)object;
-(id)initWithObject:(void *)object range:(NSRange)range forAttributedString:(NSAttributedString *)string;
@end

@interface MNAttributedString : NSObject <MNCIntermediateObjectProtocol> {
@private
	NSMutableSet *__substituteClasses;
}

@property (readonly) NSString *string;
@property (readonly) NSArray *attributes;

-(id)initWithAttributedString:(NSAttributedString *)string;
-(NSAttributedString *)attributedString;

-(void)registerSubstituteClass:(Class)cls;
-(void)unregisterSubtituteClass:(Class)cls;

@end
