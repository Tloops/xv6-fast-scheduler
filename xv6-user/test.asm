
xv6-user/_test:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "kernel/include/sysinfo.h"
#include "xv6-user/user.h"

int main()
{
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	1000                	addi	s0,sp,32
    struct sysinfo info;
    if (sysinfo(&info) < 0) {
   8:	fe040513          	addi	a0,s0,-32
   c:	00000097          	auipc	ra,0x0
  10:	3e4080e7          	jalr	996(ra) # 3f0 <sysinfo>
  14:	02054c63          	bltz	a0,4c <main+0x4c>
        printf("sysinfo fail!\n");
    } else {
        printf("memory left: %d KB\n", info.freemem >> 10);
  18:	fe043583          	ld	a1,-32(s0)
  1c:	81a9                	srli	a1,a1,0xa
  1e:	00001517          	auipc	a0,0x1
  22:	87250513          	addi	a0,a0,-1934 # 890 <malloc+0xf2>
  26:	00000097          	auipc	ra,0x0
  2a:	6b8080e7          	jalr	1720(ra) # 6de <printf>
        printf("process amount: %d\n", info.nproc);
  2e:	fe843583          	ld	a1,-24(s0)
  32:	00001517          	auipc	a0,0x1
  36:	87650513          	addi	a0,a0,-1930 # 8a8 <malloc+0x10a>
  3a:	00000097          	auipc	ra,0x0
  3e:	6a4080e7          	jalr	1700(ra) # 6de <printf>
    }
    exit(0);
  42:	4501                	li	a0,0
  44:	00000097          	auipc	ra,0x0
  48:	2f4080e7          	jalr	756(ra) # 338 <exit>
        printf("sysinfo fail!\n");
  4c:	00001517          	auipc	a0,0x1
  50:	83450513          	addi	a0,a0,-1996 # 880 <malloc+0xe2>
  54:	00000097          	auipc	ra,0x0
  58:	68a080e7          	jalr	1674(ra) # 6de <printf>
  5c:	b7dd                	j	42 <main+0x42>

000000000000005e <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  5e:	1141                	addi	sp,sp,-16
  60:	e422                	sd	s0,8(sp)
  62:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	87aa                	mv	a5,a0
  66:	0585                	addi	a1,a1,1
  68:	0785                	addi	a5,a5,1
  6a:	fff5c703          	lbu	a4,-1(a1)
  6e:	fee78fa3          	sb	a4,-1(a5)
  72:	fb75                	bnez	a4,66 <strcpy+0x8>
    ;
  return os;
}
  74:	6422                	ld	s0,8(sp)
  76:	0141                	addi	sp,sp,16
  78:	8082                	ret

000000000000007a <strcat>:

char*
strcat(char *s, const char *t)
{
  7a:	1141                	addi	sp,sp,-16
  7c:	e422                	sd	s0,8(sp)
  7e:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  80:	00054783          	lbu	a5,0(a0)
  84:	c385                	beqz	a5,a4 <strcat+0x2a>
  86:	87aa                	mv	a5,a0
    s++;
  88:	0785                	addi	a5,a5,1
  while(*s)
  8a:	0007c703          	lbu	a4,0(a5)
  8e:	ff6d                	bnez	a4,88 <strcat+0xe>
  while((*s++ = *t++))
  90:	0585                	addi	a1,a1,1
  92:	0785                	addi	a5,a5,1
  94:	fff5c703          	lbu	a4,-1(a1)
  98:	fee78fa3          	sb	a4,-1(a5)
  9c:	fb75                	bnez	a4,90 <strcat+0x16>
    ;
  return os;
}
  9e:	6422                	ld	s0,8(sp)
  a0:	0141                	addi	sp,sp,16
  a2:	8082                	ret
  while(*s)
  a4:	87aa                	mv	a5,a0
  a6:	b7ed                	j	90 <strcat+0x16>

00000000000000a8 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  a8:	1141                	addi	sp,sp,-16
  aa:	e422                	sd	s0,8(sp)
  ac:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  ae:	00054783          	lbu	a5,0(a0)
  b2:	cf91                	beqz	a5,ce <strcmp+0x26>
  b4:	0005c703          	lbu	a4,0(a1)
  b8:	00f71b63          	bne	a4,a5,ce <strcmp+0x26>
    p++, q++;
  bc:	0505                	addi	a0,a0,1
  be:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  c0:	00054783          	lbu	a5,0(a0)
  c4:	c789                	beqz	a5,ce <strcmp+0x26>
  c6:	0005c703          	lbu	a4,0(a1)
  ca:	fef709e3          	beq	a4,a5,bc <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
  ce:	0005c503          	lbu	a0,0(a1)
}
  d2:	40a7853b          	subw	a0,a5,a0
  d6:	6422                	ld	s0,8(sp)
  d8:	0141                	addi	sp,sp,16
  da:	8082                	ret

00000000000000dc <strlen>:

uint
strlen(const char *s)
{
  dc:	1141                	addi	sp,sp,-16
  de:	e422                	sd	s0,8(sp)
  e0:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  e2:	00054783          	lbu	a5,0(a0)
  e6:	cf91                	beqz	a5,102 <strlen+0x26>
  e8:	0505                	addi	a0,a0,1
  ea:	87aa                	mv	a5,a0
  ec:	4685                	li	a3,1
  ee:	9e89                	subw	a3,a3,a0
  f0:	00f6853b          	addw	a0,a3,a5
  f4:	0785                	addi	a5,a5,1
  f6:	fff7c703          	lbu	a4,-1(a5)
  fa:	fb7d                	bnez	a4,f0 <strlen+0x14>
    ;
  return n;
}
  fc:	6422                	ld	s0,8(sp)
  fe:	0141                	addi	sp,sp,16
 100:	8082                	ret
  for(n = 0; s[n]; n++)
 102:	4501                	li	a0,0
 104:	bfe5                	j	fc <strlen+0x20>

0000000000000106 <memset>:

void*
memset(void *dst, int c, uint n)
{
 106:	1141                	addi	sp,sp,-16
 108:	e422                	sd	s0,8(sp)
 10a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 10c:	ce09                	beqz	a2,126 <memset+0x20>
 10e:	87aa                	mv	a5,a0
 110:	fff6071b          	addiw	a4,a2,-1
 114:	1702                	slli	a4,a4,0x20
 116:	9301                	srli	a4,a4,0x20
 118:	0705                	addi	a4,a4,1
 11a:	972a                	add	a4,a4,a0
    cdst[i] = c;
 11c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 120:	0785                	addi	a5,a5,1
 122:	fee79de3          	bne	a5,a4,11c <memset+0x16>
  }
  return dst;
}
 126:	6422                	ld	s0,8(sp)
 128:	0141                	addi	sp,sp,16
 12a:	8082                	ret

000000000000012c <strchr>:

char*
strchr(const char *s, char c)
{
 12c:	1141                	addi	sp,sp,-16
 12e:	e422                	sd	s0,8(sp)
 130:	0800                	addi	s0,sp,16
  for(; *s; s++)
 132:	00054783          	lbu	a5,0(a0)
 136:	cf91                	beqz	a5,152 <strchr+0x26>
    if(*s == c)
 138:	00f58a63          	beq	a1,a5,14c <strchr+0x20>
  for(; *s; s++)
 13c:	0505                	addi	a0,a0,1
 13e:	00054783          	lbu	a5,0(a0)
 142:	c781                	beqz	a5,14a <strchr+0x1e>
    if(*s == c)
 144:	feb79ce3          	bne	a5,a1,13c <strchr+0x10>
 148:	a011                	j	14c <strchr+0x20>
      return (char*)s;
  return 0;
 14a:	4501                	li	a0,0
}
 14c:	6422                	ld	s0,8(sp)
 14e:	0141                	addi	sp,sp,16
 150:	8082                	ret
  return 0;
 152:	4501                	li	a0,0
 154:	bfe5                	j	14c <strchr+0x20>

0000000000000156 <gets>:

char*
gets(char *buf, int max)
{
 156:	711d                	addi	sp,sp,-96
 158:	ec86                	sd	ra,88(sp)
 15a:	e8a2                	sd	s0,80(sp)
 15c:	e4a6                	sd	s1,72(sp)
 15e:	e0ca                	sd	s2,64(sp)
 160:	fc4e                	sd	s3,56(sp)
 162:	f852                	sd	s4,48(sp)
 164:	f456                	sd	s5,40(sp)
 166:	f05a                	sd	s6,32(sp)
 168:	ec5e                	sd	s7,24(sp)
 16a:	e862                	sd	s8,16(sp)
 16c:	1080                	addi	s0,sp,96
 16e:	8c2a                	mv	s8,a0
 170:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 172:	892a                	mv	s2,a0
 174:	4981                	li	s3,0
    cc = read(0, &c, 1);
 176:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 17a:	4b29                	li	s6,10
 17c:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 17e:	0019849b          	addiw	s1,s3,1
 182:	0344d763          	ble	s4,s1,1b0 <gets+0x5a>
    cc = read(0, &c, 1);
 186:	4605                	li	a2,1
 188:	85d6                	mv	a1,s5
 18a:	4501                	li	a0,0
 18c:	00000097          	auipc	ra,0x0
 190:	1c4080e7          	jalr	452(ra) # 350 <read>
    if(cc < 1)
 194:	00a05e63          	blez	a0,1b0 <gets+0x5a>
    buf[i++] = c;
 198:	faf44783          	lbu	a5,-81(s0)
 19c:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1a0:	01678763          	beq	a5,s6,1ae <gets+0x58>
 1a4:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 1a6:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 1a8:	fd779be3          	bne	a5,s7,17e <gets+0x28>
 1ac:	a011                	j	1b0 <gets+0x5a>
  for(i=0; i+1 < max; ){
 1ae:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1b0:	99e2                	add	s3,s3,s8
 1b2:	00098023          	sb	zero,0(s3)
  return buf;
}
 1b6:	8562                	mv	a0,s8
 1b8:	60e6                	ld	ra,88(sp)
 1ba:	6446                	ld	s0,80(sp)
 1bc:	64a6                	ld	s1,72(sp)
 1be:	6906                	ld	s2,64(sp)
 1c0:	79e2                	ld	s3,56(sp)
 1c2:	7a42                	ld	s4,48(sp)
 1c4:	7aa2                	ld	s5,40(sp)
 1c6:	7b02                	ld	s6,32(sp)
 1c8:	6be2                	ld	s7,24(sp)
 1ca:	6c42                	ld	s8,16(sp)
 1cc:	6125                	addi	sp,sp,96
 1ce:	8082                	ret

00000000000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	1101                	addi	sp,sp,-32
 1d2:	ec06                	sd	ra,24(sp)
 1d4:	e822                	sd	s0,16(sp)
 1d6:	e426                	sd	s1,8(sp)
 1d8:	e04a                	sd	s2,0(sp)
 1da:	1000                	addi	s0,sp,32
 1dc:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1de:	4581                	li	a1,0
 1e0:	00000097          	auipc	ra,0x0
 1e4:	198080e7          	jalr	408(ra) # 378 <open>
  if(fd < 0)
 1e8:	02054563          	bltz	a0,212 <stat+0x42>
 1ec:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1ee:	85ca                	mv	a1,s2
 1f0:	00000097          	auipc	ra,0x0
 1f4:	190080e7          	jalr	400(ra) # 380 <fstat>
 1f8:	892a                	mv	s2,a0
  close(fd);
 1fa:	8526                	mv	a0,s1
 1fc:	00000097          	auipc	ra,0x0
 200:	164080e7          	jalr	356(ra) # 360 <close>
  return r;
}
 204:	854a                	mv	a0,s2
 206:	60e2                	ld	ra,24(sp)
 208:	6442                	ld	s0,16(sp)
 20a:	64a2                	ld	s1,8(sp)
 20c:	6902                	ld	s2,0(sp)
 20e:	6105                	addi	sp,sp,32
 210:	8082                	ret
    return -1;
 212:	597d                	li	s2,-1
 214:	bfc5                	j	204 <stat+0x34>

0000000000000216 <atoi>:

int
atoi(const char *s)
{
 216:	1141                	addi	sp,sp,-16
 218:	e422                	sd	s0,8(sp)
 21a:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 21c:	00054703          	lbu	a4,0(a0)
 220:	02d00793          	li	a5,45
  int neg = 1;
 224:	4805                	li	a6,1
  if (*s == '-') {
 226:	04f70363          	beq	a4,a5,26c <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 22a:	00054683          	lbu	a3,0(a0)
 22e:	fd06879b          	addiw	a5,a3,-48
 232:	0ff7f793          	andi	a5,a5,255
 236:	4725                	li	a4,9
 238:	02f76d63          	bltu	a4,a5,272 <atoi+0x5c>
  n = 0;
 23c:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 23e:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 240:	0505                	addi	a0,a0,1
 242:	0026179b          	slliw	a5,a2,0x2
 246:	9fb1                	addw	a5,a5,a2
 248:	0017979b          	slliw	a5,a5,0x1
 24c:	9fb5                	addw	a5,a5,a3
 24e:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 252:	00054683          	lbu	a3,0(a0)
 256:	fd06871b          	addiw	a4,a3,-48
 25a:	0ff77713          	andi	a4,a4,255
 25e:	fee5f1e3          	bleu	a4,a1,240 <atoi+0x2a>
  return n * neg;
}
 262:	02c8053b          	mulw	a0,a6,a2
 266:	6422                	ld	s0,8(sp)
 268:	0141                	addi	sp,sp,16
 26a:	8082                	ret
    s++;
 26c:	0505                	addi	a0,a0,1
    neg = -1;
 26e:	587d                	li	a6,-1
 270:	bf6d                	j	22a <atoi+0x14>
  n = 0;
 272:	4601                	li	a2,0
 274:	b7fd                	j	262 <atoi+0x4c>

0000000000000276 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 276:	1141                	addi	sp,sp,-16
 278:	e422                	sd	s0,8(sp)
 27a:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 27c:	02b57663          	bleu	a1,a0,2a8 <memmove+0x32>
    while(n-- > 0)
 280:	02c05163          	blez	a2,2a2 <memmove+0x2c>
 284:	fff6079b          	addiw	a5,a2,-1
 288:	1782                	slli	a5,a5,0x20
 28a:	9381                	srli	a5,a5,0x20
 28c:	0785                	addi	a5,a5,1
 28e:	97aa                	add	a5,a5,a0
  dst = vdst;
 290:	872a                	mv	a4,a0
      *dst++ = *src++;
 292:	0585                	addi	a1,a1,1
 294:	0705                	addi	a4,a4,1
 296:	fff5c683          	lbu	a3,-1(a1)
 29a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 29e:	fee79ae3          	bne	a5,a4,292 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2a2:	6422                	ld	s0,8(sp)
 2a4:	0141                	addi	sp,sp,16
 2a6:	8082                	ret
    dst += n;
 2a8:	00c50733          	add	a4,a0,a2
    src += n;
 2ac:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2ae:	fec05ae3          	blez	a2,2a2 <memmove+0x2c>
 2b2:	fff6079b          	addiw	a5,a2,-1
 2b6:	1782                	slli	a5,a5,0x20
 2b8:	9381                	srli	a5,a5,0x20
 2ba:	fff7c793          	not	a5,a5
 2be:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2c0:	15fd                	addi	a1,a1,-1
 2c2:	177d                	addi	a4,a4,-1
 2c4:	0005c683          	lbu	a3,0(a1)
 2c8:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2cc:	fef71ae3          	bne	a4,a5,2c0 <memmove+0x4a>
 2d0:	bfc9                	j	2a2 <memmove+0x2c>

00000000000002d2 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2d2:	1141                	addi	sp,sp,-16
 2d4:	e422                	sd	s0,8(sp)
 2d6:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2d8:	ce15                	beqz	a2,314 <memcmp+0x42>
 2da:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 2de:	00054783          	lbu	a5,0(a0)
 2e2:	0005c703          	lbu	a4,0(a1)
 2e6:	02e79063          	bne	a5,a4,306 <memcmp+0x34>
 2ea:	1682                	slli	a3,a3,0x20
 2ec:	9281                	srli	a3,a3,0x20
 2ee:	0685                	addi	a3,a3,1
 2f0:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 2f2:	0505                	addi	a0,a0,1
    p2++;
 2f4:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2f6:	00d50d63          	beq	a0,a3,310 <memcmp+0x3e>
    if (*p1 != *p2) {
 2fa:	00054783          	lbu	a5,0(a0)
 2fe:	0005c703          	lbu	a4,0(a1)
 302:	fee788e3          	beq	a5,a4,2f2 <memcmp+0x20>
      return *p1 - *p2;
 306:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 30a:	6422                	ld	s0,8(sp)
 30c:	0141                	addi	sp,sp,16
 30e:	8082                	ret
  return 0;
 310:	4501                	li	a0,0
 312:	bfe5                	j	30a <memcmp+0x38>
 314:	4501                	li	a0,0
 316:	bfd5                	j	30a <memcmp+0x38>

0000000000000318 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 318:	1141                	addi	sp,sp,-16
 31a:	e406                	sd	ra,8(sp)
 31c:	e022                	sd	s0,0(sp)
 31e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 320:	00000097          	auipc	ra,0x0
 324:	f56080e7          	jalr	-170(ra) # 276 <memmove>
}
 328:	60a2                	ld	ra,8(sp)
 32a:	6402                	ld	s0,0(sp)
 32c:	0141                	addi	sp,sp,16
 32e:	8082                	ret

0000000000000330 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 330:	4885                	li	a7,1
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <exit>:
.global exit
exit:
 li a7, SYS_exit
 338:	4889                	li	a7,2
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <wait>:
.global wait
wait:
 li a7, SYS_wait
 340:	488d                	li	a7,3
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 348:	4891                	li	a7,4
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <read>:
.global read
read:
 li a7, SYS_read
 350:	4895                	li	a7,5
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <write>:
.global write
write:
 li a7, SYS_write
 358:	48c1                	li	a7,16
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <close>:
.global close
close:
 li a7, SYS_close
 360:	48d5                	li	a7,21
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <kill>:
.global kill
kill:
 li a7, SYS_kill
 368:	4899                	li	a7,6
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <exec>:
.global exec
exec:
 li a7, SYS_exec
 370:	489d                	li	a7,7
 ecall
 372:	00000073          	ecall
 ret
 376:	8082                	ret

0000000000000378 <open>:
.global open
open:
 li a7, SYS_open
 378:	48bd                	li	a7,15
 ecall
 37a:	00000073          	ecall
 ret
 37e:	8082                	ret

0000000000000380 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 380:	48a1                	li	a7,8
 ecall
 382:	00000073          	ecall
 ret
 386:	8082                	ret

0000000000000388 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 388:	48d1                	li	a7,20
 ecall
 38a:	00000073          	ecall
 ret
 38e:	8082                	ret

0000000000000390 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 390:	48a5                	li	a7,9
 ecall
 392:	00000073          	ecall
 ret
 396:	8082                	ret

0000000000000398 <dup>:
.global dup
dup:
 li a7, SYS_dup
 398:	48a9                	li	a7,10
 ecall
 39a:	00000073          	ecall
 ret
 39e:	8082                	ret

00000000000003a0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3a0:	48ad                	li	a7,11
 ecall
 3a2:	00000073          	ecall
 ret
 3a6:	8082                	ret

00000000000003a8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3a8:	48b1                	li	a7,12
 ecall
 3aa:	00000073          	ecall
 ret
 3ae:	8082                	ret

00000000000003b0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3b0:	48b5                	li	a7,13
 ecall
 3b2:	00000073          	ecall
 ret
 3b6:	8082                	ret

00000000000003b8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3b8:	48b9                	li	a7,14
 ecall
 3ba:	00000073          	ecall
 ret
 3be:	8082                	ret

00000000000003c0 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3c0:	48d9                	li	a7,22
 ecall
 3c2:	00000073          	ecall
 ret
 3c6:	8082                	ret

00000000000003c8 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3c8:	48dd                	li	a7,23
 ecall
 3ca:	00000073          	ecall
 ret
 3ce:	8082                	ret

00000000000003d0 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3d0:	48e1                	li	a7,24
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3d8:	48e5                	li	a7,25
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <remove>:
.global remove
remove:
 li a7, SYS_remove
 3e0:	48c5                	li	a7,17
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3e8:	48c9                	li	a7,18
 ecall
 3ea:	00000073          	ecall
 ret
 3ee:	8082                	ret

00000000000003f0 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3f0:	48cd                	li	a7,19
 ecall
 3f2:	00000073          	ecall
 ret
 3f6:	8082                	ret

00000000000003f8 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3f8:	48e9                	li	a7,26
 ecall
 3fa:	00000073          	ecall
 ret
 3fe:	8082                	ret

0000000000000400 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 400:	48ed                	li	a7,27
 ecall
 402:	00000073          	ecall
 ret
 406:	8082                	ret

0000000000000408 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 408:	1101                	addi	sp,sp,-32
 40a:	ec06                	sd	ra,24(sp)
 40c:	e822                	sd	s0,16(sp)
 40e:	1000                	addi	s0,sp,32
 410:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 414:	4605                	li	a2,1
 416:	fef40593          	addi	a1,s0,-17
 41a:	00000097          	auipc	ra,0x0
 41e:	f3e080e7          	jalr	-194(ra) # 358 <write>
}
 422:	60e2                	ld	ra,24(sp)
 424:	6442                	ld	s0,16(sp)
 426:	6105                	addi	sp,sp,32
 428:	8082                	ret

000000000000042a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 42a:	7139                	addi	sp,sp,-64
 42c:	fc06                	sd	ra,56(sp)
 42e:	f822                	sd	s0,48(sp)
 430:	f426                	sd	s1,40(sp)
 432:	f04a                	sd	s2,32(sp)
 434:	ec4e                	sd	s3,24(sp)
 436:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 438:	c299                	beqz	a3,43e <printint+0x14>
 43a:	0005ce63          	bltz	a1,456 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 43e:	2581                	sext.w	a1,a1
  neg = 0;
 440:	4301                	li	t1,0
  }

  i = 0;
 442:	fc040913          	addi	s2,s0,-64
  neg = 0;
 446:	874a                	mv	a4,s2
  i = 0;
 448:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 44a:	2601                	sext.w	a2,a2
 44c:	00000897          	auipc	a7,0x0
 450:	47488893          	addi	a7,a7,1140 # 8c0 <digits>
 454:	a801                	j	464 <printint+0x3a>
    x = -xx;
 456:	40b005bb          	negw	a1,a1
 45a:	2581                	sext.w	a1,a1
    neg = 1;
 45c:	4305                	li	t1,1
    x = -xx;
 45e:	b7d5                	j	442 <printint+0x18>
  }while((x /= base) != 0);
 460:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 462:	8836                	mv	a6,a3
 464:	0018069b          	addiw	a3,a6,1
 468:	02c5f7bb          	remuw	a5,a1,a2
 46c:	1782                	slli	a5,a5,0x20
 46e:	9381                	srli	a5,a5,0x20
 470:	97c6                	add	a5,a5,a7
 472:	0007c783          	lbu	a5,0(a5)
 476:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 47a:	0705                	addi	a4,a4,1
 47c:	02c5d7bb          	divuw	a5,a1,a2
 480:	fec5f0e3          	bleu	a2,a1,460 <printint+0x36>
  if(neg)
 484:	00030b63          	beqz	t1,49a <printint+0x70>
    buf[i++] = '-';
 488:	fd040793          	addi	a5,s0,-48
 48c:	96be                	add	a3,a3,a5
 48e:	02d00793          	li	a5,45
 492:	fef68823          	sb	a5,-16(a3)
 496:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 49a:	02d05763          	blez	a3,4c8 <printint+0x9e>
 49e:	89aa                	mv	s3,a0
 4a0:	fc040493          	addi	s1,s0,-64
 4a4:	94b6                	add	s1,s1,a3
 4a6:	197d                	addi	s2,s2,-1
 4a8:	9936                	add	s2,s2,a3
 4aa:	36fd                	addiw	a3,a3,-1
 4ac:	1682                	slli	a3,a3,0x20
 4ae:	9281                	srli	a3,a3,0x20
 4b0:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 4b4:	fff4c583          	lbu	a1,-1(s1)
 4b8:	854e                	mv	a0,s3
 4ba:	00000097          	auipc	ra,0x0
 4be:	f4e080e7          	jalr	-178(ra) # 408 <putc>
  while(--i >= 0)
 4c2:	14fd                	addi	s1,s1,-1
 4c4:	ff2498e3          	bne	s1,s2,4b4 <printint+0x8a>
}
 4c8:	70e2                	ld	ra,56(sp)
 4ca:	7442                	ld	s0,48(sp)
 4cc:	74a2                	ld	s1,40(sp)
 4ce:	7902                	ld	s2,32(sp)
 4d0:	69e2                	ld	s3,24(sp)
 4d2:	6121                	addi	sp,sp,64
 4d4:	8082                	ret

00000000000004d6 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4d6:	7119                	addi	sp,sp,-128
 4d8:	fc86                	sd	ra,120(sp)
 4da:	f8a2                	sd	s0,112(sp)
 4dc:	f4a6                	sd	s1,104(sp)
 4de:	f0ca                	sd	s2,96(sp)
 4e0:	ecce                	sd	s3,88(sp)
 4e2:	e8d2                	sd	s4,80(sp)
 4e4:	e4d6                	sd	s5,72(sp)
 4e6:	e0da                	sd	s6,64(sp)
 4e8:	fc5e                	sd	s7,56(sp)
 4ea:	f862                	sd	s8,48(sp)
 4ec:	f466                	sd	s9,40(sp)
 4ee:	f06a                	sd	s10,32(sp)
 4f0:	ec6e                	sd	s11,24(sp)
 4f2:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4f4:	0005c483          	lbu	s1,0(a1)
 4f8:	18048d63          	beqz	s1,692 <vprintf+0x1bc>
 4fc:	8aaa                	mv	s5,a0
 4fe:	8b32                	mv	s6,a2
 500:	00158913          	addi	s2,a1,1
  state = 0;
 504:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 506:	02500a13          	li	s4,37
      if(c == 'd'){
 50a:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 50e:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 512:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 516:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 51a:	00000b97          	auipc	s7,0x0
 51e:	3a6b8b93          	addi	s7,s7,934 # 8c0 <digits>
 522:	a839                	j	540 <vprintf+0x6a>
        putc(fd, c);
 524:	85a6                	mv	a1,s1
 526:	8556                	mv	a0,s5
 528:	00000097          	auipc	ra,0x0
 52c:	ee0080e7          	jalr	-288(ra) # 408 <putc>
 530:	a019                	j	536 <vprintf+0x60>
    } else if(state == '%'){
 532:	01498f63          	beq	s3,s4,550 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 536:	0905                	addi	s2,s2,1
 538:	fff94483          	lbu	s1,-1(s2)
 53c:	14048b63          	beqz	s1,692 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 540:	0004879b          	sext.w	a5,s1
    if(state == 0){
 544:	fe0997e3          	bnez	s3,532 <vprintf+0x5c>
      if(c == '%'){
 548:	fd479ee3          	bne	a5,s4,524 <vprintf+0x4e>
        state = '%';
 54c:	89be                	mv	s3,a5
 54e:	b7e5                	j	536 <vprintf+0x60>
      if(c == 'd'){
 550:	05878063          	beq	a5,s8,590 <vprintf+0xba>
      } else if(c == 'l') {
 554:	05978c63          	beq	a5,s9,5ac <vprintf+0xd6>
      } else if(c == 'x') {
 558:	07a78863          	beq	a5,s10,5c8 <vprintf+0xf2>
      } else if(c == 'p') {
 55c:	09b78463          	beq	a5,s11,5e4 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 560:	07300713          	li	a4,115
 564:	0ce78563          	beq	a5,a4,62e <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 568:	06300713          	li	a4,99
 56c:	0ee78c63          	beq	a5,a4,664 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 570:	11478663          	beq	a5,s4,67c <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 574:	85d2                	mv	a1,s4
 576:	8556                	mv	a0,s5
 578:	00000097          	auipc	ra,0x0
 57c:	e90080e7          	jalr	-368(ra) # 408 <putc>
        putc(fd, c);
 580:	85a6                	mv	a1,s1
 582:	8556                	mv	a0,s5
 584:	00000097          	auipc	ra,0x0
 588:	e84080e7          	jalr	-380(ra) # 408 <putc>
      }
      state = 0;
 58c:	4981                	li	s3,0
 58e:	b765                	j	536 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 590:	008b0493          	addi	s1,s6,8
 594:	4685                	li	a3,1
 596:	4629                	li	a2,10
 598:	000b2583          	lw	a1,0(s6)
 59c:	8556                	mv	a0,s5
 59e:	00000097          	auipc	ra,0x0
 5a2:	e8c080e7          	jalr	-372(ra) # 42a <printint>
 5a6:	8b26                	mv	s6,s1
      state = 0;
 5a8:	4981                	li	s3,0
 5aa:	b771                	j	536 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5ac:	008b0493          	addi	s1,s6,8
 5b0:	4681                	li	a3,0
 5b2:	4629                	li	a2,10
 5b4:	000b2583          	lw	a1,0(s6)
 5b8:	8556                	mv	a0,s5
 5ba:	00000097          	auipc	ra,0x0
 5be:	e70080e7          	jalr	-400(ra) # 42a <printint>
 5c2:	8b26                	mv	s6,s1
      state = 0;
 5c4:	4981                	li	s3,0
 5c6:	bf85                	j	536 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5c8:	008b0493          	addi	s1,s6,8
 5cc:	4681                	li	a3,0
 5ce:	4641                	li	a2,16
 5d0:	000b2583          	lw	a1,0(s6)
 5d4:	8556                	mv	a0,s5
 5d6:	00000097          	auipc	ra,0x0
 5da:	e54080e7          	jalr	-428(ra) # 42a <printint>
 5de:	8b26                	mv	s6,s1
      state = 0;
 5e0:	4981                	li	s3,0
 5e2:	bf91                	j	536 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5e4:	008b0793          	addi	a5,s6,8
 5e8:	f8f43423          	sd	a5,-120(s0)
 5ec:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5f0:	03000593          	li	a1,48
 5f4:	8556                	mv	a0,s5
 5f6:	00000097          	auipc	ra,0x0
 5fa:	e12080e7          	jalr	-494(ra) # 408 <putc>
  putc(fd, 'x');
 5fe:	85ea                	mv	a1,s10
 600:	8556                	mv	a0,s5
 602:	00000097          	auipc	ra,0x0
 606:	e06080e7          	jalr	-506(ra) # 408 <putc>
 60a:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 60c:	03c9d793          	srli	a5,s3,0x3c
 610:	97de                	add	a5,a5,s7
 612:	0007c583          	lbu	a1,0(a5)
 616:	8556                	mv	a0,s5
 618:	00000097          	auipc	ra,0x0
 61c:	df0080e7          	jalr	-528(ra) # 408 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 620:	0992                	slli	s3,s3,0x4
 622:	34fd                	addiw	s1,s1,-1
 624:	f4e5                	bnez	s1,60c <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 626:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 62a:	4981                	li	s3,0
 62c:	b729                	j	536 <vprintf+0x60>
        s = va_arg(ap, char*);
 62e:	008b0993          	addi	s3,s6,8
 632:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 636:	c085                	beqz	s1,656 <vprintf+0x180>
        while(*s != 0){
 638:	0004c583          	lbu	a1,0(s1)
 63c:	c9a1                	beqz	a1,68c <vprintf+0x1b6>
          putc(fd, *s);
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	dc8080e7          	jalr	-568(ra) # 408 <putc>
          s++;
 648:	0485                	addi	s1,s1,1
        while(*s != 0){
 64a:	0004c583          	lbu	a1,0(s1)
 64e:	f9e5                	bnez	a1,63e <vprintf+0x168>
        s = va_arg(ap, char*);
 650:	8b4e                	mv	s6,s3
      state = 0;
 652:	4981                	li	s3,0
 654:	b5cd                	j	536 <vprintf+0x60>
          s = "(null)";
 656:	00000497          	auipc	s1,0x0
 65a:	28248493          	addi	s1,s1,642 # 8d8 <digits+0x18>
        while(*s != 0){
 65e:	02800593          	li	a1,40
 662:	bff1                	j	63e <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 664:	008b0493          	addi	s1,s6,8
 668:	000b4583          	lbu	a1,0(s6)
 66c:	8556                	mv	a0,s5
 66e:	00000097          	auipc	ra,0x0
 672:	d9a080e7          	jalr	-614(ra) # 408 <putc>
 676:	8b26                	mv	s6,s1
      state = 0;
 678:	4981                	li	s3,0
 67a:	bd75                	j	536 <vprintf+0x60>
        putc(fd, c);
 67c:	85d2                	mv	a1,s4
 67e:	8556                	mv	a0,s5
 680:	00000097          	auipc	ra,0x0
 684:	d88080e7          	jalr	-632(ra) # 408 <putc>
      state = 0;
 688:	4981                	li	s3,0
 68a:	b575                	j	536 <vprintf+0x60>
        s = va_arg(ap, char*);
 68c:	8b4e                	mv	s6,s3
      state = 0;
 68e:	4981                	li	s3,0
 690:	b55d                	j	536 <vprintf+0x60>
    }
  }
}
 692:	70e6                	ld	ra,120(sp)
 694:	7446                	ld	s0,112(sp)
 696:	74a6                	ld	s1,104(sp)
 698:	7906                	ld	s2,96(sp)
 69a:	69e6                	ld	s3,88(sp)
 69c:	6a46                	ld	s4,80(sp)
 69e:	6aa6                	ld	s5,72(sp)
 6a0:	6b06                	ld	s6,64(sp)
 6a2:	7be2                	ld	s7,56(sp)
 6a4:	7c42                	ld	s8,48(sp)
 6a6:	7ca2                	ld	s9,40(sp)
 6a8:	7d02                	ld	s10,32(sp)
 6aa:	6de2                	ld	s11,24(sp)
 6ac:	6109                	addi	sp,sp,128
 6ae:	8082                	ret

00000000000006b0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6b0:	715d                	addi	sp,sp,-80
 6b2:	ec06                	sd	ra,24(sp)
 6b4:	e822                	sd	s0,16(sp)
 6b6:	1000                	addi	s0,sp,32
 6b8:	e010                	sd	a2,0(s0)
 6ba:	e414                	sd	a3,8(s0)
 6bc:	e818                	sd	a4,16(s0)
 6be:	ec1c                	sd	a5,24(s0)
 6c0:	03043023          	sd	a6,32(s0)
 6c4:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6c8:	8622                	mv	a2,s0
 6ca:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6ce:	00000097          	auipc	ra,0x0
 6d2:	e08080e7          	jalr	-504(ra) # 4d6 <vprintf>
}
 6d6:	60e2                	ld	ra,24(sp)
 6d8:	6442                	ld	s0,16(sp)
 6da:	6161                	addi	sp,sp,80
 6dc:	8082                	ret

00000000000006de <printf>:

void
printf(const char *fmt, ...)
{
 6de:	711d                	addi	sp,sp,-96
 6e0:	ec06                	sd	ra,24(sp)
 6e2:	e822                	sd	s0,16(sp)
 6e4:	1000                	addi	s0,sp,32
 6e6:	e40c                	sd	a1,8(s0)
 6e8:	e810                	sd	a2,16(s0)
 6ea:	ec14                	sd	a3,24(s0)
 6ec:	f018                	sd	a4,32(s0)
 6ee:	f41c                	sd	a5,40(s0)
 6f0:	03043823          	sd	a6,48(s0)
 6f4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6f8:	00840613          	addi	a2,s0,8
 6fc:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 700:	85aa                	mv	a1,a0
 702:	4505                	li	a0,1
 704:	00000097          	auipc	ra,0x0
 708:	dd2080e7          	jalr	-558(ra) # 4d6 <vprintf>
}
 70c:	60e2                	ld	ra,24(sp)
 70e:	6442                	ld	s0,16(sp)
 710:	6125                	addi	sp,sp,96
 712:	8082                	ret

0000000000000714 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 714:	1141                	addi	sp,sp,-16
 716:	e422                	sd	s0,8(sp)
 718:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 71a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71e:	00000797          	auipc	a5,0x0
 722:	1c278793          	addi	a5,a5,450 # 8e0 <__bss_start>
 726:	639c                	ld	a5,0(a5)
 728:	a805                	j	758 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 72a:	4618                	lw	a4,8(a2)
 72c:	9db9                	addw	a1,a1,a4
 72e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 732:	6398                	ld	a4,0(a5)
 734:	6318                	ld	a4,0(a4)
 736:	fee53823          	sd	a4,-16(a0)
 73a:	a091                	j	77e <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 73c:	ff852703          	lw	a4,-8(a0)
 740:	9e39                	addw	a2,a2,a4
 742:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 744:	ff053703          	ld	a4,-16(a0)
 748:	e398                	sd	a4,0(a5)
 74a:	a099                	j	790 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74c:	6398                	ld	a4,0(a5)
 74e:	00e7e463          	bltu	a5,a4,756 <free+0x42>
 752:	00e6ea63          	bltu	a3,a4,766 <free+0x52>
{
 756:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 758:	fed7fae3          	bleu	a3,a5,74c <free+0x38>
 75c:	6398                	ld	a4,0(a5)
 75e:	00e6e463          	bltu	a3,a4,766 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 762:	fee7eae3          	bltu	a5,a4,756 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 766:	ff852583          	lw	a1,-8(a0)
 76a:	6390                	ld	a2,0(a5)
 76c:	02059713          	slli	a4,a1,0x20
 770:	9301                	srli	a4,a4,0x20
 772:	0712                	slli	a4,a4,0x4
 774:	9736                	add	a4,a4,a3
 776:	fae60ae3          	beq	a2,a4,72a <free+0x16>
    bp->s.ptr = p->s.ptr;
 77a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 77e:	4790                	lw	a2,8(a5)
 780:	02061713          	slli	a4,a2,0x20
 784:	9301                	srli	a4,a4,0x20
 786:	0712                	slli	a4,a4,0x4
 788:	973e                	add	a4,a4,a5
 78a:	fae689e3          	beq	a3,a4,73c <free+0x28>
  } else
    p->s.ptr = bp;
 78e:	e394                	sd	a3,0(a5)
  freep = p;
 790:	00000717          	auipc	a4,0x0
 794:	14f73823          	sd	a5,336(a4) # 8e0 <__bss_start>
}
 798:	6422                	ld	s0,8(sp)
 79a:	0141                	addi	sp,sp,16
 79c:	8082                	ret

000000000000079e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 79e:	7139                	addi	sp,sp,-64
 7a0:	fc06                	sd	ra,56(sp)
 7a2:	f822                	sd	s0,48(sp)
 7a4:	f426                	sd	s1,40(sp)
 7a6:	f04a                	sd	s2,32(sp)
 7a8:	ec4e                	sd	s3,24(sp)
 7aa:	e852                	sd	s4,16(sp)
 7ac:	e456                	sd	s5,8(sp)
 7ae:	e05a                	sd	s6,0(sp)
 7b0:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	02051993          	slli	s3,a0,0x20
 7b6:	0209d993          	srli	s3,s3,0x20
 7ba:	09bd                	addi	s3,s3,15
 7bc:	0049d993          	srli	s3,s3,0x4
 7c0:	2985                	addiw	s3,s3,1
 7c2:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 7c6:	00000797          	auipc	a5,0x0
 7ca:	11a78793          	addi	a5,a5,282 # 8e0 <__bss_start>
 7ce:	6388                	ld	a0,0(a5)
 7d0:	c515                	beqz	a0,7fc <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7d4:	4798                	lw	a4,8(a5)
 7d6:	03277d63          	bleu	s2,a4,810 <malloc+0x72>
 7da:	8a4e                	mv	s4,s3
 7dc:	0009871b          	sext.w	a4,s3
 7e0:	6685                	lui	a3,0x1
 7e2:	00d77363          	bleu	a3,a4,7e8 <malloc+0x4a>
 7e6:	6a05                	lui	s4,0x1
 7e8:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 7ec:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f0:	00000497          	auipc	s1,0x0
 7f4:	0f048493          	addi	s1,s1,240 # 8e0 <__bss_start>
  if(p == (char*)-1)
 7f8:	5b7d                	li	s6,-1
 7fa:	a0b5                	j	866 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 7fc:	00000717          	auipc	a4,0x0
 800:	0ec70713          	addi	a4,a4,236 # 8e8 <base>
 804:	e398                	sd	a4,0(a5)
 806:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 808:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80c:	87ba                	mv	a5,a4
 80e:	b7f1                	j	7da <malloc+0x3c>
      if(p->s.size == nunits)
 810:	02e90b63          	beq	s2,a4,846 <malloc+0xa8>
        p->s.size -= nunits;
 814:	4137073b          	subw	a4,a4,s3
 818:	c798                	sw	a4,8(a5)
        p += p->s.size;
 81a:	1702                	slli	a4,a4,0x20
 81c:	9301                	srli	a4,a4,0x20
 81e:	0712                	slli	a4,a4,0x4
 820:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 822:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 826:	00000717          	auipc	a4,0x0
 82a:	0aa73d23          	sd	a0,186(a4) # 8e0 <__bss_start>
      return (void*)(p + 1);
 82e:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 832:	70e2                	ld	ra,56(sp)
 834:	7442                	ld	s0,48(sp)
 836:	74a2                	ld	s1,40(sp)
 838:	7902                	ld	s2,32(sp)
 83a:	69e2                	ld	s3,24(sp)
 83c:	6a42                	ld	s4,16(sp)
 83e:	6aa2                	ld	s5,8(sp)
 840:	6b02                	ld	s6,0(sp)
 842:	6121                	addi	sp,sp,64
 844:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 846:	6398                	ld	a4,0(a5)
 848:	e118                	sd	a4,0(a0)
 84a:	bff1                	j	826 <malloc+0x88>
  hp->s.size = nu;
 84c:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 850:	0541                	addi	a0,a0,16
 852:	00000097          	auipc	ra,0x0
 856:	ec2080e7          	jalr	-318(ra) # 714 <free>
  return freep;
 85a:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 85c:	d979                	beqz	a0,832 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 860:	4798                	lw	a4,8(a5)
 862:	fb2777e3          	bleu	s2,a4,810 <malloc+0x72>
    if(p == freep)
 866:	6098                	ld	a4,0(s1)
 868:	853e                	mv	a0,a5
 86a:	fef71ae3          	bne	a4,a5,85e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 86e:	8552                	mv	a0,s4
 870:	00000097          	auipc	ra,0x0
 874:	b38080e7          	jalr	-1224(ra) # 3a8 <sbrk>
  if(p == (char*)-1)
 878:	fd651ae3          	bne	a0,s6,84c <malloc+0xae>
        return 0;
 87c:	4501                	li	a0,0
 87e:	bf55                	j	832 <malloc+0x94>
