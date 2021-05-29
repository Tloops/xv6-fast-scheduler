
xv6-user/_rm:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
  int i;

  if(argc < 2){
   e:	4785                	li	a5,1
  10:	02a7d163          	ble	a0,a5,32 <main+0x32>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	1902                	slli	s2,s2,0x20
  1e:	02095913          	srli	s2,s2,0x20
  22:	090e                	slli	s2,s2,0x3
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(remove(argv[i]) < 0){
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
  28:	00001997          	auipc	s3,0x1
  2c:	89098993          	addi	s3,s3,-1904 # 8b8 <malloc+0xfc>
  30:	a015                	j	54 <main+0x54>
    fprintf(2, "Usage: rm files...\n");
  32:	00001597          	auipc	a1,0x1
  36:	86e58593          	addi	a1,a1,-1938 # 8a0 <malloc+0xe4>
  3a:	4509                	li	a0,2
  3c:	00000097          	auipc	ra,0x0
  40:	692080e7          	jalr	1682(ra) # 6ce <fprintf>
    exit(1);
  44:	4505                	li	a0,1
  46:	00000097          	auipc	ra,0x0
  4a:	310080e7          	jalr	784(ra) # 356 <exit>
  for(i = 1; i < argc; i++){
  4e:	04a1                	addi	s1,s1,8
  50:	03248163          	beq	s1,s2,72 <main+0x72>
    if(remove(argv[i]) < 0){
  54:	6088                	ld	a0,0(s1)
  56:	00000097          	auipc	ra,0x0
  5a:	3a8080e7          	jalr	936(ra) # 3fe <remove>
  5e:	fe0558e3          	bgez	a0,4e <main+0x4e>
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
  62:	6090                	ld	a2,0(s1)
  64:	85ce                	mv	a1,s3
  66:	4509                	li	a0,2
  68:	00000097          	auipc	ra,0x0
  6c:	666080e7          	jalr	1638(ra) # 6ce <fprintf>
  70:	bff9                	j	4e <main+0x4e>
    }
  }

  exit(0);
  72:	4501                	li	a0,0
  74:	00000097          	auipc	ra,0x0
  78:	2e2080e7          	jalr	738(ra) # 356 <exit>

000000000000007c <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  7c:	1141                	addi	sp,sp,-16
  7e:	e422                	sd	s0,8(sp)
  80:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  82:	87aa                	mv	a5,a0
  84:	0585                	addi	a1,a1,1
  86:	0785                	addi	a5,a5,1
  88:	fff5c703          	lbu	a4,-1(a1)
  8c:	fee78fa3          	sb	a4,-1(a5)
  90:	fb75                	bnez	a4,84 <strcpy+0x8>
    ;
  return os;
}
  92:	6422                	ld	s0,8(sp)
  94:	0141                	addi	sp,sp,16
  96:	8082                	ret

0000000000000098 <strcat>:

char*
strcat(char *s, const char *t)
{
  98:	1141                	addi	sp,sp,-16
  9a:	e422                	sd	s0,8(sp)
  9c:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  9e:	00054783          	lbu	a5,0(a0)
  a2:	c385                	beqz	a5,c2 <strcat+0x2a>
  a4:	87aa                	mv	a5,a0
    s++;
  a6:	0785                	addi	a5,a5,1
  while(*s)
  a8:	0007c703          	lbu	a4,0(a5)
  ac:	ff6d                	bnez	a4,a6 <strcat+0xe>
  while((*s++ = *t++))
  ae:	0585                	addi	a1,a1,1
  b0:	0785                	addi	a5,a5,1
  b2:	fff5c703          	lbu	a4,-1(a1)
  b6:	fee78fa3          	sb	a4,-1(a5)
  ba:	fb75                	bnez	a4,ae <strcat+0x16>
    ;
  return os;
}
  bc:	6422                	ld	s0,8(sp)
  be:	0141                	addi	sp,sp,16
  c0:	8082                	ret
  while(*s)
  c2:	87aa                	mv	a5,a0
  c4:	b7ed                	j	ae <strcat+0x16>

00000000000000c6 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  c6:	1141                	addi	sp,sp,-16
  c8:	e422                	sd	s0,8(sp)
  ca:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  cc:	00054783          	lbu	a5,0(a0)
  d0:	cf91                	beqz	a5,ec <strcmp+0x26>
  d2:	0005c703          	lbu	a4,0(a1)
  d6:	00f71b63          	bne	a4,a5,ec <strcmp+0x26>
    p++, q++;
  da:	0505                	addi	a0,a0,1
  dc:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  de:	00054783          	lbu	a5,0(a0)
  e2:	c789                	beqz	a5,ec <strcmp+0x26>
  e4:	0005c703          	lbu	a4,0(a1)
  e8:	fef709e3          	beq	a4,a5,da <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
  ec:	0005c503          	lbu	a0,0(a1)
}
  f0:	40a7853b          	subw	a0,a5,a0
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret

00000000000000fa <strlen>:

uint
strlen(const char *s)
{
  fa:	1141                	addi	sp,sp,-16
  fc:	e422                	sd	s0,8(sp)
  fe:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 100:	00054783          	lbu	a5,0(a0)
 104:	cf91                	beqz	a5,120 <strlen+0x26>
 106:	0505                	addi	a0,a0,1
 108:	87aa                	mv	a5,a0
 10a:	4685                	li	a3,1
 10c:	9e89                	subw	a3,a3,a0
 10e:	00f6853b          	addw	a0,a3,a5
 112:	0785                	addi	a5,a5,1
 114:	fff7c703          	lbu	a4,-1(a5)
 118:	fb7d                	bnez	a4,10e <strlen+0x14>
    ;
  return n;
}
 11a:	6422                	ld	s0,8(sp)
 11c:	0141                	addi	sp,sp,16
 11e:	8082                	ret
  for(n = 0; s[n]; n++)
 120:	4501                	li	a0,0
 122:	bfe5                	j	11a <strlen+0x20>

0000000000000124 <memset>:

void*
memset(void *dst, int c, uint n)
{
 124:	1141                	addi	sp,sp,-16
 126:	e422                	sd	s0,8(sp)
 128:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 12a:	ce09                	beqz	a2,144 <memset+0x20>
 12c:	87aa                	mv	a5,a0
 12e:	fff6071b          	addiw	a4,a2,-1
 132:	1702                	slli	a4,a4,0x20
 134:	9301                	srli	a4,a4,0x20
 136:	0705                	addi	a4,a4,1
 138:	972a                	add	a4,a4,a0
    cdst[i] = c;
 13a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 13e:	0785                	addi	a5,a5,1
 140:	fee79de3          	bne	a5,a4,13a <memset+0x16>
  }
  return dst;
}
 144:	6422                	ld	s0,8(sp)
 146:	0141                	addi	sp,sp,16
 148:	8082                	ret

000000000000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	1141                	addi	sp,sp,-16
 14c:	e422                	sd	s0,8(sp)
 14e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 150:	00054783          	lbu	a5,0(a0)
 154:	cf91                	beqz	a5,170 <strchr+0x26>
    if(*s == c)
 156:	00f58a63          	beq	a1,a5,16a <strchr+0x20>
  for(; *s; s++)
 15a:	0505                	addi	a0,a0,1
 15c:	00054783          	lbu	a5,0(a0)
 160:	c781                	beqz	a5,168 <strchr+0x1e>
    if(*s == c)
 162:	feb79ce3          	bne	a5,a1,15a <strchr+0x10>
 166:	a011                	j	16a <strchr+0x20>
      return (char*)s;
  return 0;
 168:	4501                	li	a0,0
}
 16a:	6422                	ld	s0,8(sp)
 16c:	0141                	addi	sp,sp,16
 16e:	8082                	ret
  return 0;
 170:	4501                	li	a0,0
 172:	bfe5                	j	16a <strchr+0x20>

0000000000000174 <gets>:

char*
gets(char *buf, int max)
{
 174:	711d                	addi	sp,sp,-96
 176:	ec86                	sd	ra,88(sp)
 178:	e8a2                	sd	s0,80(sp)
 17a:	e4a6                	sd	s1,72(sp)
 17c:	e0ca                	sd	s2,64(sp)
 17e:	fc4e                	sd	s3,56(sp)
 180:	f852                	sd	s4,48(sp)
 182:	f456                	sd	s5,40(sp)
 184:	f05a                	sd	s6,32(sp)
 186:	ec5e                	sd	s7,24(sp)
 188:	e862                	sd	s8,16(sp)
 18a:	1080                	addi	s0,sp,96
 18c:	8c2a                	mv	s8,a0
 18e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 190:	892a                	mv	s2,a0
 192:	4981                	li	s3,0
    cc = read(0, &c, 1);
 194:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 198:	4b29                	li	s6,10
 19a:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 19c:	0019849b          	addiw	s1,s3,1
 1a0:	0344d763          	ble	s4,s1,1ce <gets+0x5a>
    cc = read(0, &c, 1);
 1a4:	4605                	li	a2,1
 1a6:	85d6                	mv	a1,s5
 1a8:	4501                	li	a0,0
 1aa:	00000097          	auipc	ra,0x0
 1ae:	1c4080e7          	jalr	452(ra) # 36e <read>
    if(cc < 1)
 1b2:	00a05e63          	blez	a0,1ce <gets+0x5a>
    buf[i++] = c;
 1b6:	faf44783          	lbu	a5,-81(s0)
 1ba:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1be:	01678763          	beq	a5,s6,1cc <gets+0x58>
 1c2:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 1c4:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 1c6:	fd779be3          	bne	a5,s7,19c <gets+0x28>
 1ca:	a011                	j	1ce <gets+0x5a>
  for(i=0; i+1 < max; ){
 1cc:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1ce:	99e2                	add	s3,s3,s8
 1d0:	00098023          	sb	zero,0(s3)
  return buf;
}
 1d4:	8562                	mv	a0,s8
 1d6:	60e6                	ld	ra,88(sp)
 1d8:	6446                	ld	s0,80(sp)
 1da:	64a6                	ld	s1,72(sp)
 1dc:	6906                	ld	s2,64(sp)
 1de:	79e2                	ld	s3,56(sp)
 1e0:	7a42                	ld	s4,48(sp)
 1e2:	7aa2                	ld	s5,40(sp)
 1e4:	7b02                	ld	s6,32(sp)
 1e6:	6be2                	ld	s7,24(sp)
 1e8:	6c42                	ld	s8,16(sp)
 1ea:	6125                	addi	sp,sp,96
 1ec:	8082                	ret

00000000000001ee <stat>:

int
stat(const char *n, struct stat *st)
{
 1ee:	1101                	addi	sp,sp,-32
 1f0:	ec06                	sd	ra,24(sp)
 1f2:	e822                	sd	s0,16(sp)
 1f4:	e426                	sd	s1,8(sp)
 1f6:	e04a                	sd	s2,0(sp)
 1f8:	1000                	addi	s0,sp,32
 1fa:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fc:	4581                	li	a1,0
 1fe:	00000097          	auipc	ra,0x0
 202:	198080e7          	jalr	408(ra) # 396 <open>
  if(fd < 0)
 206:	02054563          	bltz	a0,230 <stat+0x42>
 20a:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 20c:	85ca                	mv	a1,s2
 20e:	00000097          	auipc	ra,0x0
 212:	190080e7          	jalr	400(ra) # 39e <fstat>
 216:	892a                	mv	s2,a0
  close(fd);
 218:	8526                	mv	a0,s1
 21a:	00000097          	auipc	ra,0x0
 21e:	164080e7          	jalr	356(ra) # 37e <close>
  return r;
}
 222:	854a                	mv	a0,s2
 224:	60e2                	ld	ra,24(sp)
 226:	6442                	ld	s0,16(sp)
 228:	64a2                	ld	s1,8(sp)
 22a:	6902                	ld	s2,0(sp)
 22c:	6105                	addi	sp,sp,32
 22e:	8082                	ret
    return -1;
 230:	597d                	li	s2,-1
 232:	bfc5                	j	222 <stat+0x34>

0000000000000234 <atoi>:

int
atoi(const char *s)
{
 234:	1141                	addi	sp,sp,-16
 236:	e422                	sd	s0,8(sp)
 238:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 23a:	00054703          	lbu	a4,0(a0)
 23e:	02d00793          	li	a5,45
  int neg = 1;
 242:	4805                	li	a6,1
  if (*s == '-') {
 244:	04f70363          	beq	a4,a5,28a <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 248:	00054683          	lbu	a3,0(a0)
 24c:	fd06879b          	addiw	a5,a3,-48
 250:	0ff7f793          	andi	a5,a5,255
 254:	4725                	li	a4,9
 256:	02f76d63          	bltu	a4,a5,290 <atoi+0x5c>
  n = 0;
 25a:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 25c:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 25e:	0505                	addi	a0,a0,1
 260:	0026179b          	slliw	a5,a2,0x2
 264:	9fb1                	addw	a5,a5,a2
 266:	0017979b          	slliw	a5,a5,0x1
 26a:	9fb5                	addw	a5,a5,a3
 26c:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 270:	00054683          	lbu	a3,0(a0)
 274:	fd06871b          	addiw	a4,a3,-48
 278:	0ff77713          	andi	a4,a4,255
 27c:	fee5f1e3          	bleu	a4,a1,25e <atoi+0x2a>
  return n * neg;
}
 280:	02c8053b          	mulw	a0,a6,a2
 284:	6422                	ld	s0,8(sp)
 286:	0141                	addi	sp,sp,16
 288:	8082                	ret
    s++;
 28a:	0505                	addi	a0,a0,1
    neg = -1;
 28c:	587d                	li	a6,-1
 28e:	bf6d                	j	248 <atoi+0x14>
  n = 0;
 290:	4601                	li	a2,0
 292:	b7fd                	j	280 <atoi+0x4c>

0000000000000294 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 294:	1141                	addi	sp,sp,-16
 296:	e422                	sd	s0,8(sp)
 298:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 29a:	02b57663          	bleu	a1,a0,2c6 <memmove+0x32>
    while(n-- > 0)
 29e:	02c05163          	blez	a2,2c0 <memmove+0x2c>
 2a2:	fff6079b          	addiw	a5,a2,-1
 2a6:	1782                	slli	a5,a5,0x20
 2a8:	9381                	srli	a5,a5,0x20
 2aa:	0785                	addi	a5,a5,1
 2ac:	97aa                	add	a5,a5,a0
  dst = vdst;
 2ae:	872a                	mv	a4,a0
      *dst++ = *src++;
 2b0:	0585                	addi	a1,a1,1
 2b2:	0705                	addi	a4,a4,1
 2b4:	fff5c683          	lbu	a3,-1(a1)
 2b8:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2bc:	fee79ae3          	bne	a5,a4,2b0 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2c0:	6422                	ld	s0,8(sp)
 2c2:	0141                	addi	sp,sp,16
 2c4:	8082                	ret
    dst += n;
 2c6:	00c50733          	add	a4,a0,a2
    src += n;
 2ca:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2cc:	fec05ae3          	blez	a2,2c0 <memmove+0x2c>
 2d0:	fff6079b          	addiw	a5,a2,-1
 2d4:	1782                	slli	a5,a5,0x20
 2d6:	9381                	srli	a5,a5,0x20
 2d8:	fff7c793          	not	a5,a5
 2dc:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2de:	15fd                	addi	a1,a1,-1
 2e0:	177d                	addi	a4,a4,-1
 2e2:	0005c683          	lbu	a3,0(a1)
 2e6:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2ea:	fef71ae3          	bne	a4,a5,2de <memmove+0x4a>
 2ee:	bfc9                	j	2c0 <memmove+0x2c>

00000000000002f0 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2f0:	1141                	addi	sp,sp,-16
 2f2:	e422                	sd	s0,8(sp)
 2f4:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2f6:	ce15                	beqz	a2,332 <memcmp+0x42>
 2f8:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 2fc:	00054783          	lbu	a5,0(a0)
 300:	0005c703          	lbu	a4,0(a1)
 304:	02e79063          	bne	a5,a4,324 <memcmp+0x34>
 308:	1682                	slli	a3,a3,0x20
 30a:	9281                	srli	a3,a3,0x20
 30c:	0685                	addi	a3,a3,1
 30e:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 310:	0505                	addi	a0,a0,1
    p2++;
 312:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 314:	00d50d63          	beq	a0,a3,32e <memcmp+0x3e>
    if (*p1 != *p2) {
 318:	00054783          	lbu	a5,0(a0)
 31c:	0005c703          	lbu	a4,0(a1)
 320:	fee788e3          	beq	a5,a4,310 <memcmp+0x20>
      return *p1 - *p2;
 324:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 328:	6422                	ld	s0,8(sp)
 32a:	0141                	addi	sp,sp,16
 32c:	8082                	ret
  return 0;
 32e:	4501                	li	a0,0
 330:	bfe5                	j	328 <memcmp+0x38>
 332:	4501                	li	a0,0
 334:	bfd5                	j	328 <memcmp+0x38>

0000000000000336 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 336:	1141                	addi	sp,sp,-16
 338:	e406                	sd	ra,8(sp)
 33a:	e022                	sd	s0,0(sp)
 33c:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 33e:	00000097          	auipc	ra,0x0
 342:	f56080e7          	jalr	-170(ra) # 294 <memmove>
}
 346:	60a2                	ld	ra,8(sp)
 348:	6402                	ld	s0,0(sp)
 34a:	0141                	addi	sp,sp,16
 34c:	8082                	ret

000000000000034e <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 34e:	4885                	li	a7,1
 ecall
 350:	00000073          	ecall
 ret
 354:	8082                	ret

0000000000000356 <exit>:
.global exit
exit:
 li a7, SYS_exit
 356:	4889                	li	a7,2
 ecall
 358:	00000073          	ecall
 ret
 35c:	8082                	ret

000000000000035e <wait>:
.global wait
wait:
 li a7, SYS_wait
 35e:	488d                	li	a7,3
 ecall
 360:	00000073          	ecall
 ret
 364:	8082                	ret

0000000000000366 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 366:	4891                	li	a7,4
 ecall
 368:	00000073          	ecall
 ret
 36c:	8082                	ret

000000000000036e <read>:
.global read
read:
 li a7, SYS_read
 36e:	4895                	li	a7,5
 ecall
 370:	00000073          	ecall
 ret
 374:	8082                	ret

0000000000000376 <write>:
.global write
write:
 li a7, SYS_write
 376:	48c1                	li	a7,16
 ecall
 378:	00000073          	ecall
 ret
 37c:	8082                	ret

000000000000037e <close>:
.global close
close:
 li a7, SYS_close
 37e:	48d5                	li	a7,21
 ecall
 380:	00000073          	ecall
 ret
 384:	8082                	ret

0000000000000386 <kill>:
.global kill
kill:
 li a7, SYS_kill
 386:	4899                	li	a7,6
 ecall
 388:	00000073          	ecall
 ret
 38c:	8082                	ret

000000000000038e <exec>:
.global exec
exec:
 li a7, SYS_exec
 38e:	489d                	li	a7,7
 ecall
 390:	00000073          	ecall
 ret
 394:	8082                	ret

0000000000000396 <open>:
.global open
open:
 li a7, SYS_open
 396:	48bd                	li	a7,15
 ecall
 398:	00000073          	ecall
 ret
 39c:	8082                	ret

000000000000039e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 39e:	48a1                	li	a7,8
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3a6:	48d1                	li	a7,20
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3ae:	48a5                	li	a7,9
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <dup>:
.global dup
dup:
 li a7, SYS_dup
 3b6:	48a9                	li	a7,10
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3be:	48ad                	li	a7,11
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3c6:	48b1                	li	a7,12
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3ce:	48b5                	li	a7,13
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3d6:	48b9                	li	a7,14
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3de:	48d9                	li	a7,22
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3e6:	48dd                	li	a7,23
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3ee:	48e1                	li	a7,24
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3f6:	48e5                	li	a7,25
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <remove>:
.global remove
remove:
 li a7, SYS_remove
 3fe:	48c5                	li	a7,17
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <trace>:
.global trace
trace:
 li a7, SYS_trace
 406:	48c9                	li	a7,18
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 40e:	48cd                	li	a7,19
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <rename>:
.global rename
rename:
 li a7, SYS_rename
 416:	48e9                	li	a7,26
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 41e:	48ed                	li	a7,27
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 426:	1101                	addi	sp,sp,-32
 428:	ec06                	sd	ra,24(sp)
 42a:	e822                	sd	s0,16(sp)
 42c:	1000                	addi	s0,sp,32
 42e:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 432:	4605                	li	a2,1
 434:	fef40593          	addi	a1,s0,-17
 438:	00000097          	auipc	ra,0x0
 43c:	f3e080e7          	jalr	-194(ra) # 376 <write>
}
 440:	60e2                	ld	ra,24(sp)
 442:	6442                	ld	s0,16(sp)
 444:	6105                	addi	sp,sp,32
 446:	8082                	ret

0000000000000448 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 448:	7139                	addi	sp,sp,-64
 44a:	fc06                	sd	ra,56(sp)
 44c:	f822                	sd	s0,48(sp)
 44e:	f426                	sd	s1,40(sp)
 450:	f04a                	sd	s2,32(sp)
 452:	ec4e                	sd	s3,24(sp)
 454:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 456:	c299                	beqz	a3,45c <printint+0x14>
 458:	0005ce63          	bltz	a1,474 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 45c:	2581                	sext.w	a1,a1
  neg = 0;
 45e:	4301                	li	t1,0
  }

  i = 0;
 460:	fc040913          	addi	s2,s0,-64
  neg = 0;
 464:	874a                	mv	a4,s2
  i = 0;
 466:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 468:	2601                	sext.w	a2,a2
 46a:	00000897          	auipc	a7,0x0
 46e:	46e88893          	addi	a7,a7,1134 # 8d8 <digits>
 472:	a801                	j	482 <printint+0x3a>
    x = -xx;
 474:	40b005bb          	negw	a1,a1
 478:	2581                	sext.w	a1,a1
    neg = 1;
 47a:	4305                	li	t1,1
    x = -xx;
 47c:	b7d5                	j	460 <printint+0x18>
  }while((x /= base) != 0);
 47e:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 480:	8836                	mv	a6,a3
 482:	0018069b          	addiw	a3,a6,1
 486:	02c5f7bb          	remuw	a5,a1,a2
 48a:	1782                	slli	a5,a5,0x20
 48c:	9381                	srli	a5,a5,0x20
 48e:	97c6                	add	a5,a5,a7
 490:	0007c783          	lbu	a5,0(a5)
 494:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 498:	0705                	addi	a4,a4,1
 49a:	02c5d7bb          	divuw	a5,a1,a2
 49e:	fec5f0e3          	bleu	a2,a1,47e <printint+0x36>
  if(neg)
 4a2:	00030b63          	beqz	t1,4b8 <printint+0x70>
    buf[i++] = '-';
 4a6:	fd040793          	addi	a5,s0,-48
 4aa:	96be                	add	a3,a3,a5
 4ac:	02d00793          	li	a5,45
 4b0:	fef68823          	sb	a5,-16(a3)
 4b4:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 4b8:	02d05763          	blez	a3,4e6 <printint+0x9e>
 4bc:	89aa                	mv	s3,a0
 4be:	fc040493          	addi	s1,s0,-64
 4c2:	94b6                	add	s1,s1,a3
 4c4:	197d                	addi	s2,s2,-1
 4c6:	9936                	add	s2,s2,a3
 4c8:	36fd                	addiw	a3,a3,-1
 4ca:	1682                	slli	a3,a3,0x20
 4cc:	9281                	srli	a3,a3,0x20
 4ce:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 4d2:	fff4c583          	lbu	a1,-1(s1)
 4d6:	854e                	mv	a0,s3
 4d8:	00000097          	auipc	ra,0x0
 4dc:	f4e080e7          	jalr	-178(ra) # 426 <putc>
  while(--i >= 0)
 4e0:	14fd                	addi	s1,s1,-1
 4e2:	ff2498e3          	bne	s1,s2,4d2 <printint+0x8a>
}
 4e6:	70e2                	ld	ra,56(sp)
 4e8:	7442                	ld	s0,48(sp)
 4ea:	74a2                	ld	s1,40(sp)
 4ec:	7902                	ld	s2,32(sp)
 4ee:	69e2                	ld	s3,24(sp)
 4f0:	6121                	addi	sp,sp,64
 4f2:	8082                	ret

00000000000004f4 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4f4:	7119                	addi	sp,sp,-128
 4f6:	fc86                	sd	ra,120(sp)
 4f8:	f8a2                	sd	s0,112(sp)
 4fa:	f4a6                	sd	s1,104(sp)
 4fc:	f0ca                	sd	s2,96(sp)
 4fe:	ecce                	sd	s3,88(sp)
 500:	e8d2                	sd	s4,80(sp)
 502:	e4d6                	sd	s5,72(sp)
 504:	e0da                	sd	s6,64(sp)
 506:	fc5e                	sd	s7,56(sp)
 508:	f862                	sd	s8,48(sp)
 50a:	f466                	sd	s9,40(sp)
 50c:	f06a                	sd	s10,32(sp)
 50e:	ec6e                	sd	s11,24(sp)
 510:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 512:	0005c483          	lbu	s1,0(a1)
 516:	18048d63          	beqz	s1,6b0 <vprintf+0x1bc>
 51a:	8aaa                	mv	s5,a0
 51c:	8b32                	mv	s6,a2
 51e:	00158913          	addi	s2,a1,1
  state = 0;
 522:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 524:	02500a13          	li	s4,37
      if(c == 'd'){
 528:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 52c:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 530:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 534:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 538:	00000b97          	auipc	s7,0x0
 53c:	3a0b8b93          	addi	s7,s7,928 # 8d8 <digits>
 540:	a839                	j	55e <vprintf+0x6a>
        putc(fd, c);
 542:	85a6                	mv	a1,s1
 544:	8556                	mv	a0,s5
 546:	00000097          	auipc	ra,0x0
 54a:	ee0080e7          	jalr	-288(ra) # 426 <putc>
 54e:	a019                	j	554 <vprintf+0x60>
    } else if(state == '%'){
 550:	01498f63          	beq	s3,s4,56e <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 554:	0905                	addi	s2,s2,1
 556:	fff94483          	lbu	s1,-1(s2)
 55a:	14048b63          	beqz	s1,6b0 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 55e:	0004879b          	sext.w	a5,s1
    if(state == 0){
 562:	fe0997e3          	bnez	s3,550 <vprintf+0x5c>
      if(c == '%'){
 566:	fd479ee3          	bne	a5,s4,542 <vprintf+0x4e>
        state = '%';
 56a:	89be                	mv	s3,a5
 56c:	b7e5                	j	554 <vprintf+0x60>
      if(c == 'd'){
 56e:	05878063          	beq	a5,s8,5ae <vprintf+0xba>
      } else if(c == 'l') {
 572:	05978c63          	beq	a5,s9,5ca <vprintf+0xd6>
      } else if(c == 'x') {
 576:	07a78863          	beq	a5,s10,5e6 <vprintf+0xf2>
      } else if(c == 'p') {
 57a:	09b78463          	beq	a5,s11,602 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 57e:	07300713          	li	a4,115
 582:	0ce78563          	beq	a5,a4,64c <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 586:	06300713          	li	a4,99
 58a:	0ee78c63          	beq	a5,a4,682 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 58e:	11478663          	beq	a5,s4,69a <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 592:	85d2                	mv	a1,s4
 594:	8556                	mv	a0,s5
 596:	00000097          	auipc	ra,0x0
 59a:	e90080e7          	jalr	-368(ra) # 426 <putc>
        putc(fd, c);
 59e:	85a6                	mv	a1,s1
 5a0:	8556                	mv	a0,s5
 5a2:	00000097          	auipc	ra,0x0
 5a6:	e84080e7          	jalr	-380(ra) # 426 <putc>
      }
      state = 0;
 5aa:	4981                	li	s3,0
 5ac:	b765                	j	554 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5ae:	008b0493          	addi	s1,s6,8
 5b2:	4685                	li	a3,1
 5b4:	4629                	li	a2,10
 5b6:	000b2583          	lw	a1,0(s6)
 5ba:	8556                	mv	a0,s5
 5bc:	00000097          	auipc	ra,0x0
 5c0:	e8c080e7          	jalr	-372(ra) # 448 <printint>
 5c4:	8b26                	mv	s6,s1
      state = 0;
 5c6:	4981                	li	s3,0
 5c8:	b771                	j	554 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5ca:	008b0493          	addi	s1,s6,8
 5ce:	4681                	li	a3,0
 5d0:	4629                	li	a2,10
 5d2:	000b2583          	lw	a1,0(s6)
 5d6:	8556                	mv	a0,s5
 5d8:	00000097          	auipc	ra,0x0
 5dc:	e70080e7          	jalr	-400(ra) # 448 <printint>
 5e0:	8b26                	mv	s6,s1
      state = 0;
 5e2:	4981                	li	s3,0
 5e4:	bf85                	j	554 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5e6:	008b0493          	addi	s1,s6,8
 5ea:	4681                	li	a3,0
 5ec:	4641                	li	a2,16
 5ee:	000b2583          	lw	a1,0(s6)
 5f2:	8556                	mv	a0,s5
 5f4:	00000097          	auipc	ra,0x0
 5f8:	e54080e7          	jalr	-428(ra) # 448 <printint>
 5fc:	8b26                	mv	s6,s1
      state = 0;
 5fe:	4981                	li	s3,0
 600:	bf91                	j	554 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 602:	008b0793          	addi	a5,s6,8
 606:	f8f43423          	sd	a5,-120(s0)
 60a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 60e:	03000593          	li	a1,48
 612:	8556                	mv	a0,s5
 614:	00000097          	auipc	ra,0x0
 618:	e12080e7          	jalr	-494(ra) # 426 <putc>
  putc(fd, 'x');
 61c:	85ea                	mv	a1,s10
 61e:	8556                	mv	a0,s5
 620:	00000097          	auipc	ra,0x0
 624:	e06080e7          	jalr	-506(ra) # 426 <putc>
 628:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 62a:	03c9d793          	srli	a5,s3,0x3c
 62e:	97de                	add	a5,a5,s7
 630:	0007c583          	lbu	a1,0(a5)
 634:	8556                	mv	a0,s5
 636:	00000097          	auipc	ra,0x0
 63a:	df0080e7          	jalr	-528(ra) # 426 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 63e:	0992                	slli	s3,s3,0x4
 640:	34fd                	addiw	s1,s1,-1
 642:	f4e5                	bnez	s1,62a <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 644:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 648:	4981                	li	s3,0
 64a:	b729                	j	554 <vprintf+0x60>
        s = va_arg(ap, char*);
 64c:	008b0993          	addi	s3,s6,8
 650:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 654:	c085                	beqz	s1,674 <vprintf+0x180>
        while(*s != 0){
 656:	0004c583          	lbu	a1,0(s1)
 65a:	c9a1                	beqz	a1,6aa <vprintf+0x1b6>
          putc(fd, *s);
 65c:	8556                	mv	a0,s5
 65e:	00000097          	auipc	ra,0x0
 662:	dc8080e7          	jalr	-568(ra) # 426 <putc>
          s++;
 666:	0485                	addi	s1,s1,1
        while(*s != 0){
 668:	0004c583          	lbu	a1,0(s1)
 66c:	f9e5                	bnez	a1,65c <vprintf+0x168>
        s = va_arg(ap, char*);
 66e:	8b4e                	mv	s6,s3
      state = 0;
 670:	4981                	li	s3,0
 672:	b5cd                	j	554 <vprintf+0x60>
          s = "(null)";
 674:	00000497          	auipc	s1,0x0
 678:	27c48493          	addi	s1,s1,636 # 8f0 <digits+0x18>
        while(*s != 0){
 67c:	02800593          	li	a1,40
 680:	bff1                	j	65c <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 682:	008b0493          	addi	s1,s6,8
 686:	000b4583          	lbu	a1,0(s6)
 68a:	8556                	mv	a0,s5
 68c:	00000097          	auipc	ra,0x0
 690:	d9a080e7          	jalr	-614(ra) # 426 <putc>
 694:	8b26                	mv	s6,s1
      state = 0;
 696:	4981                	li	s3,0
 698:	bd75                	j	554 <vprintf+0x60>
        putc(fd, c);
 69a:	85d2                	mv	a1,s4
 69c:	8556                	mv	a0,s5
 69e:	00000097          	auipc	ra,0x0
 6a2:	d88080e7          	jalr	-632(ra) # 426 <putc>
      state = 0;
 6a6:	4981                	li	s3,0
 6a8:	b575                	j	554 <vprintf+0x60>
        s = va_arg(ap, char*);
 6aa:	8b4e                	mv	s6,s3
      state = 0;
 6ac:	4981                	li	s3,0
 6ae:	b55d                	j	554 <vprintf+0x60>
    }
  }
}
 6b0:	70e6                	ld	ra,120(sp)
 6b2:	7446                	ld	s0,112(sp)
 6b4:	74a6                	ld	s1,104(sp)
 6b6:	7906                	ld	s2,96(sp)
 6b8:	69e6                	ld	s3,88(sp)
 6ba:	6a46                	ld	s4,80(sp)
 6bc:	6aa6                	ld	s5,72(sp)
 6be:	6b06                	ld	s6,64(sp)
 6c0:	7be2                	ld	s7,56(sp)
 6c2:	7c42                	ld	s8,48(sp)
 6c4:	7ca2                	ld	s9,40(sp)
 6c6:	7d02                	ld	s10,32(sp)
 6c8:	6de2                	ld	s11,24(sp)
 6ca:	6109                	addi	sp,sp,128
 6cc:	8082                	ret

00000000000006ce <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6ce:	715d                	addi	sp,sp,-80
 6d0:	ec06                	sd	ra,24(sp)
 6d2:	e822                	sd	s0,16(sp)
 6d4:	1000                	addi	s0,sp,32
 6d6:	e010                	sd	a2,0(s0)
 6d8:	e414                	sd	a3,8(s0)
 6da:	e818                	sd	a4,16(s0)
 6dc:	ec1c                	sd	a5,24(s0)
 6de:	03043023          	sd	a6,32(s0)
 6e2:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6e6:	8622                	mv	a2,s0
 6e8:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6ec:	00000097          	auipc	ra,0x0
 6f0:	e08080e7          	jalr	-504(ra) # 4f4 <vprintf>
}
 6f4:	60e2                	ld	ra,24(sp)
 6f6:	6442                	ld	s0,16(sp)
 6f8:	6161                	addi	sp,sp,80
 6fa:	8082                	ret

00000000000006fc <printf>:

void
printf(const char *fmt, ...)
{
 6fc:	711d                	addi	sp,sp,-96
 6fe:	ec06                	sd	ra,24(sp)
 700:	e822                	sd	s0,16(sp)
 702:	1000                	addi	s0,sp,32
 704:	e40c                	sd	a1,8(s0)
 706:	e810                	sd	a2,16(s0)
 708:	ec14                	sd	a3,24(s0)
 70a:	f018                	sd	a4,32(s0)
 70c:	f41c                	sd	a5,40(s0)
 70e:	03043823          	sd	a6,48(s0)
 712:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 716:	00840613          	addi	a2,s0,8
 71a:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 71e:	85aa                	mv	a1,a0
 720:	4505                	li	a0,1
 722:	00000097          	auipc	ra,0x0
 726:	dd2080e7          	jalr	-558(ra) # 4f4 <vprintf>
}
 72a:	60e2                	ld	ra,24(sp)
 72c:	6442                	ld	s0,16(sp)
 72e:	6125                	addi	sp,sp,96
 730:	8082                	ret

0000000000000732 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 732:	1141                	addi	sp,sp,-16
 734:	e422                	sd	s0,8(sp)
 736:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 738:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73c:	00000797          	auipc	a5,0x0
 740:	1bc78793          	addi	a5,a5,444 # 8f8 <__bss_start>
 744:	639c                	ld	a5,0(a5)
 746:	a805                	j	776 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 748:	4618                	lw	a4,8(a2)
 74a:	9db9                	addw	a1,a1,a4
 74c:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 750:	6398                	ld	a4,0(a5)
 752:	6318                	ld	a4,0(a4)
 754:	fee53823          	sd	a4,-16(a0)
 758:	a091                	j	79c <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 75a:	ff852703          	lw	a4,-8(a0)
 75e:	9e39                	addw	a2,a2,a4
 760:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 762:	ff053703          	ld	a4,-16(a0)
 766:	e398                	sd	a4,0(a5)
 768:	a099                	j	7ae <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76a:	6398                	ld	a4,0(a5)
 76c:	00e7e463          	bltu	a5,a4,774 <free+0x42>
 770:	00e6ea63          	bltu	a3,a4,784 <free+0x52>
{
 774:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 776:	fed7fae3          	bleu	a3,a5,76a <free+0x38>
 77a:	6398                	ld	a4,0(a5)
 77c:	00e6e463          	bltu	a3,a4,784 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	fee7eae3          	bltu	a5,a4,774 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 784:	ff852583          	lw	a1,-8(a0)
 788:	6390                	ld	a2,0(a5)
 78a:	02059713          	slli	a4,a1,0x20
 78e:	9301                	srli	a4,a4,0x20
 790:	0712                	slli	a4,a4,0x4
 792:	9736                	add	a4,a4,a3
 794:	fae60ae3          	beq	a2,a4,748 <free+0x16>
    bp->s.ptr = p->s.ptr;
 798:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 79c:	4790                	lw	a2,8(a5)
 79e:	02061713          	slli	a4,a2,0x20
 7a2:	9301                	srli	a4,a4,0x20
 7a4:	0712                	slli	a4,a4,0x4
 7a6:	973e                	add	a4,a4,a5
 7a8:	fae689e3          	beq	a3,a4,75a <free+0x28>
  } else
    p->s.ptr = bp;
 7ac:	e394                	sd	a3,0(a5)
  freep = p;
 7ae:	00000717          	auipc	a4,0x0
 7b2:	14f73523          	sd	a5,330(a4) # 8f8 <__bss_start>
}
 7b6:	6422                	ld	s0,8(sp)
 7b8:	0141                	addi	sp,sp,16
 7ba:	8082                	ret

00000000000007bc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7bc:	7139                	addi	sp,sp,-64
 7be:	fc06                	sd	ra,56(sp)
 7c0:	f822                	sd	s0,48(sp)
 7c2:	f426                	sd	s1,40(sp)
 7c4:	f04a                	sd	s2,32(sp)
 7c6:	ec4e                	sd	s3,24(sp)
 7c8:	e852                	sd	s4,16(sp)
 7ca:	e456                	sd	s5,8(sp)
 7cc:	e05a                	sd	s6,0(sp)
 7ce:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d0:	02051993          	slli	s3,a0,0x20
 7d4:	0209d993          	srli	s3,s3,0x20
 7d8:	09bd                	addi	s3,s3,15
 7da:	0049d993          	srli	s3,s3,0x4
 7de:	2985                	addiw	s3,s3,1
 7e0:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 7e4:	00000797          	auipc	a5,0x0
 7e8:	11478793          	addi	a5,a5,276 # 8f8 <__bss_start>
 7ec:	6388                	ld	a0,0(a5)
 7ee:	c515                	beqz	a0,81a <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7f2:	4798                	lw	a4,8(a5)
 7f4:	03277d63          	bleu	s2,a4,82e <malloc+0x72>
 7f8:	8a4e                	mv	s4,s3
 7fa:	0009871b          	sext.w	a4,s3
 7fe:	6685                	lui	a3,0x1
 800:	00d77363          	bleu	a3,a4,806 <malloc+0x4a>
 804:	6a05                	lui	s4,0x1
 806:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 80a:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 80e:	00000497          	auipc	s1,0x0
 812:	0ea48493          	addi	s1,s1,234 # 8f8 <__bss_start>
  if(p == (char*)-1)
 816:	5b7d                	li	s6,-1
 818:	a0b5                	j	884 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 81a:	00000717          	auipc	a4,0x0
 81e:	0e670713          	addi	a4,a4,230 # 900 <base>
 822:	e398                	sd	a4,0(a5)
 824:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 826:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82a:	87ba                	mv	a5,a4
 82c:	b7f1                	j	7f8 <malloc+0x3c>
      if(p->s.size == nunits)
 82e:	02e90b63          	beq	s2,a4,864 <malloc+0xa8>
        p->s.size -= nunits;
 832:	4137073b          	subw	a4,a4,s3
 836:	c798                	sw	a4,8(a5)
        p += p->s.size;
 838:	1702                	slli	a4,a4,0x20
 83a:	9301                	srli	a4,a4,0x20
 83c:	0712                	slli	a4,a4,0x4
 83e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 840:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 844:	00000717          	auipc	a4,0x0
 848:	0aa73a23          	sd	a0,180(a4) # 8f8 <__bss_start>
      return (void*)(p + 1);
 84c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 850:	70e2                	ld	ra,56(sp)
 852:	7442                	ld	s0,48(sp)
 854:	74a2                	ld	s1,40(sp)
 856:	7902                	ld	s2,32(sp)
 858:	69e2                	ld	s3,24(sp)
 85a:	6a42                	ld	s4,16(sp)
 85c:	6aa2                	ld	s5,8(sp)
 85e:	6b02                	ld	s6,0(sp)
 860:	6121                	addi	sp,sp,64
 862:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 864:	6398                	ld	a4,0(a5)
 866:	e118                	sd	a4,0(a0)
 868:	bff1                	j	844 <malloc+0x88>
  hp->s.size = nu;
 86a:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 86e:	0541                	addi	a0,a0,16
 870:	00000097          	auipc	ra,0x0
 874:	ec2080e7          	jalr	-318(ra) # 732 <free>
  return freep;
 878:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 87a:	d979                	beqz	a0,850 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 87c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 87e:	4798                	lw	a4,8(a5)
 880:	fb2777e3          	bleu	s2,a4,82e <malloc+0x72>
    if(p == freep)
 884:	6098                	ld	a4,0(s1)
 886:	853e                	mv	a0,a5
 888:	fef71ae3          	bne	a4,a5,87c <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 88c:	8552                	mv	a0,s4
 88e:	00000097          	auipc	ra,0x0
 892:	b38080e7          	jalr	-1224(ra) # 3c6 <sbrk>
  if(p == (char*)-1)
 896:	fd651ae3          	bne	a0,s6,86a <malloc+0xae>
        return 0;
 89a:	4501                	li	a0,0
 89c:	bf55                	j	850 <malloc+0x94>
