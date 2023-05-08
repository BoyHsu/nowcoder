//
//  main.m
//  HJ68 成绩排序
//
//  Created by 徐恩 on 2023/5/8.
//

#import <Foundation/Foundation.h>

#define N 200
char names[N][10];
int scores[N];
int n, ascent;

char tempNames[N][10];
int tempScores[N];

bool (*sortFunc)(int, int);

bool isAscent(int a, int b) {
    return a <= b;
}

bool isDescent(int a, int b) {
    return a >= b;
}

void _merge(int lo, int mi, int hi) {
    
    for (int i = lo; i<mi; i++) {
        for (int j = 0; j<10; j++) {
            tempNames[i][j] = names[i][j];
        }
    }
    for (int i = lo; i<mi; i++) {
        tempScores[i] = scores[i];
    }
    
    int i = lo, j = mi, k = lo;
    while (i<mi && j<hi) {
        if (sortFunc(tempScores[i], scores[j])) {
            strcpy(names[k], tempNames[i]);
            scores[k] = tempScores[i];
            i++;
        } else {
            strcpy(names[k], names[j]);
            scores[k] = scores[j];
            j++;
        }
        k++;
    }
    while (i<mi) {
        strcpy(names[k], tempNames[i]);
        scores[k] = tempScores[i];
        k++; i++;
    }
}

void mergeSort(int lo, int hi) {
    if (lo+1>=hi) {
        return;
    }
    
    int mi = (lo + hi)/2;
    mergeSort(lo, mi);
    mergeSort(mi, hi);
    _merge(lo, mi, hi);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%d %d", &n, &ascent)) {
            if (ascent) {
                sortFunc = isAscent;
            } else {
                sortFunc = isDescent;
            }
            
            for (int i = 0; i<n; i++) {
                scanf("%s %d", names[i], &scores[i]);
            }
            
            mergeSort(0, n);
            for (int i = 0; i<n; i++) {
                printf("%s %d\n", names[i], scores[i]);
            }
        }
    }
    return 0;
}

//3
//1
//fang 90
//yang 50
//ning 70

//3
//1
//fang 90
//yang 50
//ning 50

//2
//1
//fang 90
//yang 50

//8
//1
//bor 49
//bbkk 23
//c 77
//orzbrjndx 67
//elqvrljd 60
//xclz 22
//jiwrkq 44
//ojfnqmfi 10
