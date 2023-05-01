//
//  main.m
//  HJ24 合唱队
//
//  Created by 徐恩 on 2023/5/1.
//

#import <Foundation/Foundation.h>
#define N 3000
      
int main()
{
    int i,j,n,len,low,mid,high,temp;
    int max;
    int stu[N] = {0};
    int a[N] = {0}, b[N] = {0};     // 表示截至第N个元素对应的最长递增子序列长度，和最长递减子序列长度
    int a_end[N] = {0}, b_end[N] = {0};
    while(scanf("%d",&n) != EOF)
    {
        for(i = 0;i < n;i++)
        {
            scanf("%d",&stu[i]);
            a[i] = 1;   // 默认为1
            b[i] = 1;
        }
      
        // 求最长递增子序列
        a_end[0] = -1;
        a_end[1] = stu[0];
        len = 1;
        for(i = 1; i < n; i++)
        {
            low = 0;
            high = len;
            // 若第i个元素大于所有元素对应最长递增子序列最后一个元素，则直接+1
            if(stu[i] > a_end[high])
                low = high + 1;
            else
            // 若第i个元素不大于所有元素对应最长递增子序列最后一个元素，则从第一个元素开始重新计算最长递增子序列
            // 且其最长递增子序列长度必定不超过上一个元素对应最长递增子序列长度
            {
                // 二分法确定第i个元素在上一个元素对应最长递增子序列中位置
                while(low <= high)
                {
                    mid = (low + high)/2;
                    if(stu[i] > a_end[mid])
                        low = mid + 1;
                    else
                        high = mid - 1;
                }
            }
            a[i] = low;
            a_end[low] = stu[i];
            len = (low > len) ? len+1 : len;
        }
              
        // 逆序
        for(i = 0, j = n - 1; i < j; i++, j--)
        {
            temp = stu[i];
            stu[i] = stu[j];
            stu[j] = temp;
        }
        // 逆序后求最长递增子序列
        b_end[0] = -1;
        b_end[1] = stu[0];
        len = 1;
        for(i = 1;i < n;i++)
        {
            low = 0;
            high = len;
            if(stu[i] > b_end[high])
                low = high + 1;
            else
            {
                while(low <= high)
                {
                    mid = (low + high)/2;
                    if(stu[i] > b_end[mid])
                        low = mid + 1;
                    else
                        high = mid - 1;
                }
            }
            b[i] = low;
            b_end[low] = stu[i];
            len = (low > len) ? len+1 : len;
        }
        // 对逆序后最长递增子序列长度再次逆序，得到原序列的最长递减子序列长度
         for(i = 0,j = n-1 ;i < j ; i++, j--)
        {
            temp = b[i];
            b[i] = b[j];
            b[j] = temp;
        }
        max = 0;
              
        // 求合唱队最多的人数 max-1，该位置左右分别为最长递增和递减子序列
        for(i = 0; i < n; i++)
        {
             max = (a[i] + b[i])>max?(a[i] + b[i]):max;
        }
        printf("%d\n",n-max+1);
    }
    return 0;
}
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        int n;
//        while (scanf("%d", &n) != EOF) {
//            int s[n];
//            for (int i = 0; i<n; i++) {
//                scanf("%d", &s[i]);
//            }
//
//            int dp0[n];
//            int dp1[n];
//
//            for (int i = 0; i<n; i++) {
//                dp0[i] = 1;
//                dp1[i] = 1;
//            }
//
//            for (int i = 0; i<n; i++) {
//                for (int j = i + 1; j<n; j++) {
//                    if (s[i] < s[j]) {
//                        dp0[j] = dp0[i] + 1;
//                    }
//                }
//            }
//
//            for (int i = n-1; i>=0; i--) {
//                for (int j = i - 1; j>=0; j--) {
//                    if (s[i] < s[j]) {
//                        dp1[j] = dp1[i] + 1;
//                    }
//                }
//            }
//
//            int max = 0;
//            for (int i = 0; i<n; i++) {
//                max = MAX(max, dp0[i]+dp1[i]);
//            }
//
//            printf("%d\n", n-(max-1));
//        }
//    }
//    return 0;
//}

//8
//186 186 150 200 160 130 197 200

//12
//1 3 2 4 7 5 6 7 8 5 6 3

//124
//16 103 132 23 211 75 155 82 32 48 79 183 13 91 51 172 109 102 189 121 12 120 116 133 79 120 116 208 47 110 65 187 69 143 140 173 203 35 184 49 245 50 179 63 204 34 218 11 205 100 90 19 145 203 203 215 72 108 58 198 95 116 125 235 156 133 220 236 125 29 235 170 130 165 155 54 127 128 204 62 59 226 233 245 46 3 14 108 37 94 52 97 159 190 143 67 24 204 39 222 245 233 11 80 166 39 224 12 38 13 85 21 47 25 180 219 140 201 11 42 110 209 77 136
