// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import "MBXHttpMethod.h"

@class MBXUserAgentComponents;

/** @brief HttpRequest holds basic information for construction of an HTTP request */
NS_SWIFT_NAME(HttpRequest)
__attribute__((visibility ("default")))
@interface MBXHttpRequest : NSObject

- (nonnull instancetype)initWithUrl:(nonnull NSString *)url
                            headers:(nonnull NSDictionary<NSString *, NSString *> *)headers
                userAgentComponents:(nonnull MBXUserAgentComponents *)userAgentComponents
                               body:(nonnull NSData *)body;

- (nonnull instancetype)initWithMethod:(MBXHttpMethod)method
                                   url:(nonnull NSString *)url
                               headers:(nonnull NSDictionary<NSString *, NSString *> *)headers
                       keepCompression:(BOOL)keepCompression
                   userAgentComponents:(nonnull MBXUserAgentComponents *)userAgentComponents
                                  body:(nonnull NSData *)body;

/**
 * HTTP defines a set of request methods to indicate the desired action to be performed for a given resource.
 * Specify desired method using this parameter.
 */
@property (nonatomic, readwrite) MBXHttpMethod method;

/** URL the request should be sent to */
@property (nonatomic, readonly, nonnull, copy) NSString *url;

/** HTTP headers to include */
@property (nonatomic, readwrite, nonnull, copy) NSDictionary<NSString *, NSString *> *headers;

/** Optional compression flag. If present and set to true, responses will not be automatically decompressed. */
@property (nonatomic, readonly, getter=isKeepCompression) BOOL keepCompression;

/** Application and SDK information for generating a User-Agent string. */
@property (nonatomic, readonly, nonnull) MBXUserAgentComponents *userAgentComponents;

/**
 * HTTP Body data transmitted in an HTTP transaction message immediatelly following the headers if there is any.
 * Body data is used by POST HTTP methods.
 */
@property (nonatomic, readonly, nonnull) NSData *body;


@end
