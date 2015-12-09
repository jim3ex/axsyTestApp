// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Picture.m instead.

#import "_Picture.h"

const struct PictureAttributes PictureAttributes = {
	.albumId = @"albumId",
	.id = @"id",
	.imageFullSize = @"imageFullSize",
	.imageThumbnail = @"imageThumbnail",
	.thumbnailURL = @"thumbnailURL",
	.timeStamp = @"timeStamp",
	.title = @"title",
	.url = @"url",
};

const struct PictureRelationships PictureRelationships = {
	.albums = @"albums",
};

@implementation PictureID
@end

@implementation _Picture

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Picture" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Picture";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Picture" inManagedObjectContext:moc_];
}

- (PictureID*)objectID {
	return (PictureID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"albumIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"albumId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic albumId;

- (int32_t)albumIdValue {
	NSNumber *result = [self albumId];
	return [result intValue];
}

- (void)setAlbumIdValue:(int32_t)value_ {
	[self setAlbumId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAlbumIdValue {
	NSNumber *result = [self primitiveAlbumId];
	return [result intValue];
}

- (void)setPrimitiveAlbumIdValue:(int32_t)value_ {
	[self setPrimitiveAlbumId:[NSNumber numberWithInt:value_]];
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

@dynamic imageFullSize;

@dynamic imageThumbnail;

@dynamic thumbnailURL;

@dynamic timeStamp;

@dynamic title;

@dynamic url;

@dynamic albums;

- (NSMutableSet*)albumsSet {
	[self willAccessValueForKey:@"albums"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"albums"];

	[self didAccessValueForKey:@"albums"];
	return result;
}

@end

