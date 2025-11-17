//
//  WKNavigationActionSyntheticClick.m
//

#import "WKNavigationActionSyntheticClick.h"

@implementation WKNavigationAction (SyntheticClick)

- (BOOL)isSyntheticClick {
    SEL selector = NSSelectorFromString(@"_syntheticClickType");
    
    // Check if selector exists
    if (![self respondsToSelector:selector]) {
        return NO;
    }
    
    // Get the value and check if it equals 0
    id syntheticClickType = [self valueForKey:@"syntheticClickType"];
    if (syntheticClickType == nil) {
        return NO;
    }
    
    return [syntheticClickType intValue] == 0;
}

- (BOOL)isUserInitiated {
    SEL selector = NSSelectorFromString(@"_isUserInitiated");
    
#if DEBUG
    if (![self respondsToSelector:selector]) {
        NSAssert(NO, @"WKNavigationAction does not respond to _isUserInitiated");
    }
#endif
    
    // Check if selector exists
    if (![self respondsToSelector:selector]) {
        return NO;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:self];
    [invocation invoke];
    
    BOOL result;
    [invocation getReturnValue:&result];
    
    return result;
}

@end