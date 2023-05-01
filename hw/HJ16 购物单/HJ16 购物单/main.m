//
//  main.m
//  HJ16 购物单
//
//  Created by 徐恩 on 2023/4/30.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n, m;
        while (scanf("%d %d", &n, &m) != EOF) {
            int16_t objs[m][3];
            NSMutableDictionary *map = [NSMutableDictionary dictionary];
            int16_t masterDeviceCount = 0;
            for (int i = 0; i<m; i++) {
                int16_t a,b,c;
                scanf("%hd %hd %hd", &a, &b, &c);
                if (c != 0) {
                    NSString *key = [NSString stringWithFormat:@"%hd", c];
                    NSMutableArray *secDevices = [map valueForKey:key];
                    NSArray *device = [NSArray arrayWithObjects:[NSNumber numberWithInt:a], [NSNumber numberWithInt:b], nil];
                    if (secDevices) {
                        [secDevices addObject:device];
                    } else {
                        secDevices = [NSMutableArray arrayWithObject:device];
                        [map setValue:secDevices forKey:key];
                    }
                } else {
                    objs[masterDeviceCount][0] = a;
                    objs[masterDeviceCount][1] = b;
                    objs[masterDeviceCount][2] = i+1;
                    masterDeviceCount += 1;
                }
            }
            
            int dp0[n+1];
            int dp1[n+1];
            memset(dp0, 0, sizeof(dp0));
            
            for (int i = 1; i<=masterDeviceCount; i++) {
                int16_t v = objs[i-1][0];
                int16_t p = objs[i-1][1];
                NSString *key = [NSString stringWithFormat:@"%hd", objs[i-1][2]];
                NSMutableArray *secDevices = [map valueForKey:key];
                if (secDevices == nil) {
                    memcpy(dp1, dp0, sizeof(dp0));
                    for (int j = 1; j<=n; j++) {
                        if (v<=j) {
                            dp0[j] = MAX(dp1[j-v] + v*p, dp1[j]);
                        }
                    }
                } else {
                    int degree = v*p;
                    for (int j = 0; j<=n; j++) {
                        if (v>j) {
                            dp1[j] = dp0[j];
                        } else {
                            dp1[j] = dp0[j-v] + degree;
                        }
                    }
                    
                    int dp2[n+1];
                    for (NSArray *device in secDevices) {
                        int vs = [[device objectAtIndex:0] intValue];
                        memcpy(dp2, dp1, sizeof(dp1));
                        for (int k = v+vs; k <= n; k++) {
                            int ps = [[device objectAtIndex:1] intValue];
                            dp1[k] = MAX(dp2[k], dp2[k-vs] + vs*ps);
                        }
                    }
                    for (int j = 0; j<=n; j++) {
                        dp0[j] = MAX(dp0[j], dp1[j]);
                    }
                }
            }
            
            printf("%d\n", dp0[n]);
        }
    }
    return 0;
}
//5 5
//2 3 5
//2 3 5
//1 3 0
//1 2 0
//1 1 0

//10 5
//8 2 0
//4 5 1
//3 5 1
//4 3 0
//5 2 0
