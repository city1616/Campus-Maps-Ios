// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

@class MBGraphPosition;

NS_SWIFT_NAME(MapMatch)
__attribute__((visibility ("default")))
@interface MBMapMatch : NSObject

- (nonnull instancetype)initWithPosition:(nonnull MBGraphPosition *)position
                                   proba:(float)proba;

@property (nonatomic, readonly, nonnull) MBGraphPosition *position;
/** probability of user is actually on this position */
@property (nonatomic, readonly) float proba;


@end
