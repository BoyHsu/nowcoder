//
//  main.m
//  HJ66 配置文件恢复
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *map = @{
            @"reset": @"reset what",
            @"reset board": @"board fault",
            @"board add": @"where to add",
            @"board delete": @"no board at all",
            @"reboot backplane": @"impossible",
            @"backplane abort": @"install first",
        };
        char c1[20], c2[20];
        while (scanf("%s", c1) != EOF) {
            
            NSMutableArray *match = [@[
                @[@"reset"],
                @[@"reset", @"board"],
                @[@"board", @"add"],
                @[@"board", @"delete"],
                @[@"reboot", @"backplane"],
                @[@"backplane", @"abort"],
            ] mutableCopy];
            
            NSString *firstCommand = [NSString stringWithCString:c1];
            
            if (getchar() != ' ') {
                for (int j = (int)match.count-1; j>=0; j--) {
                    if ([[match objectAtIndex:j] count] != 1 ||
                        ![[[match objectAtIndex:j] firstObject] hasPrefix:firstCommand]) {
                        [match removeObjectAtIndex:j];
                    }
                }
            } else {
                scanf("%s", c2);
             
                NSString *secCommond = [NSString stringWithCString:c2];
                
                for (int j = (int)match.count-1; j>=0; j--) {
                    if ([[match objectAtIndex:j] count] != 2 ||
                        !([[[match objectAtIndex:j] firstObject] hasPrefix:firstCommand] &&
                          [[[match objectAtIndex:j] objectAtIndex:1] hasPrefix:secCommond])) {
                        [match removeObjectAtIndex:j];
                    }
                }
            }
            
            if (match.count == 1) {
                NSString *key = [match.firstObject componentsJoinedByString:@" "];
                NSString *value = [map objectForKey:key];
                printf("%s\n", value.cString);
            } else {
                printf("unknown command\n");
            }
        }
    }
    return 0;
}

//reset
//reset board
//board add
//board delete
//reboot backplane
//backplane abort
//
//reset what
//board fault
//where to add
//no board at all
//impossible
//install first

reset
reset board
board add
board delete
reboot backplane
backplane abort

