
xv6-user/_mkdir:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
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
  10:	02a7d763          	ble	a0,a5,3e <main+0x3e>
  14:	00858493          	addi	s1,a1,8
  18:	ffe5091b          	addiw	s2,a0,-2
  1c:	1902                	slli	s2,s2,0x20
  1e:	02095913          	srli	s2,s2,0x20
  22:	090e                	slli	s2,s2,0x3
  24:	05c1                	addi	a1,a1,16
  26:	992e                	add	s2,s2,a1
    fprintf(2, "Usage: mkdir files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  28:	6088                	ld	a0,0(s1)
  2a:	00000097          	auipc	ra,0x0
  2e:	378080e7          	jalr	888(ra) # 3a2 <mkdir>
  32:	02054463          	bltz	a0,5a <main+0x5a>
  for(i = 1; i < argc; i++){
  36:	04a1                	addi	s1,s1,8
  38:	ff2498e3          	bne	s1,s2,28 <main+0x28>
  3c:	a80d                	j	6e <main+0x6e>
    fprintf(2, "Usage: mkdir files...\n");
  3e:	00001597          	auipc	a1,0x1
  42:	86258593          	addi	a1,a1,-1950 # 8a0 <malloc+0xe8>
  46:	4509                	li	a0,2
  48:	00000097          	auipc	ra,0x0
  4c:	682080e7          	jalr	1666(ra) # 6ca <fprintf>
    exit(1);
  50:	4505                	li	a0,1
  52:	00000097          	auipc	ra,0x0
  56:	300080e7          	jalr	768(ra) # 352 <exit>
      fprintf(2, "mkdir: %s failed to create\n", argv[i]);
  5a:	6090                	ld	a2,0(s1)
  5c:	00001597          	auipc	a1,0x1
  60:	85c58593          	addi	a1,a1,-1956 # 8b8 <malloc+0x100>
  64:	4509                	li	a0,2
  66:	00000097          	auipc	ra,0x0
  6a:	664080e7          	jalr	1636(ra) # 6ca <fprintf>
      break;
    }
  }

  exit(0);
  6e:	4501                	li	a0,0
  70:	00000097          	auipc	ra,0x0
  74:	2e2080e7          	jalr	738(ra) # 352 <exit>

0000000000000078 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  78:	1141                	addi	sp,sp,-16
  7a:	e422                	sd	s0,8(sp)
  7c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7e:	87aa                	mv	a5,a0
  80:	0585                	addi	a1,a1,1
  82:	0785                	addi	a5,a5,1
  84:	fff5c703          	lbu	a4,-1(a1)
  88:	fee78fa3          	sb	a4,-1(a5)
  8c:	fb75                	bnez	a4,80 <strcpy+0x8>
    ;
  return os;
}
  8e:	6422                	ld	s0,8(sp)
  90:	0141                	addi	sp,sp,16
  92:	8082                	ret

0000000000000094 <strcat>:

char*
strcat(char *s, const char *t)
{
  94:	1141                	addi	sp,sp,-16
  96:	e422                	sd	s0,8(sp)
  98:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  9a:	00054783          	lbu	a5,0(a0)
  9e:	c385                	beqz	a5,be <strcat+0x2a>
  a0:	87aa                	mv	a5,a0
    s++;
  a2:	0785                	addi	a5,a5,1
  while(*s)
  a4:	0007c703          	lbu	a4,0(a5)
  a8:	ff6d                	bnez	a4,a2 <strcat+0xe>
  while((*s++ = *t++))
  aa:	0585                	addi	a1,a1,1
  ac:	0785                	addi	a5,a5,1
  ae:	fff5c703          	lbu	a4,-1(a1)
  b2:	fee78fa3          	sb	a4,-1(a5)
  b6:	fb75                	bnez	a4,aa <strcat+0x16>
    ;
  return os;
}
  b8:	6422                	ld	s0,8(sp)
  ba:	0141                	addi	sp,sp,16
  bc:	8082                	ret
  while(*s)
  be:	87aa                	mv	a5,a0
  c0:	b7ed                	j	aa <strcat+0x16>

00000000000000c2 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  c8:	00054783          	lbu	a5,0(a0)
  cc:	cf91                	beqz	a5,e8 <strcmp+0x26>
  ce:	0005c703          	lbu	a4,0(a1)
  d2:	00f71b63          	bne	a4,a5,e8 <strcmp+0x26>
    p++, q++;
  d6:	0505                	addi	a0,a0,1
  d8:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  da:	00054783          	lbu	a5,0(a0)
  de:	c789                	beqz	a5,e8 <strcmp+0x26>
  e0:	0005c703          	lbu	a4,0(a1)
  e4:	fef709e3          	beq	a4,a5,d6 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
  e8:	0005c503          	lbu	a0,0(a1)
}
  ec:	40a7853b          	subw	a0,a5,a0
  f0:	6422                	ld	s0,8(sp)
  f2:	0141                	addi	sp,sp,16
  f4:	8082                	ret

00000000000000f6 <strlen>:

uint
strlen(const char *s)
{
  f6:	1141                	addi	sp,sp,-16
  f8:	e422                	sd	s0,8(sp)
  fa:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  fc:	00054783          	lbu	a5,0(a0)
 100:	cf91                	beqz	a5,11c <strlen+0x26>
 102:	0505                	addi	a0,a0,1
 104:	87aa                	mv	a5,a0
 106:	4685                	li	a3,1
 108:	9e89                	subw	a3,a3,a0
 10a:	00f6853b          	addw	a0,a3,a5
 10e:	0785                	addi	a5,a5,1
 110:	fff7c703          	lbu	a4,-1(a5)
 114:	fb7d                	bnez	a4,10a <strlen+0x14>
    ;
  return n;
}
 116:	6422                	ld	s0,8(sp)
 118:	0141                	addi	sp,sp,16
 11a:	8082                	ret
  for(n = 0; s[n]; n++)
 11c:	4501                	li	a0,0
 11e:	bfe5                	j	116 <strlen+0x20>

0000000000000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	1141                	addi	sp,sp,-16
 122:	e422                	sd	s0,8(sp)
 124:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 126:	ce09                	beqz	a2,140 <memset+0x20>
 128:	87aa                	mv	a5,a0
 12a:	fff6071b          	addiw	a4,a2,-1
 12e:	1702                	slli	a4,a4,0x20
 130:	9301                	srli	a4,a4,0x20
 132:	0705                	addi	a4,a4,1
 134:	972a                	add	a4,a4,a0
    cdst[i] = c;
 136:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 13a:	0785                	addi	a5,a5,1
 13c:	fee79de3          	bne	a5,a4,136 <memset+0x16>
  }
  return dst;
}
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret

0000000000000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	1141                	addi	sp,sp,-16
 148:	e422                	sd	s0,8(sp)
 14a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 14c:	00054783          	lbu	a5,0(a0)
 150:	cf91                	beqz	a5,16c <strchr+0x26>
    if(*s == c)
 152:	00f58a63          	beq	a1,a5,166 <strchr+0x20>
  for(; *s; s++)
 156:	0505                	addi	a0,a0,1
 158:	00054783          	lbu	a5,0(a0)
 15c:	c781                	beqz	a5,164 <strchr+0x1e>
    if(*s == c)
 15e:	feb79ce3          	bne	a5,a1,156 <strchr+0x10>
 162:	a011                	j	166 <strchr+0x20>
      return (char*)s;
  return 0;
 164:	4501                	li	a0,0
}
 166:	6422                	ld	s0,8(sp)
 168:	0141                	addi	sp,sp,16
 16a:	8082                	ret
  return 0;
 16c:	4501                	li	a0,0
 16e:	bfe5                	j	166 <strchr+0x20>

0000000000000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	711d                	addi	sp,sp,-96
 172:	ec86                	sd	ra,88(sp)
 174:	e8a2                	sd	s0,80(sp)
 176:	e4a6                	sd	s1,72(sp)
 178:	e0ca                	sd	s2,64(sp)
 17a:	fc4e                	sd	s3,56(sp)
 17c:	f852                	sd	s4,48(sp)
 17e:	f456                	sd	s5,40(sp)
 180:	f05a                	sd	s6,32(sp)
 182:	ec5e                	sd	s7,24(sp)
 184:	e862                	sd	s8,16(sp)
 186:	1080                	addi	s0,sp,96
 188:	8c2a                	mv	s8,a0
 18a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18c:	892a                	mv	s2,a0
 18e:	4981                	li	s3,0
    cc = read(0, &c, 1);
 190:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 194:	4b29                	li	s6,10
 196:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 198:	0019849b          	addiw	s1,s3,1
 19c:	0344d763          	ble	s4,s1,1ca <gets+0x5a>
    cc = read(0, &c, 1);
 1a0:	4605                	li	a2,1
 1a2:	85d6                	mv	a1,s5
 1a4:	4501                	li	a0,0
 1a6:	00000097          	auipc	ra,0x0
 1aa:	1c4080e7          	jalr	452(ra) # 36a <read>
    if(cc < 1)
 1ae:	00a05e63          	blez	a0,1ca <gets+0x5a>
    buf[i++] = c;
 1b2:	faf44783          	lbu	a5,-81(s0)
 1b6:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1ba:	01678763          	beq	a5,s6,1c8 <gets+0x58>
 1be:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 1c0:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 1c2:	fd779be3          	bne	a5,s7,198 <gets+0x28>
 1c6:	a011                	j	1ca <gets+0x5a>
  for(i=0; i+1 < max; ){
 1c8:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1ca:	99e2                	add	s3,s3,s8
 1cc:	00098023          	sb	zero,0(s3)
  return buf;
}
 1d0:	8562                	mv	a0,s8
 1d2:	60e6                	ld	ra,88(sp)
 1d4:	6446                	ld	s0,80(sp)
 1d6:	64a6                	ld	s1,72(sp)
 1d8:	6906                	ld	s2,64(sp)
 1da:	79e2                	ld	s3,56(sp)
 1dc:	7a42                	ld	s4,48(sp)
 1de:	7aa2                	ld	s5,40(sp)
 1e0:	7b02                	ld	s6,32(sp)
 1e2:	6be2                	ld	s7,24(sp)
 1e4:	6c42                	ld	s8,16(sp)
 1e6:	6125                	addi	sp,sp,96
 1e8:	8082                	ret

00000000000001ea <stat>:

int
stat(const char *n, struct stat *st)
{
 1ea:	1101                	addi	sp,sp,-32
 1ec:	ec06                	sd	ra,24(sp)
 1ee:	e822                	sd	s0,16(sp)
 1f0:	e426                	sd	s1,8(sp)
 1f2:	e04a                	sd	s2,0(sp)
 1f4:	1000                	addi	s0,sp,32
 1f6:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f8:	4581                	li	a1,0
 1fa:	00000097          	auipc	ra,0x0
 1fe:	198080e7          	jalr	408(ra) # 392 <open>
  if(fd < 0)
 202:	02054563          	bltz	a0,22c <stat+0x42>
 206:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 208:	85ca                	mv	a1,s2
 20a:	00000097          	auipc	ra,0x0
 20e:	190080e7          	jalr	400(ra) # 39a <fstat>
 212:	892a                	mv	s2,a0
  close(fd);
 214:	8526                	mv	a0,s1
 216:	00000097          	auipc	ra,0x0
 21a:	164080e7          	jalr	356(ra) # 37a <close>
  return r;
}
 21e:	854a                	mv	a0,s2
 220:	60e2                	ld	ra,24(sp)
 222:	6442                	ld	s0,16(sp)
 224:	64a2                	ld	s1,8(sp)
 226:	6902                	ld	s2,0(sp)
 228:	6105                	addi	sp,sp,32
 22a:	8082                	ret
    return -1;
 22c:	597d                	li	s2,-1
 22e:	bfc5                	j	21e <stat+0x34>

0000000000000230 <atoi>:

int
atoi(const char *s)
{
 230:	1141                	addi	sp,sp,-16
 232:	e422                	sd	s0,8(sp)
 234:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 236:	00054703          	lbu	a4,0(a0)
 23a:	02d00793          	li	a5,45
  int neg = 1;
 23e:	4805                	li	a6,1
  if (*s == '-') {
 240:	04f70363          	beq	a4,a5,286 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 244:	00054683          	lbu	a3,0(a0)
 248:	fd06879b          	addiw	a5,a3,-48
 24c:	0ff7f793          	andi	a5,a5,255
 250:	4725                	li	a4,9
 252:	02f76d63          	bltu	a4,a5,28c <atoi+0x5c>
  n = 0;
 256:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 258:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 25a:	0505                	addi	a0,a0,1
 25c:	0026179b          	slliw	a5,a2,0x2
 260:	9fb1                	addw	a5,a5,a2
 262:	0017979b          	slliw	a5,a5,0x1
 266:	9fb5                	addw	a5,a5,a3
 268:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 26c:	00054683          	lbu	a3,0(a0)
 270:	fd06871b          	addiw	a4,a3,-48
 274:	0ff77713          	andi	a4,a4,255
 278:	fee5f1e3          	bleu	a4,a1,25a <atoi+0x2a>
  return n * neg;
}
 27c:	02c8053b          	mulw	a0,a6,a2
 280:	6422                	ld	s0,8(sp)
 282:	0141                	addi	sp,sp,16
 284:	8082                	ret
    s++;
 286:	0505                	addi	a0,a0,1
    neg = -1;
 288:	587d                	li	a6,-1
 28a:	bf6d                	j	244 <atoi+0x14>
  n = 0;
 28c:	4601                	li	a2,0
 28e:	b7fd                	j	27c <atoi+0x4c>

0000000000000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	1141                	addi	sp,sp,-16
 292:	e422                	sd	s0,8(sp)
 294:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 296:	02b57663          	bleu	a1,a0,2c2 <memmove+0x32>
    while(n-- > 0)
 29a:	02c05163          	blez	a2,2bc <memmove+0x2c>
 29e:	fff6079b          	addiw	a5,a2,-1
 2a2:	1782                	slli	a5,a5,0x20
 2a4:	9381                	srli	a5,a5,0x20
 2a6:	0785                	addi	a5,a5,1
 2a8:	97aa                	add	a5,a5,a0
  dst = vdst;
 2aa:	872a                	mv	a4,a0
      *dst++ = *src++;
 2ac:	0585                	addi	a1,a1,1
 2ae:	0705                	addi	a4,a4,1
 2b0:	fff5c683          	lbu	a3,-1(a1)
 2b4:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2b8:	fee79ae3          	bne	a5,a4,2ac <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2bc:	6422                	ld	s0,8(sp)
 2be:	0141                	addi	sp,sp,16
 2c0:	8082                	ret
    dst += n;
 2c2:	00c50733          	add	a4,a0,a2
    src += n;
 2c6:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2c8:	fec05ae3          	blez	a2,2bc <memmove+0x2c>
 2cc:	fff6079b          	addiw	a5,a2,-1
 2d0:	1782                	slli	a5,a5,0x20
 2d2:	9381                	srli	a5,a5,0x20
 2d4:	fff7c793          	not	a5,a5
 2d8:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2da:	15fd                	addi	a1,a1,-1
 2dc:	177d                	addi	a4,a4,-1
 2de:	0005c683          	lbu	a3,0(a1)
 2e2:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2e6:	fef71ae3          	bne	a4,a5,2da <memmove+0x4a>
 2ea:	bfc9                	j	2bc <memmove+0x2c>

00000000000002ec <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2ec:	1141                	addi	sp,sp,-16
 2ee:	e422                	sd	s0,8(sp)
 2f0:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2f2:	ce15                	beqz	a2,32e <memcmp+0x42>
 2f4:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 2f8:	00054783          	lbu	a5,0(a0)
 2fc:	0005c703          	lbu	a4,0(a1)
 300:	02e79063          	bne	a5,a4,320 <memcmp+0x34>
 304:	1682                	slli	a3,a3,0x20
 306:	9281                	srli	a3,a3,0x20
 308:	0685                	addi	a3,a3,1
 30a:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 30c:	0505                	addi	a0,a0,1
    p2++;
 30e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 310:	00d50d63          	beq	a0,a3,32a <memcmp+0x3e>
    if (*p1 != *p2) {
 314:	00054783          	lbu	a5,0(a0)
 318:	0005c703          	lbu	a4,0(a1)
 31c:	fee788e3          	beq	a5,a4,30c <memcmp+0x20>
      return *p1 - *p2;
 320:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 324:	6422                	ld	s0,8(sp)
 326:	0141                	addi	sp,sp,16
 328:	8082                	ret
  return 0;
 32a:	4501                	li	a0,0
 32c:	bfe5                	j	324 <memcmp+0x38>
 32e:	4501                	li	a0,0
 330:	bfd5                	j	324 <memcmp+0x38>

0000000000000332 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 332:	1141                	addi	sp,sp,-16
 334:	e406                	sd	ra,8(sp)
 336:	e022                	sd	s0,0(sp)
 338:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 33a:	00000097          	auipc	ra,0x0
 33e:	f56080e7          	jalr	-170(ra) # 290 <memmove>
}
 342:	60a2                	ld	ra,8(sp)
 344:	6402                	ld	s0,0(sp)
 346:	0141                	addi	sp,sp,16
 348:	8082                	ret

000000000000034a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 34a:	4885                	li	a7,1
 ecall
 34c:	00000073          	ecall
 ret
 350:	8082                	ret

0000000000000352 <exit>:
.global exit
exit:
 li a7, SYS_exit
 352:	4889                	li	a7,2
 ecall
 354:	00000073          	ecall
 ret
 358:	8082                	ret

000000000000035a <wait>:
.global wait
wait:
 li a7, SYS_wait
 35a:	488d                	li	a7,3
 ecall
 35c:	00000073          	ecall
 ret
 360:	8082                	ret

0000000000000362 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 362:	4891                	li	a7,4
 ecall
 364:	00000073          	ecall
 ret
 368:	8082                	ret

000000000000036a <read>:
.global read
read:
 li a7, SYS_read
 36a:	4895                	li	a7,5
 ecall
 36c:	00000073          	ecall
 ret
 370:	8082                	ret

0000000000000372 <write>:
.global write
write:
 li a7, SYS_write
 372:	48c1                	li	a7,16
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <close>:
.global close
close:
 li a7, SYS_close
 37a:	48d5                	li	a7,21
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <kill>:
.global kill
kill:
 li a7, SYS_kill
 382:	4899                	li	a7,6
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <exec>:
.global exec
exec:
 li a7, SYS_exec
 38a:	489d                	li	a7,7
 ecall
 38c:	00000073          	ecall
 ret
 390:	8082                	ret

0000000000000392 <open>:
.global open
open:
 li a7, SYS_open
 392:	48bd                	li	a7,15
 ecall
 394:	00000073          	ecall
 ret
 398:	8082                	ret

000000000000039a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 39a:	48a1                	li	a7,8
 ecall
 39c:	00000073          	ecall
 ret
 3a0:	8082                	ret

00000000000003a2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3a2:	48d1                	li	a7,20
 ecall
 3a4:	00000073          	ecall
 ret
 3a8:	8082                	ret

00000000000003aa <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3aa:	48a5                	li	a7,9
 ecall
 3ac:	00000073          	ecall
 ret
 3b0:	8082                	ret

00000000000003b2 <dup>:
.global dup
dup:
 li a7, SYS_dup
 3b2:	48a9                	li	a7,10
 ecall
 3b4:	00000073          	ecall
 ret
 3b8:	8082                	ret

00000000000003ba <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3ba:	48ad                	li	a7,11
 ecall
 3bc:	00000073          	ecall
 ret
 3c0:	8082                	ret

00000000000003c2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3c2:	48b1                	li	a7,12
 ecall
 3c4:	00000073          	ecall
 ret
 3c8:	8082                	ret

00000000000003ca <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3ca:	48b5                	li	a7,13
 ecall
 3cc:	00000073          	ecall
 ret
 3d0:	8082                	ret

00000000000003d2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3d2:	48b9                	li	a7,14
 ecall
 3d4:	00000073          	ecall
 ret
 3d8:	8082                	ret

00000000000003da <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3da:	48d9                	li	a7,22
 ecall
 3dc:	00000073          	ecall
 ret
 3e0:	8082                	ret

00000000000003e2 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3e2:	48dd                	li	a7,23
 ecall
 3e4:	00000073          	ecall
 ret
 3e8:	8082                	ret

00000000000003ea <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3ea:	48e1                	li	a7,24
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3f2:	48e5                	li	a7,25
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <remove>:
.global remove
remove:
 li a7, SYS_remove
 3fa:	48c5                	li	a7,17
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <trace>:
.global trace
trace:
 li a7, SYS_trace
 402:	48c9                	li	a7,18
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 40a:	48cd                	li	a7,19
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <rename>:
.global rename
rename:
 li a7, SYS_rename
 412:	48e9                	li	a7,26
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 41a:	48ed                	li	a7,27
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 422:	1101                	addi	sp,sp,-32
 424:	ec06                	sd	ra,24(sp)
 426:	e822                	sd	s0,16(sp)
 428:	1000                	addi	s0,sp,32
 42a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 42e:	4605                	li	a2,1
 430:	fef40593          	addi	a1,s0,-17
 434:	00000097          	auipc	ra,0x0
 438:	f3e080e7          	jalr	-194(ra) # 372 <write>
}
 43c:	60e2                	ld	ra,24(sp)
 43e:	6442                	ld	s0,16(sp)
 440:	6105                	addi	sp,sp,32
 442:	8082                	ret

0000000000000444 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 444:	7139                	addi	sp,sp,-64
 446:	fc06                	sd	ra,56(sp)
 448:	f822                	sd	s0,48(sp)
 44a:	f426                	sd	s1,40(sp)
 44c:	f04a                	sd	s2,32(sp)
 44e:	ec4e                	sd	s3,24(sp)
 450:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 452:	c299                	beqz	a3,458 <printint+0x14>
 454:	0005ce63          	bltz	a1,470 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 458:	2581                	sext.w	a1,a1
  neg = 0;
 45a:	4301                	li	t1,0
  }

  i = 0;
 45c:	fc040913          	addi	s2,s0,-64
  neg = 0;
 460:	874a                	mv	a4,s2
  i = 0;
 462:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 464:	2601                	sext.w	a2,a2
 466:	00000897          	auipc	a7,0x0
 46a:	47288893          	addi	a7,a7,1138 # 8d8 <digits>
 46e:	a801                	j	47e <printint+0x3a>
    x = -xx;
 470:	40b005bb          	negw	a1,a1
 474:	2581                	sext.w	a1,a1
    neg = 1;
 476:	4305                	li	t1,1
    x = -xx;
 478:	b7d5                	j	45c <printint+0x18>
  }while((x /= base) != 0);
 47a:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 47c:	8836                	mv	a6,a3
 47e:	0018069b          	addiw	a3,a6,1
 482:	02c5f7bb          	remuw	a5,a1,a2
 486:	1782                	slli	a5,a5,0x20
 488:	9381                	srli	a5,a5,0x20
 48a:	97c6                	add	a5,a5,a7
 48c:	0007c783          	lbu	a5,0(a5)
 490:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 494:	0705                	addi	a4,a4,1
 496:	02c5d7bb          	divuw	a5,a1,a2
 49a:	fec5f0e3          	bleu	a2,a1,47a <printint+0x36>
  if(neg)
 49e:	00030b63          	beqz	t1,4b4 <printint+0x70>
    buf[i++] = '-';
 4a2:	fd040793          	addi	a5,s0,-48
 4a6:	96be                	add	a3,a3,a5
 4a8:	02d00793          	li	a5,45
 4ac:	fef68823          	sb	a5,-16(a3)
 4b0:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 4b4:	02d05763          	blez	a3,4e2 <printint+0x9e>
 4b8:	89aa                	mv	s3,a0
 4ba:	fc040493          	addi	s1,s0,-64
 4be:	94b6                	add	s1,s1,a3
 4c0:	197d                	addi	s2,s2,-1
 4c2:	9936                	add	s2,s2,a3
 4c4:	36fd                	addiw	a3,a3,-1
 4c6:	1682                	slli	a3,a3,0x20
 4c8:	9281                	srli	a3,a3,0x20
 4ca:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 4ce:	fff4c583          	lbu	a1,-1(s1)
 4d2:	854e                	mv	a0,s3
 4d4:	00000097          	auipc	ra,0x0
 4d8:	f4e080e7          	jalr	-178(ra) # 422 <putc>
  while(--i >= 0)
 4dc:	14fd                	addi	s1,s1,-1
 4de:	ff2498e3          	bne	s1,s2,4ce <printint+0x8a>
}
 4e2:	70e2                	ld	ra,56(sp)
 4e4:	7442                	ld	s0,48(sp)
 4e6:	74a2                	ld	s1,40(sp)
 4e8:	7902                	ld	s2,32(sp)
 4ea:	69e2                	ld	s3,24(sp)
 4ec:	6121                	addi	sp,sp,64
 4ee:	8082                	ret

00000000000004f0 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4f0:	7119                	addi	sp,sp,-128
 4f2:	fc86                	sd	ra,120(sp)
 4f4:	f8a2                	sd	s0,112(sp)
 4f6:	f4a6                	sd	s1,104(sp)
 4f8:	f0ca                	sd	s2,96(sp)
 4fa:	ecce                	sd	s3,88(sp)
 4fc:	e8d2                	sd	s4,80(sp)
 4fe:	e4d6                	sd	s5,72(sp)
 500:	e0da                	sd	s6,64(sp)
 502:	fc5e                	sd	s7,56(sp)
 504:	f862                	sd	s8,48(sp)
 506:	f466                	sd	s9,40(sp)
 508:	f06a                	sd	s10,32(sp)
 50a:	ec6e                	sd	s11,24(sp)
 50c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 50e:	0005c483          	lbu	s1,0(a1)
 512:	18048d63          	beqz	s1,6ac <vprintf+0x1bc>
 516:	8aaa                	mv	s5,a0
 518:	8b32                	mv	s6,a2
 51a:	00158913          	addi	s2,a1,1
  state = 0;
 51e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 520:	02500a13          	li	s4,37
      if(c == 'd'){
 524:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 528:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 52c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 530:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 534:	00000b97          	auipc	s7,0x0
 538:	3a4b8b93          	addi	s7,s7,932 # 8d8 <digits>
 53c:	a839                	j	55a <vprintf+0x6a>
        putc(fd, c);
 53e:	85a6                	mv	a1,s1
 540:	8556                	mv	a0,s5
 542:	00000097          	auipc	ra,0x0
 546:	ee0080e7          	jalr	-288(ra) # 422 <putc>
 54a:	a019                	j	550 <vprintf+0x60>
    } else if(state == '%'){
 54c:	01498f63          	beq	s3,s4,56a <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 550:	0905                	addi	s2,s2,1
 552:	fff94483          	lbu	s1,-1(s2)
 556:	14048b63          	beqz	s1,6ac <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 55a:	0004879b          	sext.w	a5,s1
    if(state == 0){
 55e:	fe0997e3          	bnez	s3,54c <vprintf+0x5c>
      if(c == '%'){
 562:	fd479ee3          	bne	a5,s4,53e <vprintf+0x4e>
        state = '%';
 566:	89be                	mv	s3,a5
 568:	b7e5                	j	550 <vprintf+0x60>
      if(c == 'd'){
 56a:	05878063          	beq	a5,s8,5aa <vprintf+0xba>
      } else if(c == 'l') {
 56e:	05978c63          	beq	a5,s9,5c6 <vprintf+0xd6>
      } else if(c == 'x') {
 572:	07a78863          	beq	a5,s10,5e2 <vprintf+0xf2>
      } else if(c == 'p') {
 576:	09b78463          	beq	a5,s11,5fe <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 57a:	07300713          	li	a4,115
 57e:	0ce78563          	beq	a5,a4,648 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 582:	06300713          	li	a4,99
 586:	0ee78c63          	beq	a5,a4,67e <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 58a:	11478663          	beq	a5,s4,696 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58e:	85d2                	mv	a1,s4
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	e90080e7          	jalr	-368(ra) # 422 <putc>
        putc(fd, c);
 59a:	85a6                	mv	a1,s1
 59c:	8556                	mv	a0,s5
 59e:	00000097          	auipc	ra,0x0
 5a2:	e84080e7          	jalr	-380(ra) # 422 <putc>
      }
      state = 0;
 5a6:	4981                	li	s3,0
 5a8:	b765                	j	550 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5aa:	008b0493          	addi	s1,s6,8
 5ae:	4685                	li	a3,1
 5b0:	4629                	li	a2,10
 5b2:	000b2583          	lw	a1,0(s6)
 5b6:	8556                	mv	a0,s5
 5b8:	00000097          	auipc	ra,0x0
 5bc:	e8c080e7          	jalr	-372(ra) # 444 <printint>
 5c0:	8b26                	mv	s6,s1
      state = 0;
 5c2:	4981                	li	s3,0
 5c4:	b771                	j	550 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5c6:	008b0493          	addi	s1,s6,8
 5ca:	4681                	li	a3,0
 5cc:	4629                	li	a2,10
 5ce:	000b2583          	lw	a1,0(s6)
 5d2:	8556                	mv	a0,s5
 5d4:	00000097          	auipc	ra,0x0
 5d8:	e70080e7          	jalr	-400(ra) # 444 <printint>
 5dc:	8b26                	mv	s6,s1
      state = 0;
 5de:	4981                	li	s3,0
 5e0:	bf85                	j	550 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5e2:	008b0493          	addi	s1,s6,8
 5e6:	4681                	li	a3,0
 5e8:	4641                	li	a2,16
 5ea:	000b2583          	lw	a1,0(s6)
 5ee:	8556                	mv	a0,s5
 5f0:	00000097          	auipc	ra,0x0
 5f4:	e54080e7          	jalr	-428(ra) # 444 <printint>
 5f8:	8b26                	mv	s6,s1
      state = 0;
 5fa:	4981                	li	s3,0
 5fc:	bf91                	j	550 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5fe:	008b0793          	addi	a5,s6,8
 602:	f8f43423          	sd	a5,-120(s0)
 606:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 60a:	03000593          	li	a1,48
 60e:	8556                	mv	a0,s5
 610:	00000097          	auipc	ra,0x0
 614:	e12080e7          	jalr	-494(ra) # 422 <putc>
  putc(fd, 'x');
 618:	85ea                	mv	a1,s10
 61a:	8556                	mv	a0,s5
 61c:	00000097          	auipc	ra,0x0
 620:	e06080e7          	jalr	-506(ra) # 422 <putc>
 624:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 626:	03c9d793          	srli	a5,s3,0x3c
 62a:	97de                	add	a5,a5,s7
 62c:	0007c583          	lbu	a1,0(a5)
 630:	8556                	mv	a0,s5
 632:	00000097          	auipc	ra,0x0
 636:	df0080e7          	jalr	-528(ra) # 422 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 63a:	0992                	slli	s3,s3,0x4
 63c:	34fd                	addiw	s1,s1,-1
 63e:	f4e5                	bnez	s1,626 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 640:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 644:	4981                	li	s3,0
 646:	b729                	j	550 <vprintf+0x60>
        s = va_arg(ap, char*);
 648:	008b0993          	addi	s3,s6,8
 64c:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 650:	c085                	beqz	s1,670 <vprintf+0x180>
        while(*s != 0){
 652:	0004c583          	lbu	a1,0(s1)
 656:	c9a1                	beqz	a1,6a6 <vprintf+0x1b6>
          putc(fd, *s);
 658:	8556                	mv	a0,s5
 65a:	00000097          	auipc	ra,0x0
 65e:	dc8080e7          	jalr	-568(ra) # 422 <putc>
          s++;
 662:	0485                	addi	s1,s1,1
        while(*s != 0){
 664:	0004c583          	lbu	a1,0(s1)
 668:	f9e5                	bnez	a1,658 <vprintf+0x168>
        s = va_arg(ap, char*);
 66a:	8b4e                	mv	s6,s3
      state = 0;
 66c:	4981                	li	s3,0
 66e:	b5cd                	j	550 <vprintf+0x60>
          s = "(null)";
 670:	00000497          	auipc	s1,0x0
 674:	28048493          	addi	s1,s1,640 # 8f0 <digits+0x18>
        while(*s != 0){
 678:	02800593          	li	a1,40
 67c:	bff1                	j	658 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 67e:	008b0493          	addi	s1,s6,8
 682:	000b4583          	lbu	a1,0(s6)
 686:	8556                	mv	a0,s5
 688:	00000097          	auipc	ra,0x0
 68c:	d9a080e7          	jalr	-614(ra) # 422 <putc>
 690:	8b26                	mv	s6,s1
      state = 0;
 692:	4981                	li	s3,0
 694:	bd75                	j	550 <vprintf+0x60>
        putc(fd, c);
 696:	85d2                	mv	a1,s4
 698:	8556                	mv	a0,s5
 69a:	00000097          	auipc	ra,0x0
 69e:	d88080e7          	jalr	-632(ra) # 422 <putc>
      state = 0;
 6a2:	4981                	li	s3,0
 6a4:	b575                	j	550 <vprintf+0x60>
        s = va_arg(ap, char*);
 6a6:	8b4e                	mv	s6,s3
      state = 0;
 6a8:	4981                	li	s3,0
 6aa:	b55d                	j	550 <vprintf+0x60>
    }
  }
}
 6ac:	70e6                	ld	ra,120(sp)
 6ae:	7446                	ld	s0,112(sp)
 6b0:	74a6                	ld	s1,104(sp)
 6b2:	7906                	ld	s2,96(sp)
 6b4:	69e6                	ld	s3,88(sp)
 6b6:	6a46                	ld	s4,80(sp)
 6b8:	6aa6                	ld	s5,72(sp)
 6ba:	6b06                	ld	s6,64(sp)
 6bc:	7be2                	ld	s7,56(sp)
 6be:	7c42                	ld	s8,48(sp)
 6c0:	7ca2                	ld	s9,40(sp)
 6c2:	7d02                	ld	s10,32(sp)
 6c4:	6de2                	ld	s11,24(sp)
 6c6:	6109                	addi	sp,sp,128
 6c8:	8082                	ret

00000000000006ca <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6ca:	715d                	addi	sp,sp,-80
 6cc:	ec06                	sd	ra,24(sp)
 6ce:	e822                	sd	s0,16(sp)
 6d0:	1000                	addi	s0,sp,32
 6d2:	e010                	sd	a2,0(s0)
 6d4:	e414                	sd	a3,8(s0)
 6d6:	e818                	sd	a4,16(s0)
 6d8:	ec1c                	sd	a5,24(s0)
 6da:	03043023          	sd	a6,32(s0)
 6de:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6e2:	8622                	mv	a2,s0
 6e4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6e8:	00000097          	auipc	ra,0x0
 6ec:	e08080e7          	jalr	-504(ra) # 4f0 <vprintf>
}
 6f0:	60e2                	ld	ra,24(sp)
 6f2:	6442                	ld	s0,16(sp)
 6f4:	6161                	addi	sp,sp,80
 6f6:	8082                	ret

00000000000006f8 <printf>:

void
printf(const char *fmt, ...)
{
 6f8:	711d                	addi	sp,sp,-96
 6fa:	ec06                	sd	ra,24(sp)
 6fc:	e822                	sd	s0,16(sp)
 6fe:	1000                	addi	s0,sp,32
 700:	e40c                	sd	a1,8(s0)
 702:	e810                	sd	a2,16(s0)
 704:	ec14                	sd	a3,24(s0)
 706:	f018                	sd	a4,32(s0)
 708:	f41c                	sd	a5,40(s0)
 70a:	03043823          	sd	a6,48(s0)
 70e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 712:	00840613          	addi	a2,s0,8
 716:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 71a:	85aa                	mv	a1,a0
 71c:	4505                	li	a0,1
 71e:	00000097          	auipc	ra,0x0
 722:	dd2080e7          	jalr	-558(ra) # 4f0 <vprintf>
}
 726:	60e2                	ld	ra,24(sp)
 728:	6442                	ld	s0,16(sp)
 72a:	6125                	addi	sp,sp,96
 72c:	8082                	ret

000000000000072e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72e:	1141                	addi	sp,sp,-16
 730:	e422                	sd	s0,8(sp)
 732:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 734:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 738:	00000797          	auipc	a5,0x0
 73c:	1c078793          	addi	a5,a5,448 # 8f8 <__bss_start>
 740:	639c                	ld	a5,0(a5)
 742:	a805                	j	772 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 744:	4618                	lw	a4,8(a2)
 746:	9db9                	addw	a1,a1,a4
 748:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 74c:	6398                	ld	a4,0(a5)
 74e:	6318                	ld	a4,0(a4)
 750:	fee53823          	sd	a4,-16(a0)
 754:	a091                	j	798 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 756:	ff852703          	lw	a4,-8(a0)
 75a:	9e39                	addw	a2,a2,a4
 75c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 75e:	ff053703          	ld	a4,-16(a0)
 762:	e398                	sd	a4,0(a5)
 764:	a099                	j	7aa <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 766:	6398                	ld	a4,0(a5)
 768:	00e7e463          	bltu	a5,a4,770 <free+0x42>
 76c:	00e6ea63          	bltu	a3,a4,780 <free+0x52>
{
 770:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 772:	fed7fae3          	bleu	a3,a5,766 <free+0x38>
 776:	6398                	ld	a4,0(a5)
 778:	00e6e463          	bltu	a3,a4,780 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 77c:	fee7eae3          	bltu	a5,a4,770 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 780:	ff852583          	lw	a1,-8(a0)
 784:	6390                	ld	a2,0(a5)
 786:	02059713          	slli	a4,a1,0x20
 78a:	9301                	srli	a4,a4,0x20
 78c:	0712                	slli	a4,a4,0x4
 78e:	9736                	add	a4,a4,a3
 790:	fae60ae3          	beq	a2,a4,744 <free+0x16>
    bp->s.ptr = p->s.ptr;
 794:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 798:	4790                	lw	a2,8(a5)
 79a:	02061713          	slli	a4,a2,0x20
 79e:	9301                	srli	a4,a4,0x20
 7a0:	0712                	slli	a4,a4,0x4
 7a2:	973e                	add	a4,a4,a5
 7a4:	fae689e3          	beq	a3,a4,756 <free+0x28>
  } else
    p->s.ptr = bp;
 7a8:	e394                	sd	a3,0(a5)
  freep = p;
 7aa:	00000717          	auipc	a4,0x0
 7ae:	14f73723          	sd	a5,334(a4) # 8f8 <__bss_start>
}
 7b2:	6422                	ld	s0,8(sp)
 7b4:	0141                	addi	sp,sp,16
 7b6:	8082                	ret

00000000000007b8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b8:	7139                	addi	sp,sp,-64
 7ba:	fc06                	sd	ra,56(sp)
 7bc:	f822                	sd	s0,48(sp)
 7be:	f426                	sd	s1,40(sp)
 7c0:	f04a                	sd	s2,32(sp)
 7c2:	ec4e                	sd	s3,24(sp)
 7c4:	e852                	sd	s4,16(sp)
 7c6:	e456                	sd	s5,8(sp)
 7c8:	e05a                	sd	s6,0(sp)
 7ca:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7cc:	02051993          	slli	s3,a0,0x20
 7d0:	0209d993          	srli	s3,s3,0x20
 7d4:	09bd                	addi	s3,s3,15
 7d6:	0049d993          	srli	s3,s3,0x4
 7da:	2985                	addiw	s3,s3,1
 7dc:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 7e0:	00000797          	auipc	a5,0x0
 7e4:	11878793          	addi	a5,a5,280 # 8f8 <__bss_start>
 7e8:	6388                	ld	a0,0(a5)
 7ea:	c515                	beqz	a0,816 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ec:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7ee:	4798                	lw	a4,8(a5)
 7f0:	03277d63          	bleu	s2,a4,82a <malloc+0x72>
 7f4:	8a4e                	mv	s4,s3
 7f6:	0009871b          	sext.w	a4,s3
 7fa:	6685                	lui	a3,0x1
 7fc:	00d77363          	bleu	a3,a4,802 <malloc+0x4a>
 800:	6a05                	lui	s4,0x1
 802:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 806:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 80a:	00000497          	auipc	s1,0x0
 80e:	0ee48493          	addi	s1,s1,238 # 8f8 <__bss_start>
  if(p == (char*)-1)
 812:	5b7d                	li	s6,-1
 814:	a0b5                	j	880 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 816:	00000717          	auipc	a4,0x0
 81a:	0ea70713          	addi	a4,a4,234 # 900 <base>
 81e:	e398                	sd	a4,0(a5)
 820:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 822:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 826:	87ba                	mv	a5,a4
 828:	b7f1                	j	7f4 <malloc+0x3c>
      if(p->s.size == nunits)
 82a:	02e90b63          	beq	s2,a4,860 <malloc+0xa8>
        p->s.size -= nunits;
 82e:	4137073b          	subw	a4,a4,s3
 832:	c798                	sw	a4,8(a5)
        p += p->s.size;
 834:	1702                	slli	a4,a4,0x20
 836:	9301                	srli	a4,a4,0x20
 838:	0712                	slli	a4,a4,0x4
 83a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 83c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 840:	00000717          	auipc	a4,0x0
 844:	0aa73c23          	sd	a0,184(a4) # 8f8 <__bss_start>
      return (void*)(p + 1);
 848:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 84c:	70e2                	ld	ra,56(sp)
 84e:	7442                	ld	s0,48(sp)
 850:	74a2                	ld	s1,40(sp)
 852:	7902                	ld	s2,32(sp)
 854:	69e2                	ld	s3,24(sp)
 856:	6a42                	ld	s4,16(sp)
 858:	6aa2                	ld	s5,8(sp)
 85a:	6b02                	ld	s6,0(sp)
 85c:	6121                	addi	sp,sp,64
 85e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 860:	6398                	ld	a4,0(a5)
 862:	e118                	sd	a4,0(a0)
 864:	bff1                	j	840 <malloc+0x88>
  hp->s.size = nu;
 866:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 86a:	0541                	addi	a0,a0,16
 86c:	00000097          	auipc	ra,0x0
 870:	ec2080e7          	jalr	-318(ra) # 72e <free>
  return freep;
 874:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 876:	d979                	beqz	a0,84c <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 878:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 87a:	4798                	lw	a4,8(a5)
 87c:	fb2777e3          	bleu	s2,a4,82a <malloc+0x72>
    if(p == freep)
 880:	6098                	ld	a4,0(s1)
 882:	853e                	mv	a0,a5
 884:	fef71ae3          	bne	a4,a5,878 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 888:	8552                	mv	a0,s4
 88a:	00000097          	auipc	ra,0x0
 88e:	b38080e7          	jalr	-1224(ra) # 3c2 <sbrk>
  if(p == (char*)-1)
 892:	fd651ae3          	bne	a0,s6,866 <malloc+0xae>
        return 0;
 896:	4501                	li	a0,0
 898:	bf55                	j	84c <malloc+0x94>
