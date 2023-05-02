//
//  main.m
//  HJ33 整数与IP地址间的转换
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        unsigned s1, s2, s3, s4, n;
        while (scanf("%d.%d.%d.%d %d", &s1, &s2, &s3, &s4, &n) != EOF) {
            printf("%d\n", (s1 << 24) + (s2 << 16) + (s3 << 8) + s4);
            printf("%d.%d.%d.%d\n", (n >> 24), ((n & 0xff0000) >> 16), ((n & 0xff00) >> 8), (n & 0xff));
        }
    }
    return 0;
}
