#include <substrate.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"

@interface SBOrientationLockManager
- (_Bool)isUserLocked;
@end

%hook SBOrientationLockManager

%new
- (_Bool)isLocked {
    return [self isUserLocked];
}

- (_Bool)isUserLocked {
    return %orig();
}
%end

