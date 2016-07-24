#include <substrate.h>
#include <UIKit/UIKit.h>

%hook SBOrientationLockManager

%new
- (_Bool)isLocked{
    return 0;
}

- (_Bool)isUserLocked{
    return %orig();
}

%end

