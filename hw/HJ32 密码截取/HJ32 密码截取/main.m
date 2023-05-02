//
//  main.m
//  HJ32 密码截取
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char chs[2500];
        while (scanf("%s", chs) != EOF) {
            int len = (int)strlen(chs);
            int maxLen = 0;
            for (int i = 1; i<len; i++) {
                int l = i - 1;
                int r = i + 1;
                while (l >= 0 && r < len) {
                    if (chs[l] == chs[r]) {
                        maxLen = MAX(maxLen, r-l+1);
                        l -= 1;
                        r += 1;
                    } else {
                        break;
                    }
                }
                l = i - 1;
                r = i;
                while (l >= 0 && r < len) {
                    if (chs[l] == chs[r]) {
                        maxLen = MAX(maxLen, r-l+1);
                        l -= 1;
                        r += 1;
                    } else {
                        break;
                    }
                }
            }
            
            printf("%d\n", maxLen);
        }
    }
    return 0;
}
