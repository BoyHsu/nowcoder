//
//  main.m
//  HJ64 MP3光标位置
//
//  Created by 徐恩 on 2023/5/7.
//

#include "stdio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int first = 0;
        int cursor = 0;
        int total;
        char command;
        while (scanf("%d", &total) != EOF) {
            getchar();
            while (scanf("%c", &command)) {
                if (command == '\n') {
                    int upper = total > 4 ? 4 : total;
                    for (int i = 1; i<=upper; i++) {
                        printf("%d ", first + i);
                    }
                    printf("\n%d\n", cursor+1);
                    break;
                }
                cursor = (cursor + total + (command == 'U' ? -1 : 1)) % total;
                if (total > 4) {
                    if (cursor < first) {
                        first = cursor;
                    } else if (cursor > first + 3) {
                        first = cursor - 3;
                    }
                }
            }
        }
    }
    return 0;
}
