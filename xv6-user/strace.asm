
xv6-user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	712d                	addi	sp,sp,-288
   2:	ee06                	sd	ra,280(sp)
   4:	ea22                	sd	s0,272(sp)
   6:	e626                	sd	s1,264(sp)
   8:	e24a                	sd	s2,256(sp)
   a:	1200                	addi	s0,sp,288
   c:	892e                	mv	s2,a1
  int i;
  char *nargv[MAXARG];

  if(argc < 3 /*|| (argv[1][0] < '0' || argv[1][0] > '9')*/){
   e:	4789                	li	a5,2
  10:	02a7c163          	blt	a5,a0,32 <main+0x32>
    fprintf(2, "usage: %s MASK COMMAND\n", argv[0]);
  14:	6190                	ld	a2,0(a1)
  16:	00001597          	auipc	a1,0x1
  1a:	8d258593          	addi	a1,a1,-1838 # 8e8 <malloc+0xe8>
  1e:	4509                	li	a0,2
  20:	00000097          	auipc	ra,0x0
  24:	6f2080e7          	jalr	1778(ra) # 712 <fprintf>
    exit(1);
  28:	4505                	li	a0,1
  2a:	00000097          	auipc	ra,0x0
  2e:	370080e7          	jalr	880(ra) # 39a <exit>
  32:	84aa                	mv	s1,a0
  }

  if (trace(atoi(argv[1])) < 0) {
  34:	6588                	ld	a0,8(a1)
  36:	00000097          	auipc	ra,0x0
  3a:	242080e7          	jalr	578(ra) # 278 <atoi>
  3e:	00000097          	auipc	ra,0x0
  42:	40c080e7          	jalr	1036(ra) # 44a <trace>
  46:	04054d63          	bltz	a0,a0 <main+0xa0>
  4a:	01090793          	addi	a5,s2,16
  4e:	ee040713          	addi	a4,s0,-288
  52:	ffd4869b          	addiw	a3,s1,-3
  56:	1682                	slli	a3,a3,0x20
  58:	9281                	srli	a3,a3,0x20
  5a:	068e                	slli	a3,a3,0x3
  5c:	96be                	add	a3,a3,a5
  5e:	10090593          	addi	a1,s2,256
    fprintf(2, "%s: strace failed\n", argv[0]);
    exit(1);
  }
  
  for(i = 2; i < argc && i < MAXARG; i++){
    nargv[i-2] = argv[i];
  62:	6390                	ld	a2,0(a5)
  64:	e310                	sd	a2,0(a4)
  for(i = 2; i < argc && i < MAXARG; i++){
  66:	00d78663          	beq	a5,a3,72 <main+0x72>
  6a:	07a1                	addi	a5,a5,8
  6c:	0721                	addi	a4,a4,8
  6e:	feb79ae3          	bne	a5,a1,62 <main+0x62>
  }
  exec(nargv[0], nargv);  
  72:	ee040593          	addi	a1,s0,-288
  76:	ee043503          	ld	a0,-288(s0)
  7a:	00000097          	auipc	ra,0x0
  7e:	358080e7          	jalr	856(ra) # 3d2 <exec>
  printf("strace: exec %s fail\n", nargv[0]);
  82:	ee043583          	ld	a1,-288(s0)
  86:	00001517          	auipc	a0,0x1
  8a:	89250513          	addi	a0,a0,-1902 # 918 <malloc+0x118>
  8e:	00000097          	auipc	ra,0x0
  92:	6b2080e7          	jalr	1714(ra) # 740 <printf>
  exit(0);
  96:	4501                	li	a0,0
  98:	00000097          	auipc	ra,0x0
  9c:	302080e7          	jalr	770(ra) # 39a <exit>
    fprintf(2, "%s: strace failed\n", argv[0]);
  a0:	00093603          	ld	a2,0(s2)
  a4:	00001597          	auipc	a1,0x1
  a8:	85c58593          	addi	a1,a1,-1956 # 900 <malloc+0x100>
  ac:	4509                	li	a0,2
  ae:	00000097          	auipc	ra,0x0
  b2:	664080e7          	jalr	1636(ra) # 712 <fprintf>
    exit(1);
  b6:	4505                	li	a0,1
  b8:	00000097          	auipc	ra,0x0
  bc:	2e2080e7          	jalr	738(ra) # 39a <exit>

00000000000000c0 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  c0:	1141                	addi	sp,sp,-16
  c2:	e422                	sd	s0,8(sp)
  c4:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c6:	87aa                	mv	a5,a0
  c8:	0585                	addi	a1,a1,1
  ca:	0785                	addi	a5,a5,1
  cc:	fff5c703          	lbu	a4,-1(a1)
  d0:	fee78fa3          	sb	a4,-1(a5)
  d4:	fb75                	bnez	a4,c8 <strcpy+0x8>
    ;
  return os;
}
  d6:	6422                	ld	s0,8(sp)
  d8:	0141                	addi	sp,sp,16
  da:	8082                	ret

00000000000000dc <strcat>:

char*
strcat(char *s, const char *t)
{
  dc:	1141                	addi	sp,sp,-16
  de:	e422                	sd	s0,8(sp)
  e0:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  e2:	00054783          	lbu	a5,0(a0)
  e6:	c385                	beqz	a5,106 <strcat+0x2a>
  e8:	87aa                	mv	a5,a0
    s++;
  ea:	0785                	addi	a5,a5,1
  while(*s)
  ec:	0007c703          	lbu	a4,0(a5)
  f0:	ff6d                	bnez	a4,ea <strcat+0xe>
  while((*s++ = *t++))
  f2:	0585                	addi	a1,a1,1
  f4:	0785                	addi	a5,a5,1
  f6:	fff5c703          	lbu	a4,-1(a1)
  fa:	fee78fa3          	sb	a4,-1(a5)
  fe:	fb75                	bnez	a4,f2 <strcat+0x16>
    ;
  return os;
}
 100:	6422                	ld	s0,8(sp)
 102:	0141                	addi	sp,sp,16
 104:	8082                	ret
  while(*s)
 106:	87aa                	mv	a5,a0
 108:	b7ed                	j	f2 <strcat+0x16>

000000000000010a <strcmp>:


int
strcmp(const char *p, const char *q)
{
 10a:	1141                	addi	sp,sp,-16
 10c:	e422                	sd	s0,8(sp)
 10e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 110:	00054783          	lbu	a5,0(a0)
 114:	cf91                	beqz	a5,130 <strcmp+0x26>
 116:	0005c703          	lbu	a4,0(a1)
 11a:	00f71b63          	bne	a4,a5,130 <strcmp+0x26>
    p++, q++;
 11e:	0505                	addi	a0,a0,1
 120:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 122:	00054783          	lbu	a5,0(a0)
 126:	c789                	beqz	a5,130 <strcmp+0x26>
 128:	0005c703          	lbu	a4,0(a1)
 12c:	fef709e3          	beq	a4,a5,11e <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 130:	0005c503          	lbu	a0,0(a1)
}
 134:	40a7853b          	subw	a0,a5,a0
 138:	6422                	ld	s0,8(sp)
 13a:	0141                	addi	sp,sp,16
 13c:	8082                	ret

000000000000013e <strlen>:

uint
strlen(const char *s)
{
 13e:	1141                	addi	sp,sp,-16
 140:	e422                	sd	s0,8(sp)
 142:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 144:	00054783          	lbu	a5,0(a0)
 148:	cf91                	beqz	a5,164 <strlen+0x26>
 14a:	0505                	addi	a0,a0,1
 14c:	87aa                	mv	a5,a0
 14e:	4685                	li	a3,1
 150:	9e89                	subw	a3,a3,a0
 152:	00f6853b          	addw	a0,a3,a5
 156:	0785                	addi	a5,a5,1
 158:	fff7c703          	lbu	a4,-1(a5)
 15c:	fb7d                	bnez	a4,152 <strlen+0x14>
    ;
  return n;
}
 15e:	6422                	ld	s0,8(sp)
 160:	0141                	addi	sp,sp,16
 162:	8082                	ret
  for(n = 0; s[n]; n++)
 164:	4501                	li	a0,0
 166:	bfe5                	j	15e <strlen+0x20>

0000000000000168 <memset>:

void*
memset(void *dst, int c, uint n)
{
 168:	1141                	addi	sp,sp,-16
 16a:	e422                	sd	s0,8(sp)
 16c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 16e:	ce09                	beqz	a2,188 <memset+0x20>
 170:	87aa                	mv	a5,a0
 172:	fff6071b          	addiw	a4,a2,-1
 176:	1702                	slli	a4,a4,0x20
 178:	9301                	srli	a4,a4,0x20
 17a:	0705                	addi	a4,a4,1
 17c:	972a                	add	a4,a4,a0
    cdst[i] = c;
 17e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 182:	0785                	addi	a5,a5,1
 184:	fee79de3          	bne	a5,a4,17e <memset+0x16>
  }
  return dst;
}
 188:	6422                	ld	s0,8(sp)
 18a:	0141                	addi	sp,sp,16
 18c:	8082                	ret

000000000000018e <strchr>:

char*
strchr(const char *s, char c)
{
 18e:	1141                	addi	sp,sp,-16
 190:	e422                	sd	s0,8(sp)
 192:	0800                	addi	s0,sp,16
  for(; *s; s++)
 194:	00054783          	lbu	a5,0(a0)
 198:	cf91                	beqz	a5,1b4 <strchr+0x26>
    if(*s == c)
 19a:	00f58a63          	beq	a1,a5,1ae <strchr+0x20>
  for(; *s; s++)
 19e:	0505                	addi	a0,a0,1
 1a0:	00054783          	lbu	a5,0(a0)
 1a4:	c781                	beqz	a5,1ac <strchr+0x1e>
    if(*s == c)
 1a6:	feb79ce3          	bne	a5,a1,19e <strchr+0x10>
 1aa:	a011                	j	1ae <strchr+0x20>
      return (char*)s;
  return 0;
 1ac:	4501                	li	a0,0
}
 1ae:	6422                	ld	s0,8(sp)
 1b0:	0141                	addi	sp,sp,16
 1b2:	8082                	ret
  return 0;
 1b4:	4501                	li	a0,0
 1b6:	bfe5                	j	1ae <strchr+0x20>

00000000000001b8 <gets>:

char*
gets(char *buf, int max)
{
 1b8:	711d                	addi	sp,sp,-96
 1ba:	ec86                	sd	ra,88(sp)
 1bc:	e8a2                	sd	s0,80(sp)
 1be:	e4a6                	sd	s1,72(sp)
 1c0:	e0ca                	sd	s2,64(sp)
 1c2:	fc4e                	sd	s3,56(sp)
 1c4:	f852                	sd	s4,48(sp)
 1c6:	f456                	sd	s5,40(sp)
 1c8:	f05a                	sd	s6,32(sp)
 1ca:	ec5e                	sd	s7,24(sp)
 1cc:	e862                	sd	s8,16(sp)
 1ce:	1080                	addi	s0,sp,96
 1d0:	8c2a                	mv	s8,a0
 1d2:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d4:	892a                	mv	s2,a0
 1d6:	4981                	li	s3,0
    cc = read(0, &c, 1);
 1d8:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1dc:	4b29                	li	s6,10
 1de:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 1e0:	0019849b          	addiw	s1,s3,1
 1e4:	0344d763          	ble	s4,s1,212 <gets+0x5a>
    cc = read(0, &c, 1);
 1e8:	4605                	li	a2,1
 1ea:	85d6                	mv	a1,s5
 1ec:	4501                	li	a0,0
 1ee:	00000097          	auipc	ra,0x0
 1f2:	1c4080e7          	jalr	452(ra) # 3b2 <read>
    if(cc < 1)
 1f6:	00a05e63          	blez	a0,212 <gets+0x5a>
    buf[i++] = c;
 1fa:	faf44783          	lbu	a5,-81(s0)
 1fe:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 202:	01678763          	beq	a5,s6,210 <gets+0x58>
 206:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 208:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 20a:	fd779be3          	bne	a5,s7,1e0 <gets+0x28>
 20e:	a011                	j	212 <gets+0x5a>
  for(i=0; i+1 < max; ){
 210:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 212:	99e2                	add	s3,s3,s8
 214:	00098023          	sb	zero,0(s3)
  return buf;
}
 218:	8562                	mv	a0,s8
 21a:	60e6                	ld	ra,88(sp)
 21c:	6446                	ld	s0,80(sp)
 21e:	64a6                	ld	s1,72(sp)
 220:	6906                	ld	s2,64(sp)
 222:	79e2                	ld	s3,56(sp)
 224:	7a42                	ld	s4,48(sp)
 226:	7aa2                	ld	s5,40(sp)
 228:	7b02                	ld	s6,32(sp)
 22a:	6be2                	ld	s7,24(sp)
 22c:	6c42                	ld	s8,16(sp)
 22e:	6125                	addi	sp,sp,96
 230:	8082                	ret

0000000000000232 <stat>:

int
stat(const char *n, struct stat *st)
{
 232:	1101                	addi	sp,sp,-32
 234:	ec06                	sd	ra,24(sp)
 236:	e822                	sd	s0,16(sp)
 238:	e426                	sd	s1,8(sp)
 23a:	e04a                	sd	s2,0(sp)
 23c:	1000                	addi	s0,sp,32
 23e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 240:	4581                	li	a1,0
 242:	00000097          	auipc	ra,0x0
 246:	198080e7          	jalr	408(ra) # 3da <open>
  if(fd < 0)
 24a:	02054563          	bltz	a0,274 <stat+0x42>
 24e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 250:	85ca                	mv	a1,s2
 252:	00000097          	auipc	ra,0x0
 256:	190080e7          	jalr	400(ra) # 3e2 <fstat>
 25a:	892a                	mv	s2,a0
  close(fd);
 25c:	8526                	mv	a0,s1
 25e:	00000097          	auipc	ra,0x0
 262:	164080e7          	jalr	356(ra) # 3c2 <close>
  return r;
}
 266:	854a                	mv	a0,s2
 268:	60e2                	ld	ra,24(sp)
 26a:	6442                	ld	s0,16(sp)
 26c:	64a2                	ld	s1,8(sp)
 26e:	6902                	ld	s2,0(sp)
 270:	6105                	addi	sp,sp,32
 272:	8082                	ret
    return -1;
 274:	597d                	li	s2,-1
 276:	bfc5                	j	266 <stat+0x34>

0000000000000278 <atoi>:

int
atoi(const char *s)
{
 278:	1141                	addi	sp,sp,-16
 27a:	e422                	sd	s0,8(sp)
 27c:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 27e:	00054703          	lbu	a4,0(a0)
 282:	02d00793          	li	a5,45
  int neg = 1;
 286:	4805                	li	a6,1
  if (*s == '-') {
 288:	04f70363          	beq	a4,a5,2ce <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 28c:	00054683          	lbu	a3,0(a0)
 290:	fd06879b          	addiw	a5,a3,-48
 294:	0ff7f793          	andi	a5,a5,255
 298:	4725                	li	a4,9
 29a:	02f76d63          	bltu	a4,a5,2d4 <atoi+0x5c>
  n = 0;
 29e:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 2a0:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2a2:	0505                	addi	a0,a0,1
 2a4:	0026179b          	slliw	a5,a2,0x2
 2a8:	9fb1                	addw	a5,a5,a2
 2aa:	0017979b          	slliw	a5,a5,0x1
 2ae:	9fb5                	addw	a5,a5,a3
 2b0:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 2b4:	00054683          	lbu	a3,0(a0)
 2b8:	fd06871b          	addiw	a4,a3,-48
 2bc:	0ff77713          	andi	a4,a4,255
 2c0:	fee5f1e3          	bleu	a4,a1,2a2 <atoi+0x2a>
  return n * neg;
}
 2c4:	02c8053b          	mulw	a0,a6,a2
 2c8:	6422                	ld	s0,8(sp)
 2ca:	0141                	addi	sp,sp,16
 2cc:	8082                	ret
    s++;
 2ce:	0505                	addi	a0,a0,1
    neg = -1;
 2d0:	587d                	li	a6,-1
 2d2:	bf6d                	j	28c <atoi+0x14>
  n = 0;
 2d4:	4601                	li	a2,0
 2d6:	b7fd                	j	2c4 <atoi+0x4c>

00000000000002d8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d8:	1141                	addi	sp,sp,-16
 2da:	e422                	sd	s0,8(sp)
 2dc:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2de:	02b57663          	bleu	a1,a0,30a <memmove+0x32>
    while(n-- > 0)
 2e2:	02c05163          	blez	a2,304 <memmove+0x2c>
 2e6:	fff6079b          	addiw	a5,a2,-1
 2ea:	1782                	slli	a5,a5,0x20
 2ec:	9381                	srli	a5,a5,0x20
 2ee:	0785                	addi	a5,a5,1
 2f0:	97aa                	add	a5,a5,a0
  dst = vdst;
 2f2:	872a                	mv	a4,a0
      *dst++ = *src++;
 2f4:	0585                	addi	a1,a1,1
 2f6:	0705                	addi	a4,a4,1
 2f8:	fff5c683          	lbu	a3,-1(a1)
 2fc:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 300:	fee79ae3          	bne	a5,a4,2f4 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 304:	6422                	ld	s0,8(sp)
 306:	0141                	addi	sp,sp,16
 308:	8082                	ret
    dst += n;
 30a:	00c50733          	add	a4,a0,a2
    src += n;
 30e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 310:	fec05ae3          	blez	a2,304 <memmove+0x2c>
 314:	fff6079b          	addiw	a5,a2,-1
 318:	1782                	slli	a5,a5,0x20
 31a:	9381                	srli	a5,a5,0x20
 31c:	fff7c793          	not	a5,a5
 320:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 322:	15fd                	addi	a1,a1,-1
 324:	177d                	addi	a4,a4,-1
 326:	0005c683          	lbu	a3,0(a1)
 32a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 32e:	fef71ae3          	bne	a4,a5,322 <memmove+0x4a>
 332:	bfc9                	j	304 <memmove+0x2c>

0000000000000334 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 334:	1141                	addi	sp,sp,-16
 336:	e422                	sd	s0,8(sp)
 338:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 33a:	ce15                	beqz	a2,376 <memcmp+0x42>
 33c:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 340:	00054783          	lbu	a5,0(a0)
 344:	0005c703          	lbu	a4,0(a1)
 348:	02e79063          	bne	a5,a4,368 <memcmp+0x34>
 34c:	1682                	slli	a3,a3,0x20
 34e:	9281                	srli	a3,a3,0x20
 350:	0685                	addi	a3,a3,1
 352:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 354:	0505                	addi	a0,a0,1
    p2++;
 356:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 358:	00d50d63          	beq	a0,a3,372 <memcmp+0x3e>
    if (*p1 != *p2) {
 35c:	00054783          	lbu	a5,0(a0)
 360:	0005c703          	lbu	a4,0(a1)
 364:	fee788e3          	beq	a5,a4,354 <memcmp+0x20>
      return *p1 - *p2;
 368:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 36c:	6422                	ld	s0,8(sp)
 36e:	0141                	addi	sp,sp,16
 370:	8082                	ret
  return 0;
 372:	4501                	li	a0,0
 374:	bfe5                	j	36c <memcmp+0x38>
 376:	4501                	li	a0,0
 378:	bfd5                	j	36c <memcmp+0x38>

000000000000037a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 37a:	1141                	addi	sp,sp,-16
 37c:	e406                	sd	ra,8(sp)
 37e:	e022                	sd	s0,0(sp)
 380:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 382:	00000097          	auipc	ra,0x0
 386:	f56080e7          	jalr	-170(ra) # 2d8 <memmove>
}
 38a:	60a2                	ld	ra,8(sp)
 38c:	6402                	ld	s0,0(sp)
 38e:	0141                	addi	sp,sp,16
 390:	8082                	ret

0000000000000392 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 392:	4885                	li	a7,1
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <exit>:
.global exit
exit:
 li a7, SYS_exit
 39a:	4889                	li	a7,2
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3a2:	488d                	li	a7,3
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3aa:	4891                	li	a7,4
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <read>:
.global read
read:
 li a7, SYS_read
 3b2:	4895                	li	a7,5
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <write>:
.global write
write:
 li a7, SYS_write
 3ba:	48c1                	li	a7,16
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <close>:
.global close
close:
 li a7, SYS_close
 3c2:	48d5                	li	a7,21
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <kill>:
.global kill
kill:
 li a7, SYS_kill
 3ca:	4899                	li	a7,6
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3d2:	489d                	li	a7,7
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <open>:
.global open
open:
 li a7, SYS_open
 3da:	48bd                	li	a7,15
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3e2:	48a1                	li	a7,8
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3ea:	48d1                	li	a7,20
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3f2:	48a5                	li	a7,9
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <dup>:
.global dup
dup:
 li a7, SYS_dup
 3fa:	48a9                	li	a7,10
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 402:	48ad                	li	a7,11
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 40a:	48b1                	li	a7,12
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 412:	48b5                	li	a7,13
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 41a:	48b9                	li	a7,14
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 422:	48d9                	li	a7,22
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <dev>:
.global dev
dev:
 li a7, SYS_dev
 42a:	48dd                	li	a7,23
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 432:	48e1                	li	a7,24
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 43a:	48e5                	li	a7,25
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <remove>:
.global remove
remove:
 li a7, SYS_remove
 442:	48c5                	li	a7,17
 ecall
 444:	00000073          	ecall
 ret
 448:	8082                	ret

000000000000044a <trace>:
.global trace
trace:
 li a7, SYS_trace
 44a:	48c9                	li	a7,18
 ecall
 44c:	00000073          	ecall
 ret
 450:	8082                	ret

0000000000000452 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 452:	48cd                	li	a7,19
 ecall
 454:	00000073          	ecall
 ret
 458:	8082                	ret

000000000000045a <rename>:
.global rename
rename:
 li a7, SYS_rename
 45a:	48e9                	li	a7,26
 ecall
 45c:	00000073          	ecall
 ret
 460:	8082                	ret

0000000000000462 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 462:	48ed                	li	a7,27
 ecall
 464:	00000073          	ecall
 ret
 468:	8082                	ret

000000000000046a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 46a:	1101                	addi	sp,sp,-32
 46c:	ec06                	sd	ra,24(sp)
 46e:	e822                	sd	s0,16(sp)
 470:	1000                	addi	s0,sp,32
 472:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 476:	4605                	li	a2,1
 478:	fef40593          	addi	a1,s0,-17
 47c:	00000097          	auipc	ra,0x0
 480:	f3e080e7          	jalr	-194(ra) # 3ba <write>
}
 484:	60e2                	ld	ra,24(sp)
 486:	6442                	ld	s0,16(sp)
 488:	6105                	addi	sp,sp,32
 48a:	8082                	ret

000000000000048c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 48c:	7139                	addi	sp,sp,-64
 48e:	fc06                	sd	ra,56(sp)
 490:	f822                	sd	s0,48(sp)
 492:	f426                	sd	s1,40(sp)
 494:	f04a                	sd	s2,32(sp)
 496:	ec4e                	sd	s3,24(sp)
 498:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 49a:	c299                	beqz	a3,4a0 <printint+0x14>
 49c:	0005ce63          	bltz	a1,4b8 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4a0:	2581                	sext.w	a1,a1
  neg = 0;
 4a2:	4301                	li	t1,0
  }

  i = 0;
 4a4:	fc040913          	addi	s2,s0,-64
  neg = 0;
 4a8:	874a                	mv	a4,s2
  i = 0;
 4aa:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 4ac:	2601                	sext.w	a2,a2
 4ae:	00000897          	auipc	a7,0x0
 4b2:	48288893          	addi	a7,a7,1154 # 930 <digits>
 4b6:	a801                	j	4c6 <printint+0x3a>
    x = -xx;
 4b8:	40b005bb          	negw	a1,a1
 4bc:	2581                	sext.w	a1,a1
    neg = 1;
 4be:	4305                	li	t1,1
    x = -xx;
 4c0:	b7d5                	j	4a4 <printint+0x18>
  }while((x /= base) != 0);
 4c2:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 4c4:	8836                	mv	a6,a3
 4c6:	0018069b          	addiw	a3,a6,1
 4ca:	02c5f7bb          	remuw	a5,a1,a2
 4ce:	1782                	slli	a5,a5,0x20
 4d0:	9381                	srli	a5,a5,0x20
 4d2:	97c6                	add	a5,a5,a7
 4d4:	0007c783          	lbu	a5,0(a5)
 4d8:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 4dc:	0705                	addi	a4,a4,1
 4de:	02c5d7bb          	divuw	a5,a1,a2
 4e2:	fec5f0e3          	bleu	a2,a1,4c2 <printint+0x36>
  if(neg)
 4e6:	00030b63          	beqz	t1,4fc <printint+0x70>
    buf[i++] = '-';
 4ea:	fd040793          	addi	a5,s0,-48
 4ee:	96be                	add	a3,a3,a5
 4f0:	02d00793          	li	a5,45
 4f4:	fef68823          	sb	a5,-16(a3)
 4f8:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 4fc:	02d05763          	blez	a3,52a <printint+0x9e>
 500:	89aa                	mv	s3,a0
 502:	fc040493          	addi	s1,s0,-64
 506:	94b6                	add	s1,s1,a3
 508:	197d                	addi	s2,s2,-1
 50a:	9936                	add	s2,s2,a3
 50c:	36fd                	addiw	a3,a3,-1
 50e:	1682                	slli	a3,a3,0x20
 510:	9281                	srli	a3,a3,0x20
 512:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 516:	fff4c583          	lbu	a1,-1(s1)
 51a:	854e                	mv	a0,s3
 51c:	00000097          	auipc	ra,0x0
 520:	f4e080e7          	jalr	-178(ra) # 46a <putc>
  while(--i >= 0)
 524:	14fd                	addi	s1,s1,-1
 526:	ff2498e3          	bne	s1,s2,516 <printint+0x8a>
}
 52a:	70e2                	ld	ra,56(sp)
 52c:	7442                	ld	s0,48(sp)
 52e:	74a2                	ld	s1,40(sp)
 530:	7902                	ld	s2,32(sp)
 532:	69e2                	ld	s3,24(sp)
 534:	6121                	addi	sp,sp,64
 536:	8082                	ret

0000000000000538 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 538:	7119                	addi	sp,sp,-128
 53a:	fc86                	sd	ra,120(sp)
 53c:	f8a2                	sd	s0,112(sp)
 53e:	f4a6                	sd	s1,104(sp)
 540:	f0ca                	sd	s2,96(sp)
 542:	ecce                	sd	s3,88(sp)
 544:	e8d2                	sd	s4,80(sp)
 546:	e4d6                	sd	s5,72(sp)
 548:	e0da                	sd	s6,64(sp)
 54a:	fc5e                	sd	s7,56(sp)
 54c:	f862                	sd	s8,48(sp)
 54e:	f466                	sd	s9,40(sp)
 550:	f06a                	sd	s10,32(sp)
 552:	ec6e                	sd	s11,24(sp)
 554:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 556:	0005c483          	lbu	s1,0(a1)
 55a:	18048d63          	beqz	s1,6f4 <vprintf+0x1bc>
 55e:	8aaa                	mv	s5,a0
 560:	8b32                	mv	s6,a2
 562:	00158913          	addi	s2,a1,1
  state = 0;
 566:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 568:	02500a13          	li	s4,37
      if(c == 'd'){
 56c:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 570:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 574:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 578:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 57c:	00000b97          	auipc	s7,0x0
 580:	3b4b8b93          	addi	s7,s7,948 # 930 <digits>
 584:	a839                	j	5a2 <vprintf+0x6a>
        putc(fd, c);
 586:	85a6                	mv	a1,s1
 588:	8556                	mv	a0,s5
 58a:	00000097          	auipc	ra,0x0
 58e:	ee0080e7          	jalr	-288(ra) # 46a <putc>
 592:	a019                	j	598 <vprintf+0x60>
    } else if(state == '%'){
 594:	01498f63          	beq	s3,s4,5b2 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 598:	0905                	addi	s2,s2,1
 59a:	fff94483          	lbu	s1,-1(s2)
 59e:	14048b63          	beqz	s1,6f4 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 5a2:	0004879b          	sext.w	a5,s1
    if(state == 0){
 5a6:	fe0997e3          	bnez	s3,594 <vprintf+0x5c>
      if(c == '%'){
 5aa:	fd479ee3          	bne	a5,s4,586 <vprintf+0x4e>
        state = '%';
 5ae:	89be                	mv	s3,a5
 5b0:	b7e5                	j	598 <vprintf+0x60>
      if(c == 'd'){
 5b2:	05878063          	beq	a5,s8,5f2 <vprintf+0xba>
      } else if(c == 'l') {
 5b6:	05978c63          	beq	a5,s9,60e <vprintf+0xd6>
      } else if(c == 'x') {
 5ba:	07a78863          	beq	a5,s10,62a <vprintf+0xf2>
      } else if(c == 'p') {
 5be:	09b78463          	beq	a5,s11,646 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 5c2:	07300713          	li	a4,115
 5c6:	0ce78563          	beq	a5,a4,690 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ca:	06300713          	li	a4,99
 5ce:	0ee78c63          	beq	a5,a4,6c6 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 5d2:	11478663          	beq	a5,s4,6de <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d6:	85d2                	mv	a1,s4
 5d8:	8556                	mv	a0,s5
 5da:	00000097          	auipc	ra,0x0
 5de:	e90080e7          	jalr	-368(ra) # 46a <putc>
        putc(fd, c);
 5e2:	85a6                	mv	a1,s1
 5e4:	8556                	mv	a0,s5
 5e6:	00000097          	auipc	ra,0x0
 5ea:	e84080e7          	jalr	-380(ra) # 46a <putc>
      }
      state = 0;
 5ee:	4981                	li	s3,0
 5f0:	b765                	j	598 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5f2:	008b0493          	addi	s1,s6,8
 5f6:	4685                	li	a3,1
 5f8:	4629                	li	a2,10
 5fa:	000b2583          	lw	a1,0(s6)
 5fe:	8556                	mv	a0,s5
 600:	00000097          	auipc	ra,0x0
 604:	e8c080e7          	jalr	-372(ra) # 48c <printint>
 608:	8b26                	mv	s6,s1
      state = 0;
 60a:	4981                	li	s3,0
 60c:	b771                	j	598 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 60e:	008b0493          	addi	s1,s6,8
 612:	4681                	li	a3,0
 614:	4629                	li	a2,10
 616:	000b2583          	lw	a1,0(s6)
 61a:	8556                	mv	a0,s5
 61c:	00000097          	auipc	ra,0x0
 620:	e70080e7          	jalr	-400(ra) # 48c <printint>
 624:	8b26                	mv	s6,s1
      state = 0;
 626:	4981                	li	s3,0
 628:	bf85                	j	598 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 62a:	008b0493          	addi	s1,s6,8
 62e:	4681                	li	a3,0
 630:	4641                	li	a2,16
 632:	000b2583          	lw	a1,0(s6)
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	e54080e7          	jalr	-428(ra) # 48c <printint>
 640:	8b26                	mv	s6,s1
      state = 0;
 642:	4981                	li	s3,0
 644:	bf91                	j	598 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 646:	008b0793          	addi	a5,s6,8
 64a:	f8f43423          	sd	a5,-120(s0)
 64e:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 652:	03000593          	li	a1,48
 656:	8556                	mv	a0,s5
 658:	00000097          	auipc	ra,0x0
 65c:	e12080e7          	jalr	-494(ra) # 46a <putc>
  putc(fd, 'x');
 660:	85ea                	mv	a1,s10
 662:	8556                	mv	a0,s5
 664:	00000097          	auipc	ra,0x0
 668:	e06080e7          	jalr	-506(ra) # 46a <putc>
 66c:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 66e:	03c9d793          	srli	a5,s3,0x3c
 672:	97de                	add	a5,a5,s7
 674:	0007c583          	lbu	a1,0(a5)
 678:	8556                	mv	a0,s5
 67a:	00000097          	auipc	ra,0x0
 67e:	df0080e7          	jalr	-528(ra) # 46a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 682:	0992                	slli	s3,s3,0x4
 684:	34fd                	addiw	s1,s1,-1
 686:	f4e5                	bnez	s1,66e <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 688:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 68c:	4981                	li	s3,0
 68e:	b729                	j	598 <vprintf+0x60>
        s = va_arg(ap, char*);
 690:	008b0993          	addi	s3,s6,8
 694:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 698:	c085                	beqz	s1,6b8 <vprintf+0x180>
        while(*s != 0){
 69a:	0004c583          	lbu	a1,0(s1)
 69e:	c9a1                	beqz	a1,6ee <vprintf+0x1b6>
          putc(fd, *s);
 6a0:	8556                	mv	a0,s5
 6a2:	00000097          	auipc	ra,0x0
 6a6:	dc8080e7          	jalr	-568(ra) # 46a <putc>
          s++;
 6aa:	0485                	addi	s1,s1,1
        while(*s != 0){
 6ac:	0004c583          	lbu	a1,0(s1)
 6b0:	f9e5                	bnez	a1,6a0 <vprintf+0x168>
        s = va_arg(ap, char*);
 6b2:	8b4e                	mv	s6,s3
      state = 0;
 6b4:	4981                	li	s3,0
 6b6:	b5cd                	j	598 <vprintf+0x60>
          s = "(null)";
 6b8:	00000497          	auipc	s1,0x0
 6bc:	29048493          	addi	s1,s1,656 # 948 <digits+0x18>
        while(*s != 0){
 6c0:	02800593          	li	a1,40
 6c4:	bff1                	j	6a0 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 6c6:	008b0493          	addi	s1,s6,8
 6ca:	000b4583          	lbu	a1,0(s6)
 6ce:	8556                	mv	a0,s5
 6d0:	00000097          	auipc	ra,0x0
 6d4:	d9a080e7          	jalr	-614(ra) # 46a <putc>
 6d8:	8b26                	mv	s6,s1
      state = 0;
 6da:	4981                	li	s3,0
 6dc:	bd75                	j	598 <vprintf+0x60>
        putc(fd, c);
 6de:	85d2                	mv	a1,s4
 6e0:	8556                	mv	a0,s5
 6e2:	00000097          	auipc	ra,0x0
 6e6:	d88080e7          	jalr	-632(ra) # 46a <putc>
      state = 0;
 6ea:	4981                	li	s3,0
 6ec:	b575                	j	598 <vprintf+0x60>
        s = va_arg(ap, char*);
 6ee:	8b4e                	mv	s6,s3
      state = 0;
 6f0:	4981                	li	s3,0
 6f2:	b55d                	j	598 <vprintf+0x60>
    }
  }
}
 6f4:	70e6                	ld	ra,120(sp)
 6f6:	7446                	ld	s0,112(sp)
 6f8:	74a6                	ld	s1,104(sp)
 6fa:	7906                	ld	s2,96(sp)
 6fc:	69e6                	ld	s3,88(sp)
 6fe:	6a46                	ld	s4,80(sp)
 700:	6aa6                	ld	s5,72(sp)
 702:	6b06                	ld	s6,64(sp)
 704:	7be2                	ld	s7,56(sp)
 706:	7c42                	ld	s8,48(sp)
 708:	7ca2                	ld	s9,40(sp)
 70a:	7d02                	ld	s10,32(sp)
 70c:	6de2                	ld	s11,24(sp)
 70e:	6109                	addi	sp,sp,128
 710:	8082                	ret

0000000000000712 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 712:	715d                	addi	sp,sp,-80
 714:	ec06                	sd	ra,24(sp)
 716:	e822                	sd	s0,16(sp)
 718:	1000                	addi	s0,sp,32
 71a:	e010                	sd	a2,0(s0)
 71c:	e414                	sd	a3,8(s0)
 71e:	e818                	sd	a4,16(s0)
 720:	ec1c                	sd	a5,24(s0)
 722:	03043023          	sd	a6,32(s0)
 726:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 72a:	8622                	mv	a2,s0
 72c:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 730:	00000097          	auipc	ra,0x0
 734:	e08080e7          	jalr	-504(ra) # 538 <vprintf>
}
 738:	60e2                	ld	ra,24(sp)
 73a:	6442                	ld	s0,16(sp)
 73c:	6161                	addi	sp,sp,80
 73e:	8082                	ret

0000000000000740 <printf>:

void
printf(const char *fmt, ...)
{
 740:	711d                	addi	sp,sp,-96
 742:	ec06                	sd	ra,24(sp)
 744:	e822                	sd	s0,16(sp)
 746:	1000                	addi	s0,sp,32
 748:	e40c                	sd	a1,8(s0)
 74a:	e810                	sd	a2,16(s0)
 74c:	ec14                	sd	a3,24(s0)
 74e:	f018                	sd	a4,32(s0)
 750:	f41c                	sd	a5,40(s0)
 752:	03043823          	sd	a6,48(s0)
 756:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 75a:	00840613          	addi	a2,s0,8
 75e:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 762:	85aa                	mv	a1,a0
 764:	4505                	li	a0,1
 766:	00000097          	auipc	ra,0x0
 76a:	dd2080e7          	jalr	-558(ra) # 538 <vprintf>
}
 76e:	60e2                	ld	ra,24(sp)
 770:	6442                	ld	s0,16(sp)
 772:	6125                	addi	sp,sp,96
 774:	8082                	ret

0000000000000776 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 776:	1141                	addi	sp,sp,-16
 778:	e422                	sd	s0,8(sp)
 77a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 77c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 780:	00000797          	auipc	a5,0x0
 784:	1d078793          	addi	a5,a5,464 # 950 <__bss_start>
 788:	639c                	ld	a5,0(a5)
 78a:	a805                	j	7ba <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 78c:	4618                	lw	a4,8(a2)
 78e:	9db9                	addw	a1,a1,a4
 790:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 794:	6398                	ld	a4,0(a5)
 796:	6318                	ld	a4,0(a4)
 798:	fee53823          	sd	a4,-16(a0)
 79c:	a091                	j	7e0 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 79e:	ff852703          	lw	a4,-8(a0)
 7a2:	9e39                	addw	a2,a2,a4
 7a4:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 7a6:	ff053703          	ld	a4,-16(a0)
 7aa:	e398                	sd	a4,0(a5)
 7ac:	a099                	j	7f2 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ae:	6398                	ld	a4,0(a5)
 7b0:	00e7e463          	bltu	a5,a4,7b8 <free+0x42>
 7b4:	00e6ea63          	bltu	a3,a4,7c8 <free+0x52>
{
 7b8:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ba:	fed7fae3          	bleu	a3,a5,7ae <free+0x38>
 7be:	6398                	ld	a4,0(a5)
 7c0:	00e6e463          	bltu	a3,a4,7c8 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	fee7eae3          	bltu	a5,a4,7b8 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 7c8:	ff852583          	lw	a1,-8(a0)
 7cc:	6390                	ld	a2,0(a5)
 7ce:	02059713          	slli	a4,a1,0x20
 7d2:	9301                	srli	a4,a4,0x20
 7d4:	0712                	slli	a4,a4,0x4
 7d6:	9736                	add	a4,a4,a3
 7d8:	fae60ae3          	beq	a2,a4,78c <free+0x16>
    bp->s.ptr = p->s.ptr;
 7dc:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7e0:	4790                	lw	a2,8(a5)
 7e2:	02061713          	slli	a4,a2,0x20
 7e6:	9301                	srli	a4,a4,0x20
 7e8:	0712                	slli	a4,a4,0x4
 7ea:	973e                	add	a4,a4,a5
 7ec:	fae689e3          	beq	a3,a4,79e <free+0x28>
  } else
    p->s.ptr = bp;
 7f0:	e394                	sd	a3,0(a5)
  freep = p;
 7f2:	00000717          	auipc	a4,0x0
 7f6:	14f73f23          	sd	a5,350(a4) # 950 <__bss_start>
}
 7fa:	6422                	ld	s0,8(sp)
 7fc:	0141                	addi	sp,sp,16
 7fe:	8082                	ret

0000000000000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	7139                	addi	sp,sp,-64
 802:	fc06                	sd	ra,56(sp)
 804:	f822                	sd	s0,48(sp)
 806:	f426                	sd	s1,40(sp)
 808:	f04a                	sd	s2,32(sp)
 80a:	ec4e                	sd	s3,24(sp)
 80c:	e852                	sd	s4,16(sp)
 80e:	e456                	sd	s5,8(sp)
 810:	e05a                	sd	s6,0(sp)
 812:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 814:	02051993          	slli	s3,a0,0x20
 818:	0209d993          	srli	s3,s3,0x20
 81c:	09bd                	addi	s3,s3,15
 81e:	0049d993          	srli	s3,s3,0x4
 822:	2985                	addiw	s3,s3,1
 824:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 828:	00000797          	auipc	a5,0x0
 82c:	12878793          	addi	a5,a5,296 # 950 <__bss_start>
 830:	6388                	ld	a0,0(a5)
 832:	c515                	beqz	a0,85e <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 834:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 836:	4798                	lw	a4,8(a5)
 838:	03277d63          	bleu	s2,a4,872 <malloc+0x72>
 83c:	8a4e                	mv	s4,s3
 83e:	0009871b          	sext.w	a4,s3
 842:	6685                	lui	a3,0x1
 844:	00d77363          	bleu	a3,a4,84a <malloc+0x4a>
 848:	6a05                	lui	s4,0x1
 84a:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 84e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 852:	00000497          	auipc	s1,0x0
 856:	0fe48493          	addi	s1,s1,254 # 950 <__bss_start>
  if(p == (char*)-1)
 85a:	5b7d                	li	s6,-1
 85c:	a0b5                	j	8c8 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 85e:	00000717          	auipc	a4,0x0
 862:	0fa70713          	addi	a4,a4,250 # 958 <base>
 866:	e398                	sd	a4,0(a5)
 868:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 86a:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86e:	87ba                	mv	a5,a4
 870:	b7f1                	j	83c <malloc+0x3c>
      if(p->s.size == nunits)
 872:	02e90b63          	beq	s2,a4,8a8 <malloc+0xa8>
        p->s.size -= nunits;
 876:	4137073b          	subw	a4,a4,s3
 87a:	c798                	sw	a4,8(a5)
        p += p->s.size;
 87c:	1702                	slli	a4,a4,0x20
 87e:	9301                	srli	a4,a4,0x20
 880:	0712                	slli	a4,a4,0x4
 882:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 884:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 888:	00000717          	auipc	a4,0x0
 88c:	0ca73423          	sd	a0,200(a4) # 950 <__bss_start>
      return (void*)(p + 1);
 890:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 894:	70e2                	ld	ra,56(sp)
 896:	7442                	ld	s0,48(sp)
 898:	74a2                	ld	s1,40(sp)
 89a:	7902                	ld	s2,32(sp)
 89c:	69e2                	ld	s3,24(sp)
 89e:	6a42                	ld	s4,16(sp)
 8a0:	6aa2                	ld	s5,8(sp)
 8a2:	6b02                	ld	s6,0(sp)
 8a4:	6121                	addi	sp,sp,64
 8a6:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8a8:	6398                	ld	a4,0(a5)
 8aa:	e118                	sd	a4,0(a0)
 8ac:	bff1                	j	888 <malloc+0x88>
  hp->s.size = nu;
 8ae:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 8b2:	0541                	addi	a0,a0,16
 8b4:	00000097          	auipc	ra,0x0
 8b8:	ec2080e7          	jalr	-318(ra) # 776 <free>
  return freep;
 8bc:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 8be:	d979                	beqz	a0,894 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8c2:	4798                	lw	a4,8(a5)
 8c4:	fb2777e3          	bleu	s2,a4,872 <malloc+0x72>
    if(p == freep)
 8c8:	6098                	ld	a4,0(s1)
 8ca:	853e                	mv	a0,a5
 8cc:	fef71ae3          	bne	a4,a5,8c0 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 8d0:	8552                	mv	a0,s4
 8d2:	00000097          	auipc	ra,0x0
 8d6:	b38080e7          	jalr	-1224(ra) # 40a <sbrk>
  if(p == (char*)-1)
 8da:	fd651ae3          	bne	a0,s6,8ae <malloc+0xae>
        return 0;
 8de:	4501                	li	a0,0
 8e0:	bf55                	j	894 <malloc+0x94>
