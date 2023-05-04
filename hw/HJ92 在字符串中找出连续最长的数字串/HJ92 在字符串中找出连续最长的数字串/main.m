//
//  main.m
//  HJ92 在字符串中找出连续最长的数字串
//
//  Created by 徐恩 on 2023/5/4.
//

#import <Foundation/Foundation.h>

char string[200];
char res[200];
int maxLen = 1;
int resIdx = 0;

void addNums(int idx, int len) {
    if (len > maxLen) {
        resIdx = 0;
        maxLen = len;
    }
    if (maxLen == len) {
        for (int j = 1; j<=maxLen; j++) {
            res[resIdx++] = string[idx+j];
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%s", string) != EOF) {
            maxLen = 1;
            resIdx = 0;
            int i = 0;
            int idx = 0, len = 0;
            while (string[i] != '\0') {
                if (string[i] >= '0' && string[i] <= '9') {
                    len += 1;
                } else {
                    addNums(idx, len);
                    len = 0;
                    idx = i;
                }
                i++;
            }
            
            if ((idx+len+1 == i)) {
                addNums(idx, len);
            }
            
            for (i=0; i<resIdx; i++) {
                printf("%c",res[i]);
            }
            printf(",%d\n", maxLen);
        }
    }
    return 0;
}
//abcd12345ed125ss123058789
//a8a72a6a5yy98y65ee1r2
