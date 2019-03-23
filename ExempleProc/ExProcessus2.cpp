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
  printf("\n\033[34mLe père a pour PID %d\033[0m",pid_pere);
  if((pid[0] = fork()) == 0)
  {
      /* Processus fils */
      printf("\nDébut du fils 1.");
      printf("\n\033[34mLe fils 1 a pour pid %d et son père est %d.\033[0m", getpid(), getppid());
    if((pid[1] = fork()) == 0)
    {
      /* Processus petit-fils */
      printf("\nDébut du fils 2.");
      printf("\n\033[34mLe fils 2 a pour pid %d et son père est %d.\033[0m", getpid(), getppid());
    }
    else
    {
      /* Processus père du petit-fils */
     printf("\n\033[32mFils 2 créé avec pid = %d.\033[0m", pid[1]);
    } /* end else */
    exit(0);
  } /* end if */
  else
  {
    /* Processus père */
    printf("\n\033[32mFils 1 créé avec pid = %d.\033[0m", pid[0]);
  } /* end else */
  waitpid(pid[1], &status, 0);
  printf("\nFin du fils 2.");
  waitpid(pid[0], &status, 0);
  printf("\nFin du fils 1.");
  /* next i */
  printf("\n");
  return 0;
} /* end main */
