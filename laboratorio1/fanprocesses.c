#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int main(void){
   int i,status;
   pid_t child, pid_padre;

   pid_padre = getpid();

   for(i=1;i<4;++i)
        if((child = fork())<=0) break;//padre entra al break
   	else fprintf(stderr,"Este es el ciclo N° %d y se está creando el proceso %d\n",i,child);//hijo imprime valor
   if(pid_padre==getpid())
  	for(i=1;i<4;++i)
	    wait(&status);
   fprintf(stderr,"Este es el proceso %d con padre %d\n",getpid(),getppid());
   if(child==0) system("pstree > proceso_fan.txt");
   return 0;
}		
