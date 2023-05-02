//
//  main.m
//  HJ29 字符串加解密
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char str[1000];
        bool isEncode = true;
        char baseBefore, baseAfter;
        int range;
        int i;
        while (scanf("%s", str) != EOF) {
            i = 0;
            while (str[i] != '\0') {
                char c = str[i];
                if (c >= 'A' && c <= 'Z') {
                    baseBefore = 'A';
                    baseAfter = 'a';
                    range = 26;
                } else if (c >= 'a' && c <= 'z') {
                    baseBefore = 'a';
                    baseAfter = 'A';
                    range = 26;
                } else {
                    baseBefore = '0';
                    baseAfter = '0';
                    range = 10;
                }
                str[i] = (c-baseBefore + (isEncode ? 1 : -1) + range) % range + baseAfter;
                i++;
            }
            printf("%s\n", str);
            isEncode = !isEncode;
        }
    }
    return 0;
}
