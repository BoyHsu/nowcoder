//
//  main.m
//  HJ69 矩阵乘法
//
//  Created by 徐恩 on 2023/5/3.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int x, y, z;
        int m1[100][100], m2[100][100];
        while (scanf("%d %d %d", &x, &y, &z) != EOF) {
            for (int i = 0; i<x; i++) {
                for (int j = 0; j<y; j++) {
                    scanf("%d", &m1[i][j]);
                }
            }
            
            for (int i = 0; i<y; i++) {
                for (int j = 0; j<z; j++) {
                    scanf("%d", &m2[i][j]);
                }
            }
            
            for (int i = 0; i<x; i++) {
                for (int j = 0; j<z; j++) {
                    int sum = 0;
                    for (int k = 0; k<y; k++) {
                        sum += m1[i][k] * m2[k][j];
                    }
                    printf("%d ", sum);
                }
                printf("\n");
            }
        }
    }
    return 0;
}
