#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define DER 1
#define IZQ 0

int main(int narg, char *argv[]){
   int n;
   
   n = atoi(argv[1]);
   
   if(n>0)
       arbolbinario(n,2,IZQ);
   else printf("elija un valor positivo mayor que cero\n");
}

void arbolbinario(int n,int pos,int num){
   pid_t  child;
   if(n>0){
      child = fork();
      
   }
}

