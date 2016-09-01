#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int main(void){
int i,status;
pid_t child, inicio;

inicio = getppid();

for(i=1;i<4;++i)
   if(child = fork()) break;//Entra a break cuando es padre
//OJO: El hijo que hace fork es padre
   fprintf(stderr,"Esta es la vuelta Nro %d\n",i);
   fprintf(stderr,"Recibi de fork el valor de %d\n",child);
   fprintf(stderr,"Soy el proceso %d con padre  %d\n\n",getpid(),getppid());
   wait(&status);
   
   if(child==0) system("pstree > process_chain.txt");
   //if(inicio==getppid()) system("pstree > process_chain.txt");
    return 0;
}
