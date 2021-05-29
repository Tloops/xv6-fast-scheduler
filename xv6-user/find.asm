
xv6-user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <find>:
#include "xv6-user/user.h"

static char path[512];

void find(char *filename)
{
   0:	7175                	addi	sp,sp,-144
   2:	e506                	sd	ra,136(sp)
   4:	e122                	sd	s0,128(sp)
   6:	fca6                	sd	s1,120(sp)
   8:	f8ca                	sd	s2,112(sp)
   a:	f4ce                	sd	s3,104(sp)
   c:	f0d2                	sd	s4,96(sp)
   e:	ecd6                	sd	s5,88(sp)
  10:	e8da                	sd	s6,80(sp)
  12:	e4de                	sd	s7,72(sp)
  14:	e0e2                	sd	s8,64(sp)
  16:	0900                	addi	s0,sp,144
  18:	8a2a                	mv	s4,a0
    int fd;
    struct stat st;
    if ((fd = open(path, O_RDONLY)) < 0) {
  1a:	4581                	li	a1,0
  1c:	00001517          	auipc	a0,0x1
  20:	aac50513          	addi	a0,a0,-1364 # ac8 <__bss_start>
  24:	00000097          	auipc	ra,0x0
  28:	4fc080e7          	jalr	1276(ra) # 520 <open>
  2c:	04054163          	bltz	a0,6e <find+0x6e>
  30:	84aa                	mv	s1,a0
        fprintf(2, "find: cannot open %s\n", path);
        return;
    }
    if (fstat(fd, &st) < 0) {
  32:	f7840593          	addi	a1,s0,-136
  36:	00000097          	auipc	ra,0x0
  3a:	4f2080e7          	jalr	1266(ra) # 528 <fstat>
  3e:	04054663          	bltz	a0,8a <find+0x8a>
        fprintf(2, "find: cannot stat %s\n", path);
        close(fd);
        return;
    }
    if (st.type != T_DIR) {
  42:	fa041703          	lh	a4,-96(s0)
  46:	4785                	li	a5,1
  48:	06f70463          	beq	a4,a5,b0 <find+0xb0>
        close(fd);
  4c:	8526                	mv	a0,s1
  4e:	00000097          	auipc	ra,0x0
  52:	4ba080e7          	jalr	1210(ra) # 508 <close>
        }
        find(filename);
    }
    close(fd);
    return;
}
  56:	60aa                	ld	ra,136(sp)
  58:	640a                	ld	s0,128(sp)
  5a:	74e6                	ld	s1,120(sp)
  5c:	7946                	ld	s2,112(sp)
  5e:	79a6                	ld	s3,104(sp)
  60:	7a06                	ld	s4,96(sp)
  62:	6ae6                	ld	s5,88(sp)
  64:	6b46                	ld	s6,80(sp)
  66:	6ba6                	ld	s7,72(sp)
  68:	6c06                	ld	s8,64(sp)
  6a:	6149                	addi	sp,sp,144
  6c:	8082                	ret
        fprintf(2, "find: cannot open %s\n", path);
  6e:	00001617          	auipc	a2,0x1
  72:	a5a60613          	addi	a2,a2,-1446 # ac8 <__bss_start>
  76:	00001597          	auipc	a1,0x1
  7a:	9b258593          	addi	a1,a1,-1614 # a28 <malloc+0xe2>
  7e:	4509                	li	a0,2
  80:	00000097          	auipc	ra,0x0
  84:	7d8080e7          	jalr	2008(ra) # 858 <fprintf>
        return;
  88:	b7f9                	j	56 <find+0x56>
        fprintf(2, "find: cannot stat %s\n", path);
  8a:	00001617          	auipc	a2,0x1
  8e:	a3e60613          	addi	a2,a2,-1474 # ac8 <__bss_start>
  92:	00001597          	auipc	a1,0x1
  96:	9ae58593          	addi	a1,a1,-1618 # a40 <malloc+0xfa>
  9a:	4509                	li	a0,2
  9c:	00000097          	auipc	ra,0x0
  a0:	7bc080e7          	jalr	1980(ra) # 858 <fprintf>
        close(fd);
  a4:	8526                	mv	a0,s1
  a6:	00000097          	auipc	ra,0x0
  aa:	462080e7          	jalr	1122(ra) # 508 <close>
        return;
  ae:	b765                	j	56 <find+0x56>
    if (strlen(path) + 255 + 2 > sizeof(path)) {
  b0:	00001517          	auipc	a0,0x1
  b4:	a1850513          	addi	a0,a0,-1512 # ac8 <__bss_start>
  b8:	00000097          	auipc	ra,0x0
  bc:	1cc080e7          	jalr	460(ra) # 284 <strlen>
  c0:	1015051b          	addiw	a0,a0,257
  c4:	20000793          	li	a5,512
  c8:	0aa7e863          	bltu	a5,a0,178 <find+0x178>
    char *p = path + strlen(path) - 1;
  cc:	00001917          	auipc	s2,0x1
  d0:	9fc90913          	addi	s2,s2,-1540 # ac8 <__bss_start>
  d4:	854a                	mv	a0,s2
  d6:	00000097          	auipc	ra,0x0
  da:	1ae080e7          	jalr	430(ra) # 284 <strlen>
  de:	1502                	slli	a0,a0,0x20
  e0:	9101                	srli	a0,a0,0x20
  e2:	fff50793          	addi	a5,a0,-1
  e6:	993e                	add	s2,s2,a5
    if (*p != '/') {
  e8:	00094703          	lbu	a4,0(s2)
  ec:	02f00793          	li	a5,47
  f0:	00f70963          	beq	a4,a5,102 <find+0x102>
        *++p = '/';
  f4:	00f900a3          	sb	a5,1(s2)
  f8:	00001917          	auipc	s2,0x1
  fc:	9d090913          	addi	s2,s2,-1584 # ac8 <__bss_start>
 100:	992a                	add	s2,s2,a0
    p++;
 102:	0905                	addi	s2,s2,1
    while (readdir(fd, &st)) {
 104:	f7840993          	addi	s3,s0,-136
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 108:	00001a97          	auipc	s5,0x1
 10c:	968a8a93          	addi	s5,s5,-1688 # a70 <malloc+0x12a>
 110:	00001b17          	auipc	s6,0x1
 114:	968b0b13          	addi	s6,s6,-1688 # a78 <malloc+0x132>
            fprintf(1, "%s\n", path);
 118:	00001c17          	auipc	s8,0x1
 11c:	9b0c0c13          	addi	s8,s8,-1616 # ac8 <__bss_start>
 120:	00001b97          	auipc	s7,0x1
 124:	960b8b93          	addi	s7,s7,-1696 # a80 <malloc+0x13a>
    while (readdir(fd, &st)) {
 128:	85ce                	mv	a1,s3
 12a:	8526                	mv	a0,s1
 12c:	00000097          	auipc	ra,0x0
 130:	44c080e7          	jalr	1100(ra) # 578 <readdir>
 134:	c92d                	beqz	a0,1a6 <find+0x1a6>
        strcpy(p, st.name);
 136:	85ce                	mv	a1,s3
 138:	854a                	mv	a0,s2
 13a:	00000097          	auipc	ra,0x0
 13e:	0cc080e7          	jalr	204(ra) # 206 <strcpy>
        if (strcmp(p, ".") == 0 || strcmp(p, "..") == 0) {
 142:	85d6                	mv	a1,s5
 144:	854a                	mv	a0,s2
 146:	00000097          	auipc	ra,0x0
 14a:	10a080e7          	jalr	266(ra) # 250 <strcmp>
 14e:	dd69                	beqz	a0,128 <find+0x128>
 150:	85da                	mv	a1,s6
 152:	854a                	mv	a0,s2
 154:	00000097          	auipc	ra,0x0
 158:	0fc080e7          	jalr	252(ra) # 250 <strcmp>
 15c:	d571                	beqz	a0,128 <find+0x128>
        if (strcmp(p, filename) == 0) {
 15e:	85d2                	mv	a1,s4
 160:	854a                	mv	a0,s2
 162:	00000097          	auipc	ra,0x0
 166:	0ee080e7          	jalr	238(ra) # 250 <strcmp>
 16a:	c515                	beqz	a0,196 <find+0x196>
        find(filename);
 16c:	8552                	mv	a0,s4
 16e:	00000097          	auipc	ra,0x0
 172:	e92080e7          	jalr	-366(ra) # 0 <find>
 176:	bf4d                	j	128 <find+0x128>
        fprintf(2, "find: path too long\n");
 178:	00001597          	auipc	a1,0x1
 17c:	8e058593          	addi	a1,a1,-1824 # a58 <malloc+0x112>
 180:	4509                	li	a0,2
 182:	00000097          	auipc	ra,0x0
 186:	6d6080e7          	jalr	1750(ra) # 858 <fprintf>
        close(fd);
 18a:	8526                	mv	a0,s1
 18c:	00000097          	auipc	ra,0x0
 190:	37c080e7          	jalr	892(ra) # 508 <close>
        return;
 194:	b5c9                	j	56 <find+0x56>
            fprintf(1, "%s\n", path);
 196:	8662                	mv	a2,s8
 198:	85de                	mv	a1,s7
 19a:	4505                	li	a0,1
 19c:	00000097          	auipc	ra,0x0
 1a0:	6bc080e7          	jalr	1724(ra) # 858 <fprintf>
 1a4:	b7e1                	j	16c <find+0x16c>
    close(fd);
 1a6:	8526                	mv	a0,s1
 1a8:	00000097          	auipc	ra,0x0
 1ac:	360080e7          	jalr	864(ra) # 508 <close>
    return;
 1b0:	b55d                	j	56 <find+0x56>

00000000000001b2 <main>:


int main(int argc, char *argv[])
{
 1b2:	1101                	addi	sp,sp,-32
 1b4:	ec06                	sd	ra,24(sp)
 1b6:	e822                	sd	s0,16(sp)
 1b8:	e426                	sd	s1,8(sp)
 1ba:	1000                	addi	s0,sp,32
    if (argc < 3) {
 1bc:	4789                	li	a5,2
 1be:	02a7c063          	blt	a5,a0,1de <main+0x2c>
        fprintf(2, "Usage: find DIR FILENAME\n");
 1c2:	00001597          	auipc	a1,0x1
 1c6:	8c658593          	addi	a1,a1,-1850 # a88 <malloc+0x142>
 1ca:	4509                	li	a0,2
 1cc:	00000097          	auipc	ra,0x0
 1d0:	68c080e7          	jalr	1676(ra) # 858 <fprintf>
        exit(0);
 1d4:	4501                	li	a0,0
 1d6:	00000097          	auipc	ra,0x0
 1da:	30a080e7          	jalr	778(ra) # 4e0 <exit>
 1de:	84ae                	mv	s1,a1
    } else {
        strcpy(path, argv[1]);
 1e0:	658c                	ld	a1,8(a1)
 1e2:	00001517          	auipc	a0,0x1
 1e6:	8e650513          	addi	a0,a0,-1818 # ac8 <__bss_start>
 1ea:	00000097          	auipc	ra,0x0
 1ee:	01c080e7          	jalr	28(ra) # 206 <strcpy>
        find(argv[2]);
 1f2:	6888                	ld	a0,16(s1)
 1f4:	00000097          	auipc	ra,0x0
 1f8:	e0c080e7          	jalr	-500(ra) # 0 <find>
    }
    exit(0);
 1fc:	4501                	li	a0,0
 1fe:	00000097          	auipc	ra,0x0
 202:	2e2080e7          	jalr	738(ra) # 4e0 <exit>

0000000000000206 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 206:	1141                	addi	sp,sp,-16
 208:	e422                	sd	s0,8(sp)
 20a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 20c:	87aa                	mv	a5,a0
 20e:	0585                	addi	a1,a1,1
 210:	0785                	addi	a5,a5,1
 212:	fff5c703          	lbu	a4,-1(a1)
 216:	fee78fa3          	sb	a4,-1(a5)
 21a:	fb75                	bnez	a4,20e <strcpy+0x8>
    ;
  return os;
}
 21c:	6422                	ld	s0,8(sp)
 21e:	0141                	addi	sp,sp,16
 220:	8082                	ret

0000000000000222 <strcat>:

char*
strcat(char *s, const char *t)
{
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 228:	00054783          	lbu	a5,0(a0)
 22c:	c385                	beqz	a5,24c <strcat+0x2a>
 22e:	87aa                	mv	a5,a0
    s++;
 230:	0785                	addi	a5,a5,1
  while(*s)
 232:	0007c703          	lbu	a4,0(a5)
 236:	ff6d                	bnez	a4,230 <strcat+0xe>
  while((*s++ = *t++))
 238:	0585                	addi	a1,a1,1
 23a:	0785                	addi	a5,a5,1
 23c:	fff5c703          	lbu	a4,-1(a1)
 240:	fee78fa3          	sb	a4,-1(a5)
 244:	fb75                	bnez	a4,238 <strcat+0x16>
    ;
  return os;
}
 246:	6422                	ld	s0,8(sp)
 248:	0141                	addi	sp,sp,16
 24a:	8082                	ret
  while(*s)
 24c:	87aa                	mv	a5,a0
 24e:	b7ed                	j	238 <strcat+0x16>

0000000000000250 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 250:	1141                	addi	sp,sp,-16
 252:	e422                	sd	s0,8(sp)
 254:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 256:	00054783          	lbu	a5,0(a0)
 25a:	cf91                	beqz	a5,276 <strcmp+0x26>
 25c:	0005c703          	lbu	a4,0(a1)
 260:	00f71b63          	bne	a4,a5,276 <strcmp+0x26>
    p++, q++;
 264:	0505                	addi	a0,a0,1
 266:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 268:	00054783          	lbu	a5,0(a0)
 26c:	c789                	beqz	a5,276 <strcmp+0x26>
 26e:	0005c703          	lbu	a4,0(a1)
 272:	fef709e3          	beq	a4,a5,264 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 276:	0005c503          	lbu	a0,0(a1)
}
 27a:	40a7853b          	subw	a0,a5,a0
 27e:	6422                	ld	s0,8(sp)
 280:	0141                	addi	sp,sp,16
 282:	8082                	ret

0000000000000284 <strlen>:

uint
strlen(const char *s)
{
 284:	1141                	addi	sp,sp,-16
 286:	e422                	sd	s0,8(sp)
 288:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 28a:	00054783          	lbu	a5,0(a0)
 28e:	cf91                	beqz	a5,2aa <strlen+0x26>
 290:	0505                	addi	a0,a0,1
 292:	87aa                	mv	a5,a0
 294:	4685                	li	a3,1
 296:	9e89                	subw	a3,a3,a0
 298:	00f6853b          	addw	a0,a3,a5
 29c:	0785                	addi	a5,a5,1
 29e:	fff7c703          	lbu	a4,-1(a5)
 2a2:	fb7d                	bnez	a4,298 <strlen+0x14>
    ;
  return n;
}
 2a4:	6422                	ld	s0,8(sp)
 2a6:	0141                	addi	sp,sp,16
 2a8:	8082                	ret
  for(n = 0; s[n]; n++)
 2aa:	4501                	li	a0,0
 2ac:	bfe5                	j	2a4 <strlen+0x20>

00000000000002ae <memset>:

void*
memset(void *dst, int c, uint n)
{
 2ae:	1141                	addi	sp,sp,-16
 2b0:	e422                	sd	s0,8(sp)
 2b2:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2b4:	ce09                	beqz	a2,2ce <memset+0x20>
 2b6:	87aa                	mv	a5,a0
 2b8:	fff6071b          	addiw	a4,a2,-1
 2bc:	1702                	slli	a4,a4,0x20
 2be:	9301                	srli	a4,a4,0x20
 2c0:	0705                	addi	a4,a4,1
 2c2:	972a                	add	a4,a4,a0
    cdst[i] = c;
 2c4:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2c8:	0785                	addi	a5,a5,1
 2ca:	fee79de3          	bne	a5,a4,2c4 <memset+0x16>
  }
  return dst;
}
 2ce:	6422                	ld	s0,8(sp)
 2d0:	0141                	addi	sp,sp,16
 2d2:	8082                	ret

00000000000002d4 <strchr>:

char*
strchr(const char *s, char c)
{
 2d4:	1141                	addi	sp,sp,-16
 2d6:	e422                	sd	s0,8(sp)
 2d8:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2da:	00054783          	lbu	a5,0(a0)
 2de:	cf91                	beqz	a5,2fa <strchr+0x26>
    if(*s == c)
 2e0:	00f58a63          	beq	a1,a5,2f4 <strchr+0x20>
  for(; *s; s++)
 2e4:	0505                	addi	a0,a0,1
 2e6:	00054783          	lbu	a5,0(a0)
 2ea:	c781                	beqz	a5,2f2 <strchr+0x1e>
    if(*s == c)
 2ec:	feb79ce3          	bne	a5,a1,2e4 <strchr+0x10>
 2f0:	a011                	j	2f4 <strchr+0x20>
      return (char*)s;
  return 0;
 2f2:	4501                	li	a0,0
}
 2f4:	6422                	ld	s0,8(sp)
 2f6:	0141                	addi	sp,sp,16
 2f8:	8082                	ret
  return 0;
 2fa:	4501                	li	a0,0
 2fc:	bfe5                	j	2f4 <strchr+0x20>

00000000000002fe <gets>:

char*
gets(char *buf, int max)
{
 2fe:	711d                	addi	sp,sp,-96
 300:	ec86                	sd	ra,88(sp)
 302:	e8a2                	sd	s0,80(sp)
 304:	e4a6                	sd	s1,72(sp)
 306:	e0ca                	sd	s2,64(sp)
 308:	fc4e                	sd	s3,56(sp)
 30a:	f852                	sd	s4,48(sp)
 30c:	f456                	sd	s5,40(sp)
 30e:	f05a                	sd	s6,32(sp)
 310:	ec5e                	sd	s7,24(sp)
 312:	e862                	sd	s8,16(sp)
 314:	1080                	addi	s0,sp,96
 316:	8c2a                	mv	s8,a0
 318:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 31a:	892a                	mv	s2,a0
 31c:	4981                	li	s3,0
    cc = read(0, &c, 1);
 31e:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 322:	4b29                	li	s6,10
 324:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 326:	0019849b          	addiw	s1,s3,1
 32a:	0344d763          	ble	s4,s1,358 <gets+0x5a>
    cc = read(0, &c, 1);
 32e:	4605                	li	a2,1
 330:	85d6                	mv	a1,s5
 332:	4501                	li	a0,0
 334:	00000097          	auipc	ra,0x0
 338:	1c4080e7          	jalr	452(ra) # 4f8 <read>
    if(cc < 1)
 33c:	00a05e63          	blez	a0,358 <gets+0x5a>
    buf[i++] = c;
 340:	faf44783          	lbu	a5,-81(s0)
 344:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 348:	01678763          	beq	a5,s6,356 <gets+0x58>
 34c:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 34e:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 350:	fd779be3          	bne	a5,s7,326 <gets+0x28>
 354:	a011                	j	358 <gets+0x5a>
  for(i=0; i+1 < max; ){
 356:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 358:	99e2                	add	s3,s3,s8
 35a:	00098023          	sb	zero,0(s3)
  return buf;
}
 35e:	8562                	mv	a0,s8
 360:	60e6                	ld	ra,88(sp)
 362:	6446                	ld	s0,80(sp)
 364:	64a6                	ld	s1,72(sp)
 366:	6906                	ld	s2,64(sp)
 368:	79e2                	ld	s3,56(sp)
 36a:	7a42                	ld	s4,48(sp)
 36c:	7aa2                	ld	s5,40(sp)
 36e:	7b02                	ld	s6,32(sp)
 370:	6be2                	ld	s7,24(sp)
 372:	6c42                	ld	s8,16(sp)
 374:	6125                	addi	sp,sp,96
 376:	8082                	ret

0000000000000378 <stat>:

int
stat(const char *n, struct stat *st)
{
 378:	1101                	addi	sp,sp,-32
 37a:	ec06                	sd	ra,24(sp)
 37c:	e822                	sd	s0,16(sp)
 37e:	e426                	sd	s1,8(sp)
 380:	e04a                	sd	s2,0(sp)
 382:	1000                	addi	s0,sp,32
 384:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 386:	4581                	li	a1,0
 388:	00000097          	auipc	ra,0x0
 38c:	198080e7          	jalr	408(ra) # 520 <open>
  if(fd < 0)
 390:	02054563          	bltz	a0,3ba <stat+0x42>
 394:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 396:	85ca                	mv	a1,s2
 398:	00000097          	auipc	ra,0x0
 39c:	190080e7          	jalr	400(ra) # 528 <fstat>
 3a0:	892a                	mv	s2,a0
  close(fd);
 3a2:	8526                	mv	a0,s1
 3a4:	00000097          	auipc	ra,0x0
 3a8:	164080e7          	jalr	356(ra) # 508 <close>
  return r;
}
 3ac:	854a                	mv	a0,s2
 3ae:	60e2                	ld	ra,24(sp)
 3b0:	6442                	ld	s0,16(sp)
 3b2:	64a2                	ld	s1,8(sp)
 3b4:	6902                	ld	s2,0(sp)
 3b6:	6105                	addi	sp,sp,32
 3b8:	8082                	ret
    return -1;
 3ba:	597d                	li	s2,-1
 3bc:	bfc5                	j	3ac <stat+0x34>

00000000000003be <atoi>:

int
atoi(const char *s)
{
 3be:	1141                	addi	sp,sp,-16
 3c0:	e422                	sd	s0,8(sp)
 3c2:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 3c4:	00054703          	lbu	a4,0(a0)
 3c8:	02d00793          	li	a5,45
  int neg = 1;
 3cc:	4805                	li	a6,1
  if (*s == '-') {
 3ce:	04f70363          	beq	a4,a5,414 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3d2:	00054683          	lbu	a3,0(a0)
 3d6:	fd06879b          	addiw	a5,a3,-48
 3da:	0ff7f793          	andi	a5,a5,255
 3de:	4725                	li	a4,9
 3e0:	02f76d63          	bltu	a4,a5,41a <atoi+0x5c>
  n = 0;
 3e4:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 3e6:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3e8:	0505                	addi	a0,a0,1
 3ea:	0026179b          	slliw	a5,a2,0x2
 3ee:	9fb1                	addw	a5,a5,a2
 3f0:	0017979b          	slliw	a5,a5,0x1
 3f4:	9fb5                	addw	a5,a5,a3
 3f6:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 3fa:	00054683          	lbu	a3,0(a0)
 3fe:	fd06871b          	addiw	a4,a3,-48
 402:	0ff77713          	andi	a4,a4,255
 406:	fee5f1e3          	bleu	a4,a1,3e8 <atoi+0x2a>
  return n * neg;
}
 40a:	02c8053b          	mulw	a0,a6,a2
 40e:	6422                	ld	s0,8(sp)
 410:	0141                	addi	sp,sp,16
 412:	8082                	ret
    s++;
 414:	0505                	addi	a0,a0,1
    neg = -1;
 416:	587d                	li	a6,-1
 418:	bf6d                	j	3d2 <atoi+0x14>
  n = 0;
 41a:	4601                	li	a2,0
 41c:	b7fd                	j	40a <atoi+0x4c>

000000000000041e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 41e:	1141                	addi	sp,sp,-16
 420:	e422                	sd	s0,8(sp)
 422:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 424:	02b57663          	bleu	a1,a0,450 <memmove+0x32>
    while(n-- > 0)
 428:	02c05163          	blez	a2,44a <memmove+0x2c>
 42c:	fff6079b          	addiw	a5,a2,-1
 430:	1782                	slli	a5,a5,0x20
 432:	9381                	srli	a5,a5,0x20
 434:	0785                	addi	a5,a5,1
 436:	97aa                	add	a5,a5,a0
  dst = vdst;
 438:	872a                	mv	a4,a0
      *dst++ = *src++;
 43a:	0585                	addi	a1,a1,1
 43c:	0705                	addi	a4,a4,1
 43e:	fff5c683          	lbu	a3,-1(a1)
 442:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 446:	fee79ae3          	bne	a5,a4,43a <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 44a:	6422                	ld	s0,8(sp)
 44c:	0141                	addi	sp,sp,16
 44e:	8082                	ret
    dst += n;
 450:	00c50733          	add	a4,a0,a2
    src += n;
 454:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 456:	fec05ae3          	blez	a2,44a <memmove+0x2c>
 45a:	fff6079b          	addiw	a5,a2,-1
 45e:	1782                	slli	a5,a5,0x20
 460:	9381                	srli	a5,a5,0x20
 462:	fff7c793          	not	a5,a5
 466:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 468:	15fd                	addi	a1,a1,-1
 46a:	177d                	addi	a4,a4,-1
 46c:	0005c683          	lbu	a3,0(a1)
 470:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 474:	fef71ae3          	bne	a4,a5,468 <memmove+0x4a>
 478:	bfc9                	j	44a <memmove+0x2c>

000000000000047a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 47a:	1141                	addi	sp,sp,-16
 47c:	e422                	sd	s0,8(sp)
 47e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 480:	ce15                	beqz	a2,4bc <memcmp+0x42>
 482:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 486:	00054783          	lbu	a5,0(a0)
 48a:	0005c703          	lbu	a4,0(a1)
 48e:	02e79063          	bne	a5,a4,4ae <memcmp+0x34>
 492:	1682                	slli	a3,a3,0x20
 494:	9281                	srli	a3,a3,0x20
 496:	0685                	addi	a3,a3,1
 498:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 49a:	0505                	addi	a0,a0,1
    p2++;
 49c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 49e:	00d50d63          	beq	a0,a3,4b8 <memcmp+0x3e>
    if (*p1 != *p2) {
 4a2:	00054783          	lbu	a5,0(a0)
 4a6:	0005c703          	lbu	a4,0(a1)
 4aa:	fee788e3          	beq	a5,a4,49a <memcmp+0x20>
      return *p1 - *p2;
 4ae:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 4b2:	6422                	ld	s0,8(sp)
 4b4:	0141                	addi	sp,sp,16
 4b6:	8082                	ret
  return 0;
 4b8:	4501                	li	a0,0
 4ba:	bfe5                	j	4b2 <memcmp+0x38>
 4bc:	4501                	li	a0,0
 4be:	bfd5                	j	4b2 <memcmp+0x38>

00000000000004c0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4c0:	1141                	addi	sp,sp,-16
 4c2:	e406                	sd	ra,8(sp)
 4c4:	e022                	sd	s0,0(sp)
 4c6:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4c8:	00000097          	auipc	ra,0x0
 4cc:	f56080e7          	jalr	-170(ra) # 41e <memmove>
}
 4d0:	60a2                	ld	ra,8(sp)
 4d2:	6402                	ld	s0,0(sp)
 4d4:	0141                	addi	sp,sp,16
 4d6:	8082                	ret

00000000000004d8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 4d8:	4885                	li	a7,1
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 4e0:	4889                	li	a7,2
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4e8:	488d                	li	a7,3
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4f0:	4891                	li	a7,4
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <read>:
.global read
read:
 li a7, SYS_read
 4f8:	4895                	li	a7,5
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <write>:
.global write
write:
 li a7, SYS_write
 500:	48c1                	li	a7,16
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <close>:
.global close
close:
 li a7, SYS_close
 508:	48d5                	li	a7,21
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <kill>:
.global kill
kill:
 li a7, SYS_kill
 510:	4899                	li	a7,6
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <exec>:
.global exec
exec:
 li a7, SYS_exec
 518:	489d                	li	a7,7
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <open>:
.global open
open:
 li a7, SYS_open
 520:	48bd                	li	a7,15
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 528:	48a1                	li	a7,8
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 530:	48d1                	li	a7,20
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 538:	48a5                	li	a7,9
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <dup>:
.global dup
dup:
 li a7, SYS_dup
 540:	48a9                	li	a7,10
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 548:	48ad                	li	a7,11
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 550:	48b1                	li	a7,12
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 558:	48b5                	li	a7,13
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 560:	48b9                	li	a7,14
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 568:	48d9                	li	a7,22
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <dev>:
.global dev
dev:
 li a7, SYS_dev
 570:	48dd                	li	a7,23
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 578:	48e1                	li	a7,24
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 580:	48e5                	li	a7,25
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <remove>:
.global remove
remove:
 li a7, SYS_remove
 588:	48c5                	li	a7,17
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <trace>:
.global trace
trace:
 li a7, SYS_trace
 590:	48c9                	li	a7,18
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 598:	48cd                	li	a7,19
 ecall
 59a:	00000073          	ecall
 ret
 59e:	8082                	ret

00000000000005a0 <rename>:
.global rename
rename:
 li a7, SYS_rename
 5a0:	48e9                	li	a7,26
 ecall
 5a2:	00000073          	ecall
 ret
 5a6:	8082                	ret

00000000000005a8 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 5a8:	48ed                	li	a7,27
 ecall
 5aa:	00000073          	ecall
 ret
 5ae:	8082                	ret

00000000000005b0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5b0:	1101                	addi	sp,sp,-32
 5b2:	ec06                	sd	ra,24(sp)
 5b4:	e822                	sd	s0,16(sp)
 5b6:	1000                	addi	s0,sp,32
 5b8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5bc:	4605                	li	a2,1
 5be:	fef40593          	addi	a1,s0,-17
 5c2:	00000097          	auipc	ra,0x0
 5c6:	f3e080e7          	jalr	-194(ra) # 500 <write>
}
 5ca:	60e2                	ld	ra,24(sp)
 5cc:	6442                	ld	s0,16(sp)
 5ce:	6105                	addi	sp,sp,32
 5d0:	8082                	ret

00000000000005d2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5d2:	7139                	addi	sp,sp,-64
 5d4:	fc06                	sd	ra,56(sp)
 5d6:	f822                	sd	s0,48(sp)
 5d8:	f426                	sd	s1,40(sp)
 5da:	f04a                	sd	s2,32(sp)
 5dc:	ec4e                	sd	s3,24(sp)
 5de:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5e0:	c299                	beqz	a3,5e6 <printint+0x14>
 5e2:	0005ce63          	bltz	a1,5fe <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5e6:	2581                	sext.w	a1,a1
  neg = 0;
 5e8:	4301                	li	t1,0
  }

  i = 0;
 5ea:	fc040913          	addi	s2,s0,-64
  neg = 0;
 5ee:	874a                	mv	a4,s2
  i = 0;
 5f0:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 5f2:	2601                	sext.w	a2,a2
 5f4:	00000897          	auipc	a7,0x0
 5f8:	4b488893          	addi	a7,a7,1204 # aa8 <digits>
 5fc:	a801                	j	60c <printint+0x3a>
    x = -xx;
 5fe:	40b005bb          	negw	a1,a1
 602:	2581                	sext.w	a1,a1
    neg = 1;
 604:	4305                	li	t1,1
    x = -xx;
 606:	b7d5                	j	5ea <printint+0x18>
  }while((x /= base) != 0);
 608:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 60a:	8836                	mv	a6,a3
 60c:	0018069b          	addiw	a3,a6,1
 610:	02c5f7bb          	remuw	a5,a1,a2
 614:	1782                	slli	a5,a5,0x20
 616:	9381                	srli	a5,a5,0x20
 618:	97c6                	add	a5,a5,a7
 61a:	0007c783          	lbu	a5,0(a5)
 61e:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 622:	0705                	addi	a4,a4,1
 624:	02c5d7bb          	divuw	a5,a1,a2
 628:	fec5f0e3          	bleu	a2,a1,608 <printint+0x36>
  if(neg)
 62c:	00030b63          	beqz	t1,642 <printint+0x70>
    buf[i++] = '-';
 630:	fd040793          	addi	a5,s0,-48
 634:	96be                	add	a3,a3,a5
 636:	02d00793          	li	a5,45
 63a:	fef68823          	sb	a5,-16(a3)
 63e:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 642:	02d05763          	blez	a3,670 <printint+0x9e>
 646:	89aa                	mv	s3,a0
 648:	fc040493          	addi	s1,s0,-64
 64c:	94b6                	add	s1,s1,a3
 64e:	197d                	addi	s2,s2,-1
 650:	9936                	add	s2,s2,a3
 652:	36fd                	addiw	a3,a3,-1
 654:	1682                	slli	a3,a3,0x20
 656:	9281                	srli	a3,a3,0x20
 658:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 65c:	fff4c583          	lbu	a1,-1(s1)
 660:	854e                	mv	a0,s3
 662:	00000097          	auipc	ra,0x0
 666:	f4e080e7          	jalr	-178(ra) # 5b0 <putc>
  while(--i >= 0)
 66a:	14fd                	addi	s1,s1,-1
 66c:	ff2498e3          	bne	s1,s2,65c <printint+0x8a>
}
 670:	70e2                	ld	ra,56(sp)
 672:	7442                	ld	s0,48(sp)
 674:	74a2                	ld	s1,40(sp)
 676:	7902                	ld	s2,32(sp)
 678:	69e2                	ld	s3,24(sp)
 67a:	6121                	addi	sp,sp,64
 67c:	8082                	ret

000000000000067e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 67e:	7119                	addi	sp,sp,-128
 680:	fc86                	sd	ra,120(sp)
 682:	f8a2                	sd	s0,112(sp)
 684:	f4a6                	sd	s1,104(sp)
 686:	f0ca                	sd	s2,96(sp)
 688:	ecce                	sd	s3,88(sp)
 68a:	e8d2                	sd	s4,80(sp)
 68c:	e4d6                	sd	s5,72(sp)
 68e:	e0da                	sd	s6,64(sp)
 690:	fc5e                	sd	s7,56(sp)
 692:	f862                	sd	s8,48(sp)
 694:	f466                	sd	s9,40(sp)
 696:	f06a                	sd	s10,32(sp)
 698:	ec6e                	sd	s11,24(sp)
 69a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 69c:	0005c483          	lbu	s1,0(a1)
 6a0:	18048d63          	beqz	s1,83a <vprintf+0x1bc>
 6a4:	8aaa                	mv	s5,a0
 6a6:	8b32                	mv	s6,a2
 6a8:	00158913          	addi	s2,a1,1
  state = 0;
 6ac:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6ae:	02500a13          	li	s4,37
      if(c == 'd'){
 6b2:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 6b6:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 6ba:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 6be:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6c2:	00000b97          	auipc	s7,0x0
 6c6:	3e6b8b93          	addi	s7,s7,998 # aa8 <digits>
 6ca:	a839                	j	6e8 <vprintf+0x6a>
        putc(fd, c);
 6cc:	85a6                	mv	a1,s1
 6ce:	8556                	mv	a0,s5
 6d0:	00000097          	auipc	ra,0x0
 6d4:	ee0080e7          	jalr	-288(ra) # 5b0 <putc>
 6d8:	a019                	j	6de <vprintf+0x60>
    } else if(state == '%'){
 6da:	01498f63          	beq	s3,s4,6f8 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6de:	0905                	addi	s2,s2,1
 6e0:	fff94483          	lbu	s1,-1(s2)
 6e4:	14048b63          	beqz	s1,83a <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 6e8:	0004879b          	sext.w	a5,s1
    if(state == 0){
 6ec:	fe0997e3          	bnez	s3,6da <vprintf+0x5c>
      if(c == '%'){
 6f0:	fd479ee3          	bne	a5,s4,6cc <vprintf+0x4e>
        state = '%';
 6f4:	89be                	mv	s3,a5
 6f6:	b7e5                	j	6de <vprintf+0x60>
      if(c == 'd'){
 6f8:	05878063          	beq	a5,s8,738 <vprintf+0xba>
      } else if(c == 'l') {
 6fc:	05978c63          	beq	a5,s9,754 <vprintf+0xd6>
      } else if(c == 'x') {
 700:	07a78863          	beq	a5,s10,770 <vprintf+0xf2>
      } else if(c == 'p') {
 704:	09b78463          	beq	a5,s11,78c <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 708:	07300713          	li	a4,115
 70c:	0ce78563          	beq	a5,a4,7d6 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 710:	06300713          	li	a4,99
 714:	0ee78c63          	beq	a5,a4,80c <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 718:	11478663          	beq	a5,s4,824 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 71c:	85d2                	mv	a1,s4
 71e:	8556                	mv	a0,s5
 720:	00000097          	auipc	ra,0x0
 724:	e90080e7          	jalr	-368(ra) # 5b0 <putc>
        putc(fd, c);
 728:	85a6                	mv	a1,s1
 72a:	8556                	mv	a0,s5
 72c:	00000097          	auipc	ra,0x0
 730:	e84080e7          	jalr	-380(ra) # 5b0 <putc>
      }
      state = 0;
 734:	4981                	li	s3,0
 736:	b765                	j	6de <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 738:	008b0493          	addi	s1,s6,8
 73c:	4685                	li	a3,1
 73e:	4629                	li	a2,10
 740:	000b2583          	lw	a1,0(s6)
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	e8c080e7          	jalr	-372(ra) # 5d2 <printint>
 74e:	8b26                	mv	s6,s1
      state = 0;
 750:	4981                	li	s3,0
 752:	b771                	j	6de <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 754:	008b0493          	addi	s1,s6,8
 758:	4681                	li	a3,0
 75a:	4629                	li	a2,10
 75c:	000b2583          	lw	a1,0(s6)
 760:	8556                	mv	a0,s5
 762:	00000097          	auipc	ra,0x0
 766:	e70080e7          	jalr	-400(ra) # 5d2 <printint>
 76a:	8b26                	mv	s6,s1
      state = 0;
 76c:	4981                	li	s3,0
 76e:	bf85                	j	6de <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 770:	008b0493          	addi	s1,s6,8
 774:	4681                	li	a3,0
 776:	4641                	li	a2,16
 778:	000b2583          	lw	a1,0(s6)
 77c:	8556                	mv	a0,s5
 77e:	00000097          	auipc	ra,0x0
 782:	e54080e7          	jalr	-428(ra) # 5d2 <printint>
 786:	8b26                	mv	s6,s1
      state = 0;
 788:	4981                	li	s3,0
 78a:	bf91                	j	6de <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 78c:	008b0793          	addi	a5,s6,8
 790:	f8f43423          	sd	a5,-120(s0)
 794:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 798:	03000593          	li	a1,48
 79c:	8556                	mv	a0,s5
 79e:	00000097          	auipc	ra,0x0
 7a2:	e12080e7          	jalr	-494(ra) # 5b0 <putc>
  putc(fd, 'x');
 7a6:	85ea                	mv	a1,s10
 7a8:	8556                	mv	a0,s5
 7aa:	00000097          	auipc	ra,0x0
 7ae:	e06080e7          	jalr	-506(ra) # 5b0 <putc>
 7b2:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 7b4:	03c9d793          	srli	a5,s3,0x3c
 7b8:	97de                	add	a5,a5,s7
 7ba:	0007c583          	lbu	a1,0(a5)
 7be:	8556                	mv	a0,s5
 7c0:	00000097          	auipc	ra,0x0
 7c4:	df0080e7          	jalr	-528(ra) # 5b0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7c8:	0992                	slli	s3,s3,0x4
 7ca:	34fd                	addiw	s1,s1,-1
 7cc:	f4e5                	bnez	s1,7b4 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 7ce:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7d2:	4981                	li	s3,0
 7d4:	b729                	j	6de <vprintf+0x60>
        s = va_arg(ap, char*);
 7d6:	008b0993          	addi	s3,s6,8
 7da:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 7de:	c085                	beqz	s1,7fe <vprintf+0x180>
        while(*s != 0){
 7e0:	0004c583          	lbu	a1,0(s1)
 7e4:	c9a1                	beqz	a1,834 <vprintf+0x1b6>
          putc(fd, *s);
 7e6:	8556                	mv	a0,s5
 7e8:	00000097          	auipc	ra,0x0
 7ec:	dc8080e7          	jalr	-568(ra) # 5b0 <putc>
          s++;
 7f0:	0485                	addi	s1,s1,1
        while(*s != 0){
 7f2:	0004c583          	lbu	a1,0(s1)
 7f6:	f9e5                	bnez	a1,7e6 <vprintf+0x168>
        s = va_arg(ap, char*);
 7f8:	8b4e                	mv	s6,s3
      state = 0;
 7fa:	4981                	li	s3,0
 7fc:	b5cd                	j	6de <vprintf+0x60>
          s = "(null)";
 7fe:	00000497          	auipc	s1,0x0
 802:	2c248493          	addi	s1,s1,706 # ac0 <digits+0x18>
        while(*s != 0){
 806:	02800593          	li	a1,40
 80a:	bff1                	j	7e6 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 80c:	008b0493          	addi	s1,s6,8
 810:	000b4583          	lbu	a1,0(s6)
 814:	8556                	mv	a0,s5
 816:	00000097          	auipc	ra,0x0
 81a:	d9a080e7          	jalr	-614(ra) # 5b0 <putc>
 81e:	8b26                	mv	s6,s1
      state = 0;
 820:	4981                	li	s3,0
 822:	bd75                	j	6de <vprintf+0x60>
        putc(fd, c);
 824:	85d2                	mv	a1,s4
 826:	8556                	mv	a0,s5
 828:	00000097          	auipc	ra,0x0
 82c:	d88080e7          	jalr	-632(ra) # 5b0 <putc>
      state = 0;
 830:	4981                	li	s3,0
 832:	b575                	j	6de <vprintf+0x60>
        s = va_arg(ap, char*);
 834:	8b4e                	mv	s6,s3
      state = 0;
 836:	4981                	li	s3,0
 838:	b55d                	j	6de <vprintf+0x60>
    }
  }
}
 83a:	70e6                	ld	ra,120(sp)
 83c:	7446                	ld	s0,112(sp)
 83e:	74a6                	ld	s1,104(sp)
 840:	7906                	ld	s2,96(sp)
 842:	69e6                	ld	s3,88(sp)
 844:	6a46                	ld	s4,80(sp)
 846:	6aa6                	ld	s5,72(sp)
 848:	6b06                	ld	s6,64(sp)
 84a:	7be2                	ld	s7,56(sp)
 84c:	7c42                	ld	s8,48(sp)
 84e:	7ca2                	ld	s9,40(sp)
 850:	7d02                	ld	s10,32(sp)
 852:	6de2                	ld	s11,24(sp)
 854:	6109                	addi	sp,sp,128
 856:	8082                	ret

0000000000000858 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 858:	715d                	addi	sp,sp,-80
 85a:	ec06                	sd	ra,24(sp)
 85c:	e822                	sd	s0,16(sp)
 85e:	1000                	addi	s0,sp,32
 860:	e010                	sd	a2,0(s0)
 862:	e414                	sd	a3,8(s0)
 864:	e818                	sd	a4,16(s0)
 866:	ec1c                	sd	a5,24(s0)
 868:	03043023          	sd	a6,32(s0)
 86c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 870:	8622                	mv	a2,s0
 872:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 876:	00000097          	auipc	ra,0x0
 87a:	e08080e7          	jalr	-504(ra) # 67e <vprintf>
}
 87e:	60e2                	ld	ra,24(sp)
 880:	6442                	ld	s0,16(sp)
 882:	6161                	addi	sp,sp,80
 884:	8082                	ret

0000000000000886 <printf>:

void
printf(const char *fmt, ...)
{
 886:	711d                	addi	sp,sp,-96
 888:	ec06                	sd	ra,24(sp)
 88a:	e822                	sd	s0,16(sp)
 88c:	1000                	addi	s0,sp,32
 88e:	e40c                	sd	a1,8(s0)
 890:	e810                	sd	a2,16(s0)
 892:	ec14                	sd	a3,24(s0)
 894:	f018                	sd	a4,32(s0)
 896:	f41c                	sd	a5,40(s0)
 898:	03043823          	sd	a6,48(s0)
 89c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 8a0:	00840613          	addi	a2,s0,8
 8a4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 8a8:	85aa                	mv	a1,a0
 8aa:	4505                	li	a0,1
 8ac:	00000097          	auipc	ra,0x0
 8b0:	dd2080e7          	jalr	-558(ra) # 67e <vprintf>
}
 8b4:	60e2                	ld	ra,24(sp)
 8b6:	6442                	ld	s0,16(sp)
 8b8:	6125                	addi	sp,sp,96
 8ba:	8082                	ret

00000000000008bc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8bc:	1141                	addi	sp,sp,-16
 8be:	e422                	sd	s0,8(sp)
 8c0:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8c2:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c6:	00000797          	auipc	a5,0x0
 8ca:	40278793          	addi	a5,a5,1026 # cc8 <freep>
 8ce:	639c                	ld	a5,0(a5)
 8d0:	a805                	j	900 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8d2:	4618                	lw	a4,8(a2)
 8d4:	9db9                	addw	a1,a1,a4
 8d6:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8da:	6398                	ld	a4,0(a5)
 8dc:	6318                	ld	a4,0(a4)
 8de:	fee53823          	sd	a4,-16(a0)
 8e2:	a091                	j	926 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8e4:	ff852703          	lw	a4,-8(a0)
 8e8:	9e39                	addw	a2,a2,a4
 8ea:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8ec:	ff053703          	ld	a4,-16(a0)
 8f0:	e398                	sd	a4,0(a5)
 8f2:	a099                	j	938 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f4:	6398                	ld	a4,0(a5)
 8f6:	00e7e463          	bltu	a5,a4,8fe <free+0x42>
 8fa:	00e6ea63          	bltu	a3,a4,90e <free+0x52>
{
 8fe:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 900:	fed7fae3          	bleu	a3,a5,8f4 <free+0x38>
 904:	6398                	ld	a4,0(a5)
 906:	00e6e463          	bltu	a3,a4,90e <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90a:	fee7eae3          	bltu	a5,a4,8fe <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 90e:	ff852583          	lw	a1,-8(a0)
 912:	6390                	ld	a2,0(a5)
 914:	02059713          	slli	a4,a1,0x20
 918:	9301                	srli	a4,a4,0x20
 91a:	0712                	slli	a4,a4,0x4
 91c:	9736                	add	a4,a4,a3
 91e:	fae60ae3          	beq	a2,a4,8d2 <free+0x16>
    bp->s.ptr = p->s.ptr;
 922:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 926:	4790                	lw	a2,8(a5)
 928:	02061713          	slli	a4,a2,0x20
 92c:	9301                	srli	a4,a4,0x20
 92e:	0712                	slli	a4,a4,0x4
 930:	973e                	add	a4,a4,a5
 932:	fae689e3          	beq	a3,a4,8e4 <free+0x28>
  } else
    p->s.ptr = bp;
 936:	e394                	sd	a3,0(a5)
  freep = p;
 938:	00000717          	auipc	a4,0x0
 93c:	38f73823          	sd	a5,912(a4) # cc8 <freep>
}
 940:	6422                	ld	s0,8(sp)
 942:	0141                	addi	sp,sp,16
 944:	8082                	ret

0000000000000946 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 946:	7139                	addi	sp,sp,-64
 948:	fc06                	sd	ra,56(sp)
 94a:	f822                	sd	s0,48(sp)
 94c:	f426                	sd	s1,40(sp)
 94e:	f04a                	sd	s2,32(sp)
 950:	ec4e                	sd	s3,24(sp)
 952:	e852                	sd	s4,16(sp)
 954:	e456                	sd	s5,8(sp)
 956:	e05a                	sd	s6,0(sp)
 958:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 95a:	02051993          	slli	s3,a0,0x20
 95e:	0209d993          	srli	s3,s3,0x20
 962:	09bd                	addi	s3,s3,15
 964:	0049d993          	srli	s3,s3,0x4
 968:	2985                	addiw	s3,s3,1
 96a:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 96e:	00000797          	auipc	a5,0x0
 972:	35a78793          	addi	a5,a5,858 # cc8 <freep>
 976:	6388                	ld	a0,0(a5)
 978:	c515                	beqz	a0,9a4 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 97c:	4798                	lw	a4,8(a5)
 97e:	03277d63          	bleu	s2,a4,9b8 <malloc+0x72>
 982:	8a4e                	mv	s4,s3
 984:	0009871b          	sext.w	a4,s3
 988:	6685                	lui	a3,0x1
 98a:	00d77363          	bleu	a3,a4,990 <malloc+0x4a>
 98e:	6a05                	lui	s4,0x1
 990:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 994:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 998:	00000497          	auipc	s1,0x0
 99c:	33048493          	addi	s1,s1,816 # cc8 <freep>
  if(p == (char*)-1)
 9a0:	5b7d                	li	s6,-1
 9a2:	a0b5                	j	a0e <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 9a4:	00000717          	auipc	a4,0x0
 9a8:	32c70713          	addi	a4,a4,812 # cd0 <base>
 9ac:	e398                	sd	a4,0(a5)
 9ae:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 9b0:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b4:	87ba                	mv	a5,a4
 9b6:	b7f1                	j	982 <malloc+0x3c>
      if(p->s.size == nunits)
 9b8:	02e90b63          	beq	s2,a4,9ee <malloc+0xa8>
        p->s.size -= nunits;
 9bc:	4137073b          	subw	a4,a4,s3
 9c0:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9c2:	1702                	slli	a4,a4,0x20
 9c4:	9301                	srli	a4,a4,0x20
 9c6:	0712                	slli	a4,a4,0x4
 9c8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9ca:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9ce:	00000717          	auipc	a4,0x0
 9d2:	2ea73d23          	sd	a0,762(a4) # cc8 <freep>
      return (void*)(p + 1);
 9d6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9da:	70e2                	ld	ra,56(sp)
 9dc:	7442                	ld	s0,48(sp)
 9de:	74a2                	ld	s1,40(sp)
 9e0:	7902                	ld	s2,32(sp)
 9e2:	69e2                	ld	s3,24(sp)
 9e4:	6a42                	ld	s4,16(sp)
 9e6:	6aa2                	ld	s5,8(sp)
 9e8:	6b02                	ld	s6,0(sp)
 9ea:	6121                	addi	sp,sp,64
 9ec:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9ee:	6398                	ld	a4,0(a5)
 9f0:	e118                	sd	a4,0(a0)
 9f2:	bff1                	j	9ce <malloc+0x88>
  hp->s.size = nu;
 9f4:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 9f8:	0541                	addi	a0,a0,16
 9fa:	00000097          	auipc	ra,0x0
 9fe:	ec2080e7          	jalr	-318(ra) # 8bc <free>
  return freep;
 a02:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 a04:	d979                	beqz	a0,9da <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a06:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a08:	4798                	lw	a4,8(a5)
 a0a:	fb2777e3          	bleu	s2,a4,9b8 <malloc+0x72>
    if(p == freep)
 a0e:	6098                	ld	a4,0(s1)
 a10:	853e                	mv	a0,a5
 a12:	fef71ae3          	bne	a4,a5,a06 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a16:	8552                	mv	a0,s4
 a18:	00000097          	auipc	ra,0x0
 a1c:	b38080e7          	jalr	-1224(ra) # 550 <sbrk>
  if(p == (char*)-1)
 a20:	fd651ae3          	bne	a0,s6,9f4 <malloc+0xae>
        return 0;
 a24:	4501                	li	a0,0
 a26:	bf55                	j	9da <malloc+0x94>
