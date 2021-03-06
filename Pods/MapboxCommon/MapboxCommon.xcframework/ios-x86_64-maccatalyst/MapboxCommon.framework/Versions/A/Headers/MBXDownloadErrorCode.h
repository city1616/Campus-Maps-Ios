// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** Enum which represents different error cases which could happen during download session. */
typedef NS_CLOSED_ENUM(NSInteger, MBXDownloadErrorCode)
{
    /** General filesystem related error code. For cases like: write error, no such file or directory, not enough space and etc. */
    MBXDownloadErrorCodeFileSystemError,
    /** General network related error. Should be probably representation of HttpRequestError. */
    MBXDownloadErrorCodeNetworkError
} NS_SWIFT_NAME(DownloadErrorCode);
