#include <stdio.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include <sys/types.h>
#include <stdlib.h>

int main()
{
	pid_t pid; //numéro du pid actuel

	int fdpvf[2];
	int fdfvp[2];

	char tmp;
	
	pipe(fdpvf); //tuyau de communication du père vers le fils
	pipe(fdfvp); //tuyau de communication du fils vers le père

	pid = fork(); 
	if (pid == 0) // processus fils
	{
		srand (getpid()); // création d'une graine aléatoire en fonction du pid
		int reponse = rand() % 10000; // création de la réponse attendue
		int proposition = 0;
		int i;
		while (proposition != -1) // attente de la proposition -1 pour arrêter le programme
		{
			read(fdpvf[0], &proposition, sizeof(proposition)); // lecture de la proposition envoyée dans le tuyau du père vers le fils
			if (proposition < reponse) // envoie de l'indication <, > ou = au père en fonction de la proposition
			{
				tmp = '>';
			 	write(fdfvp[1], &tmp, sizeof(char)); // écriture de l'indication dans la variable tmp envoyée dans le tuyau du fils vers le père
			}
			else if (proposition == reponse) 
			{
				tmp = '=';
				write(fdfvp[1], &tmp, sizeof(char));
			}
			else {
				tmp = '<';
				write(fdfvp[1], &tmp, sizeof(char));
			}
		}
		printf("Bravo !\n"); 
	}
	else // processus père
	{
	
		int i;
		int min=0;
		int max=10000;
		int supposition;
		int compteur = 0;
		while(1)
		{
			supposition = (min + max) / 2; // teste la valeur médiane 
			i = supposition;
			write(fdpvf[1], &supposition, sizeof(supposition)); 
			compteur++;
			read(fdfvp[0], &tmp, sizeof(char));
			if (tmp == '<') max = supposition; // mise à jour de la borne max suite à l'indication inférieure du fils
			else if (tmp == '>') min = supposition; // mise à jour de la borne min suite à l'indication supérieure du fils
			else
			{
				supposition = -1;
				write(fdpvf[1], &supposition, sizeof(supposition)); // envoie d'une supposition -1 pour dire au fils que le programme se termine
				break; // fin de la boucle while(1)
			}
		}
		printf("La réponse était %d, et Joe a trouvé en %d tentatives\n", i, compteur);
	}
}

