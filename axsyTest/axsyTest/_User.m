// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.addCity = @"addCity",
	.addLat = @"addLat",
	.addLng = @"addLng",
	.addStreet = @"addStreet",
	.addSuite = @"addSuite",
	.addZipcode = @"addZipcode",
	.companyBs = @"companyBs",
	.companyCatchPhrase = @"companyCatchPhrase",
	.companyName = @"companyName",
	.email = @"email",
	.id = @"id",
	.name = @"name",
	.phone = @"phone",
	.username = @"username",
	.web = @"web",
};

const struct UserRelationships UserRelationships = {
	.albums = @"albums",
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic addCity;

@dynamic addLat;

@dynamic addLng;

@dynamic addStreet;

@dynamic addSuite;

@dynamic addZipcode;

@dynamic companyBs;

@dynamic companyCatchPhrase;

@dynamic companyName;

@dynamic email;

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

@dynamic name;

@dynamic phone;

@dynamic username;

@dynamic web;

@dynamic albums;

- (NSMutableSet*)albumsSet {
	[self willAccessValueForKey:@"albums"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"albums"];

	[self didAccessValueForKey:@"albums"];
	return result;
}

@end

