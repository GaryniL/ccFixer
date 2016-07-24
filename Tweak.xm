#include <substrate.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"

%hook SBOrientationLockManager

%new
- (_Bool)isLocked{
    return [self isUserLocked];
}

- (_Bool)isUserLocked{

    return %orig();
}

%end

