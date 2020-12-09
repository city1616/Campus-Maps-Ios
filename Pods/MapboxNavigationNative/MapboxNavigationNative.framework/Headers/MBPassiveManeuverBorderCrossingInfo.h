// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBPassiveManeuverAdminInfo;

NS_SWIFT_NAME(PassiveManeuverBorderCrossingInfo)
__attribute__((visibility ("default")))
@interface MBPassiveManeuverBorderCrossingInfo : NSObject

- (nonnull instancetype)initWithFrom:(nonnull MBPassiveManeuverAdminInfo *)from
                                  to:(nonnull MBPassiveManeuverAdminInfo *)to;

@property (nonatomic, readonly, nonnull) MBPassiveManeuverAdminInfo *from;
@property (nonatomic, readonly, nonnull) MBPassiveManeuverAdminInfo *to;

@end
