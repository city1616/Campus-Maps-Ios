// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBActiveGuidanceProgress;

NS_SWIFT_NAME(ActiveGuidanceInfo)
__attribute__((visibility ("default")))
@interface MBActiveGuidanceInfo : NSObject

- (nonnull instancetype)initWithRouteProgress:(nonnull MBActiveGuidanceProgress *)routeProgress
                                  legProgress:(nonnull MBActiveGuidanceProgress *)legProgress
                                 stepProgress:(nonnull MBActiveGuidanceProgress *)stepProgress;

/** Progress of current route */
@property (nonatomic, readonly, nonnull) MBActiveGuidanceProgress *routeProgress;

/** Progress of current leg */
@property (nonatomic, readonly, nonnull) MBActiveGuidanceProgress *legProgress;

/** Progress of current step */
@property (nonatomic, readonly, nonnull) MBActiveGuidanceProgress *stepProgress;


@end
