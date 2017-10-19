# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#
# Récupérer une personne (prénom, nom, age) au clavier

author=Nicolas Borie
name=Données d'une personne entrée au clavier
title=Données d'une personne entrée au clavier
tag=input_output
template=/template/autograderC

text==

Compléter le programme suivant pour qu'il récupère deux chaines de
caractères ainsi qu'un entier donné au clavier durant l'exécution du
programme.
    
==

code==
#include ...

int main(int argc, char* argv[]){
  char prenom[64];
  char nom[64];
  int age;
	
  printf("Donner votre prénom :\n");
  ...
  printf("Donner votre nom :\n");
  ...
  printf("Donner votre age :\n");
  ...
  printf("Bonjour Martin Tartenpion, vous avez 99 ans\n");
  ...
}

==

solution==
#include <stdio.h>

int main(int argc, char* argv[]){
  char prenom[64];
  char nom[64];
  int age;
	
  printf("Donner votre prénom :\n");
  scanf("%s", prenom);
  printf("Donner votre nom :\n");
  scanf("%s", nom);
  printf("Donner votre age :\n");
  scanf("%d", &age);
  printf("Bonjour %s %s, vous avez %d ans\n", prenom, nom, age);
  return 0;
}


==

grader==
from graderC import graderII
import random

tests = [["Basique", "", "Martin\nTartenpion\n99\n"]]

graderII(tests)
==