//
// Created by xiaonn on 5/26/21.
//

#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int main(int argc, char *argv[])
{
  int pid = fork();
  if(pid) {
    //father process
    int pid2 = fork();
    if(pid2) {
      //father process
      setqos(45);
      for (int i = 0; i < 100000; ++i) {

      }
      printf("[%d] finished\n", getpid());
    }
    else {
      //son2 process
      setqos(49);
      for (int i = 0; i < 100000; ++i) {

      }
      printf("[%d] finished\n", getpid());
    }
  }
  else {
    //son1 process
    setqos(47);
    for (int i = 0; i < 100000; ++i) {

    }
    printf("[%d] finished\n", getpid());
  }
  exit(0);
}