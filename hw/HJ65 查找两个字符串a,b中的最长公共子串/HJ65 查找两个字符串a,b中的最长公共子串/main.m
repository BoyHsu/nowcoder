//
//  main.m
//  HJ65 查找两个字符串a,b中的最长公共子串
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

#define N 301

int dp[N][N];
char a[N], b[N];
int max, maxIdx;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%s %s", a, b) != EOF) {
            memset(dp, 0, sizeof(dp));
            max = 0; maxIdx = N;
            char *s, *l;
            int lenS, lenL;
            int lenA = (int)strlen(a);
            int lenB = (int)strlen(b);
            if (lenA > lenB) {
                s = b; lenS = lenB;
                l = a; lenL = lenA;
            } else {
                s = a; lenS = lenA;
                l = b; lenL = lenB;
            }
            for (int i = lenS-1; i>=0; i--) {
                for (int j = lenL-1; j>=0; j--) {
                    if (s[i] == l[j]) {
                        dp[i][j] = dp[i+1][j+1] + 1;
                        if (dp[i][j] > max) {
                            max = dp[i][j];
                            maxIdx = i;
                        } else if (dp[i][j] == max) {
                            maxIdx = MIN(maxIdx, i);
                        }
                    }
                }
            }
            for (int i = 0; i<max; i++) {
                printf("%c", s[maxIdx+i]);
            }
            
            printf("\n");
        }
    }
    return 0;
}

//efgyiffxoonftmmvd
//exwzdcwjsttuhsxrcpzplpnfqxqsqtlfctdkgacejitayoafucmfxxhkxyixxykndchyjc
//yi

//nvlrzqcjltmrejybjeshffenvkeqtbsnlocoyaokdpuxutrsmcmoearsgttgyyucgzgcnurfbubgvbwpyslaeykqhaaveqxijc
//wkigrnngxehuiwxrextitnmjykimyhcbxildpnmrfgcnevjyvwzwuzrwvlomnlogbptornsybimbtnyhlmfecscmojrxekqmj
//gcn
