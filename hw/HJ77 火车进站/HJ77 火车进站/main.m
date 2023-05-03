//
//  main.m
//  HJ77 火车进站
//
//  Created by 徐恩 on 2023/5/3.
//

#import <Foundation/Foundation.h>

#define N 10

int n;
int nums[N];
int permute[N];
bool visited[N];
bool poped[N];
NSMutableArray *res;

bool isValidPermute(void) {
    for (int i = 0; i<n; i++) {
        poped[i] = false;
    }
    int top = -1;
    for (int i = 0; i<n; i++) {
        if (permute[i] < top) {
            return false;
        }
        poped[permute[i]] = true;
        top = permute[i];
        while (poped[--top]) {}
        
    }
    return true;
}

void dfs(int visit) {
    if (visit == n) {
        if (isValidPermute()) {
            NSMutableString *str = [NSMutableString string];
            for (int i = 0; i<n; i++) {
                [str appendFormat:@"%d ", nums[permute[i]]];
            }
            [str deleteCharactersInRange:NSMakeRange(2*n-1, 1)];
            [res addObject:str];
        }
        return;
    }
    
    for (int i = 0; i<n; i++) {
        if (visited[i]) {
            continue;
        }
        
        visited[i] = true;
        permute[visit] = i;
        dfs(visit+1);
        visited[i] = false;
    }
}

NSInteger strCmp(NSString *str1, NSString *str2, void *ctx) {
    for (int i = 0; i<str1.length; i++) {
        char c1 = [str1 characterAtIndex:i];
        char c2 = [str2 characterAtIndex:i];
        if (c1 < c2) {
            return -1;
        } else if (c1 > c2) {
            return 1;
        }
    }
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%d", &n) != EOF) {
            for (int i = 0; i<n; i++) {
                scanf("%d", &nums[i]);
            }
            res = [NSMutableArray array];
            memset(visited, 0, sizeof(visited));
            dfs(0);
            [res sortUsingFunction:strCmp context:NULL];
            for (NSString *seq in res) {
                printf("%s\n", seq.cString);
            }
        }
    }
    return 0;
}
