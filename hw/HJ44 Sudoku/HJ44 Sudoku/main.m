//
//  main.m
//  HJ44 Sudoku
//
//  Created by 徐恩 on 2023/5/8.
//

#import <Foundation/Foundation.h>

int soduku[9][9];
int count[10] = {9,9,9,9,9,9,9,9,9,9};
int zeros[81];
int zeroCount;
bool completed = false;

bool isValid(int num, int y, int x) {
    bool valid = true;
    for (int i = 0; i<9; i++) {
        if (x == i) {
            continue;
        }
        valid = valid && soduku[y][i] != num;
    }
    if (!valid) {
        return false;
    }
    
    for (int i = 0; i<9; i++) {
        if (y == i) {
            continue;
        }
        valid = valid && soduku[i][x] != num;
    }
    
    if (!valid) {
        return false;
    }
    
    int x3 = x/3*3, y3 = y/3*3;
    for (int i = 0; i<3; i++) {
        for (int j = 0; j<3; j++) {
            if (i == y && j == x) {
                continue;
            }
            valid = valid && soduku[y3+i][x3+j] != num;
        }
    }
    
    return valid;
}

void dfs(int visit) {
    if (completed) {
        return;
    }
    
    if (visit == zeroCount) {
        completed = true;
        for (int i = 0; i<9; i++) {
            for (int j = 0; j<9; j++) {
                printf("%d ", soduku[i][j]);
            }
            printf("\n");
        }
        return;
    }
    
    for (int i = 1; i<10; i++) {
        if (count[i] == 0) {
            continue;
        }
        
        int y = zeros[visit] / 9;
        int x = zeros[visit] % 9;
        
        if (isValid(i, y, x)) {
            count[i]--;
            soduku[y][x] = i;
            dfs(visit+1);
            soduku[y][x] = 0;
            count[i]++;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int m;
        for (int i = 0; i<9; i++) {
            for (int j = 0; j<9; j++) {
                scanf("%d", &m);
                count[m]--;
                soduku[i][j] = m;
                if (m == 0) {
                    zeros[zeroCount++] = i*9+j;
                }
            }
        }
        
        dfs(0);
    }
    return 0;
}


//0 9 2 4 8 1 7 6 3
//4 1 3 7 6 2 9 8 5
//8 6 7 3 5 9 4 1 2
//6 2 4 1 9 5 3 7 8
//7 5 9 8 4 3 1 2 6
//1 3 8 6 2 7 5 9 4
//2 7 1 5 3 8 6 4 9
//3 8 6 9 1 4 2 5 7
//0 4 5 2 7 6 8 3 1
//5 9


//0 9 5 0 2 0 0 6 0
//0 0 7 1 0 3 9 0 2
//6 0 0 0 0 5 3 0 4
//0 4 0 0 1 0 6 0 7
//5 0 0 2 0 7 0 0 9
//7 0 3 0 9 0 0 2 0
//0 0 9 8 0 0 0 0 6
//8 0 6 3 0 2 1 0 5
//0 5 0 0 7 0 2 8 3
