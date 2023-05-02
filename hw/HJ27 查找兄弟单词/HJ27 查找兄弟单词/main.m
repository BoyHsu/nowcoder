//
//  main.m
//  HJ27 查找兄弟单词
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

BOOL isSibling(NSString *str, NSString *key, NSDictionary *wordCounts) {
    NSMutableDictionary *map = [wordCounts mutableCopy];
    for (int i = 0; i<str.length; i++) {
        char c = [str characterAtIndex:i];
        NSString *s = [NSString stringWithFormat:@"%c", c];
        int count = [[map objectForKey:s] intValue];
        NSNumber *cn = [NSNumber numberWithInt:count-1];
        [map setObject:cn forKey:s];
    }
    
    for (NSNumber *count in map.allValues) {
        if ([count intValue] != 0) {
            return NO;
        }
    }
    if ([str isEqualTo:key]) {
        return NO;
    }
    return YES;
}

NSInteger isAscent(NSString *str1, NSString *str2, void *ctx) {
    int i = 0, j = 0;
    while (i < str1.length && j < str2.length) {
        char c1 = [str1 characterAtIndex:i];
        char c2 = [str2 characterAtIndex:j];
        if (c1 > c2) {
            return 1;
        } else if (c1 < c2) {
            return -1;
        } else {
            return 0;
        }
    }
    
    return 0;
}

int main(int argc, const char * argv[]) {
    int n, k;
    char words[1000][10], key[10];
    while (scanf("%d", &n) != EOF) {
        for (int i = 0; i<n; i++) {
            scanf("%s", words[i]);
        }
        scanf("%s %d", key, &k);
        
        NSString *keyStr = [NSString stringWithCString:key];
        NSMutableDictionary *counts = [NSMutableDictionary dictionary];
        for (int i = 0; i<keyStr.length; i++) {
            NSString *k = [NSString stringWithFormat:@"%c", [keyStr characterAtIndex:i]];
            int count = [[counts objectForKey:k] intValue];
            [counts setObject:[NSNumber numberWithInt:count+1] forKey:k];
        }
        
        NSMutableArray *cache = [NSMutableArray array];
        for (int i = 0; i<n; i++) {
            NSString *str = [NSString stringWithCString:words[i]];
            if (isSibling(str, keyStr, counts)) {
                [cache addObject:str];
            }
        }
        printf("%ld\n", cache.count);
        if (cache.count >= k) {
            [cache sortUsingFunction:isAscent context:NULL];
            printf("%s\n", [[cache objectAtIndex:k-1] cString]);
        }
    }
    return 0;
}

