// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Picture.h instead.

#import <CoreData/CoreData.h>

extern const struct PictureAttributes {
	__unsafe_unretained NSString *albumId;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *imageFullSize;
	__unsafe_unretained NSString *imageThumbnail;
	__unsafe_unretained NSString *thumbnailURL;
	__unsafe_unretained NSString *timeStamp;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *url;
} PictureAttributes;

extern const struct PictureRelationships {
	__unsafe_unretained NSString *albums;
} PictureRelationships;

@class Album;

@interface PictureID : NSManagedObjectID {}
@end

@interface _Picture : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PictureID* objectID;

@property (nonatomic, strong) NSNumber* albumId;

@property (atomic) int32_t albumIdValue;
- (int32_t)albumIdValue;
- (void)setAlbumIdValue:(int32_t)value_;

//- (BOOL)validateAlbumId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int32_t idValue;
- (int32_t)idValue;
- (void)setIdValue:(int32_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* imageFullSize;

//- (BOOL)validateImageFullSize:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* imageThumbnail;

//- (BOOL)validateImageThumbnail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* thumbnailURL;

//- (BOOL)validateThumbnailURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* timeStamp;

//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* url;

//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *albums;

- (NSMutableSet*)albumsSet;

@end

@interface _Picture (AlbumsCoreDataGeneratedAccessors)
- (void)addAlbums:(NSSet*)value_;
- (void)removeAlbums:(NSSet*)value_;
- (void)addAlbumsObject:(Album*)value_;
- (void)removeAlbumsObject:(Album*)value_;

@end

@interface _Picture (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAlbumId;
- (void)setPrimitiveAlbumId:(NSNumber*)value;

- (int32_t)primitiveAlbumIdValue;
- (void)setPrimitiveAlbumIdValue:(int32_t)value_;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int32_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int32_t)value_;

- (NSData*)primitiveImageFullSize;
- (void)setPrimitiveImageFullSize:(NSData*)value;

- (NSData*)primitiveImageThumbnail;
- (void)setPrimitiveImageThumbnail:(NSData*)value;

- (NSString*)primitiveThumbnailURL;
- (void)setPrimitiveThumbnailURL:(NSString*)value;

- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;

- (NSMutableSet*)primitiveAlbums;
- (void)setPrimitiveAlbums:(NSMutableSet*)value;

@end
