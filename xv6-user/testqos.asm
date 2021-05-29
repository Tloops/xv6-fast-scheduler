
xv6-user/_testqos:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int main(int argc, char *argv[])
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  int pid = fork();
   8:	00000097          	auipc	ra,0x0
   c:	384080e7          	jalr	900(ra) # 38c <fork>
  if(pid) {
  10:	c925                	beqz	a0,80 <main+0x80>
    //father process
    int pid2 = fork();
  12:	00000097          	auipc	ra,0x0
  16:	37a080e7          	jalr	890(ra) # 38c <fork>
    if(pid2) {
  1a:	c915                	beqz	a0,4e <main+0x4e>
      //father process
      setqos(45);
  1c:	02d00513          	li	a0,45
  20:	00000097          	auipc	ra,0x0
  24:	43c080e7          	jalr	1084(ra) # 45c <setqos>
  28:	67e1                	lui	a5,0x18
  2a:	6a078793          	addi	a5,a5,1696 # 186a0 <__global_pointer$+0x17590>
      for (int i = 0; i < 100000; ++i) {
  2e:	37fd                	addiw	a5,a5,-1
  30:	fffd                	bnez	a5,2e <main+0x2e>

      }
      printf("[%d] finished\n", getpid());
  32:	00000097          	auipc	ra,0x0
  36:	3ca080e7          	jalr	970(ra) # 3fc <getpid>
  3a:	85aa                	mv	a1,a0
  3c:	00001517          	auipc	a0,0x1
  40:	8a450513          	addi	a0,a0,-1884 # 8e0 <malloc+0xe6>
  44:	00000097          	auipc	ra,0x0
  48:	6f6080e7          	jalr	1782(ra) # 73a <printf>
  4c:	a095                	j	b0 <main+0xb0>
    }
    else {
      //son2 process
      setqos(49);
  4e:	03100513          	li	a0,49
  52:	00000097          	auipc	ra,0x0
  56:	40a080e7          	jalr	1034(ra) # 45c <setqos>
  5a:	67e1                	lui	a5,0x18
  5c:	6a078793          	addi	a5,a5,1696 # 186a0 <__global_pointer$+0x17590>
      for (int i = 0; i < 100000; ++i) {
  60:	37fd                	addiw	a5,a5,-1
  62:	fffd                	bnez	a5,60 <main+0x60>

      }
      printf("[%d] finished\n", getpid());
  64:	00000097          	auipc	ra,0x0
  68:	398080e7          	jalr	920(ra) # 3fc <getpid>
  6c:	85aa                	mv	a1,a0
  6e:	00001517          	auipc	a0,0x1
  72:	87250513          	addi	a0,a0,-1934 # 8e0 <malloc+0xe6>
  76:	00000097          	auipc	ra,0x0
  7a:	6c4080e7          	jalr	1732(ra) # 73a <printf>
  7e:	a80d                	j	b0 <main+0xb0>
    }
  }
  else {
    //son1 process
    setqos(47);
  80:	02f00513          	li	a0,47
  84:	00000097          	auipc	ra,0x0
  88:	3d8080e7          	jalr	984(ra) # 45c <setqos>
  8c:	67e1                	lui	a5,0x18
  8e:	6a078793          	addi	a5,a5,1696 # 186a0 <__global_pointer$+0x17590>
    for (int i = 0; i < 100000; ++i) {
  92:	37fd                	addiw	a5,a5,-1
  94:	fffd                	bnez	a5,92 <main+0x92>

    }
    printf("[%d] finished\n", getpid());
  96:	00000097          	auipc	ra,0x0
  9a:	366080e7          	jalr	870(ra) # 3fc <getpid>
  9e:	85aa                	mv	a1,a0
  a0:	00001517          	auipc	a0,0x1
  a4:	84050513          	addi	a0,a0,-1984 # 8e0 <malloc+0xe6>
  a8:	00000097          	auipc	ra,0x0
  ac:	692080e7          	jalr	1682(ra) # 73a <printf>
  }
  exit(0);
  b0:	4501                	li	a0,0
  b2:	00000097          	auipc	ra,0x0
  b6:	2e2080e7          	jalr	738(ra) # 394 <exit>

00000000000000ba <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  ba:	1141                	addi	sp,sp,-16
  bc:	e422                	sd	s0,8(sp)
  be:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c0:	87aa                	mv	a5,a0
  c2:	0585                	addi	a1,a1,1
  c4:	0785                	addi	a5,a5,1
  c6:	fff5c703          	lbu	a4,-1(a1)
  ca:	fee78fa3          	sb	a4,-1(a5)
  ce:	fb75                	bnez	a4,c2 <strcpy+0x8>
    ;
  return os;
}
  d0:	6422                	ld	s0,8(sp)
  d2:	0141                	addi	sp,sp,16
  d4:	8082                	ret

00000000000000d6 <strcat>:

char*
strcat(char *s, const char *t)
{
  d6:	1141                	addi	sp,sp,-16
  d8:	e422                	sd	s0,8(sp)
  da:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  dc:	00054783          	lbu	a5,0(a0)
  e0:	c385                	beqz	a5,100 <strcat+0x2a>
  e2:	87aa                	mv	a5,a0
    s++;
  e4:	0785                	addi	a5,a5,1
  while(*s)
  e6:	0007c703          	lbu	a4,0(a5)
  ea:	ff6d                	bnez	a4,e4 <strcat+0xe>
  while((*s++ = *t++))
  ec:	0585                	addi	a1,a1,1
  ee:	0785                	addi	a5,a5,1
  f0:	fff5c703          	lbu	a4,-1(a1)
  f4:	fee78fa3          	sb	a4,-1(a5)
  f8:	fb75                	bnez	a4,ec <strcat+0x16>
    ;
  return os;
}
  fa:	6422                	ld	s0,8(sp)
  fc:	0141                	addi	sp,sp,16
  fe:	8082                	ret
  while(*s)
 100:	87aa                	mv	a5,a0
 102:	b7ed                	j	ec <strcat+0x16>

0000000000000104 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 104:	1141                	addi	sp,sp,-16
 106:	e422                	sd	s0,8(sp)
 108:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 10a:	00054783          	lbu	a5,0(a0)
 10e:	cf91                	beqz	a5,12a <strcmp+0x26>
 110:	0005c703          	lbu	a4,0(a1)
 114:	00f71b63          	bne	a4,a5,12a <strcmp+0x26>
    p++, q++;
 118:	0505                	addi	a0,a0,1
 11a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 11c:	00054783          	lbu	a5,0(a0)
 120:	c789                	beqz	a5,12a <strcmp+0x26>
 122:	0005c703          	lbu	a4,0(a1)
 126:	fef709e3          	beq	a4,a5,118 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 12a:	0005c503          	lbu	a0,0(a1)
}
 12e:	40a7853b          	subw	a0,a5,a0
 132:	6422                	ld	s0,8(sp)
 134:	0141                	addi	sp,sp,16
 136:	8082                	ret

0000000000000138 <strlen>:

uint
strlen(const char *s)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 13e:	00054783          	lbu	a5,0(a0)
 142:	cf91                	beqz	a5,15e <strlen+0x26>
 144:	0505                	addi	a0,a0,1
 146:	87aa                	mv	a5,a0
 148:	4685                	li	a3,1
 14a:	9e89                	subw	a3,a3,a0
 14c:	00f6853b          	addw	a0,a3,a5
 150:	0785                	addi	a5,a5,1
 152:	fff7c703          	lbu	a4,-1(a5)
 156:	fb7d                	bnez	a4,14c <strlen+0x14>
    ;
  return n;
}
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
  for(n = 0; s[n]; n++)
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strlen+0x20>

0000000000000162 <memset>:

void*
memset(void *dst, int c, uint n)
{
 162:	1141                	addi	sp,sp,-16
 164:	e422                	sd	s0,8(sp)
 166:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 168:	ce09                	beqz	a2,182 <memset+0x20>
 16a:	87aa                	mv	a5,a0
 16c:	fff6071b          	addiw	a4,a2,-1
 170:	1702                	slli	a4,a4,0x20
 172:	9301                	srli	a4,a4,0x20
 174:	0705                	addi	a4,a4,1
 176:	972a                	add	a4,a4,a0
    cdst[i] = c;
 178:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 17c:	0785                	addi	a5,a5,1
 17e:	fee79de3          	bne	a5,a4,178 <memset+0x16>
  }
  return dst;
}
 182:	6422                	ld	s0,8(sp)
 184:	0141                	addi	sp,sp,16
 186:	8082                	ret

0000000000000188 <strchr>:

char*
strchr(const char *s, char c)
{
 188:	1141                	addi	sp,sp,-16
 18a:	e422                	sd	s0,8(sp)
 18c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 18e:	00054783          	lbu	a5,0(a0)
 192:	cf91                	beqz	a5,1ae <strchr+0x26>
    if(*s == c)
 194:	00f58a63          	beq	a1,a5,1a8 <strchr+0x20>
  for(; *s; s++)
 198:	0505                	addi	a0,a0,1
 19a:	00054783          	lbu	a5,0(a0)
 19e:	c781                	beqz	a5,1a6 <strchr+0x1e>
    if(*s == c)
 1a0:	feb79ce3          	bne	a5,a1,198 <strchr+0x10>
 1a4:	a011                	j	1a8 <strchr+0x20>
      return (char*)s;
  return 0;
 1a6:	4501                	li	a0,0
}
 1a8:	6422                	ld	s0,8(sp)
 1aa:	0141                	addi	sp,sp,16
 1ac:	8082                	ret
  return 0;
 1ae:	4501                	li	a0,0
 1b0:	bfe5                	j	1a8 <strchr+0x20>

00000000000001b2 <gets>:

char*
gets(char *buf, int max)
{
 1b2:	711d                	addi	sp,sp,-96
 1b4:	ec86                	sd	ra,88(sp)
 1b6:	e8a2                	sd	s0,80(sp)
 1b8:	e4a6                	sd	s1,72(sp)
 1ba:	e0ca                	sd	s2,64(sp)
 1bc:	fc4e                	sd	s3,56(sp)
 1be:	f852                	sd	s4,48(sp)
 1c0:	f456                	sd	s5,40(sp)
 1c2:	f05a                	sd	s6,32(sp)
 1c4:	ec5e                	sd	s7,24(sp)
 1c6:	e862                	sd	s8,16(sp)
 1c8:	1080                	addi	s0,sp,96
 1ca:	8c2a                	mv	s8,a0
 1cc:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ce:	892a                	mv	s2,a0
 1d0:	4981                	li	s3,0
    cc = read(0, &c, 1);
 1d2:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1d6:	4b29                	li	s6,10
 1d8:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 1da:	0019849b          	addiw	s1,s3,1
 1de:	0344d763          	ble	s4,s1,20c <gets+0x5a>
    cc = read(0, &c, 1);
 1e2:	4605                	li	a2,1
 1e4:	85d6                	mv	a1,s5
 1e6:	4501                	li	a0,0
 1e8:	00000097          	auipc	ra,0x0
 1ec:	1c4080e7          	jalr	452(ra) # 3ac <read>
    if(cc < 1)
 1f0:	00a05e63          	blez	a0,20c <gets+0x5a>
    buf[i++] = c;
 1f4:	faf44783          	lbu	a5,-81(s0)
 1f8:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1fc:	01678763          	beq	a5,s6,20a <gets+0x58>
 200:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 202:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 204:	fd779be3          	bne	a5,s7,1da <gets+0x28>
 208:	a011                	j	20c <gets+0x5a>
  for(i=0; i+1 < max; ){
 20a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 20c:	99e2                	add	s3,s3,s8
 20e:	00098023          	sb	zero,0(s3)
  return buf;
}
 212:	8562                	mv	a0,s8
 214:	60e6                	ld	ra,88(sp)
 216:	6446                	ld	s0,80(sp)
 218:	64a6                	ld	s1,72(sp)
 21a:	6906                	ld	s2,64(sp)
 21c:	79e2                	ld	s3,56(sp)
 21e:	7a42                	ld	s4,48(sp)
 220:	7aa2                	ld	s5,40(sp)
 222:	7b02                	ld	s6,32(sp)
 224:	6be2                	ld	s7,24(sp)
 226:	6c42                	ld	s8,16(sp)
 228:	6125                	addi	sp,sp,96
 22a:	8082                	ret

000000000000022c <stat>:

int
stat(const char *n, struct stat *st)
{
 22c:	1101                	addi	sp,sp,-32
 22e:	ec06                	sd	ra,24(sp)
 230:	e822                	sd	s0,16(sp)
 232:	e426                	sd	s1,8(sp)
 234:	e04a                	sd	s2,0(sp)
 236:	1000                	addi	s0,sp,32
 238:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 23a:	4581                	li	a1,0
 23c:	00000097          	auipc	ra,0x0
 240:	198080e7          	jalr	408(ra) # 3d4 <open>
  if(fd < 0)
 244:	02054563          	bltz	a0,26e <stat+0x42>
 248:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 24a:	85ca                	mv	a1,s2
 24c:	00000097          	auipc	ra,0x0
 250:	190080e7          	jalr	400(ra) # 3dc <fstat>
 254:	892a                	mv	s2,a0
  close(fd);
 256:	8526                	mv	a0,s1
 258:	00000097          	auipc	ra,0x0
 25c:	164080e7          	jalr	356(ra) # 3bc <close>
  return r;
}
 260:	854a                	mv	a0,s2
 262:	60e2                	ld	ra,24(sp)
 264:	6442                	ld	s0,16(sp)
 266:	64a2                	ld	s1,8(sp)
 268:	6902                	ld	s2,0(sp)
 26a:	6105                	addi	sp,sp,32
 26c:	8082                	ret
    return -1;
 26e:	597d                	li	s2,-1
 270:	bfc5                	j	260 <stat+0x34>

0000000000000272 <atoi>:

int
atoi(const char *s)
{
 272:	1141                	addi	sp,sp,-16
 274:	e422                	sd	s0,8(sp)
 276:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 278:	00054703          	lbu	a4,0(a0)
 27c:	02d00793          	li	a5,45
  int neg = 1;
 280:	4805                	li	a6,1
  if (*s == '-') {
 282:	04f70363          	beq	a4,a5,2c8 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 286:	00054683          	lbu	a3,0(a0)
 28a:	fd06879b          	addiw	a5,a3,-48
 28e:	0ff7f793          	andi	a5,a5,255
 292:	4725                	li	a4,9
 294:	02f76d63          	bltu	a4,a5,2ce <atoi+0x5c>
  n = 0;
 298:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 29a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 29c:	0505                	addi	a0,a0,1
 29e:	0026179b          	slliw	a5,a2,0x2
 2a2:	9fb1                	addw	a5,a5,a2
 2a4:	0017979b          	slliw	a5,a5,0x1
 2a8:	9fb5                	addw	a5,a5,a3
 2aa:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 2ae:	00054683          	lbu	a3,0(a0)
 2b2:	fd06871b          	addiw	a4,a3,-48
 2b6:	0ff77713          	andi	a4,a4,255
 2ba:	fee5f1e3          	bleu	a4,a1,29c <atoi+0x2a>
  return n * neg;
}
 2be:	02c8053b          	mulw	a0,a6,a2
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret
    s++;
 2c8:	0505                	addi	a0,a0,1
    neg = -1;
 2ca:	587d                	li	a6,-1
 2cc:	bf6d                	j	286 <atoi+0x14>
  n = 0;
 2ce:	4601                	li	a2,0
 2d0:	b7fd                	j	2be <atoi+0x4c>

00000000000002d2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d2:	1141                	addi	sp,sp,-16
 2d4:	e422                	sd	s0,8(sp)
 2d6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2d8:	02b57663          	bleu	a1,a0,304 <memmove+0x32>
    while(n-- > 0)
 2dc:	02c05163          	blez	a2,2fe <memmove+0x2c>
 2e0:	fff6079b          	addiw	a5,a2,-1
 2e4:	1782                	slli	a5,a5,0x20
 2e6:	9381                	srli	a5,a5,0x20
 2e8:	0785                	addi	a5,a5,1
 2ea:	97aa                	add	a5,a5,a0
  dst = vdst;
 2ec:	872a                	mv	a4,a0
      *dst++ = *src++;
 2ee:	0585                	addi	a1,a1,1
 2f0:	0705                	addi	a4,a4,1
 2f2:	fff5c683          	lbu	a3,-1(a1)
 2f6:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2fa:	fee79ae3          	bne	a5,a4,2ee <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2fe:	6422                	ld	s0,8(sp)
 300:	0141                	addi	sp,sp,16
 302:	8082                	ret
    dst += n;
 304:	00c50733          	add	a4,a0,a2
    src += n;
 308:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 30a:	fec05ae3          	blez	a2,2fe <memmove+0x2c>
 30e:	fff6079b          	addiw	a5,a2,-1
 312:	1782                	slli	a5,a5,0x20
 314:	9381                	srli	a5,a5,0x20
 316:	fff7c793          	not	a5,a5
 31a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 31c:	15fd                	addi	a1,a1,-1
 31e:	177d                	addi	a4,a4,-1
 320:	0005c683          	lbu	a3,0(a1)
 324:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 328:	fef71ae3          	bne	a4,a5,31c <memmove+0x4a>
 32c:	bfc9                	j	2fe <memmove+0x2c>

000000000000032e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 32e:	1141                	addi	sp,sp,-16
 330:	e422                	sd	s0,8(sp)
 332:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 334:	ce15                	beqz	a2,370 <memcmp+0x42>
 336:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 33a:	00054783          	lbu	a5,0(a0)
 33e:	0005c703          	lbu	a4,0(a1)
 342:	02e79063          	bne	a5,a4,362 <memcmp+0x34>
 346:	1682                	slli	a3,a3,0x20
 348:	9281                	srli	a3,a3,0x20
 34a:	0685                	addi	a3,a3,1
 34c:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 34e:	0505                	addi	a0,a0,1
    p2++;
 350:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 352:	00d50d63          	beq	a0,a3,36c <memcmp+0x3e>
    if (*p1 != *p2) {
 356:	00054783          	lbu	a5,0(a0)
 35a:	0005c703          	lbu	a4,0(a1)
 35e:	fee788e3          	beq	a5,a4,34e <memcmp+0x20>
      return *p1 - *p2;
 362:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 366:	6422                	ld	s0,8(sp)
 368:	0141                	addi	sp,sp,16
 36a:	8082                	ret
  return 0;
 36c:	4501                	li	a0,0
 36e:	bfe5                	j	366 <memcmp+0x38>
 370:	4501                	li	a0,0
 372:	bfd5                	j	366 <memcmp+0x38>

0000000000000374 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 374:	1141                	addi	sp,sp,-16
 376:	e406                	sd	ra,8(sp)
 378:	e022                	sd	s0,0(sp)
 37a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 37c:	00000097          	auipc	ra,0x0
 380:	f56080e7          	jalr	-170(ra) # 2d2 <memmove>
}
 384:	60a2                	ld	ra,8(sp)
 386:	6402                	ld	s0,0(sp)
 388:	0141                	addi	sp,sp,16
 38a:	8082                	ret

000000000000038c <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 38c:	4885                	li	a7,1
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <exit>:
.global exit
exit:
 li a7, SYS_exit
 394:	4889                	li	a7,2
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <wait>:
.global wait
wait:
 li a7, SYS_wait
 39c:	488d                	li	a7,3
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3a4:	4891                	li	a7,4
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <read>:
.global read
read:
 li a7, SYS_read
 3ac:	4895                	li	a7,5
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <write>:
.global write
write:
 li a7, SYS_write
 3b4:	48c1                	li	a7,16
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <close>:
.global close
close:
 li a7, SYS_close
 3bc:	48d5                	li	a7,21
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <kill>:
.global kill
kill:
 li a7, SYS_kill
 3c4:	4899                	li	a7,6
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <exec>:
.global exec
exec:
 li a7, SYS_exec
 3cc:	489d                	li	a7,7
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <open>:
.global open
open:
 li a7, SYS_open
 3d4:	48bd                	li	a7,15
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3dc:	48a1                	li	a7,8
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3e4:	48d1                	li	a7,20
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3ec:	48a5                	li	a7,9
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <dup>:
.global dup
dup:
 li a7, SYS_dup
 3f4:	48a9                	li	a7,10
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3fc:	48ad                	li	a7,11
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 404:	48b1                	li	a7,12
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 40c:	48b5                	li	a7,13
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 414:	48b9                	li	a7,14
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 41c:	48d9                	li	a7,22
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <dev>:
.global dev
dev:
 li a7, SYS_dev
 424:	48dd                	li	a7,23
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 42c:	48e1                	li	a7,24
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 434:	48e5                	li	a7,25
 ecall
 436:	00000073          	ecall
 ret
 43a:	8082                	ret

000000000000043c <remove>:
.global remove
remove:
 li a7, SYS_remove
 43c:	48c5                	li	a7,17
 ecall
 43e:	00000073          	ecall
 ret
 442:	8082                	ret

0000000000000444 <trace>:
.global trace
trace:
 li a7, SYS_trace
 444:	48c9                	li	a7,18
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 44c:	48cd                	li	a7,19
 ecall
 44e:	00000073          	ecall
 ret
 452:	8082                	ret

0000000000000454 <rename>:
.global rename
rename:
 li a7, SYS_rename
 454:	48e9                	li	a7,26
 ecall
 456:	00000073          	ecall
 ret
 45a:	8082                	ret

000000000000045c <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 45c:	48ed                	li	a7,27
 ecall
 45e:	00000073          	ecall
 ret
 462:	8082                	ret

0000000000000464 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 464:	1101                	addi	sp,sp,-32
 466:	ec06                	sd	ra,24(sp)
 468:	e822                	sd	s0,16(sp)
 46a:	1000                	addi	s0,sp,32
 46c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 470:	4605                	li	a2,1
 472:	fef40593          	addi	a1,s0,-17
 476:	00000097          	auipc	ra,0x0
 47a:	f3e080e7          	jalr	-194(ra) # 3b4 <write>
}
 47e:	60e2                	ld	ra,24(sp)
 480:	6442                	ld	s0,16(sp)
 482:	6105                	addi	sp,sp,32
 484:	8082                	ret

0000000000000486 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 486:	7139                	addi	sp,sp,-64
 488:	fc06                	sd	ra,56(sp)
 48a:	f822                	sd	s0,48(sp)
 48c:	f426                	sd	s1,40(sp)
 48e:	f04a                	sd	s2,32(sp)
 490:	ec4e                	sd	s3,24(sp)
 492:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 494:	c299                	beqz	a3,49a <printint+0x14>
 496:	0005ce63          	bltz	a1,4b2 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 49a:	2581                	sext.w	a1,a1
  neg = 0;
 49c:	4301                	li	t1,0
  }

  i = 0;
 49e:	fc040913          	addi	s2,s0,-64
  neg = 0;
 4a2:	874a                	mv	a4,s2
  i = 0;
 4a4:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 4a6:	2601                	sext.w	a2,a2
 4a8:	00000897          	auipc	a7,0x0
 4ac:	44888893          	addi	a7,a7,1096 # 8f0 <digits>
 4b0:	a801                	j	4c0 <printint+0x3a>
    x = -xx;
 4b2:	40b005bb          	negw	a1,a1
 4b6:	2581                	sext.w	a1,a1
    neg = 1;
 4b8:	4305                	li	t1,1
    x = -xx;
 4ba:	b7d5                	j	49e <printint+0x18>
  }while((x /= base) != 0);
 4bc:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 4be:	8836                	mv	a6,a3
 4c0:	0018069b          	addiw	a3,a6,1
 4c4:	02c5f7bb          	remuw	a5,a1,a2
 4c8:	1782                	slli	a5,a5,0x20
 4ca:	9381                	srli	a5,a5,0x20
 4cc:	97c6                	add	a5,a5,a7
 4ce:	0007c783          	lbu	a5,0(a5)
 4d2:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 4d6:	0705                	addi	a4,a4,1
 4d8:	02c5d7bb          	divuw	a5,a1,a2
 4dc:	fec5f0e3          	bleu	a2,a1,4bc <printint+0x36>
  if(neg)
 4e0:	00030b63          	beqz	t1,4f6 <printint+0x70>
    buf[i++] = '-';
 4e4:	fd040793          	addi	a5,s0,-48
 4e8:	96be                	add	a3,a3,a5
 4ea:	02d00793          	li	a5,45
 4ee:	fef68823          	sb	a5,-16(a3)
 4f2:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 4f6:	02d05763          	blez	a3,524 <printint+0x9e>
 4fa:	89aa                	mv	s3,a0
 4fc:	fc040493          	addi	s1,s0,-64
 500:	94b6                	add	s1,s1,a3
 502:	197d                	addi	s2,s2,-1
 504:	9936                	add	s2,s2,a3
 506:	36fd                	addiw	a3,a3,-1
 508:	1682                	slli	a3,a3,0x20
 50a:	9281                	srli	a3,a3,0x20
 50c:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 510:	fff4c583          	lbu	a1,-1(s1)
 514:	854e                	mv	a0,s3
 516:	00000097          	auipc	ra,0x0
 51a:	f4e080e7          	jalr	-178(ra) # 464 <putc>
  while(--i >= 0)
 51e:	14fd                	addi	s1,s1,-1
 520:	ff2498e3          	bne	s1,s2,510 <printint+0x8a>
}
 524:	70e2                	ld	ra,56(sp)
 526:	7442                	ld	s0,48(sp)
 528:	74a2                	ld	s1,40(sp)
 52a:	7902                	ld	s2,32(sp)
 52c:	69e2                	ld	s3,24(sp)
 52e:	6121                	addi	sp,sp,64
 530:	8082                	ret

0000000000000532 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 532:	7119                	addi	sp,sp,-128
 534:	fc86                	sd	ra,120(sp)
 536:	f8a2                	sd	s0,112(sp)
 538:	f4a6                	sd	s1,104(sp)
 53a:	f0ca                	sd	s2,96(sp)
 53c:	ecce                	sd	s3,88(sp)
 53e:	e8d2                	sd	s4,80(sp)
 540:	e4d6                	sd	s5,72(sp)
 542:	e0da                	sd	s6,64(sp)
 544:	fc5e                	sd	s7,56(sp)
 546:	f862                	sd	s8,48(sp)
 548:	f466                	sd	s9,40(sp)
 54a:	f06a                	sd	s10,32(sp)
 54c:	ec6e                	sd	s11,24(sp)
 54e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 550:	0005c483          	lbu	s1,0(a1)
 554:	18048d63          	beqz	s1,6ee <vprintf+0x1bc>
 558:	8aaa                	mv	s5,a0
 55a:	8b32                	mv	s6,a2
 55c:	00158913          	addi	s2,a1,1
  state = 0;
 560:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 562:	02500a13          	li	s4,37
      if(c == 'd'){
 566:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 56a:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 56e:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 572:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 576:	00000b97          	auipc	s7,0x0
 57a:	37ab8b93          	addi	s7,s7,890 # 8f0 <digits>
 57e:	a839                	j	59c <vprintf+0x6a>
        putc(fd, c);
 580:	85a6                	mv	a1,s1
 582:	8556                	mv	a0,s5
 584:	00000097          	auipc	ra,0x0
 588:	ee0080e7          	jalr	-288(ra) # 464 <putc>
 58c:	a019                	j	592 <vprintf+0x60>
    } else if(state == '%'){
 58e:	01498f63          	beq	s3,s4,5ac <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 592:	0905                	addi	s2,s2,1
 594:	fff94483          	lbu	s1,-1(s2)
 598:	14048b63          	beqz	s1,6ee <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 59c:	0004879b          	sext.w	a5,s1
    if(state == 0){
 5a0:	fe0997e3          	bnez	s3,58e <vprintf+0x5c>
      if(c == '%'){
 5a4:	fd479ee3          	bne	a5,s4,580 <vprintf+0x4e>
        state = '%';
 5a8:	89be                	mv	s3,a5
 5aa:	b7e5                	j	592 <vprintf+0x60>
      if(c == 'd'){
 5ac:	05878063          	beq	a5,s8,5ec <vprintf+0xba>
      } else if(c == 'l') {
 5b0:	05978c63          	beq	a5,s9,608 <vprintf+0xd6>
      } else if(c == 'x') {
 5b4:	07a78863          	beq	a5,s10,624 <vprintf+0xf2>
      } else if(c == 'p') {
 5b8:	09b78463          	beq	a5,s11,640 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5bc:	07300713          	li	a4,115
 5c0:	0ce78563          	beq	a5,a4,68a <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c4:	06300713          	li	a4,99
 5c8:	0ee78c63          	beq	a5,a4,6c0 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5cc:	11478663          	beq	a5,s4,6d8 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d0:	85d2                	mv	a1,s4
 5d2:	8556                	mv	a0,s5
 5d4:	00000097          	auipc	ra,0x0
 5d8:	e90080e7          	jalr	-368(ra) # 464 <putc>
        putc(fd, c);
 5dc:	85a6                	mv	a1,s1
 5de:	8556                	mv	a0,s5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	e84080e7          	jalr	-380(ra) # 464 <putc>
      }
      state = 0;
 5e8:	4981                	li	s3,0
 5ea:	b765                	j	592 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5ec:	008b0493          	addi	s1,s6,8
 5f0:	4685                	li	a3,1
 5f2:	4629                	li	a2,10
 5f4:	000b2583          	lw	a1,0(s6)
 5f8:	8556                	mv	a0,s5
 5fa:	00000097          	auipc	ra,0x0
 5fe:	e8c080e7          	jalr	-372(ra) # 486 <printint>
 602:	8b26                	mv	s6,s1
      state = 0;
 604:	4981                	li	s3,0
 606:	b771                	j	592 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 608:	008b0493          	addi	s1,s6,8
 60c:	4681                	li	a3,0
 60e:	4629                	li	a2,10
 610:	000b2583          	lw	a1,0(s6)
 614:	8556                	mv	a0,s5
 616:	00000097          	auipc	ra,0x0
 61a:	e70080e7          	jalr	-400(ra) # 486 <printint>
 61e:	8b26                	mv	s6,s1
      state = 0;
 620:	4981                	li	s3,0
 622:	bf85                	j	592 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 624:	008b0493          	addi	s1,s6,8
 628:	4681                	li	a3,0
 62a:	4641                	li	a2,16
 62c:	000b2583          	lw	a1,0(s6)
 630:	8556                	mv	a0,s5
 632:	00000097          	auipc	ra,0x0
 636:	e54080e7          	jalr	-428(ra) # 486 <printint>
 63a:	8b26                	mv	s6,s1
      state = 0;
 63c:	4981                	li	s3,0
 63e:	bf91                	j	592 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 640:	008b0793          	addi	a5,s6,8
 644:	f8f43423          	sd	a5,-120(s0)
 648:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 64c:	03000593          	li	a1,48
 650:	8556                	mv	a0,s5
 652:	00000097          	auipc	ra,0x0
 656:	e12080e7          	jalr	-494(ra) # 464 <putc>
  putc(fd, 'x');
 65a:	85ea                	mv	a1,s10
 65c:	8556                	mv	a0,s5
 65e:	00000097          	auipc	ra,0x0
 662:	e06080e7          	jalr	-506(ra) # 464 <putc>
 666:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 668:	03c9d793          	srli	a5,s3,0x3c
 66c:	97de                	add	a5,a5,s7
 66e:	0007c583          	lbu	a1,0(a5)
 672:	8556                	mv	a0,s5
 674:	00000097          	auipc	ra,0x0
 678:	df0080e7          	jalr	-528(ra) # 464 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 67c:	0992                	slli	s3,s3,0x4
 67e:	34fd                	addiw	s1,s1,-1
 680:	f4e5                	bnez	s1,668 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 682:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 686:	4981                	li	s3,0
 688:	b729                	j	592 <vprintf+0x60>
        s = va_arg(ap, char*);
 68a:	008b0993          	addi	s3,s6,8
 68e:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 692:	c085                	beqz	s1,6b2 <vprintf+0x180>
        while(*s != 0){
 694:	0004c583          	lbu	a1,0(s1)
 698:	c9a1                	beqz	a1,6e8 <vprintf+0x1b6>
          putc(fd, *s);
 69a:	8556                	mv	a0,s5
 69c:	00000097          	auipc	ra,0x0
 6a0:	dc8080e7          	jalr	-568(ra) # 464 <putc>
          s++;
 6a4:	0485                	addi	s1,s1,1
        while(*s != 0){
 6a6:	0004c583          	lbu	a1,0(s1)
 6aa:	f9e5                	bnez	a1,69a <vprintf+0x168>
        s = va_arg(ap, char*);
 6ac:	8b4e                	mv	s6,s3
      state = 0;
 6ae:	4981                	li	s3,0
 6b0:	b5cd                	j	592 <vprintf+0x60>
          s = "(null)";
 6b2:	00000497          	auipc	s1,0x0
 6b6:	25648493          	addi	s1,s1,598 # 908 <digits+0x18>
        while(*s != 0){
 6ba:	02800593          	li	a1,40
 6be:	bff1                	j	69a <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 6c0:	008b0493          	addi	s1,s6,8
 6c4:	000b4583          	lbu	a1,0(s6)
 6c8:	8556                	mv	a0,s5
 6ca:	00000097          	auipc	ra,0x0
 6ce:	d9a080e7          	jalr	-614(ra) # 464 <putc>
 6d2:	8b26                	mv	s6,s1
      state = 0;
 6d4:	4981                	li	s3,0
 6d6:	bd75                	j	592 <vprintf+0x60>
        putc(fd, c);
 6d8:	85d2                	mv	a1,s4
 6da:	8556                	mv	a0,s5
 6dc:	00000097          	auipc	ra,0x0
 6e0:	d88080e7          	jalr	-632(ra) # 464 <putc>
      state = 0;
 6e4:	4981                	li	s3,0
 6e6:	b575                	j	592 <vprintf+0x60>
        s = va_arg(ap, char*);
 6e8:	8b4e                	mv	s6,s3
      state = 0;
 6ea:	4981                	li	s3,0
 6ec:	b55d                	j	592 <vprintf+0x60>
    }
  }
}
 6ee:	70e6                	ld	ra,120(sp)
 6f0:	7446                	ld	s0,112(sp)
 6f2:	74a6                	ld	s1,104(sp)
 6f4:	7906                	ld	s2,96(sp)
 6f6:	69e6                	ld	s3,88(sp)
 6f8:	6a46                	ld	s4,80(sp)
 6fa:	6aa6                	ld	s5,72(sp)
 6fc:	6b06                	ld	s6,64(sp)
 6fe:	7be2                	ld	s7,56(sp)
 700:	7c42                	ld	s8,48(sp)
 702:	7ca2                	ld	s9,40(sp)
 704:	7d02                	ld	s10,32(sp)
 706:	6de2                	ld	s11,24(sp)
 708:	6109                	addi	sp,sp,128
 70a:	8082                	ret

000000000000070c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 70c:	715d                	addi	sp,sp,-80
 70e:	ec06                	sd	ra,24(sp)
 710:	e822                	sd	s0,16(sp)
 712:	1000                	addi	s0,sp,32
 714:	e010                	sd	a2,0(s0)
 716:	e414                	sd	a3,8(s0)
 718:	e818                	sd	a4,16(s0)
 71a:	ec1c                	sd	a5,24(s0)
 71c:	03043023          	sd	a6,32(s0)
 720:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 724:	8622                	mv	a2,s0
 726:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 72a:	00000097          	auipc	ra,0x0
 72e:	e08080e7          	jalr	-504(ra) # 532 <vprintf>
}
 732:	60e2                	ld	ra,24(sp)
 734:	6442                	ld	s0,16(sp)
 736:	6161                	addi	sp,sp,80
 738:	8082                	ret

000000000000073a <printf>:

void
printf(const char *fmt, ...)
{
 73a:	711d                	addi	sp,sp,-96
 73c:	ec06                	sd	ra,24(sp)
 73e:	e822                	sd	s0,16(sp)
 740:	1000                	addi	s0,sp,32
 742:	e40c                	sd	a1,8(s0)
 744:	e810                	sd	a2,16(s0)
 746:	ec14                	sd	a3,24(s0)
 748:	f018                	sd	a4,32(s0)
 74a:	f41c                	sd	a5,40(s0)
 74c:	03043823          	sd	a6,48(s0)
 750:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 754:	00840613          	addi	a2,s0,8
 758:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 75c:	85aa                	mv	a1,a0
 75e:	4505                	li	a0,1
 760:	00000097          	auipc	ra,0x0
 764:	dd2080e7          	jalr	-558(ra) # 532 <vprintf>
}
 768:	60e2                	ld	ra,24(sp)
 76a:	6442                	ld	s0,16(sp)
 76c:	6125                	addi	sp,sp,96
 76e:	8082                	ret

0000000000000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	1141                	addi	sp,sp,-16
 772:	e422                	sd	s0,8(sp)
 774:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 776:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77a:	00000797          	auipc	a5,0x0
 77e:	19678793          	addi	a5,a5,406 # 910 <__bss_start>
 782:	639c                	ld	a5,0(a5)
 784:	a805                	j	7b4 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 786:	4618                	lw	a4,8(a2)
 788:	9db9                	addw	a1,a1,a4
 78a:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 78e:	6398                	ld	a4,0(a5)
 790:	6318                	ld	a4,0(a4)
 792:	fee53823          	sd	a4,-16(a0)
 796:	a091                	j	7da <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 798:	ff852703          	lw	a4,-8(a0)
 79c:	9e39                	addw	a2,a2,a4
 79e:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7a0:	ff053703          	ld	a4,-16(a0)
 7a4:	e398                	sd	a4,0(a5)
 7a6:	a099                	j	7ec <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a8:	6398                	ld	a4,0(a5)
 7aa:	00e7e463          	bltu	a5,a4,7b2 <free+0x42>
 7ae:	00e6ea63          	bltu	a3,a4,7c2 <free+0x52>
{
 7b2:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b4:	fed7fae3          	bleu	a3,a5,7a8 <free+0x38>
 7b8:	6398                	ld	a4,0(a5)
 7ba:	00e6e463          	bltu	a3,a4,7c2 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7be:	fee7eae3          	bltu	a5,a4,7b2 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 7c2:	ff852583          	lw	a1,-8(a0)
 7c6:	6390                	ld	a2,0(a5)
 7c8:	02059713          	slli	a4,a1,0x20
 7cc:	9301                	srli	a4,a4,0x20
 7ce:	0712                	slli	a4,a4,0x4
 7d0:	9736                	add	a4,a4,a3
 7d2:	fae60ae3          	beq	a2,a4,786 <free+0x16>
    bp->s.ptr = p->s.ptr;
 7d6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7da:	4790                	lw	a2,8(a5)
 7dc:	02061713          	slli	a4,a2,0x20
 7e0:	9301                	srli	a4,a4,0x20
 7e2:	0712                	slli	a4,a4,0x4
 7e4:	973e                	add	a4,a4,a5
 7e6:	fae689e3          	beq	a3,a4,798 <free+0x28>
  } else
    p->s.ptr = bp;
 7ea:	e394                	sd	a3,0(a5)
  freep = p;
 7ec:	00000717          	auipc	a4,0x0
 7f0:	12f73223          	sd	a5,292(a4) # 910 <__bss_start>
}
 7f4:	6422                	ld	s0,8(sp)
 7f6:	0141                	addi	sp,sp,16
 7f8:	8082                	ret

00000000000007fa <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7fa:	7139                	addi	sp,sp,-64
 7fc:	fc06                	sd	ra,56(sp)
 7fe:	f822                	sd	s0,48(sp)
 800:	f426                	sd	s1,40(sp)
 802:	f04a                	sd	s2,32(sp)
 804:	ec4e                	sd	s3,24(sp)
 806:	e852                	sd	s4,16(sp)
 808:	e456                	sd	s5,8(sp)
 80a:	e05a                	sd	s6,0(sp)
 80c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80e:	02051993          	slli	s3,a0,0x20
 812:	0209d993          	srli	s3,s3,0x20
 816:	09bd                	addi	s3,s3,15
 818:	0049d993          	srli	s3,s3,0x4
 81c:	2985                	addiw	s3,s3,1
 81e:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 822:	00000797          	auipc	a5,0x0
 826:	0ee78793          	addi	a5,a5,238 # 910 <__bss_start>
 82a:	6388                	ld	a0,0(a5)
 82c:	c515                	beqz	a0,858 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 830:	4798                	lw	a4,8(a5)
 832:	03277d63          	bleu	s2,a4,86c <malloc+0x72>
 836:	8a4e                	mv	s4,s3
 838:	0009871b          	sext.w	a4,s3
 83c:	6685                	lui	a3,0x1
 83e:	00d77363          	bleu	a3,a4,844 <malloc+0x4a>
 842:	6a05                	lui	s4,0x1
 844:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 848:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 84c:	00000497          	auipc	s1,0x0
 850:	0c448493          	addi	s1,s1,196 # 910 <__bss_start>
  if(p == (char*)-1)
 854:	5b7d                	li	s6,-1
 856:	a0b5                	j	8c2 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 858:	00000717          	auipc	a4,0x0
 85c:	0c070713          	addi	a4,a4,192 # 918 <base>
 860:	e398                	sd	a4,0(a5)
 862:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 864:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 868:	87ba                	mv	a5,a4
 86a:	b7f1                	j	836 <malloc+0x3c>
      if(p->s.size == nunits)
 86c:	02e90b63          	beq	s2,a4,8a2 <malloc+0xa8>
        p->s.size -= nunits;
 870:	4137073b          	subw	a4,a4,s3
 874:	c798                	sw	a4,8(a5)
        p += p->s.size;
 876:	1702                	slli	a4,a4,0x20
 878:	9301                	srli	a4,a4,0x20
 87a:	0712                	slli	a4,a4,0x4
 87c:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 87e:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 882:	00000717          	auipc	a4,0x0
 886:	08a73723          	sd	a0,142(a4) # 910 <__bss_start>
      return (void*)(p + 1);
 88a:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 88e:	70e2                	ld	ra,56(sp)
 890:	7442                	ld	s0,48(sp)
 892:	74a2                	ld	s1,40(sp)
 894:	7902                	ld	s2,32(sp)
 896:	69e2                	ld	s3,24(sp)
 898:	6a42                	ld	s4,16(sp)
 89a:	6aa2                	ld	s5,8(sp)
 89c:	6b02                	ld	s6,0(sp)
 89e:	6121                	addi	sp,sp,64
 8a0:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8a2:	6398                	ld	a4,0(a5)
 8a4:	e118                	sd	a4,0(a0)
 8a6:	bff1                	j	882 <malloc+0x88>
  hp->s.size = nu;
 8a8:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 8ac:	0541                	addi	a0,a0,16
 8ae:	00000097          	auipc	ra,0x0
 8b2:	ec2080e7          	jalr	-318(ra) # 770 <free>
  return freep;
 8b6:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 8b8:	d979                	beqz	a0,88e <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ba:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8bc:	4798                	lw	a4,8(a5)
 8be:	fb2777e3          	bleu	s2,a4,86c <malloc+0x72>
    if(p == freep)
 8c2:	6098                	ld	a4,0(s1)
 8c4:	853e                	mv	a0,a5
 8c6:	fef71ae3          	bne	a4,a5,8ba <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8ca:	8552                	mv	a0,s4
 8cc:	00000097          	auipc	ra,0x0
 8d0:	b38080e7          	jalr	-1224(ra) # 404 <sbrk>
  if(p == (char*)-1)
 8d4:	fd651ae3          	bne	a0,s6,8a8 <malloc+0xae>
        return 0;
 8d8:	4501                	li	a0,0
 8da:	bf55                	j	88e <malloc+0x94>
