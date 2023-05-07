//
//  main.m
//  HJ88 扑克牌大小
//
//  Created by 徐恩 on 2023/5/7.
//

#import <Foundation/Foundation.h>

#define N 15

char cards1[N], cards2[N];
int temCards[5];

typedef NS_ENUM(NSUInteger, CardType) {
    CardTypeUnknown,
    CardTypeSingle,
    CardTypePair,
    CardTypeTriplet,
    CardTypeSequence,
    CardTypeBomb,
    CardTypeRocket
};

typedef NS_ENUM(NSUInteger, CardValue) {
    CardValueUnknown,
    CardValue3 = 3,
    CardValue4,
    CardValue5,
    CardValue6,
    CardValue7,
    CardValue8,
    CardValue9,
    CardValue10,
    CardValueJ,
    CardValueQ,
    CardValueK,
    CardValueA,
    CardValue2,
    CardValueJoker,
    CardValueJOKER
};

CardValue getValue(char *card, int len) {
    if (len == 2) {
        return CardValue10;
    }
    
    if (len == 5) {
        if (card[0] == 'j') {
            return CardValueJoker;
        } else {
            return CardValueJOKER;
        }
    }
    
    if (len != 1) {
        return CardValueUnknown;
    }
    
    if (card[0] > '2' && card[0] <= '9') {
        return card[0] - '0';
    }
    
    switch (card[0]) {
        case 'J': return CardValueJ;
        case 'Q': return CardValueQ;
        case 'K': return CardValueK;
        case 'A': return CardValueA;
        case '2': return CardValue2;
        default:  return CardValueUnknown;
    }
}

void getCardsInfo(char *cards, CardType *type, CardValue *value) {
    int len = 0;
    int i = 0;
    char *card = NULL;
    int cardLen = 0;
    while (cards[i] != '\0') {
        if (cards[i] == ' ') {
            temCards[cardLen++] = (int)getValue(card, len);
            card = NULL;
            len = 0;
        } else {
            if (!card) {
                card = cards + i;
            }
            len += 1;
        }
        i++;
    }
    if (card && len) {
        temCards[cardLen++] = (int)getValue(card, len);
    }
    
    *value = temCards[0];
    if (cardLen == 1) {
        *type = CardTypeSingle;
    } else if (cardLen == 2) {
        if (temCards[0] == CardValueJoker) {
            *type = CardTypeRocket;
        } else {
            *type = CardTypePair;
        }
    } else if (cardLen == 3) {
        *type = CardTypeTriplet;
    } else if (cardLen == 4) {
        *type = CardTypeBomb;
    } else if (cardLen == 5) {
        *type = CardTypeSequence;
    } else {
        *type = CardTypeUnknown;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (scanf("%[^-]", cards1) != EOF) {
            getchar();
            scanf("%[^\n]", cards2);
            getchar();
            
            CardType t1, t2;
            CardValue v1, v2;
            getCardsInfo(cards1, &t1, &v1);
            getCardsInfo(cards2, &t2, &v2);
            char *res = NULL;
            if (t1 == t2) {
                res = v1 > v2 ? cards1 : cards2;
            } else {
                if (t1 == CardTypeRocket) {
                    res = cards1;
                } else if (t2 == CardTypeRocket) {
                    res = cards2;
                } else if (t1 == CardTypeBomb) {
                    res = cards1;
                } else if (t2 == CardTypeBomb) {
                    res = cards2;
                }
            }
            
            if (res == NULL) {
                printf("ERROR\n");
            } else {
                printf("%s\n", res);
            }
        }
    }
    return 0;
}
