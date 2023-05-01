//
//  main.m
//  HJ20 密码验证合格程序
//
//  Created by 徐恩 on 2023/5/1.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char password[100];
        while (scanf("%s", password) != EOF) {
            NSString *pw = [NSString stringWithCString:password];
            NSLog(@"%@", pw);
            if (pw.length < 8 || [pw containsString:@" "] || [pw containsString:@"\n"]) {
                printf("NG\n");
                continue;
            }
            BOOL hasNum = NO, hasUpperCase = NO, hasLowwerCase = NO, hasSymble = NO;
            for (int i = 0; i<pw.length; i++) {
                char ch = [pw characterAtIndex:i];
                if (ch >= '0' && ch <= '9') {
                    hasNum = YES;
                } else if (ch >= 'a' && ch <= 'z') {
                    hasLowwerCase = YES;
                } else if (ch >= 'A' && ch <= 'Z') {
                    hasUpperCase = YES;
                } else {
                    hasSymble = YES;
                }
            }
            
            if (hasNum + hasUpperCase + hasLowwerCase + hasSymble < 3) {
                printf("NG\n");
                continue;
            }
            
            NSMutableString *temp = [NSMutableString stringWithString:[pw substringToIndex:3]];
            NSMutableDictionary *map = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:temp];
            BOOL duplicate = NO;
            for (int i = 3; i<pw.length; i++) {
                [temp deleteCharactersInRange:NSMakeRange(0, 1)];
                [temp appendFormat:@"%c", [pw characterAtIndex:i]];
                if ([map objectForKey:temp]) {
                    duplicate = YES;
                    break;
                } else {
                    [map setObject:[NSNumber numberWithBool:YES] forKey:temp];
                }
            }
            if (duplicate) {
                printf("NG\n");
            } else {
                printf("OK\n");
            }
        }
    }
    return 0;
}
//021Abc9000
//021Abc9Abc1
//021ABC9000
//021$bc9000
