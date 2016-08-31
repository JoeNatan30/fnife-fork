#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int main(void){
    pid_t child;
    int dumb;
    if(child=fork()){
	fprintf(stderr,"\nFork devolvio %d por tanto soy el padre con ID = %d",child,getpid());
	dumb=wait();
    }
    else{
	fprintf(stderr,"\nFork devolvio %d por tanto soy el hijo con ID = %d\n",child,getpid());
	system(frase);
    }
    return 0;
}
