//
//  main.m
//  HJ59 找出字符串中第一个只出现一次的字符
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

char a[1000];
int duplicated = 2000;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%s", a) != EOF) {
            int len = (int)strlen(a);
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            for (int i = 0; i<len; i++) {
                NSString *key = [NSString stringWithFormat:@"%c", a[i]];
                NSNumber *num = [dict objectForKey:key];
                if (num == nil) {
                    NSNumber *value = [NSNumber numberWithInt:i];
                    [dict setObject:value forKey:key];
                } else if ([num intValue] != duplicated) {
                    NSNumber *value = [NSNumber numberWithInt:duplicated];
                    [dict setObject:value forKey:key];
                }
            }
            
            int min = INT_MAX;
            for (NSNumber *num in dict.allValues) {
                min = MIN(min, [num intValue]);
            }
            if (duplicated == min) {
                printf("-1\n");
            } else {
                printf("%c\n", a[min]);
            }
            
        }
    }
    return 0;
}
