//
//  main.m
//  HJ70 矩阵乘法计算量估算
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n;
        int matrix[15][2];
        char func[100];
        int stack[15][2];
        int openIdxes[15];

        while (scanf("%d", &n) != EOF) {
            int top = -1;
            int openIdxesTop = -1;
            int matrixIdx = 0;
            int res = 0;
            
            for (int i = 0; i<n; i++) {
                scanf("%d %d", &matrix[i][0], & matrix[i][1]);
            }
            scanf("%s", func);
            
            int len = (int)strlen(func);
            for (int i = 0; i<len; i++) {
                char c = func[i];
                if (c == '(') {
                    openIdxes[++openIdxesTop] = top+1;
                } else if (c == ')') {
                    int targetIdx = openIdxes[openIdxesTop--];
                    while (top > targetIdx) {
                        int col = stack[top][1];
                        --top;
                        res += stack[top][0] * stack[top][1] * col;
                        stack[top][1] = col;
                    }
                } else {
                    ++top;
                    stack[top][0] = matrix[matrixIdx][0];
                    stack[top][1] = matrix[matrixIdx][1];
                    ++matrixIdx;
                }
            }
            printf("%d\n", res);
        }
    }
    return 0;
}

//3
//50 10
//10 20
//20 5
//(A(BC))
//3500

//5
//23 61
//61 59
//59 34
//34 56
//56 35
//(A(((BC)D)E))
//407175
