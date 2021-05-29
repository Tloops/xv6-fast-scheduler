
xv6-user/_sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
    if (argc <= 1) {
   8:	4785                	li	a5,1
   a:	02a7d663          	ble	a0,a5,36 <main+0x36>
        fprintf(2, "Usage: sleep TIME\n");
        exit(1);
    }
    int time = atoi(argv[1]);
   e:	6588                	ld	a0,8(a1)
  10:	00000097          	auipc	ra,0x0
  14:	20c080e7          	jalr	524(ra) # 21c <atoi>
    if (time == 0) {
  18:	ed0d                	bnez	a0,52 <main+0x52>
        fprintf(2, "Usage: sleep TIME\nTIME should be an integer larger than 0.\n");
  1a:	00001597          	auipc	a1,0x1
  1e:	88658593          	addi	a1,a1,-1914 # 8a0 <malloc+0xfc>
  22:	4509                	li	a0,2
  24:	00000097          	auipc	ra,0x0
  28:	692080e7          	jalr	1682(ra) # 6b6 <fprintf>
        exit(1);
  2c:	4505                	li	a0,1
  2e:	00000097          	auipc	ra,0x0
  32:	310080e7          	jalr	784(ra) # 33e <exit>
        fprintf(2, "Usage: sleep TIME\n");
  36:	00001597          	auipc	a1,0x1
  3a:	85258593          	addi	a1,a1,-1966 # 888 <malloc+0xe4>
  3e:	4509                	li	a0,2
  40:	00000097          	auipc	ra,0x0
  44:	676080e7          	jalr	1654(ra) # 6b6 <fprintf>
        exit(1);
  48:	4505                	li	a0,1
  4a:	00000097          	auipc	ra,0x0
  4e:	2f4080e7          	jalr	756(ra) # 33e <exit>
    }
    sleep(time);
  52:	00000097          	auipc	ra,0x0
  56:	364080e7          	jalr	868(ra) # 3b6 <sleep>
    exit(0);
  5a:	4501                	li	a0,0
  5c:	00000097          	auipc	ra,0x0
  60:	2e2080e7          	jalr	738(ra) # 33e <exit>

0000000000000064 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  64:	1141                	addi	sp,sp,-16
  66:	e422                	sd	s0,8(sp)
  68:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	87aa                	mv	a5,a0
  6c:	0585                	addi	a1,a1,1
  6e:	0785                	addi	a5,a5,1
  70:	fff5c703          	lbu	a4,-1(a1)
  74:	fee78fa3          	sb	a4,-1(a5)
  78:	fb75                	bnez	a4,6c <strcpy+0x8>
    ;
  return os;
}
  7a:	6422                	ld	s0,8(sp)
  7c:	0141                	addi	sp,sp,16
  7e:	8082                	ret

0000000000000080 <strcat>:

char*
strcat(char *s, const char *t)
{
  80:	1141                	addi	sp,sp,-16
  82:	e422                	sd	s0,8(sp)
  84:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  86:	00054783          	lbu	a5,0(a0)
  8a:	c385                	beqz	a5,aa <strcat+0x2a>
  8c:	87aa                	mv	a5,a0
    s++;
  8e:	0785                	addi	a5,a5,1
  while(*s)
  90:	0007c703          	lbu	a4,0(a5)
  94:	ff6d                	bnez	a4,8e <strcat+0xe>
  while((*s++ = *t++))
  96:	0585                	addi	a1,a1,1
  98:	0785                	addi	a5,a5,1
  9a:	fff5c703          	lbu	a4,-1(a1)
  9e:	fee78fa3          	sb	a4,-1(a5)
  a2:	fb75                	bnez	a4,96 <strcat+0x16>
    ;
  return os;
}
  a4:	6422                	ld	s0,8(sp)
  a6:	0141                	addi	sp,sp,16
  a8:	8082                	ret
  while(*s)
  aa:	87aa                	mv	a5,a0
  ac:	b7ed                	j	96 <strcat+0x16>

00000000000000ae <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ae:	1141                	addi	sp,sp,-16
  b0:	e422                	sd	s0,8(sp)
  b2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  b4:	00054783          	lbu	a5,0(a0)
  b8:	cf91                	beqz	a5,d4 <strcmp+0x26>
  ba:	0005c703          	lbu	a4,0(a1)
  be:	00f71b63          	bne	a4,a5,d4 <strcmp+0x26>
    p++, q++;
  c2:	0505                	addi	a0,a0,1
  c4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  c6:	00054783          	lbu	a5,0(a0)
  ca:	c789                	beqz	a5,d4 <strcmp+0x26>
  cc:	0005c703          	lbu	a4,0(a1)
  d0:	fef709e3          	beq	a4,a5,c2 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
  d4:	0005c503          	lbu	a0,0(a1)
}
  d8:	40a7853b          	subw	a0,a5,a0
  dc:	6422                	ld	s0,8(sp)
  de:	0141                	addi	sp,sp,16
  e0:	8082                	ret

00000000000000e2 <strlen>:

uint
strlen(const char *s)
{
  e2:	1141                	addi	sp,sp,-16
  e4:	e422                	sd	s0,8(sp)
  e6:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  e8:	00054783          	lbu	a5,0(a0)
  ec:	cf91                	beqz	a5,108 <strlen+0x26>
  ee:	0505                	addi	a0,a0,1
  f0:	87aa                	mv	a5,a0
  f2:	4685                	li	a3,1
  f4:	9e89                	subw	a3,a3,a0
  f6:	00f6853b          	addw	a0,a3,a5
  fa:	0785                	addi	a5,a5,1
  fc:	fff7c703          	lbu	a4,-1(a5)
 100:	fb7d                	bnez	a4,f6 <strlen+0x14>
    ;
  return n;
}
 102:	6422                	ld	s0,8(sp)
 104:	0141                	addi	sp,sp,16
 106:	8082                	ret
  for(n = 0; s[n]; n++)
 108:	4501                	li	a0,0
 10a:	bfe5                	j	102 <strlen+0x20>

000000000000010c <memset>:

void*
memset(void *dst, int c, uint n)
{
 10c:	1141                	addi	sp,sp,-16
 10e:	e422                	sd	s0,8(sp)
 110:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 112:	ce09                	beqz	a2,12c <memset+0x20>
 114:	87aa                	mv	a5,a0
 116:	fff6071b          	addiw	a4,a2,-1
 11a:	1702                	slli	a4,a4,0x20
 11c:	9301                	srli	a4,a4,0x20
 11e:	0705                	addi	a4,a4,1
 120:	972a                	add	a4,a4,a0
    cdst[i] = c;
 122:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 126:	0785                	addi	a5,a5,1
 128:	fee79de3          	bne	a5,a4,122 <memset+0x16>
  }
  return dst;
}
 12c:	6422                	ld	s0,8(sp)
 12e:	0141                	addi	sp,sp,16
 130:	8082                	ret

0000000000000132 <strchr>:

char*
strchr(const char *s, char c)
{
 132:	1141                	addi	sp,sp,-16
 134:	e422                	sd	s0,8(sp)
 136:	0800                	addi	s0,sp,16
  for(; *s; s++)
 138:	00054783          	lbu	a5,0(a0)
 13c:	cf91                	beqz	a5,158 <strchr+0x26>
    if(*s == c)
 13e:	00f58a63          	beq	a1,a5,152 <strchr+0x20>
  for(; *s; s++)
 142:	0505                	addi	a0,a0,1
 144:	00054783          	lbu	a5,0(a0)
 148:	c781                	beqz	a5,150 <strchr+0x1e>
    if(*s == c)
 14a:	feb79ce3          	bne	a5,a1,142 <strchr+0x10>
 14e:	a011                	j	152 <strchr+0x20>
      return (char*)s;
  return 0;
 150:	4501                	li	a0,0
}
 152:	6422                	ld	s0,8(sp)
 154:	0141                	addi	sp,sp,16
 156:	8082                	ret
  return 0;
 158:	4501                	li	a0,0
 15a:	bfe5                	j	152 <strchr+0x20>

000000000000015c <gets>:

char*
gets(char *buf, int max)
{
 15c:	711d                	addi	sp,sp,-96
 15e:	ec86                	sd	ra,88(sp)
 160:	e8a2                	sd	s0,80(sp)
 162:	e4a6                	sd	s1,72(sp)
 164:	e0ca                	sd	s2,64(sp)
 166:	fc4e                	sd	s3,56(sp)
 168:	f852                	sd	s4,48(sp)
 16a:	f456                	sd	s5,40(sp)
 16c:	f05a                	sd	s6,32(sp)
 16e:	ec5e                	sd	s7,24(sp)
 170:	e862                	sd	s8,16(sp)
 172:	1080                	addi	s0,sp,96
 174:	8c2a                	mv	s8,a0
 176:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 178:	892a                	mv	s2,a0
 17a:	4981                	li	s3,0
    cc = read(0, &c, 1);
 17c:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 180:	4b29                	li	s6,10
 182:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 184:	0019849b          	addiw	s1,s3,1
 188:	0344d763          	ble	s4,s1,1b6 <gets+0x5a>
    cc = read(0, &c, 1);
 18c:	4605                	li	a2,1
 18e:	85d6                	mv	a1,s5
 190:	4501                	li	a0,0
 192:	00000097          	auipc	ra,0x0
 196:	1c4080e7          	jalr	452(ra) # 356 <read>
    if(cc < 1)
 19a:	00a05e63          	blez	a0,1b6 <gets+0x5a>
    buf[i++] = c;
 19e:	faf44783          	lbu	a5,-81(s0)
 1a2:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1a6:	01678763          	beq	a5,s6,1b4 <gets+0x58>
 1aa:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 1ac:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 1ae:	fd779be3          	bne	a5,s7,184 <gets+0x28>
 1b2:	a011                	j	1b6 <gets+0x5a>
  for(i=0; i+1 < max; ){
 1b4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1b6:	99e2                	add	s3,s3,s8
 1b8:	00098023          	sb	zero,0(s3)
  return buf;
}
 1bc:	8562                	mv	a0,s8
 1be:	60e6                	ld	ra,88(sp)
 1c0:	6446                	ld	s0,80(sp)
 1c2:	64a6                	ld	s1,72(sp)
 1c4:	6906                	ld	s2,64(sp)
 1c6:	79e2                	ld	s3,56(sp)
 1c8:	7a42                	ld	s4,48(sp)
 1ca:	7aa2                	ld	s5,40(sp)
 1cc:	7b02                	ld	s6,32(sp)
 1ce:	6be2                	ld	s7,24(sp)
 1d0:	6c42                	ld	s8,16(sp)
 1d2:	6125                	addi	sp,sp,96
 1d4:	8082                	ret

00000000000001d6 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d6:	1101                	addi	sp,sp,-32
 1d8:	ec06                	sd	ra,24(sp)
 1da:	e822                	sd	s0,16(sp)
 1dc:	e426                	sd	s1,8(sp)
 1de:	e04a                	sd	s2,0(sp)
 1e0:	1000                	addi	s0,sp,32
 1e2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e4:	4581                	li	a1,0
 1e6:	00000097          	auipc	ra,0x0
 1ea:	198080e7          	jalr	408(ra) # 37e <open>
  if(fd < 0)
 1ee:	02054563          	bltz	a0,218 <stat+0x42>
 1f2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1f4:	85ca                	mv	a1,s2
 1f6:	00000097          	auipc	ra,0x0
 1fa:	190080e7          	jalr	400(ra) # 386 <fstat>
 1fe:	892a                	mv	s2,a0
  close(fd);
 200:	8526                	mv	a0,s1
 202:	00000097          	auipc	ra,0x0
 206:	164080e7          	jalr	356(ra) # 366 <close>
  return r;
}
 20a:	854a                	mv	a0,s2
 20c:	60e2                	ld	ra,24(sp)
 20e:	6442                	ld	s0,16(sp)
 210:	64a2                	ld	s1,8(sp)
 212:	6902                	ld	s2,0(sp)
 214:	6105                	addi	sp,sp,32
 216:	8082                	ret
    return -1;
 218:	597d                	li	s2,-1
 21a:	bfc5                	j	20a <stat+0x34>

000000000000021c <atoi>:

int
atoi(const char *s)
{
 21c:	1141                	addi	sp,sp,-16
 21e:	e422                	sd	s0,8(sp)
 220:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 222:	00054703          	lbu	a4,0(a0)
 226:	02d00793          	li	a5,45
  int neg = 1;
 22a:	4805                	li	a6,1
  if (*s == '-') {
 22c:	04f70363          	beq	a4,a5,272 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 230:	00054683          	lbu	a3,0(a0)
 234:	fd06879b          	addiw	a5,a3,-48
 238:	0ff7f793          	andi	a5,a5,255
 23c:	4725                	li	a4,9
 23e:	02f76d63          	bltu	a4,a5,278 <atoi+0x5c>
  n = 0;
 242:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 244:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 246:	0505                	addi	a0,a0,1
 248:	0026179b          	slliw	a5,a2,0x2
 24c:	9fb1                	addw	a5,a5,a2
 24e:	0017979b          	slliw	a5,a5,0x1
 252:	9fb5                	addw	a5,a5,a3
 254:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 258:	00054683          	lbu	a3,0(a0)
 25c:	fd06871b          	addiw	a4,a3,-48
 260:	0ff77713          	andi	a4,a4,255
 264:	fee5f1e3          	bleu	a4,a1,246 <atoi+0x2a>
  return n * neg;
}
 268:	02c8053b          	mulw	a0,a6,a2
 26c:	6422                	ld	s0,8(sp)
 26e:	0141                	addi	sp,sp,16
 270:	8082                	ret
    s++;
 272:	0505                	addi	a0,a0,1
    neg = -1;
 274:	587d                	li	a6,-1
 276:	bf6d                	j	230 <atoi+0x14>
  n = 0;
 278:	4601                	li	a2,0
 27a:	b7fd                	j	268 <atoi+0x4c>

000000000000027c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 27c:	1141                	addi	sp,sp,-16
 27e:	e422                	sd	s0,8(sp)
 280:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 282:	02b57663          	bleu	a1,a0,2ae <memmove+0x32>
    while(n-- > 0)
 286:	02c05163          	blez	a2,2a8 <memmove+0x2c>
 28a:	fff6079b          	addiw	a5,a2,-1
 28e:	1782                	slli	a5,a5,0x20
 290:	9381                	srli	a5,a5,0x20
 292:	0785                	addi	a5,a5,1
 294:	97aa                	add	a5,a5,a0
  dst = vdst;
 296:	872a                	mv	a4,a0
      *dst++ = *src++;
 298:	0585                	addi	a1,a1,1
 29a:	0705                	addi	a4,a4,1
 29c:	fff5c683          	lbu	a3,-1(a1)
 2a0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2a4:	fee79ae3          	bne	a5,a4,298 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2a8:	6422                	ld	s0,8(sp)
 2aa:	0141                	addi	sp,sp,16
 2ac:	8082                	ret
    dst += n;
 2ae:	00c50733          	add	a4,a0,a2
    src += n;
 2b2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2b4:	fec05ae3          	blez	a2,2a8 <memmove+0x2c>
 2b8:	fff6079b          	addiw	a5,a2,-1
 2bc:	1782                	slli	a5,a5,0x20
 2be:	9381                	srli	a5,a5,0x20
 2c0:	fff7c793          	not	a5,a5
 2c4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2c6:	15fd                	addi	a1,a1,-1
 2c8:	177d                	addi	a4,a4,-1
 2ca:	0005c683          	lbu	a3,0(a1)
 2ce:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2d2:	fef71ae3          	bne	a4,a5,2c6 <memmove+0x4a>
 2d6:	bfc9                	j	2a8 <memmove+0x2c>

00000000000002d8 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2d8:	1141                	addi	sp,sp,-16
 2da:	e422                	sd	s0,8(sp)
 2dc:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2de:	ce15                	beqz	a2,31a <memcmp+0x42>
 2e0:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 2e4:	00054783          	lbu	a5,0(a0)
 2e8:	0005c703          	lbu	a4,0(a1)
 2ec:	02e79063          	bne	a5,a4,30c <memcmp+0x34>
 2f0:	1682                	slli	a3,a3,0x20
 2f2:	9281                	srli	a3,a3,0x20
 2f4:	0685                	addi	a3,a3,1
 2f6:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 2f8:	0505                	addi	a0,a0,1
    p2++;
 2fa:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2fc:	00d50d63          	beq	a0,a3,316 <memcmp+0x3e>
    if (*p1 != *p2) {
 300:	00054783          	lbu	a5,0(a0)
 304:	0005c703          	lbu	a4,0(a1)
 308:	fee788e3          	beq	a5,a4,2f8 <memcmp+0x20>
      return *p1 - *p2;
 30c:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 310:	6422                	ld	s0,8(sp)
 312:	0141                	addi	sp,sp,16
 314:	8082                	ret
  return 0;
 316:	4501                	li	a0,0
 318:	bfe5                	j	310 <memcmp+0x38>
 31a:	4501                	li	a0,0
 31c:	bfd5                	j	310 <memcmp+0x38>

000000000000031e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 31e:	1141                	addi	sp,sp,-16
 320:	e406                	sd	ra,8(sp)
 322:	e022                	sd	s0,0(sp)
 324:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 326:	00000097          	auipc	ra,0x0
 32a:	f56080e7          	jalr	-170(ra) # 27c <memmove>
}
 32e:	60a2                	ld	ra,8(sp)
 330:	6402                	ld	s0,0(sp)
 332:	0141                	addi	sp,sp,16
 334:	8082                	ret

0000000000000336 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 336:	4885                	li	a7,1
 ecall
 338:	00000073          	ecall
 ret
 33c:	8082                	ret

000000000000033e <exit>:
.global exit
exit:
 li a7, SYS_exit
 33e:	4889                	li	a7,2
 ecall
 340:	00000073          	ecall
 ret
 344:	8082                	ret

0000000000000346 <wait>:
.global wait
wait:
 li a7, SYS_wait
 346:	488d                	li	a7,3
 ecall
 348:	00000073          	ecall
 ret
 34c:	8082                	ret

000000000000034e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 34e:	4891                	li	a7,4
 ecall
 350:	00000073          	ecall
 ret
 354:	8082                	ret

0000000000000356 <read>:
.global read
read:
 li a7, SYS_read
 356:	4895                	li	a7,5
 ecall
 358:	00000073          	ecall
 ret
 35c:	8082                	ret

000000000000035e <write>:
.global write
write:
 li a7, SYS_write
 35e:	48c1                	li	a7,16
 ecall
 360:	00000073          	ecall
 ret
 364:	8082                	ret

0000000000000366 <close>:
.global close
close:
 li a7, SYS_close
 366:	48d5                	li	a7,21
 ecall
 368:	00000073          	ecall
 ret
 36c:	8082                	ret

000000000000036e <kill>:
.global kill
kill:
 li a7, SYS_kill
 36e:	4899                	li	a7,6
 ecall
 370:	00000073          	ecall
 ret
 374:	8082                	ret

0000000000000376 <exec>:
.global exec
exec:
 li a7, SYS_exec
 376:	489d                	li	a7,7
 ecall
 378:	00000073          	ecall
 ret
 37c:	8082                	ret

000000000000037e <open>:
.global open
open:
 li a7, SYS_open
 37e:	48bd                	li	a7,15
 ecall
 380:	00000073          	ecall
 ret
 384:	8082                	ret

0000000000000386 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 386:	48a1                	li	a7,8
 ecall
 388:	00000073          	ecall
 ret
 38c:	8082                	ret

000000000000038e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 38e:	48d1                	li	a7,20
 ecall
 390:	00000073          	ecall
 ret
 394:	8082                	ret

0000000000000396 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 396:	48a5                	li	a7,9
 ecall
 398:	00000073          	ecall
 ret
 39c:	8082                	ret

000000000000039e <dup>:
.global dup
dup:
 li a7, SYS_dup
 39e:	48a9                	li	a7,10
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3a6:	48ad                	li	a7,11
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ae:	48b1                	li	a7,12
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3b6:	48b5                	li	a7,13
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3be:	48b9                	li	a7,14
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3c6:	48d9                	li	a7,22
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <dev>:
.global dev
dev:
 li a7, SYS_dev
 3ce:	48dd                	li	a7,23
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3d6:	48e1                	li	a7,24
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3de:	48e5                	li	a7,25
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3e6:	48c5                	li	a7,17
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <trace>:
.global trace
trace:
 li a7, SYS_trace
 3ee:	48c9                	li	a7,18
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3f6:	48cd                	li	a7,19
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <rename>:
.global rename
rename:
 li a7, SYS_rename
 3fe:	48e9                	li	a7,26
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 406:	48ed                	li	a7,27
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 40e:	1101                	addi	sp,sp,-32
 410:	ec06                	sd	ra,24(sp)
 412:	e822                	sd	s0,16(sp)
 414:	1000                	addi	s0,sp,32
 416:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 41a:	4605                	li	a2,1
 41c:	fef40593          	addi	a1,s0,-17
 420:	00000097          	auipc	ra,0x0
 424:	f3e080e7          	jalr	-194(ra) # 35e <write>
}
 428:	60e2                	ld	ra,24(sp)
 42a:	6442                	ld	s0,16(sp)
 42c:	6105                	addi	sp,sp,32
 42e:	8082                	ret

0000000000000430 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	7139                	addi	sp,sp,-64
 432:	fc06                	sd	ra,56(sp)
 434:	f822                	sd	s0,48(sp)
 436:	f426                	sd	s1,40(sp)
 438:	f04a                	sd	s2,32(sp)
 43a:	ec4e                	sd	s3,24(sp)
 43c:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43e:	c299                	beqz	a3,444 <printint+0x14>
 440:	0005ce63          	bltz	a1,45c <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 444:	2581                	sext.w	a1,a1
  neg = 0;
 446:	4301                	li	t1,0
  }

  i = 0;
 448:	fc040913          	addi	s2,s0,-64
  neg = 0;
 44c:	874a                	mv	a4,s2
  i = 0;
 44e:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 450:	2601                	sext.w	a2,a2
 452:	00000897          	auipc	a7,0x0
 456:	48e88893          	addi	a7,a7,1166 # 8e0 <digits>
 45a:	a801                	j	46a <printint+0x3a>
    x = -xx;
 45c:	40b005bb          	negw	a1,a1
 460:	2581                	sext.w	a1,a1
    neg = 1;
 462:	4305                	li	t1,1
    x = -xx;
 464:	b7d5                	j	448 <printint+0x18>
  }while((x /= base) != 0);
 466:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 468:	8836                	mv	a6,a3
 46a:	0018069b          	addiw	a3,a6,1
 46e:	02c5f7bb          	remuw	a5,a1,a2
 472:	1782                	slli	a5,a5,0x20
 474:	9381                	srli	a5,a5,0x20
 476:	97c6                	add	a5,a5,a7
 478:	0007c783          	lbu	a5,0(a5)
 47c:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 480:	0705                	addi	a4,a4,1
 482:	02c5d7bb          	divuw	a5,a1,a2
 486:	fec5f0e3          	bleu	a2,a1,466 <printint+0x36>
  if(neg)
 48a:	00030b63          	beqz	t1,4a0 <printint+0x70>
    buf[i++] = '-';
 48e:	fd040793          	addi	a5,s0,-48
 492:	96be                	add	a3,a3,a5
 494:	02d00793          	li	a5,45
 498:	fef68823          	sb	a5,-16(a3)
 49c:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 4a0:	02d05763          	blez	a3,4ce <printint+0x9e>
 4a4:	89aa                	mv	s3,a0
 4a6:	fc040493          	addi	s1,s0,-64
 4aa:	94b6                	add	s1,s1,a3
 4ac:	197d                	addi	s2,s2,-1
 4ae:	9936                	add	s2,s2,a3
 4b0:	36fd                	addiw	a3,a3,-1
 4b2:	1682                	slli	a3,a3,0x20
 4b4:	9281                	srli	a3,a3,0x20
 4b6:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 4ba:	fff4c583          	lbu	a1,-1(s1)
 4be:	854e                	mv	a0,s3
 4c0:	00000097          	auipc	ra,0x0
 4c4:	f4e080e7          	jalr	-178(ra) # 40e <putc>
  while(--i >= 0)
 4c8:	14fd                	addi	s1,s1,-1
 4ca:	ff2498e3          	bne	s1,s2,4ba <printint+0x8a>
}
 4ce:	70e2                	ld	ra,56(sp)
 4d0:	7442                	ld	s0,48(sp)
 4d2:	74a2                	ld	s1,40(sp)
 4d4:	7902                	ld	s2,32(sp)
 4d6:	69e2                	ld	s3,24(sp)
 4d8:	6121                	addi	sp,sp,64
 4da:	8082                	ret

00000000000004dc <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4dc:	7119                	addi	sp,sp,-128
 4de:	fc86                	sd	ra,120(sp)
 4e0:	f8a2                	sd	s0,112(sp)
 4e2:	f4a6                	sd	s1,104(sp)
 4e4:	f0ca                	sd	s2,96(sp)
 4e6:	ecce                	sd	s3,88(sp)
 4e8:	e8d2                	sd	s4,80(sp)
 4ea:	e4d6                	sd	s5,72(sp)
 4ec:	e0da                	sd	s6,64(sp)
 4ee:	fc5e                	sd	s7,56(sp)
 4f0:	f862                	sd	s8,48(sp)
 4f2:	f466                	sd	s9,40(sp)
 4f4:	f06a                	sd	s10,32(sp)
 4f6:	ec6e                	sd	s11,24(sp)
 4f8:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4fa:	0005c483          	lbu	s1,0(a1)
 4fe:	18048d63          	beqz	s1,698 <vprintf+0x1bc>
 502:	8aaa                	mv	s5,a0
 504:	8b32                	mv	s6,a2
 506:	00158913          	addi	s2,a1,1
  state = 0;
 50a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 50c:	02500a13          	li	s4,37
      if(c == 'd'){
 510:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 514:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 518:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 51c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 520:	00000b97          	auipc	s7,0x0
 524:	3c0b8b93          	addi	s7,s7,960 # 8e0 <digits>
 528:	a839                	j	546 <vprintf+0x6a>
        putc(fd, c);
 52a:	85a6                	mv	a1,s1
 52c:	8556                	mv	a0,s5
 52e:	00000097          	auipc	ra,0x0
 532:	ee0080e7          	jalr	-288(ra) # 40e <putc>
 536:	a019                	j	53c <vprintf+0x60>
    } else if(state == '%'){
 538:	01498f63          	beq	s3,s4,556 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 53c:	0905                	addi	s2,s2,1
 53e:	fff94483          	lbu	s1,-1(s2)
 542:	14048b63          	beqz	s1,698 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 546:	0004879b          	sext.w	a5,s1
    if(state == 0){
 54a:	fe0997e3          	bnez	s3,538 <vprintf+0x5c>
      if(c == '%'){
 54e:	fd479ee3          	bne	a5,s4,52a <vprintf+0x4e>
        state = '%';
 552:	89be                	mv	s3,a5
 554:	b7e5                	j	53c <vprintf+0x60>
      if(c == 'd'){
 556:	05878063          	beq	a5,s8,596 <vprintf+0xba>
      } else if(c == 'l') {
 55a:	05978c63          	beq	a5,s9,5b2 <vprintf+0xd6>
      } else if(c == 'x') {
 55e:	07a78863          	beq	a5,s10,5ce <vprintf+0xf2>
      } else if(c == 'p') {
 562:	09b78463          	beq	a5,s11,5ea <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 566:	07300713          	li	a4,115
 56a:	0ce78563          	beq	a5,a4,634 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56e:	06300713          	li	a4,99
 572:	0ee78c63          	beq	a5,a4,66a <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 576:	11478663          	beq	a5,s4,682 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 57a:	85d2                	mv	a1,s4
 57c:	8556                	mv	a0,s5
 57e:	00000097          	auipc	ra,0x0
 582:	e90080e7          	jalr	-368(ra) # 40e <putc>
        putc(fd, c);
 586:	85a6                	mv	a1,s1
 588:	8556                	mv	a0,s5
 58a:	00000097          	auipc	ra,0x0
 58e:	e84080e7          	jalr	-380(ra) # 40e <putc>
      }
      state = 0;
 592:	4981                	li	s3,0
 594:	b765                	j	53c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 596:	008b0493          	addi	s1,s6,8
 59a:	4685                	li	a3,1
 59c:	4629                	li	a2,10
 59e:	000b2583          	lw	a1,0(s6)
 5a2:	8556                	mv	a0,s5
 5a4:	00000097          	auipc	ra,0x0
 5a8:	e8c080e7          	jalr	-372(ra) # 430 <printint>
 5ac:	8b26                	mv	s6,s1
      state = 0;
 5ae:	4981                	li	s3,0
 5b0:	b771                	j	53c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5b2:	008b0493          	addi	s1,s6,8
 5b6:	4681                	li	a3,0
 5b8:	4629                	li	a2,10
 5ba:	000b2583          	lw	a1,0(s6)
 5be:	8556                	mv	a0,s5
 5c0:	00000097          	auipc	ra,0x0
 5c4:	e70080e7          	jalr	-400(ra) # 430 <printint>
 5c8:	8b26                	mv	s6,s1
      state = 0;
 5ca:	4981                	li	s3,0
 5cc:	bf85                	j	53c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5ce:	008b0493          	addi	s1,s6,8
 5d2:	4681                	li	a3,0
 5d4:	4641                	li	a2,16
 5d6:	000b2583          	lw	a1,0(s6)
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	e54080e7          	jalr	-428(ra) # 430 <printint>
 5e4:	8b26                	mv	s6,s1
      state = 0;
 5e6:	4981                	li	s3,0
 5e8:	bf91                	j	53c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5ea:	008b0793          	addi	a5,s6,8
 5ee:	f8f43423          	sd	a5,-120(s0)
 5f2:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5f6:	03000593          	li	a1,48
 5fa:	8556                	mv	a0,s5
 5fc:	00000097          	auipc	ra,0x0
 600:	e12080e7          	jalr	-494(ra) # 40e <putc>
  putc(fd, 'x');
 604:	85ea                	mv	a1,s10
 606:	8556                	mv	a0,s5
 608:	00000097          	auipc	ra,0x0
 60c:	e06080e7          	jalr	-506(ra) # 40e <putc>
 610:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 612:	03c9d793          	srli	a5,s3,0x3c
 616:	97de                	add	a5,a5,s7
 618:	0007c583          	lbu	a1,0(a5)
 61c:	8556                	mv	a0,s5
 61e:	00000097          	auipc	ra,0x0
 622:	df0080e7          	jalr	-528(ra) # 40e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 626:	0992                	slli	s3,s3,0x4
 628:	34fd                	addiw	s1,s1,-1
 62a:	f4e5                	bnez	s1,612 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 62c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 630:	4981                	li	s3,0
 632:	b729                	j	53c <vprintf+0x60>
        s = va_arg(ap, char*);
 634:	008b0993          	addi	s3,s6,8
 638:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 63c:	c085                	beqz	s1,65c <vprintf+0x180>
        while(*s != 0){
 63e:	0004c583          	lbu	a1,0(s1)
 642:	c9a1                	beqz	a1,692 <vprintf+0x1b6>
          putc(fd, *s);
 644:	8556                	mv	a0,s5
 646:	00000097          	auipc	ra,0x0
 64a:	dc8080e7          	jalr	-568(ra) # 40e <putc>
          s++;
 64e:	0485                	addi	s1,s1,1
        while(*s != 0){
 650:	0004c583          	lbu	a1,0(s1)
 654:	f9e5                	bnez	a1,644 <vprintf+0x168>
        s = va_arg(ap, char*);
 656:	8b4e                	mv	s6,s3
      state = 0;
 658:	4981                	li	s3,0
 65a:	b5cd                	j	53c <vprintf+0x60>
          s = "(null)";
 65c:	00000497          	auipc	s1,0x0
 660:	29c48493          	addi	s1,s1,668 # 8f8 <digits+0x18>
        while(*s != 0){
 664:	02800593          	li	a1,40
 668:	bff1                	j	644 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 66a:	008b0493          	addi	s1,s6,8
 66e:	000b4583          	lbu	a1,0(s6)
 672:	8556                	mv	a0,s5
 674:	00000097          	auipc	ra,0x0
 678:	d9a080e7          	jalr	-614(ra) # 40e <putc>
 67c:	8b26                	mv	s6,s1
      state = 0;
 67e:	4981                	li	s3,0
 680:	bd75                	j	53c <vprintf+0x60>
        putc(fd, c);
 682:	85d2                	mv	a1,s4
 684:	8556                	mv	a0,s5
 686:	00000097          	auipc	ra,0x0
 68a:	d88080e7          	jalr	-632(ra) # 40e <putc>
      state = 0;
 68e:	4981                	li	s3,0
 690:	b575                	j	53c <vprintf+0x60>
        s = va_arg(ap, char*);
 692:	8b4e                	mv	s6,s3
      state = 0;
 694:	4981                	li	s3,0
 696:	b55d                	j	53c <vprintf+0x60>
    }
  }
}
 698:	70e6                	ld	ra,120(sp)
 69a:	7446                	ld	s0,112(sp)
 69c:	74a6                	ld	s1,104(sp)
 69e:	7906                	ld	s2,96(sp)
 6a0:	69e6                	ld	s3,88(sp)
 6a2:	6a46                	ld	s4,80(sp)
 6a4:	6aa6                	ld	s5,72(sp)
 6a6:	6b06                	ld	s6,64(sp)
 6a8:	7be2                	ld	s7,56(sp)
 6aa:	7c42                	ld	s8,48(sp)
 6ac:	7ca2                	ld	s9,40(sp)
 6ae:	7d02                	ld	s10,32(sp)
 6b0:	6de2                	ld	s11,24(sp)
 6b2:	6109                	addi	sp,sp,128
 6b4:	8082                	ret

00000000000006b6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6b6:	715d                	addi	sp,sp,-80
 6b8:	ec06                	sd	ra,24(sp)
 6ba:	e822                	sd	s0,16(sp)
 6bc:	1000                	addi	s0,sp,32
 6be:	e010                	sd	a2,0(s0)
 6c0:	e414                	sd	a3,8(s0)
 6c2:	e818                	sd	a4,16(s0)
 6c4:	ec1c                	sd	a5,24(s0)
 6c6:	03043023          	sd	a6,32(s0)
 6ca:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6ce:	8622                	mv	a2,s0
 6d0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6d4:	00000097          	auipc	ra,0x0
 6d8:	e08080e7          	jalr	-504(ra) # 4dc <vprintf>
}
 6dc:	60e2                	ld	ra,24(sp)
 6de:	6442                	ld	s0,16(sp)
 6e0:	6161                	addi	sp,sp,80
 6e2:	8082                	ret

00000000000006e4 <printf>:

void
printf(const char *fmt, ...)
{
 6e4:	711d                	addi	sp,sp,-96
 6e6:	ec06                	sd	ra,24(sp)
 6e8:	e822                	sd	s0,16(sp)
 6ea:	1000                	addi	s0,sp,32
 6ec:	e40c                	sd	a1,8(s0)
 6ee:	e810                	sd	a2,16(s0)
 6f0:	ec14                	sd	a3,24(s0)
 6f2:	f018                	sd	a4,32(s0)
 6f4:	f41c                	sd	a5,40(s0)
 6f6:	03043823          	sd	a6,48(s0)
 6fa:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6fe:	00840613          	addi	a2,s0,8
 702:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 706:	85aa                	mv	a1,a0
 708:	4505                	li	a0,1
 70a:	00000097          	auipc	ra,0x0
 70e:	dd2080e7          	jalr	-558(ra) # 4dc <vprintf>
}
 712:	60e2                	ld	ra,24(sp)
 714:	6442                	ld	s0,16(sp)
 716:	6125                	addi	sp,sp,96
 718:	8082                	ret

000000000000071a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 71a:	1141                	addi	sp,sp,-16
 71c:	e422                	sd	s0,8(sp)
 71e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 720:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 724:	00000797          	auipc	a5,0x0
 728:	1dc78793          	addi	a5,a5,476 # 900 <__bss_start>
 72c:	639c                	ld	a5,0(a5)
 72e:	a805                	j	75e <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 730:	4618                	lw	a4,8(a2)
 732:	9db9                	addw	a1,a1,a4
 734:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 738:	6398                	ld	a4,0(a5)
 73a:	6318                	ld	a4,0(a4)
 73c:	fee53823          	sd	a4,-16(a0)
 740:	a091                	j	784 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 742:	ff852703          	lw	a4,-8(a0)
 746:	9e39                	addw	a2,a2,a4
 748:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 74a:	ff053703          	ld	a4,-16(a0)
 74e:	e398                	sd	a4,0(a5)
 750:	a099                	j	796 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	6398                	ld	a4,0(a5)
 754:	00e7e463          	bltu	a5,a4,75c <free+0x42>
 758:	00e6ea63          	bltu	a3,a4,76c <free+0x52>
{
 75c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75e:	fed7fae3          	bleu	a3,a5,752 <free+0x38>
 762:	6398                	ld	a4,0(a5)
 764:	00e6e463          	bltu	a3,a4,76c <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 768:	fee7eae3          	bltu	a5,a4,75c <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 76c:	ff852583          	lw	a1,-8(a0)
 770:	6390                	ld	a2,0(a5)
 772:	02059713          	slli	a4,a1,0x20
 776:	9301                	srli	a4,a4,0x20
 778:	0712                	slli	a4,a4,0x4
 77a:	9736                	add	a4,a4,a3
 77c:	fae60ae3          	beq	a2,a4,730 <free+0x16>
    bp->s.ptr = p->s.ptr;
 780:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 784:	4790                	lw	a2,8(a5)
 786:	02061713          	slli	a4,a2,0x20
 78a:	9301                	srli	a4,a4,0x20
 78c:	0712                	slli	a4,a4,0x4
 78e:	973e                	add	a4,a4,a5
 790:	fae689e3          	beq	a3,a4,742 <free+0x28>
  } else
    p->s.ptr = bp;
 794:	e394                	sd	a3,0(a5)
  freep = p;
 796:	00000717          	auipc	a4,0x0
 79a:	16f73523          	sd	a5,362(a4) # 900 <__bss_start>
}
 79e:	6422                	ld	s0,8(sp)
 7a0:	0141                	addi	sp,sp,16
 7a2:	8082                	ret

00000000000007a4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a4:	7139                	addi	sp,sp,-64
 7a6:	fc06                	sd	ra,56(sp)
 7a8:	f822                	sd	s0,48(sp)
 7aa:	f426                	sd	s1,40(sp)
 7ac:	f04a                	sd	s2,32(sp)
 7ae:	ec4e                	sd	s3,24(sp)
 7b0:	e852                	sd	s4,16(sp)
 7b2:	e456                	sd	s5,8(sp)
 7b4:	e05a                	sd	s6,0(sp)
 7b6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b8:	02051993          	slli	s3,a0,0x20
 7bc:	0209d993          	srli	s3,s3,0x20
 7c0:	09bd                	addi	s3,s3,15
 7c2:	0049d993          	srli	s3,s3,0x4
 7c6:	2985                	addiw	s3,s3,1
 7c8:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 7cc:	00000797          	auipc	a5,0x0
 7d0:	13478793          	addi	a5,a5,308 # 900 <__bss_start>
 7d4:	6388                	ld	a0,0(a5)
 7d6:	c515                	beqz	a0,802 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7da:	4798                	lw	a4,8(a5)
 7dc:	03277d63          	bleu	s2,a4,816 <malloc+0x72>
 7e0:	8a4e                	mv	s4,s3
 7e2:	0009871b          	sext.w	a4,s3
 7e6:	6685                	lui	a3,0x1
 7e8:	00d77363          	bleu	a3,a4,7ee <malloc+0x4a>
 7ec:	6a05                	lui	s4,0x1
 7ee:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 7f2:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f6:	00000497          	auipc	s1,0x0
 7fa:	10a48493          	addi	s1,s1,266 # 900 <__bss_start>
  if(p == (char*)-1)
 7fe:	5b7d                	li	s6,-1
 800:	a0b5                	j	86c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 802:	00000717          	auipc	a4,0x0
 806:	10670713          	addi	a4,a4,262 # 908 <base>
 80a:	e398                	sd	a4,0(a5)
 80c:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 80e:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 812:	87ba                	mv	a5,a4
 814:	b7f1                	j	7e0 <malloc+0x3c>
      if(p->s.size == nunits)
 816:	02e90b63          	beq	s2,a4,84c <malloc+0xa8>
        p->s.size -= nunits;
 81a:	4137073b          	subw	a4,a4,s3
 81e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 820:	1702                	slli	a4,a4,0x20
 822:	9301                	srli	a4,a4,0x20
 824:	0712                	slli	a4,a4,0x4
 826:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 828:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 82c:	00000717          	auipc	a4,0x0
 830:	0ca73a23          	sd	a0,212(a4) # 900 <__bss_start>
      return (void*)(p + 1);
 834:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 838:	70e2                	ld	ra,56(sp)
 83a:	7442                	ld	s0,48(sp)
 83c:	74a2                	ld	s1,40(sp)
 83e:	7902                	ld	s2,32(sp)
 840:	69e2                	ld	s3,24(sp)
 842:	6a42                	ld	s4,16(sp)
 844:	6aa2                	ld	s5,8(sp)
 846:	6b02                	ld	s6,0(sp)
 848:	6121                	addi	sp,sp,64
 84a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 84c:	6398                	ld	a4,0(a5)
 84e:	e118                	sd	a4,0(a0)
 850:	bff1                	j	82c <malloc+0x88>
  hp->s.size = nu;
 852:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 856:	0541                	addi	a0,a0,16
 858:	00000097          	auipc	ra,0x0
 85c:	ec2080e7          	jalr	-318(ra) # 71a <free>
  return freep;
 860:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 862:	d979                	beqz	a0,838 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 864:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 866:	4798                	lw	a4,8(a5)
 868:	fb2777e3          	bleu	s2,a4,816 <malloc+0x72>
    if(p == freep)
 86c:	6098                	ld	a4,0(s1)
 86e:	853e                	mv	a0,a5
 870:	fef71ae3          	bne	a4,a5,864 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 874:	8552                	mv	a0,s4
 876:	00000097          	auipc	ra,0x0
 87a:	b38080e7          	jalr	-1224(ra) # 3ae <sbrk>
  if(p == (char*)-1)
 87e:	fd651ae3          	bne	a0,s6,852 <malloc+0xae>
        return 0;
 882:	4501                	li	a0,0
 884:	bf55                	j	838 <malloc+0x94>
