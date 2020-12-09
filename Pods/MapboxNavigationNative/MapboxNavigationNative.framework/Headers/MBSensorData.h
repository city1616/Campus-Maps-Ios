// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBSensorType.h"

NS_SWIFT_NAME(SensorData)
__attribute__((visibility ("default")))
@interface MBSensorData : NSObject

- (nonnull instancetype)initWithSensorType:(MBSensorType)sensorType
                                 timestamp:(nonnull NSDate *)timestamp
                          elapsedTimeNanos:(uint64_t)elapsedTimeNanos
                                    values:(nonnull NSArray<NSNumber *> *)values;

@property (nonatomic, readonly) MBSensorType sensorType;
@property (nonatomic, readonly, nonnull) NSDate *timestamp;
@property (nonatomic, readonly) uint64_t elapsedTimeNanos;
@property (nonatomic, readonly, nonnull, copy) NSArray<NSNumber *> *values;

@end
