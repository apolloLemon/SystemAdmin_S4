//Création d'un processus zombi
#include <stdlib.h> 
#include <sys/types.h> 
#include <unistd.h> 
int main() 
{ 
    pid_t child_pid = fork(); // création d'un processus fils 
  
    // processus parent  
    if (child_pid > 0) // Mise en sommeil du processus père
        sleep(5000); 
  
    // processus fils
    else        
        exit(0); // terminaison du processus fils
  
    return 0; 
} 

