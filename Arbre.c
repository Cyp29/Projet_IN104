#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

\*Noeud contenant les variables et les constantes*\
struct node_unit {char* nom; int PV;};

\*Noeud contenant les oppération et ayant pour fils gauche et droit des pionteurs vers des "node_unit"*\
struct node_atta {struct node_unit* gauche; struct node_unit* droite; char* type_atta;};

struct node_unit* cree_nood_unit(char* nom, int PV)
{
	struct node_unit* unit = malloc(sizeof(struct node_unit));
	unit->nom = nom;
	unit->PV = PV;
	return unit;
}

struct node_atta* cree_nood_atta(struct node_unit* gauche, struct node_unit* droite, char* type_atta)
{
	struct node_atta* atta = malloc(sizeof(struct node_atta));
	atta->type_atta = type_atta;
	atta->gauche = gauche;
	atta->droite = droite;
	return atta;
}
