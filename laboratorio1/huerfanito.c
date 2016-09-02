/**************************hUERFANITO**********************************/
#include <stdio.h>
#include <sys/types.h>
main ()
{
 int pid;
  printf ("I'm the original process with PID %d and PPID %d.\n",
         getpid (), getppid ());
 pid = fork (); /* Duplicate. Child and parent continue from here */
 if (pid != 0) /* Branch based on return value from fork () */
   {
     /* pid is nonzero, so I must be the parent */
     printf ("I'm the parent process with PID %d and PPID %d.\n",
              getpid (), getppid ());
     printf ("My child's PID is %d\n", pid);
   }
else
  {
   /* pid is zero, so I must be the child */
   sleep (5); /* Make sure that the parent terminates first */
   printf ("I'm the child process with PID %d and PPID %d.\n",
            getpid (), getppid ());
            if(pid==0)
				system("pstree -spl > arbolitohijo.txt");
  }
  if(pid)
				system("pstree -spl > arbolitopapi.txt");
 printf ("PID %d terminates.\n", getpid () ); /* Both processes
execute this */
}
/************************************************************/