//
//  main.m
//  HJ55 挑7
//
//  Created by 徐恩 on 2023/5/6.
//

#import <Foundation/Foundation.h>

#define N 30005

#define resIncreas(x) \
a = 7*x; \
while (a <= n) { \
    for (int i = 0; i<x && a <= n; i++, a++) { \
        res += (a%7 == 0 ? 0 : 1); \
    } \
    a+=x*9; \
}

bool map[N];
int count[N];

bool containNotMult7[N];

void mark(int base, int n) {
    int a = 7 * base;
    while (a<=n) {
        for (int i = 0; i<base && a <= n; i++, a++) {
            containNotMult7[a] = (a%7 == 0 ? 0 : 1);
        }
        a+=base*9;
    }
}

int count7(int n) {
    int b = 1;
    while (b<n) {
        mark(b, n);
        b*=10;
    }
    int count = 0;
    for (int i = 0; i<=n; i++) {
        count += containNotMult7[i] ? 1 : 0;
    }
    return count + n / 7;
}


//int count7(int n) {
//    if (n == 176 || n == 177) {
//
//    }
//    int res = 0;
//    int a = 17;
//    while (a <= n) {
//        res += (a%7 == 0 ? 0 : 1);
//        a += 10;
//    }
//
////    resIncreas(10);
//    a = 70;
//    while (a <= n) {
//        for (int i = 0; i<10 && a <= n; i++, a++) {
//            res += (a%7 == 0 ? 0 : 1);
//        }
//        a+=90;
//    }
//
//    resIncreas(100);
//    resIncreas(1000);
//
//    return res + n / 7;
//}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n;
        while (scanf("%d", &n) != EOF) {
            printf("%d\n", count7(n));
        }
        int n = 7;
        while (n < N) {
            map[n] = true;
            n+=7;
        }

        n = 17;
        while (n < N) {
            map[n] = true;
            n+=10;
        }

        n = 70;
        while (n < N) {
            for (int i = 0; i<10; i++) {
                map[n+i] = true;
            }
            n+=100;
        }

        n = 700;
        while (n < N) {
            for (int i = 0; i<100; i++) {
                map[n+i] = true;
            }
            n+=1000;
        }

        n = 7000;
        while (n < N) {
            for (int i = 0; i<1000; i++) {
                map[n+i] = true;
            }
            n+=10000;
        }

        int last = 0;
        for (int i = 7; i<N; i++) {
            last = last + (map[i] ? 1 : 0);
            count[i] = last;
        }
        
        for (int i = 7; i<N; i++) {
            assert(count7(i) == count[i]);
        }
        
        assert(count7(20) == 3);
        assert(count7(75) == 21);
        assert(count7(238) == 70);
        printf("ok\n");
    }
    return 0;
}
