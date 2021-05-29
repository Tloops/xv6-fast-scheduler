
xv6-user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	7119                	addi	sp,sp,-128
   2:	fc86                	sd	ra,120(sp)
   4:	f8a2                	sd	s0,112(sp)
   6:	f4a6                	sd	s1,104(sp)
   8:	f0ca                	sd	s2,96(sp)
   a:	ecce                	sd	s3,88(sp)
   c:	e8d2                	sd	s4,80(sp)
   e:	e4d6                	sd	s5,72(sp)
  10:	e0da                	sd	s6,64(sp)
  12:	fc5e                	sd	s7,56(sp)
  14:	f862                	sd	s8,48(sp)
  16:	f466                	sd	s9,40(sp)
  18:	f06a                	sd	s10,32(sp)
  1a:	ec6e                	sd	s11,24(sp)
  1c:	0100                	addi	s0,sp,128
  1e:	f8a43423          	sd	a0,-120(s0)
  22:	f8b43023          	sd	a1,-128(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  26:	4981                	li	s3,0
  l = w = c = 0;
  28:	4d01                	li	s10,0
  2a:	4c81                	li	s9,0
  2c:	4c01                	li	s8,0
  2e:	00001d97          	auipc	s11,0x1
  32:	a23d8d93          	addi	s11,s11,-1501 # a51 <buf+0x1>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  36:	4aa9                	li	s5,10
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  38:	00001a17          	auipc	s4,0x1
  3c:	998a0a13          	addi	s4,s4,-1640 # 9d0 <malloc+0xe8>
        inword = 0;
  40:	4b81                	li	s7,0
  while((n = read(fd, buf, sizeof(buf))) > 0){
  42:	a805                	j	72 <wc+0x72>
      if(strchr(" \r\t\n\v", buf[i]))
  44:	8552                	mv	a0,s4
  46:	00000097          	auipc	ra,0x0
  4a:	230080e7          	jalr	560(ra) # 276 <strchr>
  4e:	c919                	beqz	a0,64 <wc+0x64>
        inword = 0;
  50:	89de                	mv	s3,s7
    for(i=0; i<n; i++){
  52:	0485                	addi	s1,s1,1
  54:	01248d63          	beq	s1,s2,6e <wc+0x6e>
      if(buf[i] == '\n')
  58:	0004c583          	lbu	a1,0(s1)
  5c:	ff5594e3          	bne	a1,s5,44 <wc+0x44>
        l++;
  60:	2c05                	addiw	s8,s8,1
  62:	b7cd                	j	44 <wc+0x44>
      else if(!inword){
  64:	fe0997e3          	bnez	s3,52 <wc+0x52>
        w++;
  68:	2c85                	addiw	s9,s9,1
        inword = 1;
  6a:	4985                	li	s3,1
  6c:	b7dd                	j	52 <wc+0x52>
  6e:	016d0d3b          	addw	s10,s10,s6
  while((n = read(fd, buf, sizeof(buf))) > 0){
  72:	20000613          	li	a2,512
  76:	00001597          	auipc	a1,0x1
  7a:	9da58593          	addi	a1,a1,-1574 # a50 <buf>
  7e:	f8843503          	ld	a0,-120(s0)
  82:	00000097          	auipc	ra,0x0
  86:	418080e7          	jalr	1048(ra) # 49a <read>
  8a:	00a05f63          	blez	a0,a8 <wc+0xa8>
  8e:	00001497          	auipc	s1,0x1
  92:	9c248493          	addi	s1,s1,-1598 # a50 <buf>
  96:	00050b1b          	sext.w	s6,a0
  9a:	fffb091b          	addiw	s2,s6,-1
  9e:	1902                	slli	s2,s2,0x20
  a0:	02095913          	srli	s2,s2,0x20
  a4:	996e                	add	s2,s2,s11
  a6:	bf4d                	j	58 <wc+0x58>
      }
    }
  }
  if(n < 0){
  a8:	02054e63          	bltz	a0,e4 <wc+0xe4>
    printf("wc: read error\n");
    exit(1);
  }
  printf("%d\t%d\t%d\t%s\n", l, w, c, name);
  ac:	f8043703          	ld	a4,-128(s0)
  b0:	86ea                	mv	a3,s10
  b2:	8666                	mv	a2,s9
  b4:	85e2                	mv	a1,s8
  b6:	00001517          	auipc	a0,0x1
  ba:	93250513          	addi	a0,a0,-1742 # 9e8 <malloc+0x100>
  be:	00000097          	auipc	ra,0x0
  c2:	76a080e7          	jalr	1898(ra) # 828 <printf>
}
  c6:	70e6                	ld	ra,120(sp)
  c8:	7446                	ld	s0,112(sp)
  ca:	74a6                	ld	s1,104(sp)
  cc:	7906                	ld	s2,96(sp)
  ce:	69e6                	ld	s3,88(sp)
  d0:	6a46                	ld	s4,80(sp)
  d2:	6aa6                	ld	s5,72(sp)
  d4:	6b06                	ld	s6,64(sp)
  d6:	7be2                	ld	s7,56(sp)
  d8:	7c42                	ld	s8,48(sp)
  da:	7ca2                	ld	s9,40(sp)
  dc:	7d02                	ld	s10,32(sp)
  de:	6de2                	ld	s11,24(sp)
  e0:	6109                	addi	sp,sp,128
  e2:	8082                	ret
    printf("wc: read error\n");
  e4:	00001517          	auipc	a0,0x1
  e8:	8f450513          	addi	a0,a0,-1804 # 9d8 <malloc+0xf0>
  ec:	00000097          	auipc	ra,0x0
  f0:	73c080e7          	jalr	1852(ra) # 828 <printf>
    exit(1);
  f4:	4505                	li	a0,1
  f6:	00000097          	auipc	ra,0x0
  fa:	38c080e7          	jalr	908(ra) # 482 <exit>

00000000000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	7179                	addi	sp,sp,-48
 100:	f406                	sd	ra,40(sp)
 102:	f022                	sd	s0,32(sp)
 104:	ec26                	sd	s1,24(sp)
 106:	e84a                	sd	s2,16(sp)
 108:	e44e                	sd	s3,8(sp)
 10a:	e052                	sd	s4,0(sp)
 10c:	1800                	addi	s0,sp,48
  int fd, i;

  if(argc <= 1){
 10e:	4785                	li	a5,1
 110:	06a7d063          	ble	a0,a5,170 <main+0x72>
 114:	89aa                	mv	s3,a0
 116:	8a2e                	mv	s4,a1
    wc(0, "");
    exit(0);
  }

  printf("LINE\tWORD\tBYTE\tFILE\n");
 118:	00001517          	auipc	a0,0x1
 11c:	8e850513          	addi	a0,a0,-1816 # a00 <malloc+0x118>
 120:	00000097          	auipc	ra,0x0
 124:	708080e7          	jalr	1800(ra) # 828 <printf>
  for(i = 1; i < argc; i++){
 128:	008a0493          	addi	s1,s4,8
 12c:	39f9                	addiw	s3,s3,-2
 12e:	1982                	slli	s3,s3,0x20
 130:	0209d993          	srli	s3,s3,0x20
 134:	098e                	slli	s3,s3,0x3
 136:	0a41                	addi	s4,s4,16
 138:	99d2                	add	s3,s3,s4
    if((fd = open(argv[i], 0)) < 0){
 13a:	4581                	li	a1,0
 13c:	6088                	ld	a0,0(s1)
 13e:	00000097          	auipc	ra,0x0
 142:	384080e7          	jalr	900(ra) # 4c2 <open>
 146:	892a                	mv	s2,a0
 148:	04054263          	bltz	a0,18c <main+0x8e>
      printf("wc: cannot open %s\n", argv[i]);
      exit(1);
    }
    wc(fd, argv[i]);
 14c:	608c                	ld	a1,0(s1)
 14e:	00000097          	auipc	ra,0x0
 152:	eb2080e7          	jalr	-334(ra) # 0 <wc>
    close(fd);
 156:	854a                	mv	a0,s2
 158:	00000097          	auipc	ra,0x0
 15c:	352080e7          	jalr	850(ra) # 4aa <close>
  for(i = 1; i < argc; i++){
 160:	04a1                	addi	s1,s1,8
 162:	fd349ce3          	bne	s1,s3,13a <main+0x3c>
  }
  exit(0);
 166:	4501                	li	a0,0
 168:	00000097          	auipc	ra,0x0
 16c:	31a080e7          	jalr	794(ra) # 482 <exit>
    wc(0, "");
 170:	00001597          	auipc	a1,0x1
 174:	88858593          	addi	a1,a1,-1912 # 9f8 <malloc+0x110>
 178:	4501                	li	a0,0
 17a:	00000097          	auipc	ra,0x0
 17e:	e86080e7          	jalr	-378(ra) # 0 <wc>
    exit(0);
 182:	4501                	li	a0,0
 184:	00000097          	auipc	ra,0x0
 188:	2fe080e7          	jalr	766(ra) # 482 <exit>
      printf("wc: cannot open %s\n", argv[i]);
 18c:	608c                	ld	a1,0(s1)
 18e:	00001517          	auipc	a0,0x1
 192:	88a50513          	addi	a0,a0,-1910 # a18 <malloc+0x130>
 196:	00000097          	auipc	ra,0x0
 19a:	692080e7          	jalr	1682(ra) # 828 <printf>
      exit(1);
 19e:	4505                	li	a0,1
 1a0:	00000097          	auipc	ra,0x0
 1a4:	2e2080e7          	jalr	738(ra) # 482 <exit>

00000000000001a8 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1a8:	1141                	addi	sp,sp,-16
 1aa:	e422                	sd	s0,8(sp)
 1ac:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ae:	87aa                	mv	a5,a0
 1b0:	0585                	addi	a1,a1,1
 1b2:	0785                	addi	a5,a5,1
 1b4:	fff5c703          	lbu	a4,-1(a1)
 1b8:	fee78fa3          	sb	a4,-1(a5)
 1bc:	fb75                	bnez	a4,1b0 <strcpy+0x8>
    ;
  return os;
}
 1be:	6422                	ld	s0,8(sp)
 1c0:	0141                	addi	sp,sp,16
 1c2:	8082                	ret

00000000000001c4 <strcat>:

char*
strcat(char *s, const char *t)
{
 1c4:	1141                	addi	sp,sp,-16
 1c6:	e422                	sd	s0,8(sp)
 1c8:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1ca:	00054783          	lbu	a5,0(a0)
 1ce:	c385                	beqz	a5,1ee <strcat+0x2a>
 1d0:	87aa                	mv	a5,a0
    s++;
 1d2:	0785                	addi	a5,a5,1
  while(*s)
 1d4:	0007c703          	lbu	a4,0(a5)
 1d8:	ff6d                	bnez	a4,1d2 <strcat+0xe>
  while((*s++ = *t++))
 1da:	0585                	addi	a1,a1,1
 1dc:	0785                	addi	a5,a5,1
 1de:	fff5c703          	lbu	a4,-1(a1)
 1e2:	fee78fa3          	sb	a4,-1(a5)
 1e6:	fb75                	bnez	a4,1da <strcat+0x16>
    ;
  return os;
}
 1e8:	6422                	ld	s0,8(sp)
 1ea:	0141                	addi	sp,sp,16
 1ec:	8082                	ret
  while(*s)
 1ee:	87aa                	mv	a5,a0
 1f0:	b7ed                	j	1da <strcat+0x16>

00000000000001f2 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e422                	sd	s0,8(sp)
 1f6:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1f8:	00054783          	lbu	a5,0(a0)
 1fc:	cf91                	beqz	a5,218 <strcmp+0x26>
 1fe:	0005c703          	lbu	a4,0(a1)
 202:	00f71b63          	bne	a4,a5,218 <strcmp+0x26>
    p++, q++;
 206:	0505                	addi	a0,a0,1
 208:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 20a:	00054783          	lbu	a5,0(a0)
 20e:	c789                	beqz	a5,218 <strcmp+0x26>
 210:	0005c703          	lbu	a4,0(a1)
 214:	fef709e3          	beq	a4,a5,206 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 218:	0005c503          	lbu	a0,0(a1)
}
 21c:	40a7853b          	subw	a0,a5,a0
 220:	6422                	ld	s0,8(sp)
 222:	0141                	addi	sp,sp,16
 224:	8082                	ret

0000000000000226 <strlen>:

uint
strlen(const char *s)
{
 226:	1141                	addi	sp,sp,-16
 228:	e422                	sd	s0,8(sp)
 22a:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 22c:	00054783          	lbu	a5,0(a0)
 230:	cf91                	beqz	a5,24c <strlen+0x26>
 232:	0505                	addi	a0,a0,1
 234:	87aa                	mv	a5,a0
 236:	4685                	li	a3,1
 238:	9e89                	subw	a3,a3,a0
 23a:	00f6853b          	addw	a0,a3,a5
 23e:	0785                	addi	a5,a5,1
 240:	fff7c703          	lbu	a4,-1(a5)
 244:	fb7d                	bnez	a4,23a <strlen+0x14>
    ;
  return n;
}
 246:	6422                	ld	s0,8(sp)
 248:	0141                	addi	sp,sp,16
 24a:	8082                	ret
  for(n = 0; s[n]; n++)
 24c:	4501                	li	a0,0
 24e:	bfe5                	j	246 <strlen+0x20>

0000000000000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	1141                	addi	sp,sp,-16
 252:	e422                	sd	s0,8(sp)
 254:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 256:	ce09                	beqz	a2,270 <memset+0x20>
 258:	87aa                	mv	a5,a0
 25a:	fff6071b          	addiw	a4,a2,-1
 25e:	1702                	slli	a4,a4,0x20
 260:	9301                	srli	a4,a4,0x20
 262:	0705                	addi	a4,a4,1
 264:	972a                	add	a4,a4,a0
    cdst[i] = c;
 266:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 26a:	0785                	addi	a5,a5,1
 26c:	fee79de3          	bne	a5,a4,266 <memset+0x16>
  }
  return dst;
}
 270:	6422                	ld	s0,8(sp)
 272:	0141                	addi	sp,sp,16
 274:	8082                	ret

0000000000000276 <strchr>:

char*
strchr(const char *s, char c)
{
 276:	1141                	addi	sp,sp,-16
 278:	e422                	sd	s0,8(sp)
 27a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 27c:	00054783          	lbu	a5,0(a0)
 280:	cf91                	beqz	a5,29c <strchr+0x26>
    if(*s == c)
 282:	00f58a63          	beq	a1,a5,296 <strchr+0x20>
  for(; *s; s++)
 286:	0505                	addi	a0,a0,1
 288:	00054783          	lbu	a5,0(a0)
 28c:	c781                	beqz	a5,294 <strchr+0x1e>
    if(*s == c)
 28e:	feb79ce3          	bne	a5,a1,286 <strchr+0x10>
 292:	a011                	j	296 <strchr+0x20>
      return (char*)s;
  return 0;
 294:	4501                	li	a0,0
}
 296:	6422                	ld	s0,8(sp)
 298:	0141                	addi	sp,sp,16
 29a:	8082                	ret
  return 0;
 29c:	4501                	li	a0,0
 29e:	bfe5                	j	296 <strchr+0x20>

00000000000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	711d                	addi	sp,sp,-96
 2a2:	ec86                	sd	ra,88(sp)
 2a4:	e8a2                	sd	s0,80(sp)
 2a6:	e4a6                	sd	s1,72(sp)
 2a8:	e0ca                	sd	s2,64(sp)
 2aa:	fc4e                	sd	s3,56(sp)
 2ac:	f852                	sd	s4,48(sp)
 2ae:	f456                	sd	s5,40(sp)
 2b0:	f05a                	sd	s6,32(sp)
 2b2:	ec5e                	sd	s7,24(sp)
 2b4:	e862                	sd	s8,16(sp)
 2b6:	1080                	addi	s0,sp,96
 2b8:	8c2a                	mv	s8,a0
 2ba:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2bc:	892a                	mv	s2,a0
 2be:	4981                	li	s3,0
    cc = read(0, &c, 1);
 2c0:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2c4:	4b29                	li	s6,10
 2c6:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 2c8:	0019849b          	addiw	s1,s3,1
 2cc:	0344d763          	ble	s4,s1,2fa <gets+0x5a>
    cc = read(0, &c, 1);
 2d0:	4605                	li	a2,1
 2d2:	85d6                	mv	a1,s5
 2d4:	4501                	li	a0,0
 2d6:	00000097          	auipc	ra,0x0
 2da:	1c4080e7          	jalr	452(ra) # 49a <read>
    if(cc < 1)
 2de:	00a05e63          	blez	a0,2fa <gets+0x5a>
    buf[i++] = c;
 2e2:	faf44783          	lbu	a5,-81(s0)
 2e6:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2ea:	01678763          	beq	a5,s6,2f8 <gets+0x58>
 2ee:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 2f0:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 2f2:	fd779be3          	bne	a5,s7,2c8 <gets+0x28>
 2f6:	a011                	j	2fa <gets+0x5a>
  for(i=0; i+1 < max; ){
 2f8:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2fa:	99e2                	add	s3,s3,s8
 2fc:	00098023          	sb	zero,0(s3)
  return buf;
}
 300:	8562                	mv	a0,s8
 302:	60e6                	ld	ra,88(sp)
 304:	6446                	ld	s0,80(sp)
 306:	64a6                	ld	s1,72(sp)
 308:	6906                	ld	s2,64(sp)
 30a:	79e2                	ld	s3,56(sp)
 30c:	7a42                	ld	s4,48(sp)
 30e:	7aa2                	ld	s5,40(sp)
 310:	7b02                	ld	s6,32(sp)
 312:	6be2                	ld	s7,24(sp)
 314:	6c42                	ld	s8,16(sp)
 316:	6125                	addi	sp,sp,96
 318:	8082                	ret

000000000000031a <stat>:

int
stat(const char *n, struct stat *st)
{
 31a:	1101                	addi	sp,sp,-32
 31c:	ec06                	sd	ra,24(sp)
 31e:	e822                	sd	s0,16(sp)
 320:	e426                	sd	s1,8(sp)
 322:	e04a                	sd	s2,0(sp)
 324:	1000                	addi	s0,sp,32
 326:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 328:	4581                	li	a1,0
 32a:	00000097          	auipc	ra,0x0
 32e:	198080e7          	jalr	408(ra) # 4c2 <open>
  if(fd < 0)
 332:	02054563          	bltz	a0,35c <stat+0x42>
 336:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 338:	85ca                	mv	a1,s2
 33a:	00000097          	auipc	ra,0x0
 33e:	190080e7          	jalr	400(ra) # 4ca <fstat>
 342:	892a                	mv	s2,a0
  close(fd);
 344:	8526                	mv	a0,s1
 346:	00000097          	auipc	ra,0x0
 34a:	164080e7          	jalr	356(ra) # 4aa <close>
  return r;
}
 34e:	854a                	mv	a0,s2
 350:	60e2                	ld	ra,24(sp)
 352:	6442                	ld	s0,16(sp)
 354:	64a2                	ld	s1,8(sp)
 356:	6902                	ld	s2,0(sp)
 358:	6105                	addi	sp,sp,32
 35a:	8082                	ret
    return -1;
 35c:	597d                	li	s2,-1
 35e:	bfc5                	j	34e <stat+0x34>

0000000000000360 <atoi>:

int
atoi(const char *s)
{
 360:	1141                	addi	sp,sp,-16
 362:	e422                	sd	s0,8(sp)
 364:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 366:	00054703          	lbu	a4,0(a0)
 36a:	02d00793          	li	a5,45
  int neg = 1;
 36e:	4805                	li	a6,1
  if (*s == '-') {
 370:	04f70363          	beq	a4,a5,3b6 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 374:	00054683          	lbu	a3,0(a0)
 378:	fd06879b          	addiw	a5,a3,-48
 37c:	0ff7f793          	andi	a5,a5,255
 380:	4725                	li	a4,9
 382:	02f76d63          	bltu	a4,a5,3bc <atoi+0x5c>
  n = 0;
 386:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 388:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 38a:	0505                	addi	a0,a0,1
 38c:	0026179b          	slliw	a5,a2,0x2
 390:	9fb1                	addw	a5,a5,a2
 392:	0017979b          	slliw	a5,a5,0x1
 396:	9fb5                	addw	a5,a5,a3
 398:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 39c:	00054683          	lbu	a3,0(a0)
 3a0:	fd06871b          	addiw	a4,a3,-48
 3a4:	0ff77713          	andi	a4,a4,255
 3a8:	fee5f1e3          	bleu	a4,a1,38a <atoi+0x2a>
  return n * neg;
}
 3ac:	02c8053b          	mulw	a0,a6,a2
 3b0:	6422                	ld	s0,8(sp)
 3b2:	0141                	addi	sp,sp,16
 3b4:	8082                	ret
    s++;
 3b6:	0505                	addi	a0,a0,1
    neg = -1;
 3b8:	587d                	li	a6,-1
 3ba:	bf6d                	j	374 <atoi+0x14>
  n = 0;
 3bc:	4601                	li	a2,0
 3be:	b7fd                	j	3ac <atoi+0x4c>

00000000000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	1141                	addi	sp,sp,-16
 3c2:	e422                	sd	s0,8(sp)
 3c4:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3c6:	02b57663          	bleu	a1,a0,3f2 <memmove+0x32>
    while(n-- > 0)
 3ca:	02c05163          	blez	a2,3ec <memmove+0x2c>
 3ce:	fff6079b          	addiw	a5,a2,-1
 3d2:	1782                	slli	a5,a5,0x20
 3d4:	9381                	srli	a5,a5,0x20
 3d6:	0785                	addi	a5,a5,1
 3d8:	97aa                	add	a5,a5,a0
  dst = vdst;
 3da:	872a                	mv	a4,a0
      *dst++ = *src++;
 3dc:	0585                	addi	a1,a1,1
 3de:	0705                	addi	a4,a4,1
 3e0:	fff5c683          	lbu	a3,-1(a1)
 3e4:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3e8:	fee79ae3          	bne	a5,a4,3dc <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3ec:	6422                	ld	s0,8(sp)
 3ee:	0141                	addi	sp,sp,16
 3f0:	8082                	ret
    dst += n;
 3f2:	00c50733          	add	a4,a0,a2
    src += n;
 3f6:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3f8:	fec05ae3          	blez	a2,3ec <memmove+0x2c>
 3fc:	fff6079b          	addiw	a5,a2,-1
 400:	1782                	slli	a5,a5,0x20
 402:	9381                	srli	a5,a5,0x20
 404:	fff7c793          	not	a5,a5
 408:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 40a:	15fd                	addi	a1,a1,-1
 40c:	177d                	addi	a4,a4,-1
 40e:	0005c683          	lbu	a3,0(a1)
 412:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 416:	fef71ae3          	bne	a4,a5,40a <memmove+0x4a>
 41a:	bfc9                	j	3ec <memmove+0x2c>

000000000000041c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 41c:	1141                	addi	sp,sp,-16
 41e:	e422                	sd	s0,8(sp)
 420:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 422:	ce15                	beqz	a2,45e <memcmp+0x42>
 424:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 428:	00054783          	lbu	a5,0(a0)
 42c:	0005c703          	lbu	a4,0(a1)
 430:	02e79063          	bne	a5,a4,450 <memcmp+0x34>
 434:	1682                	slli	a3,a3,0x20
 436:	9281                	srli	a3,a3,0x20
 438:	0685                	addi	a3,a3,1
 43a:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 43c:	0505                	addi	a0,a0,1
    p2++;
 43e:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 440:	00d50d63          	beq	a0,a3,45a <memcmp+0x3e>
    if (*p1 != *p2) {
 444:	00054783          	lbu	a5,0(a0)
 448:	0005c703          	lbu	a4,0(a1)
 44c:	fee788e3          	beq	a5,a4,43c <memcmp+0x20>
      return *p1 - *p2;
 450:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 454:	6422                	ld	s0,8(sp)
 456:	0141                	addi	sp,sp,16
 458:	8082                	ret
  return 0;
 45a:	4501                	li	a0,0
 45c:	bfe5                	j	454 <memcmp+0x38>
 45e:	4501                	li	a0,0
 460:	bfd5                	j	454 <memcmp+0x38>

0000000000000462 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 462:	1141                	addi	sp,sp,-16
 464:	e406                	sd	ra,8(sp)
 466:	e022                	sd	s0,0(sp)
 468:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 46a:	00000097          	auipc	ra,0x0
 46e:	f56080e7          	jalr	-170(ra) # 3c0 <memmove>
}
 472:	60a2                	ld	ra,8(sp)
 474:	6402                	ld	s0,0(sp)
 476:	0141                	addi	sp,sp,16
 478:	8082                	ret

000000000000047a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 47a:	4885                	li	a7,1
 ecall
 47c:	00000073          	ecall
 ret
 480:	8082                	ret

0000000000000482 <exit>:
.global exit
exit:
 li a7, SYS_exit
 482:	4889                	li	a7,2
 ecall
 484:	00000073          	ecall
 ret
 488:	8082                	ret

000000000000048a <wait>:
.global wait
wait:
 li a7, SYS_wait
 48a:	488d                	li	a7,3
 ecall
 48c:	00000073          	ecall
 ret
 490:	8082                	ret

0000000000000492 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 492:	4891                	li	a7,4
 ecall
 494:	00000073          	ecall
 ret
 498:	8082                	ret

000000000000049a <read>:
.global read
read:
 li a7, SYS_read
 49a:	4895                	li	a7,5
 ecall
 49c:	00000073          	ecall
 ret
 4a0:	8082                	ret

00000000000004a2 <write>:
.global write
write:
 li a7, SYS_write
 4a2:	48c1                	li	a7,16
 ecall
 4a4:	00000073          	ecall
 ret
 4a8:	8082                	ret

00000000000004aa <close>:
.global close
close:
 li a7, SYS_close
 4aa:	48d5                	li	a7,21
 ecall
 4ac:	00000073          	ecall
 ret
 4b0:	8082                	ret

00000000000004b2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4b2:	4899                	li	a7,6
 ecall
 4b4:	00000073          	ecall
 ret
 4b8:	8082                	ret

00000000000004ba <exec>:
.global exec
exec:
 li a7, SYS_exec
 4ba:	489d                	li	a7,7
 ecall
 4bc:	00000073          	ecall
 ret
 4c0:	8082                	ret

00000000000004c2 <open>:
.global open
open:
 li a7, SYS_open
 4c2:	48bd                	li	a7,15
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4ca:	48a1                	li	a7,8
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4d2:	48d1                	li	a7,20
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4da:	48a5                	li	a7,9
 ecall
 4dc:	00000073          	ecall
 ret
 4e0:	8082                	ret

00000000000004e2 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4e2:	48a9                	li	a7,10
 ecall
 4e4:	00000073          	ecall
 ret
 4e8:	8082                	ret

00000000000004ea <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4ea:	48ad                	li	a7,11
 ecall
 4ec:	00000073          	ecall
 ret
 4f0:	8082                	ret

00000000000004f2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4f2:	48b1                	li	a7,12
 ecall
 4f4:	00000073          	ecall
 ret
 4f8:	8082                	ret

00000000000004fa <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4fa:	48b5                	li	a7,13
 ecall
 4fc:	00000073          	ecall
 ret
 500:	8082                	ret

0000000000000502 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 502:	48b9                	li	a7,14
 ecall
 504:	00000073          	ecall
 ret
 508:	8082                	ret

000000000000050a <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 50a:	48d9                	li	a7,22
 ecall
 50c:	00000073          	ecall
 ret
 510:	8082                	ret

0000000000000512 <dev>:
.global dev
dev:
 li a7, SYS_dev
 512:	48dd                	li	a7,23
 ecall
 514:	00000073          	ecall
 ret
 518:	8082                	ret

000000000000051a <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 51a:	48e1                	li	a7,24
 ecall
 51c:	00000073          	ecall
 ret
 520:	8082                	ret

0000000000000522 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 522:	48e5                	li	a7,25
 ecall
 524:	00000073          	ecall
 ret
 528:	8082                	ret

000000000000052a <remove>:
.global remove
remove:
 li a7, SYS_remove
 52a:	48c5                	li	a7,17
 ecall
 52c:	00000073          	ecall
 ret
 530:	8082                	ret

0000000000000532 <trace>:
.global trace
trace:
 li a7, SYS_trace
 532:	48c9                	li	a7,18
 ecall
 534:	00000073          	ecall
 ret
 538:	8082                	ret

000000000000053a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 53a:	48cd                	li	a7,19
 ecall
 53c:	00000073          	ecall
 ret
 540:	8082                	ret

0000000000000542 <rename>:
.global rename
rename:
 li a7, SYS_rename
 542:	48e9                	li	a7,26
 ecall
 544:	00000073          	ecall
 ret
 548:	8082                	ret

000000000000054a <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 54a:	48ed                	li	a7,27
 ecall
 54c:	00000073          	ecall
 ret
 550:	8082                	ret

0000000000000552 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 552:	1101                	addi	sp,sp,-32
 554:	ec06                	sd	ra,24(sp)
 556:	e822                	sd	s0,16(sp)
 558:	1000                	addi	s0,sp,32
 55a:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 55e:	4605                	li	a2,1
 560:	fef40593          	addi	a1,s0,-17
 564:	00000097          	auipc	ra,0x0
 568:	f3e080e7          	jalr	-194(ra) # 4a2 <write>
}
 56c:	60e2                	ld	ra,24(sp)
 56e:	6442                	ld	s0,16(sp)
 570:	6105                	addi	sp,sp,32
 572:	8082                	ret

0000000000000574 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 574:	7139                	addi	sp,sp,-64
 576:	fc06                	sd	ra,56(sp)
 578:	f822                	sd	s0,48(sp)
 57a:	f426                	sd	s1,40(sp)
 57c:	f04a                	sd	s2,32(sp)
 57e:	ec4e                	sd	s3,24(sp)
 580:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 582:	c299                	beqz	a3,588 <printint+0x14>
 584:	0005ce63          	bltz	a1,5a0 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 588:	2581                	sext.w	a1,a1
  neg = 0;
 58a:	4301                	li	t1,0
  }

  i = 0;
 58c:	fc040913          	addi	s2,s0,-64
  neg = 0;
 590:	874a                	mv	a4,s2
  i = 0;
 592:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 594:	2601                	sext.w	a2,a2
 596:	00000897          	auipc	a7,0x0
 59a:	49a88893          	addi	a7,a7,1178 # a30 <digits>
 59e:	a801                	j	5ae <printint+0x3a>
    x = -xx;
 5a0:	40b005bb          	negw	a1,a1
 5a4:	2581                	sext.w	a1,a1
    neg = 1;
 5a6:	4305                	li	t1,1
    x = -xx;
 5a8:	b7d5                	j	58c <printint+0x18>
  }while((x /= base) != 0);
 5aa:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 5ac:	8836                	mv	a6,a3
 5ae:	0018069b          	addiw	a3,a6,1
 5b2:	02c5f7bb          	remuw	a5,a1,a2
 5b6:	1782                	slli	a5,a5,0x20
 5b8:	9381                	srli	a5,a5,0x20
 5ba:	97c6                	add	a5,a5,a7
 5bc:	0007c783          	lbu	a5,0(a5)
 5c0:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 5c4:	0705                	addi	a4,a4,1
 5c6:	02c5d7bb          	divuw	a5,a1,a2
 5ca:	fec5f0e3          	bleu	a2,a1,5aa <printint+0x36>
  if(neg)
 5ce:	00030b63          	beqz	t1,5e4 <printint+0x70>
    buf[i++] = '-';
 5d2:	fd040793          	addi	a5,s0,-48
 5d6:	96be                	add	a3,a3,a5
 5d8:	02d00793          	li	a5,45
 5dc:	fef68823          	sb	a5,-16(a3)
 5e0:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 5e4:	02d05763          	blez	a3,612 <printint+0x9e>
 5e8:	89aa                	mv	s3,a0
 5ea:	fc040493          	addi	s1,s0,-64
 5ee:	94b6                	add	s1,s1,a3
 5f0:	197d                	addi	s2,s2,-1
 5f2:	9936                	add	s2,s2,a3
 5f4:	36fd                	addiw	a3,a3,-1
 5f6:	1682                	slli	a3,a3,0x20
 5f8:	9281                	srli	a3,a3,0x20
 5fa:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 5fe:	fff4c583          	lbu	a1,-1(s1)
 602:	854e                	mv	a0,s3
 604:	00000097          	auipc	ra,0x0
 608:	f4e080e7          	jalr	-178(ra) # 552 <putc>
  while(--i >= 0)
 60c:	14fd                	addi	s1,s1,-1
 60e:	ff2498e3          	bne	s1,s2,5fe <printint+0x8a>
}
 612:	70e2                	ld	ra,56(sp)
 614:	7442                	ld	s0,48(sp)
 616:	74a2                	ld	s1,40(sp)
 618:	7902                	ld	s2,32(sp)
 61a:	69e2                	ld	s3,24(sp)
 61c:	6121                	addi	sp,sp,64
 61e:	8082                	ret

0000000000000620 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 620:	7119                	addi	sp,sp,-128
 622:	fc86                	sd	ra,120(sp)
 624:	f8a2                	sd	s0,112(sp)
 626:	f4a6                	sd	s1,104(sp)
 628:	f0ca                	sd	s2,96(sp)
 62a:	ecce                	sd	s3,88(sp)
 62c:	e8d2                	sd	s4,80(sp)
 62e:	e4d6                	sd	s5,72(sp)
 630:	e0da                	sd	s6,64(sp)
 632:	fc5e                	sd	s7,56(sp)
 634:	f862                	sd	s8,48(sp)
 636:	f466                	sd	s9,40(sp)
 638:	f06a                	sd	s10,32(sp)
 63a:	ec6e                	sd	s11,24(sp)
 63c:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 63e:	0005c483          	lbu	s1,0(a1)
 642:	18048d63          	beqz	s1,7dc <vprintf+0x1bc>
 646:	8aaa                	mv	s5,a0
 648:	8b32                	mv	s6,a2
 64a:	00158913          	addi	s2,a1,1
  state = 0;
 64e:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 650:	02500a13          	li	s4,37
      if(c == 'd'){
 654:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 658:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 65c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 660:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 664:	00000b97          	auipc	s7,0x0
 668:	3ccb8b93          	addi	s7,s7,972 # a30 <digits>
 66c:	a839                	j	68a <vprintf+0x6a>
        putc(fd, c);
 66e:	85a6                	mv	a1,s1
 670:	8556                	mv	a0,s5
 672:	00000097          	auipc	ra,0x0
 676:	ee0080e7          	jalr	-288(ra) # 552 <putc>
 67a:	a019                	j	680 <vprintf+0x60>
    } else if(state == '%'){
 67c:	01498f63          	beq	s3,s4,69a <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 680:	0905                	addi	s2,s2,1
 682:	fff94483          	lbu	s1,-1(s2)
 686:	14048b63          	beqz	s1,7dc <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 68a:	0004879b          	sext.w	a5,s1
    if(state == 0){
 68e:	fe0997e3          	bnez	s3,67c <vprintf+0x5c>
      if(c == '%'){
 692:	fd479ee3          	bne	a5,s4,66e <vprintf+0x4e>
        state = '%';
 696:	89be                	mv	s3,a5
 698:	b7e5                	j	680 <vprintf+0x60>
      if(c == 'd'){
 69a:	05878063          	beq	a5,s8,6da <vprintf+0xba>
      } else if(c == 'l') {
 69e:	05978c63          	beq	a5,s9,6f6 <vprintf+0xd6>
      } else if(c == 'x') {
 6a2:	07a78863          	beq	a5,s10,712 <vprintf+0xf2>
      } else if(c == 'p') {
 6a6:	09b78463          	beq	a5,s11,72e <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6aa:	07300713          	li	a4,115
 6ae:	0ce78563          	beq	a5,a4,778 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6b2:	06300713          	li	a4,99
 6b6:	0ee78c63          	beq	a5,a4,7ae <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6ba:	11478663          	beq	a5,s4,7c6 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6be:	85d2                	mv	a1,s4
 6c0:	8556                	mv	a0,s5
 6c2:	00000097          	auipc	ra,0x0
 6c6:	e90080e7          	jalr	-368(ra) # 552 <putc>
        putc(fd, c);
 6ca:	85a6                	mv	a1,s1
 6cc:	8556                	mv	a0,s5
 6ce:	00000097          	auipc	ra,0x0
 6d2:	e84080e7          	jalr	-380(ra) # 552 <putc>
      }
      state = 0;
 6d6:	4981                	li	s3,0
 6d8:	b765                	j	680 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6da:	008b0493          	addi	s1,s6,8
 6de:	4685                	li	a3,1
 6e0:	4629                	li	a2,10
 6e2:	000b2583          	lw	a1,0(s6)
 6e6:	8556                	mv	a0,s5
 6e8:	00000097          	auipc	ra,0x0
 6ec:	e8c080e7          	jalr	-372(ra) # 574 <printint>
 6f0:	8b26                	mv	s6,s1
      state = 0;
 6f2:	4981                	li	s3,0
 6f4:	b771                	j	680 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6f6:	008b0493          	addi	s1,s6,8
 6fa:	4681                	li	a3,0
 6fc:	4629                	li	a2,10
 6fe:	000b2583          	lw	a1,0(s6)
 702:	8556                	mv	a0,s5
 704:	00000097          	auipc	ra,0x0
 708:	e70080e7          	jalr	-400(ra) # 574 <printint>
 70c:	8b26                	mv	s6,s1
      state = 0;
 70e:	4981                	li	s3,0
 710:	bf85                	j	680 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 712:	008b0493          	addi	s1,s6,8
 716:	4681                	li	a3,0
 718:	4641                	li	a2,16
 71a:	000b2583          	lw	a1,0(s6)
 71e:	8556                	mv	a0,s5
 720:	00000097          	auipc	ra,0x0
 724:	e54080e7          	jalr	-428(ra) # 574 <printint>
 728:	8b26                	mv	s6,s1
      state = 0;
 72a:	4981                	li	s3,0
 72c:	bf91                	j	680 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 72e:	008b0793          	addi	a5,s6,8
 732:	f8f43423          	sd	a5,-120(s0)
 736:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 73a:	03000593          	li	a1,48
 73e:	8556                	mv	a0,s5
 740:	00000097          	auipc	ra,0x0
 744:	e12080e7          	jalr	-494(ra) # 552 <putc>
  putc(fd, 'x');
 748:	85ea                	mv	a1,s10
 74a:	8556                	mv	a0,s5
 74c:	00000097          	auipc	ra,0x0
 750:	e06080e7          	jalr	-506(ra) # 552 <putc>
 754:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 756:	03c9d793          	srli	a5,s3,0x3c
 75a:	97de                	add	a5,a5,s7
 75c:	0007c583          	lbu	a1,0(a5)
 760:	8556                	mv	a0,s5
 762:	00000097          	auipc	ra,0x0
 766:	df0080e7          	jalr	-528(ra) # 552 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 76a:	0992                	slli	s3,s3,0x4
 76c:	34fd                	addiw	s1,s1,-1
 76e:	f4e5                	bnez	s1,756 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 770:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 774:	4981                	li	s3,0
 776:	b729                	j	680 <vprintf+0x60>
        s = va_arg(ap, char*);
 778:	008b0993          	addi	s3,s6,8
 77c:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 780:	c085                	beqz	s1,7a0 <vprintf+0x180>
        while(*s != 0){
 782:	0004c583          	lbu	a1,0(s1)
 786:	c9a1                	beqz	a1,7d6 <vprintf+0x1b6>
          putc(fd, *s);
 788:	8556                	mv	a0,s5
 78a:	00000097          	auipc	ra,0x0
 78e:	dc8080e7          	jalr	-568(ra) # 552 <putc>
          s++;
 792:	0485                	addi	s1,s1,1
        while(*s != 0){
 794:	0004c583          	lbu	a1,0(s1)
 798:	f9e5                	bnez	a1,788 <vprintf+0x168>
        s = va_arg(ap, char*);
 79a:	8b4e                	mv	s6,s3
      state = 0;
 79c:	4981                	li	s3,0
 79e:	b5cd                	j	680 <vprintf+0x60>
          s = "(null)";
 7a0:	00000497          	auipc	s1,0x0
 7a4:	2a848493          	addi	s1,s1,680 # a48 <digits+0x18>
        while(*s != 0){
 7a8:	02800593          	li	a1,40
 7ac:	bff1                	j	788 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 7ae:	008b0493          	addi	s1,s6,8
 7b2:	000b4583          	lbu	a1,0(s6)
 7b6:	8556                	mv	a0,s5
 7b8:	00000097          	auipc	ra,0x0
 7bc:	d9a080e7          	jalr	-614(ra) # 552 <putc>
 7c0:	8b26                	mv	s6,s1
      state = 0;
 7c2:	4981                	li	s3,0
 7c4:	bd75                	j	680 <vprintf+0x60>
        putc(fd, c);
 7c6:	85d2                	mv	a1,s4
 7c8:	8556                	mv	a0,s5
 7ca:	00000097          	auipc	ra,0x0
 7ce:	d88080e7          	jalr	-632(ra) # 552 <putc>
      state = 0;
 7d2:	4981                	li	s3,0
 7d4:	b575                	j	680 <vprintf+0x60>
        s = va_arg(ap, char*);
 7d6:	8b4e                	mv	s6,s3
      state = 0;
 7d8:	4981                	li	s3,0
 7da:	b55d                	j	680 <vprintf+0x60>
    }
  }
}
 7dc:	70e6                	ld	ra,120(sp)
 7de:	7446                	ld	s0,112(sp)
 7e0:	74a6                	ld	s1,104(sp)
 7e2:	7906                	ld	s2,96(sp)
 7e4:	69e6                	ld	s3,88(sp)
 7e6:	6a46                	ld	s4,80(sp)
 7e8:	6aa6                	ld	s5,72(sp)
 7ea:	6b06                	ld	s6,64(sp)
 7ec:	7be2                	ld	s7,56(sp)
 7ee:	7c42                	ld	s8,48(sp)
 7f0:	7ca2                	ld	s9,40(sp)
 7f2:	7d02                	ld	s10,32(sp)
 7f4:	6de2                	ld	s11,24(sp)
 7f6:	6109                	addi	sp,sp,128
 7f8:	8082                	ret

00000000000007fa <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7fa:	715d                	addi	sp,sp,-80
 7fc:	ec06                	sd	ra,24(sp)
 7fe:	e822                	sd	s0,16(sp)
 800:	1000                	addi	s0,sp,32
 802:	e010                	sd	a2,0(s0)
 804:	e414                	sd	a3,8(s0)
 806:	e818                	sd	a4,16(s0)
 808:	ec1c                	sd	a5,24(s0)
 80a:	03043023          	sd	a6,32(s0)
 80e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 812:	8622                	mv	a2,s0
 814:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 818:	00000097          	auipc	ra,0x0
 81c:	e08080e7          	jalr	-504(ra) # 620 <vprintf>
}
 820:	60e2                	ld	ra,24(sp)
 822:	6442                	ld	s0,16(sp)
 824:	6161                	addi	sp,sp,80
 826:	8082                	ret

0000000000000828 <printf>:

void
printf(const char *fmt, ...)
{
 828:	711d                	addi	sp,sp,-96
 82a:	ec06                	sd	ra,24(sp)
 82c:	e822                	sd	s0,16(sp)
 82e:	1000                	addi	s0,sp,32
 830:	e40c                	sd	a1,8(s0)
 832:	e810                	sd	a2,16(s0)
 834:	ec14                	sd	a3,24(s0)
 836:	f018                	sd	a4,32(s0)
 838:	f41c                	sd	a5,40(s0)
 83a:	03043823          	sd	a6,48(s0)
 83e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 842:	00840613          	addi	a2,s0,8
 846:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 84a:	85aa                	mv	a1,a0
 84c:	4505                	li	a0,1
 84e:	00000097          	auipc	ra,0x0
 852:	dd2080e7          	jalr	-558(ra) # 620 <vprintf>
}
 856:	60e2                	ld	ra,24(sp)
 858:	6442                	ld	s0,16(sp)
 85a:	6125                	addi	sp,sp,96
 85c:	8082                	ret

000000000000085e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 85e:	1141                	addi	sp,sp,-16
 860:	e422                	sd	s0,8(sp)
 862:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 864:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 868:	00000797          	auipc	a5,0x0
 86c:	3e878793          	addi	a5,a5,1000 # c50 <freep>
 870:	639c                	ld	a5,0(a5)
 872:	a805                	j	8a2 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 874:	4618                	lw	a4,8(a2)
 876:	9db9                	addw	a1,a1,a4
 878:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 87c:	6398                	ld	a4,0(a5)
 87e:	6318                	ld	a4,0(a4)
 880:	fee53823          	sd	a4,-16(a0)
 884:	a091                	j	8c8 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 886:	ff852703          	lw	a4,-8(a0)
 88a:	9e39                	addw	a2,a2,a4
 88c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 88e:	ff053703          	ld	a4,-16(a0)
 892:	e398                	sd	a4,0(a5)
 894:	a099                	j	8da <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 896:	6398                	ld	a4,0(a5)
 898:	00e7e463          	bltu	a5,a4,8a0 <free+0x42>
 89c:	00e6ea63          	bltu	a3,a4,8b0 <free+0x52>
{
 8a0:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a2:	fed7fae3          	bleu	a3,a5,896 <free+0x38>
 8a6:	6398                	ld	a4,0(a5)
 8a8:	00e6e463          	bltu	a3,a4,8b0 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ac:	fee7eae3          	bltu	a5,a4,8a0 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 8b0:	ff852583          	lw	a1,-8(a0)
 8b4:	6390                	ld	a2,0(a5)
 8b6:	02059713          	slli	a4,a1,0x20
 8ba:	9301                	srli	a4,a4,0x20
 8bc:	0712                	slli	a4,a4,0x4
 8be:	9736                	add	a4,a4,a3
 8c0:	fae60ae3          	beq	a2,a4,874 <free+0x16>
    bp->s.ptr = p->s.ptr;
 8c4:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8c8:	4790                	lw	a2,8(a5)
 8ca:	02061713          	slli	a4,a2,0x20
 8ce:	9301                	srli	a4,a4,0x20
 8d0:	0712                	slli	a4,a4,0x4
 8d2:	973e                	add	a4,a4,a5
 8d4:	fae689e3          	beq	a3,a4,886 <free+0x28>
  } else
    p->s.ptr = bp;
 8d8:	e394                	sd	a3,0(a5)
  freep = p;
 8da:	00000717          	auipc	a4,0x0
 8de:	36f73b23          	sd	a5,886(a4) # c50 <freep>
}
 8e2:	6422                	ld	s0,8(sp)
 8e4:	0141                	addi	sp,sp,16
 8e6:	8082                	ret

00000000000008e8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8e8:	7139                	addi	sp,sp,-64
 8ea:	fc06                	sd	ra,56(sp)
 8ec:	f822                	sd	s0,48(sp)
 8ee:	f426                	sd	s1,40(sp)
 8f0:	f04a                	sd	s2,32(sp)
 8f2:	ec4e                	sd	s3,24(sp)
 8f4:	e852                	sd	s4,16(sp)
 8f6:	e456                	sd	s5,8(sp)
 8f8:	e05a                	sd	s6,0(sp)
 8fa:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8fc:	02051993          	slli	s3,a0,0x20
 900:	0209d993          	srli	s3,s3,0x20
 904:	09bd                	addi	s3,s3,15
 906:	0049d993          	srli	s3,s3,0x4
 90a:	2985                	addiw	s3,s3,1
 90c:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 910:	00000797          	auipc	a5,0x0
 914:	34078793          	addi	a5,a5,832 # c50 <freep>
 918:	6388                	ld	a0,0(a5)
 91a:	c515                	beqz	a0,946 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 91e:	4798                	lw	a4,8(a5)
 920:	03277d63          	bleu	s2,a4,95a <malloc+0x72>
 924:	8a4e                	mv	s4,s3
 926:	0009871b          	sext.w	a4,s3
 92a:	6685                	lui	a3,0x1
 92c:	00d77363          	bleu	a3,a4,932 <malloc+0x4a>
 930:	6a05                	lui	s4,0x1
 932:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 936:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 93a:	00000497          	auipc	s1,0x0
 93e:	31648493          	addi	s1,s1,790 # c50 <freep>
  if(p == (char*)-1)
 942:	5b7d                	li	s6,-1
 944:	a0b5                	j	9b0 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 946:	00000717          	auipc	a4,0x0
 94a:	31270713          	addi	a4,a4,786 # c58 <base>
 94e:	e398                	sd	a4,0(a5)
 950:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 952:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 956:	87ba                	mv	a5,a4
 958:	b7f1                	j	924 <malloc+0x3c>
      if(p->s.size == nunits)
 95a:	02e90b63          	beq	s2,a4,990 <malloc+0xa8>
        p->s.size -= nunits;
 95e:	4137073b          	subw	a4,a4,s3
 962:	c798                	sw	a4,8(a5)
        p += p->s.size;
 964:	1702                	slli	a4,a4,0x20
 966:	9301                	srli	a4,a4,0x20
 968:	0712                	slli	a4,a4,0x4
 96a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 96c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 970:	00000717          	auipc	a4,0x0
 974:	2ea73023          	sd	a0,736(a4) # c50 <freep>
      return (void*)(p + 1);
 978:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 97c:	70e2                	ld	ra,56(sp)
 97e:	7442                	ld	s0,48(sp)
 980:	74a2                	ld	s1,40(sp)
 982:	7902                	ld	s2,32(sp)
 984:	69e2                	ld	s3,24(sp)
 986:	6a42                	ld	s4,16(sp)
 988:	6aa2                	ld	s5,8(sp)
 98a:	6b02                	ld	s6,0(sp)
 98c:	6121                	addi	sp,sp,64
 98e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 990:	6398                	ld	a4,0(a5)
 992:	e118                	sd	a4,0(a0)
 994:	bff1                	j	970 <malloc+0x88>
  hp->s.size = nu;
 996:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 99a:	0541                	addi	a0,a0,16
 99c:	00000097          	auipc	ra,0x0
 9a0:	ec2080e7          	jalr	-318(ra) # 85e <free>
  return freep;
 9a4:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 9a6:	d979                	beqz	a0,97c <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9aa:	4798                	lw	a4,8(a5)
 9ac:	fb2777e3          	bleu	s2,a4,95a <malloc+0x72>
    if(p == freep)
 9b0:	6098                	ld	a4,0(s1)
 9b2:	853e                	mv	a0,a5
 9b4:	fef71ae3          	bne	a4,a5,9a8 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9b8:	8552                	mv	a0,s4
 9ba:	00000097          	auipc	ra,0x0
 9be:	b38080e7          	jalr	-1224(ra) # 4f2 <sbrk>
  if(p == (char*)-1)
 9c2:	fd651ae3          	bne	a0,s6,996 <malloc+0xae>
        return 0;
 9c6:	4501                	li	a0,0
 9c8:	bf55                	j	97c <malloc+0x94>
