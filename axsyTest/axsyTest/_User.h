// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>

extern const struct UserAttributes {
	__unsafe_unretained NSString *addCity;
	__unsafe_unretained NSString *addLat;
	__unsafe_unretained NSString *addLng;
	__unsafe_unretained NSString *addStreet;
	__unsafe_unretained NSString *addSuite;
	__unsafe_unretained NSString *addZipcode;
	__unsafe_unretained NSString *companyBs;
	__unsafe_unretained NSString *companyCatchPhrase;
	__unsafe_unretained NSString *companyName;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *username;
	__unsafe_unretained NSString *web;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *albums;
} UserRelationships;

@class Album;

@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) UserID* objectID;

@property (nonatomic, strong) NSString* addCity;

//- (BOOL)validateAddCity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* addLat;

//- (BOOL)validateAddLat:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* addLng;

//- (BOOL)validateAddLng:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* addStreet;

//- (BOOL)validateAddStreet:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* addSuite;

//- (BOOL)validateAddSuite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* addZipcode;

//- (BOOL)validateAddZipcode:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* companyBs;

//- (BOOL)validateCompanyBs:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* companyCatchPhrase;

//- (BOOL)validateCompanyCatchPhrase:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* companyName;

//- (BOOL)validateCompanyName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* email;

//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* phone;

//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* username;

//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* web;

//- (BOOL)validateWeb:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *albums;

- (NSMutableSet*)albumsSet;

@end

@interface _User (AlbumsCoreDataGeneratedAccessors)
- (void)addAlbums:(NSSet*)value_;
- (void)removeAlbums:(NSSet*)value_;
- (void)addAlbumsObject:(Album*)value_;
- (void)removeAlbumsObject:(Album*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddCity;
- (void)setPrimitiveAddCity:(NSString*)value;

- (NSString*)primitiveAddLat;
- (void)setPrimitiveAddLat:(NSString*)value;

- (NSString*)primitiveAddLng;
- (void)setPrimitiveAddLng:(NSString*)value;

- (NSString*)primitiveAddStreet;
- (void)setPrimitiveAddStreet:(NSString*)value;

- (NSString*)primitiveAddSuite;
- (void)setPrimitiveAddSuite:(NSString*)value;

- (NSString*)primitiveAddZipcode;
- (void)setPrimitiveAddZipcode:(NSString*)value;

- (NSString*)primitiveCompanyBs;
- (void)setPrimitiveCompanyBs:(NSString*)value;

- (NSString*)primitiveCompanyCatchPhrase;
- (void)setPrimitiveCompanyCatchPhrase:(NSString*)value;

- (NSString*)primitiveCompanyName;
- (void)setPrimitiveCompanyName:(NSString*)value;

- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;

- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;

- (NSString*)primitiveWeb;
- (void)setPrimitiveWeb:(NSString*)value;

- (NSMutableSet*)primitiveAlbums;
- (void)setPrimitiveAlbums:(NSMutableSet*)value;

@end
