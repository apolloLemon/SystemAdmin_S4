#include <stdio.h>  /* pour printf() */
#include <stdlib.h> /* pour exit() */
#include <unistd.h> /* pour fork(), sleep(), getpid() */
#include <sys/wait.h> /* pour waitpid() */
#define N 5

int main(void)
{
  int pid[N];
  int pid_pere;
  int i;
  int status;
  setbuf(stdout, NULL); /* Dé-bufferise stdout (ou FILE* f) */
  pid_pere = getpid();
  printf("\n\033[34mLe père a pour PID %d\033[0m",pid_pere); //affichage du PID du père ( \033[34m correspond à la coloration du texte dans le terminal et \033[0m la fin de la coloration) %d correspond à l'affichage d'un entier en c, on place alors le paramêtre à afficher après le texte (ici pid_pere)
  for(i = 0; i < N; i++)
  {
    if((pid[i] = fork()) == 0) // fork() crée un processus fils à partir du processus actuel (on test ensuite le pid si celui-ci est égal à 0 alors on se trouve dans le fils)
    {
      /* Processus fils */
      printf("\nDébut du fils %d.", i + 1);
      printf("\n\033[34mLe fils %d a pour pid %d et son père est %d.\033[0m", i + 1, getpid(), getppid()); //getppid renvoie le pid du père du processus actuel.
      sleep(i + 1);
      exit(0);
    } /* end if */
    else
    {
      /* Processus père */
      printf("\n\033[32mFils %d créé avec pid = %d.\033[0m", i + 1, pid[i]);
    } /* end else */
  } /* next i */
  /* Attente de la fin des fils */
  for(i = N - 1; i >= 0; i--)
  {
    printf("\nAttente de la fin du fils %d...", i + 1);
    waitpid(pid[i], &status, 0); // attend le signal de terminaison du processus i
    printf("\n\033[31mFin du fils %d.\033[0m", i + 1);
  } /* next i */
  printf("\n");
  return 0;
} /* end main */
