//
//  main.m
//  HJ41 称砝码
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n, m[10], x[10];
        while (scanf("%d", &n) != EOF) {
            for (int i = 0; i<n; i++) {
                scanf("%d", &m[i]);
            }
            for (int i = 0; i<n; i++) {
                scanf("%d", &x[i]);
            }
            NSMutableSet *set = [NSMutableSet set];
            [set addObject:[NSNumber numberWithInt:0]];
            for (int i = 0; i<n; i++) {
                int m0 = m[i];
                for (int j = 0; j<x[i]; j++) {
                    for (NSNumber *m1 in set.allObjects) {
                        [set addObject:[NSNumber numberWithInt:m1.intValue + m0]];
                    }
                }
            }
            printf("%ld\n", set.count);
        }
    }
    return 0;
}
