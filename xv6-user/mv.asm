
xv6-user/_mv:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/fcntl.h"
#include "kernel/include/param.h"
#include "xv6-user/user.h"

int main(int argc, char *argv[])
{
   0:	d9010113          	addi	sp,sp,-624
   4:	26113423          	sd	ra,616(sp)
   8:	26813023          	sd	s0,608(sp)
   c:	24913c23          	sd	s1,600(sp)
  10:	25213823          	sd	s2,592(sp)
  14:	1c80                	addi	s0,sp,624
    if (argc < 3) {
  16:	4789                	li	a5,2
  18:	02a7c063          	blt	a5,a0,38 <main+0x38>
        fprintf(2, "Usage: mv old_name new_name\n");
  1c:	00001597          	auipc	a1,0x1
  20:	9dc58593          	addi	a1,a1,-1572 # 9f8 <malloc+0xe2>
  24:	4509                	li	a0,2
  26:	00001097          	auipc	ra,0x1
  2a:	802080e7          	jalr	-2046(ra) # 828 <fprintf>
        exit(1);
  2e:	4505                	li	a0,1
  30:	00000097          	auipc	ra,0x0
  34:	480080e7          	jalr	1152(ra) # 4b0 <exit>
  38:	84ae                	mv	s1,a1
    }

    char src[MAXPATH];
    char dst[MAXPATH];
    strcpy(src, argv[1]);
  3a:	658c                	ld	a1,8(a1)
  3c:	ed840513          	addi	a0,s0,-296
  40:	00000097          	auipc	ra,0x0
  44:	196080e7          	jalr	406(ra) # 1d6 <strcpy>
    strcpy(dst, argv[2]);
  48:	688c                	ld	a1,16(s1)
  4a:	dd040493          	addi	s1,s0,-560
  4e:	8526                	mv	a0,s1
  50:	00000097          	auipc	ra,0x0
  54:	186080e7          	jalr	390(ra) # 1d6 <strcpy>
    int fd = open(dst, O_RDONLY);
  58:	4581                	li	a1,0
  5a:	8526                	mv	a0,s1
  5c:	00000097          	auipc	ra,0x0
  60:	494080e7          	jalr	1172(ra) # 4f0 <open>
  64:	84aa                	mv	s1,a0
    if (fd >= 0) {
  66:	10054a63          	bltz	a0,17a <main+0x17a>
        struct stat st;
        fstat(fd, &st);
  6a:	d9840593          	addi	a1,s0,-616
  6e:	00000097          	auipc	ra,0x0
  72:	48a080e7          	jalr	1162(ra) # 4f8 <fstat>
        close(fd);
  76:	8526                	mv	a0,s1
  78:	00000097          	auipc	ra,0x0
  7c:	460080e7          	jalr	1120(ra) # 4d8 <close>
        if (st.type == T_DIR) {
  80:	dc041703          	lh	a4,-576(s0)
  84:	4785                	li	a5,1
  86:	02f70263          	beq	a4,a5,aa <main+0xaa>
                    fprintf(2, "mv: fail! final dst path too long (exceed MAX=%d)!\n", MAXPATH);
                    exit(-1);
                }
            }
        } else {
            fprintf(2, "mv: fail! %s exists!\n", dst);
  8a:	dd040613          	addi	a2,s0,-560
  8e:	00001597          	auipc	a1,0x1
  92:	9c258593          	addi	a1,a1,-1598 # a50 <malloc+0x13a>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	790080e7          	jalr	1936(ra) # 828 <fprintf>
            exit(-1);
  a0:	557d                	li	a0,-1
  a2:	00000097          	auipc	ra,0x0
  a6:	40e080e7          	jalr	1038(ra) # 4b0 <exit>
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  aa:	ed840913          	addi	s2,s0,-296
  ae:	854a                	mv	a0,s2
  b0:	00000097          	auipc	ra,0x0
  b4:	1a4080e7          	jalr	420(ra) # 254 <strlen>
  b8:	02051493          	slli	s1,a0,0x20
  bc:	9081                	srli	s1,s1,0x20
  be:	14fd                	addi	s1,s1,-1
  c0:	94ca                	add	s1,s1,s2
  c2:	0724e063          	bltu	s1,s2,122 <main+0x122>
                if (*ps != '/') {
  c6:	0004c703          	lbu	a4,0(s1)
  ca:	02f00793          	li	a5,47
  ce:	10f71163          	bne	a4,a5,1d0 <main+0x1d0>
  d2:	fff48793          	addi	a5,s1,-1
  d6:	ed740693          	addi	a3,s0,-297
  da:	02f00613          	li	a2,47
            for (ps = src + strlen(src) - 1; ps >= src; ps--) { // trim '/' in tail
  de:	84be                	mv	s1,a5
  e0:	04d78163          	beq	a5,a3,122 <main+0x122>
                if (*ps != '/') {
  e4:	17fd                	addi	a5,a5,-1
  e6:	0017c703          	lbu	a4,1(a5)
  ea:	fec70ae3          	beq	a4,a2,de <main+0xde>
                    *(ps + 1) = '\0';
  ee:	000480a3          	sb	zero,1(s1)
            for (; ps >= src && *ps != '/'; ps--);
  f2:	ed840793          	addi	a5,s0,-296
  f6:	02f4e663          	bltu	s1,a5,122 <main+0x122>
  fa:	0004c583          	lbu	a1,0(s1)
  fe:	02f00713          	li	a4,47
 102:	fff48793          	addi	a5,s1,-1
 106:	ed740693          	addi	a3,s0,-297
 10a:	02f00613          	li	a2,47
 10e:	00e58a63          	beq	a1,a4,122 <main+0x122>
 112:	84be                	mv	s1,a5
 114:	00d78763          	beq	a5,a3,122 <main+0x122>
 118:	17fd                	addi	a5,a5,-1
 11a:	0017c703          	lbu	a4,1(a5)
 11e:	fec71ae3          	bne	a4,a2,112 <main+0x112>
            ps++;
 122:	0485                	addi	s1,s1,1
            pd = dst + strlen(dst);
 124:	dd040913          	addi	s2,s0,-560
 128:	854a                	mv	a0,s2
 12a:	00000097          	auipc	ra,0x0
 12e:	12a080e7          	jalr	298(ra) # 254 <strlen>
 132:	1502                	slli	a0,a0,0x20
 134:	9101                	srli	a0,a0,0x20
 136:	992a                	add	s2,s2,a0
            *pd++ = '/';
 138:	00190793          	addi	a5,s2,1
 13c:	02f00713          	li	a4,47
 140:	00e90023          	sb	a4,0(s2)
                if (pd >= dst + MAXPATH) {
 144:	ed440693          	addi	a3,s0,-300
            while (*ps) {
 148:	0004c703          	lbu	a4,0(s1)
 14c:	c71d                	beqz	a4,17a <main+0x17a>
                *pd++ = *ps++;
 14e:	0485                	addi	s1,s1,1
 150:	0785                	addi	a5,a5,1
 152:	fee78fa3          	sb	a4,-1(a5)
                if (pd >= dst + MAXPATH) {
 156:	fed7e9e3          	bltu	a5,a3,148 <main+0x148>
                    fprintf(2, "mv: fail! final dst path too long (exceed MAX=%d)!\n", MAXPATH);
 15a:	10400613          	li	a2,260
 15e:	00001597          	auipc	a1,0x1
 162:	8ba58593          	addi	a1,a1,-1862 # a18 <malloc+0x102>
 166:	4509                	li	a0,2
 168:	00000097          	auipc	ra,0x0
 16c:	6c0080e7          	jalr	1728(ra) # 828 <fprintf>
                    exit(-1);
 170:	557d                	li	a0,-1
 172:	00000097          	auipc	ra,0x0
 176:	33e080e7          	jalr	830(ra) # 4b0 <exit>
        }
    }
    printf("moving [%s] to [%s]\n", src, dst);
 17a:	dd040913          	addi	s2,s0,-560
 17e:	864a                	mv	a2,s2
 180:	ed840493          	addi	s1,s0,-296
 184:	85a6                	mv	a1,s1
 186:	00001517          	auipc	a0,0x1
 18a:	8e250513          	addi	a0,a0,-1822 # a68 <malloc+0x152>
 18e:	00000097          	auipc	ra,0x0
 192:	6c8080e7          	jalr	1736(ra) # 856 <printf>
    if (rename(src, dst) < 0) {
 196:	85ca                	mv	a1,s2
 198:	8526                	mv	a0,s1
 19a:	00000097          	auipc	ra,0x0
 19e:	3d6080e7          	jalr	982(ra) # 570 <rename>
 1a2:	00054763          	bltz	a0,1b0 <main+0x1b0>
        fprintf(2, "mv: fail to rename %s to %s!\n", src, dst);
        exit(-1);
    }
    exit(0);
 1a6:	4501                	li	a0,0
 1a8:	00000097          	auipc	ra,0x0
 1ac:	308080e7          	jalr	776(ra) # 4b0 <exit>
        fprintf(2, "mv: fail to rename %s to %s!\n", src, dst);
 1b0:	86ca                	mv	a3,s2
 1b2:	8626                	mv	a2,s1
 1b4:	00001597          	auipc	a1,0x1
 1b8:	8cc58593          	addi	a1,a1,-1844 # a80 <malloc+0x16a>
 1bc:	4509                	li	a0,2
 1be:	00000097          	auipc	ra,0x0
 1c2:	66a080e7          	jalr	1642(ra) # 828 <fprintf>
        exit(-1);
 1c6:	557d                	li	a0,-1
 1c8:	00000097          	auipc	ra,0x0
 1cc:	2e8080e7          	jalr	744(ra) # 4b0 <exit>
                    *(ps + 1) = '\0';
 1d0:	000480a3          	sb	zero,1(s1)
            for (; ps >= src && *ps != '/'; ps--);
 1d4:	b71d                	j	fa <main+0xfa>

00000000000001d6 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1d6:	1141                	addi	sp,sp,-16
 1d8:	e422                	sd	s0,8(sp)
 1da:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1dc:	87aa                	mv	a5,a0
 1de:	0585                	addi	a1,a1,1
 1e0:	0785                	addi	a5,a5,1
 1e2:	fff5c703          	lbu	a4,-1(a1)
 1e6:	fee78fa3          	sb	a4,-1(a5)
 1ea:	fb75                	bnez	a4,1de <strcpy+0x8>
    ;
  return os;
}
 1ec:	6422                	ld	s0,8(sp)
 1ee:	0141                	addi	sp,sp,16
 1f0:	8082                	ret

00000000000001f2 <strcat>:

char*
strcat(char *s, const char *t)
{
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e422                	sd	s0,8(sp)
 1f6:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 1f8:	00054783          	lbu	a5,0(a0)
 1fc:	c385                	beqz	a5,21c <strcat+0x2a>
 1fe:	87aa                	mv	a5,a0
    s++;
 200:	0785                	addi	a5,a5,1
  while(*s)
 202:	0007c703          	lbu	a4,0(a5)
 206:	ff6d                	bnez	a4,200 <strcat+0xe>
  while((*s++ = *t++))
 208:	0585                	addi	a1,a1,1
 20a:	0785                	addi	a5,a5,1
 20c:	fff5c703          	lbu	a4,-1(a1)
 210:	fee78fa3          	sb	a4,-1(a5)
 214:	fb75                	bnez	a4,208 <strcat+0x16>
    ;
  return os;
}
 216:	6422                	ld	s0,8(sp)
 218:	0141                	addi	sp,sp,16
 21a:	8082                	ret
  while(*s)
 21c:	87aa                	mv	a5,a0
 21e:	b7ed                	j	208 <strcat+0x16>

0000000000000220 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 220:	1141                	addi	sp,sp,-16
 222:	e422                	sd	s0,8(sp)
 224:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 226:	00054783          	lbu	a5,0(a0)
 22a:	cf91                	beqz	a5,246 <strcmp+0x26>
 22c:	0005c703          	lbu	a4,0(a1)
 230:	00f71b63          	bne	a4,a5,246 <strcmp+0x26>
    p++, q++;
 234:	0505                	addi	a0,a0,1
 236:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 238:	00054783          	lbu	a5,0(a0)
 23c:	c789                	beqz	a5,246 <strcmp+0x26>
 23e:	0005c703          	lbu	a4,0(a1)
 242:	fef709e3          	beq	a4,a5,234 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
 246:	0005c503          	lbu	a0,0(a1)
}
 24a:	40a7853b          	subw	a0,a5,a0
 24e:	6422                	ld	s0,8(sp)
 250:	0141                	addi	sp,sp,16
 252:	8082                	ret

0000000000000254 <strlen>:

uint
strlen(const char *s)
{
 254:	1141                	addi	sp,sp,-16
 256:	e422                	sd	s0,8(sp)
 258:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 25a:	00054783          	lbu	a5,0(a0)
 25e:	cf91                	beqz	a5,27a <strlen+0x26>
 260:	0505                	addi	a0,a0,1
 262:	87aa                	mv	a5,a0
 264:	4685                	li	a3,1
 266:	9e89                	subw	a3,a3,a0
 268:	00f6853b          	addw	a0,a3,a5
 26c:	0785                	addi	a5,a5,1
 26e:	fff7c703          	lbu	a4,-1(a5)
 272:	fb7d                	bnez	a4,268 <strlen+0x14>
    ;
  return n;
}
 274:	6422                	ld	s0,8(sp)
 276:	0141                	addi	sp,sp,16
 278:	8082                	ret
  for(n = 0; s[n]; n++)
 27a:	4501                	li	a0,0
 27c:	bfe5                	j	274 <strlen+0x20>

000000000000027e <memset>:

void*
memset(void *dst, int c, uint n)
{
 27e:	1141                	addi	sp,sp,-16
 280:	e422                	sd	s0,8(sp)
 282:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 284:	ce09                	beqz	a2,29e <memset+0x20>
 286:	87aa                	mv	a5,a0
 288:	fff6071b          	addiw	a4,a2,-1
 28c:	1702                	slli	a4,a4,0x20
 28e:	9301                	srli	a4,a4,0x20
 290:	0705                	addi	a4,a4,1
 292:	972a                	add	a4,a4,a0
    cdst[i] = c;
 294:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 298:	0785                	addi	a5,a5,1
 29a:	fee79de3          	bne	a5,a4,294 <memset+0x16>
  }
  return dst;
}
 29e:	6422                	ld	s0,8(sp)
 2a0:	0141                	addi	sp,sp,16
 2a2:	8082                	ret

00000000000002a4 <strchr>:

char*
strchr(const char *s, char c)
{
 2a4:	1141                	addi	sp,sp,-16
 2a6:	e422                	sd	s0,8(sp)
 2a8:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2aa:	00054783          	lbu	a5,0(a0)
 2ae:	cf91                	beqz	a5,2ca <strchr+0x26>
    if(*s == c)
 2b0:	00f58a63          	beq	a1,a5,2c4 <strchr+0x20>
  for(; *s; s++)
 2b4:	0505                	addi	a0,a0,1
 2b6:	00054783          	lbu	a5,0(a0)
 2ba:	c781                	beqz	a5,2c2 <strchr+0x1e>
    if(*s == c)
 2bc:	feb79ce3          	bne	a5,a1,2b4 <strchr+0x10>
 2c0:	a011                	j	2c4 <strchr+0x20>
      return (char*)s;
  return 0;
 2c2:	4501                	li	a0,0
}
 2c4:	6422                	ld	s0,8(sp)
 2c6:	0141                	addi	sp,sp,16
 2c8:	8082                	ret
  return 0;
 2ca:	4501                	li	a0,0
 2cc:	bfe5                	j	2c4 <strchr+0x20>

00000000000002ce <gets>:

char*
gets(char *buf, int max)
{
 2ce:	711d                	addi	sp,sp,-96
 2d0:	ec86                	sd	ra,88(sp)
 2d2:	e8a2                	sd	s0,80(sp)
 2d4:	e4a6                	sd	s1,72(sp)
 2d6:	e0ca                	sd	s2,64(sp)
 2d8:	fc4e                	sd	s3,56(sp)
 2da:	f852                	sd	s4,48(sp)
 2dc:	f456                	sd	s5,40(sp)
 2de:	f05a                	sd	s6,32(sp)
 2e0:	ec5e                	sd	s7,24(sp)
 2e2:	e862                	sd	s8,16(sp)
 2e4:	1080                	addi	s0,sp,96
 2e6:	8c2a                	mv	s8,a0
 2e8:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ea:	892a                	mv	s2,a0
 2ec:	4981                	li	s3,0
    cc = read(0, &c, 1);
 2ee:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2f2:	4b29                	li	s6,10
 2f4:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
 2f6:	0019849b          	addiw	s1,s3,1
 2fa:	0344d763          	ble	s4,s1,328 <gets+0x5a>
    cc = read(0, &c, 1);
 2fe:	4605                	li	a2,1
 300:	85d6                	mv	a1,s5
 302:	4501                	li	a0,0
 304:	00000097          	auipc	ra,0x0
 308:	1c4080e7          	jalr	452(ra) # 4c8 <read>
    if(cc < 1)
 30c:	00a05e63          	blez	a0,328 <gets+0x5a>
    buf[i++] = c;
 310:	faf44783          	lbu	a5,-81(s0)
 314:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 318:	01678763          	beq	a5,s6,326 <gets+0x58>
 31c:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
 31e:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
 320:	fd779be3          	bne	a5,s7,2f6 <gets+0x28>
 324:	a011                	j	328 <gets+0x5a>
  for(i=0; i+1 < max; ){
 326:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 328:	99e2                	add	s3,s3,s8
 32a:	00098023          	sb	zero,0(s3)
  return buf;
}
 32e:	8562                	mv	a0,s8
 330:	60e6                	ld	ra,88(sp)
 332:	6446                	ld	s0,80(sp)
 334:	64a6                	ld	s1,72(sp)
 336:	6906                	ld	s2,64(sp)
 338:	79e2                	ld	s3,56(sp)
 33a:	7a42                	ld	s4,48(sp)
 33c:	7aa2                	ld	s5,40(sp)
 33e:	7b02                	ld	s6,32(sp)
 340:	6be2                	ld	s7,24(sp)
 342:	6c42                	ld	s8,16(sp)
 344:	6125                	addi	sp,sp,96
 346:	8082                	ret

0000000000000348 <stat>:

int
stat(const char *n, struct stat *st)
{
 348:	1101                	addi	sp,sp,-32
 34a:	ec06                	sd	ra,24(sp)
 34c:	e822                	sd	s0,16(sp)
 34e:	e426                	sd	s1,8(sp)
 350:	e04a                	sd	s2,0(sp)
 352:	1000                	addi	s0,sp,32
 354:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 356:	4581                	li	a1,0
 358:	00000097          	auipc	ra,0x0
 35c:	198080e7          	jalr	408(ra) # 4f0 <open>
  if(fd < 0)
 360:	02054563          	bltz	a0,38a <stat+0x42>
 364:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 366:	85ca                	mv	a1,s2
 368:	00000097          	auipc	ra,0x0
 36c:	190080e7          	jalr	400(ra) # 4f8 <fstat>
 370:	892a                	mv	s2,a0
  close(fd);
 372:	8526                	mv	a0,s1
 374:	00000097          	auipc	ra,0x0
 378:	164080e7          	jalr	356(ra) # 4d8 <close>
  return r;
}
 37c:	854a                	mv	a0,s2
 37e:	60e2                	ld	ra,24(sp)
 380:	6442                	ld	s0,16(sp)
 382:	64a2                	ld	s1,8(sp)
 384:	6902                	ld	s2,0(sp)
 386:	6105                	addi	sp,sp,32
 388:	8082                	ret
    return -1;
 38a:	597d                	li	s2,-1
 38c:	bfc5                	j	37c <stat+0x34>

000000000000038e <atoi>:

int
atoi(const char *s)
{
 38e:	1141                	addi	sp,sp,-16
 390:	e422                	sd	s0,8(sp)
 392:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 394:	00054703          	lbu	a4,0(a0)
 398:	02d00793          	li	a5,45
  int neg = 1;
 39c:	4805                	li	a6,1
  if (*s == '-') {
 39e:	04f70363          	beq	a4,a5,3e4 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3a2:	00054683          	lbu	a3,0(a0)
 3a6:	fd06879b          	addiw	a5,a3,-48
 3aa:	0ff7f793          	andi	a5,a5,255
 3ae:	4725                	li	a4,9
 3b0:	02f76d63          	bltu	a4,a5,3ea <atoi+0x5c>
  n = 0;
 3b4:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
 3b6:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3b8:	0505                	addi	a0,a0,1
 3ba:	0026179b          	slliw	a5,a2,0x2
 3be:	9fb1                	addw	a5,a5,a2
 3c0:	0017979b          	slliw	a5,a5,0x1
 3c4:	9fb5                	addw	a5,a5,a3
 3c6:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
 3ca:	00054683          	lbu	a3,0(a0)
 3ce:	fd06871b          	addiw	a4,a3,-48
 3d2:	0ff77713          	andi	a4,a4,255
 3d6:	fee5f1e3          	bleu	a4,a1,3b8 <atoi+0x2a>
  return n * neg;
}
 3da:	02c8053b          	mulw	a0,a6,a2
 3de:	6422                	ld	s0,8(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret
    s++;
 3e4:	0505                	addi	a0,a0,1
    neg = -1;
 3e6:	587d                	li	a6,-1
 3e8:	bf6d                	j	3a2 <atoi+0x14>
  n = 0;
 3ea:	4601                	li	a2,0
 3ec:	b7fd                	j	3da <atoi+0x4c>

00000000000003ee <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ee:	1141                	addi	sp,sp,-16
 3f0:	e422                	sd	s0,8(sp)
 3f2:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3f4:	02b57663          	bleu	a1,a0,420 <memmove+0x32>
    while(n-- > 0)
 3f8:	02c05163          	blez	a2,41a <memmove+0x2c>
 3fc:	fff6079b          	addiw	a5,a2,-1
 400:	1782                	slli	a5,a5,0x20
 402:	9381                	srli	a5,a5,0x20
 404:	0785                	addi	a5,a5,1
 406:	97aa                	add	a5,a5,a0
  dst = vdst;
 408:	872a                	mv	a4,a0
      *dst++ = *src++;
 40a:	0585                	addi	a1,a1,1
 40c:	0705                	addi	a4,a4,1
 40e:	fff5c683          	lbu	a3,-1(a1)
 412:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 416:	fee79ae3          	bne	a5,a4,40a <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 41a:	6422                	ld	s0,8(sp)
 41c:	0141                	addi	sp,sp,16
 41e:	8082                	ret
    dst += n;
 420:	00c50733          	add	a4,a0,a2
    src += n;
 424:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 426:	fec05ae3          	blez	a2,41a <memmove+0x2c>
 42a:	fff6079b          	addiw	a5,a2,-1
 42e:	1782                	slli	a5,a5,0x20
 430:	9381                	srli	a5,a5,0x20
 432:	fff7c793          	not	a5,a5
 436:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 438:	15fd                	addi	a1,a1,-1
 43a:	177d                	addi	a4,a4,-1
 43c:	0005c683          	lbu	a3,0(a1)
 440:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 444:	fef71ae3          	bne	a4,a5,438 <memmove+0x4a>
 448:	bfc9                	j	41a <memmove+0x2c>

000000000000044a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 44a:	1141                	addi	sp,sp,-16
 44c:	e422                	sd	s0,8(sp)
 44e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 450:	ce15                	beqz	a2,48c <memcmp+0x42>
 452:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
 456:	00054783          	lbu	a5,0(a0)
 45a:	0005c703          	lbu	a4,0(a1)
 45e:	02e79063          	bne	a5,a4,47e <memcmp+0x34>
 462:	1682                	slli	a3,a3,0x20
 464:	9281                	srli	a3,a3,0x20
 466:	0685                	addi	a3,a3,1
 468:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
 46a:	0505                	addi	a0,a0,1
    p2++;
 46c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 46e:	00d50d63          	beq	a0,a3,488 <memcmp+0x3e>
    if (*p1 != *p2) {
 472:	00054783          	lbu	a5,0(a0)
 476:	0005c703          	lbu	a4,0(a1)
 47a:	fee788e3          	beq	a5,a4,46a <memcmp+0x20>
      return *p1 - *p2;
 47e:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
 482:	6422                	ld	s0,8(sp)
 484:	0141                	addi	sp,sp,16
 486:	8082                	ret
  return 0;
 488:	4501                	li	a0,0
 48a:	bfe5                	j	482 <memcmp+0x38>
 48c:	4501                	li	a0,0
 48e:	bfd5                	j	482 <memcmp+0x38>

0000000000000490 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 490:	1141                	addi	sp,sp,-16
 492:	e406                	sd	ra,8(sp)
 494:	e022                	sd	s0,0(sp)
 496:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 498:	00000097          	auipc	ra,0x0
 49c:	f56080e7          	jalr	-170(ra) # 3ee <memmove>
}
 4a0:	60a2                	ld	ra,8(sp)
 4a2:	6402                	ld	s0,0(sp)
 4a4:	0141                	addi	sp,sp,16
 4a6:	8082                	ret

00000000000004a8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 4a8:	4885                	li	a7,1
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 4b0:	4889                	li	a7,2
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4b8:	488d                	li	a7,3
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4c0:	4891                	li	a7,4
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <read>:
.global read
read:
 li a7, SYS_read
 4c8:	4895                	li	a7,5
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <write>:
.global write
write:
 li a7, SYS_write
 4d0:	48c1                	li	a7,16
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <close>:
.global close
close:
 li a7, SYS_close
 4d8:	48d5                	li	a7,21
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4e0:	4899                	li	a7,6
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4e8:	489d                	li	a7,7
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <open>:
.global open
open:
 li a7, SYS_open
 4f0:	48bd                	li	a7,15
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4f8:	48a1                	li	a7,8
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 500:	48d1                	li	a7,20
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 508:	48a5                	li	a7,9
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <dup>:
.global dup
dup:
 li a7, SYS_dup
 510:	48a9                	li	a7,10
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 518:	48ad                	li	a7,11
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 520:	48b1                	li	a7,12
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 528:	48b5                	li	a7,13
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 530:	48b9                	li	a7,14
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 538:	48d9                	li	a7,22
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <dev>:
.global dev
dev:
 li a7, SYS_dev
 540:	48dd                	li	a7,23
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 548:	48e1                	li	a7,24
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 550:	48e5                	li	a7,25
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <remove>:
.global remove
remove:
 li a7, SYS_remove
 558:	48c5                	li	a7,17
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <trace>:
.global trace
trace:
 li a7, SYS_trace
 560:	48c9                	li	a7,18
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 568:	48cd                	li	a7,19
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <rename>:
.global rename
rename:
 li a7, SYS_rename
 570:	48e9                	li	a7,26
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
 578:	48ed                	li	a7,27
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 580:	1101                	addi	sp,sp,-32
 582:	ec06                	sd	ra,24(sp)
 584:	e822                	sd	s0,16(sp)
 586:	1000                	addi	s0,sp,32
 588:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 58c:	4605                	li	a2,1
 58e:	fef40593          	addi	a1,s0,-17
 592:	00000097          	auipc	ra,0x0
 596:	f3e080e7          	jalr	-194(ra) # 4d0 <write>
}
 59a:	60e2                	ld	ra,24(sp)
 59c:	6442                	ld	s0,16(sp)
 59e:	6105                	addi	sp,sp,32
 5a0:	8082                	ret

00000000000005a2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a2:	7139                	addi	sp,sp,-64
 5a4:	fc06                	sd	ra,56(sp)
 5a6:	f822                	sd	s0,48(sp)
 5a8:	f426                	sd	s1,40(sp)
 5aa:	f04a                	sd	s2,32(sp)
 5ac:	ec4e                	sd	s3,24(sp)
 5ae:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5b0:	c299                	beqz	a3,5b6 <printint+0x14>
 5b2:	0005ce63          	bltz	a1,5ce <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5b6:	2581                	sext.w	a1,a1
  neg = 0;
 5b8:	4301                	li	t1,0
  }

  i = 0;
 5ba:	fc040913          	addi	s2,s0,-64
  neg = 0;
 5be:	874a                	mv	a4,s2
  i = 0;
 5c0:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
 5c2:	2601                	sext.w	a2,a2
 5c4:	00000897          	auipc	a7,0x0
 5c8:	4dc88893          	addi	a7,a7,1244 # aa0 <digits>
 5cc:	a801                	j	5dc <printint+0x3a>
    x = -xx;
 5ce:	40b005bb          	negw	a1,a1
 5d2:	2581                	sext.w	a1,a1
    neg = 1;
 5d4:	4305                	li	t1,1
    x = -xx;
 5d6:	b7d5                	j	5ba <printint+0x18>
  }while((x /= base) != 0);
 5d8:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
 5da:	8836                	mv	a6,a3
 5dc:	0018069b          	addiw	a3,a6,1
 5e0:	02c5f7bb          	remuw	a5,a1,a2
 5e4:	1782                	slli	a5,a5,0x20
 5e6:	9381                	srli	a5,a5,0x20
 5e8:	97c6                	add	a5,a5,a7
 5ea:	0007c783          	lbu	a5,0(a5)
 5ee:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
 5f2:	0705                	addi	a4,a4,1
 5f4:	02c5d7bb          	divuw	a5,a1,a2
 5f8:	fec5f0e3          	bleu	a2,a1,5d8 <printint+0x36>
  if(neg)
 5fc:	00030b63          	beqz	t1,612 <printint+0x70>
    buf[i++] = '-';
 600:	fd040793          	addi	a5,s0,-48
 604:	96be                	add	a3,a3,a5
 606:	02d00793          	li	a5,45
 60a:	fef68823          	sb	a5,-16(a3)
 60e:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
 612:	02d05763          	blez	a3,640 <printint+0x9e>
 616:	89aa                	mv	s3,a0
 618:	fc040493          	addi	s1,s0,-64
 61c:	94b6                	add	s1,s1,a3
 61e:	197d                	addi	s2,s2,-1
 620:	9936                	add	s2,s2,a3
 622:	36fd                	addiw	a3,a3,-1
 624:	1682                	slli	a3,a3,0x20
 626:	9281                	srli	a3,a3,0x20
 628:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
 62c:	fff4c583          	lbu	a1,-1(s1)
 630:	854e                	mv	a0,s3
 632:	00000097          	auipc	ra,0x0
 636:	f4e080e7          	jalr	-178(ra) # 580 <putc>
  while(--i >= 0)
 63a:	14fd                	addi	s1,s1,-1
 63c:	ff2498e3          	bne	s1,s2,62c <printint+0x8a>
}
 640:	70e2                	ld	ra,56(sp)
 642:	7442                	ld	s0,48(sp)
 644:	74a2                	ld	s1,40(sp)
 646:	7902                	ld	s2,32(sp)
 648:	69e2                	ld	s3,24(sp)
 64a:	6121                	addi	sp,sp,64
 64c:	8082                	ret

000000000000064e <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 64e:	7119                	addi	sp,sp,-128
 650:	fc86                	sd	ra,120(sp)
 652:	f8a2                	sd	s0,112(sp)
 654:	f4a6                	sd	s1,104(sp)
 656:	f0ca                	sd	s2,96(sp)
 658:	ecce                	sd	s3,88(sp)
 65a:	e8d2                	sd	s4,80(sp)
 65c:	e4d6                	sd	s5,72(sp)
 65e:	e0da                	sd	s6,64(sp)
 660:	fc5e                	sd	s7,56(sp)
 662:	f862                	sd	s8,48(sp)
 664:	f466                	sd	s9,40(sp)
 666:	f06a                	sd	s10,32(sp)
 668:	ec6e                	sd	s11,24(sp)
 66a:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 66c:	0005c483          	lbu	s1,0(a1)
 670:	18048d63          	beqz	s1,80a <vprintf+0x1bc>
 674:	8aaa                	mv	s5,a0
 676:	8b32                	mv	s6,a2
 678:	00158913          	addi	s2,a1,1
  state = 0;
 67c:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 67e:	02500a13          	li	s4,37
      if(c == 'd'){
 682:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 686:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 68a:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 68e:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 692:	00000b97          	auipc	s7,0x0
 696:	40eb8b93          	addi	s7,s7,1038 # aa0 <digits>
 69a:	a839                	j	6b8 <vprintf+0x6a>
        putc(fd, c);
 69c:	85a6                	mv	a1,s1
 69e:	8556                	mv	a0,s5
 6a0:	00000097          	auipc	ra,0x0
 6a4:	ee0080e7          	jalr	-288(ra) # 580 <putc>
 6a8:	a019                	j	6ae <vprintf+0x60>
    } else if(state == '%'){
 6aa:	01498f63          	beq	s3,s4,6c8 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6ae:	0905                	addi	s2,s2,1
 6b0:	fff94483          	lbu	s1,-1(s2)
 6b4:	14048b63          	beqz	s1,80a <vprintf+0x1bc>
    c = fmt[i] & 0xff;
 6b8:	0004879b          	sext.w	a5,s1
    if(state == 0){
 6bc:	fe0997e3          	bnez	s3,6aa <vprintf+0x5c>
      if(c == '%'){
 6c0:	fd479ee3          	bne	a5,s4,69c <vprintf+0x4e>
        state = '%';
 6c4:	89be                	mv	s3,a5
 6c6:	b7e5                	j	6ae <vprintf+0x60>
      if(c == 'd'){
 6c8:	05878063          	beq	a5,s8,708 <vprintf+0xba>
      } else if(c == 'l') {
 6cc:	05978c63          	beq	a5,s9,724 <vprintf+0xd6>
      } else if(c == 'x') {
 6d0:	07a78863          	beq	a5,s10,740 <vprintf+0xf2>
      } else if(c == 'p') {
 6d4:	09b78463          	beq	a5,s11,75c <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 6d8:	07300713          	li	a4,115
 6dc:	0ce78563          	beq	a5,a4,7a6 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6e0:	06300713          	li	a4,99
 6e4:	0ee78c63          	beq	a5,a4,7dc <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 6e8:	11478663          	beq	a5,s4,7f4 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ec:	85d2                	mv	a1,s4
 6ee:	8556                	mv	a0,s5
 6f0:	00000097          	auipc	ra,0x0
 6f4:	e90080e7          	jalr	-368(ra) # 580 <putc>
        putc(fd, c);
 6f8:	85a6                	mv	a1,s1
 6fa:	8556                	mv	a0,s5
 6fc:	00000097          	auipc	ra,0x0
 700:	e84080e7          	jalr	-380(ra) # 580 <putc>
      }
      state = 0;
 704:	4981                	li	s3,0
 706:	b765                	j	6ae <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 708:	008b0493          	addi	s1,s6,8
 70c:	4685                	li	a3,1
 70e:	4629                	li	a2,10
 710:	000b2583          	lw	a1,0(s6)
 714:	8556                	mv	a0,s5
 716:	00000097          	auipc	ra,0x0
 71a:	e8c080e7          	jalr	-372(ra) # 5a2 <printint>
 71e:	8b26                	mv	s6,s1
      state = 0;
 720:	4981                	li	s3,0
 722:	b771                	j	6ae <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 724:	008b0493          	addi	s1,s6,8
 728:	4681                	li	a3,0
 72a:	4629                	li	a2,10
 72c:	000b2583          	lw	a1,0(s6)
 730:	8556                	mv	a0,s5
 732:	00000097          	auipc	ra,0x0
 736:	e70080e7          	jalr	-400(ra) # 5a2 <printint>
 73a:	8b26                	mv	s6,s1
      state = 0;
 73c:	4981                	li	s3,0
 73e:	bf85                	j	6ae <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 740:	008b0493          	addi	s1,s6,8
 744:	4681                	li	a3,0
 746:	4641                	li	a2,16
 748:	000b2583          	lw	a1,0(s6)
 74c:	8556                	mv	a0,s5
 74e:	00000097          	auipc	ra,0x0
 752:	e54080e7          	jalr	-428(ra) # 5a2 <printint>
 756:	8b26                	mv	s6,s1
      state = 0;
 758:	4981                	li	s3,0
 75a:	bf91                	j	6ae <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 75c:	008b0793          	addi	a5,s6,8
 760:	f8f43423          	sd	a5,-120(s0)
 764:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 768:	03000593          	li	a1,48
 76c:	8556                	mv	a0,s5
 76e:	00000097          	auipc	ra,0x0
 772:	e12080e7          	jalr	-494(ra) # 580 <putc>
  putc(fd, 'x');
 776:	85ea                	mv	a1,s10
 778:	8556                	mv	a0,s5
 77a:	00000097          	auipc	ra,0x0
 77e:	e06080e7          	jalr	-506(ra) # 580 <putc>
 782:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 784:	03c9d793          	srli	a5,s3,0x3c
 788:	97de                	add	a5,a5,s7
 78a:	0007c583          	lbu	a1,0(a5)
 78e:	8556                	mv	a0,s5
 790:	00000097          	auipc	ra,0x0
 794:	df0080e7          	jalr	-528(ra) # 580 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 798:	0992                	slli	s3,s3,0x4
 79a:	34fd                	addiw	s1,s1,-1
 79c:	f4e5                	bnez	s1,784 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 79e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7a2:	4981                	li	s3,0
 7a4:	b729                	j	6ae <vprintf+0x60>
        s = va_arg(ap, char*);
 7a6:	008b0993          	addi	s3,s6,8
 7aa:	000b3483          	ld	s1,0(s6)
        if(s == 0)
 7ae:	c085                	beqz	s1,7ce <vprintf+0x180>
        while(*s != 0){
 7b0:	0004c583          	lbu	a1,0(s1)
 7b4:	c9a1                	beqz	a1,804 <vprintf+0x1b6>
          putc(fd, *s);
 7b6:	8556                	mv	a0,s5
 7b8:	00000097          	auipc	ra,0x0
 7bc:	dc8080e7          	jalr	-568(ra) # 580 <putc>
          s++;
 7c0:	0485                	addi	s1,s1,1
        while(*s != 0){
 7c2:	0004c583          	lbu	a1,0(s1)
 7c6:	f9e5                	bnez	a1,7b6 <vprintf+0x168>
        s = va_arg(ap, char*);
 7c8:	8b4e                	mv	s6,s3
      state = 0;
 7ca:	4981                	li	s3,0
 7cc:	b5cd                	j	6ae <vprintf+0x60>
          s = "(null)";
 7ce:	00000497          	auipc	s1,0x0
 7d2:	2ea48493          	addi	s1,s1,746 # ab8 <digits+0x18>
        while(*s != 0){
 7d6:	02800593          	li	a1,40
 7da:	bff1                	j	7b6 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
 7dc:	008b0493          	addi	s1,s6,8
 7e0:	000b4583          	lbu	a1,0(s6)
 7e4:	8556                	mv	a0,s5
 7e6:	00000097          	auipc	ra,0x0
 7ea:	d9a080e7          	jalr	-614(ra) # 580 <putc>
 7ee:	8b26                	mv	s6,s1
      state = 0;
 7f0:	4981                	li	s3,0
 7f2:	bd75                	j	6ae <vprintf+0x60>
        putc(fd, c);
 7f4:	85d2                	mv	a1,s4
 7f6:	8556                	mv	a0,s5
 7f8:	00000097          	auipc	ra,0x0
 7fc:	d88080e7          	jalr	-632(ra) # 580 <putc>
      state = 0;
 800:	4981                	li	s3,0
 802:	b575                	j	6ae <vprintf+0x60>
        s = va_arg(ap, char*);
 804:	8b4e                	mv	s6,s3
      state = 0;
 806:	4981                	li	s3,0
 808:	b55d                	j	6ae <vprintf+0x60>
    }
  }
}
 80a:	70e6                	ld	ra,120(sp)
 80c:	7446                	ld	s0,112(sp)
 80e:	74a6                	ld	s1,104(sp)
 810:	7906                	ld	s2,96(sp)
 812:	69e6                	ld	s3,88(sp)
 814:	6a46                	ld	s4,80(sp)
 816:	6aa6                	ld	s5,72(sp)
 818:	6b06                	ld	s6,64(sp)
 81a:	7be2                	ld	s7,56(sp)
 81c:	7c42                	ld	s8,48(sp)
 81e:	7ca2                	ld	s9,40(sp)
 820:	7d02                	ld	s10,32(sp)
 822:	6de2                	ld	s11,24(sp)
 824:	6109                	addi	sp,sp,128
 826:	8082                	ret

0000000000000828 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 828:	715d                	addi	sp,sp,-80
 82a:	ec06                	sd	ra,24(sp)
 82c:	e822                	sd	s0,16(sp)
 82e:	1000                	addi	s0,sp,32
 830:	e010                	sd	a2,0(s0)
 832:	e414                	sd	a3,8(s0)
 834:	e818                	sd	a4,16(s0)
 836:	ec1c                	sd	a5,24(s0)
 838:	03043023          	sd	a6,32(s0)
 83c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 840:	8622                	mv	a2,s0
 842:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 846:	00000097          	auipc	ra,0x0
 84a:	e08080e7          	jalr	-504(ra) # 64e <vprintf>
}
 84e:	60e2                	ld	ra,24(sp)
 850:	6442                	ld	s0,16(sp)
 852:	6161                	addi	sp,sp,80
 854:	8082                	ret

0000000000000856 <printf>:

void
printf(const char *fmt, ...)
{
 856:	711d                	addi	sp,sp,-96
 858:	ec06                	sd	ra,24(sp)
 85a:	e822                	sd	s0,16(sp)
 85c:	1000                	addi	s0,sp,32
 85e:	e40c                	sd	a1,8(s0)
 860:	e810                	sd	a2,16(s0)
 862:	ec14                	sd	a3,24(s0)
 864:	f018                	sd	a4,32(s0)
 866:	f41c                	sd	a5,40(s0)
 868:	03043823          	sd	a6,48(s0)
 86c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 870:	00840613          	addi	a2,s0,8
 874:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 878:	85aa                	mv	a1,a0
 87a:	4505                	li	a0,1
 87c:	00000097          	auipc	ra,0x0
 880:	dd2080e7          	jalr	-558(ra) # 64e <vprintf>
}
 884:	60e2                	ld	ra,24(sp)
 886:	6442                	ld	s0,16(sp)
 888:	6125                	addi	sp,sp,96
 88a:	8082                	ret

000000000000088c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 88c:	1141                	addi	sp,sp,-16
 88e:	e422                	sd	s0,8(sp)
 890:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 892:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 896:	00000797          	auipc	a5,0x0
 89a:	22a78793          	addi	a5,a5,554 # ac0 <__bss_start>
 89e:	639c                	ld	a5,0(a5)
 8a0:	a805                	j	8d0 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8a2:	4618                	lw	a4,8(a2)
 8a4:	9db9                	addw	a1,a1,a4
 8a6:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8aa:	6398                	ld	a4,0(a5)
 8ac:	6318                	ld	a4,0(a4)
 8ae:	fee53823          	sd	a4,-16(a0)
 8b2:	a091                	j	8f6 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8b4:	ff852703          	lw	a4,-8(a0)
 8b8:	9e39                	addw	a2,a2,a4
 8ba:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 8bc:	ff053703          	ld	a4,-16(a0)
 8c0:	e398                	sd	a4,0(a5)
 8c2:	a099                	j	908 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c4:	6398                	ld	a4,0(a5)
 8c6:	00e7e463          	bltu	a5,a4,8ce <free+0x42>
 8ca:	00e6ea63          	bltu	a3,a4,8de <free+0x52>
{
 8ce:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d0:	fed7fae3          	bleu	a3,a5,8c4 <free+0x38>
 8d4:	6398                	ld	a4,0(a5)
 8d6:	00e6e463          	bltu	a3,a4,8de <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8da:	fee7eae3          	bltu	a5,a4,8ce <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
 8de:	ff852583          	lw	a1,-8(a0)
 8e2:	6390                	ld	a2,0(a5)
 8e4:	02059713          	slli	a4,a1,0x20
 8e8:	9301                	srli	a4,a4,0x20
 8ea:	0712                	slli	a4,a4,0x4
 8ec:	9736                	add	a4,a4,a3
 8ee:	fae60ae3          	beq	a2,a4,8a2 <free+0x16>
    bp->s.ptr = p->s.ptr;
 8f2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8f6:	4790                	lw	a2,8(a5)
 8f8:	02061713          	slli	a4,a2,0x20
 8fc:	9301                	srli	a4,a4,0x20
 8fe:	0712                	slli	a4,a4,0x4
 900:	973e                	add	a4,a4,a5
 902:	fae689e3          	beq	a3,a4,8b4 <free+0x28>
  } else
    p->s.ptr = bp;
 906:	e394                	sd	a3,0(a5)
  freep = p;
 908:	00000717          	auipc	a4,0x0
 90c:	1af73c23          	sd	a5,440(a4) # ac0 <__bss_start>
}
 910:	6422                	ld	s0,8(sp)
 912:	0141                	addi	sp,sp,16
 914:	8082                	ret

0000000000000916 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 916:	7139                	addi	sp,sp,-64
 918:	fc06                	sd	ra,56(sp)
 91a:	f822                	sd	s0,48(sp)
 91c:	f426                	sd	s1,40(sp)
 91e:	f04a                	sd	s2,32(sp)
 920:	ec4e                	sd	s3,24(sp)
 922:	e852                	sd	s4,16(sp)
 924:	e456                	sd	s5,8(sp)
 926:	e05a                	sd	s6,0(sp)
 928:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 92a:	02051993          	slli	s3,a0,0x20
 92e:	0209d993          	srli	s3,s3,0x20
 932:	09bd                	addi	s3,s3,15
 934:	0049d993          	srli	s3,s3,0x4
 938:	2985                	addiw	s3,s3,1
 93a:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
 93e:	00000797          	auipc	a5,0x0
 942:	18278793          	addi	a5,a5,386 # ac0 <__bss_start>
 946:	6388                	ld	a0,0(a5)
 948:	c515                	beqz	a0,974 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 94c:	4798                	lw	a4,8(a5)
 94e:	03277d63          	bleu	s2,a4,988 <malloc+0x72>
 952:	8a4e                	mv	s4,s3
 954:	0009871b          	sext.w	a4,s3
 958:	6685                	lui	a3,0x1
 95a:	00d77363          	bleu	a3,a4,960 <malloc+0x4a>
 95e:	6a05                	lui	s4,0x1
 960:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
 964:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 968:	00000497          	auipc	s1,0x0
 96c:	15848493          	addi	s1,s1,344 # ac0 <__bss_start>
  if(p == (char*)-1)
 970:	5b7d                	li	s6,-1
 972:	a0b5                	j	9de <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 974:	00000717          	auipc	a4,0x0
 978:	15470713          	addi	a4,a4,340 # ac8 <base>
 97c:	e398                	sd	a4,0(a5)
 97e:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 980:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 984:	87ba                	mv	a5,a4
 986:	b7f1                	j	952 <malloc+0x3c>
      if(p->s.size == nunits)
 988:	02e90b63          	beq	s2,a4,9be <malloc+0xa8>
        p->s.size -= nunits;
 98c:	4137073b          	subw	a4,a4,s3
 990:	c798                	sw	a4,8(a5)
        p += p->s.size;
 992:	1702                	slli	a4,a4,0x20
 994:	9301                	srli	a4,a4,0x20
 996:	0712                	slli	a4,a4,0x4
 998:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 99a:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 99e:	00000717          	auipc	a4,0x0
 9a2:	12a73123          	sd	a0,290(a4) # ac0 <__bss_start>
      return (void*)(p + 1);
 9a6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9aa:	70e2                	ld	ra,56(sp)
 9ac:	7442                	ld	s0,48(sp)
 9ae:	74a2                	ld	s1,40(sp)
 9b0:	7902                	ld	s2,32(sp)
 9b2:	69e2                	ld	s3,24(sp)
 9b4:	6a42                	ld	s4,16(sp)
 9b6:	6aa2                	ld	s5,8(sp)
 9b8:	6b02                	ld	s6,0(sp)
 9ba:	6121                	addi	sp,sp,64
 9bc:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9be:	6398                	ld	a4,0(a5)
 9c0:	e118                	sd	a4,0(a0)
 9c2:	bff1                	j	99e <malloc+0x88>
  hp->s.size = nu;
 9c4:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
 9c8:	0541                	addi	a0,a0,16
 9ca:	00000097          	auipc	ra,0x0
 9ce:	ec2080e7          	jalr	-318(ra) # 88c <free>
  return freep;
 9d2:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 9d4:	d979                	beqz	a0,9aa <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9d8:	4798                	lw	a4,8(a5)
 9da:	fb2777e3          	bleu	s2,a4,988 <malloc+0x72>
    if(p == freep)
 9de:	6098                	ld	a4,0(s1)
 9e0:	853e                	mv	a0,a5
 9e2:	fef71ae3          	bne	a4,a5,9d6 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9e6:	8552                	mv	a0,s4
 9e8:	00000097          	auipc	ra,0x0
 9ec:	b38080e7          	jalr	-1224(ra) # 520 <sbrk>
  if(p == (char*)-1)
 9f0:	fd651ae3          	bne	a0,s6,9c4 <malloc+0xae>
        return 0;
 9f4:	4501                	li	a0,0
 9f6:	bf55                	j	9aa <malloc+0x94>
