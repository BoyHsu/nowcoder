//
//  main.m
//  HJ75 公共子串计算
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

#define N 155

char s1[N], s2[N];
int dp[N][N];

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%s %s", s1, s2)) {
            memset(dp, 0, sizeof(dp));
            int len1 = (int)strlen(s1);
            int len2 = (int)strlen(s2);
            int max = 0;
            for (int i = len1-1; i>=0; i--) {
                for (int j = len2-1; j>=0; j--) {
                    if (s1[i] == s2[j]) {
                        dp[i][j] = dp[i+1][j+1] + 1;
                        max = MAX(max, dp[i][j]);
                    }
                }
            }
            printf("%d\n", max);
        }
    }
    return 0;
}
