// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBRouteState.h"

@class MBActiveGuidanceInfo;
@class MBBannerInstruction;
@class MBElectronicHorizonOutput;
@class MBFixLocation;
@class MBMapMatcherOutput;
@class MBUpcomingPassiveManeuver;
@class MBVoiceInstruction;

NS_SWIFT_NAME(NavigationStatus)
__attribute__((visibility ("default")))
@interface MBNavigationStatus : NSObject

- (nonnull instancetype)initWithRouteState:(MBRouteState)routeState
                                  location:(nonnull MBFixLocation *)location
                                routeIndex:(uint32_t)routeIndex
                                  legIndex:(uint32_t)legIndex
                      remainingLegDistance:(float)remainingLegDistance
                      remainingLegDuration:(NSTimeInterval)remainingLegDuration
                                 stepIndex:(uint32_t)stepIndex
                     remainingStepDistance:(float)remainingStepDistance
                     remainingStepDuration:(NSTimeInterval)remainingStepDuration
                              stateMessage:(nonnull NSString *)stateMessage
                                  inTunnel:(BOOL)inTunnel
                                 predicted:(NSTimeInterval)predicted
                                shapeIndex:(uint32_t)shapeIndex
                         intersectionIndex:(uint32_t)intersectionIndex
                                  roadName:(nonnull NSString *)roadName
                          voiceInstruction:(nullable MBVoiceInstruction *)voiceInstruction
                         bannerInstruction:(nullable MBBannerInstruction *)bannerInstruction
                         electronicHorizon:(nonnull MBElectronicHorizonOutput *)electronicHorizon
                                key_points:(nonnull NSArray<MBFixLocation *> *)key_points
                        map_matcher_output:(nonnull MBMapMatcherOutput *)map_matcher_output
                              offRoadProba:(float)offRoadProba
                        activeGuidanceInfo:(nullable MBActiveGuidanceInfo *)activeGuidanceInfo
                  upcomingPassiveManeuvers:(nonnull NSArray<MBUpcomingPassiveManeuver *> *)upcomingPassiveManeuvers;

@property (nonatomic, readonly) MBRouteState routeState;
@property (nonatomic, readonly, nonnull) MBFixLocation *location;
@property (nonatomic, readonly) uint32_t routeIndex;
@property (nonatomic, readonly) uint32_t legIndex;
@property (nonatomic, readonly) float remainingLegDistance;
@property (nonatomic, readonly) NSTimeInterval remainingLegDuration;
@property (nonatomic, readonly) uint32_t stepIndex;
@property (nonatomic, readonly) float remainingStepDistance;
@property (nonatomic, readonly) NSTimeInterval remainingStepDuration;
@property (nonatomic, readonly, nonnull, copy) NSString *stateMessage;
@property (nonatomic, readonly, getter=isInTunnel) BOOL inTunnel;
@property (nonatomic, readonly) NSTimeInterval predicted;
@property (nonatomic, readonly) uint32_t shapeIndex;
@property (nonatomic, readonly) uint32_t intersectionIndex;
@property (nonatomic, readonly, nonnull, copy) NSString *roadName;
@property (nonatomic, readonly, nullable) MBVoiceInstruction *voiceInstruction;
@property (nonatomic, readonly, nullable) MBBannerInstruction *bannerInstruction;
@property (nonatomic, readonly, nonnull) MBElectronicHorizonOutput *electronicHorizon;
/**
 * Contains key points(for example corners) of route shape passed by pack between `getStatus` calls.
 * For now can be used in route mode only, always contain at least one point besides the very first `getStatus` call.
 * Only `coordinate`, ``bearing`, `monotonicTimestampNanoseconds` and `time` fields are filled. Last point is always the same as `location`.
 */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBFixLocation *> *key_points;

/** Output of map matcher on this status. */
@property (nonatomic, readonly, nonnull) MBMapMatcherOutput *map_matcher_output;

/**
 * Probability of vehicle to be off-road:
 * 1.0 - vehicle is definitely off-road, 0.0 - vehicle is definitely on-road
 */
@property (nonatomic, readonly) float offRoadProba;

/** Will be empty if we are in free-drive now(i.e. routeState == invalid) */
@property (nonatomic, readonly, nullable) MBActiveGuidanceInfo *activeGuidanceInfo;

/** Array of upcoming passive maneuvers, doesn't contain passive maneuvers that were already passed by user */
@property (nonatomic, readonly, nonnull, copy) NSArray<MBUpcomingPassiveManeuver *> *upcomingPassiveManeuvers;


@end
