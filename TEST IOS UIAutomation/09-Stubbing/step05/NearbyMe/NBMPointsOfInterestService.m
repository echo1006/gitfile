/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
#import "NBMPointsOfInterestService.h"
#import "OpenStreetMapService.h"

@implementation NBMPointsOfInterestService
{
    BOOL _canceled;
}

+ (instancetype)service
{
    return [[self alloc] init];
}

- (void)findByText:(NSString *)query
            within:(MKMapRect)rect
{
    OSMSCallback callback = ^(NSArray *results, NSError *error) {
        if (_canceled) return;

        if (error) {
            [self.delegate poiService:self didFailWithError:error];
        } else {
            NSArray *pointsOfInterest =
                        [self pointsOfInterestFromAPIArray:results];
            [self.delegate poiService:self didFetchResults:pointsOfInterest];
        }
    };

    [OpenStreetMapService searchText:query within:rect completion:callback];
}

- (void)cancel
{
    _canceled = YES;
}

- (NSArray *)pointsOfInterestFromAPIArray:(NSArray *)apiArray
{
    NSMutableArray *pointsOfInterest = [NSMutableArray new];
    
    for (NSDictionary *result in apiArray) {
        NBMPointOfInterest *poi = [[NBMPointOfInterest alloc] init];
        NSString *type = [result valueForKey:@"type"];
        poi.pointId = [result valueForKey:@"place_id"];
        poi.title = [[result valueForKey:@"address"] valueForKey:type];
        if (poi.title == nil) {
            poi.title = [result valueForKey:@"display_name"];
        }
        poi.coordinate = CLLocationCoordinate2DMake(
                            [[result valueForKey:@"lat"] floatValue],
                            [[result valueForKey:@"lon"] floatValue]);
        [pointsOfInterest addObject:poi];
    }

    return pointsOfInterest;
}

@end
