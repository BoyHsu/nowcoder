//
//  main.m
//  HJ107 求解立方根
//
//  Created by 徐恩 on 2023/5/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double val;
        double lo, hi;
        bool isNega;
        double precision = 0.00001;
        while (scanf("%lf", &val) != EOF) {
            isNega = val < 0;
            val = isNega ? -val : val;
            if (val == 0) {
                printf("0\n");
                continue;
            } else if (val < 1) {
                lo = 0; hi = 1;
            } else if (val == 1) {
                printf("%d\n", isNega ? -1 : 1);
                continue;
            } else if (val < 8) {
                lo = 1; hi = 2;
            } else if (val == 8) {
                printf("%d\n", isNega ? -2 : 2);
                continue;
            } else {
                lo = 2; hi = 2.7;
            }
            
            while (hi - lo > precision) {
                double mi = (lo+hi)/2;
                double miCube = mi * mi * mi;
                if (miCube > val) {
                    hi = mi;
                } else {
                    lo = mi + 0.1;
                }
            }
            
            hi = lo;
            lo -= 0.1;
            while (hi - lo > precision) {
                double mi = (lo+hi)/2;
                double miCube = mi * mi * mi;
                if (miCube > val) {
                    hi = mi;
                } else {
                    lo = mi + 0.01;
                }
            }
            
            lo = round(lo*10)/10;
            printf("%.1lf\n", isNega ? -lo : lo);
        }
    }
    return 0;
}
