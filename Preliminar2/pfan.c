#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

/* Este programa crea procesos hijos en forma horizontal.	*/
/* Es decir el padre crea N hijos.							*/
/* Ejem 2.6 del libro de UNIX Pro. Pract - key 				*/
/* 													steve	*/
/* modificado por a.Bello									*/


#define N 8

int main(void)
{
	int i,status;
	pid_t child,pid_padre;
	
	
	pid_padre = getpid();
	for(i=0;i<N; ++i)
		if((child = fork())<= 0) break;
		else fprintf(stderr,"Ciclo Nro %d \n",i);
	fprintf(stderr,"Proceso con pid=%d y pid de padre= %d\n",getpid(),getppid());
	if(pid_padre==getpid()) for(i=0;i<N;++i) wait(&status);
	return 0;
}
