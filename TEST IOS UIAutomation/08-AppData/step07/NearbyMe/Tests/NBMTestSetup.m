/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
#import "NBMTestSetup.h"
#import "NBMTestDataFactory.h"

static inline NSString *NBMEnvironment(NSString *varName)
{
    NSDictionary *environment = [[NSProcessInfo processInfo] environment];
    return [environment objectForKey:varName];
}

@interface NBMTestSetup ()
@property (nonatomic, retain) NBMDocument *document;
@end

@implementation NBMTestSetup

- (id)initWithDocument:(NBMDocument *)document
{
    self = [super init];
    if (self) {
        _document = document;
    }
    return self;
}

- (void)runIfInUITests
{
    if (NBMEnvironment(@"UI_TESTS") == nil) return;
    // ...
    NSLog(@"UI_TESTS environment variable detected.");
    NSString *dataFactoryMessage = NBMEnvironment(@"DATA_FACTORY_MESSAGE");
    if (dataFactoryMessage) {
        [self sendMessageToDataFactory:dataFactoryMessage];
    }
}

- (void)sendMessageToDataFactory:(NSString *)message
{
    NSLog(@"Sending message \"%@\" to data factory.", message);
    NBMTestDataFactory *factory =
            [[NBMTestDataFactory alloc] initWithDocument:self.document];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [factory performSelector:NSSelectorFromString(message)];
#pragma clang diagnostic pop
}

@end
