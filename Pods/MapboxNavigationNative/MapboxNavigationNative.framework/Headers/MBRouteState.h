// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

typedef NS_CLOSED_ENUM(NSInteger, MBRouteState)
{
    /**
     * We have no route.
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are INVALID.
     */
    MBRouteStateInvalid,
    /**
     * We have initialized route, but haven't started route tracking yet: all route-related fields are valid
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBRouteStateInitialized,
    /**
     * We are on the route: all route-related fields are valid
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBRouteStateTracking,
    /**
     * We've approached to route end: route will be automatically reset (i.e. next `RouteState` is `invalid`)
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBRouteStateComplete,
    /**
     * We've gone of route: route will be automatically reset (i.e. next `RouteState` is `invalid`)
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are INVALID.
     */
    MBRouteStateOffRoute,
    /**
     * We didn't have updates for too much time and route-related fields can be stale.
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBRouteStateStale,
    /**
     * We are probably about to go off-route.
     * All route-related fields(`remainingLegDistance`, `remainingLegDuration`, `stepIndex` etc) are VALID.
     */
    MBRouteStateUncertain
} NS_SWIFT_NAME(RouteState);
