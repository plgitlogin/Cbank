# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Trouver l'index d'un entier dans un tableau d'entiers

author=Nicolas Borie
name=Trouver l'index d'un élément
title=Trouver l'index d'un élément
tag=array
template=/template/autograderC

text==
Écrire une fonction C *find_index* qui prend en paramètre un tableau
d'entiers, le nombre d'éléments contenu dans le tableau ainsi qu'un
entier recherché.


La fonction recherchera l'index le plus petit tel que le tableau
contienne l'élément recherché à cet index. Si la fonction ne trouve
pas l'entier recherché dans le tableau, la fonction retournera -1.


Pour information, le programme test recherchera le dernier entier
parmis les précédants nombres qui lui ont été donnés en argument.
==

code==
... find_index(...){
    /* Votre code ici */
}

==

solution==

int find_index(int* tab, int size, int e){
  int i;	

  for (i=0 ; i<size ; i++)
    if (tab[i] == e)
    return i;

  return -1;
}

==

codeafter==
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
  int nb_term = argc-1;
  int* tab = (int*)malloc(nb_term*sizeof(int));
  int i;

  for (i=0 ; i<nb_term ; i++){
    tab[i] = atoi(argv[i+1]);
  }
  nb_term -= 1;

  printf("Index de %d : %d\n", tab[nb_term], find_index(tab, nb_term-1, tab[nb_term]));
  free(tab);
  return 0;
}

==

grader==
from graderC import graderII
import random

tests = [["Exécution simple", "0 1 2 3 4 5 6 5", ""],
         ["Quelques éléments", "12 -3 52 0 41 52", ""],
         ["Tableau vide", "0 1 2 3 4 5 6 -3", ""]]

for k in range(5):
    chaine_tab_alea = ""
    for i in range(random.randint(10, 20)):
        chaine_tab_alea += (" " + str(random.randint(-5, 5)))
    tests.append(["Aléatoire", chaine_tab_alea, ""])

graderII(tests)
==
