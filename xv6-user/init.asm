
xv6-user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	e04a                	sd	s2,0(sp)
   a:	1000                	addi	s0,sp,32

  // if(open("console", O_RDWR) < 0){
  //   mknod("console", CONSOLE, 0);
  //   open("console", O_RDWR);
  // }
  dev(O_RDWR, CONSOLE, 0);
   c:	4601                	li	a2,0
   e:	4585                	li	a1,1
  10:	4509                	li	a0,2
  12:	00000097          	auipc	ra,0x0
  16:	420080e7          	jalr	1056(ra) # 432 <dev>
  dup(0);  // stdout
  1a:	4501                	li	a0,0
  1c:	00000097          	auipc	ra,0x0
  20:	3e6080e7          	jalr	998(ra) # 402 <dup>
  dup(0);  // stderr
  24:	4501                	li	a0,0
  26:	00000097          	auipc	ra,0x0
  2a:	3dc080e7          	jalr	988(ra) # 402 <dup>

  for(;;){
    printf("init: starting sh\n");
  2e:	00001917          	auipc	s2,0x1
  32:	8c290913          	addi	s2,s2,-1854 # 8f0 <malloc+0xe8>
  36:	854a                	mv	a0,s2
  38:	00000097          	auipc	ra,0x0
  3c:	710080e7          	jalr	1808(ra) # 748 <printf>
    pid = fork();
  40:	00000097          	auipc	ra,0x0
  44:	35a080e7          	jalr	858(ra) # 39a <fork>
  48:	84aa                	mv	s1,a0
    if(pid < 0){
  4a:	02054963          	bltz	a0,7c <main+0x7c>
      printf("init: fork failed\n");
      exit(1);
    }
    if(pid == 0){
  4e:	c521                	beqz	a0,96 <main+0x96>
    }

    for(;;){
      // this call to wait() returns if the shell exits,
      // or if a parentless process exits.
      wpid = wait((int *) 0);
  50:	4501                	li	a0,0
  52:	00000097          	auipc	ra,0x0
  56:	358080e7          	jalr	856(ra) # 3aa <wait>
      if(wpid == pid){
  5a:	fca48ee3          	beq	s1,a0,36 <main+0x36>
        // the shell exited; restart it.
        break;
      } else if(wpid < 0){
  5e:	fe0559e3          	bgez	a0,50 <main+0x50>
        printf("init: wait returned an error\n");
  62:	00001517          	auipc	a0,0x1
  66:	8de50513          	addi	a0,a0,-1826 # 940 <malloc+0x138>
  6a:	00000097          	auipc	ra,0x0
  6e:	6de080e7          	jalr	1758(ra) # 748 <printf>
        exit(1);
  72:	4505                	li	a0,1
  74:	00000097          	auipc	ra,0x0
  78:	32e080e7          	jalr	814(ra) # 3a2 <exit>
      printf("init: fork failed\n");
  7c:	00001517          	auipc	a0,0x1
  80:	88c50513          	addi	a0,a0,-1908 # 908 <malloc+0x100>
  84:	00000097          	auipc	ra,0x0
  88:	6c4080e7          	jalr	1732(ra) # 748 <printf>
      exit(1);
  8c:	4505                	li	a0,1
  8e:	00000097          	auipc	ra,0x0
  92:	314080e7          	jalr	788(ra) # 3a2 <exit>
      exec("sh", argv);
  96:	00001597          	auipc	a1,0x1
  9a:	8ea58593          	addi	a1,a1,-1814 # 980 <argv>
  9e:	00001517          	auipc	a0,0x1
  a2:	88250513          	addi	a0,a0,-1918 # 920 <malloc+0x118>
  a6:	00000097          	auipc	ra,0x0
  aa:	334080e7          	jalr	820(ra) # 3da <exec>
      printf("init: exec sh failed\n");
  ae:	00001517          	auipc	a0,0x1
  b2:	87a50513          	addi	a0,a0,-1926 # 928 <malloc+0x120>
  b6:	00000097          	auipc	ra,0x0
  ba:	692080e7          	jalr	1682(ra) # 748 <printf>
      exit(1);
  be:	4505                	li	a0,1
  c0:	00000097          	auipc	ra,0x0
  c4:	2e2080e7          	jalr	738(ra) # 3a2 <exit>

00000000000000c8 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  c8:	1141                	addi	sp,sp,-16
  ca:	e422                	sd	s0,8(sp)
  cc:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ce:	87aa                	mv	a5,a0
  d0:	0585                	addi	a1,a1,1
  d2:	0785                	addi	a5,a5,1
  d4:	fff5c703          	lbu	a4,-1(a1)
  d8:	fee78fa3          	sb	a4,-1(a5)
  dc:	fb75                	bnez	a4,d0 <strcpy+0x8>
    ;
  return os;
}
  de:	6422                	ld	s0,8(sp)
  e0:	0141                	addi	sp,sp,16
  e2:	8082                	ret

00000000000000e4 <strcat>:

char*
strcat(char *s, const char *t)
{
  e4:	1141                	addi	sp,sp,-16
  e6:	e422                	sd	s0,8(sp)
  e8:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  ea:	00054783          	lbu	a5,0(a0)
  ee:	c385                	beqz	a5,10e <strcat+0x2a>
  f0:	87aa                	mv	a5,a0
    s++;
  f2:	0785                	addi	a5,a5,1
  while(*s)
  f4:	0007c703          	lbu	a4,0(a5)
  f8:	ff6d                	bnez	a4,f2 <strcat+0xe>
  while((*s++ = *t++))
  fa:	0585                	addi	a1,a1,1
  fc:	0785                	addi	a5,a5,1
  fe:	fff5c703          	lbu	a4,-1(a1)
 102:	fee78fa3          	sb	a4,-1(a5)
 106:	fb75                	bnez	a4,fa <strcat+0x16>
    ;
  return os;
}
 108:	6422                	ld	s0,8(sp)
 10a:	0141                	addi	sp,sp,16
 10c:	8082                	ret
  while(*s)
 10e:	87aa                	mv	a5,a0
 110:	b7ed                	j	fa <strcat+0x16>

0000000000000112 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 112:	1141                	addi	sp,sp,-16
 114:	e422                	sd	s0,8(sp)
 116:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 118:	00054783          	lbu	a5,0(a0)
 11c:	cf91                	beqz	a5,138 <strcmp+0x26>
 11e:	0005c703          	lbu	a4,0(a1)
 122:	00f71b63          	bne	a4,a5,138 <strcmp+0x26>
    p++, q++;
 126:	0505                	addi	a0,a0,1
 128:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 12a:	00054783          	lbu	a5,0(a0)
 12e:	c789                	beqz	a5,138 <strcmp+0x26>
 130:	0005c703          	lbu	a4,0(a1)
 134:	fef709e3          	beq	a4,a5,126 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 138:	0005c503          	lbu	a0,0(a1)
}
 13c:	40a7853b          	subw	a0,a5,a0
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret

0000000000000146 <strlen>:

uint
strlen(const char *s)
{
 146:	1141                	addi	sp,sp,-16
 148:	e422                	sd	s0,8(sp)
 14a:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 14c:	00054783          	lbu	a5,0(a0)
 150:	cf91                	beqz	a5,16c <strlen+0x26>
 152:	0505                	addi	a0,a0,1
 154:	87aa                	mv	a5,a0
 156:	4685                	li	a3,1
 158:	9e89                	subw	a3,a3,a0
 15a:	00f6853b          	addw	a0,a3,a5
 15e:	0785                	addi	a5,a5,1
 160:	fff7c703          	lbu	a4,-1(a5)
 164:	fb7d                	bnez	a4,15a <strlen+0x14>
    ;
  return n;
}
 166:	6422                	ld	s0,8(sp)
 168:	0141                	addi	sp,sp,16
 16a:	8082                	ret
  for(n = 0; s[n]; n++)
 16c:	4501                	li	a0,0
 16e:	bfe5                	j	166 <strlen+0x20>

0000000000000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	1141                	addi	sp,sp,-16
 172:	e422                	sd	s0,8(sp)
 174:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 176:	ce09                	beqz	a2,190 <memset+0x20>
 178:	87aa                	mv	a5,a0
 17a:	fff6071b          	addiw	a4,a2,-1
 17e:	1702                	slli	a4,a4,0x20
 180:	9301                	srli	a4,a4,0x20
 182:	0705                	addi	a4,a4,1
 184:	972a                	add	a4,a4,a0
    cdst[i] = c;
 186:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 18a:	0785                	addi	a5,a5,1
 18c:	fee79de3          	bne	a5,a4,186 <memset+0x16>
  }
  return dst;
}
 190:	6422                	ld	s0,8(sp)
 192:	0141                	addi	sp,sp,16
 194:	8082                	ret

0000000000000196 <strchr>:

char*
strchr(const char *s, char c)
{
 196:	1141                	addi	sp,sp,-16
 198:	e422                	sd	s0,8(sp)
 19a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 19c:	00054783          	lbu	a5,0(a0)
 1a0:	cf91                	beqz	a5,1bc <strchr+0x26>
    if(*s == c)
 1a2:	00f58a63          	beq	a1,a5,1b6 <strchr+0x20>
  for(; *s; s++)
 1a6:	0505                	addi	a0,a0,1
 1a8:	00054783          	lbu	a5,0(a0)
 1ac:	c781                	beqz	a5,1b4 <strchr+0x1e>
    if(*s == c)
 1ae:	feb79ce3          	bne	a5,a1,1a6 <strchr+0x10>
 1b2:	a011                	j	1b6 <strchr+0x20>
      return (char*)s;
  return 0;
 1b4:	4501                	li	a0,0
}
 1b6:	6422                	ld	s0,8(sp)
 1b8:	0141                	addi	sp,sp,16
 1ba:	8082                	ret
  return 0;
 1bc:	4501                	li	a0,0
 1be:	bfe5                	j	1b6 <strchr+0x20>

00000000000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	711d                	addi	sp,sp,-96
 1c2:	ec86                	sd	ra,88(sp)
 1c4:	e8a2                	sd	s0,80(sp)
 1c6:	e4a6                	sd	s1,72(sp)
 1c8:	e0ca                	sd	s2,64(sp)
 1ca:	fc4e                	sd	s3,56(sp)
 1cc:	f852                	sd	s4,48(sp)
 1ce:	f456                	sd	s5,40(sp)
 1d0:	f05a                	sd	s6,32(sp)
 1d2:	ec5e                	sd	s7,24(sp)
 1d4:	e862                	sd	s8,16(sp)
 1d6:	1080                	addi	s0,sp,96
 1d8:	8c2a                	mv	s8,a0
 1da:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1dc:	892a                	mv	s2,a0
 1de:	4981                	li	s3,0
    cc = read(0, &c, 1);
 1e0:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1e4:	4b29                	li	s6,10
 1e6:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 1e8:	0019849b          	addiw	s1,s3,1
 1ec:	0344d763          	ble	s4,s1,21a <gets+0x5a>
    cc = read(0, &c, 1);
 1f0:	4605                	li	a2,1
 1f2:	85d6                	mv	a1,s5
 1f4:	4501                	li	a0,0
 1f6:	00000097          	auipc	ra,0x0
 1fa:	1c4080e7          	jalr	452(ra) # 3ba <read>
    if(cc < 1)
 1fe:	00a05e63          	blez	a0,21a <gets+0x5a>
    buf[i++] = c;
 202:	faf44783          	lbu	a5,-81(s0)
 206:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 20a:	01678763          	beq	a5,s6,218 <gets+0x58>
 20e:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 210:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 212:	fd779be3          	bne	a5,s7,1e8 <gets+0x28>
 216:	a011                	j	21a <gets+0x5a>
  for(i=0; i+1 < max; ){
 218:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 21a:	99e2                	add	s3,s3,s8
 21c:	00098023          	sb	zero,0(s3)
  return buf;
}
 220:	8562                	mv	a0,s8
 222:	60e6                	ld	ra,88(sp)
 224:	6446                	ld	s0,80(sp)
 226:	64a6                	ld	s1,72(sp)
 228:	6906                	ld	s2,64(sp)
 22a:	79e2                	ld	s3,56(sp)
 22c:	7a42                	ld	s4,48(sp)
 22e:	7aa2                	ld	s5,40(sp)
 230:	7b02                	ld	s6,32(sp)
 232:	6be2                	ld	s7,24(sp)
 234:	6c42                	ld	s8,16(sp)
 236:	6125                	addi	sp,sp,96
 238:	8082                	ret

000000000000023a <stat>:

int
stat(const char *n, struct stat *st)
{
 23a:	1101                	addi	sp,sp,-32
 23c:	ec06                	sd	ra,24(sp)
 23e:	e822                	sd	s0,16(sp)
 240:	e426                	sd	s1,8(sp)
 242:	e04a                	sd	s2,0(sp)
 244:	1000                	addi	s0,sp,32
 246:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 248:	4581                	li	a1,0
 24a:	00000097          	auipc	ra,0x0
 24e:	198080e7          	jalr	408(ra) # 3e2 <open>
  if(fd < 0)
 252:	02054563          	bltz	a0,27c <stat+0x42>
 256:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 258:	85ca                	mv	a1,s2
 25a:	00000097          	auipc	ra,0x0
 25e:	190080e7          	jalr	400(ra) # 3ea <fstat>
 262:	892a                	mv	s2,a0
  close(fd);
 264:	8526                	mv	a0,s1
 266:	00000097          	auipc	ra,0x0
 26a:	164080e7          	jalr	356(ra) # 3ca <close>
  return r;
}
 26e:	854a                	mv	a0,s2
 270:	60e2                	ld	ra,24(sp)
 272:	6442                	ld	s0,16(sp)
 274:	64a2                	ld	s1,8(sp)
 276:	6902                	ld	s2,0(sp)
 278:	6105                	addi	sp,sp,32
 27a:	8082                	ret
    return -1;
 27c:	597d                	li	s2,-1
 27e:	bfc5                	j	26e <stat+0x34>

0000000000000280 <atoi>:

int
atoi(const char *s)
{
 280:	1141                	addi	sp,sp,-16
 282:	e422                	sd	s0,8(sp)
 284:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 286:	00054703          	lbu	a4,0(a0)
 28a:	02d00793          	li	a5,45
  int neg = 1;
 28e:	4805                	li	a6,1
  if (*s == '-') {
 290:	04f70363          	beq	a4,a5,2d6 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 294:	00054683          	lbu	a3,0(a0)
 298:	fd06879b          	addiw	a5,a3,-48
 29c:	0ff7f793          	andi	a5,a5,255
 2a0:	4725                	li	a4,9
 2a2:	02f76d63          	bltu	a4,a5,2dc <atoi+0x5c>
  n = 0;
 2a6:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 2a8:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2aa:	0505                	addi	a0,a0,1
 2ac:	0026179b          	slliw	a5,a2,0x2
 2b0:	9fb1                	addw	a5,a5,a2
 2b2:	0017979b          	slliw	a5,a5,0x1
 2b6:	9fb5                	addw	a5,a5,a3
 2b8:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 2bc:	00054683          	lbu	a3,0(a0)
 2c0:	fd06871b          	addiw	a4,a3,-48
 2c4:	0ff77713          	andi	a4,a4,255
 2c8:	fee5f1e3          	bleu	a4,a1,2aa <atoi+0x2a>
  return n * neg;
}
 2cc:	02c8053b          	mulw	a0,a6,a2
 2d0:	6422                	ld	s0,8(sp)
 2d2:	0141                	addi	sp,sp,16
 2d4:	8082                	ret
    s++;
 2d6:	0505                	addi	a0,a0,1
    neg = -1;
 2d8:	587d                	li	a6,-1
 2da:	bf6d                	j	294 <atoi+0x14>
  n = 0;
 2dc:	4601                	li	a2,0
 2de:	b7fd                	j	2cc <atoi+0x4c>

00000000000002e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e0:	1141                	addi	sp,sp,-16
 2e2:	e422                	sd	s0,8(sp)
 2e4:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2e6:	02b57663          	bleu	a1,a0,312 <memmove+0x32>
    while(n-- > 0)
 2ea:	02c05163          	blez	a2,30c <memmove+0x2c>
 2ee:	fff6079b          	addiw	a5,a2,-1
 2f2:	1782                	slli	a5,a5,0x20
 2f4:	9381                	srli	a5,a5,0x20
 2f6:	0785                	addi	a5,a5,1
 2f8:	97aa                	add	a5,a5,a0
  dst = vdst;
 2fa:	872a                	mv	a4,a0
      *dst++ = *src++;
 2fc:	0585                	addi	a1,a1,1
 2fe:	0705                	addi	a4,a4,1
 300:	fff5c683          	lbu	a3,-1(a1)
 304:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 308:	fee79ae3          	bne	a5,a4,2fc <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 30c:	6422                	ld	s0,8(sp)
 30e:	0141                	addi	sp,sp,16
 310:	8082                	ret
    dst += n;
 312:	00c50733          	add	a4,a0,a2
    src += n;
 316:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 318:	fec05ae3          	blez	a2,30c <memmove+0x2c>
 31c:	fff6079b          	addiw	a5,a2,-1
 320:	1782                	slli	a5,a5,0x20
 322:	9381                	srli	a5,a5,0x20
 324:	fff7c793          	not	a5,a5
 328:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 32a:	15fd                	addi	a1,a1,-1
 32c:	177d                	addi	a4,a4,-1
 32e:	0005c683          	lbu	a3,0(a1)
 332:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 336:	fef71ae3          	bne	a4,a5,32a <memmove+0x4a>
 33a:	bfc9                	j	30c <memmove+0x2c>

000000000000033c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 33c:	1141                	addi	sp,sp,-16
 33e:	e422                	sd	s0,8(sp)
 340:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 342:	ce15                	beqz	a2,37e <memcmp+0x42>
 344:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 348:	00054783          	lbu	a5,0(a0)
 34c:	0005c703          	lbu	a4,0(a1)
 350:	02e79063          	bne	a5,a4,370 <memcmp+0x34>
 354:	1682                	slli	a3,a3,0x20
 356:	9281                	srli	a3,a3,0x20
 358:	0685                	addi	a3,a3,1
 35a:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 35c:	0505                	addi	a0,a0,1
    p2++;
 35e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 360:	00d50d63          	beq	a0,a3,37a <memcmp+0x3e>
    if (*p1 != *p2) {
 364:	00054783          	lbu	a5,0(a0)
 368:	0005c703          	lbu	a4,0(a1)
 36c:	fee788e3          	beq	a5,a4,35c <memcmp+0x20>
      return *p1 - *p2;
 370:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 374:	6422                	ld	s0,8(sp)
 376:	0141                	addi	sp,sp,16
 378:	8082                	ret
  return 0;
 37a:	4501                	li	a0,0
 37c:	bfe5                	j	374 <memcmp+0x38>
 37e:	4501                	li	a0,0
 380:	bfd5                	j	374 <memcmp+0x38>

0000000000000382 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 382:	1141                	addi	sp,sp,-16
 384:	e406                	sd	ra,8(sp)
 386:	e022                	sd	s0,0(sp)
 388:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 38a:	00000097          	auipc	ra,0x0
 38e:	f56080e7          	jalr	-170(ra) # 2e0 <memmove>
}
 392:	60a2                	ld	ra,8(sp)
 394:	6402                	ld	s0,0(sp)
 396:	0141                	addi	sp,sp,16
 398:	8082                	ret

000000000000039a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 39a:	4885                	li	a7,1
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3a2:	4889                	li	a7,2
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <wait>:
.global wait
wait:
 li a7, SYS_wait
 3aa:	488d                	li	a7,3
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3b2:	4891                	li	a7,4
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <read>:
.global read
read:
 li a7, SYS_read
 3ba:	4895                	li	a7,5
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <write>:
.global write
write:
 li a7, SYS_write
 3c2:	48c1                	li	a7,16
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <close>:
.global close
close:
 li a7, SYS_close
 3ca:	48d5                	li	a7,21
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 3d2:	4899                	li	a7,6
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <exec>:
.global exec
exec:
 li a7, SYS_exec
 3da:	489d                	li	a7,7
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <open>:
.global open
open:
 li a7, SYS_open
 3e2:	48bd                	li	a7,15
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3ea:	48a1                	li	a7,8
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3f2:	48d1                	li	a7,20
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3fa:	48a5                	li	a7,9
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <dup>:
.global dup
dup:
 li a7, SYS_dup
 402:	48a9                	li	a7,10
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 40a:	48ad                	li	a7,11
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 412:	48b1                	li	a7,12
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 41a:	48b5                	li	a7,13
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 422:	48b9                	li	a7,14
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 42a:	48d9                	li	a7,22
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <dev>:
.global dev
dev:
 li a7, SYS_dev
 432:	48dd                	li	a7,23
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 43a:	48e1                	li	a7,24
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 442:	48e5                	li	a7,25
 ecall
 444:	00000073          	ecall
 ret
 448:	8082                	ret

000000000000044a <remove>:
.global remove
remove:
 li a7, SYS_remove
 44a:	48c5                	li	a7,17
 ecall
 44c:	00000073          	ecall
 ret
 450:	8082                	ret

0000000000000452 <trace>:
.global trace
trace:
 li a7, SYS_trace
 452:	48c9                	li	a7,18
 ecall
 454:	00000073          	ecall
 ret
 458:	8082                	ret

000000000000045a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 45a:	48cd                	li	a7,19
 ecall
 45c:	00000073          	ecall
 ret
 460:	8082                	ret

0000000000000462 <rename>:
.global rename
rename:
 li a7, SYS_rename
 462:	48e9                	li	a7,26
 ecall
 464:	00000073          	ecall
 ret
 468:	8082                	ret

000000000000046a <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 46a:	48ed                	li	a7,27
 ecall
 46c:	00000073          	ecall
 ret
 470:	8082                	ret

0000000000000472 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 472:	1101                	addi	sp,sp,-32
 474:	ec06                	sd	ra,24(sp)
 476:	e822                	sd	s0,16(sp)
 478:	1000                	addi	s0,sp,32
 47a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 47e:	4605                	li	a2,1
 480:	fef40593          	addi	a1,s0,-17
 484:	00000097          	auipc	ra,0x0
 488:	f3e080e7          	jalr	-194(ra) # 3c2 <write>
}
 48c:	60e2                	ld	ra,24(sp)
 48e:	6442                	ld	s0,16(sp)
 490:	6105                	addi	sp,sp,32
 492:	8082                	ret

0000000000000494 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 494:	7139                	addi	sp,sp,-64
 496:	fc06                	sd	ra,56(sp)
 498:	f822                	sd	s0,48(sp)
 49a:	f426                	sd	s1,40(sp)
 49c:	f04a                	sd	s2,32(sp)
 49e:	ec4e                	sd	s3,24(sp)
 4a0:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4a2:	c299                	beqz	a3,4a8 <printint+0x14>
 4a4:	0005ce63          	bltz	a1,4c0 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4a8:	2581                	sext.w	a1,a1
  neg = 0;
 4aa:	4301                	li	t1,0
  }

  i = 0;
 4ac:	fc040913          	addi	s2,s0,-64
  neg = 0;
 4b0:	874a                	mv	a4,s2
  i = 0;
 4b2:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 4b4:	2601                	sext.w	a2,a2
 4b6:	00000897          	auipc	a7,0x0
 4ba:	4aa88893          	addi	a7,a7,1194 # 960 <digits>
 4be:	a801                	j	4ce <printint+0x3a>
    x = -xx;
 4c0:	40b005bb          	negw	a1,a1
 4c4:	2581                	sext.w	a1,a1
    neg = 1;
 4c6:	4305                	li	t1,1
    x = -xx;
 4c8:	b7d5                	j	4ac <printint+0x18>
  }while((x /= base) != 0);
 4ca:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 4cc:	8836                	mv	a6,a3
 4ce:	0018069b          	addiw	a3,a6,1
 4d2:	02c5f7bb          	remuw	a5,a1,a2
 4d6:	1782                	slli	a5,a5,0x20
 4d8:	9381                	srli	a5,a5,0x20
 4da:	97c6                	add	a5,a5,a7
 4dc:	0007c783          	lbu	a5,0(a5)
 4e0:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 4e4:	0705                	addi	a4,a4,1
 4e6:	02c5d7bb          	divuw	a5,a1,a2
 4ea:	fec5f0e3          	bleu	a2,a1,4ca <printint+0x36>
  if(neg)
 4ee:	00030b63          	beqz	t1,504 <printint+0x70>
    buf[i++] = '-';
 4f2:	fd040793          	addi	a5,s0,-48
 4f6:	96be                	add	a3,a3,a5
 4f8:	02d00793          	li	a5,45
 4fc:	fef68823          	sb	a5,-16(a3)
 500:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 504:	02d05763          	blez	a3,532 <printint+0x9e>
 508:	89aa                	mv	s3,a0
 50a:	fc040493          	addi	s1,s0,-64
 50e:	94b6                	add	s1,s1,a3
 510:	197d                	addi	s2,s2,-1
 512:	9936                	add	s2,s2,a3
 514:	36fd                	addiw	a3,a3,-1
 516:	1682                	slli	a3,a3,0x20
 518:	9281                	srli	a3,a3,0x20
 51a:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 51e:	fff4c583          	lbu	a1,-1(s1)
 522:	854e                	mv	a0,s3
 524:	00000097          	auipc	ra,0x0
 528:	f4e080e7          	jalr	-178(ra) # 472 <putc>
  while(--i >= 0)
 52c:	14fd                	addi	s1,s1,-1
 52e:	ff2498e3          	bne	s1,s2,51e <printint+0x8a>
}
 532:	70e2                	ld	ra,56(sp)
 534:	7442                	ld	s0,48(sp)
 536:	74a2                	ld	s1,40(sp)
 538:	7902                	ld	s2,32(sp)
 53a:	69e2                	ld	s3,24(sp)
 53c:	6121                	addi	sp,sp,64
 53e:	8082                	ret

0000000000000540 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 540:	7119                	addi	sp,sp,-128
 542:	fc86                	sd	ra,120(sp)
 544:	f8a2                	sd	s0,112(sp)
 546:	f4a6                	sd	s1,104(sp)
 548:	f0ca                	sd	s2,96(sp)
 54a:	ecce                	sd	s3,88(sp)
 54c:	e8d2                	sd	s4,80(sp)
 54e:	e4d6                	sd	s5,72(sp)
 550:	e0da                	sd	s6,64(sp)
 552:	fc5e                	sd	s7,56(sp)
 554:	f862                	sd	s8,48(sp)
 556:	f466                	sd	s9,40(sp)
 558:	f06a                	sd	s10,32(sp)
 55a:	ec6e                	sd	s11,24(sp)
 55c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 55e:	0005c483          	lbu	s1,0(a1)
 562:	18048d63          	beqz	s1,6fc <vprintf+0x1bc>
 566:	8aaa                	mv	s5,a0
 568:	8b32                	mv	s6,a2
 56a:	00158913          	addi	s2,a1,1
  state = 0;
 56e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 570:	02500a13          	li	s4,37
      if(c == 'd'){
 574:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 578:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 57c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 580:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 584:	00000b97          	auipc	s7,0x0
 588:	3dcb8b93          	addi	s7,s7,988 # 960 <digits>
 58c:	a839                	j	5aa <vprintf+0x6a>
        putc(fd, c);
 58e:	85a6                	mv	a1,s1
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	ee0080e7          	jalr	-288(ra) # 472 <putc>
 59a:	a019                	j	5a0 <vprintf+0x60>
    } else if(state == '%'){
 59c:	01498f63          	beq	s3,s4,5ba <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5a0:	0905                	addi	s2,s2,1
 5a2:	fff94483          	lbu	s1,-1(s2)
 5a6:	14048b63          	beqz	s1,6fc <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 5aa:	0004879b          	sext.w	a5,s1
    if(state == 0){
 5ae:	fe0997e3          	bnez	s3,59c <vprintf+0x5c>
      if(c == '%'){
 5b2:	fd479ee3          	bne	a5,s4,58e <vprintf+0x4e>
        state = '%';
 5b6:	89be                	mv	s3,a5
 5b8:	b7e5                	j	5a0 <vprintf+0x60>
      if(c == 'd'){
 5ba:	05878063          	beq	a5,s8,5fa <vprintf+0xba>
      } else if(c == 'l') {
 5be:	05978c63          	beq	a5,s9,616 <vprintf+0xd6>
      } else if(c == 'x') {
 5c2:	07a78863          	beq	a5,s10,632 <vprintf+0xf2>
      } else if(c == 'p') {
 5c6:	09b78463          	beq	a5,s11,64e <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5ca:	07300713          	li	a4,115
 5ce:	0ce78563          	beq	a5,a4,698 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5d2:	06300713          	li	a4,99
 5d6:	0ee78c63          	beq	a5,a4,6ce <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5da:	11478663          	beq	a5,s4,6e6 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5de:	85d2                	mv	a1,s4
 5e0:	8556                	mv	a0,s5
 5e2:	00000097          	auipc	ra,0x0
 5e6:	e90080e7          	jalr	-368(ra) # 472 <putc>
        putc(fd, c);
 5ea:	85a6                	mv	a1,s1
 5ec:	8556                	mv	a0,s5
 5ee:	00000097          	auipc	ra,0x0
 5f2:	e84080e7          	jalr	-380(ra) # 472 <putc>
      }
      state = 0;
 5f6:	4981                	li	s3,0
 5f8:	b765                	j	5a0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5fa:	008b0493          	addi	s1,s6,8
 5fe:	4685                	li	a3,1
 600:	4629                	li	a2,10
 602:	000b2583          	lw	a1,0(s6)
 606:	8556                	mv	a0,s5
 608:	00000097          	auipc	ra,0x0
 60c:	e8c080e7          	jalr	-372(ra) # 494 <printint>
 610:	8b26                	mv	s6,s1
      state = 0;
 612:	4981                	li	s3,0
 614:	b771                	j	5a0 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 616:	008b0493          	addi	s1,s6,8
 61a:	4681                	li	a3,0
 61c:	4629                	li	a2,10
 61e:	000b2583          	lw	a1,0(s6)
 622:	8556                	mv	a0,s5
 624:	00000097          	auipc	ra,0x0
 628:	e70080e7          	jalr	-400(ra) # 494 <printint>
 62c:	8b26                	mv	s6,s1
      state = 0;
 62e:	4981                	li	s3,0
 630:	bf85                	j	5a0 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 632:	008b0493          	addi	s1,s6,8
 636:	4681                	li	a3,0
 638:	4641                	li	a2,16
 63a:	000b2583          	lw	a1,0(s6)
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	e54080e7          	jalr	-428(ra) # 494 <printint>
 648:	8b26                	mv	s6,s1
      state = 0;
 64a:	4981                	li	s3,0
 64c:	bf91                	j	5a0 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 64e:	008b0793          	addi	a5,s6,8
 652:	f8f43423          	sd	a5,-120(s0)
 656:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 65a:	03000593          	li	a1,48
 65e:	8556                	mv	a0,s5
 660:	00000097          	auipc	ra,0x0
 664:	e12080e7          	jalr	-494(ra) # 472 <putc>
  putc(fd, 'x');
 668:	85ea                	mv	a1,s10
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	e06080e7          	jalr	-506(ra) # 472 <putc>
 674:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 676:	03c9d793          	srli	a5,s3,0x3c
 67a:	97de                	add	a5,a5,s7
 67c:	0007c583          	lbu	a1,0(a5)
 680:	8556                	mv	a0,s5
 682:	00000097          	auipc	ra,0x0
 686:	df0080e7          	jalr	-528(ra) # 472 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 68a:	0992                	slli	s3,s3,0x4
 68c:	34fd                	addiw	s1,s1,-1
 68e:	f4e5                	bnez	s1,676 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 690:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 694:	4981                	li	s3,0
 696:	b729                	j	5a0 <vprintf+0x60>
        s = va_arg(ap, char*);
 698:	008b0993          	addi	s3,s6,8
 69c:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 6a0:	c085                	beqz	s1,6c0 <vprintf+0x180>
        while(*s != 0){
 6a2:	0004c583          	lbu	a1,0(s1)
 6a6:	c9a1                	beqz	a1,6f6 <vprintf+0x1b6>
          putc(fd, *s);
 6a8:	8556                	mv	a0,s5
 6aa:	00000097          	auipc	ra,0x0
 6ae:	dc8080e7          	jalr	-568(ra) # 472 <putc>
          s++;
 6b2:	0485                	addi	s1,s1,1
        while(*s != 0){
 6b4:	0004c583          	lbu	a1,0(s1)
 6b8:	f9e5                	bnez	a1,6a8 <vprintf+0x168>
        s = va_arg(ap, char*);
 6ba:	8b4e                	mv	s6,s3
      state = 0;
 6bc:	4981                	li	s3,0
 6be:	b5cd                	j	5a0 <vprintf+0x60>
          s = "(null)";
 6c0:	00000497          	auipc	s1,0x0
 6c4:	2b848493          	addi	s1,s1,696 # 978 <digits+0x18>
        while(*s != 0){
 6c8:	02800593          	li	a1,40
 6cc:	bff1                	j	6a8 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 6ce:	008b0493          	addi	s1,s6,8
 6d2:	000b4583          	lbu	a1,0(s6)
 6d6:	8556                	mv	a0,s5
 6d8:	00000097          	auipc	ra,0x0
 6dc:	d9a080e7          	jalr	-614(ra) # 472 <putc>
 6e0:	8b26                	mv	s6,s1
      state = 0;
 6e2:	4981                	li	s3,0
 6e4:	bd75                	j	5a0 <vprintf+0x60>
        putc(fd, c);
 6e6:	85d2                	mv	a1,s4
 6e8:	8556                	mv	a0,s5
 6ea:	00000097          	auipc	ra,0x0
 6ee:	d88080e7          	jalr	-632(ra) # 472 <putc>
      state = 0;
 6f2:	4981                	li	s3,0
 6f4:	b575                	j	5a0 <vprintf+0x60>
        s = va_arg(ap, char*);
 6f6:	8b4e                	mv	s6,s3
      state = 0;
 6f8:	4981                	li	s3,0
 6fa:	b55d                	j	5a0 <vprintf+0x60>
    }
  }
}
 6fc:	70e6                	ld	ra,120(sp)
 6fe:	7446                	ld	s0,112(sp)
 700:	74a6                	ld	s1,104(sp)
 702:	7906                	ld	s2,96(sp)
 704:	69e6                	ld	s3,88(sp)
 706:	6a46                	ld	s4,80(sp)
 708:	6aa6                	ld	s5,72(sp)
 70a:	6b06                	ld	s6,64(sp)
 70c:	7be2                	ld	s7,56(sp)
 70e:	7c42                	ld	s8,48(sp)
 710:	7ca2                	ld	s9,40(sp)
 712:	7d02                	ld	s10,32(sp)
 714:	6de2                	ld	s11,24(sp)
 716:	6109                	addi	sp,sp,128
 718:	8082                	ret

000000000000071a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 71a:	715d                	addi	sp,sp,-80
 71c:	ec06                	sd	ra,24(sp)
 71e:	e822                	sd	s0,16(sp)
 720:	1000                	addi	s0,sp,32
 722:	e010                	sd	a2,0(s0)
 724:	e414                	sd	a3,8(s0)
 726:	e818                	sd	a4,16(s0)
 728:	ec1c                	sd	a5,24(s0)
 72a:	03043023          	sd	a6,32(s0)
 72e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 732:	8622                	mv	a2,s0
 734:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 738:	00000097          	auipc	ra,0x0
 73c:	e08080e7          	jalr	-504(ra) # 540 <vprintf>
}
 740:	60e2                	ld	ra,24(sp)
 742:	6442                	ld	s0,16(sp)
 744:	6161                	addi	sp,sp,80
 746:	8082                	ret

0000000000000748 <printf>:

void
printf(const char *fmt, ...)
{
 748:	711d                	addi	sp,sp,-96
 74a:	ec06                	sd	ra,24(sp)
 74c:	e822                	sd	s0,16(sp)
 74e:	1000                	addi	s0,sp,32
 750:	e40c                	sd	a1,8(s0)
 752:	e810                	sd	a2,16(s0)
 754:	ec14                	sd	a3,24(s0)
 756:	f018                	sd	a4,32(s0)
 758:	f41c                	sd	a5,40(s0)
 75a:	03043823          	sd	a6,48(s0)
 75e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 762:	00840613          	addi	a2,s0,8
 766:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 76a:	85aa                	mv	a1,a0
 76c:	4505                	li	a0,1
 76e:	00000097          	auipc	ra,0x0
 772:	dd2080e7          	jalr	-558(ra) # 540 <vprintf>
}
 776:	60e2                	ld	ra,24(sp)
 778:	6442                	ld	s0,16(sp)
 77a:	6125                	addi	sp,sp,96
 77c:	8082                	ret

000000000000077e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 77e:	1141                	addi	sp,sp,-16
 780:	e422                	sd	s0,8(sp)
 782:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 784:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 788:	00000797          	auipc	a5,0x0
 78c:	20878793          	addi	a5,a5,520 # 990 <_edata>
 790:	639c                	ld	a5,0(a5)
 792:	a805                	j	7c2 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 794:	4618                	lw	a4,8(a2)
 796:	9db9                	addw	a1,a1,a4
 798:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 79c:	6398                	ld	a4,0(a5)
 79e:	6318                	ld	a4,0(a4)
 7a0:	fee53823          	sd	a4,-16(a0)
 7a4:	a091                	j	7e8 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7a6:	ff852703          	lw	a4,-8(a0)
 7aa:	9e39                	addw	a2,a2,a4
 7ac:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7ae:	ff053703          	ld	a4,-16(a0)
 7b2:	e398                	sd	a4,0(a5)
 7b4:	a099                	j	7fa <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b6:	6398                	ld	a4,0(a5)
 7b8:	00e7e463          	bltu	a5,a4,7c0 <free+0x42>
 7bc:	00e6ea63          	bltu	a3,a4,7d0 <free+0x52>
{
 7c0:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c2:	fed7fae3          	bleu	a3,a5,7b6 <free+0x38>
 7c6:	6398                	ld	a4,0(a5)
 7c8:	00e6e463          	bltu	a3,a4,7d0 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cc:	fee7eae3          	bltu	a5,a4,7c0 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 7d0:	ff852583          	lw	a1,-8(a0)
 7d4:	6390                	ld	a2,0(a5)
 7d6:	02059713          	slli	a4,a1,0x20
 7da:	9301                	srli	a4,a4,0x20
 7dc:	0712                	slli	a4,a4,0x4
 7de:	9736                	add	a4,a4,a3
 7e0:	fae60ae3          	beq	a2,a4,794 <free+0x16>
    bp->s.ptr = p->s.ptr;
 7e4:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7e8:	4790                	lw	a2,8(a5)
 7ea:	02061713          	slli	a4,a2,0x20
 7ee:	9301                	srli	a4,a4,0x20
 7f0:	0712                	slli	a4,a4,0x4
 7f2:	973e                	add	a4,a4,a5
 7f4:	fae689e3          	beq	a3,a4,7a6 <free+0x28>
  } else
    p->s.ptr = bp;
 7f8:	e394                	sd	a3,0(a5)
  freep = p;
 7fa:	00000717          	auipc	a4,0x0
 7fe:	18f73b23          	sd	a5,406(a4) # 990 <_edata>
}
 802:	6422                	ld	s0,8(sp)
 804:	0141                	addi	sp,sp,16
 806:	8082                	ret

0000000000000808 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 808:	7139                	addi	sp,sp,-64
 80a:	fc06                	sd	ra,56(sp)
 80c:	f822                	sd	s0,48(sp)
 80e:	f426                	sd	s1,40(sp)
 810:	f04a                	sd	s2,32(sp)
 812:	ec4e                	sd	s3,24(sp)
 814:	e852                	sd	s4,16(sp)
 816:	e456                	sd	s5,8(sp)
 818:	e05a                	sd	s6,0(sp)
 81a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81c:	02051993          	slli	s3,a0,0x20
 820:	0209d993          	srli	s3,s3,0x20
 824:	09bd                	addi	s3,s3,15
 826:	0049d993          	srli	s3,s3,0x4
 82a:	2985                	addiw	s3,s3,1
 82c:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 830:	00000797          	auipc	a5,0x0
 834:	16078793          	addi	a5,a5,352 # 990 <_edata>
 838:	6388                	ld	a0,0(a5)
 83a:	c515                	beqz	a0,866 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 83e:	4798                	lw	a4,8(a5)
 840:	03277d63          	bleu	s2,a4,87a <malloc+0x72>
 844:	8a4e                	mv	s4,s3
 846:	0009871b          	sext.w	a4,s3
 84a:	6685                	lui	a3,0x1
 84c:	00d77363          	bleu	a3,a4,852 <malloc+0x4a>
 850:	6a05                	lui	s4,0x1
 852:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 856:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 85a:	00000497          	auipc	s1,0x0
 85e:	13648493          	addi	s1,s1,310 # 990 <_edata>
  if(p == (char*)-1)
 862:	5b7d                	li	s6,-1
 864:	a0b5                	j	8d0 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 866:	00000717          	auipc	a4,0x0
 86a:	13270713          	addi	a4,a4,306 # 998 <base>
 86e:	e398                	sd	a4,0(a5)
 870:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 872:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 876:	87ba                	mv	a5,a4
 878:	b7f1                	j	844 <malloc+0x3c>
      if(p->s.size == nunits)
 87a:	02e90b63          	beq	s2,a4,8b0 <malloc+0xa8>
        p->s.size -= nunits;
 87e:	4137073b          	subw	a4,a4,s3
 882:	c798                	sw	a4,8(a5)
        p += p->s.size;
 884:	1702                	slli	a4,a4,0x20
 886:	9301                	srli	a4,a4,0x20
 888:	0712                	slli	a4,a4,0x4
 88a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 88c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 890:	00000717          	auipc	a4,0x0
 894:	10a73023          	sd	a0,256(a4) # 990 <_edata>
      return (void*)(p + 1);
 898:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 89c:	70e2                	ld	ra,56(sp)
 89e:	7442                	ld	s0,48(sp)
 8a0:	74a2                	ld	s1,40(sp)
 8a2:	7902                	ld	s2,32(sp)
 8a4:	69e2                	ld	s3,24(sp)
 8a6:	6a42                	ld	s4,16(sp)
 8a8:	6aa2                	ld	s5,8(sp)
 8aa:	6b02                	ld	s6,0(sp)
 8ac:	6121                	addi	sp,sp,64
 8ae:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8b0:	6398                	ld	a4,0(a5)
 8b2:	e118                	sd	a4,0(a0)
 8b4:	bff1                	j	890 <malloc+0x88>
  hp->s.size = nu;
 8b6:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 8ba:	0541                	addi	a0,a0,16
 8bc:	00000097          	auipc	ra,0x0
 8c0:	ec2080e7          	jalr	-318(ra) # 77e <free>
  return freep;
 8c4:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 8c6:	d979                	beqz	a0,89c <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8ca:	4798                	lw	a4,8(a5)
 8cc:	fb2777e3          	bleu	s2,a4,87a <malloc+0x72>
    if(p == freep)
 8d0:	6098                	ld	a4,0(s1)
 8d2:	853e                	mv	a0,a5
 8d4:	fef71ae3          	bne	a4,a5,8c8 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8d8:	8552                	mv	a0,s4
 8da:	00000097          	auipc	ra,0x0
 8de:	b38080e7          	jalr	-1224(ra) # 412 <sbrk>
  if(p == (char*)-1)
 8e2:	fd651ae3          	bne	a0,s6,8b6 <malloc+0xae>
        return 0;
 8e6:	4501                	li	a0,0
 8e8:	bf55                	j	89c <malloc+0x94>
