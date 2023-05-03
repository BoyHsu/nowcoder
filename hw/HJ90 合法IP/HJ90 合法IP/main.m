//
//  main.m
//  HJ90 合法IP
//
//  Created by 徐恩 on 2023/5/4.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char ip[18];
        while (scanf("%s", ip)!= EOF) {
            NSString *str = [NSString stringWithCString:ip];
            NSArray *arr = [str componentsSeparatedByString:@"."];
            if (arr.count != 4) {
                printf("NO\n");
                continue;
            }
            bool isValid = true;
            for (NSString *sub in arr) {
                if (sub.length == 0 || sub.length > 3) {
                    isValid = false;
                    break;
                }
                int v = 0;
                for (int i = 0; i<sub.length; i++) {
                    char c = [sub characterAtIndex:i];
                    if (c >= '0' && c <= '9') {
                        if (i > 0 && [sub characterAtIndex:0] == '0') {
                            isValid = false;
                            break;
                        } else {
                            v = 10 * v + c-'0';
                        }
                    } else {
                        isValid = false;
                        break;
                    }
                }
                if (isValid && v >= 256) {
                    isValid = false;
                    break;
                }
            }
            if (isValid) {
                printf("YES\n");
            } else {
                printf("NO\n");
            }
        }
    }
    return 0;
}
