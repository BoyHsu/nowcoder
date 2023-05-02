//
//  main.m
//  HJ48 从单向链表中删除指定值的节点
//
//  Created by 徐恩 on 2023/5/2.
//

#import <Foundation/Foundation.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n;
        struct ListNode *head, *hot, *p;
        int v, vPrev;
        head = malloc(sizeof(struct ListNode));
        while (scanf("%d %d", &n, &head->val) != EOF) {
            head->next = NULL;
            
            for (int i = 0; i<n-1; i++) {
                scanf("%d %d", &v, &vPrev);
                p = head;
                hot = NULL;
                while (p) {
                    if (p->val == vPrev) {
                        hot = p;
                    } else if (p->val == v) {
                        hot = NULL;
                        break;
                    }
                    p = p->next;
                }
                
                if (hot) {
                    struct ListNode *node = malloc(sizeof(struct ListNode));
                    node->val = v;
                    node->next = hot->next;
                    hot->next = node;
                }
            }
            int vDelete;
            scanf("%d", &vDelete);
            p = head;
            hot = NULL;
            while (p) {
                if (p->val == vDelete) {
                    if (hot) {
                        hot->next = hot->next->next;
                    } else {
                        head = head->next;
                    }
                    break;
                }
                hot = p;
                p = p->next;
            }
            
            p = head;
            while (p) {
                printf("%d ", p->val);
                p = p->next;
            }
            printf("\n");
        }
    }
    return 0;
}
