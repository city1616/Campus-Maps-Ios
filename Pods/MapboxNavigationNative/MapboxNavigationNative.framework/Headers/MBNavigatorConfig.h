// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(NavigatorConfig)
__attribute__((visibility ("default")))
@interface MBNavigatorConfig : NSObject

- (nonnull instancetype)initWithVoiceInstructionThreshold:(nullable NSNumber *)voiceInstructionThreshold;

/**
 * The threshold at which we will return a voice instruction after current progress has passed it.
 * Pass null to use default value.
 */
@property (nonatomic, readwrite, nullable) NSNumber *voiceInstructionThreshold;


@end
