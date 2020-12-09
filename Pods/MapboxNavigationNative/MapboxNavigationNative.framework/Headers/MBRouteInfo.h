// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBPassiveManeuver;

NS_SWIFT_NAME(RouteInfo)
__attribute__((visibility ("default")))
@interface MBRouteInfo : NSObject

- (nonnull instancetype)initWithPassiveManeuvers:(nonnull NSArray<MBPassiveManeuver *> *)passiveManeuvers;

@property (nonatomic, readonly, nonnull, copy) NSArray<MBPassiveManeuver *> *passiveManeuvers;

@end
