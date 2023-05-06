//
//  main.m
//  HJ63 DNA序列
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int window;
        char DNA[1000];
        while (scanf("%s %d", DNA, &window) != EOF) {
            int cgCount = 0;
            for (int i = 0; i<window; i++) {
                if (DNA[i] == 'C' || DNA[i] == 'G') {
                    cgCount++;
                }
            }
            int maxCG = cgCount;
            int resIdx = window-1;
            int len = (int)strlen(DNA);
            for (int i = window; i<len; i++) {
                if (DNA[i] == 'C' || DNA[i] == 'G') {
                    cgCount++;
                }
                if (DNA[i-window] == 'C' || DNA[i-window] == 'G') {
                    cgCount--;
                }
                
                if (cgCount > maxCG) {
                    maxCG = cgCount;
                    resIdx = i;
                }
            }
            
            for (int i = window-1; i>=0; i--) {
                printf("%c", DNA[resIdx-i]);
            }
            printf("\n");
        }
    }
    return 0;
}
