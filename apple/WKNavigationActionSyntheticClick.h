//
//  WKNavigationActionSyntheticClick.h
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKNavigationAction (SyntheticClick)

/**
 * Check if this navigation action is a synthetic click
 * (internal private API inspection)
 */
- (BOOL)isSyntheticClick;

/**
 * Check if this navigation action is user initiated
 * (internal private API inspection)
 */
- (BOOL)isUserInitiated;

@end

NS_ASSUME_NONNULL_END