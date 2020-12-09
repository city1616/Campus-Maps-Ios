// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBProfileApplication.h"
#import "MBProfilePlatform.h"

NS_SWIFT_NAME(SettingsProfile)
__attribute__((visibility ("default")))
@interface MBSettingsProfile : NSObject

- (nonnull instancetype)initWithApplication:(MBProfileApplication)application
                                   platform:(MBProfilePlatform)platform;

@property (nonatomic, readonly) MBProfileApplication application;
@property (nonatomic, readonly) MBProfilePlatform platform;

@end
