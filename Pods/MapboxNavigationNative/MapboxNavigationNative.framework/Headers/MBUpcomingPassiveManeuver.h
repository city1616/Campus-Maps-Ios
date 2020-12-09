// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBPassiveManeuver;

NS_SWIFT_NAME(UpcomingPassiveManeuver)
__attribute__((visibility ("default")))
@interface MBUpcomingPassiveManeuver : NSObject

- (nonnull instancetype)initWithManeuver:(nonnull MBPassiveManeuver *)maneuver
                         distanceToStart:(double)distanceToStart;

/** passive maneuver */
@property (nonatomic, readonly, nonnull) MBPassiveManeuver *maneuver;

/**
 * distance from current position to maneuver (m),
 * can be negative if it is a spanned maneuver and we are somewhere in the middle
 */
@property (nonatomic, readonly) double distanceToStart;


@end
