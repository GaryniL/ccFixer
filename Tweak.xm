#include <substrate.h>
#import <UIKit/UIKit.h>

@interface SBOrientationLockManager : NSObject
- (_Bool)isUserLocked;
@end

%hook SBOrientationLockManager
%new
- (_Bool)isLocked {
    return [self isUserLocked];
}
%end