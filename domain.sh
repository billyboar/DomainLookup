#!/bin/bash

#w q x z
declare -a Cons=("b" "n" "m" "c" "t" "y" "p" "s" "r" "d" "f" "g" "h" "j" "k" "l" "v")
declare -a Vowels=("a" "i" "o" "e" "u") 


checker () {
    STATE=`whois $1 | grep 'No match for'`
    if [ "$STATE" != "" ]
    then
        echo "YES! $1"
    fi
}


:<<'COMMENT'
for a in "${Cons[@]}"; do
    for b in "${Cons[@]}"; do
        for c in "${Vowels[@]}"; do
            DOMAIN="${a}${c}${b}jar.com"
            checker $DOMAIN
        done
    done
done
COMMENT

:<<'COMMENT'
for a in "${Cons[@]}"; do
    for c in "${Vowels[@]}"; do
        #DOMAIN="${a}${c}me.com"
        DOMAIN="mail${c}${a}.com"
        checker $DOMAIN
    done
done

COMMENT


#:<<'COMMENT'
for a in "${Cons[@]}"; do
    for b in "${Vowels[@]}"; do
        for c in "${Cons[@]}"; do
            for d in "${Cons[@]}"; do
                DOMAIN="${a}${b}${c}${b}${d}.com"
                checker $DOMAIN
            done
        done
    done
done
#COMMENT
