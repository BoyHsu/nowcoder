//
//  main.m
//  HJ17 坐标移动
//
//  Created by 徐恩 on 2023/5/1.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char chars[10001];
        while (scanf("%s", chars) != EOF) {
            NSString *str = [NSString stringWithCString:chars];
            NSArray *subs = [str componentsSeparatedByString:@";"];
            int x = 0, y = 0;
            for (NSString *sub in subs) {
                if (sub.length) {
                    char op = [sub characterAtIndex:0];
                    if (op != 'A' && op != 'S' && op != 'W' && op != 'D') {
                        continue;
                    }
                    int n = 0, i = 1, len = (int)sub.length;
                    while (i < len) {
                        char num = [sub characterAtIndex:i];
                        if (num >= '0' && num <= '9') {
                            n = n * 10 + num - '0';
                        } else {
                            break;
                        }
                        i++;
                    }
                    if (i!=len || n == 0) {
                        continue;
                    }
                    switch (op) {
                        case 'A':
                            x -= n;
                            break;
                        case 'D':
                            x += n;
                            break;
                        case 'S':
                            y -= n;
                            break;
                        case 'W':
                            y += n;
                            break;
                            
                        default:
                            break;
                    }
                }
            }
            printf("%d,%d\n", x, y);
        }
    }
    return 0;
}
//A10;S20;W10;D30;X;A1A;B10A11;;A10;
