//
//  main.m
//  HJ93 数组分组
//
//  Created by 徐恩 on 2023/5/8.
//

#import <Foundation/Foundation.h>

#define N 50
int n, m;
int arr0[N];
int i0 = 0;
bool visited[N];
bool completed = false;

void dfs(int target) {
    if (completed) {
        return;
    }
    if (target == 0) {
        completed = true;
        return;
    }
    
    for (int i = 0; i<i0; i++) {
        if (visited[i]) {
            continue;
        }
        
        visited[i] = true;
        
        dfs(target-arr0[i]);
        
        visited[i] = false;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%d", &n) != EOF) {
            completed = false;
            int sum3 = 0, sum5 = 0, sum0 = 0;
            for (int i = 0; i<n; i++) {
                scanf("%d", &m);
                if (m % 5 == 0) {
                    sum5 += m;
                } else if (m % 3 == 0) {
                    sum3 += m;
                } else {
                    arr0[i0++] = m;
                    sum0 += m;
                }
            }
            
            if ((sum0+sum3+sum5) % 2 != 0) {
                printf("false\n");
                continue;
            }
            
            int target = (sum0+sum3+sum5)/2 - MAX(sum3, sum5);
            
            dfs(target);
            if (completed) {
                printf("true\n");
            } else {
                printf("false\n");
            }
        }
    }
    return 0;
}

//5
//1 0 2 3 -2 
