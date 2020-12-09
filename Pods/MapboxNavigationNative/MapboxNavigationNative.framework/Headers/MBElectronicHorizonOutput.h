// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(ElectronicHorizonOutput)
__attribute__((visibility ("default")))
@interface MBElectronicHorizonOutput : NSObject

- (nonnull instancetype)initWithHorizon:(nullable NSString *)horizon
                             routeIndex:(uint32_t)routeIndex
                               legIndex:(uint32_t)legIndex
                   remainingLegDistance:(float)remainingLegDistance
                   remainingLegDuration:(NSTimeInterval)remainingLegDuration
                              stepIndex:(uint32_t)stepIndex
                  remainingStepDistance:(float)remainingStepDistance
                  remainingStepDuration:(NSTimeInterval)remainingStepDuration
                             shapeIndex:(uint32_t)shapeIndex
                      intersectionIndex:(uint32_t)intersectionIndex;

@property (nonatomic, readonly, nullable, copy) NSString *horizon;
@property (nonatomic, readonly) uint32_t routeIndex;
@property (nonatomic, readonly) uint32_t legIndex;
@property (nonatomic, readonly) float remainingLegDistance;
@property (nonatomic, readonly) NSTimeInterval remainingLegDuration;
@property (nonatomic, readonly) uint32_t stepIndex;
@property (nonatomic, readonly) float remainingStepDistance;
@property (nonatomic, readonly) NSTimeInterval remainingStepDuration;
@property (nonatomic, readonly) uint32_t shapeIndex;
@property (nonatomic, readonly) uint32_t intersectionIndex;

@end
