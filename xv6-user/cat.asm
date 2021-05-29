
xv6-user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	89aa                	mv	s3,a0
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  10:	00001917          	auipc	s2,0x1
  14:	99890913          	addi	s2,s2,-1640 # 9a8 <buf>
  18:	20000613          	li	a2,512
  1c:	85ca                	mv	a1,s2
  1e:	854e                	mv	a0,s3
  20:	00000097          	auipc	ra,0x0
  24:	3ec080e7          	jalr	1004(ra) # 40c <read>
  28:	84aa                	mv	s1,a0
  2a:	02a05963          	blez	a0,5c <cat+0x5c>
    if (write(1, buf, n) != n) {
  2e:	8626                	mv	a2,s1
  30:	85ca                	mv	a1,s2
  32:	4505                	li	a0,1
  34:	00000097          	auipc	ra,0x0
  38:	3e0080e7          	jalr	992(ra) # 414 <write>
  3c:	fc950ee3          	beq	a0,s1,18 <cat+0x18>
      fprintf(2, "cat: write error\n");
  40:	00001597          	auipc	a1,0x1
  44:	90058593          	addi	a1,a1,-1792 # 940 <malloc+0xe6>
  48:	4509                	li	a0,2
  4a:	00000097          	auipc	ra,0x0
  4e:	722080e7          	jalr	1826(ra) # 76c <fprintf>
      exit(1);
  52:	4505                	li	a0,1
  54:	00000097          	auipc	ra,0x0
  58:	3a0080e7          	jalr	928(ra) # 3f4 <exit>
    }
  }
  if(n < 0){
  5c:	00054963          	bltz	a0,6e <cat+0x6e>
    fprintf(2, "cat: read error\n");
    exit(1);
  }
}
  60:	70a2                	ld	ra,40(sp)
  62:	7402                	ld	s0,32(sp)
  64:	64e2                	ld	s1,24(sp)
  66:	6942                	ld	s2,16(sp)
  68:	69a2                	ld	s3,8(sp)
  6a:	6145                	addi	sp,sp,48
  6c:	8082                	ret
    fprintf(2, "cat: read error\n");
  6e:	00001597          	auipc	a1,0x1
  72:	8ea58593          	addi	a1,a1,-1814 # 958 <malloc+0xfe>
  76:	4509                	li	a0,2
  78:	00000097          	auipc	ra,0x0
  7c:	6f4080e7          	jalr	1780(ra) # 76c <fprintf>
    exit(1);
  80:	4505                	li	a0,1
  82:	00000097          	auipc	ra,0x0
  86:	372080e7          	jalr	882(ra) # 3f4 <exit>

000000000000008a <main>:

int
main(int argc, char *argv[])
{
  8a:	7179                	addi	sp,sp,-48
  8c:	f406                	sd	ra,40(sp)
  8e:	f022                	sd	s0,32(sp)
  90:	ec26                	sd	s1,24(sp)
  92:	e84a                	sd	s2,16(sp)
  94:	e44e                	sd	s3,8(sp)
  96:	e052                	sd	s4,0(sp)
  98:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
  9a:	4785                	li	a5,1
  9c:	04a7d663          	ble	a0,a5,e8 <main+0x5e>
  a0:	00858493          	addi	s1,a1,8
  a4:	ffe5099b          	addiw	s3,a0,-2
  a8:	1982                	slli	s3,s3,0x20
  aa:	0209d993          	srli	s3,s3,0x20
  ae:	098e                	slli	s3,s3,0x3
  b0:	05c1                	addi	a1,a1,16
  b2:	99ae                	add	s3,s3,a1
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  b4:	4581                	li	a1,0
  b6:	6088                	ld	a0,0(s1)
  b8:	00000097          	auipc	ra,0x0
  bc:	37c080e7          	jalr	892(ra) # 434 <open>
  c0:	892a                	mv	s2,a0
  c2:	02054d63          	bltz	a0,fc <main+0x72>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
      exit(1);
    }
    cat(fd);
  c6:	00000097          	auipc	ra,0x0
  ca:	f3a080e7          	jalr	-198(ra) # 0 <cat>
    close(fd);
  ce:	854a                	mv	a0,s2
  d0:	00000097          	auipc	ra,0x0
  d4:	34c080e7          	jalr	844(ra) # 41c <close>
  for(i = 1; i < argc; i++){
  d8:	04a1                	addi	s1,s1,8
  da:	fd349de3          	bne	s1,s3,b4 <main+0x2a>
  }
  exit(0);
  de:	4501                	li	a0,0
  e0:	00000097          	auipc	ra,0x0
  e4:	314080e7          	jalr	788(ra) # 3f4 <exit>
    cat(0);
  e8:	4501                	li	a0,0
  ea:	00000097          	auipc	ra,0x0
  ee:	f16080e7          	jalr	-234(ra) # 0 <cat>
    exit(0);
  f2:	4501                	li	a0,0
  f4:	00000097          	auipc	ra,0x0
  f8:	300080e7          	jalr	768(ra) # 3f4 <exit>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
  fc:	6090                	ld	a2,0(s1)
  fe:	00001597          	auipc	a1,0x1
 102:	87258593          	addi	a1,a1,-1934 # 970 <malloc+0x116>
 106:	4509                	li	a0,2
 108:	00000097          	auipc	ra,0x0
 10c:	664080e7          	jalr	1636(ra) # 76c <fprintf>
      exit(1);
 110:	4505                	li	a0,1
 112:	00000097          	auipc	ra,0x0
 116:	2e2080e7          	jalr	738(ra) # 3f4 <exit>

000000000000011a <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 11a:	1141                	addi	sp,sp,-16
 11c:	e422                	sd	s0,8(sp)
 11e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 120:	87aa                	mv	a5,a0
 122:	0585                	addi	a1,a1,1
 124:	0785                	addi	a5,a5,1
 126:	fff5c703          	lbu	a4,-1(a1)
 12a:	fee78fa3          	sb	a4,-1(a5)
 12e:	fb75                	bnez	a4,122 <strcpy+0x8>
    ;
  return os;
}
 130:	6422                	ld	s0,8(sp)
 132:	0141                	addi	sp,sp,16
 134:	8082                	ret

0000000000000136 <strcat>:

char*
strcat(char *s, const char *t)
{
 136:	1141                	addi	sp,sp,-16
 138:	e422                	sd	s0,8(sp)
 13a:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 13c:	00054783          	lbu	a5,0(a0)
 140:	c385                	beqz	a5,160 <strcat+0x2a>
 142:	87aa                	mv	a5,a0
    s++;
 144:	0785                	addi	a5,a5,1
  while(*s)
 146:	0007c703          	lbu	a4,0(a5)
 14a:	ff6d                	bnez	a4,144 <strcat+0xe>
  while((*s++ = *t++))
 14c:	0585                	addi	a1,a1,1
 14e:	0785                	addi	a5,a5,1
 150:	fff5c703          	lbu	a4,-1(a1)
 154:	fee78fa3          	sb	a4,-1(a5)
 158:	fb75                	bnez	a4,14c <strcat+0x16>
    ;
  return os;
}
 15a:	6422                	ld	s0,8(sp)
 15c:	0141                	addi	sp,sp,16
 15e:	8082                	ret
  while(*s)
 160:	87aa                	mv	a5,a0
 162:	b7ed                	j	14c <strcat+0x16>

0000000000000164 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 164:	1141                	addi	sp,sp,-16
 166:	e422                	sd	s0,8(sp)
 168:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 16a:	00054783          	lbu	a5,0(a0)
 16e:	cf91                	beqz	a5,18a <strcmp+0x26>
 170:	0005c703          	lbu	a4,0(a1)
 174:	00f71b63          	bne	a4,a5,18a <strcmp+0x26>
    p++, q++;
 178:	0505                	addi	a0,a0,1
 17a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 17c:	00054783          	lbu	a5,0(a0)
 180:	c789                	beqz	a5,18a <strcmp+0x26>
 182:	0005c703          	lbu	a4,0(a1)
 186:	fef709e3          	beq	a4,a5,178 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 18a:	0005c503          	lbu	a0,0(a1)
}
 18e:	40a7853b          	subw	a0,a5,a0
 192:	6422                	ld	s0,8(sp)
 194:	0141                	addi	sp,sp,16
 196:	8082                	ret

0000000000000198 <strlen>:

uint
strlen(const char *s)
{
 198:	1141                	addi	sp,sp,-16
 19a:	e422                	sd	s0,8(sp)
 19c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 19e:	00054783          	lbu	a5,0(a0)
 1a2:	cf91                	beqz	a5,1be <strlen+0x26>
 1a4:	0505                	addi	a0,a0,1
 1a6:	87aa                	mv	a5,a0
 1a8:	4685                	li	a3,1
 1aa:	9e89                	subw	a3,a3,a0
 1ac:	00f6853b          	addw	a0,a3,a5
 1b0:	0785                	addi	a5,a5,1
 1b2:	fff7c703          	lbu	a4,-1(a5)
 1b6:	fb7d                	bnez	a4,1ac <strlen+0x14>
    ;
  return n;
}
 1b8:	6422                	ld	s0,8(sp)
 1ba:	0141                	addi	sp,sp,16
 1bc:	8082                	ret
  for(n = 0; s[n]; n++)
 1be:	4501                	li	a0,0
 1c0:	bfe5                	j	1b8 <strlen+0x20>

00000000000001c2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c2:	1141                	addi	sp,sp,-16
 1c4:	e422                	sd	s0,8(sp)
 1c6:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1c8:	ce09                	beqz	a2,1e2 <memset+0x20>
 1ca:	87aa                	mv	a5,a0
 1cc:	fff6071b          	addiw	a4,a2,-1
 1d0:	1702                	slli	a4,a4,0x20
 1d2:	9301                	srli	a4,a4,0x20
 1d4:	0705                	addi	a4,a4,1
 1d6:	972a                	add	a4,a4,a0
    cdst[i] = c;
 1d8:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 1dc:	0785                	addi	a5,a5,1
 1de:	fee79de3          	bne	a5,a4,1d8 <memset+0x16>
  }
  return dst;
}
 1e2:	6422                	ld	s0,8(sp)
 1e4:	0141                	addi	sp,sp,16
 1e6:	8082                	ret

00000000000001e8 <strchr>:

char*
strchr(const char *s, char c)
{
 1e8:	1141                	addi	sp,sp,-16
 1ea:	e422                	sd	s0,8(sp)
 1ec:	0800                	addi	s0,sp,16
  for(; *s; s++)
 1ee:	00054783          	lbu	a5,0(a0)
 1f2:	cf91                	beqz	a5,20e <strchr+0x26>
    if(*s == c)
 1f4:	00f58a63          	beq	a1,a5,208 <strchr+0x20>
  for(; *s; s++)
 1f8:	0505                	addi	a0,a0,1
 1fa:	00054783          	lbu	a5,0(a0)
 1fe:	c781                	beqz	a5,206 <strchr+0x1e>
    if(*s == c)
 200:	feb79ce3          	bne	a5,a1,1f8 <strchr+0x10>
 204:	a011                	j	208 <strchr+0x20>
      return (char*)s;
  return 0;
 206:	4501                	li	a0,0
}
 208:	6422                	ld	s0,8(sp)
 20a:	0141                	addi	sp,sp,16
 20c:	8082                	ret
  return 0;
 20e:	4501                	li	a0,0
 210:	bfe5                	j	208 <strchr+0x20>

0000000000000212 <gets>:

char*
gets(char *buf, int max)
{
 212:	711d                	addi	sp,sp,-96
 214:	ec86                	sd	ra,88(sp)
 216:	e8a2                	sd	s0,80(sp)
 218:	e4a6                	sd	s1,72(sp)
 21a:	e0ca                	sd	s2,64(sp)
 21c:	fc4e                	sd	s3,56(sp)
 21e:	f852                	sd	s4,48(sp)
 220:	f456                	sd	s5,40(sp)
 222:	f05a                	sd	s6,32(sp)
 224:	ec5e                	sd	s7,24(sp)
 226:	e862                	sd	s8,16(sp)
 228:	1080                	addi	s0,sp,96
 22a:	8c2a                	mv	s8,a0
 22c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22e:	892a                	mv	s2,a0
 230:	4981                	li	s3,0
    cc = read(0, &c, 1);
 232:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 236:	4b29                	li	s6,10
 238:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 23a:	0019849b          	addiw	s1,s3,1
 23e:	0344d763          	ble	s4,s1,26c <gets+0x5a>
    cc = read(0, &c, 1);
 242:	4605                	li	a2,1
 244:	85d6                	mv	a1,s5
 246:	4501                	li	a0,0
 248:	00000097          	auipc	ra,0x0
 24c:	1c4080e7          	jalr	452(ra) # 40c <read>
    if(cc < 1)
 250:	00a05e63          	blez	a0,26c <gets+0x5a>
    buf[i++] = c;
 254:	faf44783          	lbu	a5,-81(s0)
 258:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 25c:	01678763          	beq	a5,s6,26a <gets+0x58>
 260:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 262:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 264:	fd779be3          	bne	a5,s7,23a <gets+0x28>
 268:	a011                	j	26c <gets+0x5a>
  for(i=0; i+1 < max; ){
 26a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 26c:	99e2                	add	s3,s3,s8
 26e:	00098023          	sb	zero,0(s3)
  return buf;
}
 272:	8562                	mv	a0,s8
 274:	60e6                	ld	ra,88(sp)
 276:	6446                	ld	s0,80(sp)
 278:	64a6                	ld	s1,72(sp)
 27a:	6906                	ld	s2,64(sp)
 27c:	79e2                	ld	s3,56(sp)
 27e:	7a42                	ld	s4,48(sp)
 280:	7aa2                	ld	s5,40(sp)
 282:	7b02                	ld	s6,32(sp)
 284:	6be2                	ld	s7,24(sp)
 286:	6c42                	ld	s8,16(sp)
 288:	6125                	addi	sp,sp,96
 28a:	8082                	ret

000000000000028c <stat>:

int
stat(const char *n, struct stat *st)
{
 28c:	1101                	addi	sp,sp,-32
 28e:	ec06                	sd	ra,24(sp)
 290:	e822                	sd	s0,16(sp)
 292:	e426                	sd	s1,8(sp)
 294:	e04a                	sd	s2,0(sp)
 296:	1000                	addi	s0,sp,32
 298:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29a:	4581                	li	a1,0
 29c:	00000097          	auipc	ra,0x0
 2a0:	198080e7          	jalr	408(ra) # 434 <open>
  if(fd < 0)
 2a4:	02054563          	bltz	a0,2ce <stat+0x42>
 2a8:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2aa:	85ca                	mv	a1,s2
 2ac:	00000097          	auipc	ra,0x0
 2b0:	190080e7          	jalr	400(ra) # 43c <fstat>
 2b4:	892a                	mv	s2,a0
  close(fd);
 2b6:	8526                	mv	a0,s1
 2b8:	00000097          	auipc	ra,0x0
 2bc:	164080e7          	jalr	356(ra) # 41c <close>
  return r;
}
 2c0:	854a                	mv	a0,s2
 2c2:	60e2                	ld	ra,24(sp)
 2c4:	6442                	ld	s0,16(sp)
 2c6:	64a2                	ld	s1,8(sp)
 2c8:	6902                	ld	s2,0(sp)
 2ca:	6105                	addi	sp,sp,32
 2cc:	8082                	ret
    return -1;
 2ce:	597d                	li	s2,-1
 2d0:	bfc5                	j	2c0 <stat+0x34>

00000000000002d2 <atoi>:

int
atoi(const char *s)
{
 2d2:	1141                	addi	sp,sp,-16
 2d4:	e422                	sd	s0,8(sp)
 2d6:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 2d8:	00054703          	lbu	a4,0(a0)
 2dc:	02d00793          	li	a5,45
  int neg = 1;
 2e0:	4805                	li	a6,1
  if (*s == '-') {
 2e2:	04f70363          	beq	a4,a5,328 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 2e6:	00054683          	lbu	a3,0(a0)
 2ea:	fd06879b          	addiw	a5,a3,-48
 2ee:	0ff7f793          	andi	a5,a5,255
 2f2:	4725                	li	a4,9
 2f4:	02f76d63          	bltu	a4,a5,32e <atoi+0x5c>
  n = 0;
 2f8:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 2fa:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 2fc:	0505                	addi	a0,a0,1
 2fe:	0026179b          	slliw	a5,a2,0x2
 302:	9fb1                	addw	a5,a5,a2
 304:	0017979b          	slliw	a5,a5,0x1
 308:	9fb5                	addw	a5,a5,a3
 30a:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 30e:	00054683          	lbu	a3,0(a0)
 312:	fd06871b          	addiw	a4,a3,-48
 316:	0ff77713          	andi	a4,a4,255
 31a:	fee5f1e3          	bleu	a4,a1,2fc <atoi+0x2a>
  return n * neg;
}
 31e:	02c8053b          	mulw	a0,a6,a2
 322:	6422                	ld	s0,8(sp)
 324:	0141                	addi	sp,sp,16
 326:	8082                	ret
    s++;
 328:	0505                	addi	a0,a0,1
    neg = -1;
 32a:	587d                	li	a6,-1
 32c:	bf6d                	j	2e6 <atoi+0x14>
  n = 0;
 32e:	4601                	li	a2,0
 330:	b7fd                	j	31e <atoi+0x4c>

0000000000000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	1141                	addi	sp,sp,-16
 334:	e422                	sd	s0,8(sp)
 336:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 338:	02b57663          	bleu	a1,a0,364 <memmove+0x32>
    while(n-- > 0)
 33c:	02c05163          	blez	a2,35e <memmove+0x2c>
 340:	fff6079b          	addiw	a5,a2,-1
 344:	1782                	slli	a5,a5,0x20
 346:	9381                	srli	a5,a5,0x20
 348:	0785                	addi	a5,a5,1
 34a:	97aa                	add	a5,a5,a0
  dst = vdst;
 34c:	872a                	mv	a4,a0
      *dst++ = *src++;
 34e:	0585                	addi	a1,a1,1
 350:	0705                	addi	a4,a4,1
 352:	fff5c683          	lbu	a3,-1(a1)
 356:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 35a:	fee79ae3          	bne	a5,a4,34e <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 35e:	6422                	ld	s0,8(sp)
 360:	0141                	addi	sp,sp,16
 362:	8082                	ret
    dst += n;
 364:	00c50733          	add	a4,a0,a2
    src += n;
 368:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 36a:	fec05ae3          	blez	a2,35e <memmove+0x2c>
 36e:	fff6079b          	addiw	a5,a2,-1
 372:	1782                	slli	a5,a5,0x20
 374:	9381                	srli	a5,a5,0x20
 376:	fff7c793          	not	a5,a5
 37a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 37c:	15fd                	addi	a1,a1,-1
 37e:	177d                	addi	a4,a4,-1
 380:	0005c683          	lbu	a3,0(a1)
 384:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 388:	fef71ae3          	bne	a4,a5,37c <memmove+0x4a>
 38c:	bfc9                	j	35e <memmove+0x2c>

000000000000038e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 38e:	1141                	addi	sp,sp,-16
 390:	e422                	sd	s0,8(sp)
 392:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 394:	ce15                	beqz	a2,3d0 <memcmp+0x42>
 396:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 39a:	00054783          	lbu	a5,0(a0)
 39e:	0005c703          	lbu	a4,0(a1)
 3a2:	02e79063          	bne	a5,a4,3c2 <memcmp+0x34>
 3a6:	1682                	slli	a3,a3,0x20
 3a8:	9281                	srli	a3,a3,0x20
 3aa:	0685                	addi	a3,a3,1
 3ac:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 3ae:	0505                	addi	a0,a0,1
    p2++;
 3b0:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3b2:	00d50d63          	beq	a0,a3,3cc <memcmp+0x3e>
    if (*p1 != *p2) {
 3b6:	00054783          	lbu	a5,0(a0)
 3ba:	0005c703          	lbu	a4,0(a1)
 3be:	fee788e3          	beq	a5,a4,3ae <memcmp+0x20>
      return *p1 - *p2;
 3c2:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 3c6:	6422                	ld	s0,8(sp)
 3c8:	0141                	addi	sp,sp,16
 3ca:	8082                	ret
  return 0;
 3cc:	4501                	li	a0,0
 3ce:	bfe5                	j	3c6 <memcmp+0x38>
 3d0:	4501                	li	a0,0
 3d2:	bfd5                	j	3c6 <memcmp+0x38>

00000000000003d4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3d4:	1141                	addi	sp,sp,-16
 3d6:	e406                	sd	ra,8(sp)
 3d8:	e022                	sd	s0,0(sp)
 3da:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3dc:	00000097          	auipc	ra,0x0
 3e0:	f56080e7          	jalr	-170(ra) # 332 <memmove>
}
 3e4:	60a2                	ld	ra,8(sp)
 3e6:	6402                	ld	s0,0(sp)
 3e8:	0141                	addi	sp,sp,16
 3ea:	8082                	ret

00000000000003ec <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 3ec:	4885                	li	a7,1
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3f4:	4889                	li	a7,2
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <wait>:
.global wait
wait:
 li a7, SYS_wait
 3fc:	488d                	li	a7,3
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 404:	4891                	li	a7,4
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <read>:
.global read
read:
 li a7, SYS_read
 40c:	4895                	li	a7,5
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <write>:
.global write
write:
 li a7, SYS_write
 414:	48c1                	li	a7,16
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <close>:
.global close
close:
 li a7, SYS_close
 41c:	48d5                	li	a7,21
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <kill>:
.global kill
kill:
 li a7, SYS_kill
 424:	4899                	li	a7,6
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <exec>:
.global exec
exec:
 li a7, SYS_exec
 42c:	489d                	li	a7,7
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <open>:
.global open
open:
 li a7, SYS_open
 434:	48bd                	li	a7,15
 ecall
 436:	00000073          	ecall
 ret
 43a:	8082                	ret

000000000000043c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 43c:	48a1                	li	a7,8
 ecall
 43e:	00000073          	ecall
 ret
 442:	8082                	ret

0000000000000444 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 444:	48d1                	li	a7,20
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 44c:	48a5                	li	a7,9
 ecall
 44e:	00000073          	ecall
 ret
 452:	8082                	ret

0000000000000454 <dup>:
.global dup
dup:
 li a7, SYS_dup
 454:	48a9                	li	a7,10
 ecall
 456:	00000073          	ecall
 ret
 45a:	8082                	ret

000000000000045c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 45c:	48ad                	li	a7,11
 ecall
 45e:	00000073          	ecall
 ret
 462:	8082                	ret

0000000000000464 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 464:	48b1                	li	a7,12
 ecall
 466:	00000073          	ecall
 ret
 46a:	8082                	ret

000000000000046c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 46c:	48b5                	li	a7,13
 ecall
 46e:	00000073          	ecall
 ret
 472:	8082                	ret

0000000000000474 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 474:	48b9                	li	a7,14
 ecall
 476:	00000073          	ecall
 ret
 47a:	8082                	ret

000000000000047c <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 47c:	48d9                	li	a7,22
 ecall
 47e:	00000073          	ecall
 ret
 482:	8082                	ret

0000000000000484 <dev>:
.global dev
dev:
 li a7, SYS_dev
 484:	48dd                	li	a7,23
 ecall
 486:	00000073          	ecall
 ret
 48a:	8082                	ret

000000000000048c <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 48c:	48e1                	li	a7,24
 ecall
 48e:	00000073          	ecall
 ret
 492:	8082                	ret

0000000000000494 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 494:	48e5                	li	a7,25
 ecall
 496:	00000073          	ecall
 ret
 49a:	8082                	ret

000000000000049c <remove>:
.global remove
remove:
 li a7, SYS_remove
 49c:	48c5                	li	a7,17
 ecall
 49e:	00000073          	ecall
 ret
 4a2:	8082                	ret

00000000000004a4 <trace>:
.global trace
trace:
 li a7, SYS_trace
 4a4:	48c9                	li	a7,18
 ecall
 4a6:	00000073          	ecall
 ret
 4aa:	8082                	ret

00000000000004ac <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 4ac:	48cd                	li	a7,19
 ecall
 4ae:	00000073          	ecall
 ret
 4b2:	8082                	ret

00000000000004b4 <rename>:
.global rename
rename:
 li a7, SYS_rename
 4b4:	48e9                	li	a7,26
 ecall
 4b6:	00000073          	ecall
 ret
 4ba:	8082                	ret

00000000000004bc <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 4bc:	48ed                	li	a7,27
 ecall
 4be:	00000073          	ecall
 ret
 4c2:	8082                	ret

00000000000004c4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4c4:	1101                	addi	sp,sp,-32
 4c6:	ec06                	sd	ra,24(sp)
 4c8:	e822                	sd	s0,16(sp)
 4ca:	1000                	addi	s0,sp,32
 4cc:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4d0:	4605                	li	a2,1
 4d2:	fef40593          	addi	a1,s0,-17
 4d6:	00000097          	auipc	ra,0x0
 4da:	f3e080e7          	jalr	-194(ra) # 414 <write>
}
 4de:	60e2                	ld	ra,24(sp)
 4e0:	6442                	ld	s0,16(sp)
 4e2:	6105                	addi	sp,sp,32
 4e4:	8082                	ret

00000000000004e6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e6:	7139                	addi	sp,sp,-64
 4e8:	fc06                	sd	ra,56(sp)
 4ea:	f822                	sd	s0,48(sp)
 4ec:	f426                	sd	s1,40(sp)
 4ee:	f04a                	sd	s2,32(sp)
 4f0:	ec4e                	sd	s3,24(sp)
 4f2:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4f4:	c299                	beqz	a3,4fa <printint+0x14>
 4f6:	0005ce63          	bltz	a1,512 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4fa:	2581                	sext.w	a1,a1
  neg = 0;
 4fc:	4301                	li	t1,0
  }

  i = 0;
 4fe:	fc040913          	addi	s2,s0,-64
  neg = 0;
 502:	874a                	mv	a4,s2
  i = 0;
 504:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 506:	2601                	sext.w	a2,a2
 508:	00000897          	auipc	a7,0x0
 50c:	48088893          	addi	a7,a7,1152 # 988 <digits>
 510:	a801                	j	520 <printint+0x3a>
    x = -xx;
 512:	40b005bb          	negw	a1,a1
 516:	2581                	sext.w	a1,a1
    neg = 1;
 518:	4305                	li	t1,1
    x = -xx;
 51a:	b7d5                	j	4fe <printint+0x18>
  }while((x /= base) != 0);
 51c:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 51e:	8836                	mv	a6,a3
 520:	0018069b          	addiw	a3,a6,1
 524:	02c5f7bb          	remuw	a5,a1,a2
 528:	1782                	slli	a5,a5,0x20
 52a:	9381                	srli	a5,a5,0x20
 52c:	97c6                	add	a5,a5,a7
 52e:	0007c783          	lbu	a5,0(a5)
 532:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 536:	0705                	addi	a4,a4,1
 538:	02c5d7bb          	divuw	a5,a1,a2
 53c:	fec5f0e3          	bleu	a2,a1,51c <printint+0x36>
  if(neg)
 540:	00030b63          	beqz	t1,556 <printint+0x70>
    buf[i++] = '-';
 544:	fd040793          	addi	a5,s0,-48
 548:	96be                	add	a3,a3,a5
 54a:	02d00793          	li	a5,45
 54e:	fef68823          	sb	a5,-16(a3)
 552:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 556:	02d05763          	blez	a3,584 <printint+0x9e>
 55a:	89aa                	mv	s3,a0
 55c:	fc040493          	addi	s1,s0,-64
 560:	94b6                	add	s1,s1,a3
 562:	197d                	addi	s2,s2,-1
 564:	9936                	add	s2,s2,a3
 566:	36fd                	addiw	a3,a3,-1
 568:	1682                	slli	a3,a3,0x20
 56a:	9281                	srli	a3,a3,0x20
 56c:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 570:	fff4c583          	lbu	a1,-1(s1)
 574:	854e                	mv	a0,s3
 576:	00000097          	auipc	ra,0x0
 57a:	f4e080e7          	jalr	-178(ra) # 4c4 <putc>
  while(--i >= 0)
 57e:	14fd                	addi	s1,s1,-1
 580:	ff2498e3          	bne	s1,s2,570 <printint+0x8a>
}
 584:	70e2                	ld	ra,56(sp)
 586:	7442                	ld	s0,48(sp)
 588:	74a2                	ld	s1,40(sp)
 58a:	7902                	ld	s2,32(sp)
 58c:	69e2                	ld	s3,24(sp)
 58e:	6121                	addi	sp,sp,64
 590:	8082                	ret

0000000000000592 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 592:	7119                	addi	sp,sp,-128
 594:	fc86                	sd	ra,120(sp)
 596:	f8a2                	sd	s0,112(sp)
 598:	f4a6                	sd	s1,104(sp)
 59a:	f0ca                	sd	s2,96(sp)
 59c:	ecce                	sd	s3,88(sp)
 59e:	e8d2                	sd	s4,80(sp)
 5a0:	e4d6                	sd	s5,72(sp)
 5a2:	e0da                	sd	s6,64(sp)
 5a4:	fc5e                	sd	s7,56(sp)
 5a6:	f862                	sd	s8,48(sp)
 5a8:	f466                	sd	s9,40(sp)
 5aa:	f06a                	sd	s10,32(sp)
 5ac:	ec6e                	sd	s11,24(sp)
 5ae:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5b0:	0005c483          	lbu	s1,0(a1)
 5b4:	18048d63          	beqz	s1,74e <vprintf+0x1bc>
 5b8:	8aaa                	mv	s5,a0
 5ba:	8b32                	mv	s6,a2
 5bc:	00158913          	addi	s2,a1,1
  state = 0;
 5c0:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5c2:	02500a13          	li	s4,37
      if(c == 'd'){
 5c6:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5ca:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5ce:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5d2:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5d6:	00000b97          	auipc	s7,0x0
 5da:	3b2b8b93          	addi	s7,s7,946 # 988 <digits>
 5de:	a839                	j	5fc <vprintf+0x6a>
        putc(fd, c);
 5e0:	85a6                	mv	a1,s1
 5e2:	8556                	mv	a0,s5
 5e4:	00000097          	auipc	ra,0x0
 5e8:	ee0080e7          	jalr	-288(ra) # 4c4 <putc>
 5ec:	a019                	j	5f2 <vprintf+0x60>
    } else if(state == '%'){
 5ee:	01498f63          	beq	s3,s4,60c <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 5f2:	0905                	addi	s2,s2,1
 5f4:	fff94483          	lbu	s1,-1(s2)
 5f8:	14048b63          	beqz	s1,74e <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 5fc:	0004879b          	sext.w	a5,s1
    if(state == 0){
 600:	fe0997e3          	bnez	s3,5ee <vprintf+0x5c>
      if(c == '%'){
 604:	fd479ee3          	bne	a5,s4,5e0 <vprintf+0x4e>
        state = '%';
 608:	89be                	mv	s3,a5
 60a:	b7e5                	j	5f2 <vprintf+0x60>
      if(c == 'd'){
 60c:	05878063          	beq	a5,s8,64c <vprintf+0xba>
      } else if(c == 'l') {
 610:	05978c63          	beq	a5,s9,668 <vprintf+0xd6>
      } else if(c == 'x') {
 614:	07a78863          	beq	a5,s10,684 <vprintf+0xf2>
      } else if(c == 'p') {
 618:	09b78463          	beq	a5,s11,6a0 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 61c:	07300713          	li	a4,115
 620:	0ce78563          	beq	a5,a4,6ea <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 624:	06300713          	li	a4,99
 628:	0ee78c63          	beq	a5,a4,720 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 62c:	11478663          	beq	a5,s4,738 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 630:	85d2                	mv	a1,s4
 632:	8556                	mv	a0,s5
 634:	00000097          	auipc	ra,0x0
 638:	e90080e7          	jalr	-368(ra) # 4c4 <putc>
        putc(fd, c);
 63c:	85a6                	mv	a1,s1
 63e:	8556                	mv	a0,s5
 640:	00000097          	auipc	ra,0x0
 644:	e84080e7          	jalr	-380(ra) # 4c4 <putc>
      }
      state = 0;
 648:	4981                	li	s3,0
 64a:	b765                	j	5f2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 64c:	008b0493          	addi	s1,s6,8
 650:	4685                	li	a3,1
 652:	4629                	li	a2,10
 654:	000b2583          	lw	a1,0(s6)
 658:	8556                	mv	a0,s5
 65a:	00000097          	auipc	ra,0x0
 65e:	e8c080e7          	jalr	-372(ra) # 4e6 <printint>
 662:	8b26                	mv	s6,s1
      state = 0;
 664:	4981                	li	s3,0
 666:	b771                	j	5f2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 668:	008b0493          	addi	s1,s6,8
 66c:	4681                	li	a3,0
 66e:	4629                	li	a2,10
 670:	000b2583          	lw	a1,0(s6)
 674:	8556                	mv	a0,s5
 676:	00000097          	auipc	ra,0x0
 67a:	e70080e7          	jalr	-400(ra) # 4e6 <printint>
 67e:	8b26                	mv	s6,s1
      state = 0;
 680:	4981                	li	s3,0
 682:	bf85                	j	5f2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 684:	008b0493          	addi	s1,s6,8
 688:	4681                	li	a3,0
 68a:	4641                	li	a2,16
 68c:	000b2583          	lw	a1,0(s6)
 690:	8556                	mv	a0,s5
 692:	00000097          	auipc	ra,0x0
 696:	e54080e7          	jalr	-428(ra) # 4e6 <printint>
 69a:	8b26                	mv	s6,s1
      state = 0;
 69c:	4981                	li	s3,0
 69e:	bf91                	j	5f2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6a0:	008b0793          	addi	a5,s6,8
 6a4:	f8f43423          	sd	a5,-120(s0)
 6a8:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6ac:	03000593          	li	a1,48
 6b0:	8556                	mv	a0,s5
 6b2:	00000097          	auipc	ra,0x0
 6b6:	e12080e7          	jalr	-494(ra) # 4c4 <putc>
  putc(fd, 'x');
 6ba:	85ea                	mv	a1,s10
 6bc:	8556                	mv	a0,s5
 6be:	00000097          	auipc	ra,0x0
 6c2:	e06080e7          	jalr	-506(ra) # 4c4 <putc>
 6c6:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6c8:	03c9d793          	srli	a5,s3,0x3c
 6cc:	97de                	add	a5,a5,s7
 6ce:	0007c583          	lbu	a1,0(a5)
 6d2:	8556                	mv	a0,s5
 6d4:	00000097          	auipc	ra,0x0
 6d8:	df0080e7          	jalr	-528(ra) # 4c4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6dc:	0992                	slli	s3,s3,0x4
 6de:	34fd                	addiw	s1,s1,-1
 6e0:	f4e5                	bnez	s1,6c8 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6e2:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6e6:	4981                	li	s3,0
 6e8:	b729                	j	5f2 <vprintf+0x60>
        s = va_arg(ap, char*);
 6ea:	008b0993          	addi	s3,s6,8
 6ee:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 6f2:	c085                	beqz	s1,712 <vprintf+0x180>
        while(*s != 0){
 6f4:	0004c583          	lbu	a1,0(s1)
 6f8:	c9a1                	beqz	a1,748 <vprintf+0x1b6>
          putc(fd, *s);
 6fa:	8556                	mv	a0,s5
 6fc:	00000097          	auipc	ra,0x0
 700:	dc8080e7          	jalr	-568(ra) # 4c4 <putc>
          s++;
 704:	0485                	addi	s1,s1,1
        while(*s != 0){
 706:	0004c583          	lbu	a1,0(s1)
 70a:	f9e5                	bnez	a1,6fa <vprintf+0x168>
        s = va_arg(ap, char*);
 70c:	8b4e                	mv	s6,s3
      state = 0;
 70e:	4981                	li	s3,0
 710:	b5cd                	j	5f2 <vprintf+0x60>
          s = "(null)";
 712:	00000497          	auipc	s1,0x0
 716:	28e48493          	addi	s1,s1,654 # 9a0 <digits+0x18>
        while(*s != 0){
 71a:	02800593          	li	a1,40
 71e:	bff1                	j	6fa <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 720:	008b0493          	addi	s1,s6,8
 724:	000b4583          	lbu	a1,0(s6)
 728:	8556                	mv	a0,s5
 72a:	00000097          	auipc	ra,0x0
 72e:	d9a080e7          	jalr	-614(ra) # 4c4 <putc>
 732:	8b26                	mv	s6,s1
      state = 0;
 734:	4981                	li	s3,0
 736:	bd75                	j	5f2 <vprintf+0x60>
        putc(fd, c);
 738:	85d2                	mv	a1,s4
 73a:	8556                	mv	a0,s5
 73c:	00000097          	auipc	ra,0x0
 740:	d88080e7          	jalr	-632(ra) # 4c4 <putc>
      state = 0;
 744:	4981                	li	s3,0
 746:	b575                	j	5f2 <vprintf+0x60>
        s = va_arg(ap, char*);
 748:	8b4e                	mv	s6,s3
      state = 0;
 74a:	4981                	li	s3,0
 74c:	b55d                	j	5f2 <vprintf+0x60>
    }
  }
}
 74e:	70e6                	ld	ra,120(sp)
 750:	7446                	ld	s0,112(sp)
 752:	74a6                	ld	s1,104(sp)
 754:	7906                	ld	s2,96(sp)
 756:	69e6                	ld	s3,88(sp)
 758:	6a46                	ld	s4,80(sp)
 75a:	6aa6                	ld	s5,72(sp)
 75c:	6b06                	ld	s6,64(sp)
 75e:	7be2                	ld	s7,56(sp)
 760:	7c42                	ld	s8,48(sp)
 762:	7ca2                	ld	s9,40(sp)
 764:	7d02                	ld	s10,32(sp)
 766:	6de2                	ld	s11,24(sp)
 768:	6109                	addi	sp,sp,128
 76a:	8082                	ret

000000000000076c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 76c:	715d                	addi	sp,sp,-80
 76e:	ec06                	sd	ra,24(sp)
 770:	e822                	sd	s0,16(sp)
 772:	1000                	addi	s0,sp,32
 774:	e010                	sd	a2,0(s0)
 776:	e414                	sd	a3,8(s0)
 778:	e818                	sd	a4,16(s0)
 77a:	ec1c                	sd	a5,24(s0)
 77c:	03043023          	sd	a6,32(s0)
 780:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 784:	8622                	mv	a2,s0
 786:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 78a:	00000097          	auipc	ra,0x0
 78e:	e08080e7          	jalr	-504(ra) # 592 <vprintf>
}
 792:	60e2                	ld	ra,24(sp)
 794:	6442                	ld	s0,16(sp)
 796:	6161                	addi	sp,sp,80
 798:	8082                	ret

000000000000079a <printf>:

void
printf(const char *fmt, ...)
{
 79a:	711d                	addi	sp,sp,-96
 79c:	ec06                	sd	ra,24(sp)
 79e:	e822                	sd	s0,16(sp)
 7a0:	1000                	addi	s0,sp,32
 7a2:	e40c                	sd	a1,8(s0)
 7a4:	e810                	sd	a2,16(s0)
 7a6:	ec14                	sd	a3,24(s0)
 7a8:	f018                	sd	a4,32(s0)
 7aa:	f41c                	sd	a5,40(s0)
 7ac:	03043823          	sd	a6,48(s0)
 7b0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7b4:	00840613          	addi	a2,s0,8
 7b8:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7bc:	85aa                	mv	a1,a0
 7be:	4505                	li	a0,1
 7c0:	00000097          	auipc	ra,0x0
 7c4:	dd2080e7          	jalr	-558(ra) # 592 <vprintf>
}
 7c8:	60e2                	ld	ra,24(sp)
 7ca:	6442                	ld	s0,16(sp)
 7cc:	6125                	addi	sp,sp,96
 7ce:	8082                	ret

00000000000007d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7d0:	1141                	addi	sp,sp,-16
 7d2:	e422                	sd	s0,8(sp)
 7d4:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d6:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7da:	00000797          	auipc	a5,0x0
 7de:	3ce78793          	addi	a5,a5,974 # ba8 <freep>
 7e2:	639c                	ld	a5,0(a5)
 7e4:	a805                	j	814 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7e6:	4618                	lw	a4,8(a2)
 7e8:	9db9                	addw	a1,a1,a4
 7ea:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ee:	6398                	ld	a4,0(a5)
 7f0:	6318                	ld	a4,0(a4)
 7f2:	fee53823          	sd	a4,-16(a0)
 7f6:	a091                	j	83a <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7f8:	ff852703          	lw	a4,-8(a0)
 7fc:	9e39                	addw	a2,a2,a4
 7fe:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 800:	ff053703          	ld	a4,-16(a0)
 804:	e398                	sd	a4,0(a5)
 806:	a099                	j	84c <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 808:	6398                	ld	a4,0(a5)
 80a:	00e7e463          	bltu	a5,a4,812 <free+0x42>
 80e:	00e6ea63          	bltu	a3,a4,822 <free+0x52>
{
 812:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 814:	fed7fae3          	bleu	a3,a5,808 <free+0x38>
 818:	6398                	ld	a4,0(a5)
 81a:	00e6e463          	bltu	a3,a4,822 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81e:	fee7eae3          	bltu	a5,a4,812 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 822:	ff852583          	lw	a1,-8(a0)
 826:	6390                	ld	a2,0(a5)
 828:	02059713          	slli	a4,a1,0x20
 82c:	9301                	srli	a4,a4,0x20
 82e:	0712                	slli	a4,a4,0x4
 830:	9736                	add	a4,a4,a3
 832:	fae60ae3          	beq	a2,a4,7e6 <free+0x16>
    bp->s.ptr = p->s.ptr;
 836:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 83a:	4790                	lw	a2,8(a5)
 83c:	02061713          	slli	a4,a2,0x20
 840:	9301                	srli	a4,a4,0x20
 842:	0712                	slli	a4,a4,0x4
 844:	973e                	add	a4,a4,a5
 846:	fae689e3          	beq	a3,a4,7f8 <free+0x28>
  } else
    p->s.ptr = bp;
 84a:	e394                	sd	a3,0(a5)
  freep = p;
 84c:	00000717          	auipc	a4,0x0
 850:	34f73e23          	sd	a5,860(a4) # ba8 <freep>
}
 854:	6422                	ld	s0,8(sp)
 856:	0141                	addi	sp,sp,16
 858:	8082                	ret

000000000000085a <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 85a:	7139                	addi	sp,sp,-64
 85c:	fc06                	sd	ra,56(sp)
 85e:	f822                	sd	s0,48(sp)
 860:	f426                	sd	s1,40(sp)
 862:	f04a                	sd	s2,32(sp)
 864:	ec4e                	sd	s3,24(sp)
 866:	e852                	sd	s4,16(sp)
 868:	e456                	sd	s5,8(sp)
 86a:	e05a                	sd	s6,0(sp)
 86c:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86e:	02051993          	slli	s3,a0,0x20
 872:	0209d993          	srli	s3,s3,0x20
 876:	09bd                	addi	s3,s3,15
 878:	0049d993          	srli	s3,s3,0x4
 87c:	2985                	addiw	s3,s3,1
 87e:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 882:	00000797          	auipc	a5,0x0
 886:	32678793          	addi	a5,a5,806 # ba8 <freep>
 88a:	6388                	ld	a0,0(a5)
 88c:	c515                	beqz	a0,8b8 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 890:	4798                	lw	a4,8(a5)
 892:	03277d63          	bleu	s2,a4,8cc <malloc+0x72>
 896:	8a4e                	mv	s4,s3
 898:	0009871b          	sext.w	a4,s3
 89c:	6685                	lui	a3,0x1
 89e:	00d77363          	bleu	a3,a4,8a4 <malloc+0x4a>
 8a2:	6a05                	lui	s4,0x1
 8a4:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 8a8:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8ac:	00000497          	auipc	s1,0x0
 8b0:	2fc48493          	addi	s1,s1,764 # ba8 <freep>
  if(p == (char*)-1)
 8b4:	5b7d                	li	s6,-1
 8b6:	a0b5                	j	922 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8b8:	00000717          	auipc	a4,0x0
 8bc:	2f870713          	addi	a4,a4,760 # bb0 <base>
 8c0:	e398                	sd	a4,0(a5)
 8c2:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 8c4:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	87ba                	mv	a5,a4
 8ca:	b7f1                	j	896 <malloc+0x3c>
      if(p->s.size == nunits)
 8cc:	02e90b63          	beq	s2,a4,902 <malloc+0xa8>
        p->s.size -= nunits;
 8d0:	4137073b          	subw	a4,a4,s3
 8d4:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8d6:	1702                	slli	a4,a4,0x20
 8d8:	9301                	srli	a4,a4,0x20
 8da:	0712                	slli	a4,a4,0x4
 8dc:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8de:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8e2:	00000717          	auipc	a4,0x0
 8e6:	2ca73323          	sd	a0,710(a4) # ba8 <freep>
      return (void*)(p + 1);
 8ea:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ee:	70e2                	ld	ra,56(sp)
 8f0:	7442                	ld	s0,48(sp)
 8f2:	74a2                	ld	s1,40(sp)
 8f4:	7902                	ld	s2,32(sp)
 8f6:	69e2                	ld	s3,24(sp)
 8f8:	6a42                	ld	s4,16(sp)
 8fa:	6aa2                	ld	s5,8(sp)
 8fc:	6b02                	ld	s6,0(sp)
 8fe:	6121                	addi	sp,sp,64
 900:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 902:	6398                	ld	a4,0(a5)
 904:	e118                	sd	a4,0(a0)
 906:	bff1                	j	8e2 <malloc+0x88>
  hp->s.size = nu;
 908:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 90c:	0541                	addi	a0,a0,16
 90e:	00000097          	auipc	ra,0x0
 912:	ec2080e7          	jalr	-318(ra) # 7d0 <free>
  return freep;
 916:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 918:	d979                	beqz	a0,8ee <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 91c:	4798                	lw	a4,8(a5)
 91e:	fb2777e3          	bleu	s2,a4,8cc <malloc+0x72>
    if(p == freep)
 922:	6098                	ld	a4,0(s1)
 924:	853e                	mv	a0,a5
 926:	fef71ae3          	bne	a4,a5,91a <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 92a:	8552                	mv	a0,s4
 92c:	00000097          	auipc	ra,0x0
 930:	b38080e7          	jalr	-1224(ra) # 464 <sbrk>
  if(p == (char*)-1)
 934:	fd651ae3          	bne	a0,s6,908 <malloc+0xae>
        return 0;
 938:	4501                	li	a0,0
 93a:	bf55                	j	8ee <malloc+0x94>
