
xv6-user/_xargs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <readline>:
/**
 * len:    include the 0 in the end.
 * return: the number of bytes that read successfully (0 in the end is not included)
 */
int readline(int fd, char *buf, int len)
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	e456                	sd	s5,8(sp)
  10:	0080                	addi	s0,sp,64
  12:	89aa                	mv	s3,a0
  14:	892e                	mv	s2,a1
    char *p = buf;
  16:	84ae                	mv	s1,a1
    while (read(fd, p, 1) != 0 && p < buf + len) {
  18:	00c58a33          	add	s4,a1,a2
        if (*p == '\n') {
  1c:	4aa9                	li	s5,10
    while (read(fd, p, 1) != 0 && p < buf + len) {
  1e:	a011                	j	22 <readline+0x22>
                continue;
            }
            *p = '\0';
            break;
        }
        p++;
  20:	0485                	addi	s1,s1,1
    while (read(fd, p, 1) != 0 && p < buf + len) {
  22:	4605                	li	a2,1
  24:	85a6                	mv	a1,s1
  26:	854e                	mv	a0,s3
  28:	00000097          	auipc	ra,0x0
  2c:	478080e7          	jalr	1144(ra) # 4a0 <read>
  30:	c905                	beqz	a0,60 <readline+0x60>
  32:	0344f763          	bleu	s4,s1,60 <readline+0x60>
        if (*p == '\n') {
  36:	0004c783          	lbu	a5,0(s1)
  3a:	ff5793e3          	bne	a5,s5,20 <readline+0x20>
            if (p == buf) {     // ignore empty line
  3e:	01248f63          	beq	s1,s2,5c <readline+0x5c>
            *p = '\0';
  42:	00048023          	sb	zero,0(s1)
    }
    if (p == buf) {
        return 0;
    }
    return p - buf;
  46:	4124853b          	subw	a0,s1,s2
}
  4a:	70e2                	ld	ra,56(sp)
  4c:	7442                	ld	s0,48(sp)
  4e:	74a2                	ld	s1,40(sp)
  50:	7902                	ld	s2,32(sp)
  52:	69e2                	ld	s3,24(sp)
  54:	6a42                	ld	s4,16(sp)
  56:	6aa2                	ld	s5,8(sp)
  58:	6121                	addi	sp,sp,64
  5a:	8082                	ret
  5c:	84ca                	mv	s1,s2
  5e:	b7d1                	j	22 <readline+0x22>
        return 0;
  60:	4501                	li	a0,0
    if (p == buf) {
  62:	ff2484e3          	beq	s1,s2,4a <readline+0x4a>
  66:	b7c5                	j	46 <readline+0x46>

0000000000000068 <main>:

int main(int argc, char *argv[])
{
  68:	7161                	addi	sp,sp,-432
  6a:	f706                	sd	ra,424(sp)
  6c:	f322                	sd	s0,416(sp)
  6e:	ef26                	sd	s1,408(sp)
  70:	eb4a                	sd	s2,400(sp)
  72:	e74e                	sd	s3,392(sp)
  74:	1b00                	addi	s0,sp,432
    if (argc < 2) {
  76:	4785                	li	a5,1
  78:	08a7dd63          	ble	a0,a5,112 <main+0xaa>
  7c:	892a                	mv	s2,a0
  7e:	89ae                	mv	s3,a1
  80:	00858713          	addi	a4,a1,8
  84:	ed040793          	addi	a5,s0,-304
  88:	0005059b          	sext.w	a1,a0
  8c:	ffe5861b          	addiw	a2,a1,-2
  90:	1602                	slli	a2,a2,0x20
  92:	9201                	srli	a2,a2,0x20
  94:	060e                	slli	a2,a2,0x3
  96:	ed840693          	addi	a3,s0,-296
  9a:	9636                	add	a2,a2,a3
    }
    char *argvs[MAXARG];
    char buf[128];
    int i;
    for (i = 1; i < argc; i++) {
        argvs[i - 1] = argv[i];         // argvs[0] = COMMAND
  9c:	6314                	ld	a3,0(a4)
  9e:	e394                	sd	a3,0(a5)
    for (i = 1; i < argc; i++) {
  a0:	0721                	addi	a4,a4,8
  a2:	07a1                	addi	a5,a5,8
  a4:	fec79ce3          	bne	a5,a2,9c <main+0x34>
  a8:	fff5849b          	addiw	s1,a1,-1
    }
    i--;
    if (readline(0, buf, 128) == 0) {   // if there is no input
  ac:	08000613          	li	a2,128
  b0:	e5040593          	addi	a1,s0,-432
  b4:	4501                	li	a0,0
  b6:	00000097          	auipc	ra,0x0
  ba:	f4a080e7          	jalr	-182(ra) # 0 <readline>
  be:	c925                	beqz	a0,12e <main+0xc6>
            printf("xargs: exec %s fail\n", argv[1]);
            exit(0);
        }
        wait(0);
    } else {
        argvs[i] = buf;
  c0:	00349593          	slli	a1,s1,0x3
  c4:	fd040793          	addi	a5,s0,-48
  c8:	95be                	add	a1,a1,a5
  ca:	e5040793          	addi	a5,s0,-432
  ce:	f0f5b023          	sd	a5,-256(a1)
        argvs[i + 1] = 0;
  d2:	090e                	slli	s2,s2,0x3
  d4:	fd040793          	addi	a5,s0,-48
  d8:	993e                	add	s2,s2,a5
  da:	f0093023          	sd	zero,-256(s2)
                exec(argv[1], argvs);
                printf("xargs: exec %s fail\n", argv[1]);
                exit(0);
            }
            wait(0);
        } while (readline(0, buf, 128) != 0);
  de:	e5040493          	addi	s1,s0,-432
            if (fork() == 0) {
  e2:	00000097          	auipc	ra,0x0
  e6:	39e080e7          	jalr	926(ra) # 480 <fork>
  ea:	c959                	beqz	a0,180 <main+0x118>
            wait(0);
  ec:	4501                	li	a0,0
  ee:	00000097          	auipc	ra,0x0
  f2:	3a2080e7          	jalr	930(ra) # 490 <wait>
        } while (readline(0, buf, 128) != 0);
  f6:	08000613          	li	a2,128
  fa:	85a6                	mv	a1,s1
  fc:	4501                	li	a0,0
  fe:	00000097          	auipc	ra,0x0
 102:	f02080e7          	jalr	-254(ra) # 0 <readline>
 106:	fd71                	bnez	a0,e2 <main+0x7a>
    }
    exit(0);
 108:	4501                	li	a0,0
 10a:	00000097          	auipc	ra,0x0
 10e:	37e080e7          	jalr	894(ra) # 488 <exit>
        fprintf(2, "Usage: xargs COMMAND [INITIAL-ARGS]...\n");
 112:	00001597          	auipc	a1,0x1
 116:	8be58593          	addi	a1,a1,-1858 # 9d0 <malloc+0xe2>
 11a:	4509                	li	a0,2
 11c:	00000097          	auipc	ra,0x0
 120:	6e4080e7          	jalr	1764(ra) # 800 <fprintf>
        exit(-1);
 124:	557d                	li	a0,-1
 126:	00000097          	auipc	ra,0x0
 12a:	362080e7          	jalr	866(ra) # 488 <exit>
        argvs[i] = 0;
 12e:	00349593          	slli	a1,s1,0x3
 132:	fd040793          	addi	a5,s0,-48
 136:	95be                	add	a1,a1,a5
 138:	f005b023          	sd	zero,-256(a1)
        if (fork() == 0) {
 13c:	00000097          	auipc	ra,0x0
 140:	344080e7          	jalr	836(ra) # 480 <fork>
 144:	e905                	bnez	a0,174 <main+0x10c>
            exec(argv[1], argvs);
 146:	ed040593          	addi	a1,s0,-304
 14a:	0089b503          	ld	a0,8(s3)
 14e:	00000097          	auipc	ra,0x0
 152:	372080e7          	jalr	882(ra) # 4c0 <exec>
            printf("xargs: exec %s fail\n", argv[1]);
 156:	0089b583          	ld	a1,8(s3)
 15a:	00001517          	auipc	a0,0x1
 15e:	89e50513          	addi	a0,a0,-1890 # 9f8 <malloc+0x10a>
 162:	00000097          	auipc	ra,0x0
 166:	6cc080e7          	jalr	1740(ra) # 82e <printf>
            exit(0);
 16a:	4501                	li	a0,0
 16c:	00000097          	auipc	ra,0x0
 170:	31c080e7          	jalr	796(ra) # 488 <exit>
        wait(0);
 174:	4501                	li	a0,0
 176:	00000097          	auipc	ra,0x0
 17a:	31a080e7          	jalr	794(ra) # 490 <wait>
 17e:	b769                	j	108 <main+0xa0>
                exec(argv[1], argvs);
 180:	ed040593          	addi	a1,s0,-304
 184:	0089b503          	ld	a0,8(s3)
 188:	00000097          	auipc	ra,0x0
 18c:	338080e7          	jalr	824(ra) # 4c0 <exec>
                printf("xargs: exec %s fail\n", argv[1]);
 190:	0089b583          	ld	a1,8(s3)
 194:	00001517          	auipc	a0,0x1
 198:	86450513          	addi	a0,a0,-1948 # 9f8 <malloc+0x10a>
 19c:	00000097          	auipc	ra,0x0
 1a0:	692080e7          	jalr	1682(ra) # 82e <printf>
                exit(0);
 1a4:	4501                	li	a0,0
 1a6:	00000097          	auipc	ra,0x0
 1aa:	2e2080e7          	jalr	738(ra) # 488 <exit>

00000000000001ae <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1ae:	1141                	addi	sp,sp,-16
 1b0:	e422                	sd	s0,8(sp)
 1b2:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b4:	87aa                	mv	a5,a0
 1b6:	0585                	addi	a1,a1,1
 1b8:	0785                	addi	a5,a5,1
 1ba:	fff5c703          	lbu	a4,-1(a1)
 1be:	fee78fa3          	sb	a4,-1(a5)
 1c2:	fb75                	bnez	a4,1b6 <strcpy+0x8>
    ;
  return os;
}
 1c4:	6422                	ld	s0,8(sp)
 1c6:	0141                	addi	sp,sp,16
 1c8:	8082                	ret

00000000000001ca <strcat>:

char*
strcat(char *s, const char *t)
{
 1ca:	1141                	addi	sp,sp,-16
 1cc:	e422                	sd	s0,8(sp)
 1ce:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1d0:	00054783          	lbu	a5,0(a0)
 1d4:	c385                	beqz	a5,1f4 <strcat+0x2a>
 1d6:	87aa                	mv	a5,a0
    s++;
 1d8:	0785                	addi	a5,a5,1
  while(*s)
 1da:	0007c703          	lbu	a4,0(a5)
 1de:	ff6d                	bnez	a4,1d8 <strcat+0xe>
  while((*s++ = *t++))
 1e0:	0585                	addi	a1,a1,1
 1e2:	0785                	addi	a5,a5,1
 1e4:	fff5c703          	lbu	a4,-1(a1)
 1e8:	fee78fa3          	sb	a4,-1(a5)
 1ec:	fb75                	bnez	a4,1e0 <strcat+0x16>
    ;
  return os;
}
 1ee:	6422                	ld	s0,8(sp)
 1f0:	0141                	addi	sp,sp,16
 1f2:	8082                	ret
  while(*s)
 1f4:	87aa                	mv	a5,a0
 1f6:	b7ed                	j	1e0 <strcat+0x16>

00000000000001f8 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 1f8:	1141                	addi	sp,sp,-16
 1fa:	e422                	sd	s0,8(sp)
 1fc:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1fe:	00054783          	lbu	a5,0(a0)
 202:	cf91                	beqz	a5,21e <strcmp+0x26>
 204:	0005c703          	lbu	a4,0(a1)
 208:	00f71b63          	bne	a4,a5,21e <strcmp+0x26>
    p++, q++;
 20c:	0505                	addi	a0,a0,1
 20e:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 210:	00054783          	lbu	a5,0(a0)
 214:	c789                	beqz	a5,21e <strcmp+0x26>
 216:	0005c703          	lbu	a4,0(a1)
 21a:	fef709e3          	beq	a4,a5,20c <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 21e:	0005c503          	lbu	a0,0(a1)
}
 222:	40a7853b          	subw	a0,a5,a0
 226:	6422                	ld	s0,8(sp)
 228:	0141                	addi	sp,sp,16
 22a:	8082                	ret

000000000000022c <strlen>:

uint
strlen(const char *s)
{
 22c:	1141                	addi	sp,sp,-16
 22e:	e422                	sd	s0,8(sp)
 230:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 232:	00054783          	lbu	a5,0(a0)
 236:	cf91                	beqz	a5,252 <strlen+0x26>
 238:	0505                	addi	a0,a0,1
 23a:	87aa                	mv	a5,a0
 23c:	4685                	li	a3,1
 23e:	9e89                	subw	a3,a3,a0
 240:	00f6853b          	addw	a0,a3,a5
 244:	0785                	addi	a5,a5,1
 246:	fff7c703          	lbu	a4,-1(a5)
 24a:	fb7d                	bnez	a4,240 <strlen+0x14>
    ;
  return n;
}
 24c:	6422                	ld	s0,8(sp)
 24e:	0141                	addi	sp,sp,16
 250:	8082                	ret
  for(n = 0; s[n]; n++)
 252:	4501                	li	a0,0
 254:	bfe5                	j	24c <strlen+0x20>

0000000000000256 <memset>:

void*
memset(void *dst, int c, uint n)
{
 256:	1141                	addi	sp,sp,-16
 258:	e422                	sd	s0,8(sp)
 25a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 25c:	ce09                	beqz	a2,276 <memset+0x20>
 25e:	87aa                	mv	a5,a0
 260:	fff6071b          	addiw	a4,a2,-1
 264:	1702                	slli	a4,a4,0x20
 266:	9301                	srli	a4,a4,0x20
 268:	0705                	addi	a4,a4,1
 26a:	972a                	add	a4,a4,a0
    cdst[i] = c;
 26c:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 270:	0785                	addi	a5,a5,1
 272:	fee79de3          	bne	a5,a4,26c <memset+0x16>
  }
  return dst;
}
 276:	6422                	ld	s0,8(sp)
 278:	0141                	addi	sp,sp,16
 27a:	8082                	ret

000000000000027c <strchr>:

char*
strchr(const char *s, char c)
{
 27c:	1141                	addi	sp,sp,-16
 27e:	e422                	sd	s0,8(sp)
 280:	0800                	addi	s0,sp,16
  for(; *s; s++)
 282:	00054783          	lbu	a5,0(a0)
 286:	cf91                	beqz	a5,2a2 <strchr+0x26>
    if(*s == c)
 288:	00f58a63          	beq	a1,a5,29c <strchr+0x20>
  for(; *s; s++)
 28c:	0505                	addi	a0,a0,1
 28e:	00054783          	lbu	a5,0(a0)
 292:	c781                	beqz	a5,29a <strchr+0x1e>
    if(*s == c)
 294:	feb79ce3          	bne	a5,a1,28c <strchr+0x10>
 298:	a011                	j	29c <strchr+0x20>
      return (char*)s;
  return 0;
 29a:	4501                	li	a0,0
}
 29c:	6422                	ld	s0,8(sp)
 29e:	0141                	addi	sp,sp,16
 2a0:	8082                	ret
  return 0;
 2a2:	4501                	li	a0,0
 2a4:	bfe5                	j	29c <strchr+0x20>

00000000000002a6 <gets>:

char*
gets(char *buf, int max)
{
 2a6:	711d                	addi	sp,sp,-96
 2a8:	ec86                	sd	ra,88(sp)
 2aa:	e8a2                	sd	s0,80(sp)
 2ac:	e4a6                	sd	s1,72(sp)
 2ae:	e0ca                	sd	s2,64(sp)
 2b0:	fc4e                	sd	s3,56(sp)
 2b2:	f852                	sd	s4,48(sp)
 2b4:	f456                	sd	s5,40(sp)
 2b6:	f05a                	sd	s6,32(sp)
 2b8:	ec5e                	sd	s7,24(sp)
 2ba:	e862                	sd	s8,16(sp)
 2bc:	1080                	addi	s0,sp,96
 2be:	8c2a                	mv	s8,a0
 2c0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c2:	892a                	mv	s2,a0
 2c4:	4981                	li	s3,0
    cc = read(0, &c, 1);
 2c6:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2ca:	4b29                	li	s6,10
 2cc:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 2ce:	0019849b          	addiw	s1,s3,1
 2d2:	0344d763          	ble	s4,s1,300 <gets+0x5a>
    cc = read(0, &c, 1);
 2d6:	4605                	li	a2,1
 2d8:	85d6                	mv	a1,s5
 2da:	4501                	li	a0,0
 2dc:	00000097          	auipc	ra,0x0
 2e0:	1c4080e7          	jalr	452(ra) # 4a0 <read>
    if(cc < 1)
 2e4:	00a05e63          	blez	a0,300 <gets+0x5a>
    buf[i++] = c;
 2e8:	faf44783          	lbu	a5,-81(s0)
 2ec:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2f0:	01678763          	beq	a5,s6,2fe <gets+0x58>
 2f4:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 2f6:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 2f8:	fd779be3          	bne	a5,s7,2ce <gets+0x28>
 2fc:	a011                	j	300 <gets+0x5a>
  for(i=0; i+1 < max; ){
 2fe:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 300:	99e2                	add	s3,s3,s8
 302:	00098023          	sb	zero,0(s3)
  return buf;
}
 306:	8562                	mv	a0,s8
 308:	60e6                	ld	ra,88(sp)
 30a:	6446                	ld	s0,80(sp)
 30c:	64a6                	ld	s1,72(sp)
 30e:	6906                	ld	s2,64(sp)
 310:	79e2                	ld	s3,56(sp)
 312:	7a42                	ld	s4,48(sp)
 314:	7aa2                	ld	s5,40(sp)
 316:	7b02                	ld	s6,32(sp)
 318:	6be2                	ld	s7,24(sp)
 31a:	6c42                	ld	s8,16(sp)
 31c:	6125                	addi	sp,sp,96
 31e:	8082                	ret

0000000000000320 <stat>:

int
stat(const char *n, struct stat *st)
{
 320:	1101                	addi	sp,sp,-32
 322:	ec06                	sd	ra,24(sp)
 324:	e822                	sd	s0,16(sp)
 326:	e426                	sd	s1,8(sp)
 328:	e04a                	sd	s2,0(sp)
 32a:	1000                	addi	s0,sp,32
 32c:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 32e:	4581                	li	a1,0
 330:	00000097          	auipc	ra,0x0
 334:	198080e7          	jalr	408(ra) # 4c8 <open>
  if(fd < 0)
 338:	02054563          	bltz	a0,362 <stat+0x42>
 33c:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 33e:	85ca                	mv	a1,s2
 340:	00000097          	auipc	ra,0x0
 344:	190080e7          	jalr	400(ra) # 4d0 <fstat>
 348:	892a                	mv	s2,a0
  close(fd);
 34a:	8526                	mv	a0,s1
 34c:	00000097          	auipc	ra,0x0
 350:	164080e7          	jalr	356(ra) # 4b0 <close>
  return r;
}
 354:	854a                	mv	a0,s2
 356:	60e2                	ld	ra,24(sp)
 358:	6442                	ld	s0,16(sp)
 35a:	64a2                	ld	s1,8(sp)
 35c:	6902                	ld	s2,0(sp)
 35e:	6105                	addi	sp,sp,32
 360:	8082                	ret
    return -1;
 362:	597d                	li	s2,-1
 364:	bfc5                	j	354 <stat+0x34>

0000000000000366 <atoi>:

int
atoi(const char *s)
{
 366:	1141                	addi	sp,sp,-16
 368:	e422                	sd	s0,8(sp)
 36a:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 36c:	00054703          	lbu	a4,0(a0)
 370:	02d00793          	li	a5,45
  int neg = 1;
 374:	4805                	li	a6,1
  if (*s == '-') {
 376:	04f70363          	beq	a4,a5,3bc <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 37a:	00054683          	lbu	a3,0(a0)
 37e:	fd06879b          	addiw	a5,a3,-48
 382:	0ff7f793          	andi	a5,a5,255
 386:	4725                	li	a4,9
 388:	02f76d63          	bltu	a4,a5,3c2 <atoi+0x5c>
  n = 0;
 38c:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 38e:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 390:	0505                	addi	a0,a0,1
 392:	0026179b          	slliw	a5,a2,0x2
 396:	9fb1                	addw	a5,a5,a2
 398:	0017979b          	slliw	a5,a5,0x1
 39c:	9fb5                	addw	a5,a5,a3
 39e:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 3a2:	00054683          	lbu	a3,0(a0)
 3a6:	fd06871b          	addiw	a4,a3,-48
 3aa:	0ff77713          	andi	a4,a4,255
 3ae:	fee5f1e3          	bleu	a4,a1,390 <atoi+0x2a>
  return n * neg;
}
 3b2:	02c8053b          	mulw	a0,a6,a2
 3b6:	6422                	ld	s0,8(sp)
 3b8:	0141                	addi	sp,sp,16
 3ba:	8082                	ret
    s++;
 3bc:	0505                	addi	a0,a0,1
    neg = -1;
 3be:	587d                	li	a6,-1
 3c0:	bf6d                	j	37a <atoi+0x14>
  n = 0;
 3c2:	4601                	li	a2,0
 3c4:	b7fd                	j	3b2 <atoi+0x4c>

00000000000003c6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c6:	1141                	addi	sp,sp,-16
 3c8:	e422                	sd	s0,8(sp)
 3ca:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3cc:	02b57663          	bleu	a1,a0,3f8 <memmove+0x32>
    while(n-- > 0)
 3d0:	02c05163          	blez	a2,3f2 <memmove+0x2c>
 3d4:	fff6079b          	addiw	a5,a2,-1
 3d8:	1782                	slli	a5,a5,0x20
 3da:	9381                	srli	a5,a5,0x20
 3dc:	0785                	addi	a5,a5,1
 3de:	97aa                	add	a5,a5,a0
  dst = vdst;
 3e0:	872a                	mv	a4,a0
      *dst++ = *src++;
 3e2:	0585                	addi	a1,a1,1
 3e4:	0705                	addi	a4,a4,1
 3e6:	fff5c683          	lbu	a3,-1(a1)
 3ea:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3ee:	fee79ae3          	bne	a5,a4,3e2 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3f2:	6422                	ld	s0,8(sp)
 3f4:	0141                	addi	sp,sp,16
 3f6:	8082                	ret
    dst += n;
 3f8:	00c50733          	add	a4,a0,a2
    src += n;
 3fc:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3fe:	fec05ae3          	blez	a2,3f2 <memmove+0x2c>
 402:	fff6079b          	addiw	a5,a2,-1
 406:	1782                	slli	a5,a5,0x20
 408:	9381                	srli	a5,a5,0x20
 40a:	fff7c793          	not	a5,a5
 40e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 410:	15fd                	addi	a1,a1,-1
 412:	177d                	addi	a4,a4,-1
 414:	0005c683          	lbu	a3,0(a1)
 418:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 41c:	fef71ae3          	bne	a4,a5,410 <memmove+0x4a>
 420:	bfc9                	j	3f2 <memmove+0x2c>

0000000000000422 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 422:	1141                	addi	sp,sp,-16
 424:	e422                	sd	s0,8(sp)
 426:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 428:	ce15                	beqz	a2,464 <memcmp+0x42>
 42a:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 42e:	00054783          	lbu	a5,0(a0)
 432:	0005c703          	lbu	a4,0(a1)
 436:	02e79063          	bne	a5,a4,456 <memcmp+0x34>
 43a:	1682                	slli	a3,a3,0x20
 43c:	9281                	srli	a3,a3,0x20
 43e:	0685                	addi	a3,a3,1
 440:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 442:	0505                	addi	a0,a0,1
    p2++;
 444:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 446:	00d50d63          	beq	a0,a3,460 <memcmp+0x3e>
    if (*p1 != *p2) {
 44a:	00054783          	lbu	a5,0(a0)
 44e:	0005c703          	lbu	a4,0(a1)
 452:	fee788e3          	beq	a5,a4,442 <memcmp+0x20>
      return *p1 - *p2;
 456:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 45a:	6422                	ld	s0,8(sp)
 45c:	0141                	addi	sp,sp,16
 45e:	8082                	ret
  return 0;
 460:	4501                	li	a0,0
 462:	bfe5                	j	45a <memcmp+0x38>
 464:	4501                	li	a0,0
 466:	bfd5                	j	45a <memcmp+0x38>

0000000000000468 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 468:	1141                	addi	sp,sp,-16
 46a:	e406                	sd	ra,8(sp)
 46c:	e022                	sd	s0,0(sp)
 46e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 470:	00000097          	auipc	ra,0x0
 474:	f56080e7          	jalr	-170(ra) # 3c6 <memmove>
}
 478:	60a2                	ld	ra,8(sp)
 47a:	6402                	ld	s0,0(sp)
 47c:	0141                	addi	sp,sp,16
 47e:	8082                	ret

0000000000000480 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 480:	4885                	li	a7,1
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <exit>:
.global exit
exit:
 li a7, SYS_exit
 488:	4889                	li	a7,2
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <wait>:
.global wait
wait:
 li a7, SYS_wait
 490:	488d                	li	a7,3
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 498:	4891                	li	a7,4
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <read>:
.global read
read:
 li a7, SYS_read
 4a0:	4895                	li	a7,5
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <write>:
.global write
write:
 li a7, SYS_write
 4a8:	48c1                	li	a7,16
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <close>:
.global close
close:
 li a7, SYS_close
 4b0:	48d5                	li	a7,21
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4b8:	4899                	li	a7,6
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4c0:	489d                	li	a7,7
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <open>:
.global open
open:
 li a7, SYS_open
 4c8:	48bd                	li	a7,15
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4d0:	48a1                	li	a7,8
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4d8:	48d1                	li	a7,20
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4e0:	48a5                	li	a7,9
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4e8:	48a9                	li	a7,10
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4f0:	48ad                	li	a7,11
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4f8:	48b1                	li	a7,12
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 500:	48b5                	li	a7,13
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 508:	48b9                	li	a7,14
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 510:	48d9                	li	a7,22
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <dev>:
.global dev
dev:
 li a7, SYS_dev
 518:	48dd                	li	a7,23
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 520:	48e1                	li	a7,24
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 528:	48e5                	li	a7,25
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <remove>:
.global remove
remove:
 li a7, SYS_remove
 530:	48c5                	li	a7,17
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <trace>:
.global trace
trace:
 li a7, SYS_trace
 538:	48c9                	li	a7,18
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 540:	48cd                	li	a7,19
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <rename>:
.global rename
rename:
 li a7, SYS_rename
 548:	48e9                	li	a7,26
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 550:	48ed                	li	a7,27
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 558:	1101                	addi	sp,sp,-32
 55a:	ec06                	sd	ra,24(sp)
 55c:	e822                	sd	s0,16(sp)
 55e:	1000                	addi	s0,sp,32
 560:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 564:	4605                	li	a2,1
 566:	fef40593          	addi	a1,s0,-17
 56a:	00000097          	auipc	ra,0x0
 56e:	f3e080e7          	jalr	-194(ra) # 4a8 <write>
}
 572:	60e2                	ld	ra,24(sp)
 574:	6442                	ld	s0,16(sp)
 576:	6105                	addi	sp,sp,32
 578:	8082                	ret

000000000000057a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 57a:	7139                	addi	sp,sp,-64
 57c:	fc06                	sd	ra,56(sp)
 57e:	f822                	sd	s0,48(sp)
 580:	f426                	sd	s1,40(sp)
 582:	f04a                	sd	s2,32(sp)
 584:	ec4e                	sd	s3,24(sp)
 586:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 588:	c299                	beqz	a3,58e <printint+0x14>
 58a:	0005ce63          	bltz	a1,5a6 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 58e:	2581                	sext.w	a1,a1
  neg = 0;
 590:	4301                	li	t1,0
  }

  i = 0;
 592:	fc040913          	addi	s2,s0,-64
  neg = 0;
 596:	874a                	mv	a4,s2
  i = 0;
 598:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 59a:	2601                	sext.w	a2,a2
 59c:	00000897          	auipc	a7,0x0
 5a0:	47488893          	addi	a7,a7,1140 # a10 <digits>
 5a4:	a801                	j	5b4 <printint+0x3a>
    x = -xx;
 5a6:	40b005bb          	negw	a1,a1
 5aa:	2581                	sext.w	a1,a1
    neg = 1;
 5ac:	4305                	li	t1,1
    x = -xx;
 5ae:	b7d5                	j	592 <printint+0x18>
  }while((x /= base) != 0);
 5b0:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 5b2:	8836                	mv	a6,a3
 5b4:	0018069b          	addiw	a3,a6,1
 5b8:	02c5f7bb          	remuw	a5,a1,a2
 5bc:	1782                	slli	a5,a5,0x20
 5be:	9381                	srli	a5,a5,0x20
 5c0:	97c6                	add	a5,a5,a7
 5c2:	0007c783          	lbu	a5,0(a5)
 5c6:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 5ca:	0705                	addi	a4,a4,1
 5cc:	02c5d7bb          	divuw	a5,a1,a2
 5d0:	fec5f0e3          	bleu	a2,a1,5b0 <printint+0x36>
  if(neg)
 5d4:	00030b63          	beqz	t1,5ea <printint+0x70>
    buf[i++] = '-';
 5d8:	fd040793          	addi	a5,s0,-48
 5dc:	96be                	add	a3,a3,a5
 5de:	02d00793          	li	a5,45
 5e2:	fef68823          	sb	a5,-16(a3)
 5e6:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 5ea:	02d05763          	blez	a3,618 <printint+0x9e>
 5ee:	89aa                	mv	s3,a0
 5f0:	fc040493          	addi	s1,s0,-64
 5f4:	94b6                	add	s1,s1,a3
 5f6:	197d                	addi	s2,s2,-1
 5f8:	9936                	add	s2,s2,a3
 5fa:	36fd                	addiw	a3,a3,-1
 5fc:	1682                	slli	a3,a3,0x20
 5fe:	9281                	srli	a3,a3,0x20
 600:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 604:	fff4c583          	lbu	a1,-1(s1)
 608:	854e                	mv	a0,s3
 60a:	00000097          	auipc	ra,0x0
 60e:	f4e080e7          	jalr	-178(ra) # 558 <putc>
  while(--i >= 0)
 612:	14fd                	addi	s1,s1,-1
 614:	ff2498e3          	bne	s1,s2,604 <printint+0x8a>
}
 618:	70e2                	ld	ra,56(sp)
 61a:	7442                	ld	s0,48(sp)
 61c:	74a2                	ld	s1,40(sp)
 61e:	7902                	ld	s2,32(sp)
 620:	69e2                	ld	s3,24(sp)
 622:	6121                	addi	sp,sp,64
 624:	8082                	ret

0000000000000626 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 626:	7119                	addi	sp,sp,-128
 628:	fc86                	sd	ra,120(sp)
 62a:	f8a2                	sd	s0,112(sp)
 62c:	f4a6                	sd	s1,104(sp)
 62e:	f0ca                	sd	s2,96(sp)
 630:	ecce                	sd	s3,88(sp)
 632:	e8d2                	sd	s4,80(sp)
 634:	e4d6                	sd	s5,72(sp)
 636:	e0da                	sd	s6,64(sp)
 638:	fc5e                	sd	s7,56(sp)
 63a:	f862                	sd	s8,48(sp)
 63c:	f466                	sd	s9,40(sp)
 63e:	f06a                	sd	s10,32(sp)
 640:	ec6e                	sd	s11,24(sp)
 642:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 644:	0005c483          	lbu	s1,0(a1)
 648:	18048d63          	beqz	s1,7e2 <vprintf+0x1bc>
 64c:	8aaa                	mv	s5,a0
 64e:	8b32                	mv	s6,a2
 650:	00158913          	addi	s2,a1,1
  state = 0;
 654:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 656:	02500a13          	li	s4,37
      if(c == 'd'){
 65a:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 65e:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 662:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 666:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 66a:	00000b97          	auipc	s7,0x0
 66e:	3a6b8b93          	addi	s7,s7,934 # a10 <digits>
 672:	a839                	j	690 <vprintf+0x6a>
        putc(fd, c);
 674:	85a6                	mv	a1,s1
 676:	8556                	mv	a0,s5
 678:	00000097          	auipc	ra,0x0
 67c:	ee0080e7          	jalr	-288(ra) # 558 <putc>
 680:	a019                	j	686 <vprintf+0x60>
    } else if(state == '%'){
 682:	01498f63          	beq	s3,s4,6a0 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 686:	0905                	addi	s2,s2,1
 688:	fff94483          	lbu	s1,-1(s2)
 68c:	14048b63          	beqz	s1,7e2 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 690:	0004879b          	sext.w	a5,s1
    if(state == 0){
 694:	fe0997e3          	bnez	s3,682 <vprintf+0x5c>
      if(c == '%'){
 698:	fd479ee3          	bne	a5,s4,674 <vprintf+0x4e>
        state = '%';
 69c:	89be                	mv	s3,a5
 69e:	b7e5                	j	686 <vprintf+0x60>
      if(c == 'd'){
 6a0:	05878063          	beq	a5,s8,6e0 <vprintf+0xba>
      } else if(c == 'l') {
 6a4:	05978c63          	beq	a5,s9,6fc <vprintf+0xd6>
      } else if(c == 'x') {
 6a8:	07a78863          	beq	a5,s10,718 <vprintf+0xf2>
      } else if(c == 'p') {
 6ac:	09b78463          	beq	a5,s11,734 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6b0:	07300713          	li	a4,115
 6b4:	0ce78563          	beq	a5,a4,77e <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6b8:	06300713          	li	a4,99
 6bc:	0ee78c63          	beq	a5,a4,7b4 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6c0:	11478663          	beq	a5,s4,7cc <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6c4:	85d2                	mv	a1,s4
 6c6:	8556                	mv	a0,s5
 6c8:	00000097          	auipc	ra,0x0
 6cc:	e90080e7          	jalr	-368(ra) # 558 <putc>
        putc(fd, c);
 6d0:	85a6                	mv	a1,s1
 6d2:	8556                	mv	a0,s5
 6d4:	00000097          	auipc	ra,0x0
 6d8:	e84080e7          	jalr	-380(ra) # 558 <putc>
      }
      state = 0;
 6dc:	4981                	li	s3,0
 6de:	b765                	j	686 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6e0:	008b0493          	addi	s1,s6,8
 6e4:	4685                	li	a3,1
 6e6:	4629                	li	a2,10
 6e8:	000b2583          	lw	a1,0(s6)
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	e8c080e7          	jalr	-372(ra) # 57a <printint>
 6f6:	8b26                	mv	s6,s1
      state = 0;
 6f8:	4981                	li	s3,0
 6fa:	b771                	j	686 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6fc:	008b0493          	addi	s1,s6,8
 700:	4681                	li	a3,0
 702:	4629                	li	a2,10
 704:	000b2583          	lw	a1,0(s6)
 708:	8556                	mv	a0,s5
 70a:	00000097          	auipc	ra,0x0
 70e:	e70080e7          	jalr	-400(ra) # 57a <printint>
 712:	8b26                	mv	s6,s1
      state = 0;
 714:	4981                	li	s3,0
 716:	bf85                	j	686 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 718:	008b0493          	addi	s1,s6,8
 71c:	4681                	li	a3,0
 71e:	4641                	li	a2,16
 720:	000b2583          	lw	a1,0(s6)
 724:	8556                	mv	a0,s5
 726:	00000097          	auipc	ra,0x0
 72a:	e54080e7          	jalr	-428(ra) # 57a <printint>
 72e:	8b26                	mv	s6,s1
      state = 0;
 730:	4981                	li	s3,0
 732:	bf91                	j	686 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 734:	008b0793          	addi	a5,s6,8
 738:	f8f43423          	sd	a5,-120(s0)
 73c:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 740:	03000593          	li	a1,48
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	e12080e7          	jalr	-494(ra) # 558 <putc>
  putc(fd, 'x');
 74e:	85ea                	mv	a1,s10
 750:	8556                	mv	a0,s5
 752:	00000097          	auipc	ra,0x0
 756:	e06080e7          	jalr	-506(ra) # 558 <putc>
 75a:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 75c:	03c9d793          	srli	a5,s3,0x3c
 760:	97de                	add	a5,a5,s7
 762:	0007c583          	lbu	a1,0(a5)
 766:	8556                	mv	a0,s5
 768:	00000097          	auipc	ra,0x0
 76c:	df0080e7          	jalr	-528(ra) # 558 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 770:	0992                	slli	s3,s3,0x4
 772:	34fd                	addiw	s1,s1,-1
 774:	f4e5                	bnez	s1,75c <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 776:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 77a:	4981                	li	s3,0
 77c:	b729                	j	686 <vprintf+0x60>
        s = va_arg(ap, char*);
 77e:	008b0993          	addi	s3,s6,8
 782:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 786:	c085                	beqz	s1,7a6 <vprintf+0x180>
        while(*s != 0){
 788:	0004c583          	lbu	a1,0(s1)
 78c:	c9a1                	beqz	a1,7dc <vprintf+0x1b6>
          putc(fd, *s);
 78e:	8556                	mv	a0,s5
 790:	00000097          	auipc	ra,0x0
 794:	dc8080e7          	jalr	-568(ra) # 558 <putc>
          s++;
 798:	0485                	addi	s1,s1,1
        while(*s != 0){
 79a:	0004c583          	lbu	a1,0(s1)
 79e:	f9e5                	bnez	a1,78e <vprintf+0x168>
        s = va_arg(ap, char*);
 7a0:	8b4e                	mv	s6,s3
      state = 0;
 7a2:	4981                	li	s3,0
 7a4:	b5cd                	j	686 <vprintf+0x60>
          s = "(null)";
 7a6:	00000497          	auipc	s1,0x0
 7aa:	28248493          	addi	s1,s1,642 # a28 <digits+0x18>
        while(*s != 0){
 7ae:	02800593          	li	a1,40
 7b2:	bff1                	j	78e <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 7b4:	008b0493          	addi	s1,s6,8
 7b8:	000b4583          	lbu	a1,0(s6)
 7bc:	8556                	mv	a0,s5
 7be:	00000097          	auipc	ra,0x0
 7c2:	d9a080e7          	jalr	-614(ra) # 558 <putc>
 7c6:	8b26                	mv	s6,s1
      state = 0;
 7c8:	4981                	li	s3,0
 7ca:	bd75                	j	686 <vprintf+0x60>
        putc(fd, c);
 7cc:	85d2                	mv	a1,s4
 7ce:	8556                	mv	a0,s5
 7d0:	00000097          	auipc	ra,0x0
 7d4:	d88080e7          	jalr	-632(ra) # 558 <putc>
      state = 0;
 7d8:	4981                	li	s3,0
 7da:	b575                	j	686 <vprintf+0x60>
        s = va_arg(ap, char*);
 7dc:	8b4e                	mv	s6,s3
      state = 0;
 7de:	4981                	li	s3,0
 7e0:	b55d                	j	686 <vprintf+0x60>
    }
  }
}
 7e2:	70e6                	ld	ra,120(sp)
 7e4:	7446                	ld	s0,112(sp)
 7e6:	74a6                	ld	s1,104(sp)
 7e8:	7906                	ld	s2,96(sp)
 7ea:	69e6                	ld	s3,88(sp)
 7ec:	6a46                	ld	s4,80(sp)
 7ee:	6aa6                	ld	s5,72(sp)
 7f0:	6b06                	ld	s6,64(sp)
 7f2:	7be2                	ld	s7,56(sp)
 7f4:	7c42                	ld	s8,48(sp)
 7f6:	7ca2                	ld	s9,40(sp)
 7f8:	7d02                	ld	s10,32(sp)
 7fa:	6de2                	ld	s11,24(sp)
 7fc:	6109                	addi	sp,sp,128
 7fe:	8082                	ret

0000000000000800 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 800:	715d                	addi	sp,sp,-80
 802:	ec06                	sd	ra,24(sp)
 804:	e822                	sd	s0,16(sp)
 806:	1000                	addi	s0,sp,32
 808:	e010                	sd	a2,0(s0)
 80a:	e414                	sd	a3,8(s0)
 80c:	e818                	sd	a4,16(s0)
 80e:	ec1c                	sd	a5,24(s0)
 810:	03043023          	sd	a6,32(s0)
 814:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 818:	8622                	mv	a2,s0
 81a:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 81e:	00000097          	auipc	ra,0x0
 822:	e08080e7          	jalr	-504(ra) # 626 <vprintf>
}
 826:	60e2                	ld	ra,24(sp)
 828:	6442                	ld	s0,16(sp)
 82a:	6161                	addi	sp,sp,80
 82c:	8082                	ret

000000000000082e <printf>:

void
printf(const char *fmt, ...)
{
 82e:	711d                	addi	sp,sp,-96
 830:	ec06                	sd	ra,24(sp)
 832:	e822                	sd	s0,16(sp)
 834:	1000                	addi	s0,sp,32
 836:	e40c                	sd	a1,8(s0)
 838:	e810                	sd	a2,16(s0)
 83a:	ec14                	sd	a3,24(s0)
 83c:	f018                	sd	a4,32(s0)
 83e:	f41c                	sd	a5,40(s0)
 840:	03043823          	sd	a6,48(s0)
 844:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 848:	00840613          	addi	a2,s0,8
 84c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 850:	85aa                	mv	a1,a0
 852:	4505                	li	a0,1
 854:	00000097          	auipc	ra,0x0
 858:	dd2080e7          	jalr	-558(ra) # 626 <vprintf>
}
 85c:	60e2                	ld	ra,24(sp)
 85e:	6442                	ld	s0,16(sp)
 860:	6125                	addi	sp,sp,96
 862:	8082                	ret

0000000000000864 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 864:	1141                	addi	sp,sp,-16
 866:	e422                	sd	s0,8(sp)
 868:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 86a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86e:	00000797          	auipc	a5,0x0
 872:	1c278793          	addi	a5,a5,450 # a30 <__bss_start>
 876:	639c                	ld	a5,0(a5)
 878:	a805                	j	8a8 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 87a:	4618                	lw	a4,8(a2)
 87c:	9db9                	addw	a1,a1,a4
 87e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 882:	6398                	ld	a4,0(a5)
 884:	6318                	ld	a4,0(a4)
 886:	fee53823          	sd	a4,-16(a0)
 88a:	a091                	j	8ce <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 88c:	ff852703          	lw	a4,-8(a0)
 890:	9e39                	addw	a2,a2,a4
 892:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 894:	ff053703          	ld	a4,-16(a0)
 898:	e398                	sd	a4,0(a5)
 89a:	a099                	j	8e0 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 89c:	6398                	ld	a4,0(a5)
 89e:	00e7e463          	bltu	a5,a4,8a6 <free+0x42>
 8a2:	00e6ea63          	bltu	a3,a4,8b6 <free+0x52>
{
 8a6:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a8:	fed7fae3          	bleu	a3,a5,89c <free+0x38>
 8ac:	6398                	ld	a4,0(a5)
 8ae:	00e6e463          	bltu	a3,a4,8b6 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b2:	fee7eae3          	bltu	a5,a4,8a6 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 8b6:	ff852583          	lw	a1,-8(a0)
 8ba:	6390                	ld	a2,0(a5)
 8bc:	02059713          	slli	a4,a1,0x20
 8c0:	9301                	srli	a4,a4,0x20
 8c2:	0712                	slli	a4,a4,0x4
 8c4:	9736                	add	a4,a4,a3
 8c6:	fae60ae3          	beq	a2,a4,87a <free+0x16>
    bp->s.ptr = p->s.ptr;
 8ca:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8ce:	4790                	lw	a2,8(a5)
 8d0:	02061713          	slli	a4,a2,0x20
 8d4:	9301                	srli	a4,a4,0x20
 8d6:	0712                	slli	a4,a4,0x4
 8d8:	973e                	add	a4,a4,a5
 8da:	fae689e3          	beq	a3,a4,88c <free+0x28>
  } else
    p->s.ptr = bp;
 8de:	e394                	sd	a3,0(a5)
  freep = p;
 8e0:	00000717          	auipc	a4,0x0
 8e4:	14f73823          	sd	a5,336(a4) # a30 <__bss_start>
}
 8e8:	6422                	ld	s0,8(sp)
 8ea:	0141                	addi	sp,sp,16
 8ec:	8082                	ret

00000000000008ee <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8ee:	7139                	addi	sp,sp,-64
 8f0:	fc06                	sd	ra,56(sp)
 8f2:	f822                	sd	s0,48(sp)
 8f4:	f426                	sd	s1,40(sp)
 8f6:	f04a                	sd	s2,32(sp)
 8f8:	ec4e                	sd	s3,24(sp)
 8fa:	e852                	sd	s4,16(sp)
 8fc:	e456                	sd	s5,8(sp)
 8fe:	e05a                	sd	s6,0(sp)
 900:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 902:	02051993          	slli	s3,a0,0x20
 906:	0209d993          	srli	s3,s3,0x20
 90a:	09bd                	addi	s3,s3,15
 90c:	0049d993          	srli	s3,s3,0x4
 910:	2985                	addiw	s3,s3,1
 912:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 916:	00000797          	auipc	a5,0x0
 91a:	11a78793          	addi	a5,a5,282 # a30 <__bss_start>
 91e:	6388                	ld	a0,0(a5)
 920:	c515                	beqz	a0,94c <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 922:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 924:	4798                	lw	a4,8(a5)
 926:	03277d63          	bleu	s2,a4,960 <malloc+0x72>
 92a:	8a4e                	mv	s4,s3
 92c:	0009871b          	sext.w	a4,s3
 930:	6685                	lui	a3,0x1
 932:	00d77363          	bleu	a3,a4,938 <malloc+0x4a>
 936:	6a05                	lui	s4,0x1
 938:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 93c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 940:	00000497          	auipc	s1,0x0
 944:	0f048493          	addi	s1,s1,240 # a30 <__bss_start>
  if(p == (char*)-1)
 948:	5b7d                	li	s6,-1
 94a:	a0b5                	j	9b6 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 94c:	00000717          	auipc	a4,0x0
 950:	0ec70713          	addi	a4,a4,236 # a38 <base>
 954:	e398                	sd	a4,0(a5)
 956:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 958:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95c:	87ba                	mv	a5,a4
 95e:	b7f1                	j	92a <malloc+0x3c>
      if(p->s.size == nunits)
 960:	02e90b63          	beq	s2,a4,996 <malloc+0xa8>
        p->s.size -= nunits;
 964:	4137073b          	subw	a4,a4,s3
 968:	c798                	sw	a4,8(a5)
        p += p->s.size;
 96a:	1702                	slli	a4,a4,0x20
 96c:	9301                	srli	a4,a4,0x20
 96e:	0712                	slli	a4,a4,0x4
 970:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 972:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 976:	00000717          	auipc	a4,0x0
 97a:	0aa73d23          	sd	a0,186(a4) # a30 <__bss_start>
      return (void*)(p + 1);
 97e:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 982:	70e2                	ld	ra,56(sp)
 984:	7442                	ld	s0,48(sp)
 986:	74a2                	ld	s1,40(sp)
 988:	7902                	ld	s2,32(sp)
 98a:	69e2                	ld	s3,24(sp)
 98c:	6a42                	ld	s4,16(sp)
 98e:	6aa2                	ld	s5,8(sp)
 990:	6b02                	ld	s6,0(sp)
 992:	6121                	addi	sp,sp,64
 994:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 996:	6398                	ld	a4,0(a5)
 998:	e118                	sd	a4,0(a0)
 99a:	bff1                	j	976 <malloc+0x88>
  hp->s.size = nu;
 99c:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 9a0:	0541                	addi	a0,a0,16
 9a2:	00000097          	auipc	ra,0x0
 9a6:	ec2080e7          	jalr	-318(ra) # 864 <free>
  return freep;
 9aa:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 9ac:	d979                	beqz	a0,982 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ae:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9b0:	4798                	lw	a4,8(a5)
 9b2:	fb2777e3          	bleu	s2,a4,960 <malloc+0x72>
    if(p == freep)
 9b6:	6098                	ld	a4,0(s1)
 9b8:	853e                	mv	a0,a5
 9ba:	fef71ae3          	bne	a4,a5,9ae <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9be:	8552                	mv	a0,s4
 9c0:	00000097          	auipc	ra,0x0
 9c4:	b38080e7          	jalr	-1224(ra) # 4f8 <sbrk>
  if(p == (char*)-1)
 9c8:	fd651ae3          	bne	a0,s6,99c <malloc+0xae>
        return 0;
 9cc:	4501                	li	a0,0
 9ce:	bf55                	j	982 <malloc+0x94>
