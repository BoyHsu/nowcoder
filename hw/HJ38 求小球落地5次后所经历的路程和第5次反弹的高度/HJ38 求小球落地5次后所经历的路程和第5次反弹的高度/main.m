//
//  main.m
//  HJ38 求小球落地5次后所经历的路程和第5次反弹的高度
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double height;
        while (scanf("%lf", &height) != EOF) {
            printf("%lf\n%lf\n", 2.875 * height, 0.03125 * height);
        }
    }
    return 0;
}
