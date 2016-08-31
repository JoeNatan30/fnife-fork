#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>

/* Este programa crea procesos hijos en forma vertical.	*/
/* Es decir, este a su vez crea otro y asi en forma sucesiva .							*/
/* Ejem 2.5 del libro de UNIX Pro. Pract - key 				*/
/* 													steve	*/
/* modificado por a.Bello									*/


#define N 8

int main(void)
{
	int i,status;
	pid_t child; /* tipo definido en types.h*/
	
	
	for(i=0;i<4; ++i) 	if((child = fork())<= 0) break;
	fprintf(stderr,"Esta es la vuelta Nro %d \n",i);
	fprintf(stderr,"Recibi de fork el valor de %d \n",child);
	fprintf(stderr,"Soy el proceso %d con padre %d\n\n",getpid(),getppid());
	wait(&status);
	return 0;
}
