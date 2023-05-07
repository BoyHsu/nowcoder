//
//  main.m
//  HJ89 24点运算
//
//  Created by 徐恩 on 2023/5/8.
//

#import <Foundation/Foundation.h>

char cards[4][5];
int lenghs[4];
int value[4];
bool visited[4];

char equation[25];
int equationIdx = 0;
char resEquation[25];
bool completed = false;

void dfs(int visit, int product) {
    if (completed) {
        return;
    }
    if (visit == 4) {
        if (product == 24) {
            strcpy(resEquation, equation);
            completed = true;
        }
        return;
    }
    
    for (int i = 0; i<4; i++) {
        if (visited[i]) {
            continue;
        }
        
        visited[i] = true;
        if (equationIdx == 0) {
            strcpy(&equation[equationIdx], cards[i]);
            equationIdx += lenghs[i];
            dfs(visit+1, value[i]);
            equationIdx -= lenghs[i];
        } else {
            int symIdx = equationIdx++;
            strcpy(&equation[equationIdx], cards[i]);
            equationIdx += lenghs[i];
            
            equation[symIdx] = '+';
            dfs(visit+1, product+value[i]);
            
            if (product >= value[i]) {
                equation[symIdx] = '-';
                dfs(visit+1, product - value[i]);
            }
            
            equation[symIdx] = '*';
            dfs(visit+1, product * value[i]);
            
            if (product % value[i] == 0) {
                equation[symIdx] = '/';
                dfs(visit+1, product / value[i]);
            }
            equationIdx -= lenghs[i] + 1;
        }
        visited[i] = false;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%s %s %s %s", cards[0], cards[1], cards[2], cards[3]) != EOF) {
            completed = false;
            equationIdx = 0;
            memset(equation, 0, sizeof(equation));
            
            bool hasError = false;
            for (int i = 0; i<4; i++) {
                int len = (int)strlen(cards[i]);
                if (len == 1) {
                    char c = cards[i][0];
                    if (c >= '2' && c <= '9') {
                        value[i] = c - '0';
                    } else {
                        switch (c) {
                            case 'A': value[i] = 1; break;
                            case 'J': value[i] = 11; break;
                            case 'Q': value[i] = 12; break;
                            case 'K': value[i] = 13; break;
                            default:  hasError = true; break;
                        }
                    }
                } else if (len == 2) {
                    value[i] = 10;
                } else {
                    hasError = true;
                    break;
                }
                lenghs[i] = len;
            }
            
            if (hasError) {
                printf("ERROR\n");
                continue;
            }
            
            dfs(0, 0);
            
            if (completed) {
                printf("%s\n", resEquation);
            } else {
                printf("NONE\n");
            }
        }
    }
    return 0;
}

//A A A A
//NONE

//4 2 K A
//K-A*4/2 or A+K*2-4

//B 5 joker 4
//ERROR

//K Q 6 K
//NONE

//8 3 9 7
//9-8+7*3
