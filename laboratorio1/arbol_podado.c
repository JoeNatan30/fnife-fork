
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#define N 40
void hijo(int x , int *fd){
	
	int y ,mypid ; 
	for(y = 0 ; y<x ;y++)
		if(fork()>0) break;
	mypid = getpid() ; 
	write(fd[1], &mypid,sizeof(int));
	while(1);
	}
int main(void){
	int x ,z , np ,fd[2] , pids[N] , total ; 
	char cmd[15] ;
	np =  2 ; 	
	pipe(fd);
	sprintf(cmd, "pstree -lc %d",getpid());
	for(x = 0; x<np;x++){
		if (fork() == 0) hijo(x,fd);
	}
	total = (1+np)*np/2;
	for(z=0;z<total;z++) read(fd[0], &pids[z],sizeof(int));
	system(cmd);
	for(z=0;z<total;z++) kill(pids[z],SIGTERM); 
	return 0; 
}
