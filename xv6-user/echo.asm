
xv6-user/_echo:     file format elf64-littleriscv


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
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  int i;

  for(i = 1; i < argc; i++){
  10:	4785                	li	a5,1
  12:	06a7d463          	ble	a0,a5,7a <main+0x7a>
  16:	00858493          	addi	s1,a1,8
  1a:	ffe5099b          	addiw	s3,a0,-2
  1e:	1982                	slli	s3,s3,0x20
  20:	0209d993          	srli	s3,s3,0x20
  24:	098e                	slli	s3,s3,0x3
  26:	05c1                	addi	a1,a1,16
  28:	99ae                	add	s3,s3,a1
    write(1, argv[i], strlen(argv[i]));
    if(i + 1 < argc){
      write(1, " ", 1);
  2a:	00001a17          	auipc	s4,0x1
  2e:	87ea0a13          	addi	s4,s4,-1922 # 8a8 <malloc+0xe4>
    write(1, argv[i], strlen(argv[i]));
  32:	0004b903          	ld	s2,0(s1)
  36:	854a                	mv	a0,s2
  38:	00000097          	auipc	ra,0x0
  3c:	0ca080e7          	jalr	202(ra) # 102 <strlen>
  40:	0005061b          	sext.w	a2,a0
  44:	85ca                	mv	a1,s2
  46:	4505                	li	a0,1
  48:	00000097          	auipc	ra,0x0
  4c:	336080e7          	jalr	822(ra) # 37e <write>
    if(i + 1 < argc){
  50:	04a1                	addi	s1,s1,8
  52:	01348a63          	beq	s1,s3,66 <main+0x66>
      write(1, " ", 1);
  56:	4605                	li	a2,1
  58:	85d2                	mv	a1,s4
  5a:	4505                	li	a0,1
  5c:	00000097          	auipc	ra,0x0
  60:	322080e7          	jalr	802(ra) # 37e <write>
  for(i = 1; i < argc; i++){
  64:	b7f9                	j	32 <main+0x32>
    } else {
      write(1, "\n", 1);
  66:	4605                	li	a2,1
  68:	00001597          	auipc	a1,0x1
  6c:	84858593          	addi	a1,a1,-1976 # 8b0 <malloc+0xec>
  70:	4505                	li	a0,1
  72:	00000097          	auipc	ra,0x0
  76:	30c080e7          	jalr	780(ra) # 37e <write>
    }
  }
  exit(0);
  7a:	4501                	li	a0,0
  7c:	00000097          	auipc	ra,0x0
  80:	2e2080e7          	jalr	738(ra) # 35e <exit>

0000000000000084 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  84:	1141                	addi	sp,sp,-16
  86:	e422                	sd	s0,8(sp)
  88:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	87aa                	mv	a5,a0
  8c:	0585                	addi	a1,a1,1
  8e:	0785                	addi	a5,a5,1
  90:	fff5c703          	lbu	a4,-1(a1)
  94:	fee78fa3          	sb	a4,-1(a5)
  98:	fb75                	bnez	a4,8c <strcpy+0x8>
    ;
  return os;
}
  9a:	6422                	ld	s0,8(sp)
  9c:	0141                	addi	sp,sp,16
  9e:	8082                	ret

00000000000000a0 <strcat>:

char*
strcat(char *s, const char *t)
{
  a0:	1141                	addi	sp,sp,-16
  a2:	e422                	sd	s0,8(sp)
  a4:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  a6:	00054783          	lbu	a5,0(a0)
  aa:	c385                	beqz	a5,ca <strcat+0x2a>
  ac:	87aa                	mv	a5,a0
    s++;
  ae:	0785                	addi	a5,a5,1
  while(*s)
  b0:	0007c703          	lbu	a4,0(a5)
  b4:	ff6d                	bnez	a4,ae <strcat+0xe>
  while((*s++ = *t++))
  b6:	0585                	addi	a1,a1,1
  b8:	0785                	addi	a5,a5,1
  ba:	fff5c703          	lbu	a4,-1(a1)
  be:	fee78fa3          	sb	a4,-1(a5)
  c2:	fb75                	bnez	a4,b6 <strcat+0x16>
    ;
  return os;
}
  c4:	6422                	ld	s0,8(sp)
  c6:	0141                	addi	sp,sp,16
  c8:	8082                	ret
  while(*s)
  ca:	87aa                	mv	a5,a0
  cc:	b7ed                	j	b6 <strcat+0x16>

00000000000000ce <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ce:	1141                	addi	sp,sp,-16
  d0:	e422                	sd	s0,8(sp)
  d2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  d4:	00054783          	lbu	a5,0(a0)
  d8:	cf91                	beqz	a5,f4 <strcmp+0x26>
  da:	0005c703          	lbu	a4,0(a1)
  de:	00f71b63          	bne	a4,a5,f4 <strcmp+0x26>
    p++, q++;
  e2:	0505                	addi	a0,a0,1
  e4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  e6:	00054783          	lbu	a5,0(a0)
  ea:	c789                	beqz	a5,f4 <strcmp+0x26>
  ec:	0005c703          	lbu	a4,0(a1)
  f0:	fef709e3          	beq	a4,a5,e2 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
  f4:	0005c503          	lbu	a0,0(a1)
}
  f8:	40a7853b          	subw	a0,a5,a0
  fc:	6422                	ld	s0,8(sp)
  fe:	0141                	addi	sp,sp,16
 100:	8082                	ret

0000000000000102 <strlen>:

uint
strlen(const char *s)
{
 102:	1141                	addi	sp,sp,-16
 104:	e422                	sd	s0,8(sp)
 106:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 108:	00054783          	lbu	a5,0(a0)
 10c:	cf91                	beqz	a5,128 <strlen+0x26>
 10e:	0505                	addi	a0,a0,1
 110:	87aa                	mv	a5,a0
 112:	4685                	li	a3,1
 114:	9e89                	subw	a3,a3,a0
 116:	00f6853b          	addw	a0,a3,a5
 11a:	0785                	addi	a5,a5,1
 11c:	fff7c703          	lbu	a4,-1(a5)
 120:	fb7d                	bnez	a4,116 <strlen+0x14>
    ;
  return n;
}
 122:	6422                	ld	s0,8(sp)
 124:	0141                	addi	sp,sp,16
 126:	8082                	ret
  for(n = 0; s[n]; n++)
 128:	4501                	li	a0,0
 12a:	bfe5                	j	122 <strlen+0x20>

000000000000012c <memset>:

void*
memset(void *dst, int c, uint n)
{
 12c:	1141                	addi	sp,sp,-16
 12e:	e422                	sd	s0,8(sp)
 130:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 132:	ce09                	beqz	a2,14c <memset+0x20>
 134:	87aa                	mv	a5,a0
 136:	fff6071b          	addiw	a4,a2,-1
 13a:	1702                	slli	a4,a4,0x20
 13c:	9301                	srli	a4,a4,0x20
 13e:	0705                	addi	a4,a4,1
 140:	972a                	add	a4,a4,a0
    cdst[i] = c;
 142:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 146:	0785                	addi	a5,a5,1
 148:	fee79de3          	bne	a5,a4,142 <memset+0x16>
  }
  return dst;
}
 14c:	6422                	ld	s0,8(sp)
 14e:	0141                	addi	sp,sp,16
 150:	8082                	ret

0000000000000152 <strchr>:

char*
strchr(const char *s, char c)
{
 152:	1141                	addi	sp,sp,-16
 154:	e422                	sd	s0,8(sp)
 156:	0800                	addi	s0,sp,16
  for(; *s; s++)
 158:	00054783          	lbu	a5,0(a0)
 15c:	cf91                	beqz	a5,178 <strchr+0x26>
    if(*s == c)
 15e:	00f58a63          	beq	a1,a5,172 <strchr+0x20>
  for(; *s; s++)
 162:	0505                	addi	a0,a0,1
 164:	00054783          	lbu	a5,0(a0)
 168:	c781                	beqz	a5,170 <strchr+0x1e>
    if(*s == c)
 16a:	feb79ce3          	bne	a5,a1,162 <strchr+0x10>
 16e:	a011                	j	172 <strchr+0x20>
      return (char*)s;
  return 0;
 170:	4501                	li	a0,0
}
 172:	6422                	ld	s0,8(sp)
 174:	0141                	addi	sp,sp,16
 176:	8082                	ret
  return 0;
 178:	4501                	li	a0,0
 17a:	bfe5                	j	172 <strchr+0x20>

000000000000017c <gets>:

char*
gets(char *buf, int max)
{
 17c:	711d                	addi	sp,sp,-96
 17e:	ec86                	sd	ra,88(sp)
 180:	e8a2                	sd	s0,80(sp)
 182:	e4a6                	sd	s1,72(sp)
 184:	e0ca                	sd	s2,64(sp)
 186:	fc4e                	sd	s3,56(sp)
 188:	f852                	sd	s4,48(sp)
 18a:	f456                	sd	s5,40(sp)
 18c:	f05a                	sd	s6,32(sp)
 18e:	ec5e                	sd	s7,24(sp)
 190:	e862                	sd	s8,16(sp)
 192:	1080                	addi	s0,sp,96
 194:	8c2a                	mv	s8,a0
 196:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 198:	892a                	mv	s2,a0
 19a:	4981                	li	s3,0
    cc = read(0, &c, 1);
 19c:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1a0:	4b29                	li	s6,10
 1a2:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 1a4:	0019849b          	addiw	s1,s3,1
 1a8:	0344d763          	ble	s4,s1,1d6 <gets+0x5a>
    cc = read(0, &c, 1);
 1ac:	4605                	li	a2,1
 1ae:	85d6                	mv	a1,s5
 1b0:	4501                	li	a0,0
 1b2:	00000097          	auipc	ra,0x0
 1b6:	1c4080e7          	jalr	452(ra) # 376 <read>
    if(cc < 1)
 1ba:	00a05e63          	blez	a0,1d6 <gets+0x5a>
    buf[i++] = c;
 1be:	faf44783          	lbu	a5,-81(s0)
 1c2:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1c6:	01678763          	beq	a5,s6,1d4 <gets+0x58>
 1ca:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 1cc:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 1ce:	fd779be3          	bne	a5,s7,1a4 <gets+0x28>
 1d2:	a011                	j	1d6 <gets+0x5a>
  for(i=0; i+1 < max; ){
 1d4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1d6:	99e2                	add	s3,s3,s8
 1d8:	00098023          	sb	zero,0(s3)
  return buf;
}
 1dc:	8562                	mv	a0,s8
 1de:	60e6                	ld	ra,88(sp)
 1e0:	6446                	ld	s0,80(sp)
 1e2:	64a6                	ld	s1,72(sp)
 1e4:	6906                	ld	s2,64(sp)
 1e6:	79e2                	ld	s3,56(sp)
 1e8:	7a42                	ld	s4,48(sp)
 1ea:	7aa2                	ld	s5,40(sp)
 1ec:	7b02                	ld	s6,32(sp)
 1ee:	6be2                	ld	s7,24(sp)
 1f0:	6c42                	ld	s8,16(sp)
 1f2:	6125                	addi	sp,sp,96
 1f4:	8082                	ret

00000000000001f6 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f6:	1101                	addi	sp,sp,-32
 1f8:	ec06                	sd	ra,24(sp)
 1fa:	e822                	sd	s0,16(sp)
 1fc:	e426                	sd	s1,8(sp)
 1fe:	e04a                	sd	s2,0(sp)
 200:	1000                	addi	s0,sp,32
 202:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 204:	4581                	li	a1,0
 206:	00000097          	auipc	ra,0x0
 20a:	198080e7          	jalr	408(ra) # 39e <open>
  if(fd < 0)
 20e:	02054563          	bltz	a0,238 <stat+0x42>
 212:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 214:	85ca                	mv	a1,s2
 216:	00000097          	auipc	ra,0x0
 21a:	190080e7          	jalr	400(ra) # 3a6 <fstat>
 21e:	892a                	mv	s2,a0
  close(fd);
 220:	8526                	mv	a0,s1
 222:	00000097          	auipc	ra,0x0
 226:	164080e7          	jalr	356(ra) # 386 <close>
  return r;
}
 22a:	854a                	mv	a0,s2
 22c:	60e2                	ld	ra,24(sp)
 22e:	6442                	ld	s0,16(sp)
 230:	64a2                	ld	s1,8(sp)
 232:	6902                	ld	s2,0(sp)
 234:	6105                	addi	sp,sp,32
 236:	8082                	ret
    return -1;
 238:	597d                	li	s2,-1
 23a:	bfc5                	j	22a <stat+0x34>

000000000000023c <atoi>:

int
atoi(const char *s)
{
 23c:	1141                	addi	sp,sp,-16
 23e:	e422                	sd	s0,8(sp)
 240:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 242:	00054703          	lbu	a4,0(a0)
 246:	02d00793          	li	a5,45
  int neg = 1;
 24a:	4805                	li	a6,1
  if (*s == '-') {
 24c:	04f70363          	beq	a4,a5,292 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 250:	00054683          	lbu	a3,0(a0)
 254:	fd06879b          	addiw	a5,a3,-48
 258:	0ff7f793          	andi	a5,a5,255
 25c:	4725                	li	a4,9
 25e:	02f76d63          	bltu	a4,a5,298 <atoi+0x5c>
  n = 0;
 262:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 264:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 266:	0505                	addi	a0,a0,1
 268:	0026179b          	slliw	a5,a2,0x2
 26c:	9fb1                	addw	a5,a5,a2
 26e:	0017979b          	slliw	a5,a5,0x1
 272:	9fb5                	addw	a5,a5,a3
 274:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 278:	00054683          	lbu	a3,0(a0)
 27c:	fd06871b          	addiw	a4,a3,-48
 280:	0ff77713          	andi	a4,a4,255
 284:	fee5f1e3          	bleu	a4,a1,266 <atoi+0x2a>
  return n * neg;
}
 288:	02c8053b          	mulw	a0,a6,a2
 28c:	6422                	ld	s0,8(sp)
 28e:	0141                	addi	sp,sp,16
 290:	8082                	ret
    s++;
 292:	0505                	addi	a0,a0,1
    neg = -1;
 294:	587d                	li	a6,-1
 296:	bf6d                	j	250 <atoi+0x14>
  n = 0;
 298:	4601                	li	a2,0
 29a:	b7fd                	j	288 <atoi+0x4c>

000000000000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	1141                	addi	sp,sp,-16
 29e:	e422                	sd	s0,8(sp)
 2a0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2a2:	02b57663          	bleu	a1,a0,2ce <memmove+0x32>
    while(n-- > 0)
 2a6:	02c05163          	blez	a2,2c8 <memmove+0x2c>
 2aa:	fff6079b          	addiw	a5,a2,-1
 2ae:	1782                	slli	a5,a5,0x20
 2b0:	9381                	srli	a5,a5,0x20
 2b2:	0785                	addi	a5,a5,1
 2b4:	97aa                	add	a5,a5,a0
  dst = vdst;
 2b6:	872a                	mv	a4,a0
      *dst++ = *src++;
 2b8:	0585                	addi	a1,a1,1
 2ba:	0705                	addi	a4,a4,1
 2bc:	fff5c683          	lbu	a3,-1(a1)
 2c0:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2c4:	fee79ae3          	bne	a5,a4,2b8 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2c8:	6422                	ld	s0,8(sp)
 2ca:	0141                	addi	sp,sp,16
 2cc:	8082                	ret
    dst += n;
 2ce:	00c50733          	add	a4,a0,a2
    src += n;
 2d2:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2d4:	fec05ae3          	blez	a2,2c8 <memmove+0x2c>
 2d8:	fff6079b          	addiw	a5,a2,-1
 2dc:	1782                	slli	a5,a5,0x20
 2de:	9381                	srli	a5,a5,0x20
 2e0:	fff7c793          	not	a5,a5
 2e4:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2e6:	15fd                	addi	a1,a1,-1
 2e8:	177d                	addi	a4,a4,-1
 2ea:	0005c683          	lbu	a3,0(a1)
 2ee:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2f2:	fef71ae3          	bne	a4,a5,2e6 <memmove+0x4a>
 2f6:	bfc9                	j	2c8 <memmove+0x2c>

00000000000002f8 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2f8:	1141                	addi	sp,sp,-16
 2fa:	e422                	sd	s0,8(sp)
 2fc:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2fe:	ce15                	beqz	a2,33a <memcmp+0x42>
 300:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 304:	00054783          	lbu	a5,0(a0)
 308:	0005c703          	lbu	a4,0(a1)
 30c:	02e79063          	bne	a5,a4,32c <memcmp+0x34>
 310:	1682                	slli	a3,a3,0x20
 312:	9281                	srli	a3,a3,0x20
 314:	0685                	addi	a3,a3,1
 316:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 318:	0505                	addi	a0,a0,1
    p2++;
 31a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 31c:	00d50d63          	beq	a0,a3,336 <memcmp+0x3e>
    if (*p1 != *p2) {
 320:	00054783          	lbu	a5,0(a0)
 324:	0005c703          	lbu	a4,0(a1)
 328:	fee788e3          	beq	a5,a4,318 <memcmp+0x20>
      return *p1 - *p2;
 32c:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 330:	6422                	ld	s0,8(sp)
 332:	0141                	addi	sp,sp,16
 334:	8082                	ret
  return 0;
 336:	4501                	li	a0,0
 338:	bfe5                	j	330 <memcmp+0x38>
 33a:	4501                	li	a0,0
 33c:	bfd5                	j	330 <memcmp+0x38>

000000000000033e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 33e:	1141                	addi	sp,sp,-16
 340:	e406                	sd	ra,8(sp)
 342:	e022                	sd	s0,0(sp)
 344:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 346:	00000097          	auipc	ra,0x0
 34a:	f56080e7          	jalr	-170(ra) # 29c <memmove>
}
 34e:	60a2                	ld	ra,8(sp)
 350:	6402                	ld	s0,0(sp)
 352:	0141                	addi	sp,sp,16
 354:	8082                	ret

0000000000000356 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 356:	4885                	li	a7,1
 ecall
 358:	00000073          	ecall
 ret
 35c:	8082                	ret

000000000000035e <exit>:
.global exit
exit:
 li a7, SYS_exit
 35e:	4889                	li	a7,2
 ecall
 360:	00000073          	ecall
 ret
 364:	8082                	ret

0000000000000366 <wait>:
.global wait
wait:
 li a7, SYS_wait
 366:	488d                	li	a7,3
 ecall
 368:	00000073          	ecall
 ret
 36c:	8082                	ret

000000000000036e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 36e:	4891                	li	a7,4
 ecall
 370:	00000073          	ecall
 ret
 374:	8082                	ret

0000000000000376 <read>:
.global read
read:
 li a7, SYS_read
 376:	4895                	li	a7,5
 ecall
 378:	00000073          	ecall
 ret
 37c:	8082                	ret

000000000000037e <write>:
.global write
write:
 li a7, SYS_write
 37e:	48c1                	li	a7,16
 ecall
 380:	00000073          	ecall
 ret
 384:	8082                	ret

0000000000000386 <close>:
.global close
close:
 li a7, SYS_close
 386:	48d5                	li	a7,21
 ecall
 388:	00000073          	ecall
 ret
 38c:	8082                	ret

000000000000038e <kill>:
.global kill
kill:
 li a7, SYS_kill
 38e:	4899                	li	a7,6
 ecall
 390:	00000073          	ecall
 ret
 394:	8082                	ret

0000000000000396 <exec>:
.global exec
exec:
 li a7, SYS_exec
 396:	489d                	li	a7,7
 ecall
 398:	00000073          	ecall
 ret
 39c:	8082                	ret

000000000000039e <open>:
.global open
open:
 li a7, SYS_open
 39e:	48bd                	li	a7,15
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3a6:	48a1                	li	a7,8
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3ae:	48d1                	li	a7,20
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3b6:	48a5                	li	a7,9
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <dup>:
.global dup
dup:
 li a7, SYS_dup
 3be:	48a9                	li	a7,10
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3c6:	48ad                	li	a7,11
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3ce:	48b1                	li	a7,12
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3d6:	48b5                	li	a7,13
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3de:	48b9                	li	a7,14
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3e6:	48d9                	li	a7,22
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <dev>:
.global dev
dev:
 li a7, SYS_dev
 3ee:	48dd                	li	a7,23
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3f6:	48e1                	li	a7,24
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3fe:	48e5                	li	a7,25
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <remove>:
.global remove
remove:
 li a7, SYS_remove
 406:	48c5                	li	a7,17
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <trace>:
.global trace
trace:
 li a7, SYS_trace
 40e:	48c9                	li	a7,18
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 416:	48cd                	li	a7,19
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <rename>:
.global rename
rename:
 li a7, SYS_rename
 41e:	48e9                	li	a7,26
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 426:	48ed                	li	a7,27
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 42e:	1101                	addi	sp,sp,-32
 430:	ec06                	sd	ra,24(sp)
 432:	e822                	sd	s0,16(sp)
 434:	1000                	addi	s0,sp,32
 436:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 43a:	4605                	li	a2,1
 43c:	fef40593          	addi	a1,s0,-17
 440:	00000097          	auipc	ra,0x0
 444:	f3e080e7          	jalr	-194(ra) # 37e <write>
}
 448:	60e2                	ld	ra,24(sp)
 44a:	6442                	ld	s0,16(sp)
 44c:	6105                	addi	sp,sp,32
 44e:	8082                	ret

0000000000000450 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	7139                	addi	sp,sp,-64
 452:	fc06                	sd	ra,56(sp)
 454:	f822                	sd	s0,48(sp)
 456:	f426                	sd	s1,40(sp)
 458:	f04a                	sd	s2,32(sp)
 45a:	ec4e                	sd	s3,24(sp)
 45c:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45e:	c299                	beqz	a3,464 <printint+0x14>
 460:	0005ce63          	bltz	a1,47c <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 464:	2581                	sext.w	a1,a1
  neg = 0;
 466:	4301                	li	t1,0
  }

  i = 0;
 468:	fc040913          	addi	s2,s0,-64
  neg = 0;
 46c:	874a                	mv	a4,s2
  i = 0;
 46e:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 470:	2601                	sext.w	a2,a2
 472:	00000897          	auipc	a7,0x0
 476:	44688893          	addi	a7,a7,1094 # 8b8 <digits>
 47a:	a801                	j	48a <printint+0x3a>
    x = -xx;
 47c:	40b005bb          	negw	a1,a1
 480:	2581                	sext.w	a1,a1
    neg = 1;
 482:	4305                	li	t1,1
    x = -xx;
 484:	b7d5                	j	468 <printint+0x18>
  }while((x /= base) != 0);
 486:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 488:	8836                	mv	a6,a3
 48a:	0018069b          	addiw	a3,a6,1
 48e:	02c5f7bb          	remuw	a5,a1,a2
 492:	1782                	slli	a5,a5,0x20
 494:	9381                	srli	a5,a5,0x20
 496:	97c6                	add	a5,a5,a7
 498:	0007c783          	lbu	a5,0(a5)
 49c:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 4a0:	0705                	addi	a4,a4,1
 4a2:	02c5d7bb          	divuw	a5,a1,a2
 4a6:	fec5f0e3          	bleu	a2,a1,486 <printint+0x36>
  if(neg)
 4aa:	00030b63          	beqz	t1,4c0 <printint+0x70>
    buf[i++] = '-';
 4ae:	fd040793          	addi	a5,s0,-48
 4b2:	96be                	add	a3,a3,a5
 4b4:	02d00793          	li	a5,45
 4b8:	fef68823          	sb	a5,-16(a3)
 4bc:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 4c0:	02d05763          	blez	a3,4ee <printint+0x9e>
 4c4:	89aa                	mv	s3,a0
 4c6:	fc040493          	addi	s1,s0,-64
 4ca:	94b6                	add	s1,s1,a3
 4cc:	197d                	addi	s2,s2,-1
 4ce:	9936                	add	s2,s2,a3
 4d0:	36fd                	addiw	a3,a3,-1
 4d2:	1682                	slli	a3,a3,0x20
 4d4:	9281                	srli	a3,a3,0x20
 4d6:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 4da:	fff4c583          	lbu	a1,-1(s1)
 4de:	854e                	mv	a0,s3
 4e0:	00000097          	auipc	ra,0x0
 4e4:	f4e080e7          	jalr	-178(ra) # 42e <putc>
  while(--i >= 0)
 4e8:	14fd                	addi	s1,s1,-1
 4ea:	ff2498e3          	bne	s1,s2,4da <printint+0x8a>
}
 4ee:	70e2                	ld	ra,56(sp)
 4f0:	7442                	ld	s0,48(sp)
 4f2:	74a2                	ld	s1,40(sp)
 4f4:	7902                	ld	s2,32(sp)
 4f6:	69e2                	ld	s3,24(sp)
 4f8:	6121                	addi	sp,sp,64
 4fa:	8082                	ret

00000000000004fc <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4fc:	7119                	addi	sp,sp,-128
 4fe:	fc86                	sd	ra,120(sp)
 500:	f8a2                	sd	s0,112(sp)
 502:	f4a6                	sd	s1,104(sp)
 504:	f0ca                	sd	s2,96(sp)
 506:	ecce                	sd	s3,88(sp)
 508:	e8d2                	sd	s4,80(sp)
 50a:	e4d6                	sd	s5,72(sp)
 50c:	e0da                	sd	s6,64(sp)
 50e:	fc5e                	sd	s7,56(sp)
 510:	f862                	sd	s8,48(sp)
 512:	f466                	sd	s9,40(sp)
 514:	f06a                	sd	s10,32(sp)
 516:	ec6e                	sd	s11,24(sp)
 518:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 51a:	0005c483          	lbu	s1,0(a1)
 51e:	18048d63          	beqz	s1,6b8 <vprintf+0x1bc>
 522:	8aaa                	mv	s5,a0
 524:	8b32                	mv	s6,a2
 526:	00158913          	addi	s2,a1,1
  state = 0;
 52a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 52c:	02500a13          	li	s4,37
      if(c == 'd'){
 530:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 534:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 538:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 53c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 540:	00000b97          	auipc	s7,0x0
 544:	378b8b93          	addi	s7,s7,888 # 8b8 <digits>
 548:	a839                	j	566 <vprintf+0x6a>
        putc(fd, c);
 54a:	85a6                	mv	a1,s1
 54c:	8556                	mv	a0,s5
 54e:	00000097          	auipc	ra,0x0
 552:	ee0080e7          	jalr	-288(ra) # 42e <putc>
 556:	a019                	j	55c <vprintf+0x60>
    } else if(state == '%'){
 558:	01498f63          	beq	s3,s4,576 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 55c:	0905                	addi	s2,s2,1
 55e:	fff94483          	lbu	s1,-1(s2)
 562:	14048b63          	beqz	s1,6b8 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 566:	0004879b          	sext.w	a5,s1
    if(state == 0){
 56a:	fe0997e3          	bnez	s3,558 <vprintf+0x5c>
      if(c == '%'){
 56e:	fd479ee3          	bne	a5,s4,54a <vprintf+0x4e>
        state = '%';
 572:	89be                	mv	s3,a5
 574:	b7e5                	j	55c <vprintf+0x60>
      if(c == 'd'){
 576:	05878063          	beq	a5,s8,5b6 <vprintf+0xba>
      } else if(c == 'l') {
 57a:	05978c63          	beq	a5,s9,5d2 <vprintf+0xd6>
      } else if(c == 'x') {
 57e:	07a78863          	beq	a5,s10,5ee <vprintf+0xf2>
      } else if(c == 'p') {
 582:	09b78463          	beq	a5,s11,60a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 586:	07300713          	li	a4,115
 58a:	0ce78563          	beq	a5,a4,654 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58e:	06300713          	li	a4,99
 592:	0ee78c63          	beq	a5,a4,68a <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 596:	11478663          	beq	a5,s4,6a2 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59a:	85d2                	mv	a1,s4
 59c:	8556                	mv	a0,s5
 59e:	00000097          	auipc	ra,0x0
 5a2:	e90080e7          	jalr	-368(ra) # 42e <putc>
        putc(fd, c);
 5a6:	85a6                	mv	a1,s1
 5a8:	8556                	mv	a0,s5
 5aa:	00000097          	auipc	ra,0x0
 5ae:	e84080e7          	jalr	-380(ra) # 42e <putc>
      }
      state = 0;
 5b2:	4981                	li	s3,0
 5b4:	b765                	j	55c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 5b6:	008b0493          	addi	s1,s6,8
 5ba:	4685                	li	a3,1
 5bc:	4629                	li	a2,10
 5be:	000b2583          	lw	a1,0(s6)
 5c2:	8556                	mv	a0,s5
 5c4:	00000097          	auipc	ra,0x0
 5c8:	e8c080e7          	jalr	-372(ra) # 450 <printint>
 5cc:	8b26                	mv	s6,s1
      state = 0;
 5ce:	4981                	li	s3,0
 5d0:	b771                	j	55c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5d2:	008b0493          	addi	s1,s6,8
 5d6:	4681                	li	a3,0
 5d8:	4629                	li	a2,10
 5da:	000b2583          	lw	a1,0(s6)
 5de:	8556                	mv	a0,s5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	e70080e7          	jalr	-400(ra) # 450 <printint>
 5e8:	8b26                	mv	s6,s1
      state = 0;
 5ea:	4981                	li	s3,0
 5ec:	bf85                	j	55c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5ee:	008b0493          	addi	s1,s6,8
 5f2:	4681                	li	a3,0
 5f4:	4641                	li	a2,16
 5f6:	000b2583          	lw	a1,0(s6)
 5fa:	8556                	mv	a0,s5
 5fc:	00000097          	auipc	ra,0x0
 600:	e54080e7          	jalr	-428(ra) # 450 <printint>
 604:	8b26                	mv	s6,s1
      state = 0;
 606:	4981                	li	s3,0
 608:	bf91                	j	55c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 60a:	008b0793          	addi	a5,s6,8
 60e:	f8f43423          	sd	a5,-120(s0)
 612:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 616:	03000593          	li	a1,48
 61a:	8556                	mv	a0,s5
 61c:	00000097          	auipc	ra,0x0
 620:	e12080e7          	jalr	-494(ra) # 42e <putc>
  putc(fd, 'x');
 624:	85ea                	mv	a1,s10
 626:	8556                	mv	a0,s5
 628:	00000097          	auipc	ra,0x0
 62c:	e06080e7          	jalr	-506(ra) # 42e <putc>
 630:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 632:	03c9d793          	srli	a5,s3,0x3c
 636:	97de                	add	a5,a5,s7
 638:	0007c583          	lbu	a1,0(a5)
 63c:	8556                	mv	a0,s5
 63e:	00000097          	auipc	ra,0x0
 642:	df0080e7          	jalr	-528(ra) # 42e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 646:	0992                	slli	s3,s3,0x4
 648:	34fd                	addiw	s1,s1,-1
 64a:	f4e5                	bnez	s1,632 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 64c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 650:	4981                	li	s3,0
 652:	b729                	j	55c <vprintf+0x60>
        s = va_arg(ap, char*);
 654:	008b0993          	addi	s3,s6,8
 658:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 65c:	c085                	beqz	s1,67c <vprintf+0x180>
        while(*s != 0){
 65e:	0004c583          	lbu	a1,0(s1)
 662:	c9a1                	beqz	a1,6b2 <vprintf+0x1b6>
          putc(fd, *s);
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	dc8080e7          	jalr	-568(ra) # 42e <putc>
          s++;
 66e:	0485                	addi	s1,s1,1
        while(*s != 0){
 670:	0004c583          	lbu	a1,0(s1)
 674:	f9e5                	bnez	a1,664 <vprintf+0x168>
        s = va_arg(ap, char*);
 676:	8b4e                	mv	s6,s3
      state = 0;
 678:	4981                	li	s3,0
 67a:	b5cd                	j	55c <vprintf+0x60>
          s = "(null)";
 67c:	00000497          	auipc	s1,0x0
 680:	25448493          	addi	s1,s1,596 # 8d0 <digits+0x18>
        while(*s != 0){
 684:	02800593          	li	a1,40
 688:	bff1                	j	664 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 68a:	008b0493          	addi	s1,s6,8
 68e:	000b4583          	lbu	a1,0(s6)
 692:	8556                	mv	a0,s5
 694:	00000097          	auipc	ra,0x0
 698:	d9a080e7          	jalr	-614(ra) # 42e <putc>
 69c:	8b26                	mv	s6,s1
      state = 0;
 69e:	4981                	li	s3,0
 6a0:	bd75                	j	55c <vprintf+0x60>
        putc(fd, c);
 6a2:	85d2                	mv	a1,s4
 6a4:	8556                	mv	a0,s5
 6a6:	00000097          	auipc	ra,0x0
 6aa:	d88080e7          	jalr	-632(ra) # 42e <putc>
      state = 0;
 6ae:	4981                	li	s3,0
 6b0:	b575                	j	55c <vprintf+0x60>
        s = va_arg(ap, char*);
 6b2:	8b4e                	mv	s6,s3
      state = 0;
 6b4:	4981                	li	s3,0
 6b6:	b55d                	j	55c <vprintf+0x60>
    }
  }
}
 6b8:	70e6                	ld	ra,120(sp)
 6ba:	7446                	ld	s0,112(sp)
 6bc:	74a6                	ld	s1,104(sp)
 6be:	7906                	ld	s2,96(sp)
 6c0:	69e6                	ld	s3,88(sp)
 6c2:	6a46                	ld	s4,80(sp)
 6c4:	6aa6                	ld	s5,72(sp)
 6c6:	6b06                	ld	s6,64(sp)
 6c8:	7be2                	ld	s7,56(sp)
 6ca:	7c42                	ld	s8,48(sp)
 6cc:	7ca2                	ld	s9,40(sp)
 6ce:	7d02                	ld	s10,32(sp)
 6d0:	6de2                	ld	s11,24(sp)
 6d2:	6109                	addi	sp,sp,128
 6d4:	8082                	ret

00000000000006d6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6d6:	715d                	addi	sp,sp,-80
 6d8:	ec06                	sd	ra,24(sp)
 6da:	e822                	sd	s0,16(sp)
 6dc:	1000                	addi	s0,sp,32
 6de:	e010                	sd	a2,0(s0)
 6e0:	e414                	sd	a3,8(s0)
 6e2:	e818                	sd	a4,16(s0)
 6e4:	ec1c                	sd	a5,24(s0)
 6e6:	03043023          	sd	a6,32(s0)
 6ea:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6ee:	8622                	mv	a2,s0
 6f0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6f4:	00000097          	auipc	ra,0x0
 6f8:	e08080e7          	jalr	-504(ra) # 4fc <vprintf>
}
 6fc:	60e2                	ld	ra,24(sp)
 6fe:	6442                	ld	s0,16(sp)
 700:	6161                	addi	sp,sp,80
 702:	8082                	ret

0000000000000704 <printf>:

void
printf(const char *fmt, ...)
{
 704:	711d                	addi	sp,sp,-96
 706:	ec06                	sd	ra,24(sp)
 708:	e822                	sd	s0,16(sp)
 70a:	1000                	addi	s0,sp,32
 70c:	e40c                	sd	a1,8(s0)
 70e:	e810                	sd	a2,16(s0)
 710:	ec14                	sd	a3,24(s0)
 712:	f018                	sd	a4,32(s0)
 714:	f41c                	sd	a5,40(s0)
 716:	03043823          	sd	a6,48(s0)
 71a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 71e:	00840613          	addi	a2,s0,8
 722:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 726:	85aa                	mv	a1,a0
 728:	4505                	li	a0,1
 72a:	00000097          	auipc	ra,0x0
 72e:	dd2080e7          	jalr	-558(ra) # 4fc <vprintf>
}
 732:	60e2                	ld	ra,24(sp)
 734:	6442                	ld	s0,16(sp)
 736:	6125                	addi	sp,sp,96
 738:	8082                	ret

000000000000073a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73a:	1141                	addi	sp,sp,-16
 73c:	e422                	sd	s0,8(sp)
 73e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 740:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 744:	00000797          	auipc	a5,0x0
 748:	19478793          	addi	a5,a5,404 # 8d8 <__bss_start>
 74c:	639c                	ld	a5,0(a5)
 74e:	a805                	j	77e <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 750:	4618                	lw	a4,8(a2)
 752:	9db9                	addw	a1,a1,a4
 754:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 758:	6398                	ld	a4,0(a5)
 75a:	6318                	ld	a4,0(a4)
 75c:	fee53823          	sd	a4,-16(a0)
 760:	a091                	j	7a4 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 762:	ff852703          	lw	a4,-8(a0)
 766:	9e39                	addw	a2,a2,a4
 768:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 76a:	ff053703          	ld	a4,-16(a0)
 76e:	e398                	sd	a4,0(a5)
 770:	a099                	j	7b6 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 772:	6398                	ld	a4,0(a5)
 774:	00e7e463          	bltu	a5,a4,77c <free+0x42>
 778:	00e6ea63          	bltu	a3,a4,78c <free+0x52>
{
 77c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77e:	fed7fae3          	bleu	a3,a5,772 <free+0x38>
 782:	6398                	ld	a4,0(a5)
 784:	00e6e463          	bltu	a3,a4,78c <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	fee7eae3          	bltu	a5,a4,77c <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 78c:	ff852583          	lw	a1,-8(a0)
 790:	6390                	ld	a2,0(a5)
 792:	02059713          	slli	a4,a1,0x20
 796:	9301                	srli	a4,a4,0x20
 798:	0712                	slli	a4,a4,0x4
 79a:	9736                	add	a4,a4,a3
 79c:	fae60ae3          	beq	a2,a4,750 <free+0x16>
    bp->s.ptr = p->s.ptr;
 7a0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7a4:	4790                	lw	a2,8(a5)
 7a6:	02061713          	slli	a4,a2,0x20
 7aa:	9301                	srli	a4,a4,0x20
 7ac:	0712                	slli	a4,a4,0x4
 7ae:	973e                	add	a4,a4,a5
 7b0:	fae689e3          	beq	a3,a4,762 <free+0x28>
  } else
    p->s.ptr = bp;
 7b4:	e394                	sd	a3,0(a5)
  freep = p;
 7b6:	00000717          	auipc	a4,0x0
 7ba:	12f73123          	sd	a5,290(a4) # 8d8 <__bss_start>
}
 7be:	6422                	ld	s0,8(sp)
 7c0:	0141                	addi	sp,sp,16
 7c2:	8082                	ret

00000000000007c4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c4:	7139                	addi	sp,sp,-64
 7c6:	fc06                	sd	ra,56(sp)
 7c8:	f822                	sd	s0,48(sp)
 7ca:	f426                	sd	s1,40(sp)
 7cc:	f04a                	sd	s2,32(sp)
 7ce:	ec4e                	sd	s3,24(sp)
 7d0:	e852                	sd	s4,16(sp)
 7d2:	e456                	sd	s5,8(sp)
 7d4:	e05a                	sd	s6,0(sp)
 7d6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d8:	02051993          	slli	s3,a0,0x20
 7dc:	0209d993          	srli	s3,s3,0x20
 7e0:	09bd                	addi	s3,s3,15
 7e2:	0049d993          	srli	s3,s3,0x4
 7e6:	2985                	addiw	s3,s3,1
 7e8:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 7ec:	00000797          	auipc	a5,0x0
 7f0:	0ec78793          	addi	a5,a5,236 # 8d8 <__bss_start>
 7f4:	6388                	ld	a0,0(a5)
 7f6:	c515                	beqz	a0,822 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7fa:	4798                	lw	a4,8(a5)
 7fc:	03277d63          	bleu	s2,a4,836 <malloc+0x72>
 800:	8a4e                	mv	s4,s3
 802:	0009871b          	sext.w	a4,s3
 806:	6685                	lui	a3,0x1
 808:	00d77363          	bleu	a3,a4,80e <malloc+0x4a>
 80c:	6a05                	lui	s4,0x1
 80e:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 812:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 816:	00000497          	auipc	s1,0x0
 81a:	0c248493          	addi	s1,s1,194 # 8d8 <__bss_start>
  if(p == (char*)-1)
 81e:	5b7d                	li	s6,-1
 820:	a0b5                	j	88c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 822:	00000717          	auipc	a4,0x0
 826:	0be70713          	addi	a4,a4,190 # 8e0 <base>
 82a:	e398                	sd	a4,0(a5)
 82c:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 82e:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 832:	87ba                	mv	a5,a4
 834:	b7f1                	j	800 <malloc+0x3c>
      if(p->s.size == nunits)
 836:	02e90b63          	beq	s2,a4,86c <malloc+0xa8>
        p->s.size -= nunits;
 83a:	4137073b          	subw	a4,a4,s3
 83e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 840:	1702                	slli	a4,a4,0x20
 842:	9301                	srli	a4,a4,0x20
 844:	0712                	slli	a4,a4,0x4
 846:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 848:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 84c:	00000717          	auipc	a4,0x0
 850:	08a73623          	sd	a0,140(a4) # 8d8 <__bss_start>
      return (void*)(p + 1);
 854:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 858:	70e2                	ld	ra,56(sp)
 85a:	7442                	ld	s0,48(sp)
 85c:	74a2                	ld	s1,40(sp)
 85e:	7902                	ld	s2,32(sp)
 860:	69e2                	ld	s3,24(sp)
 862:	6a42                	ld	s4,16(sp)
 864:	6aa2                	ld	s5,8(sp)
 866:	6b02                	ld	s6,0(sp)
 868:	6121                	addi	sp,sp,64
 86a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 86c:	6398                	ld	a4,0(a5)
 86e:	e118                	sd	a4,0(a0)
 870:	bff1                	j	84c <malloc+0x88>
  hp->s.size = nu;
 872:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 876:	0541                	addi	a0,a0,16
 878:	00000097          	auipc	ra,0x0
 87c:	ec2080e7          	jalr	-318(ra) # 73a <free>
  return freep;
 880:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 882:	d979                	beqz	a0,858 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 884:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 886:	4798                	lw	a4,8(a5)
 888:	fb2777e3          	bleu	s2,a4,836 <malloc+0x72>
    if(p == freep)
 88c:	6098                	ld	a4,0(s1)
 88e:	853e                	mv	a0,a5
 890:	fef71ae3          	bne	a4,a5,884 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 894:	8552                	mv	a0,s4
 896:	00000097          	auipc	ra,0x0
 89a:	b38080e7          	jalr	-1224(ra) # 3ce <sbrk>
  if(p == (char*)-1)
 89e:	fd651ae3          	bne	a0,s6,872 <malloc+0xae>
        return 0;
 8a2:	4501                	li	a0,0
 8a4:	bf55                	j	858 <malloc+0x94>
