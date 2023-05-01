//
//  main.m
//  HJ26 字符串排序
//
//  Created by 徐恩 on 2023/5/1.
//

#import <Foundation/Foundation.h>

NSInteger charCmp(NSNumber *num1, NSNumber *num2, void *ctx) {
    char c1 = [num1 charValue];
    if (c1 >= 'a') {
        c1 = c1 - 'a' + 'A';
    }
    char c2 = [num2 charValue];
    if (c2 >= 'a') {
        c2 = c2 - 'a' + 'A';
    }
    if (c1 > c2) {
        return 1;
    } else if (c1 == c2) {
        return 0;
    } else {
        return -1;
    }
}

int main(int argc, const char * argv[]) {
    char str[1000];
    while (scanf("%[^\n]", str) != EOF) {
        int i = 0;
        NSMutableArray *letters = [NSMutableArray array];
        while (str[i] != '\0') {
            if ((str[i] >= 'A' && str[i] <= 'Z') || (str[i] >= 'a' && str[i] <= 'z')) {
                [letters addObject:[NSNumber numberWithChar:str[i]]];
            }
            i ++;
        }
        [letters sortUsingFunction:charCmp context:NULL];
        
        i = 0;
        int j = 0;
        while (j < letters.count && str[i] != '\0') {
            if ((str[i] >= 'A' && str[i] <= 'Z') || (str[i] >= 'a' && str[i] <= 'z')) {
                str[i] = [[letters objectAtIndex:j++] charValue];
            }
            i++;
        }
        
        i = 0;
        while (str[i] != '\0') {
            printf("%c", str[i]);
            i++;
        }
        printf("\n");
        getchar();
    }
    return 0;
}
//A Famous Saying: Much Ado About Nothing (2012/8).

