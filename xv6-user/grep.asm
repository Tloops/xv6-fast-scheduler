
xv6-user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  10:	892a                	mv	s2,a0
  12:	89ae                	mv	s3,a1
  14:	84b2                	mv	s1,a2
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  16:	02e00a13          	li	s4,46
    if(matchhere(re, text))
  1a:	85a6                	mv	a1,s1
  1c:	854e                	mv	a0,s3
  1e:	00000097          	auipc	ra,0x0
  22:	030080e7          	jalr	48(ra) # 4e <matchhere>
  26:	e919                	bnez	a0,3c <matchstar+0x3c>
  }while(*text!='\0' && (*text++==c || c=='.'));
  28:	0004c783          	lbu	a5,0(s1)
  2c:	cb89                	beqz	a5,3e <matchstar+0x3e>
  2e:	0485                	addi	s1,s1,1
  30:	2781                	sext.w	a5,a5
  32:	ff2784e3          	beq	a5,s2,1a <matchstar+0x1a>
  36:	ff4902e3          	beq	s2,s4,1a <matchstar+0x1a>
  3a:	a011                	j	3e <matchstar+0x3e>
      return 1;
  3c:	4505                	li	a0,1
  return 0;
}
  3e:	70a2                	ld	ra,40(sp)
  40:	7402                	ld	s0,32(sp)
  42:	64e2                	ld	s1,24(sp)
  44:	6942                	ld	s2,16(sp)
  46:	69a2                	ld	s3,8(sp)
  48:	6a02                	ld	s4,0(sp)
  4a:	6145                	addi	sp,sp,48
  4c:	8082                	ret

000000000000004e <matchhere>:
  if(re[0] == '\0')
  4e:	00054703          	lbu	a4,0(a0)
  52:	cb3d                	beqz	a4,c8 <matchhere+0x7a>
{
  54:	1141                	addi	sp,sp,-16
  56:	e406                	sd	ra,8(sp)
  58:	e022                	sd	s0,0(sp)
  5a:	0800                	addi	s0,sp,16
  5c:	87aa                	mv	a5,a0
  if(re[1] == '*')
  5e:	00154683          	lbu	a3,1(a0)
  62:	02a00613          	li	a2,42
  66:	02c68563          	beq	a3,a2,90 <matchhere+0x42>
  if(re[0] == '$' && re[1] == '\0')
  6a:	02400613          	li	a2,36
  6e:	02c70a63          	beq	a4,a2,a2 <matchhere+0x54>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  72:	0005c683          	lbu	a3,0(a1)
  return 0;
  76:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  78:	ca81                	beqz	a3,88 <matchhere+0x3a>
  7a:	02e00613          	li	a2,46
  7e:	02c70d63          	beq	a4,a2,b8 <matchhere+0x6a>
  return 0;
  82:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  84:	02d70a63          	beq	a4,a3,b8 <matchhere+0x6a>
}
  88:	60a2                	ld	ra,8(sp)
  8a:	6402                	ld	s0,0(sp)
  8c:	0141                	addi	sp,sp,16
  8e:	8082                	ret
    return matchstar(re[0], re+2, text);
  90:	862e                	mv	a2,a1
  92:	00250593          	addi	a1,a0,2
  96:	853a                	mv	a0,a4
  98:	00000097          	auipc	ra,0x0
  9c:	f68080e7          	jalr	-152(ra) # 0 <matchstar>
  a0:	b7e5                	j	88 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  a2:	c691                	beqz	a3,ae <matchhere+0x60>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  a4:	0005c683          	lbu	a3,0(a1)
  a8:	fee9                	bnez	a3,82 <matchhere+0x34>
  return 0;
  aa:	4501                	li	a0,0
  ac:	bff1                	j	88 <matchhere+0x3a>
    return *text == '\0';
  ae:	0005c503          	lbu	a0,0(a1)
  b2:	00153513          	seqz	a0,a0
  b6:	bfc9                	j	88 <matchhere+0x3a>
    return matchhere(re+1, text+1);
  b8:	0585                	addi	a1,a1,1
  ba:	00178513          	addi	a0,a5,1
  be:	00000097          	auipc	ra,0x0
  c2:	f90080e7          	jalr	-112(ra) # 4e <matchhere>
  c6:	b7c9                	j	88 <matchhere+0x3a>
    return 1;
  c8:	4505                	li	a0,1
}
  ca:	8082                	ret

00000000000000cc <match>:
{
  cc:	1101                	addi	sp,sp,-32
  ce:	ec06                	sd	ra,24(sp)
  d0:	e822                	sd	s0,16(sp)
  d2:	e426                	sd	s1,8(sp)
  d4:	e04a                	sd	s2,0(sp)
  d6:	1000                	addi	s0,sp,32
  d8:	892a                	mv	s2,a0
  da:	84ae                	mv	s1,a1
  if(re[0] == '^')
  dc:	00054703          	lbu	a4,0(a0)
  e0:	05e00793          	li	a5,94
  e4:	00f70e63          	beq	a4,a5,100 <match+0x34>
    if(matchhere(re, text))
  e8:	85a6                	mv	a1,s1
  ea:	854a                	mv	a0,s2
  ec:	00000097          	auipc	ra,0x0
  f0:	f62080e7          	jalr	-158(ra) # 4e <matchhere>
  f4:	ed01                	bnez	a0,10c <match+0x40>
  }while(*text++ != '\0');
  f6:	0485                	addi	s1,s1,1
  f8:	fff4c783          	lbu	a5,-1(s1)
  fc:	f7f5                	bnez	a5,e8 <match+0x1c>
  fe:	a801                	j	10e <match+0x42>
    return matchhere(re+1, text);
 100:	0505                	addi	a0,a0,1
 102:	00000097          	auipc	ra,0x0
 106:	f4c080e7          	jalr	-180(ra) # 4e <matchhere>
 10a:	a011                	j	10e <match+0x42>
      return 1;
 10c:	4505                	li	a0,1
}
 10e:	60e2                	ld	ra,24(sp)
 110:	6442                	ld	s0,16(sp)
 112:	64a2                	ld	s1,8(sp)
 114:	6902                	ld	s2,0(sp)
 116:	6105                	addi	sp,sp,32
 118:	8082                	ret

000000000000011a <grep>:
{
 11a:	711d                	addi	sp,sp,-96
 11c:	ec86                	sd	ra,88(sp)
 11e:	e8a2                	sd	s0,80(sp)
 120:	e4a6                	sd	s1,72(sp)
 122:	e0ca                	sd	s2,64(sp)
 124:	fc4e                	sd	s3,56(sp)
 126:	f852                	sd	s4,48(sp)
 128:	f456                	sd	s5,40(sp)
 12a:	f05a                	sd	s6,32(sp)
 12c:	ec5e                	sd	s7,24(sp)
 12e:	e862                	sd	s8,16(sp)
 130:	e466                	sd	s9,8(sp)
 132:	e06a                	sd	s10,0(sp)
 134:	1080                	addi	s0,sp,96
 136:	89aa                	mv	s3,a0
 138:	8c2e                	mv	s8,a1
  m = 0;
 13a:	4a01                	li	s4,0
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 13c:	3ff00b93          	li	s7,1023
 140:	00001b17          	auipc	s6,0x1
 144:	9e8b0b13          	addi	s6,s6,-1560 # b28 <buf>
    p = buf;
 148:	8d5a                	mv	s10,s6
        *q = '\n';
 14a:	4aa9                	li	s5,10
    p = buf;
 14c:	8cda                	mv	s9,s6
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 14e:	a099                	j	194 <grep+0x7a>
        *q = '\n';
 150:	01548023          	sb	s5,0(s1)
        write(1, p, q+1 - p);
 154:	00148613          	addi	a2,s1,1
 158:	4126063b          	subw	a2,a2,s2
 15c:	85ca                	mv	a1,s2
 15e:	4505                	li	a0,1
 160:	00000097          	auipc	ra,0x0
 164:	444080e7          	jalr	1092(ra) # 5a4 <write>
      p = q+1;
 168:	00148913          	addi	s2,s1,1
    while((q = strchr(p, '\n')) != 0){
 16c:	45a9                	li	a1,10
 16e:	854a                	mv	a0,s2
 170:	00000097          	auipc	ra,0x0
 174:	208080e7          	jalr	520(ra) # 378 <strchr>
 178:	84aa                	mv	s1,a0
 17a:	c919                	beqz	a0,190 <grep+0x76>
      *q = 0;
 17c:	00048023          	sb	zero,0(s1)
      if(match(pattern, p)){
 180:	85ca                	mv	a1,s2
 182:	854e                	mv	a0,s3
 184:	00000097          	auipc	ra,0x0
 188:	f48080e7          	jalr	-184(ra) # cc <match>
 18c:	dd71                	beqz	a0,168 <grep+0x4e>
 18e:	b7c9                	j	150 <grep+0x36>
    if(m > 0){
 190:	03404563          	bgtz	s4,1ba <grep+0xa0>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 194:	414b863b          	subw	a2,s7,s4
 198:	014b05b3          	add	a1,s6,s4
 19c:	8562                	mv	a0,s8
 19e:	00000097          	auipc	ra,0x0
 1a2:	3fe080e7          	jalr	1022(ra) # 59c <read>
 1a6:	02a05663          	blez	a0,1d2 <grep+0xb8>
    m += n;
 1aa:	00aa0a3b          	addw	s4,s4,a0
    buf[m] = '\0';
 1ae:	014b07b3          	add	a5,s6,s4
 1b2:	00078023          	sb	zero,0(a5)
    p = buf;
 1b6:	8966                	mv	s2,s9
    while((q = strchr(p, '\n')) != 0){
 1b8:	bf55                	j	16c <grep+0x52>
      m -= p - buf;
 1ba:	416907b3          	sub	a5,s2,s6
 1be:	40fa0a3b          	subw	s4,s4,a5
      memmove(buf, p, m);
 1c2:	8652                	mv	a2,s4
 1c4:	85ca                	mv	a1,s2
 1c6:	856a                	mv	a0,s10
 1c8:	00000097          	auipc	ra,0x0
 1cc:	2fa080e7          	jalr	762(ra) # 4c2 <memmove>
 1d0:	b7d1                	j	194 <grep+0x7a>
}
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
 1e6:	6ca2                	ld	s9,8(sp)
 1e8:	6d02                	ld	s10,0(sp)
 1ea:	6125                	addi	sp,sp,96
 1ec:	8082                	ret

00000000000001ee <main>:
{
 1ee:	7139                	addi	sp,sp,-64
 1f0:	fc06                	sd	ra,56(sp)
 1f2:	f822                	sd	s0,48(sp)
 1f4:	f426                	sd	s1,40(sp)
 1f6:	f04a                	sd	s2,32(sp)
 1f8:	ec4e                	sd	s3,24(sp)
 1fa:	e852                	sd	s4,16(sp)
 1fc:	e456                	sd	s5,8(sp)
 1fe:	0080                	addi	s0,sp,64
  if(argc <= 1){
 200:	4785                	li	a5,1
 202:	04a7dd63          	ble	a0,a5,25c <main+0x6e>
  pattern = argv[1];
 206:	0085ba03          	ld	s4,8(a1)
  if(argc <= 2){
 20a:	4789                	li	a5,2
 20c:	06a7d663          	ble	a0,a5,278 <main+0x8a>
 210:	01058493          	addi	s1,a1,16
 214:	ffd5099b          	addiw	s3,a0,-3
 218:	1982                	slli	s3,s3,0x20
 21a:	0209d993          	srli	s3,s3,0x20
 21e:	098e                	slli	s3,s3,0x3
 220:	05e1                	addi	a1,a1,24
 222:	99ae                	add	s3,s3,a1
    if((fd = open(argv[i], 0)) < 0){
 224:	4581                	li	a1,0
 226:	6088                	ld	a0,0(s1)
 228:	00000097          	auipc	ra,0x0
 22c:	39c080e7          	jalr	924(ra) # 5c4 <open>
 230:	892a                	mv	s2,a0
 232:	04054e63          	bltz	a0,28e <main+0xa0>
    grep(pattern, fd);
 236:	85aa                	mv	a1,a0
 238:	8552                	mv	a0,s4
 23a:	00000097          	auipc	ra,0x0
 23e:	ee0080e7          	jalr	-288(ra) # 11a <grep>
    close(fd);
 242:	854a                	mv	a0,s2
 244:	00000097          	auipc	ra,0x0
 248:	368080e7          	jalr	872(ra) # 5ac <close>
  for(i = 2; i < argc; i++){
 24c:	04a1                	addi	s1,s1,8
 24e:	fd349be3          	bne	s1,s3,224 <main+0x36>
  exit(0);
 252:	4501                	li	a0,0
 254:	00000097          	auipc	ra,0x0
 258:	330080e7          	jalr	816(ra) # 584 <exit>
    fprintf(2, "usage: grep pattern [file ...]\n");
 25c:	00001597          	auipc	a1,0x1
 260:	87458593          	addi	a1,a1,-1932 # ad0 <malloc+0xe6>
 264:	4509                	li	a0,2
 266:	00000097          	auipc	ra,0x0
 26a:	696080e7          	jalr	1686(ra) # 8fc <fprintf>
    exit(1);
 26e:	4505                	li	a0,1
 270:	00000097          	auipc	ra,0x0
 274:	314080e7          	jalr	788(ra) # 584 <exit>
    grep(pattern, 0);
 278:	4581                	li	a1,0
 27a:	8552                	mv	a0,s4
 27c:	00000097          	auipc	ra,0x0
 280:	e9e080e7          	jalr	-354(ra) # 11a <grep>
    exit(0);
 284:	4501                	li	a0,0
 286:	00000097          	auipc	ra,0x0
 28a:	2fe080e7          	jalr	766(ra) # 584 <exit>
      printf("grep: cannot open %s\n", argv[i]);
 28e:	608c                	ld	a1,0(s1)
 290:	00001517          	auipc	a0,0x1
 294:	86050513          	addi	a0,a0,-1952 # af0 <malloc+0x106>
 298:	00000097          	auipc	ra,0x0
 29c:	692080e7          	jalr	1682(ra) # 92a <printf>
      exit(1);
 2a0:	4505                	li	a0,1
 2a2:	00000097          	auipc	ra,0x0
 2a6:	2e2080e7          	jalr	738(ra) # 584 <exit>

00000000000002aa <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 2aa:	1141                	addi	sp,sp,-16
 2ac:	e422                	sd	s0,8(sp)
 2ae:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b0:	87aa                	mv	a5,a0
 2b2:	0585                	addi	a1,a1,1
 2b4:	0785                	addi	a5,a5,1
 2b6:	fff5c703          	lbu	a4,-1(a1)
 2ba:	fee78fa3          	sb	a4,-1(a5)
 2be:	fb75                	bnez	a4,2b2 <strcpy+0x8>
    ;
  return os;
}
 2c0:	6422                	ld	s0,8(sp)
 2c2:	0141                	addi	sp,sp,16
 2c4:	8082                	ret

00000000000002c6 <strcat>:

char*
strcat(char *s, const char *t)
{
 2c6:	1141                	addi	sp,sp,-16
 2c8:	e422                	sd	s0,8(sp)
 2ca:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 2cc:	00054783          	lbu	a5,0(a0)
 2d0:	c385                	beqz	a5,2f0 <strcat+0x2a>
 2d2:	87aa                	mv	a5,a0
    s++;
 2d4:	0785                	addi	a5,a5,1
  while(*s)
 2d6:	0007c703          	lbu	a4,0(a5)
 2da:	ff6d                	bnez	a4,2d4 <strcat+0xe>
  while((*s++ = *t++))
 2dc:	0585                	addi	a1,a1,1
 2de:	0785                	addi	a5,a5,1
 2e0:	fff5c703          	lbu	a4,-1(a1)
 2e4:	fee78fa3          	sb	a4,-1(a5)
 2e8:	fb75                	bnez	a4,2dc <strcat+0x16>
    ;
  return os;
}
 2ea:	6422                	ld	s0,8(sp)
 2ec:	0141                	addi	sp,sp,16
 2ee:	8082                	ret
  while(*s)
 2f0:	87aa                	mv	a5,a0
 2f2:	b7ed                	j	2dc <strcat+0x16>

00000000000002f4 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 2f4:	1141                	addi	sp,sp,-16
 2f6:	e422                	sd	s0,8(sp)
 2f8:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 2fa:	00054783          	lbu	a5,0(a0)
 2fe:	cf91                	beqz	a5,31a <strcmp+0x26>
 300:	0005c703          	lbu	a4,0(a1)
 304:	00f71b63          	bne	a4,a5,31a <strcmp+0x26>
    p++, q++;
 308:	0505                	addi	a0,a0,1
 30a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 30c:	00054783          	lbu	a5,0(a0)
 310:	c789                	beqz	a5,31a <strcmp+0x26>
 312:	0005c703          	lbu	a4,0(a1)
 316:	fef709e3          	beq	a4,a5,308 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 31a:	0005c503          	lbu	a0,0(a1)
}
 31e:	40a7853b          	subw	a0,a5,a0
 322:	6422                	ld	s0,8(sp)
 324:	0141                	addi	sp,sp,16
 326:	8082                	ret

0000000000000328 <strlen>:

uint
strlen(const char *s)
{
 328:	1141                	addi	sp,sp,-16
 32a:	e422                	sd	s0,8(sp)
 32c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 32e:	00054783          	lbu	a5,0(a0)
 332:	cf91                	beqz	a5,34e <strlen+0x26>
 334:	0505                	addi	a0,a0,1
 336:	87aa                	mv	a5,a0
 338:	4685                	li	a3,1
 33a:	9e89                	subw	a3,a3,a0
 33c:	00f6853b          	addw	a0,a3,a5
 340:	0785                	addi	a5,a5,1
 342:	fff7c703          	lbu	a4,-1(a5)
 346:	fb7d                	bnez	a4,33c <strlen+0x14>
    ;
  return n;
}
 348:	6422                	ld	s0,8(sp)
 34a:	0141                	addi	sp,sp,16
 34c:	8082                	ret
  for(n = 0; s[n]; n++)
 34e:	4501                	li	a0,0
 350:	bfe5                	j	348 <strlen+0x20>

0000000000000352 <memset>:

void*
memset(void *dst, int c, uint n)
{
 352:	1141                	addi	sp,sp,-16
 354:	e422                	sd	s0,8(sp)
 356:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 358:	ce09                	beqz	a2,372 <memset+0x20>
 35a:	87aa                	mv	a5,a0
 35c:	fff6071b          	addiw	a4,a2,-1
 360:	1702                	slli	a4,a4,0x20
 362:	9301                	srli	a4,a4,0x20
 364:	0705                	addi	a4,a4,1
 366:	972a                	add	a4,a4,a0
    cdst[i] = c;
 368:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 36c:	0785                	addi	a5,a5,1
 36e:	fee79de3          	bne	a5,a4,368 <memset+0x16>
  }
  return dst;
}
 372:	6422                	ld	s0,8(sp)
 374:	0141                	addi	sp,sp,16
 376:	8082                	ret

0000000000000378 <strchr>:

char*
strchr(const char *s, char c)
{
 378:	1141                	addi	sp,sp,-16
 37a:	e422                	sd	s0,8(sp)
 37c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 37e:	00054783          	lbu	a5,0(a0)
 382:	cf91                	beqz	a5,39e <strchr+0x26>
    if(*s == c)
 384:	00f58a63          	beq	a1,a5,398 <strchr+0x20>
  for(; *s; s++)
 388:	0505                	addi	a0,a0,1
 38a:	00054783          	lbu	a5,0(a0)
 38e:	c781                	beqz	a5,396 <strchr+0x1e>
    if(*s == c)
 390:	feb79ce3          	bne	a5,a1,388 <strchr+0x10>
 394:	a011                	j	398 <strchr+0x20>
      return (char*)s;
  return 0;
 396:	4501                	li	a0,0
}
 398:	6422                	ld	s0,8(sp)
 39a:	0141                	addi	sp,sp,16
 39c:	8082                	ret
  return 0;
 39e:	4501                	li	a0,0
 3a0:	bfe5                	j	398 <strchr+0x20>

00000000000003a2 <gets>:

char*
gets(char *buf, int max)
{
 3a2:	711d                	addi	sp,sp,-96
 3a4:	ec86                	sd	ra,88(sp)
 3a6:	e8a2                	sd	s0,80(sp)
 3a8:	e4a6                	sd	s1,72(sp)
 3aa:	e0ca                	sd	s2,64(sp)
 3ac:	fc4e                	sd	s3,56(sp)
 3ae:	f852                	sd	s4,48(sp)
 3b0:	f456                	sd	s5,40(sp)
 3b2:	f05a                	sd	s6,32(sp)
 3b4:	ec5e                	sd	s7,24(sp)
 3b6:	e862                	sd	s8,16(sp)
 3b8:	1080                	addi	s0,sp,96
 3ba:	8c2a                	mv	s8,a0
 3bc:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3be:	892a                	mv	s2,a0
 3c0:	4981                	li	s3,0
    cc = read(0, &c, 1);
 3c2:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3c6:	4b29                	li	s6,10
 3c8:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 3ca:	0019849b          	addiw	s1,s3,1
 3ce:	0344d763          	ble	s4,s1,3fc <gets+0x5a>
    cc = read(0, &c, 1);
 3d2:	4605                	li	a2,1
 3d4:	85d6                	mv	a1,s5
 3d6:	4501                	li	a0,0
 3d8:	00000097          	auipc	ra,0x0
 3dc:	1c4080e7          	jalr	452(ra) # 59c <read>
    if(cc < 1)
 3e0:	00a05e63          	blez	a0,3fc <gets+0x5a>
    buf[i++] = c;
 3e4:	faf44783          	lbu	a5,-81(s0)
 3e8:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 3ec:	01678763          	beq	a5,s6,3fa <gets+0x58>
 3f0:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 3f2:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 3f4:	fd779be3          	bne	a5,s7,3ca <gets+0x28>
 3f8:	a011                	j	3fc <gets+0x5a>
  for(i=0; i+1 < max; ){
 3fa:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 3fc:	99e2                	add	s3,s3,s8
 3fe:	00098023          	sb	zero,0(s3)
  return buf;
}
 402:	8562                	mv	a0,s8
 404:	60e6                	ld	ra,88(sp)
 406:	6446                	ld	s0,80(sp)
 408:	64a6                	ld	s1,72(sp)
 40a:	6906                	ld	s2,64(sp)
 40c:	79e2                	ld	s3,56(sp)
 40e:	7a42                	ld	s4,48(sp)
 410:	7aa2                	ld	s5,40(sp)
 412:	7b02                	ld	s6,32(sp)
 414:	6be2                	ld	s7,24(sp)
 416:	6c42                	ld	s8,16(sp)
 418:	6125                	addi	sp,sp,96
 41a:	8082                	ret

000000000000041c <stat>:

int
stat(const char *n, struct stat *st)
{
 41c:	1101                	addi	sp,sp,-32
 41e:	ec06                	sd	ra,24(sp)
 420:	e822                	sd	s0,16(sp)
 422:	e426                	sd	s1,8(sp)
 424:	e04a                	sd	s2,0(sp)
 426:	1000                	addi	s0,sp,32
 428:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 42a:	4581                	li	a1,0
 42c:	00000097          	auipc	ra,0x0
 430:	198080e7          	jalr	408(ra) # 5c4 <open>
  if(fd < 0)
 434:	02054563          	bltz	a0,45e <stat+0x42>
 438:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 43a:	85ca                	mv	a1,s2
 43c:	00000097          	auipc	ra,0x0
 440:	190080e7          	jalr	400(ra) # 5cc <fstat>
 444:	892a                	mv	s2,a0
  close(fd);
 446:	8526                	mv	a0,s1
 448:	00000097          	auipc	ra,0x0
 44c:	164080e7          	jalr	356(ra) # 5ac <close>
  return r;
}
 450:	854a                	mv	a0,s2
 452:	60e2                	ld	ra,24(sp)
 454:	6442                	ld	s0,16(sp)
 456:	64a2                	ld	s1,8(sp)
 458:	6902                	ld	s2,0(sp)
 45a:	6105                	addi	sp,sp,32
 45c:	8082                	ret
    return -1;
 45e:	597d                	li	s2,-1
 460:	bfc5                	j	450 <stat+0x34>

0000000000000462 <atoi>:

int
atoi(const char *s)
{
 462:	1141                	addi	sp,sp,-16
 464:	e422                	sd	s0,8(sp)
 466:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 468:	00054703          	lbu	a4,0(a0)
 46c:	02d00793          	li	a5,45
  int neg = 1;
 470:	4805                	li	a6,1
  if (*s == '-') {
 472:	04f70363          	beq	a4,a5,4b8 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 476:	00054683          	lbu	a3,0(a0)
 47a:	fd06879b          	addiw	a5,a3,-48
 47e:	0ff7f793          	andi	a5,a5,255
 482:	4725                	li	a4,9
 484:	02f76d63          	bltu	a4,a5,4be <atoi+0x5c>
  n = 0;
 488:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 48a:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 48c:	0505                	addi	a0,a0,1
 48e:	0026179b          	slliw	a5,a2,0x2
 492:	9fb1                	addw	a5,a5,a2
 494:	0017979b          	slliw	a5,a5,0x1
 498:	9fb5                	addw	a5,a5,a3
 49a:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 49e:	00054683          	lbu	a3,0(a0)
 4a2:	fd06871b          	addiw	a4,a3,-48
 4a6:	0ff77713          	andi	a4,a4,255
 4aa:	fee5f1e3          	bleu	a4,a1,48c <atoi+0x2a>
  return n * neg;
}
 4ae:	02c8053b          	mulw	a0,a6,a2
 4b2:	6422                	ld	s0,8(sp)
 4b4:	0141                	addi	sp,sp,16
 4b6:	8082                	ret
    s++;
 4b8:	0505                	addi	a0,a0,1
    neg = -1;
 4ba:	587d                	li	a6,-1
 4bc:	bf6d                	j	476 <atoi+0x14>
  n = 0;
 4be:	4601                	li	a2,0
 4c0:	b7fd                	j	4ae <atoi+0x4c>

00000000000004c2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4c2:	1141                	addi	sp,sp,-16
 4c4:	e422                	sd	s0,8(sp)
 4c6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 4c8:	02b57663          	bleu	a1,a0,4f4 <memmove+0x32>
    while(n-- > 0)
 4cc:	02c05163          	blez	a2,4ee <memmove+0x2c>
 4d0:	fff6079b          	addiw	a5,a2,-1
 4d4:	1782                	slli	a5,a5,0x20
 4d6:	9381                	srli	a5,a5,0x20
 4d8:	0785                	addi	a5,a5,1
 4da:	97aa                	add	a5,a5,a0
  dst = vdst;
 4dc:	872a                	mv	a4,a0
      *dst++ = *src++;
 4de:	0585                	addi	a1,a1,1
 4e0:	0705                	addi	a4,a4,1
 4e2:	fff5c683          	lbu	a3,-1(a1)
 4e6:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 4ea:	fee79ae3          	bne	a5,a4,4de <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 4ee:	6422                	ld	s0,8(sp)
 4f0:	0141                	addi	sp,sp,16
 4f2:	8082                	ret
    dst += n;
 4f4:	00c50733          	add	a4,a0,a2
    src += n;
 4f8:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 4fa:	fec05ae3          	blez	a2,4ee <memmove+0x2c>
 4fe:	fff6079b          	addiw	a5,a2,-1
 502:	1782                	slli	a5,a5,0x20
 504:	9381                	srli	a5,a5,0x20
 506:	fff7c793          	not	a5,a5
 50a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 50c:	15fd                	addi	a1,a1,-1
 50e:	177d                	addi	a4,a4,-1
 510:	0005c683          	lbu	a3,0(a1)
 514:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 518:	fef71ae3          	bne	a4,a5,50c <memmove+0x4a>
 51c:	bfc9                	j	4ee <memmove+0x2c>

000000000000051e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 51e:	1141                	addi	sp,sp,-16
 520:	e422                	sd	s0,8(sp)
 522:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 524:	ce15                	beqz	a2,560 <memcmp+0x42>
 526:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 52a:	00054783          	lbu	a5,0(a0)
 52e:	0005c703          	lbu	a4,0(a1)
 532:	02e79063          	bne	a5,a4,552 <memcmp+0x34>
 536:	1682                	slli	a3,a3,0x20
 538:	9281                	srli	a3,a3,0x20
 53a:	0685                	addi	a3,a3,1
 53c:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 53e:	0505                	addi	a0,a0,1
    p2++;
 540:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 542:	00d50d63          	beq	a0,a3,55c <memcmp+0x3e>
    if (*p1 != *p2) {
 546:	00054783          	lbu	a5,0(a0)
 54a:	0005c703          	lbu	a4,0(a1)
 54e:	fee788e3          	beq	a5,a4,53e <memcmp+0x20>
      return *p1 - *p2;
 552:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 556:	6422                	ld	s0,8(sp)
 558:	0141                	addi	sp,sp,16
 55a:	8082                	ret
  return 0;
 55c:	4501                	li	a0,0
 55e:	bfe5                	j	556 <memcmp+0x38>
 560:	4501                	li	a0,0
 562:	bfd5                	j	556 <memcmp+0x38>

0000000000000564 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 564:	1141                	addi	sp,sp,-16
 566:	e406                	sd	ra,8(sp)
 568:	e022                	sd	s0,0(sp)
 56a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 56c:	00000097          	auipc	ra,0x0
 570:	f56080e7          	jalr	-170(ra) # 4c2 <memmove>
}
 574:	60a2                	ld	ra,8(sp)
 576:	6402                	ld	s0,0(sp)
 578:	0141                	addi	sp,sp,16
 57a:	8082                	ret

000000000000057c <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 57c:	4885                	li	a7,1
 ecall
 57e:	00000073          	ecall
 ret
 582:	8082                	ret

0000000000000584 <exit>:
.global exit
exit:
 li a7, SYS_exit
 584:	4889                	li	a7,2
 ecall
 586:	00000073          	ecall
 ret
 58a:	8082                	ret

000000000000058c <wait>:
.global wait
wait:
 li a7, SYS_wait
 58c:	488d                	li	a7,3
 ecall
 58e:	00000073          	ecall
 ret
 592:	8082                	ret

0000000000000594 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 594:	4891                	li	a7,4
 ecall
 596:	00000073          	ecall
 ret
 59a:	8082                	ret

000000000000059c <read>:
.global read
read:
 li a7, SYS_read
 59c:	4895                	li	a7,5
 ecall
 59e:	00000073          	ecall
 ret
 5a2:	8082                	ret

00000000000005a4 <write>:
.global write
write:
 li a7, SYS_write
 5a4:	48c1                	li	a7,16
 ecall
 5a6:	00000073          	ecall
 ret
 5aa:	8082                	ret

00000000000005ac <close>:
.global close
close:
 li a7, SYS_close
 5ac:	48d5                	li	a7,21
 ecall
 5ae:	00000073          	ecall
 ret
 5b2:	8082                	ret

00000000000005b4 <kill>:
.global kill
kill:
 li a7, SYS_kill
 5b4:	4899                	li	a7,6
 ecall
 5b6:	00000073          	ecall
 ret
 5ba:	8082                	ret

00000000000005bc <exec>:
.global exec
exec:
 li a7, SYS_exec
 5bc:	489d                	li	a7,7
 ecall
 5be:	00000073          	ecall
 ret
 5c2:	8082                	ret

00000000000005c4 <open>:
.global open
open:
 li a7, SYS_open
 5c4:	48bd                	li	a7,15
 ecall
 5c6:	00000073          	ecall
 ret
 5ca:	8082                	ret

00000000000005cc <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 5cc:	48a1                	li	a7,8
 ecall
 5ce:	00000073          	ecall
 ret
 5d2:	8082                	ret

00000000000005d4 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 5d4:	48d1                	li	a7,20
 ecall
 5d6:	00000073          	ecall
 ret
 5da:	8082                	ret

00000000000005dc <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5dc:	48a5                	li	a7,9
 ecall
 5de:	00000073          	ecall
 ret
 5e2:	8082                	ret

00000000000005e4 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5e4:	48a9                	li	a7,10
 ecall
 5e6:	00000073          	ecall
 ret
 5ea:	8082                	ret

00000000000005ec <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5ec:	48ad                	li	a7,11
 ecall
 5ee:	00000073          	ecall
 ret
 5f2:	8082                	ret

00000000000005f4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5f4:	48b1                	li	a7,12
 ecall
 5f6:	00000073          	ecall
 ret
 5fa:	8082                	ret

00000000000005fc <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5fc:	48b5                	li	a7,13
 ecall
 5fe:	00000073          	ecall
 ret
 602:	8082                	ret

0000000000000604 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 604:	48b9                	li	a7,14
 ecall
 606:	00000073          	ecall
 ret
 60a:	8082                	ret

000000000000060c <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 60c:	48d9                	li	a7,22
 ecall
 60e:	00000073          	ecall
 ret
 612:	8082                	ret

0000000000000614 <dev>:
.global dev
dev:
 li a7, SYS_dev
 614:	48dd                	li	a7,23
 ecall
 616:	00000073          	ecall
 ret
 61a:	8082                	ret

000000000000061c <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 61c:	48e1                	li	a7,24
 ecall
 61e:	00000073          	ecall
 ret
 622:	8082                	ret

0000000000000624 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 624:	48e5                	li	a7,25
 ecall
 626:	00000073          	ecall
 ret
 62a:	8082                	ret

000000000000062c <remove>:
.global remove
remove:
 li a7, SYS_remove
 62c:	48c5                	li	a7,17
 ecall
 62e:	00000073          	ecall
 ret
 632:	8082                	ret

0000000000000634 <trace>:
.global trace
trace:
 li a7, SYS_trace
 634:	48c9                	li	a7,18
 ecall
 636:	00000073          	ecall
 ret
 63a:	8082                	ret

000000000000063c <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 63c:	48cd                	li	a7,19
 ecall
 63e:	00000073          	ecall
 ret
 642:	8082                	ret

0000000000000644 <rename>:
.global rename
rename:
 li a7, SYS_rename
 644:	48e9                	li	a7,26
 ecall
 646:	00000073          	ecall
 ret
 64a:	8082                	ret

000000000000064c <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 64c:	48ed                	li	a7,27
 ecall
 64e:	00000073          	ecall
 ret
 652:	8082                	ret

0000000000000654 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 654:	1101                	addi	sp,sp,-32
 656:	ec06                	sd	ra,24(sp)
 658:	e822                	sd	s0,16(sp)
 65a:	1000                	addi	s0,sp,32
 65c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 660:	4605                	li	a2,1
 662:	fef40593          	addi	a1,s0,-17
 666:	00000097          	auipc	ra,0x0
 66a:	f3e080e7          	jalr	-194(ra) # 5a4 <write>
}
 66e:	60e2                	ld	ra,24(sp)
 670:	6442                	ld	s0,16(sp)
 672:	6105                	addi	sp,sp,32
 674:	8082                	ret

0000000000000676 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 676:	7139                	addi	sp,sp,-64
 678:	fc06                	sd	ra,56(sp)
 67a:	f822                	sd	s0,48(sp)
 67c:	f426                	sd	s1,40(sp)
 67e:	f04a                	sd	s2,32(sp)
 680:	ec4e                	sd	s3,24(sp)
 682:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 684:	c299                	beqz	a3,68a <printint+0x14>
 686:	0005ce63          	bltz	a1,6a2 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 68a:	2581                	sext.w	a1,a1
  neg = 0;
 68c:	4301                	li	t1,0
  }

  i = 0;
 68e:	fc040913          	addi	s2,s0,-64
  neg = 0;
 692:	874a                	mv	a4,s2
  i = 0;
 694:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 696:	2601                	sext.w	a2,a2
 698:	00000897          	auipc	a7,0x0
 69c:	47088893          	addi	a7,a7,1136 # b08 <digits>
 6a0:	a801                	j	6b0 <printint+0x3a>
    x = -xx;
 6a2:	40b005bb          	negw	a1,a1
 6a6:	2581                	sext.w	a1,a1
    neg = 1;
 6a8:	4305                	li	t1,1
    x = -xx;
 6aa:	b7d5                	j	68e <printint+0x18>
  }while((x /= base) != 0);
 6ac:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 6ae:	8836                	mv	a6,a3
 6b0:	0018069b          	addiw	a3,a6,1
 6b4:	02c5f7bb          	remuw	a5,a1,a2
 6b8:	1782                	slli	a5,a5,0x20
 6ba:	9381                	srli	a5,a5,0x20
 6bc:	97c6                	add	a5,a5,a7
 6be:	0007c783          	lbu	a5,0(a5)
 6c2:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 6c6:	0705                	addi	a4,a4,1
 6c8:	02c5d7bb          	divuw	a5,a1,a2
 6cc:	fec5f0e3          	bleu	a2,a1,6ac <printint+0x36>
  if(neg)
 6d0:	00030b63          	beqz	t1,6e6 <printint+0x70>
    buf[i++] = '-';
 6d4:	fd040793          	addi	a5,s0,-48
 6d8:	96be                	add	a3,a3,a5
 6da:	02d00793          	li	a5,45
 6de:	fef68823          	sb	a5,-16(a3)
 6e2:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 6e6:	02d05763          	blez	a3,714 <printint+0x9e>
 6ea:	89aa                	mv	s3,a0
 6ec:	fc040493          	addi	s1,s0,-64
 6f0:	94b6                	add	s1,s1,a3
 6f2:	197d                	addi	s2,s2,-1
 6f4:	9936                	add	s2,s2,a3
 6f6:	36fd                	addiw	a3,a3,-1
 6f8:	1682                	slli	a3,a3,0x20
 6fa:	9281                	srli	a3,a3,0x20
 6fc:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 700:	fff4c583          	lbu	a1,-1(s1)
 704:	854e                	mv	a0,s3
 706:	00000097          	auipc	ra,0x0
 70a:	f4e080e7          	jalr	-178(ra) # 654 <putc>
  while(--i >= 0)
 70e:	14fd                	addi	s1,s1,-1
 710:	ff2498e3          	bne	s1,s2,700 <printint+0x8a>
}
 714:	70e2                	ld	ra,56(sp)
 716:	7442                	ld	s0,48(sp)
 718:	74a2                	ld	s1,40(sp)
 71a:	7902                	ld	s2,32(sp)
 71c:	69e2                	ld	s3,24(sp)
 71e:	6121                	addi	sp,sp,64
 720:	8082                	ret

0000000000000722 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 722:	7119                	addi	sp,sp,-128
 724:	fc86                	sd	ra,120(sp)
 726:	f8a2                	sd	s0,112(sp)
 728:	f4a6                	sd	s1,104(sp)
 72a:	f0ca                	sd	s2,96(sp)
 72c:	ecce                	sd	s3,88(sp)
 72e:	e8d2                	sd	s4,80(sp)
 730:	e4d6                	sd	s5,72(sp)
 732:	e0da                	sd	s6,64(sp)
 734:	fc5e                	sd	s7,56(sp)
 736:	f862                	sd	s8,48(sp)
 738:	f466                	sd	s9,40(sp)
 73a:	f06a                	sd	s10,32(sp)
 73c:	ec6e                	sd	s11,24(sp)
 73e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 740:	0005c483          	lbu	s1,0(a1)
 744:	18048d63          	beqz	s1,8de <vprintf+0x1bc>
 748:	8aaa                	mv	s5,a0
 74a:	8b32                	mv	s6,a2
 74c:	00158913          	addi	s2,a1,1
  state = 0;
 750:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 752:	02500a13          	li	s4,37
      if(c == 'd'){
 756:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 75a:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 75e:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 762:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 766:	00000b97          	auipc	s7,0x0
 76a:	3a2b8b93          	addi	s7,s7,930 # b08 <digits>
 76e:	a839                	j	78c <vprintf+0x6a>
        putc(fd, c);
 770:	85a6                	mv	a1,s1
 772:	8556                	mv	a0,s5
 774:	00000097          	auipc	ra,0x0
 778:	ee0080e7          	jalr	-288(ra) # 654 <putc>
 77c:	a019                	j	782 <vprintf+0x60>
    } else if(state == '%'){
 77e:	01498f63          	beq	s3,s4,79c <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 782:	0905                	addi	s2,s2,1
 784:	fff94483          	lbu	s1,-1(s2)
 788:	14048b63          	beqz	s1,8de <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 78c:	0004879b          	sext.w	a5,s1
    if(state == 0){
 790:	fe0997e3          	bnez	s3,77e <vprintf+0x5c>
      if(c == '%'){
 794:	fd479ee3          	bne	a5,s4,770 <vprintf+0x4e>
        state = '%';
 798:	89be                	mv	s3,a5
 79a:	b7e5                	j	782 <vprintf+0x60>
      if(c == 'd'){
 79c:	05878063          	beq	a5,s8,7dc <vprintf+0xba>
      } else if(c == 'l') {
 7a0:	05978c63          	beq	a5,s9,7f8 <vprintf+0xd6>
      } else if(c == 'x') {
 7a4:	07a78863          	beq	a5,s10,814 <vprintf+0xf2>
      } else if(c == 'p') {
 7a8:	09b78463          	beq	a5,s11,830 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 7ac:	07300713          	li	a4,115
 7b0:	0ce78563          	beq	a5,a4,87a <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7b4:	06300713          	li	a4,99
 7b8:	0ee78c63          	beq	a5,a4,8b0 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 7bc:	11478663          	beq	a5,s4,8c8 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7c0:	85d2                	mv	a1,s4
 7c2:	8556                	mv	a0,s5
 7c4:	00000097          	auipc	ra,0x0
 7c8:	e90080e7          	jalr	-368(ra) # 654 <putc>
        putc(fd, c);
 7cc:	85a6                	mv	a1,s1
 7ce:	8556                	mv	a0,s5
 7d0:	00000097          	auipc	ra,0x0
 7d4:	e84080e7          	jalr	-380(ra) # 654 <putc>
      }
      state = 0;
 7d8:	4981                	li	s3,0
 7da:	b765                	j	782 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 7dc:	008b0493          	addi	s1,s6,8
 7e0:	4685                	li	a3,1
 7e2:	4629                	li	a2,10
 7e4:	000b2583          	lw	a1,0(s6)
 7e8:	8556                	mv	a0,s5
 7ea:	00000097          	auipc	ra,0x0
 7ee:	e8c080e7          	jalr	-372(ra) # 676 <printint>
 7f2:	8b26                	mv	s6,s1
      state = 0;
 7f4:	4981                	li	s3,0
 7f6:	b771                	j	782 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7f8:	008b0493          	addi	s1,s6,8
 7fc:	4681                	li	a3,0
 7fe:	4629                	li	a2,10
 800:	000b2583          	lw	a1,0(s6)
 804:	8556                	mv	a0,s5
 806:	00000097          	auipc	ra,0x0
 80a:	e70080e7          	jalr	-400(ra) # 676 <printint>
 80e:	8b26                	mv	s6,s1
      state = 0;
 810:	4981                	li	s3,0
 812:	bf85                	j	782 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 814:	008b0493          	addi	s1,s6,8
 818:	4681                	li	a3,0
 81a:	4641                	li	a2,16
 81c:	000b2583          	lw	a1,0(s6)
 820:	8556                	mv	a0,s5
 822:	00000097          	auipc	ra,0x0
 826:	e54080e7          	jalr	-428(ra) # 676 <printint>
 82a:	8b26                	mv	s6,s1
      state = 0;
 82c:	4981                	li	s3,0
 82e:	bf91                	j	782 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 830:	008b0793          	addi	a5,s6,8
 834:	f8f43423          	sd	a5,-120(s0)
 838:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 83c:	03000593          	li	a1,48
 840:	8556                	mv	a0,s5
 842:	00000097          	auipc	ra,0x0
 846:	e12080e7          	jalr	-494(ra) # 654 <putc>
  putc(fd, 'x');
 84a:	85ea                	mv	a1,s10
 84c:	8556                	mv	a0,s5
 84e:	00000097          	auipc	ra,0x0
 852:	e06080e7          	jalr	-506(ra) # 654 <putc>
 856:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 858:	03c9d793          	srli	a5,s3,0x3c
 85c:	97de                	add	a5,a5,s7
 85e:	0007c583          	lbu	a1,0(a5)
 862:	8556                	mv	a0,s5
 864:	00000097          	auipc	ra,0x0
 868:	df0080e7          	jalr	-528(ra) # 654 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 86c:	0992                	slli	s3,s3,0x4
 86e:	34fd                	addiw	s1,s1,-1
 870:	f4e5                	bnez	s1,858 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 872:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 876:	4981                	li	s3,0
 878:	b729                	j	782 <vprintf+0x60>
        s = va_arg(ap, char*);
 87a:	008b0993          	addi	s3,s6,8
 87e:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 882:	c085                	beqz	s1,8a2 <vprintf+0x180>
        while(*s != 0){
 884:	0004c583          	lbu	a1,0(s1)
 888:	c9a1                	beqz	a1,8d8 <vprintf+0x1b6>
          putc(fd, *s);
 88a:	8556                	mv	a0,s5
 88c:	00000097          	auipc	ra,0x0
 890:	dc8080e7          	jalr	-568(ra) # 654 <putc>
          s++;
 894:	0485                	addi	s1,s1,1
        while(*s != 0){
 896:	0004c583          	lbu	a1,0(s1)
 89a:	f9e5                	bnez	a1,88a <vprintf+0x168>
        s = va_arg(ap, char*);
 89c:	8b4e                	mv	s6,s3
      state = 0;
 89e:	4981                	li	s3,0
 8a0:	b5cd                	j	782 <vprintf+0x60>
          s = "(null)";
 8a2:	00000497          	auipc	s1,0x0
 8a6:	27e48493          	addi	s1,s1,638 # b20 <digits+0x18>
        while(*s != 0){
 8aa:	02800593          	li	a1,40
 8ae:	bff1                	j	88a <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 8b0:	008b0493          	addi	s1,s6,8
 8b4:	000b4583          	lbu	a1,0(s6)
 8b8:	8556                	mv	a0,s5
 8ba:	00000097          	auipc	ra,0x0
 8be:	d9a080e7          	jalr	-614(ra) # 654 <putc>
 8c2:	8b26                	mv	s6,s1
      state = 0;
 8c4:	4981                	li	s3,0
 8c6:	bd75                	j	782 <vprintf+0x60>
        putc(fd, c);
 8c8:	85d2                	mv	a1,s4
 8ca:	8556                	mv	a0,s5
 8cc:	00000097          	auipc	ra,0x0
 8d0:	d88080e7          	jalr	-632(ra) # 654 <putc>
      state = 0;
 8d4:	4981                	li	s3,0
 8d6:	b575                	j	782 <vprintf+0x60>
        s = va_arg(ap, char*);
 8d8:	8b4e                	mv	s6,s3
      state = 0;
 8da:	4981                	li	s3,0
 8dc:	b55d                	j	782 <vprintf+0x60>
    }
  }
}
 8de:	70e6                	ld	ra,120(sp)
 8e0:	7446                	ld	s0,112(sp)
 8e2:	74a6                	ld	s1,104(sp)
 8e4:	7906                	ld	s2,96(sp)
 8e6:	69e6                	ld	s3,88(sp)
 8e8:	6a46                	ld	s4,80(sp)
 8ea:	6aa6                	ld	s5,72(sp)
 8ec:	6b06                	ld	s6,64(sp)
 8ee:	7be2                	ld	s7,56(sp)
 8f0:	7c42                	ld	s8,48(sp)
 8f2:	7ca2                	ld	s9,40(sp)
 8f4:	7d02                	ld	s10,32(sp)
 8f6:	6de2                	ld	s11,24(sp)
 8f8:	6109                	addi	sp,sp,128
 8fa:	8082                	ret

00000000000008fc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8fc:	715d                	addi	sp,sp,-80
 8fe:	ec06                	sd	ra,24(sp)
 900:	e822                	sd	s0,16(sp)
 902:	1000                	addi	s0,sp,32
 904:	e010                	sd	a2,0(s0)
 906:	e414                	sd	a3,8(s0)
 908:	e818                	sd	a4,16(s0)
 90a:	ec1c                	sd	a5,24(s0)
 90c:	03043023          	sd	a6,32(s0)
 910:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 914:	8622                	mv	a2,s0
 916:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 91a:	00000097          	auipc	ra,0x0
 91e:	e08080e7          	jalr	-504(ra) # 722 <vprintf>
}
 922:	60e2                	ld	ra,24(sp)
 924:	6442                	ld	s0,16(sp)
 926:	6161                	addi	sp,sp,80
 928:	8082                	ret

000000000000092a <printf>:

void
printf(const char *fmt, ...)
{
 92a:	711d                	addi	sp,sp,-96
 92c:	ec06                	sd	ra,24(sp)
 92e:	e822                	sd	s0,16(sp)
 930:	1000                	addi	s0,sp,32
 932:	e40c                	sd	a1,8(s0)
 934:	e810                	sd	a2,16(s0)
 936:	ec14                	sd	a3,24(s0)
 938:	f018                	sd	a4,32(s0)
 93a:	f41c                	sd	a5,40(s0)
 93c:	03043823          	sd	a6,48(s0)
 940:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 944:	00840613          	addi	a2,s0,8
 948:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 94c:	85aa                	mv	a1,a0
 94e:	4505                	li	a0,1
 950:	00000097          	auipc	ra,0x0
 954:	dd2080e7          	jalr	-558(ra) # 722 <vprintf>
}
 958:	60e2                	ld	ra,24(sp)
 95a:	6442                	ld	s0,16(sp)
 95c:	6125                	addi	sp,sp,96
 95e:	8082                	ret

0000000000000960 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 960:	1141                	addi	sp,sp,-16
 962:	e422                	sd	s0,8(sp)
 964:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 966:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96a:	00000797          	auipc	a5,0x0
 96e:	5be78793          	addi	a5,a5,1470 # f28 <freep>
 972:	639c                	ld	a5,0(a5)
 974:	a805                	j	9a4 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 976:	4618                	lw	a4,8(a2)
 978:	9db9                	addw	a1,a1,a4
 97a:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 97e:	6398                	ld	a4,0(a5)
 980:	6318                	ld	a4,0(a4)
 982:	fee53823          	sd	a4,-16(a0)
 986:	a091                	j	9ca <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 988:	ff852703          	lw	a4,-8(a0)
 98c:	9e39                	addw	a2,a2,a4
 98e:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 990:	ff053703          	ld	a4,-16(a0)
 994:	e398                	sd	a4,0(a5)
 996:	a099                	j	9dc <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 998:	6398                	ld	a4,0(a5)
 99a:	00e7e463          	bltu	a5,a4,9a2 <free+0x42>
 99e:	00e6ea63          	bltu	a3,a4,9b2 <free+0x52>
{
 9a2:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a4:	fed7fae3          	bleu	a3,a5,998 <free+0x38>
 9a8:	6398                	ld	a4,0(a5)
 9aa:	00e6e463          	bltu	a3,a4,9b2 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ae:	fee7eae3          	bltu	a5,a4,9a2 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 9b2:	ff852583          	lw	a1,-8(a0)
 9b6:	6390                	ld	a2,0(a5)
 9b8:	02059713          	slli	a4,a1,0x20
 9bc:	9301                	srli	a4,a4,0x20
 9be:	0712                	slli	a4,a4,0x4
 9c0:	9736                	add	a4,a4,a3
 9c2:	fae60ae3          	beq	a2,a4,976 <free+0x16>
    bp->s.ptr = p->s.ptr;
 9c6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 9ca:	4790                	lw	a2,8(a5)
 9cc:	02061713          	slli	a4,a2,0x20
 9d0:	9301                	srli	a4,a4,0x20
 9d2:	0712                	slli	a4,a4,0x4
 9d4:	973e                	add	a4,a4,a5
 9d6:	fae689e3          	beq	a3,a4,988 <free+0x28>
  } else
    p->s.ptr = bp;
 9da:	e394                	sd	a3,0(a5)
  freep = p;
 9dc:	00000717          	auipc	a4,0x0
 9e0:	54f73623          	sd	a5,1356(a4) # f28 <freep>
}
 9e4:	6422                	ld	s0,8(sp)
 9e6:	0141                	addi	sp,sp,16
 9e8:	8082                	ret

00000000000009ea <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9ea:	7139                	addi	sp,sp,-64
 9ec:	fc06                	sd	ra,56(sp)
 9ee:	f822                	sd	s0,48(sp)
 9f0:	f426                	sd	s1,40(sp)
 9f2:	f04a                	sd	s2,32(sp)
 9f4:	ec4e                	sd	s3,24(sp)
 9f6:	e852                	sd	s4,16(sp)
 9f8:	e456                	sd	s5,8(sp)
 9fa:	e05a                	sd	s6,0(sp)
 9fc:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9fe:	02051993          	slli	s3,a0,0x20
 a02:	0209d993          	srli	s3,s3,0x20
 a06:	09bd                	addi	s3,s3,15
 a08:	0049d993          	srli	s3,s3,0x4
 a0c:	2985                	addiw	s3,s3,1
 a0e:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 a12:	00000797          	auipc	a5,0x0
 a16:	51678793          	addi	a5,a5,1302 # f28 <freep>
 a1a:	6388                	ld	a0,0(a5)
 a1c:	c515                	beqz	a0,a48 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a20:	4798                	lw	a4,8(a5)
 a22:	03277d63          	bleu	s2,a4,a5c <malloc+0x72>
 a26:	8a4e                	mv	s4,s3
 a28:	0009871b          	sext.w	a4,s3
 a2c:	6685                	lui	a3,0x1
 a2e:	00d77363          	bleu	a3,a4,a34 <malloc+0x4a>
 a32:	6a05                	lui	s4,0x1
 a34:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 a38:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a3c:	00000497          	auipc	s1,0x0
 a40:	4ec48493          	addi	s1,s1,1260 # f28 <freep>
  if(p == (char*)-1)
 a44:	5b7d                	li	s6,-1
 a46:	a0b5                	j	ab2 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a48:	00000717          	auipc	a4,0x0
 a4c:	4e870713          	addi	a4,a4,1256 # f30 <base>
 a50:	e398                	sd	a4,0(a5)
 a52:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 a54:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a58:	87ba                	mv	a5,a4
 a5a:	b7f1                	j	a26 <malloc+0x3c>
      if(p->s.size == nunits)
 a5c:	02e90b63          	beq	s2,a4,a92 <malloc+0xa8>
        p->s.size -= nunits;
 a60:	4137073b          	subw	a4,a4,s3
 a64:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a66:	1702                	slli	a4,a4,0x20
 a68:	9301                	srli	a4,a4,0x20
 a6a:	0712                	slli	a4,a4,0x4
 a6c:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a6e:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a72:	00000717          	auipc	a4,0x0
 a76:	4aa73b23          	sd	a0,1206(a4) # f28 <freep>
      return (void*)(p + 1);
 a7a:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a7e:	70e2                	ld	ra,56(sp)
 a80:	7442                	ld	s0,48(sp)
 a82:	74a2                	ld	s1,40(sp)
 a84:	7902                	ld	s2,32(sp)
 a86:	69e2                	ld	s3,24(sp)
 a88:	6a42                	ld	s4,16(sp)
 a8a:	6aa2                	ld	s5,8(sp)
 a8c:	6b02                	ld	s6,0(sp)
 a8e:	6121                	addi	sp,sp,64
 a90:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a92:	6398                	ld	a4,0(a5)
 a94:	e118                	sd	a4,0(a0)
 a96:	bff1                	j	a72 <malloc+0x88>
  hp->s.size = nu;
 a98:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 a9c:	0541                	addi	a0,a0,16
 a9e:	00000097          	auipc	ra,0x0
 aa2:	ec2080e7          	jalr	-318(ra) # 960 <free>
  return freep;
 aa6:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 aa8:	d979                	beqz	a0,a7e <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aaa:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 aac:	4798                	lw	a4,8(a5)
 aae:	fb2777e3          	bleu	s2,a4,a5c <malloc+0x72>
    if(p == freep)
 ab2:	6098                	ld	a4,0(s1)
 ab4:	853e                	mv	a0,a5
 ab6:	fef71ae3          	bne	a4,a5,aaa <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 aba:	8552                	mv	a0,s4
 abc:	00000097          	auipc	ra,0x0
 ac0:	b38080e7          	jalr	-1224(ra) # 5f4 <sbrk>
  if(p == (char*)-1)
 ac4:	fd651ae3          	bne	a0,s6,a98 <malloc+0xae>
        return 0;
 ac8:	4501                	li	a0,0
 aca:	bf55                	j	a7e <malloc+0x94>
