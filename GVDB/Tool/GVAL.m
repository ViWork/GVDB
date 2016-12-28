//
//  GVAL.m
//  
//
//  Created by Viosky on 2016/12/24.
//
//
#import <sys/utsname.h>
#import "GVAL.h"

@implementation GVAL
+ (CGFloat)setGVAL:(CGFloat)AL{
    NSInteger al;
    NSString *res =  [self iphoneType];
    if ([res isEqualToString:@"iPhone 7 Plus" ] && [res isEqualToString:@"iPhone 6s Plus"] )
    {
        al = 154.00;
    }

    
    else{
        al = 163;
    }
    NSInteger GVAL;
    GVAL = AL*72.0/al;
    return GVAL;
}

+  (NSString *)iphoneType {
    struct utsname systemInfo;

    uname(&systemInfo);

    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];

    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";

    else if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";

    else if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";

    else if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";

    else if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";

    else if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";

    else if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";

    else if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";

    else if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";

    else if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";

    else if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";

    else if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";

    else if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";

    else if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";

    else if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";

    else if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";

    else if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";

    else if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";

    else if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";

    else if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";

    else if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";

    else if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";

    else if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";

    else if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";

    else if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";

    else if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";

    else if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";

    else if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";

    else if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";

    else if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";

    else if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";

    else if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";

    else if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";

    else if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";

    else if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";

    else if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";

    else if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";

    else if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";

    else if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";

    else if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";

    else if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";

    else if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";

    else if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";

    else if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";

    else if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";

    else if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    else if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";

    else  return platform;
    
}
@end
