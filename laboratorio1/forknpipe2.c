#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define BUFSIZE 64

int main(void){
   char buffer[BUFSIZE],buffer2[BUFSIZE];
   char p_this, p_prev, p_mo1, p_no2;
   int  fp_pipe[4][2], ii, jj;
   pid_t  mypid;

   memset(buffer1, 0, BUFSIZE);
   memset(buffer2, 0, BUFSIZE);

   for (ii=1; ii<4; ii++)
      pipe(fd_pipe[ii]);

  ii = (fork() != 0) ? 0 : 2;
  jj = (fork() != 0) ? 0 : 1;
 
  p_this
   return 0;
}
