//
//  main.m
//  HJ103 Redraiment的走法
//
//  Created by 徐恩 on 2023/5/4.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n;
        while (scanf("%d", &n) != EOF) {
            NSMutableArray *sortedNum = [NSMutableArray array];
            NSMutableArray *countArr = [NSMutableArray array];
            int m = 0;
            for (int i = 0; i<n; i++) {
                scanf("%d", &m);
                NSNumber *M = [NSNumber numberWithInt:m];
                
                int lo = 0;
                int hi = (int)sortedNum.count;
                while (lo < hi) {
                    int mi = (lo+hi)/2;
                    int miVal = [[sortedNum objectAtIndex:mi] intValue];
                    if (miVal >= m) {
                        hi = mi;
                    } else {
                        lo = mi + 1;
                    }
                }
                
                
                if (lo == 0) {
                    [sortedNum insertObject:M atIndex:0];
                    [countArr insertObject:[NSNumber numberWithInt:1] atIndex:0];
                } else {
                    int maxCount = 1;
                    for (int j = 0; j<lo; j++) {
                        maxCount = MAX(maxCount, [[countArr objectAtIndex:j] intValue]);
                    }
                    
                    [sortedNum insertObject:M atIndex:lo];
                    NSNumber *countNum = [NSNumber numberWithInt:maxCount+1];
                    [countArr insertObject:countNum atIndex:lo];
                }
            }
            
            int maxCount = 1;
            for (int j = 0; j<countArr.count; j++) {
                maxCount = MAX(maxCount, [[countArr objectAtIndex:j] intValue]);
            }
            printf("%d\n", maxCount);
        }
    }
    return 0;
}


//13
//237 153 196 160 154 91 195 250 129 219 14 29 209

//6
//2 5 1 5 4 5

//6
//268 90 179 129 204 224
