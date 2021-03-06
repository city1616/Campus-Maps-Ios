// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

/** @brief Enum representing state of download session. */
typedef NS_CLOSED_ENUM(NSInteger, MBXDownloadState)
{
    /** Download session initiated but not started yet. */
    MBXDownloadStatePending,
    /** Download session is in progress. */
    MBXDownloadStateDownloading,
    /** Download session failed. */
    MBXDownloadStateFailed,
    /** Download session successfully finished. */
    MBXDownloadStateFinished
} NS_SWIFT_NAME(DownloadState);
