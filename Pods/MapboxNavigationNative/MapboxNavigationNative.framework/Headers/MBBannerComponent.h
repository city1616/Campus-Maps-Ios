// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(BannerComponent)
__attribute__((visibility ("default")))
@interface MBBannerComponent : NSObject

- (nonnull instancetype)initWithType:(nonnull NSString *)type
                                text:(nonnull NSString *)text
                                abbr:(nullable NSString *)abbr
                        abbrPriority:(nullable NSNumber *)abbrPriority
                        imageBaseurl:(nullable NSString *)imageBaseurl
                              active:(nullable NSNumber *)active
                          directions:(nullable NSArray<NSString *> *)directions;

@property (nonatomic, readonly, nonnull, copy) NSString *type;
@property (nonatomic, readonly, nonnull, copy) NSString *text;
@property (nonatomic, readonly, nullable, copy) NSString *abbr;
@property (nonatomic, readonly, nullable) NSNumber *abbrPriority;
@property (nonatomic, readonly, nullable, copy) NSString *imageBaseurl;
@property (nonatomic, readonly, nullable) NSNumber *active;
@property (nonatomic, readonly, nullable, copy) NSArray<NSString *> *directions;

@end
