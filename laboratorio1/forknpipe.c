#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define BUFSIZE 64
#define WLOOP 5

int main(void){
   char buffer[BUFSIZE];
   char message[] = "Hello, what's up?\n";

   int ii, pipe_fd[2];
   pipe(pipe_fd);
   
   if( fork() == 0){ //hijo
      close(pipe_fd[0]);
      printf("I am PID[%d] hijo. \n", (int) getpid() );
      for(ii=0;ii<WLOOP;ii++)
   	 write(pipe_fd[1],message,sizeof(message)-1);
      close(pipe_fd[1]);
   }
   else{//padre
      close(pipe_fd[1]);
      printf("I am PID[%d] padre. \n",(int)getpid() );
      memset(buffer,0, sizeof(buffer));//setea la memoria en el buffer de "0";
      while((ii=read(pipe_fd[0], buffer, BUFSIZE-1))  != 0){
	 printf("PARENT READ[%d]:\n%s\n",(int) ii, buffer);
         memset(buffer,0,sizeof(buffer));
      }
      close(pipe_fd[0]);
   }
   return 0;
}
