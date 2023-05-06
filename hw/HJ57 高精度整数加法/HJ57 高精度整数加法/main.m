//
//  main.m
//  HJ57 高精度整数加法
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

#define N 10000
char a[N], b[N];

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%s %s", a, b) != EOF) {
            NSString *str1 = [NSString stringWithCString:a];
            NSString *str2 = [NSString stringWithCString:b];
            NSMutableString *res = [NSMutableString string];
            int i1 = (int)str1.length - 1;
            int i2 = (int)str2.length - 1;
            int carryBit = 0;
            while (i1 >= 0 && i2 >= 0) {
                int n1 = [str1 characterAtIndex:i1--] - '0';
                int n2 = [str2 characterAtIndex:i2--] - '0';
                int sum = n1 + n2 + carryBit;
                [res appendFormat:@"%d", sum%10];
                carryBit = sum / 10;
            }
            
            while (i1 >= 0) {
                int n1 = [str1 characterAtIndex:i1--] - '0';
                int sum = n1 + carryBit;
                [res appendFormat:@"%d", sum%10];
                carryBit = sum / 10;
            }
            
            while (i2 >= 0) {
                int n2 = [str2 characterAtIndex:i2--] - '0';
                int sum = n2 + carryBit;
                [res appendFormat:@"%d", sum%10];
                carryBit = sum / 10;
            }
            
            if (carryBit) {
                [res appendString:@"1"];
            }
            
            for (int i = (int)res.length-1; i>=0; i--) {
                printf("%d", [res characterAtIndex:i]-'0');
            }
            printf("\n");
        }
    }
    return 0;
}
