// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBPassiveManeuverType.h"
#import <CoreLocation/CoreLocation.h>

@class MBPassiveManeuverBorderCrossingInfo;
@class MBPassiveManeuverIncidentInfo;
@class MBPassiveManeuverServiceAreaInfo;
@class MBPassiveManeuverTollCollectionInfo;
@class MBPassiveManeuverTunnelInfo;

NS_SWIFT_NAME(PassiveManeuver)
__attribute__((visibility ("default")))
@interface MBPassiveManeuver : NSObject

- (nonnull instancetype)initWithType:(MBPassiveManeuverType)type
                            distance:(double)distance
                              length:(nullable NSNumber *)length
                     beginCoordinate:(CLLocationCoordinate2D)beginCoordinate
                  beginGeometryIndex:(uint32_t)beginGeometryIndex
                       endCoordinate:(CLLocationCoordinate2D)endCoordinate
                    endGeometryIndex:(uint32_t)endGeometryIndex
                        incidentInfo:(nullable MBPassiveManeuverIncidentInfo *)incidentInfo
                          tunnelInfo:(nullable MBPassiveManeuverTunnelInfo *)tunnelInfo
                  borderCrossingInfo:(nullable MBPassiveManeuverBorderCrossingInfo *)borderCrossingInfo
                  tollCollectionInfo:(nullable MBPassiveManeuverTollCollectionInfo *)tollCollectionInfo
                     serviceAreaInfo:(nullable MBPassiveManeuverServiceAreaInfo *)serviceAreaInfo;

/** type */
@property (nonatomic, readonly) MBPassiveManeuverType type;

/** distance to passive maneuver relative to start of route */
@property (nonatomic, readonly) double distance;

/** will be non-null for composite passive maneuvers */
@property (nonatomic, readonly, nullable) NSNumber *length;

/** coordinate of passive maneuver start */
@property (nonatomic, readonly) CLLocationCoordinate2D beginCoordinate;

/** index of passive maneuver start in route geometry */
@property (nonatomic, readonly) uint32_t beginGeometryIndex;

/** coordinate of passive maneuver end */
@property (nonatomic, readonly) CLLocationCoordinate2D endCoordinate;

/** index of passive maneuver end in route geometry */
@property (nonatomic, readonly) uint32_t endGeometryIndex;

/** incident info if it's incident */
@property (nonatomic, readonly, nullable) MBPassiveManeuverIncidentInfo *incidentInfo;

/** tunnel info if it's tunnel */
@property (nonatomic, readonly, nullable) MBPassiveManeuverTunnelInfo *tunnelInfo;

/** border crossing info if it's border crossing */
@property (nonatomic, readonly, nullable) MBPassiveManeuverBorderCrossingInfo *borderCrossingInfo;

/** toll collection info if it's toll collection */
@property (nonatomic, readonly, nullable) MBPassiveManeuverTollCollectionInfo *tollCollectionInfo;

/** service area info it it's service area */
@property (nonatomic, readonly, nullable) MBPassiveManeuverServiceAreaInfo *serviceAreaInfo;


@end
