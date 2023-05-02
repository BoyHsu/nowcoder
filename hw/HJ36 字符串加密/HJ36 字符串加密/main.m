//
//  main.m
//  HJ36 字符串加密
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char key[100], str[100];
        char secMap[26], letters[26];
        while (scanf("%s %s", key, str) != EOF) {
            memset(letters, 0, sizeof(letters));
            int i = 0, j = 0;
            while (key[i] != '\0') {
                if (!letters[key[i]-'a']) {
                    letters[key[i]-'a'] = 1;
                    secMap[j++] = key[i];
                }
                i++;
            }
            
            i = 0;
            while (i<26 && j<26) {
                if (!letters[i]) {
                    secMap[j++] = i + 'a';
                }
                i+=1;
            }
            
            i = 0;
            while (str[i] != '\0') {
                str[i] = secMap[str[i]-'a'];
                i++;
            }
            printf("%s\n", str);
        }
    }
    return 0;
}
