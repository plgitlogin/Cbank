# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Exponentiation rapide en récursif

author=Nicolas Borie
name=Exponentiation rapide en récursif
title=Exponentiation rapide en récursif
tag=function|recursion
template=/template/autograderC

text==

Écrire une fonction récursive *exp_rap* qui prend en paramètre deux
entiers *a* et *n* puis retourne *a^n*. Utilisez l'algorithme de
l'exponentiation rapide.

 * Pour *n = 0*, on a *a^0 = 1* (on considéra que *O^0 = 1* comme tout bon
algébriste).

 * Si *n* est un entier pair *n = 2q*, il suffira de mettre au carré le retour de l'appel récursif calculant *a^q*.
 
 * Si *n* est entier impair *n = 2q + 1*, il faudra mettre au carré de retour de l'appel récurif donnant *a^q* mais aussi le multiplié une dernière fois par *a*.
==

code==
... exp_rap(...){
...
}
==

solution==

int exp_rap(int a, int n){
  int partial; 
  if (n <= 0)
    return 1;
  partial = exp_rap(a, n/2);
  if ((n%2))
    return partial*partial*a;
  return partial*partial;
}
    


==
    
codeafter==
#include <stdlib.h>    
    
int main(int argc, char* argv[]){
  int a = atoi(argv[1]);
  int n = atoi(argv[2]);    
  printf("%d puissance %d : %d\n", a, n, exp_rap(a, n));
  return 0;
}
==

    
grader==
from graderC import graderII
import random
    
tests = [["Basique", "1 1", ""], 
	 ["Moyen", "12342312 0", ""],
	 ["Négatif", "-2 5", ""]]

tests.append(["Aléatoire", ' '.join([str(random.randint(1, 5)),
				     str(random.randint(1, 5))]), ""])
tests.append(["Aléatoire", ' '.join([str(random.randint(1, 5)),
				     str(random.randint(1, 5))]), ""])
tests.append(["Aléatoire", ' '.join([str(random.randint(1, 5)),
				     str(random.randint(1, 5))]), ""])
tests.append(["Aléatoire", ' '.join([str(random.randint(1, 5)),
				     str(random.randint(1, 5))]), ""])

graderII(tests)
==
