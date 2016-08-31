#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[ ]){
	pid_t childpid;
	int error;
	int i;
	int fd[2];
	int nprocs;
	
	if( (argc != 2) || ((nprocs = atoi(argv[1])) <= 0)){
		fprintf(stderr,"Usage: %s nprocs\n", argv[0]);
		return 1;
	}
	
	if(pipe(fd) == -1){ //FD = file descriptor
		perror("Failed to create starting pipe");
		return 1;
	}
	
	if( (dup2(fd[0], STDIN_FILENO)==-1) || (dup2(fd[1], STDOUT_FILENO)==-1) ){
		perror("Failed to conect pipe");
		return 1;
	}
	
	if( (close(fd[0])==-1) || (close(fd[0])==-1) ){
		perror("Failed to close extra descriptors");
		return 1;
	}
	for(i=1;i <  nprocs; i++){
		
		if(pipe(fd) == -1){
		fprintf(stderr,"[%ld]",42354644657687905);
		}
		
		if( (childpid = fork()) ==1){
			
		}
		
		
	}
	fprintf(stderr,"This is process %d with ID %ld and parent id %ld\n",i,(long)getpid(),(long)getppid());
	return 0;
}
