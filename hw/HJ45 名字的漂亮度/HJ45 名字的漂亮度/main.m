//
//  main.m
//  HJ45 名字的漂亮度
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int counts[26];
int scores[26];

NSInteger cmpWithCount(NSString *str1, NSString *str2, void *ctx) {
    int c1 = [str1 characterAtIndex:0] - 'A';
    int c2 = [str2 characterAtIndex:0] - 'A';
    
    if (counts[c1] == counts[c2]) {
        return 0;
    } else if (counts[c1] > counts[c2]) {
        return -1;
    } else {
        return 1;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n;
        char str[10000];
        while (scanf("%d", &n) != EOF) {
            for (int i = 0; i<n; i++) {
                scanf("%s", str);
                memset(counts, 0, sizeof(counts));
                memset(scores, 0, sizeof(scores));
                int idx = 0;
                NSMutableSet *set = [NSMutableSet set];
                while (str[idx] != '\0') {
                    char c = str[idx];
                    if (c >= 'a') {
                        c -= 32;
                        str[idx] = c;
                    }
                    [set addObject:[NSString stringWithFormat:@"%c", c]];
                    counts[c-'A'] += 1;
                    idx ++;
                }
                NSArray *sorted = [set.allObjects sortedArrayUsingFunction:cmpWithCount context:NULL];
                int score = 26;
                for (NSString *s in sorted) {
                    char c = [s characterAtIndex:0];
                    scores[c-'A'] += score;
                    score -= 1;
                }
                
                idx = 0;
                int sum = 0;
                while (str[idx] != '\0') {
                    sum += scores[str[idx]-'A'];
                    idx += 1;
                }
                printf("%d\n", sum);
            }
        }
    }
    return 0;
}
