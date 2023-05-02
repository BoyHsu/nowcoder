//
//  main.m
//  HJ43 迷宫问题
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

#define N 10

int n,m;
int arr[N][N];
bool visited[N][N];
NSArray *minPath;
NSMutableArray *path;

void dfs(int i, int j) {
    if (visited[i][j] || arr[i][j] == 1) {
        return;
    }
    
    if (i== 0 && j == 0) {
        if (!minPath || path.count < minPath.count) {
            minPath = [path copy];
        }
        return;
    }
    
    NSArray *cur = [NSArray arrayWithObjects:[NSNumber numberWithInt:i], [NSNumber numberWithInt:j], nil];
    [path addObject:cur];
        
    visited[i][j] = true;
    if (i-1 >= 0) {
        dfs(i-1, j);
    }
    if (j-1 >= 0) {
        dfs(i, j-1);
    }
    if (i+1 < n) {
        dfs(i+1, j);
    }
    if (j+1 < m) {
        dfs(i, j+1);
    }
    [path removeLastObject];
    visited[i][j] = false;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%d %d", &n, &m) != EOF) {
            for (int i = 0; i<n; i++) {
                for (int j = 0; j<m; j++) {
                    scanf("%d", &arr[i][j]);
                }
            }
            memset(visited, 0, sizeof(visited));
            path = [NSMutableArray array];
            minPath = nil;
            dfs(n-1, m-1);
            printf("(0,0)\n");
            for (int i = (int)minPath.count-1; i>=0; i--) {
                NSArray *point = [minPath objectAtIndex:i];
                printf("(%d,%d)\n", [[point objectAtIndex:0] intValue], [[point objectAtIndex:1] intValue]);
            }
        }
    }
    return 0;
}
