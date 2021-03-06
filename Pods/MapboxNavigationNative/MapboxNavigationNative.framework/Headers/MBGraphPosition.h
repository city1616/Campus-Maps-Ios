// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(GraphPosition)
__attribute__((visibility ("default")))
@interface MBGraphPosition : NSObject

- (nonnull instancetype)initWithEdgeId:(uint64_t)edgeId
                          percentAlong:(float)percentAlong;

/** Edge id in road graph */
@property (nonatomic, readonly) uint64_t edgeId;

/** Percent along edge shape (0-1) */
@property (nonatomic, readonly) float percentAlong;


@end
