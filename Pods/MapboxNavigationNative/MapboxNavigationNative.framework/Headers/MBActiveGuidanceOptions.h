// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBActiveGuidanceGeometryEncoding.h"
#import "MBActiveGuidanceMode.h"

NS_SWIFT_NAME(ActiveGuidanceOptions)
__attribute__((visibility ("default")))
@interface MBActiveGuidanceOptions : NSObject

- (nonnull instancetype)initWithMode:(MBActiveGuidanceMode)mode
                    geometryEncoding:(MBActiveGuidanceGeometryEncoding)geometryEncoding;

/** Indicates active guidance mode: driving, walking or cycling */
@property (nonatomic, readonly) MBActiveGuidanceMode mode;

/** Indicates geometry encoding */
@property (nonatomic, readonly) MBActiveGuidanceGeometryEncoding geometryEncoding;


@end
