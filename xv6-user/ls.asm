
xv6-user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

char*
fmtname(char *name)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	892a                	mv	s2,a0
  static char buf[STAT_MAX_NAME+1];
  int len = strlen(name);
  10:	00000097          	auipc	ra,0x0
  14:	252080e7          	jalr	594(ra) # 262 <strlen>
  18:	0005049b          	sext.w	s1,a0

  // Return blank-padded name.
  if(len >= STAT_MAX_NAME)
  1c:	47fd                	li	a5,31
  1e:	0097da63          	ble	s1,a5,32 <fmtname+0x32>
    return name;
  memmove(buf, name, len);
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  buf[STAT_MAX_NAME] = '\0';
  return buf;
}
  22:	854a                	mv	a0,s2
  24:	70a2                	ld	ra,40(sp)
  26:	7402                	ld	s0,32(sp)
  28:	64e2                	ld	s1,24(sp)
  2a:	6942                	ld	s2,16(sp)
  2c:	69a2                	ld	s3,8(sp)
  2e:	6145                	addi	sp,sp,48
  30:	8082                	ret
  memmove(buf, name, len);
  32:	00001997          	auipc	s3,0x1
  36:	a5e98993          	addi	s3,s3,-1442 # a90 <__bss_start>
  3a:	8626                	mv	a2,s1
  3c:	85ca                	mv	a1,s2
  3e:	854e                	mv	a0,s3
  40:	00000097          	auipc	ra,0x0
  44:	3bc080e7          	jalr	956(ra) # 3fc <memmove>
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  48:	02000613          	li	a2,32
  4c:	9e05                	subw	a2,a2,s1
  4e:	02000593          	li	a1,32
  52:	00998533          	add	a0,s3,s1
  56:	00000097          	auipc	ra,0x0
  5a:	236080e7          	jalr	566(ra) # 28c <memset>
  buf[STAT_MAX_NAME] = '\0';
  5e:	02098023          	sb	zero,32(s3)
  return buf;
  62:	894e                	mv	s2,s3
  64:	bf7d                	j	22 <fmtname+0x22>

0000000000000066 <ls>:

void
ls(char *path)
{
  66:	7119                	addi	sp,sp,-128
  68:	fc86                	sd	ra,120(sp)
  6a:	f8a2                	sd	s0,112(sp)
  6c:	f4a6                	sd	s1,104(sp)
  6e:	f0ca                	sd	s2,96(sp)
  70:	ecce                	sd	s3,88(sp)
  72:	e8d2                	sd	s4,80(sp)
  74:	0100                	addi	s0,sp,128
  76:	892a                	mv	s2,a0
  int fd;
  struct stat st;
  char *types[] = {
  78:	f8043023          	sd	zero,-128(s0)
  7c:	00001797          	auipc	a5,0x1
  80:	98c78793          	addi	a5,a5,-1652 # a08 <malloc+0xe4>
  84:	f8f43423          	sd	a5,-120(s0)
  88:	00001797          	auipc	a5,0x1
  8c:	98878793          	addi	a5,a5,-1656 # a10 <malloc+0xec>
  90:	f8f43823          	sd	a5,-112(s0)
    [T_DIR]   "DIR ",
    [T_FILE]  "FILE",
  };

  if((fd = open(path, 0)) < 0){
  94:	4581                	li	a1,0
  96:	00000097          	auipc	ra,0x0
  9a:	468080e7          	jalr	1128(ra) # 4fe <open>
  9e:	06054563          	bltz	a0,108 <ls+0xa2>
  a2:	84aa                	mv	s1,a0
    fprintf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  a4:	f9840593          	addi	a1,s0,-104
  a8:	00000097          	auipc	ra,0x0
  ac:	45e080e7          	jalr	1118(ra) # 506 <fstat>
  b0:	06054763          	bltz	a0,11e <ls+0xb8>
    fprintf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  if (st.type == T_DIR){
  b4:	fc041703          	lh	a4,-64(s0)
  b8:	4785                	li	a5,1
  ba:	08f71263          	bne	a4,a5,13e <ls+0xd8>
    while(readdir(fd, &st) == 1){
  be:	f9840913          	addi	s2,s0,-104
  c2:	4985                	li	s3,1
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  c4:	00001a17          	auipc	s4,0x1
  c8:	984a0a13          	addi	s4,s4,-1660 # a48 <malloc+0x124>
    while(readdir(fd, &st) == 1){
  cc:	85ca                	mv	a1,s2
  ce:	8526                	mv	a0,s1
  d0:	00000097          	auipc	ra,0x0
  d4:	486080e7          	jalr	1158(ra) # 556 <readdir>
  d8:	09351c63          	bne	a0,s3,170 <ls+0x10a>
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  dc:	854a                	mv	a0,s2
  de:	00000097          	auipc	ra,0x0
  e2:	f22080e7          	jalr	-222(ra) # 0 <fmtname>
  e6:	fc041783          	lh	a5,-64(s0)
  ea:	078e                	slli	a5,a5,0x3
  ec:	fd040713          	addi	a4,s0,-48
  f0:	97ba                	add	a5,a5,a4
  f2:	fc843683          	ld	a3,-56(s0)
  f6:	fb07b603          	ld	a2,-80(a5)
  fa:	85aa                	mv	a1,a0
  fc:	8552                	mv	a0,s4
  fe:	00000097          	auipc	ra,0x0
 102:	766080e7          	jalr	1894(ra) # 864 <printf>
 106:	b7d9                	j	cc <ls+0x66>
    fprintf(2, "ls: cannot open %s\n", path);
 108:	864a                	mv	a2,s2
 10a:	00001597          	auipc	a1,0x1
 10e:	90e58593          	addi	a1,a1,-1778 # a18 <malloc+0xf4>
 112:	4509                	li	a0,2
 114:	00000097          	auipc	ra,0x0
 118:	722080e7          	jalr	1826(ra) # 836 <fprintf>
    return;
 11c:	a8b9                	j	17a <ls+0x114>
    fprintf(2, "ls: cannot stat %s\n", path);
 11e:	864a                	mv	a2,s2
 120:	00001597          	auipc	a1,0x1
 124:	91058593          	addi	a1,a1,-1776 # a30 <malloc+0x10c>
 128:	4509                	li	a0,2
 12a:	00000097          	auipc	ra,0x0
 12e:	70c080e7          	jalr	1804(ra) # 836 <fprintf>
    close(fd);
 132:	8526                	mv	a0,s1
 134:	00000097          	auipc	ra,0x0
 138:	3b2080e7          	jalr	946(ra) # 4e6 <close>
    return;
 13c:	a83d                	j	17a <ls+0x114>
    }
  } else {
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
 13e:	f9840513          	addi	a0,s0,-104
 142:	00000097          	auipc	ra,0x0
 146:	ebe080e7          	jalr	-322(ra) # 0 <fmtname>
 14a:	fc041783          	lh	a5,-64(s0)
 14e:	078e                	slli	a5,a5,0x3
 150:	fd040713          	addi	a4,s0,-48
 154:	97ba                	add	a5,a5,a4
 156:	fc843683          	ld	a3,-56(s0)
 15a:	fb07b603          	ld	a2,-80(a5)
 15e:	85aa                	mv	a1,a0
 160:	00001517          	auipc	a0,0x1
 164:	8f850513          	addi	a0,a0,-1800 # a58 <malloc+0x134>
 168:	00000097          	auipc	ra,0x0
 16c:	6fc080e7          	jalr	1788(ra) # 864 <printf>
  }
  close(fd);
 170:	8526                	mv	a0,s1
 172:	00000097          	auipc	ra,0x0
 176:	374080e7          	jalr	884(ra) # 4e6 <close>
}
 17a:	70e6                	ld	ra,120(sp)
 17c:	7446                	ld	s0,112(sp)
 17e:	74a6                	ld	s1,104(sp)
 180:	7906                	ld	s2,96(sp)
 182:	69e6                	ld	s3,88(sp)
 184:	6a46                	ld	s4,80(sp)
 186:	6109                	addi	sp,sp,128
 188:	8082                	ret

000000000000018a <main>:

int
main(int argc, char *argv[])
{
 18a:	1101                	addi	sp,sp,-32
 18c:	ec06                	sd	ra,24(sp)
 18e:	e822                	sd	s0,16(sp)
 190:	e426                	sd	s1,8(sp)
 192:	e04a                	sd	s2,0(sp)
 194:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
 196:	4785                	li	a5,1
 198:	02a7d963          	ble	a0,a5,1ca <main+0x40>
 19c:	00858493          	addi	s1,a1,8
 1a0:	ffe5091b          	addiw	s2,a0,-2
 1a4:	1902                	slli	s2,s2,0x20
 1a6:	02095913          	srli	s2,s2,0x20
 1aa:	090e                	slli	s2,s2,0x3
 1ac:	05c1                	addi	a1,a1,16
 1ae:	992e                	add	s2,s2,a1
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 1b0:	6088                	ld	a0,0(s1)
 1b2:	00000097          	auipc	ra,0x0
 1b6:	eb4080e7          	jalr	-332(ra) # 66 <ls>
  for(i=1; i<argc; i++)
 1ba:	04a1                	addi	s1,s1,8
 1bc:	ff249ae3          	bne	s1,s2,1b0 <main+0x26>
  exit(0);
 1c0:	4501                	li	a0,0
 1c2:	00000097          	auipc	ra,0x0
 1c6:	2fc080e7          	jalr	764(ra) # 4be <exit>
    ls(".");
 1ca:	00001517          	auipc	a0,0x1
 1ce:	89e50513          	addi	a0,a0,-1890 # a68 <malloc+0x144>
 1d2:	00000097          	auipc	ra,0x0
 1d6:	e94080e7          	jalr	-364(ra) # 66 <ls>
    exit(0);
 1da:	4501                	li	a0,0
 1dc:	00000097          	auipc	ra,0x0
 1e0:	2e2080e7          	jalr	738(ra) # 4be <exit>

00000000000001e4 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1e4:	1141                	addi	sp,sp,-16
 1e6:	e422                	sd	s0,8(sp)
 1e8:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ea:	87aa                	mv	a5,a0
 1ec:	0585                	addi	a1,a1,1
 1ee:	0785                	addi	a5,a5,1
 1f0:	fff5c703          	lbu	a4,-1(a1)
 1f4:	fee78fa3          	sb	a4,-1(a5)
 1f8:	fb75                	bnez	a4,1ec <strcpy+0x8>
    ;
  return os;
}
 1fa:	6422                	ld	s0,8(sp)
 1fc:	0141                	addi	sp,sp,16
 1fe:	8082                	ret

0000000000000200 <strcat>:

char*
strcat(char *s, const char *t)
{
 200:	1141                	addi	sp,sp,-16
 202:	e422                	sd	s0,8(sp)
 204:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 206:	00054783          	lbu	a5,0(a0)
 20a:	c385                	beqz	a5,22a <strcat+0x2a>
 20c:	87aa                	mv	a5,a0
    s++;
 20e:	0785                	addi	a5,a5,1
  while(*s)
 210:	0007c703          	lbu	a4,0(a5)
 214:	ff6d                	bnez	a4,20e <strcat+0xe>
  while((*s++ = *t++))
 216:	0585                	addi	a1,a1,1
 218:	0785                	addi	a5,a5,1
 21a:	fff5c703          	lbu	a4,-1(a1)
 21e:	fee78fa3          	sb	a4,-1(a5)
 222:	fb75                	bnez	a4,216 <strcat+0x16>
    ;
  return os;
}
 224:	6422                	ld	s0,8(sp)
 226:	0141                	addi	sp,sp,16
 228:	8082                	ret
  while(*s)
 22a:	87aa                	mv	a5,a0
 22c:	b7ed                	j	216 <strcat+0x16>

000000000000022e <strcmp>:


int
strcmp(const char *p, const char *q)
{
 22e:	1141                	addi	sp,sp,-16
 230:	e422                	sd	s0,8(sp)
 232:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 234:	00054783          	lbu	a5,0(a0)
 238:	cf91                	beqz	a5,254 <strcmp+0x26>
 23a:	0005c703          	lbu	a4,0(a1)
 23e:	00f71b63          	bne	a4,a5,254 <strcmp+0x26>
    p++, q++;
 242:	0505                	addi	a0,a0,1
 244:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 246:	00054783          	lbu	a5,0(a0)
 24a:	c789                	beqz	a5,254 <strcmp+0x26>
 24c:	0005c703          	lbu	a4,0(a1)
 250:	fef709e3          	beq	a4,a5,242 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 254:	0005c503          	lbu	a0,0(a1)
}
 258:	40a7853b          	subw	a0,a5,a0
 25c:	6422                	ld	s0,8(sp)
 25e:	0141                	addi	sp,sp,16
 260:	8082                	ret

0000000000000262 <strlen>:

uint
strlen(const char *s)
{
 262:	1141                	addi	sp,sp,-16
 264:	e422                	sd	s0,8(sp)
 266:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 268:	00054783          	lbu	a5,0(a0)
 26c:	cf91                	beqz	a5,288 <strlen+0x26>
 26e:	0505                	addi	a0,a0,1
 270:	87aa                	mv	a5,a0
 272:	4685                	li	a3,1
 274:	9e89                	subw	a3,a3,a0
 276:	00f6853b          	addw	a0,a3,a5
 27a:	0785                	addi	a5,a5,1
 27c:	fff7c703          	lbu	a4,-1(a5)
 280:	fb7d                	bnez	a4,276 <strlen+0x14>
    ;
  return n;
}
 282:	6422                	ld	s0,8(sp)
 284:	0141                	addi	sp,sp,16
 286:	8082                	ret
  for(n = 0; s[n]; n++)
 288:	4501                	li	a0,0
 28a:	bfe5                	j	282 <strlen+0x20>

000000000000028c <memset>:

void*
memset(void *dst, int c, uint n)
{
 28c:	1141                	addi	sp,sp,-16
 28e:	e422                	sd	s0,8(sp)
 290:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 292:	ce09                	beqz	a2,2ac <memset+0x20>
 294:	87aa                	mv	a5,a0
 296:	fff6071b          	addiw	a4,a2,-1
 29a:	1702                	slli	a4,a4,0x20
 29c:	9301                	srli	a4,a4,0x20
 29e:	0705                	addi	a4,a4,1
 2a0:	972a                	add	a4,a4,a0
    cdst[i] = c;
 2a2:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2a6:	0785                	addi	a5,a5,1
 2a8:	fee79de3          	bne	a5,a4,2a2 <memset+0x16>
  }
  return dst;
}
 2ac:	6422                	ld	s0,8(sp)
 2ae:	0141                	addi	sp,sp,16
 2b0:	8082                	ret

00000000000002b2 <strchr>:

char*
strchr(const char *s, char c)
{
 2b2:	1141                	addi	sp,sp,-16
 2b4:	e422                	sd	s0,8(sp)
 2b6:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2b8:	00054783          	lbu	a5,0(a0)
 2bc:	cf91                	beqz	a5,2d8 <strchr+0x26>
    if(*s == c)
 2be:	00f58a63          	beq	a1,a5,2d2 <strchr+0x20>
  for(; *s; s++)
 2c2:	0505                	addi	a0,a0,1
 2c4:	00054783          	lbu	a5,0(a0)
 2c8:	c781                	beqz	a5,2d0 <strchr+0x1e>
    if(*s == c)
 2ca:	feb79ce3          	bne	a5,a1,2c2 <strchr+0x10>
 2ce:	a011                	j	2d2 <strchr+0x20>
      return (char*)s;
  return 0;
 2d0:	4501                	li	a0,0
}
 2d2:	6422                	ld	s0,8(sp)
 2d4:	0141                	addi	sp,sp,16
 2d6:	8082                	ret
  return 0;
 2d8:	4501                	li	a0,0
 2da:	bfe5                	j	2d2 <strchr+0x20>

00000000000002dc <gets>:

char*
gets(char *buf, int max)
{
 2dc:	711d                	addi	sp,sp,-96
 2de:	ec86                	sd	ra,88(sp)
 2e0:	e8a2                	sd	s0,80(sp)
 2e2:	e4a6                	sd	s1,72(sp)
 2e4:	e0ca                	sd	s2,64(sp)
 2e6:	fc4e                	sd	s3,56(sp)
 2e8:	f852                	sd	s4,48(sp)
 2ea:	f456                	sd	s5,40(sp)
 2ec:	f05a                	sd	s6,32(sp)
 2ee:	ec5e                	sd	s7,24(sp)
 2f0:	e862                	sd	s8,16(sp)
 2f2:	1080                	addi	s0,sp,96
 2f4:	8c2a                	mv	s8,a0
 2f6:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f8:	892a                	mv	s2,a0
 2fa:	4981                	li	s3,0
    cc = read(0, &c, 1);
 2fc:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 300:	4b29                	li	s6,10
 302:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 304:	0019849b          	addiw	s1,s3,1
 308:	0344d763          	ble	s4,s1,336 <gets+0x5a>
    cc = read(0, &c, 1);
 30c:	4605                	li	a2,1
 30e:	85d6                	mv	a1,s5
 310:	4501                	li	a0,0
 312:	00000097          	auipc	ra,0x0
 316:	1c4080e7          	jalr	452(ra) # 4d6 <read>
    if(cc < 1)
 31a:	00a05e63          	blez	a0,336 <gets+0x5a>
    buf[i++] = c;
 31e:	faf44783          	lbu	a5,-81(s0)
 322:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 326:	01678763          	beq	a5,s6,334 <gets+0x58>
 32a:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 32c:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 32e:	fd779be3          	bne	a5,s7,304 <gets+0x28>
 332:	a011                	j	336 <gets+0x5a>
  for(i=0; i+1 < max; ){
 334:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 336:	99e2                	add	s3,s3,s8
 338:	00098023          	sb	zero,0(s3)
  return buf;
}
 33c:	8562                	mv	a0,s8
 33e:	60e6                	ld	ra,88(sp)
 340:	6446                	ld	s0,80(sp)
 342:	64a6                	ld	s1,72(sp)
 344:	6906                	ld	s2,64(sp)
 346:	79e2                	ld	s3,56(sp)
 348:	7a42                	ld	s4,48(sp)
 34a:	7aa2                	ld	s5,40(sp)
 34c:	7b02                	ld	s6,32(sp)
 34e:	6be2                	ld	s7,24(sp)
 350:	6c42                	ld	s8,16(sp)
 352:	6125                	addi	sp,sp,96
 354:	8082                	ret

0000000000000356 <stat>:

int
stat(const char *n, struct stat *st)
{
 356:	1101                	addi	sp,sp,-32
 358:	ec06                	sd	ra,24(sp)
 35a:	e822                	sd	s0,16(sp)
 35c:	e426                	sd	s1,8(sp)
 35e:	e04a                	sd	s2,0(sp)
 360:	1000                	addi	s0,sp,32
 362:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 364:	4581                	li	a1,0
 366:	00000097          	auipc	ra,0x0
 36a:	198080e7          	jalr	408(ra) # 4fe <open>
  if(fd < 0)
 36e:	02054563          	bltz	a0,398 <stat+0x42>
 372:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 374:	85ca                	mv	a1,s2
 376:	00000097          	auipc	ra,0x0
 37a:	190080e7          	jalr	400(ra) # 506 <fstat>
 37e:	892a                	mv	s2,a0
  close(fd);
 380:	8526                	mv	a0,s1
 382:	00000097          	auipc	ra,0x0
 386:	164080e7          	jalr	356(ra) # 4e6 <close>
  return r;
}
 38a:	854a                	mv	a0,s2
 38c:	60e2                	ld	ra,24(sp)
 38e:	6442                	ld	s0,16(sp)
 390:	64a2                	ld	s1,8(sp)
 392:	6902                	ld	s2,0(sp)
 394:	6105                	addi	sp,sp,32
 396:	8082                	ret
    return -1;
 398:	597d                	li	s2,-1
 39a:	bfc5                	j	38a <stat+0x34>

000000000000039c <atoi>:

int
atoi(const char *s)
{
 39c:	1141                	addi	sp,sp,-16
 39e:	e422                	sd	s0,8(sp)
 3a0:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 3a2:	00054703          	lbu	a4,0(a0)
 3a6:	02d00793          	li	a5,45
  int neg = 1;
 3aa:	4805                	li	a6,1
  if (*s == '-') {
 3ac:	04f70363          	beq	a4,a5,3f2 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3b0:	00054683          	lbu	a3,0(a0)
 3b4:	fd06879b          	addiw	a5,a3,-48
 3b8:	0ff7f793          	andi	a5,a5,255
 3bc:	4725                	li	a4,9
 3be:	02f76d63          	bltu	a4,a5,3f8 <atoi+0x5c>
  n = 0;
 3c2:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 3c4:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3c6:	0505                	addi	a0,a0,1
 3c8:	0026179b          	slliw	a5,a2,0x2
 3cc:	9fb1                	addw	a5,a5,a2
 3ce:	0017979b          	slliw	a5,a5,0x1
 3d2:	9fb5                	addw	a5,a5,a3
 3d4:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 3d8:	00054683          	lbu	a3,0(a0)
 3dc:	fd06871b          	addiw	a4,a3,-48
 3e0:	0ff77713          	andi	a4,a4,255
 3e4:	fee5f1e3          	bleu	a4,a1,3c6 <atoi+0x2a>
  return n * neg;
}
 3e8:	02c8053b          	mulw	a0,a6,a2
 3ec:	6422                	ld	s0,8(sp)
 3ee:	0141                	addi	sp,sp,16
 3f0:	8082                	ret
    s++;
 3f2:	0505                	addi	a0,a0,1
    neg = -1;
 3f4:	587d                	li	a6,-1
 3f6:	bf6d                	j	3b0 <atoi+0x14>
  n = 0;
 3f8:	4601                	li	a2,0
 3fa:	b7fd                	j	3e8 <atoi+0x4c>

00000000000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	1141                	addi	sp,sp,-16
 3fe:	e422                	sd	s0,8(sp)
 400:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 402:	02b57663          	bleu	a1,a0,42e <memmove+0x32>
    while(n-- > 0)
 406:	02c05163          	blez	a2,428 <memmove+0x2c>
 40a:	fff6079b          	addiw	a5,a2,-1
 40e:	1782                	slli	a5,a5,0x20
 410:	9381                	srli	a5,a5,0x20
 412:	0785                	addi	a5,a5,1
 414:	97aa                	add	a5,a5,a0
  dst = vdst;
 416:	872a                	mv	a4,a0
      *dst++ = *src++;
 418:	0585                	addi	a1,a1,1
 41a:	0705                	addi	a4,a4,1
 41c:	fff5c683          	lbu	a3,-1(a1)
 420:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 424:	fee79ae3          	bne	a5,a4,418 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 428:	6422                	ld	s0,8(sp)
 42a:	0141                	addi	sp,sp,16
 42c:	8082                	ret
    dst += n;
 42e:	00c50733          	add	a4,a0,a2
    src += n;
 432:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 434:	fec05ae3          	blez	a2,428 <memmove+0x2c>
 438:	fff6079b          	addiw	a5,a2,-1
 43c:	1782                	slli	a5,a5,0x20
 43e:	9381                	srli	a5,a5,0x20
 440:	fff7c793          	not	a5,a5
 444:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 446:	15fd                	addi	a1,a1,-1
 448:	177d                	addi	a4,a4,-1
 44a:	0005c683          	lbu	a3,0(a1)
 44e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 452:	fef71ae3          	bne	a4,a5,446 <memmove+0x4a>
 456:	bfc9                	j	428 <memmove+0x2c>

0000000000000458 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 458:	1141                	addi	sp,sp,-16
 45a:	e422                	sd	s0,8(sp)
 45c:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 45e:	ce15                	beqz	a2,49a <memcmp+0x42>
 460:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 464:	00054783          	lbu	a5,0(a0)
 468:	0005c703          	lbu	a4,0(a1)
 46c:	02e79063          	bne	a5,a4,48c <memcmp+0x34>
 470:	1682                	slli	a3,a3,0x20
 472:	9281                	srli	a3,a3,0x20
 474:	0685                	addi	a3,a3,1
 476:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 478:	0505                	addi	a0,a0,1
    p2++;
 47a:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 47c:	00d50d63          	beq	a0,a3,496 <memcmp+0x3e>
    if (*p1 != *p2) {
 480:	00054783          	lbu	a5,0(a0)
 484:	0005c703          	lbu	a4,0(a1)
 488:	fee788e3          	beq	a5,a4,478 <memcmp+0x20>
      return *p1 - *p2;
 48c:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 490:	6422                	ld	s0,8(sp)
 492:	0141                	addi	sp,sp,16
 494:	8082                	ret
  return 0;
 496:	4501                	li	a0,0
 498:	bfe5                	j	490 <memcmp+0x38>
 49a:	4501                	li	a0,0
 49c:	bfd5                	j	490 <memcmp+0x38>

000000000000049e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 49e:	1141                	addi	sp,sp,-16
 4a0:	e406                	sd	ra,8(sp)
 4a2:	e022                	sd	s0,0(sp)
 4a4:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4a6:	00000097          	auipc	ra,0x0
 4aa:	f56080e7          	jalr	-170(ra) # 3fc <memmove>
}
 4ae:	60a2                	ld	ra,8(sp)
 4b0:	6402                	ld	s0,0(sp)
 4b2:	0141                	addi	sp,sp,16
 4b4:	8082                	ret

00000000000004b6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 4b6:	4885                	li	a7,1
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <exit>:
.global exit
exit:
 li a7, SYS_exit
 4be:	4889                	li	a7,2
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4c6:	488d                	li	a7,3
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4ce:	4891                	li	a7,4
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <read>:
.global read
read:
 li a7, SYS_read
 4d6:	4895                	li	a7,5
 ecall
 4d8:	00000073          	ecall
 ret
 4dc:	8082                	ret

00000000000004de <write>:
.global write
write:
 li a7, SYS_write
 4de:	48c1                	li	a7,16
 ecall
 4e0:	00000073          	ecall
 ret
 4e4:	8082                	ret

00000000000004e6 <close>:
.global close
close:
 li a7, SYS_close
 4e6:	48d5                	li	a7,21
 ecall
 4e8:	00000073          	ecall
 ret
 4ec:	8082                	ret

00000000000004ee <kill>:
.global kill
kill:
 li a7, SYS_kill
 4ee:	4899                	li	a7,6
 ecall
 4f0:	00000073          	ecall
 ret
 4f4:	8082                	ret

00000000000004f6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4f6:	489d                	li	a7,7
 ecall
 4f8:	00000073          	ecall
 ret
 4fc:	8082                	ret

00000000000004fe <open>:
.global open
open:
 li a7, SYS_open
 4fe:	48bd                	li	a7,15
 ecall
 500:	00000073          	ecall
 ret
 504:	8082                	ret

0000000000000506 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 506:	48a1                	li	a7,8
 ecall
 508:	00000073          	ecall
 ret
 50c:	8082                	ret

000000000000050e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 50e:	48d1                	li	a7,20
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 516:	48a5                	li	a7,9
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <dup>:
.global dup
dup:
 li a7, SYS_dup
 51e:	48a9                	li	a7,10
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 526:	48ad                	li	a7,11
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 52e:	48b1                	li	a7,12
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 536:	48b5                	li	a7,13
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 53e:	48b9                	li	a7,14
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 546:	48d9                	li	a7,22
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <dev>:
.global dev
dev:
 li a7, SYS_dev
 54e:	48dd                	li	a7,23
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 556:	48e1                	li	a7,24
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 55e:	48e5                	li	a7,25
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <remove>:
.global remove
remove:
 li a7, SYS_remove
 566:	48c5                	li	a7,17
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <trace>:
.global trace
trace:
 li a7, SYS_trace
 56e:	48c9                	li	a7,18
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 576:	48cd                	li	a7,19
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <rename>:
.global rename
rename:
 li a7, SYS_rename
 57e:	48e9                	li	a7,26
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 586:	48ed                	li	a7,27
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 58e:	1101                	addi	sp,sp,-32
 590:	ec06                	sd	ra,24(sp)
 592:	e822                	sd	s0,16(sp)
 594:	1000                	addi	s0,sp,32
 596:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 59a:	4605                	li	a2,1
 59c:	fef40593          	addi	a1,s0,-17
 5a0:	00000097          	auipc	ra,0x0
 5a4:	f3e080e7          	jalr	-194(ra) # 4de <write>
}
 5a8:	60e2                	ld	ra,24(sp)
 5aa:	6442                	ld	s0,16(sp)
 5ac:	6105                	addi	sp,sp,32
 5ae:	8082                	ret

00000000000005b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5b0:	7139                	addi	sp,sp,-64
 5b2:	fc06                	sd	ra,56(sp)
 5b4:	f822                	sd	s0,48(sp)
 5b6:	f426                	sd	s1,40(sp)
 5b8:	f04a                	sd	s2,32(sp)
 5ba:	ec4e                	sd	s3,24(sp)
 5bc:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5be:	c299                	beqz	a3,5c4 <printint+0x14>
 5c0:	0005ce63          	bltz	a1,5dc <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5c4:	2581                	sext.w	a1,a1
  neg = 0;
 5c6:	4301                	li	t1,0
  }

  i = 0;
 5c8:	fc040913          	addi	s2,s0,-64
  neg = 0;
 5cc:	874a                	mv	a4,s2
  i = 0;
 5ce:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 5d0:	2601                	sext.w	a2,a2
 5d2:	00000897          	auipc	a7,0x0
 5d6:	49e88893          	addi	a7,a7,1182 # a70 <digits>
 5da:	a801                	j	5ea <printint+0x3a>
    x = -xx;
 5dc:	40b005bb          	negw	a1,a1
 5e0:	2581                	sext.w	a1,a1
    neg = 1;
 5e2:	4305                	li	t1,1
    x = -xx;
 5e4:	b7d5                	j	5c8 <printint+0x18>
  }while((x /= base) != 0);
 5e6:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 5e8:	8836                	mv	a6,a3
 5ea:	0018069b          	addiw	a3,a6,1
 5ee:	02c5f7bb          	remuw	a5,a1,a2
 5f2:	1782                	slli	a5,a5,0x20
 5f4:	9381                	srli	a5,a5,0x20
 5f6:	97c6                	add	a5,a5,a7
 5f8:	0007c783          	lbu	a5,0(a5)
 5fc:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 600:	0705                	addi	a4,a4,1
 602:	02c5d7bb          	divuw	a5,a1,a2
 606:	fec5f0e3          	bleu	a2,a1,5e6 <printint+0x36>
  if(neg)
 60a:	00030b63          	beqz	t1,620 <printint+0x70>
    buf[i++] = '-';
 60e:	fd040793          	addi	a5,s0,-48
 612:	96be                	add	a3,a3,a5
 614:	02d00793          	li	a5,45
 618:	fef68823          	sb	a5,-16(a3)
 61c:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 620:	02d05763          	blez	a3,64e <printint+0x9e>
 624:	89aa                	mv	s3,a0
 626:	fc040493          	addi	s1,s0,-64
 62a:	94b6                	add	s1,s1,a3
 62c:	197d                	addi	s2,s2,-1
 62e:	9936                	add	s2,s2,a3
 630:	36fd                	addiw	a3,a3,-1
 632:	1682                	slli	a3,a3,0x20
 634:	9281                	srli	a3,a3,0x20
 636:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 63a:	fff4c583          	lbu	a1,-1(s1)
 63e:	854e                	mv	a0,s3
 640:	00000097          	auipc	ra,0x0
 644:	f4e080e7          	jalr	-178(ra) # 58e <putc>
  while(--i >= 0)
 648:	14fd                	addi	s1,s1,-1
 64a:	ff2498e3          	bne	s1,s2,63a <printint+0x8a>
}
 64e:	70e2                	ld	ra,56(sp)
 650:	7442                	ld	s0,48(sp)
 652:	74a2                	ld	s1,40(sp)
 654:	7902                	ld	s2,32(sp)
 656:	69e2                	ld	s3,24(sp)
 658:	6121                	addi	sp,sp,64
 65a:	8082                	ret

000000000000065c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 65c:	7119                	addi	sp,sp,-128
 65e:	fc86                	sd	ra,120(sp)
 660:	f8a2                	sd	s0,112(sp)
 662:	f4a6                	sd	s1,104(sp)
 664:	f0ca                	sd	s2,96(sp)
 666:	ecce                	sd	s3,88(sp)
 668:	e8d2                	sd	s4,80(sp)
 66a:	e4d6                	sd	s5,72(sp)
 66c:	e0da                	sd	s6,64(sp)
 66e:	fc5e                	sd	s7,56(sp)
 670:	f862                	sd	s8,48(sp)
 672:	f466                	sd	s9,40(sp)
 674:	f06a                	sd	s10,32(sp)
 676:	ec6e                	sd	s11,24(sp)
 678:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 67a:	0005c483          	lbu	s1,0(a1)
 67e:	18048d63          	beqz	s1,818 <vprintf+0x1bc>
 682:	8aaa                	mv	s5,a0
 684:	8b32                	mv	s6,a2
 686:	00158913          	addi	s2,a1,1
  state = 0;
 68a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 68c:	02500a13          	li	s4,37
      if(c == 'd'){
 690:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 694:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 698:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 69c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6a0:	00000b97          	auipc	s7,0x0
 6a4:	3d0b8b93          	addi	s7,s7,976 # a70 <digits>
 6a8:	a839                	j	6c6 <vprintf+0x6a>
        putc(fd, c);
 6aa:	85a6                	mv	a1,s1
 6ac:	8556                	mv	a0,s5
 6ae:	00000097          	auipc	ra,0x0
 6b2:	ee0080e7          	jalr	-288(ra) # 58e <putc>
 6b6:	a019                	j	6bc <vprintf+0x60>
    } else if(state == '%'){
 6b8:	01498f63          	beq	s3,s4,6d6 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6bc:	0905                	addi	s2,s2,1
 6be:	fff94483          	lbu	s1,-1(s2)
 6c2:	14048b63          	beqz	s1,818 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 6c6:	0004879b          	sext.w	a5,s1
    if(state == 0){
 6ca:	fe0997e3          	bnez	s3,6b8 <vprintf+0x5c>
      if(c == '%'){
 6ce:	fd479ee3          	bne	a5,s4,6aa <vprintf+0x4e>
        state = '%';
 6d2:	89be                	mv	s3,a5
 6d4:	b7e5                	j	6bc <vprintf+0x60>
      if(c == 'd'){
 6d6:	05878063          	beq	a5,s8,716 <vprintf+0xba>
      } else if(c == 'l') {
 6da:	05978c63          	beq	a5,s9,732 <vprintf+0xd6>
      } else if(c == 'x') {
 6de:	07a78863          	beq	a5,s10,74e <vprintf+0xf2>
      } else if(c == 'p') {
 6e2:	09b78463          	beq	a5,s11,76a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6e6:	07300713          	li	a4,115
 6ea:	0ce78563          	beq	a5,a4,7b4 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ee:	06300713          	li	a4,99
 6f2:	0ee78c63          	beq	a5,a4,7ea <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6f6:	11478663          	beq	a5,s4,802 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6fa:	85d2                	mv	a1,s4
 6fc:	8556                	mv	a0,s5
 6fe:	00000097          	auipc	ra,0x0
 702:	e90080e7          	jalr	-368(ra) # 58e <putc>
        putc(fd, c);
 706:	85a6                	mv	a1,s1
 708:	8556                	mv	a0,s5
 70a:	00000097          	auipc	ra,0x0
 70e:	e84080e7          	jalr	-380(ra) # 58e <putc>
      }
      state = 0;
 712:	4981                	li	s3,0
 714:	b765                	j	6bc <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 716:	008b0493          	addi	s1,s6,8
 71a:	4685                	li	a3,1
 71c:	4629                	li	a2,10
 71e:	000b2583          	lw	a1,0(s6)
 722:	8556                	mv	a0,s5
 724:	00000097          	auipc	ra,0x0
 728:	e8c080e7          	jalr	-372(ra) # 5b0 <printint>
 72c:	8b26                	mv	s6,s1
      state = 0;
 72e:	4981                	li	s3,0
 730:	b771                	j	6bc <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 732:	008b0493          	addi	s1,s6,8
 736:	4681                	li	a3,0
 738:	4629                	li	a2,10
 73a:	000b2583          	lw	a1,0(s6)
 73e:	8556                	mv	a0,s5
 740:	00000097          	auipc	ra,0x0
 744:	e70080e7          	jalr	-400(ra) # 5b0 <printint>
 748:	8b26                	mv	s6,s1
      state = 0;
 74a:	4981                	li	s3,0
 74c:	bf85                	j	6bc <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 74e:	008b0493          	addi	s1,s6,8
 752:	4681                	li	a3,0
 754:	4641                	li	a2,16
 756:	000b2583          	lw	a1,0(s6)
 75a:	8556                	mv	a0,s5
 75c:	00000097          	auipc	ra,0x0
 760:	e54080e7          	jalr	-428(ra) # 5b0 <printint>
 764:	8b26                	mv	s6,s1
      state = 0;
 766:	4981                	li	s3,0
 768:	bf91                	j	6bc <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 76a:	008b0793          	addi	a5,s6,8
 76e:	f8f43423          	sd	a5,-120(s0)
 772:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 776:	03000593          	li	a1,48
 77a:	8556                	mv	a0,s5
 77c:	00000097          	auipc	ra,0x0
 780:	e12080e7          	jalr	-494(ra) # 58e <putc>
  putc(fd, 'x');
 784:	85ea                	mv	a1,s10
 786:	8556                	mv	a0,s5
 788:	00000097          	auipc	ra,0x0
 78c:	e06080e7          	jalr	-506(ra) # 58e <putc>
 790:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 792:	03c9d793          	srli	a5,s3,0x3c
 796:	97de                	add	a5,a5,s7
 798:	0007c583          	lbu	a1,0(a5)
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	df0080e7          	jalr	-528(ra) # 58e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7a6:	0992                	slli	s3,s3,0x4
 7a8:	34fd                	addiw	s1,s1,-1
 7aa:	f4e5                	bnez	s1,792 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 7ac:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7b0:	4981                	li	s3,0
 7b2:	b729                	j	6bc <vprintf+0x60>
        s = va_arg(ap, char*);
 7b4:	008b0993          	addi	s3,s6,8
 7b8:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 7bc:	c085                	beqz	s1,7dc <vprintf+0x180>
        while(*s != 0){
 7be:	0004c583          	lbu	a1,0(s1)
 7c2:	c9a1                	beqz	a1,812 <vprintf+0x1b6>
          putc(fd, *s);
 7c4:	8556                	mv	a0,s5
 7c6:	00000097          	auipc	ra,0x0
 7ca:	dc8080e7          	jalr	-568(ra) # 58e <putc>
          s++;
 7ce:	0485                	addi	s1,s1,1
        while(*s != 0){
 7d0:	0004c583          	lbu	a1,0(s1)
 7d4:	f9e5                	bnez	a1,7c4 <vprintf+0x168>
        s = va_arg(ap, char*);
 7d6:	8b4e                	mv	s6,s3
      state = 0;
 7d8:	4981                	li	s3,0
 7da:	b5cd                	j	6bc <vprintf+0x60>
          s = "(null)";
 7dc:	00000497          	auipc	s1,0x0
 7e0:	2ac48493          	addi	s1,s1,684 # a88 <digits+0x18>
        while(*s != 0){
 7e4:	02800593          	li	a1,40
 7e8:	bff1                	j	7c4 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 7ea:	008b0493          	addi	s1,s6,8
 7ee:	000b4583          	lbu	a1,0(s6)
 7f2:	8556                	mv	a0,s5
 7f4:	00000097          	auipc	ra,0x0
 7f8:	d9a080e7          	jalr	-614(ra) # 58e <putc>
 7fc:	8b26                	mv	s6,s1
      state = 0;
 7fe:	4981                	li	s3,0
 800:	bd75                	j	6bc <vprintf+0x60>
        putc(fd, c);
 802:	85d2                	mv	a1,s4
 804:	8556                	mv	a0,s5
 806:	00000097          	auipc	ra,0x0
 80a:	d88080e7          	jalr	-632(ra) # 58e <putc>
      state = 0;
 80e:	4981                	li	s3,0
 810:	b575                	j	6bc <vprintf+0x60>
        s = va_arg(ap, char*);
 812:	8b4e                	mv	s6,s3
      state = 0;
 814:	4981                	li	s3,0
 816:	b55d                	j	6bc <vprintf+0x60>
    }
  }
}
 818:	70e6                	ld	ra,120(sp)
 81a:	7446                	ld	s0,112(sp)
 81c:	74a6                	ld	s1,104(sp)
 81e:	7906                	ld	s2,96(sp)
 820:	69e6                	ld	s3,88(sp)
 822:	6a46                	ld	s4,80(sp)
 824:	6aa6                	ld	s5,72(sp)
 826:	6b06                	ld	s6,64(sp)
 828:	7be2                	ld	s7,56(sp)
 82a:	7c42                	ld	s8,48(sp)
 82c:	7ca2                	ld	s9,40(sp)
 82e:	7d02                	ld	s10,32(sp)
 830:	6de2                	ld	s11,24(sp)
 832:	6109                	addi	sp,sp,128
 834:	8082                	ret

0000000000000836 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 836:	715d                	addi	sp,sp,-80
 838:	ec06                	sd	ra,24(sp)
 83a:	e822                	sd	s0,16(sp)
 83c:	1000                	addi	s0,sp,32
 83e:	e010                	sd	a2,0(s0)
 840:	e414                	sd	a3,8(s0)
 842:	e818                	sd	a4,16(s0)
 844:	ec1c                	sd	a5,24(s0)
 846:	03043023          	sd	a6,32(s0)
 84a:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 84e:	8622                	mv	a2,s0
 850:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 854:	00000097          	auipc	ra,0x0
 858:	e08080e7          	jalr	-504(ra) # 65c <vprintf>
}
 85c:	60e2                	ld	ra,24(sp)
 85e:	6442                	ld	s0,16(sp)
 860:	6161                	addi	sp,sp,80
 862:	8082                	ret

0000000000000864 <printf>:

void
printf(const char *fmt, ...)
{
 864:	711d                	addi	sp,sp,-96
 866:	ec06                	sd	ra,24(sp)
 868:	e822                	sd	s0,16(sp)
 86a:	1000                	addi	s0,sp,32
 86c:	e40c                	sd	a1,8(s0)
 86e:	e810                	sd	a2,16(s0)
 870:	ec14                	sd	a3,24(s0)
 872:	f018                	sd	a4,32(s0)
 874:	f41c                	sd	a5,40(s0)
 876:	03043823          	sd	a6,48(s0)
 87a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 87e:	00840613          	addi	a2,s0,8
 882:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 886:	85aa                	mv	a1,a0
 888:	4505                	li	a0,1
 88a:	00000097          	auipc	ra,0x0
 88e:	dd2080e7          	jalr	-558(ra) # 65c <vprintf>
}
 892:	60e2                	ld	ra,24(sp)
 894:	6442                	ld	s0,16(sp)
 896:	6125                	addi	sp,sp,96
 898:	8082                	ret

000000000000089a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89a:	1141                	addi	sp,sp,-16
 89c:	e422                	sd	s0,8(sp)
 89e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a0:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a4:	00000797          	auipc	a5,0x0
 8a8:	21478793          	addi	a5,a5,532 # ab8 <freep>
 8ac:	639c                	ld	a5,0(a5)
 8ae:	a805                	j	8de <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8b0:	4618                	lw	a4,8(a2)
 8b2:	9db9                	addw	a1,a1,a4
 8b4:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b8:	6398                	ld	a4,0(a5)
 8ba:	6318                	ld	a4,0(a4)
 8bc:	fee53823          	sd	a4,-16(a0)
 8c0:	a091                	j	904 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8c2:	ff852703          	lw	a4,-8(a0)
 8c6:	9e39                	addw	a2,a2,a4
 8c8:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8ca:	ff053703          	ld	a4,-16(a0)
 8ce:	e398                	sd	a4,0(a5)
 8d0:	a099                	j	916 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d2:	6398                	ld	a4,0(a5)
 8d4:	00e7e463          	bltu	a5,a4,8dc <free+0x42>
 8d8:	00e6ea63          	bltu	a3,a4,8ec <free+0x52>
{
 8dc:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8de:	fed7fae3          	bleu	a3,a5,8d2 <free+0x38>
 8e2:	6398                	ld	a4,0(a5)
 8e4:	00e6e463          	bltu	a3,a4,8ec <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e8:	fee7eae3          	bltu	a5,a4,8dc <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 8ec:	ff852583          	lw	a1,-8(a0)
 8f0:	6390                	ld	a2,0(a5)
 8f2:	02059713          	slli	a4,a1,0x20
 8f6:	9301                	srli	a4,a4,0x20
 8f8:	0712                	slli	a4,a4,0x4
 8fa:	9736                	add	a4,a4,a3
 8fc:	fae60ae3          	beq	a2,a4,8b0 <free+0x16>
    bp->s.ptr = p->s.ptr;
 900:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 904:	4790                	lw	a2,8(a5)
 906:	02061713          	slli	a4,a2,0x20
 90a:	9301                	srli	a4,a4,0x20
 90c:	0712                	slli	a4,a4,0x4
 90e:	973e                	add	a4,a4,a5
 910:	fae689e3          	beq	a3,a4,8c2 <free+0x28>
  } else
    p->s.ptr = bp;
 914:	e394                	sd	a3,0(a5)
  freep = p;
 916:	00000717          	auipc	a4,0x0
 91a:	1af73123          	sd	a5,418(a4) # ab8 <freep>
}
 91e:	6422                	ld	s0,8(sp)
 920:	0141                	addi	sp,sp,16
 922:	8082                	ret

0000000000000924 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 924:	7139                	addi	sp,sp,-64
 926:	fc06                	sd	ra,56(sp)
 928:	f822                	sd	s0,48(sp)
 92a:	f426                	sd	s1,40(sp)
 92c:	f04a                	sd	s2,32(sp)
 92e:	ec4e                	sd	s3,24(sp)
 930:	e852                	sd	s4,16(sp)
 932:	e456                	sd	s5,8(sp)
 934:	e05a                	sd	s6,0(sp)
 936:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 938:	02051993          	slli	s3,a0,0x20
 93c:	0209d993          	srli	s3,s3,0x20
 940:	09bd                	addi	s3,s3,15
 942:	0049d993          	srli	s3,s3,0x4
 946:	2985                	addiw	s3,s3,1
 948:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 94c:	00000797          	auipc	a5,0x0
 950:	16c78793          	addi	a5,a5,364 # ab8 <freep>
 954:	6388                	ld	a0,0(a5)
 956:	c515                	beqz	a0,982 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 958:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 95a:	4798                	lw	a4,8(a5)
 95c:	03277d63          	bleu	s2,a4,996 <malloc+0x72>
 960:	8a4e                	mv	s4,s3
 962:	0009871b          	sext.w	a4,s3
 966:	6685                	lui	a3,0x1
 968:	00d77363          	bleu	a3,a4,96e <malloc+0x4a>
 96c:	6a05                	lui	s4,0x1
 96e:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 972:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 976:	00000497          	auipc	s1,0x0
 97a:	14248493          	addi	s1,s1,322 # ab8 <freep>
  if(p == (char*)-1)
 97e:	5b7d                	li	s6,-1
 980:	a0b5                	j	9ec <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 982:	00000717          	auipc	a4,0x0
 986:	13e70713          	addi	a4,a4,318 # ac0 <base>
 98a:	e398                	sd	a4,0(a5)
 98c:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 98e:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 992:	87ba                	mv	a5,a4
 994:	b7f1                	j	960 <malloc+0x3c>
      if(p->s.size == nunits)
 996:	02e90b63          	beq	s2,a4,9cc <malloc+0xa8>
        p->s.size -= nunits;
 99a:	4137073b          	subw	a4,a4,s3
 99e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9a0:	1702                	slli	a4,a4,0x20
 9a2:	9301                	srli	a4,a4,0x20
 9a4:	0712                	slli	a4,a4,0x4
 9a6:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9a8:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9ac:	00000717          	auipc	a4,0x0
 9b0:	10a73623          	sd	a0,268(a4) # ab8 <freep>
      return (void*)(p + 1);
 9b4:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9b8:	70e2                	ld	ra,56(sp)
 9ba:	7442                	ld	s0,48(sp)
 9bc:	74a2                	ld	s1,40(sp)
 9be:	7902                	ld	s2,32(sp)
 9c0:	69e2                	ld	s3,24(sp)
 9c2:	6a42                	ld	s4,16(sp)
 9c4:	6aa2                	ld	s5,8(sp)
 9c6:	6b02                	ld	s6,0(sp)
 9c8:	6121                	addi	sp,sp,64
 9ca:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9cc:	6398                	ld	a4,0(a5)
 9ce:	e118                	sd	a4,0(a0)
 9d0:	bff1                	j	9ac <malloc+0x88>
  hp->s.size = nu;
 9d2:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 9d6:	0541                	addi	a0,a0,16
 9d8:	00000097          	auipc	ra,0x0
 9dc:	ec2080e7          	jalr	-318(ra) # 89a <free>
  return freep;
 9e0:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 9e2:	d979                	beqz	a0,9b8 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9e6:	4798                	lw	a4,8(a5)
 9e8:	fb2777e3          	bleu	s2,a4,996 <malloc+0x72>
    if(p == freep)
 9ec:	6098                	ld	a4,0(s1)
 9ee:	853e                	mv	a0,a5
 9f0:	fef71ae3          	bne	a4,a5,9e4 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9f4:	8552                	mv	a0,s4
 9f6:	00000097          	auipc	ra,0x0
 9fa:	b38080e7          	jalr	-1224(ra) # 52e <sbrk>
  if(p == (char*)-1)
 9fe:	fd651ae3          	bne	a0,s6,9d2 <malloc+0xae>
        return 0;
 a02:	4501                	li	a0,0
 a04:	bf55                	j	9b8 <malloc+0x94>
