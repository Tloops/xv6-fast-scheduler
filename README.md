# xv6-fast-scheduler

implement a fast-scheduler based on HUST-OS/xv6-k210

## Setting up and running tests for fast-scheduler

You can follow the instruction in [HUST-OS](https://github.com/HUST-OS/xv6-k210#run-on-qemu-system-riscv64) repository

```
make fs
make run platform=qemu
```

Ps: Press [Ctrl + A] then [X] to quit qemu.

When you start running the operating system, try the following user program:

```
$ testqos
```

This runs 4 tests in `testqos.c` and shows the scheduler states during the test.

## Implementation

Originally, the scheduler is simply using round-robin.

Firstly, three fields are added to the struct `proc`:

```c
// proc.h
struct proc {
  // ...
  int qos;                      // quality of service, the larger the more urgent
  int last_tick;                // last tick using cpu
  int critical;                 // 0 not critical 1 critical
};
```

- `qos`: the quality of service value between 0 and 100, the larger this value is, the more urgent the process is

- `last_tick`: the last time this process being scheduled

- `critical`: the process is critical or not, 0 means not critical, 1 means critical

Also, we should also let the user to change the `qos` and `critical` value. So two syscalls `setqos` and `setcrt` are implemented:

```c
//sysproc.c
uint64
sys_setqos(void)
{
    int qos;
    if(argint(0, &qos) < 0)
      return -1;
    if(qos < 0 || qos > 100)
      return -1;
    int last_qos = myproc()->qos;
    myproc()->qos = qos;
    printf("pid: %d qos: %d -> %d last_tick: %d\n", myproc()->pid, last_qos, qos, myproc()->last_tick);
    if(qos < last_qos)
      yield(); // yield current progress if the qos is smaller
    return last_qos;
}

uint64
sys_setcrt(void)
{
    int crt;
    if(argint(0, &crt) < 0)
      return -1;
    int last_crt = myproc()->critical;
    if(crt)
      myproc()->critical = 1;
    else
      myproc()->critical = 0;
    printf("change pid %d to critical proc\n", myproc()->pid);
    //  if(last_crt && !crt)
    yield(); // yield current progress anyway
    return last_crt;
}
```

Then we change the way we choose the next process in the scheduler. Instead of finding the next available process, the new scheduler should find the process with the largest `latency-nice` value, here we simply calculate this value by the formula: 

```c
latency_nice = alpha * qos + beta * (cur_tick - last_tick);
```

Adjust of the parameters `alpha` and `beta` is still an important work to do in the future. Here we just use `alpha = 5` and `beta = 1`. To use `latency_nice` can avoid starvation, and it is also easy to evaluate.

So every time we start from the next process of the process last time we scheduled, go through all the runnable process in the array `proc` which stores all the processes. If the process is a critical process, we also record it in `criticalProc`.

```c
int maxQos = -1;
struct proc *maxProc = NULL;
struct proc *criticalProc = NULL;
int cur_tick = get_tick();
int start = last_index+1;
for(int i = start; i < start + NPROC; i++) {
  p = proc + (i % NPROC);
  acquire(&p->lock);
  int eval = 5 * p->qos + (cur_tick - p->last_tick);
  if(p->state == RUNNABLE && p->critical && criticalProc == NULL) {
    criticalProc = p;
    last_critical_index = i % NPROC;
  }
  if(p->state == RUNNABLE && eval > maxQos) {
    if(maxProc != NULL) {
      release(&maxProc->lock);
    }
    maxQos = eval;
    maxProc = p;
    last_index = i % NPROC;
  }
  if(maxProc != p && criticalProc != p) {
    release(&p->lock);
  }
}
```

Now we may get two candidate processes: `criticalProc` and `maxProc`.

As shown in the design document, we want the critical processes to be scheduled as soon as possible and use up to 90% time on them.

So we judge if the `cur_ticks % 10 == 0`, if yes, execute `maxProc`, if no, execute `criticalProc`.

How to switch context is already implemented in the origin HUSTOS, so we won't be talked about it anymore.

Finally, it is important to test if this is really doing its job. So we wrote **4** test cases for the scheduler in `xv6-user/testqos.c` with a useful new syscall called `donothing`. You can run it in the user shell using `qemu`.

## Future work

The functions of the fast-scheduler are fully implemented. 

However, the real-time performance is hard to estimate. 

More experiment and tests are needed to further improve the effiencicy and adjust the parameters.
