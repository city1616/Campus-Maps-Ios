// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class MBActiveGuidanceOptions;
@class MBBannerInstruction;
@class MBFixLocation;
@class MBNavigationStatus;
@class MBNavigatorConfig;
@class MBRouteInfo;
@class MBRouterResult;
@class MBSensorData;
@class MBSettingsProfile;
@class MBTilesConfig;
@class MBVoiceInstruction;

NS_SWIFT_NAME(Navigator)
__attribute__((visibility ("default")))
@interface MBNavigator : NSObject

/**
 * Constructs navigator object with chosen configuration
 *
 * @param profile       Indication for a settings profile for default
 * @param config        Config with well-established parameters suitable for most of the users
 * @param customConfig  JSON with parameters that may override some defaults from a profile
 * @param tilesConfig   Configuration for tiles host, version, cache folder etc.
 */
- (nonnull instancetype)initWithProfile:(nonnull MBSettingsProfile *)profile
                                 config:(nonnull MBNavigatorConfig *)config
                           customConfig:(nonnull NSString *)customConfig
                            tilesConfig:(nonnull MBTilesConfig *)tilesConfig;

/**
 * Sets the route path for the navigator to process.
 * Returns `true` if no errors occurred; otherwise returns `false`
 * @param  routeResponse  A string containing a json/pbf route response.
 * @param  route    Which route to follow
 * @param  leg      Which leg to follow
 * @param  options  Additional options related to this route
 * @return filled `RouteInfo` on success, nullopt on failure
 */
- (nullable MBRouteInfo *)setRouteForRouteResponse:(nonnull NSString *)routeResponse
                                             route:(uint32_t)route
                                               leg:(uint32_t)leg
                                           options:(nonnull MBActiveGuidanceOptions *)options __attribute((ns_returns_retained));
/** Caches tiles around last set route */
- (void)cacheLastRoute;
/**
 * Downloads tiles of all levels that intersect the rectangular region
 * and stores them to disk. The area is described by the bounding box.
 * After the tiles are downloaded, it should be possible to do
 * off-line routing in the pre-fetched region.
 *
 * @param  lowerLeft    south-west corner of bounding box (long, lat)
 * @param  upperRight   north-east corner of bounding box (long, lat)
 */
- (void)prefetchBoundingBoxForLowerLeft:(CLLocationCoordinate2D)lowerLeft
                             upperRight:(CLLocationCoordinate2D)upperRight;
/**
 * Updates annotations so that subsequent calls to getStatus will
 * reflect the most current annotations for the route
 *
 * @param  annotations  A string containing the json/pbf annotations
 * @param  route  Which route to apply the annotation update to
 * @param  leg    Which leg to apply the annotation update to
 *
 * @return  True if the annotations could be updated false if not (wrong number of annotations)
 */
- (BOOL)updateAnnotationsForRouteResponse:(nonnull NSString *)routeResponse
                                    route:(uint32_t)route
                                      leg:(uint32_t)leg;
/**
 * Passes in the current fix location of the user.
 *
 * @param  fix  The current fix location of user.
 *
 * @return true if the fix location was usable false if not
 */
- (BOOL)updateLocationForFixLocation:(nonnull MBFixLocation *)fixLocation;
/**
 * Passes in the current sensor data of the user.
 *
 * @param  data  The current sensor data of user.
 *
 * @return true if the sensor data was usable false if not
 */
- (BOOL)updateSensorDataForSensorData:(nonnull MBSensorData *)sensorData;
/**
 * Gets the status as an offset in time from the last fix location provided. This
 * allows the caller to get hallucinated statuses in the future along the route if
 * for some reason (poor reception) they aren't able to get fix locations into the
 * Navigator.
 *
 * This method will use previous fixes to find snap the users location to the route
 * and verify that the user is still on the route. Also, this method will determine
 * if an instruction needs to be called out for the user.
 *
 * TODO: explain more of the info in the NavigationStatus
 *
 * @param   timestamp point in time when you wish to receive the status for.
 *          It will be silently increased by the value of lookAheadTimeMs from
 *          NavigatorConfig. You can set it to desired value before calling
 *          getStatus to get any look-ahead time.
 *
 * @return  the last status as a result of fix location updates.  If the timestamp
 *          is earlier than previously reported timestamp in the status, the last
 *          status will be returned, the function does not support re-winding time.
 */
- (nonnull MBNavigationStatus *)getStatusForTimestamp:(nonnull NSDate *)timestamp __attribute((ns_returns_retained));
/**
 * Gets the status as an offset in time from the last fix location provided. This
 * allows the caller to get hallucinated statuses in the future along the route if
 * for some reason (poor reception) they aren't able to get fix locations into the
 * Navigator.
 *
 * This method will use previous fixes to find snap the users location to the route
 * and verify that the user is still on the route. Also, this method will determine
 * if an instruction needs to be called out for the user.
 *
 *
 * @param   monotonic(i.e. each new value is greater than previous one) timestamp
 *          point in time when you wish to receive the status for.
 *          If on some platform monotonic time is not provided by system then using
 *          of non-monotonic clock is allowed, but if time decreased at some point
 *          last status will be returned. The same time source must be used for
 *          this timestamp and `FixLocation::monotonicTimestamp`.
 *          Measured in nanoseconds.
 *
 * @return  the last status as a result of fix location updates.  If the timestamp
 *          is earlier than previously reported timestamp in the status, the last
 *          status will be returned, the function does not support re-winding time.
 */
- (nonnull MBNavigationStatus *)getStatusForMonotonicTimestampNanoseconds:(int64_t)monotonicTimestampNanoseconds __attribute((ns_returns_retained));
/**
 * Gets the banner at a specific step index in the route. If there is no
 * banner at the specified index, we will do something.
 */
- (nullable MBBannerInstruction *)getBannerInstructionForIndexInRoute:(uint32_t)indexInRoute __attribute((ns_returns_retained));
/**
 * Gets the voice instruction at a specific step index in the route. If there is no
 * voice instruction at the specified index, we will do something.
 */
- (nullable MBVoiceInstruction *)getVoiceInstructionForIndexInRoute:(uint32_t)indexInRoute __attribute((ns_returns_retained));
/**
 * Gets the geometry object for the currently established route.
 * If a route has not been provided, it will return std::experimental::nullopt.
 *
 */
- (nullable NSArray<CLLocation *> *)getRouteGeometry __attribute((ns_returns_retained));
/**
 * Gets the bounding box of the geometry object for the currently established route
 * It will return a vector of points with a length of 2 where the first point holds
 * the minX and minY and the second point holds the maxX and maxY
 * If a route has not been provided, it will return std::experimental::nullopt.
 */
- (nullable NSArray<CLLocation *> *)getRouteBoundingBox __attribute((ns_returns_retained));
/**
 * Gets a polygon around the currently loaded route. The method uses a bitmap approach
 * in which you specify a grid size (pixel size) and a dilation (how many pixels) to
 * expand the initial grid cells that are intersected by the route. In this way we can
 * approximate st_buffer very efficiently even for large complex geometries
 *
 * @param grid_size           the size of the individual grid cells
 * @param dilation            the number of pixels to dilate the initial intersection by it can
 *                            be thought of as controlling the halo thickness around the route
 * @param feature_collection  whether or not to return a feature collection or just the geometry
 * @return a geojson representing the route buffer polygon
 */
- (nullable NSString *)getRouteBufferGeoJsonForGrid_size:(float)grid_size
                                                dilation:(uint16_t)dilation __attribute((ns_returns_retained));
/**
 * Gets last location predicted by Kalman filter.
 * If navigatorEKF is not initialized, it will return std::experimental::nullopt.
 */
- (nullable MBFixLocation *)getKalmanFixLocation __attribute((ns_returns_retained));
/**
 * Gets the history of state changing calls to the navigator this can be used to
 * replay a sequence of events for the purpose of bug fixing
 * @return  a json representing the series of events that happened since the last time
 *          history was toggled on
 */
- (nonnull NSString *)getHistory __attribute((ns_returns_retained));
/**
 * Toggles the recording of history on or off
 * @param  onOff  set this to true to turn on history recording and false to turn it off
 *                toggling will reset all history call getHistory first before toggling
 *                to retain a copy
 */
- (void)toggleHistoryForOnOff:(BOOL)onOff;
/**
 * Adds a custom event to the navigators history. This can be useful to log things that
 * happen during navigation that are specific to your application.
 * @param  eventType  the event type in the events log for your custom even
 * @param  eventJson  the json to attach to the "properties" key of the event
 *
 * @return the event index of the newly inserted custom event, will return -1 if history
 * is toggled off or the event_type is reserved or if the event_json is malformed
 */
- (void)pushHistoryForEventType:(nonnull NSString *)eventType
                      eventJson:(nonnull NSString *)eventJson;
/**
 * Follows a new route and leg of the already loaded directions
 * Returns a initialized route state if no errors occurred
 * otherwise, it returns a invalid route state.
 *
 * @param route  new route id
 * @param leg    new leg id
 *
 * @return `true` on success, otherwise `false`
 */
- (BOOL)changeRouteLegForRoute:(uint32_t)route
                           leg:(uint32_t)leg;
/**
 * Uses libvalhalla and local tile data to generate mapbox-directions-api-like json
 *
 * @param   directionsUri  the uri used when hitting the http service
 * @return  a RouterResult object with the json and a success/fail bool
 */
- (nonnull MBRouterResult *)getRouteForDirectionsUri:(nonnull NSString *)directionsUri __attribute((ns_returns_retained));
/**
 * Passes in an input path to the tar file and output path.
 *
 * @param  packedTilesPath  The path to the packed tiles.
 * @param  outputDirectory The path to the unpacked files.
 *
 * @return the number of unpacked tiles
 */
- (uint64_t)unpackTilesForPackedTilesPath:(nonnull NSString *)packedTilesPath
                          outputDirectory:(nonnull NSString *)outputDirectory;
/**
 * Removes tiles wholly within the supplied bounding box. If the tile is not
 * contained completely within the bounding box it will remain in the cache.
 * After removing files from the cache any routers should be reconfigured
 * to synchronize their in memory cache with the disk
 *
 * @param packedTilesPath  The path to the tiles.
 * @param lowerLeft         The lower left coord of the bbox.
 * @param upperRight        The upper right coord of the bbox.
 *
 * @return the number of tiles removed
 */
- (uint64_t)removeTilesForPackedTilesPath:(nonnull NSString *)packedTilesPath
                                lowerLeft:(CLLocationCoordinate2D)lowerLeft
                               upperRight:(CLLocationCoordinate2D)upperRight;
/** Clears caches(including global ones) */
- (void)clearCache;
/** Enables electronic horizon feature */
- (void)enableElectronicHorizon;
/** Disables electronic horizon feature */
- (void)disableElectronicHorizon;

@end
