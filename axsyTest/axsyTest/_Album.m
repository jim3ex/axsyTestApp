// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Album.m instead.

#import "_Album.h"

const struct AlbumAttributes AlbumAttributes = {
	.id = @"id",
	.title = @"title",
	.userId = @"userId",
};

const struct AlbumRelationships AlbumRelationships = {
	.pictures = @"pictures",
	.user = @"user",
};

@implementation AlbumID
@end

@implementation _Album

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Album" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Album";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Album" inManagedObjectContext:moc_];
}

- (AlbumID*)objectID {
	return (AlbumID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"userIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"userId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic id;

- (int32_t)idValue {
	NSNumber *result = [self id];
	return [result intValue];
}

- (void)setIdValue:(int32_t)value_ {
	[self setId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result intValue];
}

- (void)setPrimitiveIdValue:(int32_t)value_ {
	[self setPrimitiveId:[NSNumber numberWithInt:value_]];
}

@dynamic title;

@dynamic userId;

- (int32_t)userIdValue {
	NSNumber *result = [self userId];
	return [result intValue];
}

- (void)setUserIdValue:(int32_t)value_ {
	[self setUserId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUserIdValue {
	NSNumber *result = [self primitiveUserId];
	return [result intValue];
}

- (void)setPrimitiveUserIdValue:(int32_t)value_ {
	[self setPrimitiveUserId:[NSNumber numberWithInt:value_]];
}

@dynamic pictures;

- (NSMutableSet*)picturesSet {
	[self willAccessValueForKey:@"pictures"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"pictures"];

	[self didAccessValueForKey:@"pictures"];
	return result;
}

@dynamic user;

@end

