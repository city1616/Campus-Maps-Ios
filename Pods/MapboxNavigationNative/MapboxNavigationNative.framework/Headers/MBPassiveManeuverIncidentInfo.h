// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBPassiveManeuverIncidentType.h"

NS_SWIFT_NAME(PassiveManeuverIncidentInfo)
__attribute__((visibility ("default")))
@interface MBPassiveManeuverIncidentInfo : NSObject

- (nonnull instancetype)initWithId:(uint32_t)id
                              type:(MBPassiveManeuverIncidentType)type;

/** id of incident */
@property (nonatomic, readonly) uint32_t id;

/** type of incident */
@property (nonatomic, readonly) MBPassiveManeuverIncidentType type;


@end
