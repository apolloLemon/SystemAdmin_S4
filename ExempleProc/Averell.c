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
		int suposition;
		int compteur = 0;
		while(1)
		{
			for (i=0; i<10000;i++) // teste tous les nombres de 0 à 10000
			{
				suposition = i; 
				write(fdpvf[1], &suposition, sizeof(suposition)); // envoie de la supposition au fils 
				compteur++;
				read(fdfvp[0], &tmp, sizeof(char));
				if (tmp == '=') // réponse trouvée
				{
					suposition = -1;
					write(fdpvf[1], &suposition, sizeof(suposition)); // envoie d'une supposition -1 pour dire au fils que le programme se termine
					break; // fin de la boucle while(1)
				}
			}
			printf("La réponse était %d, et Averell a trouvé en %d tentatives\n", i, compteur);
			break;
		}
		
	}
}

