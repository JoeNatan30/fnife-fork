#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <math.h>
#include <string.h>
#define BUFSIZE 64

int main(void){
	char buffer1[BUFSIZE], buffer2[BUFSIZE];
	int p_this, p_prev, p_no1, p_no2;
	int ii, jj, fd_pipe[4][2];
	pid_t mypid;
 
	memset(buffer1, 0, BUFSIZE);
	memset(buffer2, 0, BUFSIZE);

	for(ii=0;ii<4;ii++)
		pipe(fd_pipe[ii]);

	ii = (fork() != 0 ) ? 0 : 2;// El padre se lleva 0 y el hijo se lleva 2
	jj = (fork() != 0 ) ? 0 : 1;// El padre se lleva 0 y el hijo se lleva 1

//Cerrado de entradas
	p_this = ii + jj;
	close(fd_pipe[p_this][0]);

	p_prev = (p_this + 3) % 4;
	close(fd_pipe[p_prev][1]);

	p_no1 = (p_this + 1) % 4;
	close(fd_pipe[p_no1][0]);
	close(fd_pipe[p_no1][1]);

	p_no2 = (p_this + 2) % 4;
	close(fd_pipe[p_no2][0]);
	close(fd_pipe[p_no2][1]);
	
// Envio de mensaje
	mypid = getpid();
	sprintf(buffer1," A message from PID[%d].\n", (int) mypid);
	write(fd_pipe[p_this][1], buffer1, BUFSIZE-1);
	close(fd_pipe[p_this][1]);

//Lectura de mensaje
	while((read(fd_pipe[p_prev][0], buffer2, BUFSIZE-1)) !=0) {
		waitpid(-1,NULL,0);//Esperar mensaje
		printf("PID[%d] IS WAITING:\n%s\n", (int) mypid, buffer2);
	}
	close(fd_pipe[p_prev][0]);
	return 0;
}
