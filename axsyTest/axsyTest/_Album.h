// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Album.h instead.

#import <CoreData/CoreData.h>

extern const struct AlbumAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *userId;
} AlbumAttributes;

extern const struct AlbumRelationships {
	__unsafe_unretained NSString *pictures;
	__unsafe_unretained NSString *user;
} AlbumRelationships;

@class Picture;
@class User;

@interface AlbumID : NSManagedObjectID {}
@end

@interface _Album : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AlbumID* objectID;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* userId;

@property (atomic) int32_t userIdValue;
- (int32_t)userIdValue;
- (void)setUserIdValue:(int32_t)value_;

//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *pictures;

- (NSMutableSet*)picturesSet;

@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;

@end

@interface _Album (PicturesCoreDataGeneratedAccessors)
- (void)addPictures:(NSSet*)value_;
- (void)removePictures:(NSSet*)value_;
- (void)addPicturesObject:(Picture*)value_;
- (void)removePicturesObject:(Picture*)value_;

@end

@interface _Album (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSNumber*)primitiveUserId;
- (void)setPrimitiveUserId:(NSNumber*)value;

- (int32_t)primitiveUserIdValue;
- (void)setPrimitiveUserIdValue:(int32_t)value_;

- (NSMutableSet*)primitivePictures;
- (void)setPrimitivePictures:(NSMutableSet*)value;

- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;

@end
