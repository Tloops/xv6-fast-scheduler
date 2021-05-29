//
// Created by xiaonn on 5/26/21.
//

#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

// high qos should execute first
void
test1_different_qos()
{
  printf("-----test1 begin-----\n");

  int pid = fork();
  if(pid) {
    //father process
    int pid2 = fork();
    if(pid2) {
      //father process
      setqos(45);
      printf("[%d] finished\n", getpid());
    }
    else {
      //son2 process
      setqos(49);
      printf("[%d] finished\n", getpid());
      exit(0);
    }
  }
  else {
    //son1 process
    setqos(47);
    printf("[%d] finished\n", getpid());
    exit(0);
  }

  printf("-----test1 end-----\n");
}

// same qos execute in round robin
void
test2_same_qos()
{
  printf("-----test2 begin-----\n");

  int pid = fork();
  if(pid) {
    //father process
    int pid2 = fork();
    if(pid2) {
      //father process
      donothing(10);
      printf("[%d] finished\n", getpid());
    }
    else {
      //son2 process
      donothing(10);
      printf("[%d] finished\n", getpid());
      exit(0);
    }
  }
  else {
    //son1 process
    donothing(10);
    printf("[%d] finished\n", getpid());
    exit(0);
  }

  printf("-----test2 end-----\n");
}

// wait for a long time, low qos process may still be scheduled
void
test3_wait_long_time()
{
  printf("-----test3 begin-----\n");

  int pid = fork();
  if(pid) {
    //father process
    int pid2 = fork();
    if(pid2) {
      //father process
      setqos(39);
      donothing(50);
      printf("[%d] finished\n", getpid());
    }
    else {
      //son2 process
      setqos(35);
      printf("[%d] finished\n", getpid());
      exit(0);
    }
  }
  else {
    //son1 process
    setqos(37);
    donothing(30);
    printf("[%d] finished\n", getpid());
    exit(0);
  }

  printf("-----test3 end-----\n");
}


int main(int argc, char *argv[])
{
  test1_different_qos();
  test2_same_qos();
  test3_wait_long_time();
  exit(0);
}