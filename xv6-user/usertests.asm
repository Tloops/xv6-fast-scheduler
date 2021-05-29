
xv6-user/_usertests:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <copyinstr1>:
}

// what if you pass ridiculous string pointers to system calls?
void
copyinstr1(char *s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };

  for(int ai = 0; ai < 2; ai++){
    uint64 addr = addrs[ai];

    int fd = open((char *)addr, O_CREATE|O_WRONLY);
       8:	20100593          	li	a1,513
       c:	4505                	li	a0,1
       e:	057e                	slli	a0,a0,0x1f
      10:	00005097          	auipc	ra,0x5
      14:	97a080e7          	jalr	-1670(ra) # 498a <open>
    if(fd >= 0){
      18:	02055063          	bgez	a0,38 <copyinstr1+0x38>
    int fd = open((char *)addr, O_CREATE|O_WRONLY);
      1c:	20100593          	li	a1,513
      20:	557d                	li	a0,-1
      22:	00005097          	auipc	ra,0x5
      26:	968080e7          	jalr	-1688(ra) # 498a <open>
    uint64 addr = addrs[ai];
      2a:	55fd                	li	a1,-1
    if(fd >= 0){
      2c:	00055863          	bgez	a0,3c <copyinstr1+0x3c>
      printf("open(%p) returned %d, not -1\n", addr, fd);
      exit(1);
    }
  }
}
      30:	60a2                	ld	ra,8(sp)
      32:	6402                	ld	s0,0(sp)
      34:	0141                	addi	sp,sp,16
      36:	8082                	ret
    uint64 addr = addrs[ai];
      38:	4585                	li	a1,1
      3a:	05fe                	slli	a1,a1,0x1f
      printf("open(%p) returned %d, not -1\n", addr, fd);
      3c:	862a                	mv	a2,a0
      3e:	00005517          	auipc	a0,0x5
      42:	e7250513          	addi	a0,a0,-398 # 4eb0 <malloc+0x100>
      46:	00005097          	auipc	ra,0x5
      4a:	caa080e7          	jalr	-854(ra) # 4cf0 <printf>
      exit(1);
      4e:	4505                	li	a0,1
      50:	00005097          	auipc	ra,0x5
      54:	8fa080e7          	jalr	-1798(ra) # 494a <exit>

0000000000000058 <validatetest>:
  } 
}

void
validatetest(char *s)
{
      58:	7139                	addi	sp,sp,-64
      5a:	fc06                	sd	ra,56(sp)
      5c:	f822                	sd	s0,48(sp)
      5e:	f426                	sd	s1,40(sp)
      60:	f04a                	sd	s2,32(sp)
      62:	ec4e                	sd	s3,24(sp)
      64:	e852                	sd	s4,16(sp)
      66:	e456                	sd	s5,8(sp)
      68:	e05a                	sd	s6,0(sp)
      6a:	0080                	addi	s0,sp,64
      6c:	8b2a                	mv	s6,a0
  int hi;
  uint64 p;

  hi = 1100*1024;
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      6e:	4481                	li	s1,0
    // try to crash the kernel by passing in a bad string pointer
    if(open((char*)p, O_RDONLY) != -1){
      70:	597d                	li	s2,-1
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      72:	6a05                	lui	s4,0x1
      74:	001149b7          	lui	s3,0x114
    if(open((char*)p, O_RDONLY) != -1){
      78:	4581                	li	a1,0
      7a:	8526                	mv	a0,s1
      7c:	00005097          	auipc	ra,0x5
      80:	90e080e7          	jalr	-1778(ra) # 498a <open>
      84:	01251f63          	bne	a0,s2,a2 <validatetest+0x4a>
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      88:	94d2                	add	s1,s1,s4
      8a:	ff3497e3          	bne	s1,s3,78 <validatetest+0x20>
      printf("%s: link should not succeed\n", s);
      printf("bad string:[%s]\n", (char*)p);
      exit(1);
    }
  }
}
      8e:	70e2                	ld	ra,56(sp)
      90:	7442                	ld	s0,48(sp)
      92:	74a2                	ld	s1,40(sp)
      94:	7902                	ld	s2,32(sp)
      96:	69e2                	ld	s3,24(sp)
      98:	6a42                	ld	s4,16(sp)
      9a:	6aa2                	ld	s5,8(sp)
      9c:	6b02                	ld	s6,0(sp)
      9e:	6121                	addi	sp,sp,64
      a0:	8082                	ret
      printf("%s: link should not succeed\n", s);
      a2:	85da                	mv	a1,s6
      a4:	00005517          	auipc	a0,0x5
      a8:	e2c50513          	addi	a0,a0,-468 # 4ed0 <malloc+0x120>
      ac:	00005097          	auipc	ra,0x5
      b0:	c44080e7          	jalr	-956(ra) # 4cf0 <printf>
      printf("bad string:[%s]\n", (char*)p);
      b4:	85a6                	mv	a1,s1
      b6:	00005517          	auipc	a0,0x5
      ba:	e3a50513          	addi	a0,a0,-454 # 4ef0 <malloc+0x140>
      be:	00005097          	auipc	ra,0x5
      c2:	c32080e7          	jalr	-974(ra) # 4cf0 <printf>
      exit(1);
      c6:	4505                	li	a0,1
      c8:	00005097          	auipc	ra,0x5
      cc:	882080e7          	jalr	-1918(ra) # 494a <exit>

00000000000000d0 <bsstest>:
bsstest(char *s)
{
  int i;

  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      d0:	00008797          	auipc	a5,0x8
      d4:	0887c783          	lbu	a5,136(a5) # 8158 <uninit>
      d8:	e385                	bnez	a5,f8 <bsstest+0x28>
      da:	00008797          	auipc	a5,0x8
      de:	07f78793          	addi	a5,a5,127 # 8159 <uninit+0x1>
      e2:	0000a697          	auipc	a3,0xa
      e6:	78668693          	addi	a3,a3,1926 # a868 <buf>
      ea:	0007c703          	lbu	a4,0(a5)
      ee:	e709                	bnez	a4,f8 <bsstest+0x28>
  for(i = 0; i < sizeof(uninit); i++){
      f0:	0785                	addi	a5,a5,1
      f2:	fed79ce3          	bne	a5,a3,ea <bsstest+0x1a>
      f6:	8082                	ret
{
      f8:	1141                	addi	sp,sp,-16
      fa:	e406                	sd	ra,8(sp)
      fc:	e022                	sd	s0,0(sp)
      fe:	0800                	addi	s0,sp,16
     100:	85aa                	mv	a1,a0
      printf("%s: bss test failed\n", s);
     102:	00005517          	auipc	a0,0x5
     106:	e0650513          	addi	a0,a0,-506 # 4f08 <malloc+0x158>
     10a:	00005097          	auipc	ra,0x5
     10e:	be6080e7          	jalr	-1050(ra) # 4cf0 <printf>
      exit(1);
     112:	4505                	li	a0,1
     114:	00005097          	auipc	ra,0x5
     118:	836080e7          	jalr	-1994(ra) # 494a <exit>

000000000000011c <opentest>:
{
     11c:	1101                	addi	sp,sp,-32
     11e:	ec06                	sd	ra,24(sp)
     120:	e822                	sd	s0,16(sp)
     122:	e426                	sd	s1,8(sp)
     124:	1000                	addi	s0,sp,32
     126:	84aa                	mv	s1,a0
  fd = open("echo", 0);
     128:	4581                	li	a1,0
     12a:	00005517          	auipc	a0,0x5
     12e:	df650513          	addi	a0,a0,-522 # 4f20 <malloc+0x170>
     132:	00005097          	auipc	ra,0x5
     136:	858080e7          	jalr	-1960(ra) # 498a <open>
  if(fd < 0){
     13a:	02054663          	bltz	a0,166 <opentest+0x4a>
  close(fd);
     13e:	00005097          	auipc	ra,0x5
     142:	834080e7          	jalr	-1996(ra) # 4972 <close>
  fd = open("doesnotexist", 0);
     146:	4581                	li	a1,0
     148:	00005517          	auipc	a0,0x5
     14c:	df850513          	addi	a0,a0,-520 # 4f40 <malloc+0x190>
     150:	00005097          	auipc	ra,0x5
     154:	83a080e7          	jalr	-1990(ra) # 498a <open>
  if(fd >= 0){
     158:	02055563          	bgez	a0,182 <opentest+0x66>
}
     15c:	60e2                	ld	ra,24(sp)
     15e:	6442                	ld	s0,16(sp)
     160:	64a2                	ld	s1,8(sp)
     162:	6105                	addi	sp,sp,32
     164:	8082                	ret
    printf("%s: open echo failed!\n", s);
     166:	85a6                	mv	a1,s1
     168:	00005517          	auipc	a0,0x5
     16c:	dc050513          	addi	a0,a0,-576 # 4f28 <malloc+0x178>
     170:	00005097          	auipc	ra,0x5
     174:	b80080e7          	jalr	-1152(ra) # 4cf0 <printf>
    exit(1);
     178:	4505                	li	a0,1
     17a:	00004097          	auipc	ra,0x4
     17e:	7d0080e7          	jalr	2000(ra) # 494a <exit>
    printf("%s: open doesnotexist succeeded!\n", s);
     182:	85a6                	mv	a1,s1
     184:	00005517          	auipc	a0,0x5
     188:	dcc50513          	addi	a0,a0,-564 # 4f50 <malloc+0x1a0>
     18c:	00005097          	auipc	ra,0x5
     190:	b64080e7          	jalr	-1180(ra) # 4cf0 <printf>
    exit(1);
     194:	4505                	li	a0,1
     196:	00004097          	auipc	ra,0x4
     19a:	7b4080e7          	jalr	1972(ra) # 494a <exit>

000000000000019e <truncate2>:
{
     19e:	7179                	addi	sp,sp,-48
     1a0:	f406                	sd	ra,40(sp)
     1a2:	f022                	sd	s0,32(sp)
     1a4:	ec26                	sd	s1,24(sp)
     1a6:	e84a                	sd	s2,16(sp)
     1a8:	e44e                	sd	s3,8(sp)
     1aa:	1800                	addi	s0,sp,48
     1ac:	89aa                	mv	s3,a0
  remove("truncfile");
     1ae:	00005517          	auipc	a0,0x5
     1b2:	dca50513          	addi	a0,a0,-566 # 4f78 <malloc+0x1c8>
     1b6:	00005097          	auipc	ra,0x5
     1ba:	83c080e7          	jalr	-1988(ra) # 49f2 <remove>
  int fd1 = open("truncfile", O_CREATE|O_TRUNC|O_WRONLY);
     1be:	60100593          	li	a1,1537
     1c2:	00005517          	auipc	a0,0x5
     1c6:	db650513          	addi	a0,a0,-586 # 4f78 <malloc+0x1c8>
     1ca:	00004097          	auipc	ra,0x4
     1ce:	7c0080e7          	jalr	1984(ra) # 498a <open>
     1d2:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     1d4:	4611                	li	a2,4
     1d6:	00005597          	auipc	a1,0x5
     1da:	db258593          	addi	a1,a1,-590 # 4f88 <malloc+0x1d8>
     1de:	00004097          	auipc	ra,0x4
     1e2:	78c080e7          	jalr	1932(ra) # 496a <write>
  int fd2 = open("truncfile", O_TRUNC|O_WRONLY);
     1e6:	40100593          	li	a1,1025
     1ea:	00005517          	auipc	a0,0x5
     1ee:	d8e50513          	addi	a0,a0,-626 # 4f78 <malloc+0x1c8>
     1f2:	00004097          	auipc	ra,0x4
     1f6:	798080e7          	jalr	1944(ra) # 498a <open>
     1fa:	892a                	mv	s2,a0
  int n = write(fd1, "x", 1);
     1fc:	4605                	li	a2,1
     1fe:	00005597          	auipc	a1,0x5
     202:	d9258593          	addi	a1,a1,-622 # 4f90 <malloc+0x1e0>
     206:	8526                	mv	a0,s1
     208:	00004097          	auipc	ra,0x4
     20c:	762080e7          	jalr	1890(ra) # 496a <write>
  if(n != -1){
     210:	57fd                	li	a5,-1
     212:	02f51b63          	bne	a0,a5,248 <truncate2+0xaa>
  remove("truncfile");
     216:	00005517          	auipc	a0,0x5
     21a:	d6250513          	addi	a0,a0,-670 # 4f78 <malloc+0x1c8>
     21e:	00004097          	auipc	ra,0x4
     222:	7d4080e7          	jalr	2004(ra) # 49f2 <remove>
  close(fd1);
     226:	8526                	mv	a0,s1
     228:	00004097          	auipc	ra,0x4
     22c:	74a080e7          	jalr	1866(ra) # 4972 <close>
  close(fd2);
     230:	854a                	mv	a0,s2
     232:	00004097          	auipc	ra,0x4
     236:	740080e7          	jalr	1856(ra) # 4972 <close>
}
     23a:	70a2                	ld	ra,40(sp)
     23c:	7402                	ld	s0,32(sp)
     23e:	64e2                	ld	s1,24(sp)
     240:	6942                	ld	s2,16(sp)
     242:	69a2                	ld	s3,8(sp)
     244:	6145                	addi	sp,sp,48
     246:	8082                	ret
    printf("%s: write returned %d, expected -1\n", s, n);
     248:	862a                	mv	a2,a0
     24a:	85ce                	mv	a1,s3
     24c:	00005517          	auipc	a0,0x5
     250:	d4c50513          	addi	a0,a0,-692 # 4f98 <malloc+0x1e8>
     254:	00005097          	auipc	ra,0x5
     258:	a9c080e7          	jalr	-1380(ra) # 4cf0 <printf>
    exit(1);
     25c:	4505                	li	a0,1
     25e:	00004097          	auipc	ra,0x4
     262:	6ec080e7          	jalr	1772(ra) # 494a <exit>

0000000000000266 <createtest>:
{
     266:	7179                	addi	sp,sp,-48
     268:	f406                	sd	ra,40(sp)
     26a:	f022                	sd	s0,32(sp)
     26c:	ec26                	sd	s1,24(sp)
     26e:	e84a                	sd	s2,16(sp)
     270:	e44e                	sd	s3,8(sp)
     272:	1800                	addi	s0,sp,48
  name[0] = 'a';
     274:	00007797          	auipc	a5,0x7
     278:	dd478793          	addi	a5,a5,-556 # 7048 <_edata>
     27c:	06100713          	li	a4,97
     280:	00e78023          	sb	a4,0(a5)
  name[2] = '\0';
     284:	00078123          	sb	zero,2(a5)
     288:	03000493          	li	s1,48
    name[1] = '0' + i;
     28c:	893e                	mv	s2,a5
  for(i = 0; i < N; i++){
     28e:	06400993          	li	s3,100
    name[1] = '0' + i;
     292:	009900a3          	sb	s1,1(s2)
    fd = open(name, O_CREATE|O_RDWR);
     296:	20200593          	li	a1,514
     29a:	854a                	mv	a0,s2
     29c:	00004097          	auipc	ra,0x4
     2a0:	6ee080e7          	jalr	1774(ra) # 498a <open>
    close(fd);
     2a4:	00004097          	auipc	ra,0x4
     2a8:	6ce080e7          	jalr	1742(ra) # 4972 <close>
  for(i = 0; i < N; i++){
     2ac:	2485                	addiw	s1,s1,1
     2ae:	0ff4f493          	andi	s1,s1,255
     2b2:	ff3490e3          	bne	s1,s3,292 <createtest+0x2c>
  name[0] = 'a';
     2b6:	00007797          	auipc	a5,0x7
     2ba:	d9278793          	addi	a5,a5,-622 # 7048 <_edata>
     2be:	06100713          	li	a4,97
     2c2:	00e78023          	sb	a4,0(a5)
  name[2] = '\0';
     2c6:	00078123          	sb	zero,2(a5)
     2ca:	03000493          	li	s1,48
    name[1] = '0' + i;
     2ce:	893e                	mv	s2,a5
  for(i = 0; i < N; i++){
     2d0:	06400993          	li	s3,100
    name[1] = '0' + i;
     2d4:	009900a3          	sb	s1,1(s2)
    remove(name);
     2d8:	854a                	mv	a0,s2
     2da:	00004097          	auipc	ra,0x4
     2de:	718080e7          	jalr	1816(ra) # 49f2 <remove>
  for(i = 0; i < N; i++){
     2e2:	2485                	addiw	s1,s1,1
     2e4:	0ff4f493          	andi	s1,s1,255
     2e8:	ff3496e3          	bne	s1,s3,2d4 <createtest+0x6e>
}
     2ec:	70a2                	ld	ra,40(sp)
     2ee:	7402                	ld	s0,32(sp)
     2f0:	64e2                	ld	s1,24(sp)
     2f2:	6942                	ld	s2,16(sp)
     2f4:	69a2                	ld	s3,8(sp)
     2f6:	6145                	addi	sp,sp,48
     2f8:	8082                	ret

00000000000002fa <bigwrite>:
{
     2fa:	715d                	addi	sp,sp,-80
     2fc:	e486                	sd	ra,72(sp)
     2fe:	e0a2                	sd	s0,64(sp)
     300:	fc26                	sd	s1,56(sp)
     302:	f84a                	sd	s2,48(sp)
     304:	f44e                	sd	s3,40(sp)
     306:	f052                	sd	s4,32(sp)
     308:	ec56                	sd	s5,24(sp)
     30a:	e85a                	sd	s6,16(sp)
     30c:	e45e                	sd	s7,8(sp)
     30e:	0880                	addi	s0,sp,80
     310:	8baa                	mv	s7,a0
  remove("bigwrite");
     312:	00005517          	auipc	a0,0x5
     316:	cae50513          	addi	a0,a0,-850 # 4fc0 <malloc+0x210>
     31a:	00004097          	auipc	ra,0x4
     31e:	6d8080e7          	jalr	1752(ra) # 49f2 <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     322:	1f300493          	li	s1,499
    fd = open("bigwrite", O_CREATE | O_RDWR);
     326:	00005a17          	auipc	s4,0x5
     32a:	c9aa0a13          	addi	s4,s4,-870 # 4fc0 <malloc+0x210>
      int cc = write(fd, buf, sz);
     32e:	0000a997          	auipc	s3,0xa
     332:	53a98993          	addi	s3,s3,1338 # a868 <buf>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     336:	6b09                	lui	s6,0x2
     338:	807b0b13          	addi	s6,s6,-2041 # 1807 <forkfork+0x2f>
    fd = open("bigwrite", O_CREATE | O_RDWR);
     33c:	20200593          	li	a1,514
     340:	8552                	mv	a0,s4
     342:	00004097          	auipc	ra,0x4
     346:	648080e7          	jalr	1608(ra) # 498a <open>
     34a:	892a                	mv	s2,a0
    if(fd < 0){
     34c:	04054d63          	bltz	a0,3a6 <bigwrite+0xac>
      int cc = write(fd, buf, sz);
     350:	8626                	mv	a2,s1
     352:	85ce                	mv	a1,s3
     354:	00004097          	auipc	ra,0x4
     358:	616080e7          	jalr	1558(ra) # 496a <write>
     35c:	8aaa                	mv	s5,a0
      if(cc != sz){
     35e:	06a49463          	bne	s1,a0,3c6 <bigwrite+0xcc>
      int cc = write(fd, buf, sz);
     362:	8626                	mv	a2,s1
     364:	85ce                	mv	a1,s3
     366:	854a                	mv	a0,s2
     368:	00004097          	auipc	ra,0x4
     36c:	602080e7          	jalr	1538(ra) # 496a <write>
      if(cc != sz){
     370:	04951963          	bne	a0,s1,3c2 <bigwrite+0xc8>
    close(fd);
     374:	854a                	mv	a0,s2
     376:	00004097          	auipc	ra,0x4
     37a:	5fc080e7          	jalr	1532(ra) # 4972 <close>
    remove("bigwrite");
     37e:	8552                	mv	a0,s4
     380:	00004097          	auipc	ra,0x4
     384:	672080e7          	jalr	1650(ra) # 49f2 <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     388:	1d74849b          	addiw	s1,s1,471
     38c:	fb6498e3          	bne	s1,s6,33c <bigwrite+0x42>
}
     390:	60a6                	ld	ra,72(sp)
     392:	6406                	ld	s0,64(sp)
     394:	74e2                	ld	s1,56(sp)
     396:	7942                	ld	s2,48(sp)
     398:	79a2                	ld	s3,40(sp)
     39a:	7a02                	ld	s4,32(sp)
     39c:	6ae2                	ld	s5,24(sp)
     39e:	6b42                	ld	s6,16(sp)
     3a0:	6ba2                	ld	s7,8(sp)
     3a2:	6161                	addi	sp,sp,80
     3a4:	8082                	ret
      printf("%s: cannot create bigwrite\n", s);
     3a6:	85de                	mv	a1,s7
     3a8:	00005517          	auipc	a0,0x5
     3ac:	c2850513          	addi	a0,a0,-984 # 4fd0 <malloc+0x220>
     3b0:	00005097          	auipc	ra,0x5
     3b4:	940080e7          	jalr	-1728(ra) # 4cf0 <printf>
      exit(1);
     3b8:	4505                	li	a0,1
     3ba:	00004097          	auipc	ra,0x4
     3be:	590080e7          	jalr	1424(ra) # 494a <exit>
     3c2:	84d6                	mv	s1,s5
      int cc = write(fd, buf, sz);
     3c4:	8aaa                	mv	s5,a0
        printf("%s: write(%d) ret %d\n", s, sz, cc);
     3c6:	86d6                	mv	a3,s5
     3c8:	8626                	mv	a2,s1
     3ca:	85de                	mv	a1,s7
     3cc:	00005517          	auipc	a0,0x5
     3d0:	c2450513          	addi	a0,a0,-988 # 4ff0 <malloc+0x240>
     3d4:	00005097          	auipc	ra,0x5
     3d8:	91c080e7          	jalr	-1764(ra) # 4cf0 <printf>
        exit(1);
     3dc:	4505                	li	a0,1
     3de:	00004097          	auipc	ra,0x4
     3e2:	56c080e7          	jalr	1388(ra) # 494a <exit>

00000000000003e6 <badwrite>:
// file is deleted? if the kernel has this bug, it will panic: balloc:
// out of blocks. assumed_free may need to be raised to be more than
// the number of free blocks. this test takes a long time.
void
badwrite(char *s)
{
     3e6:	7179                	addi	sp,sp,-48
     3e8:	f406                	sd	ra,40(sp)
     3ea:	f022                	sd	s0,32(sp)
     3ec:	ec26                	sd	s1,24(sp)
     3ee:	e84a                	sd	s2,16(sp)
     3f0:	e44e                	sd	s3,8(sp)
     3f2:	e052                	sd	s4,0(sp)
     3f4:	1800                	addi	s0,sp,48
  int assumed_free = 600;
  
  remove("junk");
     3f6:	00005517          	auipc	a0,0x5
     3fa:	c1250513          	addi	a0,a0,-1006 # 5008 <malloc+0x258>
     3fe:	00004097          	auipc	ra,0x4
     402:	5f4080e7          	jalr	1524(ra) # 49f2 <remove>
     406:	25800913          	li	s2,600
  for(int i = 0; i < assumed_free; i++){
    int fd = open("junk", O_CREATE|O_WRONLY);
     40a:	00005997          	auipc	s3,0x5
     40e:	bfe98993          	addi	s3,s3,-1026 # 5008 <malloc+0x258>
    if(fd < 0){
      printf("open junk failed\n");
      exit(1);
    }
    write(fd, (char*)0xffffffffffL, 1);
     412:	5a7d                	li	s4,-1
     414:	018a5a13          	srli	s4,s4,0x18
    int fd = open("junk", O_CREATE|O_WRONLY);
     418:	20100593          	li	a1,513
     41c:	854e                	mv	a0,s3
     41e:	00004097          	auipc	ra,0x4
     422:	56c080e7          	jalr	1388(ra) # 498a <open>
     426:	84aa                	mv	s1,a0
    if(fd < 0){
     428:	06054b63          	bltz	a0,49e <badwrite+0xb8>
    write(fd, (char*)0xffffffffffL, 1);
     42c:	4605                	li	a2,1
     42e:	85d2                	mv	a1,s4
     430:	00004097          	auipc	ra,0x4
     434:	53a080e7          	jalr	1338(ra) # 496a <write>
    close(fd);
     438:	8526                	mv	a0,s1
     43a:	00004097          	auipc	ra,0x4
     43e:	538080e7          	jalr	1336(ra) # 4972 <close>
    remove("junk");
     442:	854e                	mv	a0,s3
     444:	00004097          	auipc	ra,0x4
     448:	5ae080e7          	jalr	1454(ra) # 49f2 <remove>
  for(int i = 0; i < assumed_free; i++){
     44c:	397d                	addiw	s2,s2,-1
     44e:	fc0915e3          	bnez	s2,418 <badwrite+0x32>
  }

  int fd = open("junk", O_CREATE|O_WRONLY);
     452:	20100593          	li	a1,513
     456:	00005517          	auipc	a0,0x5
     45a:	bb250513          	addi	a0,a0,-1102 # 5008 <malloc+0x258>
     45e:	00004097          	auipc	ra,0x4
     462:	52c080e7          	jalr	1324(ra) # 498a <open>
     466:	84aa                	mv	s1,a0
  if(fd < 0){
     468:	04054863          	bltz	a0,4b8 <badwrite+0xd2>
    printf("open junk failed\n");
    exit(1);
  }
  if(write(fd, "x", 1) != 1){
     46c:	4605                	li	a2,1
     46e:	00005597          	auipc	a1,0x5
     472:	b2258593          	addi	a1,a1,-1246 # 4f90 <malloc+0x1e0>
     476:	00004097          	auipc	ra,0x4
     47a:	4f4080e7          	jalr	1268(ra) # 496a <write>
     47e:	4785                	li	a5,1
     480:	04f50963          	beq	a0,a5,4d2 <badwrite+0xec>
    printf("write failed\n");
     484:	00005517          	auipc	a0,0x5
     488:	ba450513          	addi	a0,a0,-1116 # 5028 <malloc+0x278>
     48c:	00005097          	auipc	ra,0x5
     490:	864080e7          	jalr	-1948(ra) # 4cf0 <printf>
    exit(1);
     494:	4505                	li	a0,1
     496:	00004097          	auipc	ra,0x4
     49a:	4b4080e7          	jalr	1204(ra) # 494a <exit>
      printf("open junk failed\n");
     49e:	00005517          	auipc	a0,0x5
     4a2:	b7250513          	addi	a0,a0,-1166 # 5010 <malloc+0x260>
     4a6:	00005097          	auipc	ra,0x5
     4aa:	84a080e7          	jalr	-1974(ra) # 4cf0 <printf>
      exit(1);
     4ae:	4505                	li	a0,1
     4b0:	00004097          	auipc	ra,0x4
     4b4:	49a080e7          	jalr	1178(ra) # 494a <exit>
    printf("open junk failed\n");
     4b8:	00005517          	auipc	a0,0x5
     4bc:	b5850513          	addi	a0,a0,-1192 # 5010 <malloc+0x260>
     4c0:	00005097          	auipc	ra,0x5
     4c4:	830080e7          	jalr	-2000(ra) # 4cf0 <printf>
    exit(1);
     4c8:	4505                	li	a0,1
     4ca:	00004097          	auipc	ra,0x4
     4ce:	480080e7          	jalr	1152(ra) # 494a <exit>
  }
  close(fd);
     4d2:	8526                	mv	a0,s1
     4d4:	00004097          	auipc	ra,0x4
     4d8:	49e080e7          	jalr	1182(ra) # 4972 <close>
  remove("junk");
     4dc:	00005517          	auipc	a0,0x5
     4e0:	b2c50513          	addi	a0,a0,-1236 # 5008 <malloc+0x258>
     4e4:	00004097          	auipc	ra,0x4
     4e8:	50e080e7          	jalr	1294(ra) # 49f2 <remove>

  exit(0);
     4ec:	4501                	li	a0,0
     4ee:	00004097          	auipc	ra,0x4
     4f2:	45c080e7          	jalr	1116(ra) # 494a <exit>

00000000000004f6 <copyin>:
{
     4f6:	711d                	addi	sp,sp,-96
     4f8:	ec86                	sd	ra,88(sp)
     4fa:	e8a2                	sd	s0,80(sp)
     4fc:	e4a6                	sd	s1,72(sp)
     4fe:	e0ca                	sd	s2,64(sp)
     500:	fc4e                	sd	s3,56(sp)
     502:	f852                	sd	s4,48(sp)
     504:	f456                	sd	s5,40(sp)
     506:	f05a                	sd	s6,32(sp)
     508:	1080                	addi	s0,sp,96
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     50a:	4785                	li	a5,1
     50c:	07fe                	slli	a5,a5,0x1f
     50e:	faf43823          	sd	a5,-80(s0)
     512:	57fd                	li	a5,-1
     514:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     518:	fb040493          	addi	s1,s0,-80
     51c:	fc040b13          	addi	s6,s0,-64
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     520:	00005a17          	auipc	s4,0x5
     524:	b18a0a13          	addi	s4,s4,-1256 # 5038 <malloc+0x288>
    if(pipe(fds) < 0){
     528:	fa840a93          	addi	s5,s0,-88
    uint64 addr = addrs[ai];
     52c:	0004b903          	ld	s2,0(s1)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     530:	20100593          	li	a1,513
     534:	8552                	mv	a0,s4
     536:	00004097          	auipc	ra,0x4
     53a:	454080e7          	jalr	1108(ra) # 498a <open>
     53e:	89aa                	mv	s3,a0
    if(fd < 0){
     540:	08054763          	bltz	a0,5ce <copyin+0xd8>
    int n = write(fd, (void*)addr, 8192);
     544:	6609                	lui	a2,0x2
     546:	85ca                	mv	a1,s2
     548:	00004097          	auipc	ra,0x4
     54c:	422080e7          	jalr	1058(ra) # 496a <write>
    if(n >= 0){
     550:	08055c63          	bgez	a0,5e8 <copyin+0xf2>
    close(fd);
     554:	854e                	mv	a0,s3
     556:	00004097          	auipc	ra,0x4
     55a:	41c080e7          	jalr	1052(ra) # 4972 <close>
    remove("copyin1");
     55e:	8552                	mv	a0,s4
     560:	00004097          	auipc	ra,0x4
     564:	492080e7          	jalr	1170(ra) # 49f2 <remove>
    n = write(1, (char*)addr, 8192);
     568:	6609                	lui	a2,0x2
     56a:	85ca                	mv	a1,s2
     56c:	4505                	li	a0,1
     56e:	00004097          	auipc	ra,0x4
     572:	3fc080e7          	jalr	1020(ra) # 496a <write>
    if(n > 0){
     576:	08a04863          	bgtz	a0,606 <copyin+0x110>
    if(pipe(fds) < 0){
     57a:	8556                	mv	a0,s5
     57c:	00004097          	auipc	ra,0x4
     580:	3de080e7          	jalr	990(ra) # 495a <pipe>
     584:	0a054063          	bltz	a0,624 <copyin+0x12e>
    n = write(fds[1], (char*)addr, 8192);
     588:	6609                	lui	a2,0x2
     58a:	85ca                	mv	a1,s2
     58c:	fac42503          	lw	a0,-84(s0)
     590:	00004097          	auipc	ra,0x4
     594:	3da080e7          	jalr	986(ra) # 496a <write>
    if(n > 0){
     598:	0aa04363          	bgtz	a0,63e <copyin+0x148>
    close(fds[0]);
     59c:	fa842503          	lw	a0,-88(s0)
     5a0:	00004097          	auipc	ra,0x4
     5a4:	3d2080e7          	jalr	978(ra) # 4972 <close>
    close(fds[1]);
     5a8:	fac42503          	lw	a0,-84(s0)
     5ac:	00004097          	auipc	ra,0x4
     5b0:	3c6080e7          	jalr	966(ra) # 4972 <close>
  for(int ai = 0; ai < 2; ai++){
     5b4:	04a1                	addi	s1,s1,8
     5b6:	f7649be3          	bne	s1,s6,52c <copyin+0x36>
}
     5ba:	60e6                	ld	ra,88(sp)
     5bc:	6446                	ld	s0,80(sp)
     5be:	64a6                	ld	s1,72(sp)
     5c0:	6906                	ld	s2,64(sp)
     5c2:	79e2                	ld	s3,56(sp)
     5c4:	7a42                	ld	s4,48(sp)
     5c6:	7aa2                	ld	s5,40(sp)
     5c8:	7b02                	ld	s6,32(sp)
     5ca:	6125                	addi	sp,sp,96
     5cc:	8082                	ret
      printf("open(copyin1) failed\n");
     5ce:	00005517          	auipc	a0,0x5
     5d2:	a7250513          	addi	a0,a0,-1422 # 5040 <malloc+0x290>
     5d6:	00004097          	auipc	ra,0x4
     5da:	71a080e7          	jalr	1818(ra) # 4cf0 <printf>
      exit(1);
     5de:	4505                	li	a0,1
     5e0:	00004097          	auipc	ra,0x4
     5e4:	36a080e7          	jalr	874(ra) # 494a <exit>
      printf("write(fd, %p, 8192) returned %d, not -1\n", addr, n);
     5e8:	862a                	mv	a2,a0
     5ea:	85ca                	mv	a1,s2
     5ec:	00005517          	auipc	a0,0x5
     5f0:	a6c50513          	addi	a0,a0,-1428 # 5058 <malloc+0x2a8>
     5f4:	00004097          	auipc	ra,0x4
     5f8:	6fc080e7          	jalr	1788(ra) # 4cf0 <printf>
      exit(1);
     5fc:	4505                	li	a0,1
     5fe:	00004097          	auipc	ra,0x4
     602:	34c080e7          	jalr	844(ra) # 494a <exit>
      printf("write(1, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     606:	862a                	mv	a2,a0
     608:	85ca                	mv	a1,s2
     60a:	00005517          	auipc	a0,0x5
     60e:	a7e50513          	addi	a0,a0,-1410 # 5088 <malloc+0x2d8>
     612:	00004097          	auipc	ra,0x4
     616:	6de080e7          	jalr	1758(ra) # 4cf0 <printf>
      exit(1);
     61a:	4505                	li	a0,1
     61c:	00004097          	auipc	ra,0x4
     620:	32e080e7          	jalr	814(ra) # 494a <exit>
      printf("pipe() failed\n");
     624:	00005517          	auipc	a0,0x5
     628:	a9450513          	addi	a0,a0,-1388 # 50b8 <malloc+0x308>
     62c:	00004097          	auipc	ra,0x4
     630:	6c4080e7          	jalr	1732(ra) # 4cf0 <printf>
      exit(1);
     634:	4505                	li	a0,1
     636:	00004097          	auipc	ra,0x4
     63a:	314080e7          	jalr	788(ra) # 494a <exit>
      printf("write(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     63e:	862a                	mv	a2,a0
     640:	85ca                	mv	a1,s2
     642:	00005517          	auipc	a0,0x5
     646:	a8650513          	addi	a0,a0,-1402 # 50c8 <malloc+0x318>
     64a:	00004097          	auipc	ra,0x4
     64e:	6a6080e7          	jalr	1702(ra) # 4cf0 <printf>
      exit(1);
     652:	4505                	li	a0,1
     654:	00004097          	auipc	ra,0x4
     658:	2f6080e7          	jalr	758(ra) # 494a <exit>

000000000000065c <copyout>:
{
     65c:	7159                	addi	sp,sp,-112
     65e:	f486                	sd	ra,104(sp)
     660:	f0a2                	sd	s0,96(sp)
     662:	eca6                	sd	s1,88(sp)
     664:	e8ca                	sd	s2,80(sp)
     666:	e4ce                	sd	s3,72(sp)
     668:	e0d2                	sd	s4,64(sp)
     66a:	fc56                	sd	s5,56(sp)
     66c:	f85a                	sd	s6,48(sp)
     66e:	f45e                	sd	s7,40(sp)
     670:	1880                	addi	s0,sp,112
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     672:	4785                	li	a5,1
     674:	07fe                	slli	a5,a5,0x1f
     676:	faf43023          	sd	a5,-96(s0)
     67a:	57fd                	li	a5,-1
     67c:	faf43423          	sd	a5,-88(s0)
  for(int ai = 0; ai < 2; ai++){
     680:	fa040493          	addi	s1,s0,-96
     684:	fb040b93          	addi	s7,s0,-80
    int fd = open("README", 0);
     688:	00005a97          	auipc	s5,0x5
     68c:	a70a8a93          	addi	s5,s5,-1424 # 50f8 <malloc+0x348>
    if(pipe(fds) < 0){
     690:	f9840a13          	addi	s4,s0,-104
    n = write(fds[1], "x", 1);
     694:	00005b17          	auipc	s6,0x5
     698:	8fcb0b13          	addi	s6,s6,-1796 # 4f90 <malloc+0x1e0>
    uint64 addr = addrs[ai];
     69c:	0004b983          	ld	s3,0(s1)
    int fd = open("README", 0);
     6a0:	4581                	li	a1,0
     6a2:	8556                	mv	a0,s5
     6a4:	00004097          	auipc	ra,0x4
     6a8:	2e6080e7          	jalr	742(ra) # 498a <open>
     6ac:	892a                	mv	s2,a0
    if(fd < 0){
     6ae:	08054563          	bltz	a0,738 <copyout+0xdc>
    int n = read(fd, (void*)addr, 8192);
     6b2:	6609                	lui	a2,0x2
     6b4:	85ce                	mv	a1,s3
     6b6:	00004097          	auipc	ra,0x4
     6ba:	2ac080e7          	jalr	684(ra) # 4962 <read>
    if(n > 0){
     6be:	08a04a63          	bgtz	a0,752 <copyout+0xf6>
    close(fd);
     6c2:	854a                	mv	a0,s2
     6c4:	00004097          	auipc	ra,0x4
     6c8:	2ae080e7          	jalr	686(ra) # 4972 <close>
    if(pipe(fds) < 0){
     6cc:	8552                	mv	a0,s4
     6ce:	00004097          	auipc	ra,0x4
     6d2:	28c080e7          	jalr	652(ra) # 495a <pipe>
     6d6:	08054d63          	bltz	a0,770 <copyout+0x114>
    n = write(fds[1], "x", 1);
     6da:	4605                	li	a2,1
     6dc:	85da                	mv	a1,s6
     6de:	f9c42503          	lw	a0,-100(s0)
     6e2:	00004097          	auipc	ra,0x4
     6e6:	288080e7          	jalr	648(ra) # 496a <write>
    if(n != 1){
     6ea:	4785                	li	a5,1
     6ec:	08f51f63          	bne	a0,a5,78a <copyout+0x12e>
    n = read(fds[0], (void*)addr, 8192);
     6f0:	6609                	lui	a2,0x2
     6f2:	85ce                	mv	a1,s3
     6f4:	f9842503          	lw	a0,-104(s0)
     6f8:	00004097          	auipc	ra,0x4
     6fc:	26a080e7          	jalr	618(ra) # 4962 <read>
    if(n > 0){
     700:	0aa04263          	bgtz	a0,7a4 <copyout+0x148>
    close(fds[0]);
     704:	f9842503          	lw	a0,-104(s0)
     708:	00004097          	auipc	ra,0x4
     70c:	26a080e7          	jalr	618(ra) # 4972 <close>
    close(fds[1]);
     710:	f9c42503          	lw	a0,-100(s0)
     714:	00004097          	auipc	ra,0x4
     718:	25e080e7          	jalr	606(ra) # 4972 <close>
  for(int ai = 0; ai < 2; ai++){
     71c:	04a1                	addi	s1,s1,8
     71e:	f7749fe3          	bne	s1,s7,69c <copyout+0x40>
}
     722:	70a6                	ld	ra,104(sp)
     724:	7406                	ld	s0,96(sp)
     726:	64e6                	ld	s1,88(sp)
     728:	6946                	ld	s2,80(sp)
     72a:	69a6                	ld	s3,72(sp)
     72c:	6a06                	ld	s4,64(sp)
     72e:	7ae2                	ld	s5,56(sp)
     730:	7b42                	ld	s6,48(sp)
     732:	7ba2                	ld	s7,40(sp)
     734:	6165                	addi	sp,sp,112
     736:	8082                	ret
      printf("open(README) failed\n");
     738:	00005517          	auipc	a0,0x5
     73c:	9c850513          	addi	a0,a0,-1592 # 5100 <malloc+0x350>
     740:	00004097          	auipc	ra,0x4
     744:	5b0080e7          	jalr	1456(ra) # 4cf0 <printf>
      exit(1);
     748:	4505                	li	a0,1
     74a:	00004097          	auipc	ra,0x4
     74e:	200080e7          	jalr	512(ra) # 494a <exit>
      printf("read(fd, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     752:	862a                	mv	a2,a0
     754:	85ce                	mv	a1,s3
     756:	00005517          	auipc	a0,0x5
     75a:	9c250513          	addi	a0,a0,-1598 # 5118 <malloc+0x368>
     75e:	00004097          	auipc	ra,0x4
     762:	592080e7          	jalr	1426(ra) # 4cf0 <printf>
      exit(1);
     766:	4505                	li	a0,1
     768:	00004097          	auipc	ra,0x4
     76c:	1e2080e7          	jalr	482(ra) # 494a <exit>
      printf("pipe() failed\n");
     770:	00005517          	auipc	a0,0x5
     774:	94850513          	addi	a0,a0,-1720 # 50b8 <malloc+0x308>
     778:	00004097          	auipc	ra,0x4
     77c:	578080e7          	jalr	1400(ra) # 4cf0 <printf>
      exit(1);
     780:	4505                	li	a0,1
     782:	00004097          	auipc	ra,0x4
     786:	1c8080e7          	jalr	456(ra) # 494a <exit>
      printf("pipe write failed\n");
     78a:	00005517          	auipc	a0,0x5
     78e:	9be50513          	addi	a0,a0,-1602 # 5148 <malloc+0x398>
     792:	00004097          	auipc	ra,0x4
     796:	55e080e7          	jalr	1374(ra) # 4cf0 <printf>
      exit(1);
     79a:	4505                	li	a0,1
     79c:	00004097          	auipc	ra,0x4
     7a0:	1ae080e7          	jalr	430(ra) # 494a <exit>
      printf("read(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     7a4:	862a                	mv	a2,a0
     7a6:	85ce                	mv	a1,s3
     7a8:	00005517          	auipc	a0,0x5
     7ac:	9b850513          	addi	a0,a0,-1608 # 5160 <malloc+0x3b0>
     7b0:	00004097          	auipc	ra,0x4
     7b4:	540080e7          	jalr	1344(ra) # 4cf0 <printf>
      exit(1);
     7b8:	4505                	li	a0,1
     7ba:	00004097          	auipc	ra,0x4
     7be:	190080e7          	jalr	400(ra) # 494a <exit>

00000000000007c2 <truncate1>:
{
     7c2:	711d                	addi	sp,sp,-96
     7c4:	ec86                	sd	ra,88(sp)
     7c6:	e8a2                	sd	s0,80(sp)
     7c8:	e4a6                	sd	s1,72(sp)
     7ca:	e0ca                	sd	s2,64(sp)
     7cc:	fc4e                	sd	s3,56(sp)
     7ce:	f852                	sd	s4,48(sp)
     7d0:	f456                	sd	s5,40(sp)
     7d2:	1080                	addi	s0,sp,96
     7d4:	8aaa                	mv	s5,a0
  remove("truncfile");
     7d6:	00004517          	auipc	a0,0x4
     7da:	7a250513          	addi	a0,a0,1954 # 4f78 <malloc+0x1c8>
     7de:	00004097          	auipc	ra,0x4
     7e2:	214080e7          	jalr	532(ra) # 49f2 <remove>
  int fd1 = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     7e6:	60100593          	li	a1,1537
     7ea:	00004517          	auipc	a0,0x4
     7ee:	78e50513          	addi	a0,a0,1934 # 4f78 <malloc+0x1c8>
     7f2:	00004097          	auipc	ra,0x4
     7f6:	198080e7          	jalr	408(ra) # 498a <open>
     7fa:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     7fc:	4611                	li	a2,4
     7fe:	00004597          	auipc	a1,0x4
     802:	78a58593          	addi	a1,a1,1930 # 4f88 <malloc+0x1d8>
     806:	00004097          	auipc	ra,0x4
     80a:	164080e7          	jalr	356(ra) # 496a <write>
  close(fd1);
     80e:	8526                	mv	a0,s1
     810:	00004097          	auipc	ra,0x4
     814:	162080e7          	jalr	354(ra) # 4972 <close>
  int fd2 = open("truncfile", O_RDONLY);
     818:	4581                	li	a1,0
     81a:	00004517          	auipc	a0,0x4
     81e:	75e50513          	addi	a0,a0,1886 # 4f78 <malloc+0x1c8>
     822:	00004097          	auipc	ra,0x4
     826:	168080e7          	jalr	360(ra) # 498a <open>
     82a:	84aa                	mv	s1,a0
  int n = read(fd2, buf, sizeof(buf));
     82c:	02000613          	li	a2,32
     830:	fa040593          	addi	a1,s0,-96
     834:	00004097          	auipc	ra,0x4
     838:	12e080e7          	jalr	302(ra) # 4962 <read>
  if(n != 4){
     83c:	4791                	li	a5,4
     83e:	0cf51e63          	bne	a0,a5,91a <truncate1+0x158>
  fd1 = open("truncfile", O_WRONLY|O_TRUNC);
     842:	40100593          	li	a1,1025
     846:	00004517          	auipc	a0,0x4
     84a:	73250513          	addi	a0,a0,1842 # 4f78 <malloc+0x1c8>
     84e:	00004097          	auipc	ra,0x4
     852:	13c080e7          	jalr	316(ra) # 498a <open>
     856:	89aa                	mv	s3,a0
  int fd3 = open("truncfile", O_RDONLY);
     858:	4581                	li	a1,0
     85a:	00004517          	auipc	a0,0x4
     85e:	71e50513          	addi	a0,a0,1822 # 4f78 <malloc+0x1c8>
     862:	00004097          	auipc	ra,0x4
     866:	128080e7          	jalr	296(ra) # 498a <open>
     86a:	892a                	mv	s2,a0
  n = read(fd3, buf, sizeof(buf));
     86c:	02000613          	li	a2,32
     870:	fa040593          	addi	a1,s0,-96
     874:	00004097          	auipc	ra,0x4
     878:	0ee080e7          	jalr	238(ra) # 4962 <read>
     87c:	8a2a                	mv	s4,a0
  if(n != 0){
     87e:	ed4d                	bnez	a0,938 <truncate1+0x176>
  n = read(fd2, buf, sizeof(buf));
     880:	02000613          	li	a2,32
     884:	fa040593          	addi	a1,s0,-96
     888:	8526                	mv	a0,s1
     88a:	00004097          	auipc	ra,0x4
     88e:	0d8080e7          	jalr	216(ra) # 4962 <read>
     892:	8a2a                	mv	s4,a0
  if(n != 0){
     894:	e971                	bnez	a0,968 <truncate1+0x1a6>
  write(fd1, "abcdef", 6);
     896:	4619                	li	a2,6
     898:	00005597          	auipc	a1,0x5
     89c:	95858593          	addi	a1,a1,-1704 # 51f0 <malloc+0x440>
     8a0:	854e                	mv	a0,s3
     8a2:	00004097          	auipc	ra,0x4
     8a6:	0c8080e7          	jalr	200(ra) # 496a <write>
  n = read(fd3, buf, sizeof(buf));
     8aa:	02000613          	li	a2,32
     8ae:	fa040593          	addi	a1,s0,-96
     8b2:	854a                	mv	a0,s2
     8b4:	00004097          	auipc	ra,0x4
     8b8:	0ae080e7          	jalr	174(ra) # 4962 <read>
  if(n != 6){
     8bc:	4799                	li	a5,6
     8be:	0cf51d63          	bne	a0,a5,998 <truncate1+0x1d6>
  n = read(fd2, buf, sizeof(buf));
     8c2:	02000613          	li	a2,32
     8c6:	fa040593          	addi	a1,s0,-96
     8ca:	8526                	mv	a0,s1
     8cc:	00004097          	auipc	ra,0x4
     8d0:	096080e7          	jalr	150(ra) # 4962 <read>
  if(n != 2){
     8d4:	4789                	li	a5,2
     8d6:	0ef51063          	bne	a0,a5,9b6 <truncate1+0x1f4>
  remove("truncfile");
     8da:	00004517          	auipc	a0,0x4
     8de:	69e50513          	addi	a0,a0,1694 # 4f78 <malloc+0x1c8>
     8e2:	00004097          	auipc	ra,0x4
     8e6:	110080e7          	jalr	272(ra) # 49f2 <remove>
  close(fd1);
     8ea:	854e                	mv	a0,s3
     8ec:	00004097          	auipc	ra,0x4
     8f0:	086080e7          	jalr	134(ra) # 4972 <close>
  close(fd2);
     8f4:	8526                	mv	a0,s1
     8f6:	00004097          	auipc	ra,0x4
     8fa:	07c080e7          	jalr	124(ra) # 4972 <close>
  close(fd3);
     8fe:	854a                	mv	a0,s2
     900:	00004097          	auipc	ra,0x4
     904:	072080e7          	jalr	114(ra) # 4972 <close>
}
     908:	60e6                	ld	ra,88(sp)
     90a:	6446                	ld	s0,80(sp)
     90c:	64a6                	ld	s1,72(sp)
     90e:	6906                	ld	s2,64(sp)
     910:	79e2                	ld	s3,56(sp)
     912:	7a42                	ld	s4,48(sp)
     914:	7aa2                	ld	s5,40(sp)
     916:	6125                	addi	sp,sp,96
     918:	8082                	ret
    printf("%s: read %d bytes, wanted 4\n", s, n);
     91a:	862a                	mv	a2,a0
     91c:	85d6                	mv	a1,s5
     91e:	00005517          	auipc	a0,0x5
     922:	87250513          	addi	a0,a0,-1934 # 5190 <malloc+0x3e0>
     926:	00004097          	auipc	ra,0x4
     92a:	3ca080e7          	jalr	970(ra) # 4cf0 <printf>
    exit(1);
     92e:	4505                	li	a0,1
     930:	00004097          	auipc	ra,0x4
     934:	01a080e7          	jalr	26(ra) # 494a <exit>
    printf("aaa fd3=%d\n", fd3);
     938:	85ca                	mv	a1,s2
     93a:	00005517          	auipc	a0,0x5
     93e:	87650513          	addi	a0,a0,-1930 # 51b0 <malloc+0x400>
     942:	00004097          	auipc	ra,0x4
     946:	3ae080e7          	jalr	942(ra) # 4cf0 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     94a:	8652                	mv	a2,s4
     94c:	85d6                	mv	a1,s5
     94e:	00005517          	auipc	a0,0x5
     952:	87250513          	addi	a0,a0,-1934 # 51c0 <malloc+0x410>
     956:	00004097          	auipc	ra,0x4
     95a:	39a080e7          	jalr	922(ra) # 4cf0 <printf>
    exit(1);
     95e:	4505                	li	a0,1
     960:	00004097          	auipc	ra,0x4
     964:	fea080e7          	jalr	-22(ra) # 494a <exit>
    printf("bbb fd2=%d\n", fd2);
     968:	85a6                	mv	a1,s1
     96a:	00005517          	auipc	a0,0x5
     96e:	87650513          	addi	a0,a0,-1930 # 51e0 <malloc+0x430>
     972:	00004097          	auipc	ra,0x4
     976:	37e080e7          	jalr	894(ra) # 4cf0 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     97a:	8652                	mv	a2,s4
     97c:	85d6                	mv	a1,s5
     97e:	00005517          	auipc	a0,0x5
     982:	84250513          	addi	a0,a0,-1982 # 51c0 <malloc+0x410>
     986:	00004097          	auipc	ra,0x4
     98a:	36a080e7          	jalr	874(ra) # 4cf0 <printf>
    exit(1);
     98e:	4505                	li	a0,1
     990:	00004097          	auipc	ra,0x4
     994:	fba080e7          	jalr	-70(ra) # 494a <exit>
    printf("%s: read %d bytes, wanted 6\n", s, n);
     998:	862a                	mv	a2,a0
     99a:	85d6                	mv	a1,s5
     99c:	00005517          	auipc	a0,0x5
     9a0:	85c50513          	addi	a0,a0,-1956 # 51f8 <malloc+0x448>
     9a4:	00004097          	auipc	ra,0x4
     9a8:	34c080e7          	jalr	844(ra) # 4cf0 <printf>
    exit(1);
     9ac:	4505                	li	a0,1
     9ae:	00004097          	auipc	ra,0x4
     9b2:	f9c080e7          	jalr	-100(ra) # 494a <exit>
    printf("%s: read %d bytes, wanted 2\n", s, n);
     9b6:	862a                	mv	a2,a0
     9b8:	85d6                	mv	a1,s5
     9ba:	00005517          	auipc	a0,0x5
     9be:	85e50513          	addi	a0,a0,-1954 # 5218 <malloc+0x468>
     9c2:	00004097          	auipc	ra,0x4
     9c6:	32e080e7          	jalr	814(ra) # 4cf0 <printf>
    exit(1);
     9ca:	4505                	li	a0,1
     9cc:	00004097          	auipc	ra,0x4
     9d0:	f7e080e7          	jalr	-130(ra) # 494a <exit>

00000000000009d4 <writetest>:
{
     9d4:	7139                	addi	sp,sp,-64
     9d6:	fc06                	sd	ra,56(sp)
     9d8:	f822                	sd	s0,48(sp)
     9da:	f426                	sd	s1,40(sp)
     9dc:	f04a                	sd	s2,32(sp)
     9de:	ec4e                	sd	s3,24(sp)
     9e0:	e852                	sd	s4,16(sp)
     9e2:	e456                	sd	s5,8(sp)
     9e4:	e05a                	sd	s6,0(sp)
     9e6:	0080                	addi	s0,sp,64
     9e8:	8b2a                	mv	s6,a0
  fd = open("small", O_CREATE|O_RDWR);
     9ea:	20200593          	li	a1,514
     9ee:	00005517          	auipc	a0,0x5
     9f2:	84a50513          	addi	a0,a0,-1974 # 5238 <malloc+0x488>
     9f6:	00004097          	auipc	ra,0x4
     9fa:	f94080e7          	jalr	-108(ra) # 498a <open>
  if(fd < 0){
     9fe:	0a054d63          	bltz	a0,ab8 <writetest+0xe4>
     a02:	892a                	mv	s2,a0
     a04:	4481                	li	s1,0
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     a06:	00005997          	auipc	s3,0x5
     a0a:	85a98993          	addi	s3,s3,-1958 # 5260 <malloc+0x4b0>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a0e:	00005a97          	auipc	s5,0x5
     a12:	88aa8a93          	addi	s5,s5,-1910 # 5298 <malloc+0x4e8>
  for(i = 0; i < N; i++){
     a16:	06400a13          	li	s4,100
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     a1a:	4629                	li	a2,10
     a1c:	85ce                	mv	a1,s3
     a1e:	854a                	mv	a0,s2
     a20:	00004097          	auipc	ra,0x4
     a24:	f4a080e7          	jalr	-182(ra) # 496a <write>
     a28:	47a9                	li	a5,10
     a2a:	0af51563          	bne	a0,a5,ad4 <writetest+0x100>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a2e:	4629                	li	a2,10
     a30:	85d6                	mv	a1,s5
     a32:	854a                	mv	a0,s2
     a34:	00004097          	auipc	ra,0x4
     a38:	f36080e7          	jalr	-202(ra) # 496a <write>
     a3c:	47a9                	li	a5,10
     a3e:	0af51963          	bne	a0,a5,af0 <writetest+0x11c>
  for(i = 0; i < N; i++){
     a42:	2485                	addiw	s1,s1,1
     a44:	fd449be3          	bne	s1,s4,a1a <writetest+0x46>
  close(fd);
     a48:	854a                	mv	a0,s2
     a4a:	00004097          	auipc	ra,0x4
     a4e:	f28080e7          	jalr	-216(ra) # 4972 <close>
  fd = open("small", O_RDONLY);
     a52:	4581                	li	a1,0
     a54:	00004517          	auipc	a0,0x4
     a58:	7e450513          	addi	a0,a0,2020 # 5238 <malloc+0x488>
     a5c:	00004097          	auipc	ra,0x4
     a60:	f2e080e7          	jalr	-210(ra) # 498a <open>
     a64:	84aa                	mv	s1,a0
  if(fd < 0){
     a66:	0a054363          	bltz	a0,b0c <writetest+0x138>
  i = read(fd, buf, N*SZ*2);
     a6a:	7d000613          	li	a2,2000
     a6e:	0000a597          	auipc	a1,0xa
     a72:	dfa58593          	addi	a1,a1,-518 # a868 <buf>
     a76:	00004097          	auipc	ra,0x4
     a7a:	eec080e7          	jalr	-276(ra) # 4962 <read>
  if(i != N*SZ*2){
     a7e:	7d000793          	li	a5,2000
     a82:	0af51363          	bne	a0,a5,b28 <writetest+0x154>
  close(fd);
     a86:	8526                	mv	a0,s1
     a88:	00004097          	auipc	ra,0x4
     a8c:	eea080e7          	jalr	-278(ra) # 4972 <close>
  if(remove("small") < 0){
     a90:	00004517          	auipc	a0,0x4
     a94:	7a850513          	addi	a0,a0,1960 # 5238 <malloc+0x488>
     a98:	00004097          	auipc	ra,0x4
     a9c:	f5a080e7          	jalr	-166(ra) # 49f2 <remove>
     aa0:	0a054263          	bltz	a0,b44 <writetest+0x170>
}
     aa4:	70e2                	ld	ra,56(sp)
     aa6:	7442                	ld	s0,48(sp)
     aa8:	74a2                	ld	s1,40(sp)
     aaa:	7902                	ld	s2,32(sp)
     aac:	69e2                	ld	s3,24(sp)
     aae:	6a42                	ld	s4,16(sp)
     ab0:	6aa2                	ld	s5,8(sp)
     ab2:	6b02                	ld	s6,0(sp)
     ab4:	6121                	addi	sp,sp,64
     ab6:	8082                	ret
    printf("%s: error: creat small failed!\n", s);
     ab8:	85da                	mv	a1,s6
     aba:	00004517          	auipc	a0,0x4
     abe:	78650513          	addi	a0,a0,1926 # 5240 <malloc+0x490>
     ac2:	00004097          	auipc	ra,0x4
     ac6:	22e080e7          	jalr	558(ra) # 4cf0 <printf>
    exit(1);
     aca:	4505                	li	a0,1
     acc:	00004097          	auipc	ra,0x4
     ad0:	e7e080e7          	jalr	-386(ra) # 494a <exit>
      printf("%s: error: write aa %d new file failed\n", i);
     ad4:	85a6                	mv	a1,s1
     ad6:	00004517          	auipc	a0,0x4
     ada:	79a50513          	addi	a0,a0,1946 # 5270 <malloc+0x4c0>
     ade:	00004097          	auipc	ra,0x4
     ae2:	212080e7          	jalr	530(ra) # 4cf0 <printf>
      exit(1);
     ae6:	4505                	li	a0,1
     ae8:	00004097          	auipc	ra,0x4
     aec:	e62080e7          	jalr	-414(ra) # 494a <exit>
      printf("%s: error: write bb %d new file failed\n", i);
     af0:	85a6                	mv	a1,s1
     af2:	00004517          	auipc	a0,0x4
     af6:	7b650513          	addi	a0,a0,1974 # 52a8 <malloc+0x4f8>
     afa:	00004097          	auipc	ra,0x4
     afe:	1f6080e7          	jalr	502(ra) # 4cf0 <printf>
      exit(1);
     b02:	4505                	li	a0,1
     b04:	00004097          	auipc	ra,0x4
     b08:	e46080e7          	jalr	-442(ra) # 494a <exit>
    printf("%s: error: open small failed!\n", s);
     b0c:	85da                	mv	a1,s6
     b0e:	00004517          	auipc	a0,0x4
     b12:	7c250513          	addi	a0,a0,1986 # 52d0 <malloc+0x520>
     b16:	00004097          	auipc	ra,0x4
     b1a:	1da080e7          	jalr	474(ra) # 4cf0 <printf>
    exit(1);
     b1e:	4505                	li	a0,1
     b20:	00004097          	auipc	ra,0x4
     b24:	e2a080e7          	jalr	-470(ra) # 494a <exit>
    printf("%s: read failed\n", s);
     b28:	85da                	mv	a1,s6
     b2a:	00004517          	auipc	a0,0x4
     b2e:	7c650513          	addi	a0,a0,1990 # 52f0 <malloc+0x540>
     b32:	00004097          	auipc	ra,0x4
     b36:	1be080e7          	jalr	446(ra) # 4cf0 <printf>
    exit(1);
     b3a:	4505                	li	a0,1
     b3c:	00004097          	auipc	ra,0x4
     b40:	e0e080e7          	jalr	-498(ra) # 494a <exit>
    printf("%s: remove small failed\n", s);
     b44:	85da                	mv	a1,s6
     b46:	00004517          	auipc	a0,0x4
     b4a:	7c250513          	addi	a0,a0,1986 # 5308 <malloc+0x558>
     b4e:	00004097          	auipc	ra,0x4
     b52:	1a2080e7          	jalr	418(ra) # 4cf0 <printf>
    exit(1);
     b56:	4505                	li	a0,1
     b58:	00004097          	auipc	ra,0x4
     b5c:	df2080e7          	jalr	-526(ra) # 494a <exit>

0000000000000b60 <writebig>:
{
     b60:	7179                	addi	sp,sp,-48
     b62:	f406                	sd	ra,40(sp)
     b64:	f022                	sd	s0,32(sp)
     b66:	ec26                	sd	s1,24(sp)
     b68:	e84a                	sd	s2,16(sp)
     b6a:	e44e                	sd	s3,8(sp)
     b6c:	e052                	sd	s4,0(sp)
     b6e:	1800                	addi	s0,sp,48
     b70:	8a2a                	mv	s4,a0
  fd = open("big", O_CREATE|O_RDWR);
     b72:	20200593          	li	a1,514
     b76:	00004517          	auipc	a0,0x4
     b7a:	7b250513          	addi	a0,a0,1970 # 5328 <malloc+0x578>
     b7e:	00004097          	auipc	ra,0x4
     b82:	e0c080e7          	jalr	-500(ra) # 498a <open>
     b86:	89aa                	mv	s3,a0
  for(i = 0; i < MAXFILE; i++){
     b88:	4481                	li	s1,0
    ((int*)buf)[0] = i;
     b8a:	0000a917          	auipc	s2,0xa
     b8e:	cde90913          	addi	s2,s2,-802 # a868 <buf>
  if(fd < 0){
     b92:	06054e63          	bltz	a0,c0e <writebig+0xae>
    ((int*)buf)[0] = i;
     b96:	00992023          	sw	s1,0(s2)
    if(write(fd, buf, BSIZE) != BSIZE){
     b9a:	20000613          	li	a2,512
     b9e:	85ca                	mv	a1,s2
     ba0:	854e                	mv	a0,s3
     ba2:	00004097          	auipc	ra,0x4
     ba6:	dc8080e7          	jalr	-568(ra) # 496a <write>
     baa:	20000793          	li	a5,512
     bae:	06f51e63          	bne	a0,a5,c2a <writebig+0xca>
  for(i = 0; i < MAXFILE; i++){
     bb2:	2485                	addiw	s1,s1,1
     bb4:	20000793          	li	a5,512
     bb8:	fcf49fe3          	bne	s1,a5,b96 <writebig+0x36>
  close(fd);
     bbc:	854e                	mv	a0,s3
     bbe:	00004097          	auipc	ra,0x4
     bc2:	db4080e7          	jalr	-588(ra) # 4972 <close>
  fd = open("big", O_RDONLY);
     bc6:	4581                	li	a1,0
     bc8:	00004517          	auipc	a0,0x4
     bcc:	76050513          	addi	a0,a0,1888 # 5328 <malloc+0x578>
     bd0:	00004097          	auipc	ra,0x4
     bd4:	dba080e7          	jalr	-582(ra) # 498a <open>
     bd8:	89aa                	mv	s3,a0
  n = 0;
     bda:	4481                	li	s1,0
    i = read(fd, buf, BSIZE);
     bdc:	0000a917          	auipc	s2,0xa
     be0:	c8c90913          	addi	s2,s2,-884 # a868 <buf>
  if(fd < 0){
     be4:	06054163          	bltz	a0,c46 <writebig+0xe6>
    i = read(fd, buf, BSIZE);
     be8:	20000613          	li	a2,512
     bec:	85ca                	mv	a1,s2
     bee:	854e                	mv	a0,s3
     bf0:	00004097          	auipc	ra,0x4
     bf4:	d72080e7          	jalr	-654(ra) # 4962 <read>
    if(i == 0){
     bf8:	c52d                	beqz	a0,c62 <writebig+0x102>
    } else if(i != BSIZE){
     bfa:	20000793          	li	a5,512
     bfe:	0af51c63          	bne	a0,a5,cb6 <writebig+0x156>
    if(((int*)buf)[0] != n){
     c02:	00092603          	lw	a2,0(s2)
     c06:	0c961663          	bne	a2,s1,cd2 <writebig+0x172>
    n++;
     c0a:	2485                	addiw	s1,s1,1
    i = read(fd, buf, BSIZE);
     c0c:	bff1                	j	be8 <writebig+0x88>
    printf("%s: error: creat big failed!\n", s);
     c0e:	85d2                	mv	a1,s4
     c10:	00004517          	auipc	a0,0x4
     c14:	72050513          	addi	a0,a0,1824 # 5330 <malloc+0x580>
     c18:	00004097          	auipc	ra,0x4
     c1c:	0d8080e7          	jalr	216(ra) # 4cf0 <printf>
    exit(1);
     c20:	4505                	li	a0,1
     c22:	00004097          	auipc	ra,0x4
     c26:	d28080e7          	jalr	-728(ra) # 494a <exit>
      printf("%s: error: write big file failed\n", i);
     c2a:	85a6                	mv	a1,s1
     c2c:	00004517          	auipc	a0,0x4
     c30:	72450513          	addi	a0,a0,1828 # 5350 <malloc+0x5a0>
     c34:	00004097          	auipc	ra,0x4
     c38:	0bc080e7          	jalr	188(ra) # 4cf0 <printf>
      exit(1);
     c3c:	4505                	li	a0,1
     c3e:	00004097          	auipc	ra,0x4
     c42:	d0c080e7          	jalr	-756(ra) # 494a <exit>
    printf("%s: error: open big failed!\n", s);
     c46:	85d2                	mv	a1,s4
     c48:	00004517          	auipc	a0,0x4
     c4c:	73050513          	addi	a0,a0,1840 # 5378 <malloc+0x5c8>
     c50:	00004097          	auipc	ra,0x4
     c54:	0a0080e7          	jalr	160(ra) # 4cf0 <printf>
    exit(1);
     c58:	4505                	li	a0,1
     c5a:	00004097          	auipc	ra,0x4
     c5e:	cf0080e7          	jalr	-784(ra) # 494a <exit>
      if(n == MAXFILE - 1){
     c62:	1ff00793          	li	a5,511
     c66:	02f48963          	beq	s1,a5,c98 <writebig+0x138>
  close(fd);
     c6a:	854e                	mv	a0,s3
     c6c:	00004097          	auipc	ra,0x4
     c70:	d06080e7          	jalr	-762(ra) # 4972 <close>
  if(remove("big") < 0){
     c74:	00004517          	auipc	a0,0x4
     c78:	6b450513          	addi	a0,a0,1716 # 5328 <malloc+0x578>
     c7c:	00004097          	auipc	ra,0x4
     c80:	d76080e7          	jalr	-650(ra) # 49f2 <remove>
     c84:	06054563          	bltz	a0,cee <writebig+0x18e>
}
     c88:	70a2                	ld	ra,40(sp)
     c8a:	7402                	ld	s0,32(sp)
     c8c:	64e2                	ld	s1,24(sp)
     c8e:	6942                	ld	s2,16(sp)
     c90:	69a2                	ld	s3,8(sp)
     c92:	6a02                	ld	s4,0(sp)
     c94:	6145                	addi	sp,sp,48
     c96:	8082                	ret
        printf("%s: read only %d blocks from big", n);
     c98:	1ff00593          	li	a1,511
     c9c:	00004517          	auipc	a0,0x4
     ca0:	6fc50513          	addi	a0,a0,1788 # 5398 <malloc+0x5e8>
     ca4:	00004097          	auipc	ra,0x4
     ca8:	04c080e7          	jalr	76(ra) # 4cf0 <printf>
        exit(1);
     cac:	4505                	li	a0,1
     cae:	00004097          	auipc	ra,0x4
     cb2:	c9c080e7          	jalr	-868(ra) # 494a <exit>
      printf("%s: read failed %d\n", i);
     cb6:	85aa                	mv	a1,a0
     cb8:	00004517          	auipc	a0,0x4
     cbc:	70850513          	addi	a0,a0,1800 # 53c0 <malloc+0x610>
     cc0:	00004097          	auipc	ra,0x4
     cc4:	030080e7          	jalr	48(ra) # 4cf0 <printf>
      exit(1);
     cc8:	4505                	li	a0,1
     cca:	00004097          	auipc	ra,0x4
     cce:	c80080e7          	jalr	-896(ra) # 494a <exit>
      printf("%s: read content of block %d is %d\n",
     cd2:	85a6                	mv	a1,s1
     cd4:	00004517          	auipc	a0,0x4
     cd8:	70450513          	addi	a0,a0,1796 # 53d8 <malloc+0x628>
     cdc:	00004097          	auipc	ra,0x4
     ce0:	014080e7          	jalr	20(ra) # 4cf0 <printf>
      exit(1);
     ce4:	4505                	li	a0,1
     ce6:	00004097          	auipc	ra,0x4
     cea:	c64080e7          	jalr	-924(ra) # 494a <exit>
    printf("%s: remove big failed\n", s);
     cee:	85d2                	mv	a1,s4
     cf0:	00004517          	auipc	a0,0x4
     cf4:	71050513          	addi	a0,a0,1808 # 5400 <malloc+0x650>
     cf8:	00004097          	auipc	ra,0x4
     cfc:	ff8080e7          	jalr	-8(ra) # 4cf0 <printf>
    exit(1);
     d00:	4505                	li	a0,1
     d02:	00004097          	auipc	ra,0x4
     d06:	c48080e7          	jalr	-952(ra) # 494a <exit>

0000000000000d0a <removeread>:
{
     d0a:	7179                	addi	sp,sp,-48
     d0c:	f406                	sd	ra,40(sp)
     d0e:	f022                	sd	s0,32(sp)
     d10:	ec26                	sd	s1,24(sp)
     d12:	e84a                	sd	s2,16(sp)
     d14:	e44e                	sd	s3,8(sp)
     d16:	1800                	addi	s0,sp,48
     d18:	89aa                	mv	s3,a0
  fd = open("removeread", O_CREATE | O_RDWR);
     d1a:	20200593          	li	a1,514
     d1e:	00004517          	auipc	a0,0x4
     d22:	6fa50513          	addi	a0,a0,1786 # 5418 <malloc+0x668>
     d26:	00004097          	auipc	ra,0x4
     d2a:	c64080e7          	jalr	-924(ra) # 498a <open>
  if(fd < 0){
     d2e:	0e054763          	bltz	a0,e1c <removeread+0x112>
     d32:	84aa                	mv	s1,a0
  write(fd, "hello", SZ);
     d34:	4615                	li	a2,5
     d36:	00004597          	auipc	a1,0x4
     d3a:	71258593          	addi	a1,a1,1810 # 5448 <malloc+0x698>
     d3e:	00004097          	auipc	ra,0x4
     d42:	c2c080e7          	jalr	-980(ra) # 496a <write>
  close(fd);
     d46:	8526                	mv	a0,s1
     d48:	00004097          	auipc	ra,0x4
     d4c:	c2a080e7          	jalr	-982(ra) # 4972 <close>
  fd = open("removeread", O_RDWR);
     d50:	4589                	li	a1,2
     d52:	00004517          	auipc	a0,0x4
     d56:	6c650513          	addi	a0,a0,1734 # 5418 <malloc+0x668>
     d5a:	00004097          	auipc	ra,0x4
     d5e:	c30080e7          	jalr	-976(ra) # 498a <open>
     d62:	84aa                	mv	s1,a0
  if(fd < 0){
     d64:	0c054a63          	bltz	a0,e38 <removeread+0x12e>
  if(remove("removeread") != 0){
     d68:	00004517          	auipc	a0,0x4
     d6c:	6b050513          	addi	a0,a0,1712 # 5418 <malloc+0x668>
     d70:	00004097          	auipc	ra,0x4
     d74:	c82080e7          	jalr	-894(ra) # 49f2 <remove>
     d78:	ed71                	bnez	a0,e54 <removeread+0x14a>
  fd1 = open("removeread", O_CREATE | O_RDWR);
     d7a:	20200593          	li	a1,514
     d7e:	00004517          	auipc	a0,0x4
     d82:	69a50513          	addi	a0,a0,1690 # 5418 <malloc+0x668>
     d86:	00004097          	auipc	ra,0x4
     d8a:	c04080e7          	jalr	-1020(ra) # 498a <open>
     d8e:	892a                	mv	s2,a0
  write(fd1, "yyy", 3);
     d90:	460d                	li	a2,3
     d92:	00004597          	auipc	a1,0x4
     d96:	6fe58593          	addi	a1,a1,1790 # 5490 <malloc+0x6e0>
     d9a:	00004097          	auipc	ra,0x4
     d9e:	bd0080e7          	jalr	-1072(ra) # 496a <write>
  close(fd1);
     da2:	854a                	mv	a0,s2
     da4:	00004097          	auipc	ra,0x4
     da8:	bce080e7          	jalr	-1074(ra) # 4972 <close>
  if(read(fd, buf, sizeof(buf)) != SZ){
     dac:	6609                	lui	a2,0x2
     dae:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x28>
     db2:	0000a597          	auipc	a1,0xa
     db6:	ab658593          	addi	a1,a1,-1354 # a868 <buf>
     dba:	8526                	mv	a0,s1
     dbc:	00004097          	auipc	ra,0x4
     dc0:	ba6080e7          	jalr	-1114(ra) # 4962 <read>
     dc4:	4795                	li	a5,5
     dc6:	0af51563          	bne	a0,a5,e70 <removeread+0x166>
  if(buf[0] != 'h'){
     dca:	0000a717          	auipc	a4,0xa
     dce:	a9e74703          	lbu	a4,-1378(a4) # a868 <buf>
     dd2:	06800793          	li	a5,104
     dd6:	0af71b63          	bne	a4,a5,e8c <removeread+0x182>
  if(write(fd, buf, 10) != 10){
     dda:	4629                	li	a2,10
     ddc:	0000a597          	auipc	a1,0xa
     de0:	a8c58593          	addi	a1,a1,-1396 # a868 <buf>
     de4:	8526                	mv	a0,s1
     de6:	00004097          	auipc	ra,0x4
     dea:	b84080e7          	jalr	-1148(ra) # 496a <write>
     dee:	47a9                	li	a5,10
     df0:	0af51c63          	bne	a0,a5,ea8 <removeread+0x19e>
  close(fd);
     df4:	8526                	mv	a0,s1
     df6:	00004097          	auipc	ra,0x4
     dfa:	b7c080e7          	jalr	-1156(ra) # 4972 <close>
  remove("removeread");
     dfe:	00004517          	auipc	a0,0x4
     e02:	61a50513          	addi	a0,a0,1562 # 5418 <malloc+0x668>
     e06:	00004097          	auipc	ra,0x4
     e0a:	bec080e7          	jalr	-1044(ra) # 49f2 <remove>
}
     e0e:	70a2                	ld	ra,40(sp)
     e10:	7402                	ld	s0,32(sp)
     e12:	64e2                	ld	s1,24(sp)
     e14:	6942                	ld	s2,16(sp)
     e16:	69a2                	ld	s3,8(sp)
     e18:	6145                	addi	sp,sp,48
     e1a:	8082                	ret
    printf("%s: create removeread failed\n", s);
     e1c:	85ce                	mv	a1,s3
     e1e:	00004517          	auipc	a0,0x4
     e22:	60a50513          	addi	a0,a0,1546 # 5428 <malloc+0x678>
     e26:	00004097          	auipc	ra,0x4
     e2a:	eca080e7          	jalr	-310(ra) # 4cf0 <printf>
    exit(1);
     e2e:	4505                	li	a0,1
     e30:	00004097          	auipc	ra,0x4
     e34:	b1a080e7          	jalr	-1254(ra) # 494a <exit>
    printf("%s: open removeread failed\n", s);
     e38:	85ce                	mv	a1,s3
     e3a:	00004517          	auipc	a0,0x4
     e3e:	61650513          	addi	a0,a0,1558 # 5450 <malloc+0x6a0>
     e42:	00004097          	auipc	ra,0x4
     e46:	eae080e7          	jalr	-338(ra) # 4cf0 <printf>
    exit(1);
     e4a:	4505                	li	a0,1
     e4c:	00004097          	auipc	ra,0x4
     e50:	afe080e7          	jalr	-1282(ra) # 494a <exit>
    printf("%s: remove removeread failed\n", s);
     e54:	85ce                	mv	a1,s3
     e56:	00004517          	auipc	a0,0x4
     e5a:	61a50513          	addi	a0,a0,1562 # 5470 <malloc+0x6c0>
     e5e:	00004097          	auipc	ra,0x4
     e62:	e92080e7          	jalr	-366(ra) # 4cf0 <printf>
    exit(1);
     e66:	4505                	li	a0,1
     e68:	00004097          	auipc	ra,0x4
     e6c:	ae2080e7          	jalr	-1310(ra) # 494a <exit>
    printf("%s: removeread read failed", s);
     e70:	85ce                	mv	a1,s3
     e72:	00004517          	auipc	a0,0x4
     e76:	62650513          	addi	a0,a0,1574 # 5498 <malloc+0x6e8>
     e7a:	00004097          	auipc	ra,0x4
     e7e:	e76080e7          	jalr	-394(ra) # 4cf0 <printf>
    exit(1);
     e82:	4505                	li	a0,1
     e84:	00004097          	auipc	ra,0x4
     e88:	ac6080e7          	jalr	-1338(ra) # 494a <exit>
    printf("%s: removeread wrong data\n", s);
     e8c:	85ce                	mv	a1,s3
     e8e:	00004517          	auipc	a0,0x4
     e92:	62a50513          	addi	a0,a0,1578 # 54b8 <malloc+0x708>
     e96:	00004097          	auipc	ra,0x4
     e9a:	e5a080e7          	jalr	-422(ra) # 4cf0 <printf>
    exit(1);
     e9e:	4505                	li	a0,1
     ea0:	00004097          	auipc	ra,0x4
     ea4:	aaa080e7          	jalr	-1366(ra) # 494a <exit>
    printf("%s: removeread write failed\n", s);
     ea8:	85ce                	mv	a1,s3
     eaa:	00004517          	auipc	a0,0x4
     eae:	62e50513          	addi	a0,a0,1582 # 54d8 <malloc+0x728>
     eb2:	00004097          	auipc	ra,0x4
     eb6:	e3e080e7          	jalr	-450(ra) # 4cf0 <printf>
    exit(1);
     eba:	4505                	li	a0,1
     ebc:	00004097          	auipc	ra,0x4
     ec0:	a8e080e7          	jalr	-1394(ra) # 494a <exit>

0000000000000ec4 <pgbug>:
{
     ec4:	7179                	addi	sp,sp,-48
     ec6:	f406                	sd	ra,40(sp)
     ec8:	f022                	sd	s0,32(sp)
     eca:	ec26                	sd	s1,24(sp)
     ecc:	1800                	addi	s0,sp,48
  argv[0] = 0;
     ece:	fc043c23          	sd	zero,-40(s0)
  exec((char*)0xeaeb0b5b00002f5e, argv);
     ed2:	00004797          	auipc	a5,0x4
     ed6:	fd678793          	addi	a5,a5,-42 # 4ea8 <malloc+0xf8>
     eda:	6384                	ld	s1,0(a5)
     edc:	fd840593          	addi	a1,s0,-40
     ee0:	8526                	mv	a0,s1
     ee2:	00004097          	auipc	ra,0x4
     ee6:	aa0080e7          	jalr	-1376(ra) # 4982 <exec>
  pipe((int*)0xeaeb0b5b00002f5e);
     eea:	8526                	mv	a0,s1
     eec:	00004097          	auipc	ra,0x4
     ef0:	a6e080e7          	jalr	-1426(ra) # 495a <pipe>
  exit(0);
     ef4:	4501                	li	a0,0
     ef6:	00004097          	auipc	ra,0x4
     efa:	a54080e7          	jalr	-1452(ra) # 494a <exit>

0000000000000efe <badarg>:

// regression test. test whether exec() leaks memory if one of the
// arguments is invalid. the test passes if the kernel doesn't panic.
void
badarg(char *s)
{
     efe:	7139                	addi	sp,sp,-64
     f00:	fc06                	sd	ra,56(sp)
     f02:	f822                	sd	s0,48(sp)
     f04:	f426                	sd	s1,40(sp)
     f06:	f04a                	sd	s2,32(sp)
     f08:	ec4e                	sd	s3,24(sp)
     f0a:	e852                	sd	s4,16(sp)
     f0c:	0080                	addi	s0,sp,64
     f0e:	64b1                	lui	s1,0xc
     f10:	35048493          	addi	s1,s1,848 # c350 <_end+0x2d0>
  for(int i = 0; i < 50000; i++){
    char *argv[2];
    argv[0] = (char*)0xffffffff;
     f14:	597d                	li	s2,-1
     f16:	02095913          	srli	s2,s2,0x20
    argv[1] = 0;
    exec("echo", argv);
     f1a:	fc040a13          	addi	s4,s0,-64
     f1e:	00004997          	auipc	s3,0x4
     f22:	00298993          	addi	s3,s3,2 # 4f20 <malloc+0x170>
    argv[0] = (char*)0xffffffff;
     f26:	fd243023          	sd	s2,-64(s0)
    argv[1] = 0;
     f2a:	fc043423          	sd	zero,-56(s0)
    exec("echo", argv);
     f2e:	85d2                	mv	a1,s4
     f30:	854e                	mv	a0,s3
     f32:	00004097          	auipc	ra,0x4
     f36:	a50080e7          	jalr	-1456(ra) # 4982 <exec>
  for(int i = 0; i < 50000; i++){
     f3a:	34fd                	addiw	s1,s1,-1
     f3c:	f4ed                	bnez	s1,f26 <badarg+0x28>
  }
  
  exit(0);
     f3e:	4501                	li	a0,0
     f40:	00004097          	auipc	ra,0x4
     f44:	a0a080e7          	jalr	-1526(ra) # 494a <exit>

0000000000000f48 <copyinstr2>:
{
     f48:	714d                	addi	sp,sp,-336
     f4a:	e686                	sd	ra,328(sp)
     f4c:	e2a2                	sd	s0,320(sp)
     f4e:	0a80                	addi	s0,sp,336
  for(int i = 0; i < MAXPATH; i++)
     f50:	ee840793          	addi	a5,s0,-280
     f54:	fec40693          	addi	a3,s0,-20
    b[i] = 'x';
     f58:	07800713          	li	a4,120
     f5c:	00e78023          	sb	a4,0(a5)
  for(int i = 0; i < MAXPATH; i++)
     f60:	0785                	addi	a5,a5,1
     f62:	fed79de3          	bne	a5,a3,f5c <copyinstr2+0x14>
  b[MAXPATH] = '\0';
     f66:	fe040623          	sb	zero,-20(s0)
  int ret = remove(b);
     f6a:	ee840513          	addi	a0,s0,-280
     f6e:	00004097          	auipc	ra,0x4
     f72:	a84080e7          	jalr	-1404(ra) # 49f2 <remove>
  if(ret != -1){
     f76:	57fd                	li	a5,-1
     f78:	0cf51663          	bne	a0,a5,1044 <copyinstr2+0xfc>
  int fd = open(b, O_CREATE | O_WRONLY);
     f7c:	20100593          	li	a1,513
     f80:	ee840513          	addi	a0,s0,-280
     f84:	00004097          	auipc	ra,0x4
     f88:	a06080e7          	jalr	-1530(ra) # 498a <open>
  if(fd != -1){
     f8c:	57fd                	li	a5,-1
     f8e:	0cf51b63          	bne	a0,a5,1064 <copyinstr2+0x11c>
  char *args[] = { "xx", 0 };
     f92:	00005797          	auipc	a5,0x5
     f96:	17e78793          	addi	a5,a5,382 # 6110 <malloc+0x1360>
     f9a:	ecf43c23          	sd	a5,-296(s0)
     f9e:	ee043023          	sd	zero,-288(s0)
  ret = exec(b, args);
     fa2:	ed840593          	addi	a1,s0,-296
     fa6:	ee840513          	addi	a0,s0,-280
     faa:	00004097          	auipc	ra,0x4
     fae:	9d8080e7          	jalr	-1576(ra) # 4982 <exec>
  if(ret != -1){
     fb2:	57fd                	li	a5,-1
     fb4:	0cf51863          	bne	a0,a5,1084 <copyinstr2+0x13c>
  int pid = fork();
     fb8:	00004097          	auipc	ra,0x4
     fbc:	98a080e7          	jalr	-1654(ra) # 4942 <fork>
  if(pid < 0){
     fc0:	0e054263          	bltz	a0,10a4 <copyinstr2+0x15c>
  if(pid == 0){
     fc4:	10051363          	bnez	a0,10ca <copyinstr2+0x182>
     fc8:	00006797          	auipc	a5,0x6
     fcc:	18878793          	addi	a5,a5,392 # 7150 <big.1306>
     fd0:	00007697          	auipc	a3,0x7
     fd4:	18068693          	addi	a3,a3,384 # 8150 <__global_pointer$+0x908>
      big[i] = 'x';
     fd8:	07800713          	li	a4,120
     fdc:	00e78023          	sb	a4,0(a5)
    for(int i = 0; i < PGSIZE; i++)
     fe0:	0785                	addi	a5,a5,1
     fe2:	fed79de3          	bne	a5,a3,fdc <copyinstr2+0x94>
    big[PGSIZE] = '\0';
     fe6:	00007797          	auipc	a5,0x7
     fea:	16078523          	sb	zero,362(a5) # 8150 <__global_pointer$+0x908>
    char *args2[] = { big, big, big, 0 };
     fee:	00006797          	auipc	a5,0x6
     ff2:	cf278793          	addi	a5,a5,-782 # 6ce0 <digits+0x20>
     ff6:	6390                	ld	a2,0(a5)
     ff8:	6794                	ld	a3,8(a5)
     ffa:	6b98                	ld	a4,16(a5)
     ffc:	6f9c                	ld	a5,24(a5)
     ffe:	eac43823          	sd	a2,-336(s0)
    1002:	ead43c23          	sd	a3,-328(s0)
    1006:	ece43023          	sd	a4,-320(s0)
    100a:	ecf43423          	sd	a5,-312(s0)
    ret = exec("echo", args2);
    100e:	eb040593          	addi	a1,s0,-336
    1012:	00004517          	auipc	a0,0x4
    1016:	f0e50513          	addi	a0,a0,-242 # 4f20 <malloc+0x170>
    101a:	00004097          	auipc	ra,0x4
    101e:	968080e7          	jalr	-1688(ra) # 4982 <exec>
    if(ret != -1){
    1022:	57fd                	li	a5,-1
    1024:	08f50d63          	beq	a0,a5,10be <copyinstr2+0x176>
      printf("exec(echo, BIG) returned %d, not -1\n", fd);
    1028:	55fd                	li	a1,-1
    102a:	00004517          	auipc	a0,0x4
    102e:	52e50513          	addi	a0,a0,1326 # 5558 <malloc+0x7a8>
    1032:	00004097          	auipc	ra,0x4
    1036:	cbe080e7          	jalr	-834(ra) # 4cf0 <printf>
      exit(1);
    103a:	4505                	li	a0,1
    103c:	00004097          	auipc	ra,0x4
    1040:	90e080e7          	jalr	-1778(ra) # 494a <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    1044:	862a                	mv	a2,a0
    1046:	ee840593          	addi	a1,s0,-280
    104a:	00004517          	auipc	a0,0x4
    104e:	4ae50513          	addi	a0,a0,1198 # 54f8 <malloc+0x748>
    1052:	00004097          	auipc	ra,0x4
    1056:	c9e080e7          	jalr	-866(ra) # 4cf0 <printf>
    exit(1);
    105a:	4505                	li	a0,1
    105c:	00004097          	auipc	ra,0x4
    1060:	8ee080e7          	jalr	-1810(ra) # 494a <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    1064:	862a                	mv	a2,a0
    1066:	ee840593          	addi	a1,s0,-280
    106a:	00004517          	auipc	a0,0x4
    106e:	4ae50513          	addi	a0,a0,1198 # 5518 <malloc+0x768>
    1072:	00004097          	auipc	ra,0x4
    1076:	c7e080e7          	jalr	-898(ra) # 4cf0 <printf>
    exit(1);
    107a:	4505                	li	a0,1
    107c:	00004097          	auipc	ra,0x4
    1080:	8ce080e7          	jalr	-1842(ra) # 494a <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1084:	567d                	li	a2,-1
    1086:	ee840593          	addi	a1,s0,-280
    108a:	00004517          	auipc	a0,0x4
    108e:	4ae50513          	addi	a0,a0,1198 # 5538 <malloc+0x788>
    1092:	00004097          	auipc	ra,0x4
    1096:	c5e080e7          	jalr	-930(ra) # 4cf0 <printf>
    exit(1);
    109a:	4505                	li	a0,1
    109c:	00004097          	auipc	ra,0x4
    10a0:	8ae080e7          	jalr	-1874(ra) # 494a <exit>
    printf("fork failed\n");
    10a4:	00005517          	auipc	a0,0x5
    10a8:	88c50513          	addi	a0,a0,-1908 # 5930 <malloc+0xb80>
    10ac:	00004097          	auipc	ra,0x4
    10b0:	c44080e7          	jalr	-956(ra) # 4cf0 <printf>
    exit(1);
    10b4:	4505                	li	a0,1
    10b6:	00004097          	auipc	ra,0x4
    10ba:	894080e7          	jalr	-1900(ra) # 494a <exit>
    exit(747); // OK
    10be:	2eb00513          	li	a0,747
    10c2:	00004097          	auipc	ra,0x4
    10c6:	888080e7          	jalr	-1912(ra) # 494a <exit>
  int st = 0;
    10ca:	ec042a23          	sw	zero,-300(s0)
  wait(&st);
    10ce:	ed440513          	addi	a0,s0,-300
    10d2:	00004097          	auipc	ra,0x4
    10d6:	880080e7          	jalr	-1920(ra) # 4952 <wait>
  if(st != 747){
    10da:	ed442703          	lw	a4,-300(s0)
    10de:	2eb00793          	li	a5,747
    10e2:	00f71663          	bne	a4,a5,10ee <copyinstr2+0x1a6>
}
    10e6:	60b6                	ld	ra,328(sp)
    10e8:	6416                	ld	s0,320(sp)
    10ea:	6171                	addi	sp,sp,336
    10ec:	8082                	ret
    printf("exec(echo, BIG) succeeded, should have failed\n");
    10ee:	00004517          	auipc	a0,0x4
    10f2:	49250513          	addi	a0,a0,1170 # 5580 <malloc+0x7d0>
    10f6:	00004097          	auipc	ra,0x4
    10fa:	bfa080e7          	jalr	-1030(ra) # 4cf0 <printf>
    exit(1);
    10fe:	4505                	li	a0,1
    1100:	00004097          	auipc	ra,0x4
    1104:	84a080e7          	jalr	-1974(ra) # 494a <exit>

0000000000001108 <truncate3>:
{
    1108:	7159                	addi	sp,sp,-112
    110a:	f486                	sd	ra,104(sp)
    110c:	f0a2                	sd	s0,96(sp)
    110e:	eca6                	sd	s1,88(sp)
    1110:	e8ca                	sd	s2,80(sp)
    1112:	e4ce                	sd	s3,72(sp)
    1114:	e0d2                	sd	s4,64(sp)
    1116:	fc56                	sd	s5,56(sp)
    1118:	f85a                	sd	s6,48(sp)
    111a:	1880                	addi	s0,sp,112
    111c:	8a2a                	mv	s4,a0
  close(open("truncfile", O_CREATE|O_TRUNC|O_WRONLY));
    111e:	60100593          	li	a1,1537
    1122:	00004517          	auipc	a0,0x4
    1126:	e5650513          	addi	a0,a0,-426 # 4f78 <malloc+0x1c8>
    112a:	00004097          	auipc	ra,0x4
    112e:	860080e7          	jalr	-1952(ra) # 498a <open>
    1132:	00004097          	auipc	ra,0x4
    1136:	840080e7          	jalr	-1984(ra) # 4972 <close>
  pid = fork();
    113a:	00004097          	auipc	ra,0x4
    113e:	808080e7          	jalr	-2040(ra) # 4942 <fork>
  if(pid < 0){
    1142:	08054163          	bltz	a0,11c4 <truncate3+0xbc>
  if(pid == 0){
    1146:	e971                	bnez	a0,121a <truncate3+0x112>
    1148:	06400913          	li	s2,100
      int fd = open("truncfile", O_WRONLY);
    114c:	00004997          	auipc	s3,0x4
    1150:	e2c98993          	addi	s3,s3,-468 # 4f78 <malloc+0x1c8>
      int n = write(fd, "1234567890", 10);
    1154:	00004a97          	auipc	s5,0x4
    1158:	48ca8a93          	addi	s5,s5,1164 # 55e0 <malloc+0x830>
      read(fd, buf, sizeof(buf));
    115c:	f9840b13          	addi	s6,s0,-104
      int fd = open("truncfile", O_WRONLY);
    1160:	4585                	li	a1,1
    1162:	854e                	mv	a0,s3
    1164:	00004097          	auipc	ra,0x4
    1168:	826080e7          	jalr	-2010(ra) # 498a <open>
    116c:	84aa                	mv	s1,a0
      if(fd < 0){
    116e:	06054963          	bltz	a0,11e0 <truncate3+0xd8>
      int n = write(fd, "1234567890", 10);
    1172:	4629                	li	a2,10
    1174:	85d6                	mv	a1,s5
    1176:	00003097          	auipc	ra,0x3
    117a:	7f4080e7          	jalr	2036(ra) # 496a <write>
      if(n != 10){
    117e:	47a9                	li	a5,10
    1180:	06f51e63          	bne	a0,a5,11fc <truncate3+0xf4>
      close(fd);
    1184:	8526                	mv	a0,s1
    1186:	00003097          	auipc	ra,0x3
    118a:	7ec080e7          	jalr	2028(ra) # 4972 <close>
      fd = open("truncfile", O_RDONLY);
    118e:	4581                	li	a1,0
    1190:	854e                	mv	a0,s3
    1192:	00003097          	auipc	ra,0x3
    1196:	7f8080e7          	jalr	2040(ra) # 498a <open>
    119a:	84aa                	mv	s1,a0
      read(fd, buf, sizeof(buf));
    119c:	02000613          	li	a2,32
    11a0:	85da                	mv	a1,s6
    11a2:	00003097          	auipc	ra,0x3
    11a6:	7c0080e7          	jalr	1984(ra) # 4962 <read>
      close(fd);
    11aa:	8526                	mv	a0,s1
    11ac:	00003097          	auipc	ra,0x3
    11b0:	7c6080e7          	jalr	1990(ra) # 4972 <close>
    for(int i = 0; i < 100; i++){
    11b4:	397d                	addiw	s2,s2,-1
    11b6:	fa0915e3          	bnez	s2,1160 <truncate3+0x58>
    exit(0);
    11ba:	4501                	li	a0,0
    11bc:	00003097          	auipc	ra,0x3
    11c0:	78e080e7          	jalr	1934(ra) # 494a <exit>
    printf("%s: fork failed\n", s);
    11c4:	85d2                	mv	a1,s4
    11c6:	00004517          	auipc	a0,0x4
    11ca:	3ea50513          	addi	a0,a0,1002 # 55b0 <malloc+0x800>
    11ce:	00004097          	auipc	ra,0x4
    11d2:	b22080e7          	jalr	-1246(ra) # 4cf0 <printf>
    exit(1);
    11d6:	4505                	li	a0,1
    11d8:	00003097          	auipc	ra,0x3
    11dc:	772080e7          	jalr	1906(ra) # 494a <exit>
        printf("%s: open failed\n", s);
    11e0:	85d2                	mv	a1,s4
    11e2:	00004517          	auipc	a0,0x4
    11e6:	3e650513          	addi	a0,a0,998 # 55c8 <malloc+0x818>
    11ea:	00004097          	auipc	ra,0x4
    11ee:	b06080e7          	jalr	-1274(ra) # 4cf0 <printf>
        exit(1);
    11f2:	4505                	li	a0,1
    11f4:	00003097          	auipc	ra,0x3
    11f8:	756080e7          	jalr	1878(ra) # 494a <exit>
        printf("%s: write got %d, expected 10\n", s, n);
    11fc:	862a                	mv	a2,a0
    11fe:	85d2                	mv	a1,s4
    1200:	00004517          	auipc	a0,0x4
    1204:	3f050513          	addi	a0,a0,1008 # 55f0 <malloc+0x840>
    1208:	00004097          	auipc	ra,0x4
    120c:	ae8080e7          	jalr	-1304(ra) # 4cf0 <printf>
        exit(1);
    1210:	4505                	li	a0,1
    1212:	00003097          	auipc	ra,0x3
    1216:	738080e7          	jalr	1848(ra) # 494a <exit>
    121a:	09600913          	li	s2,150
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    121e:	00004997          	auipc	s3,0x4
    1222:	d5a98993          	addi	s3,s3,-678 # 4f78 <malloc+0x1c8>
    int n = write(fd, "xxx", 3);
    1226:	00004a97          	auipc	s5,0x4
    122a:	3eaa8a93          	addi	s5,s5,1002 # 5610 <malloc+0x860>
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    122e:	60100593          	li	a1,1537
    1232:	854e                	mv	a0,s3
    1234:	00003097          	auipc	ra,0x3
    1238:	756080e7          	jalr	1878(ra) # 498a <open>
    123c:	84aa                	mv	s1,a0
    if(fd < 0){
    123e:	04054763          	bltz	a0,128c <truncate3+0x184>
    int n = write(fd, "xxx", 3);
    1242:	460d                	li	a2,3
    1244:	85d6                	mv	a1,s5
    1246:	00003097          	auipc	ra,0x3
    124a:	724080e7          	jalr	1828(ra) # 496a <write>
    if(n != 3){
    124e:	478d                	li	a5,3
    1250:	04f51c63          	bne	a0,a5,12a8 <truncate3+0x1a0>
    close(fd);
    1254:	8526                	mv	a0,s1
    1256:	00003097          	auipc	ra,0x3
    125a:	71c080e7          	jalr	1820(ra) # 4972 <close>
  for(int i = 0; i < 150; i++){
    125e:	397d                	addiw	s2,s2,-1
    1260:	fc0917e3          	bnez	s2,122e <truncate3+0x126>
  wait(&xstatus);
    1264:	fbc40513          	addi	a0,s0,-68
    1268:	00003097          	auipc	ra,0x3
    126c:	6ea080e7          	jalr	1770(ra) # 4952 <wait>
  remove("truncfile");
    1270:	00004517          	auipc	a0,0x4
    1274:	d0850513          	addi	a0,a0,-760 # 4f78 <malloc+0x1c8>
    1278:	00003097          	auipc	ra,0x3
    127c:	77a080e7          	jalr	1914(ra) # 49f2 <remove>
  exit(xstatus);
    1280:	fbc42503          	lw	a0,-68(s0)
    1284:	00003097          	auipc	ra,0x3
    1288:	6c6080e7          	jalr	1734(ra) # 494a <exit>
      printf("%s: open failed\n", s);
    128c:	85d2                	mv	a1,s4
    128e:	00004517          	auipc	a0,0x4
    1292:	33a50513          	addi	a0,a0,826 # 55c8 <malloc+0x818>
    1296:	00004097          	auipc	ra,0x4
    129a:	a5a080e7          	jalr	-1446(ra) # 4cf0 <printf>
      exit(1);
    129e:	4505                	li	a0,1
    12a0:	00003097          	auipc	ra,0x3
    12a4:	6aa080e7          	jalr	1706(ra) # 494a <exit>
      printf("%s: write got %d, expected 3\n", s, n);
    12a8:	862a                	mv	a2,a0
    12aa:	85d2                	mv	a1,s4
    12ac:	00004517          	auipc	a0,0x4
    12b0:	36c50513          	addi	a0,a0,876 # 5618 <malloc+0x868>
    12b4:	00004097          	auipc	ra,0x4
    12b8:	a3c080e7          	jalr	-1476(ra) # 4cf0 <printf>
      exit(1);
    12bc:	4505                	li	a0,1
    12be:	00003097          	auipc	ra,0x3
    12c2:	68c080e7          	jalr	1676(ra) # 494a <exit>

00000000000012c6 <exectest>:
{
    12c6:	715d                	addi	sp,sp,-80
    12c8:	e486                	sd	ra,72(sp)
    12ca:	e0a2                	sd	s0,64(sp)
    12cc:	fc26                	sd	s1,56(sp)
    12ce:	f84a                	sd	s2,48(sp)
    12d0:	0880                	addi	s0,sp,80
    12d2:	892a                	mv	s2,a0
  char *echoargv[] = { "echo", "OK", 0 };
    12d4:	00004797          	auipc	a5,0x4
    12d8:	c4c78793          	addi	a5,a5,-948 # 4f20 <malloc+0x170>
    12dc:	fcf43023          	sd	a5,-64(s0)
    12e0:	00004797          	auipc	a5,0x4
    12e4:	35878793          	addi	a5,a5,856 # 5638 <malloc+0x888>
    12e8:	fcf43423          	sd	a5,-56(s0)
    12ec:	fc043823          	sd	zero,-48(s0)
  remove("echo-ok");
    12f0:	00004517          	auipc	a0,0x4
    12f4:	35050513          	addi	a0,a0,848 # 5640 <malloc+0x890>
    12f8:	00003097          	auipc	ra,0x3
    12fc:	6fa080e7          	jalr	1786(ra) # 49f2 <remove>
  pid = fork();
    1300:	00003097          	auipc	ra,0x3
    1304:	642080e7          	jalr	1602(ra) # 4942 <fork>
  if(pid < 0) {
    1308:	04054663          	bltz	a0,1354 <exectest+0x8e>
    130c:	84aa                	mv	s1,a0
  if(pid == 0) {
    130e:	e959                	bnez	a0,13a4 <exectest+0xde>
    close(1);
    1310:	4505                	li	a0,1
    1312:	00003097          	auipc	ra,0x3
    1316:	660080e7          	jalr	1632(ra) # 4972 <close>
    fd = open("echo-ok", O_CREATE|O_WRONLY);
    131a:	20100593          	li	a1,513
    131e:	00004517          	auipc	a0,0x4
    1322:	32250513          	addi	a0,a0,802 # 5640 <malloc+0x890>
    1326:	00003097          	auipc	ra,0x3
    132a:	664080e7          	jalr	1636(ra) # 498a <open>
    if(fd < 0) {
    132e:	04054163          	bltz	a0,1370 <exectest+0xaa>
    if(fd != 1) {
    1332:	4785                	li	a5,1
    1334:	04f50c63          	beq	a0,a5,138c <exectest+0xc6>
      printf("%s: wrong fd\n", s);
    1338:	85ca                	mv	a1,s2
    133a:	00004517          	auipc	a0,0x4
    133e:	32650513          	addi	a0,a0,806 # 5660 <malloc+0x8b0>
    1342:	00004097          	auipc	ra,0x4
    1346:	9ae080e7          	jalr	-1618(ra) # 4cf0 <printf>
      exit(1);
    134a:	4505                	li	a0,1
    134c:	00003097          	auipc	ra,0x3
    1350:	5fe080e7          	jalr	1534(ra) # 494a <exit>
     printf("%s: fork failed\n", s);
    1354:	85ca                	mv	a1,s2
    1356:	00004517          	auipc	a0,0x4
    135a:	25a50513          	addi	a0,a0,602 # 55b0 <malloc+0x800>
    135e:	00004097          	auipc	ra,0x4
    1362:	992080e7          	jalr	-1646(ra) # 4cf0 <printf>
     exit(1);
    1366:	4505                	li	a0,1
    1368:	00003097          	auipc	ra,0x3
    136c:	5e2080e7          	jalr	1506(ra) # 494a <exit>
      printf("%s: create failed\n", s);
    1370:	85ca                	mv	a1,s2
    1372:	00004517          	auipc	a0,0x4
    1376:	2d650513          	addi	a0,a0,726 # 5648 <malloc+0x898>
    137a:	00004097          	auipc	ra,0x4
    137e:	976080e7          	jalr	-1674(ra) # 4cf0 <printf>
      exit(1);
    1382:	4505                	li	a0,1
    1384:	00003097          	auipc	ra,0x3
    1388:	5c6080e7          	jalr	1478(ra) # 494a <exit>
    if(exec("echo", echoargv) < 0){
    138c:	fc040593          	addi	a1,s0,-64
    1390:	00004517          	auipc	a0,0x4
    1394:	b9050513          	addi	a0,a0,-1136 # 4f20 <malloc+0x170>
    1398:	00003097          	auipc	ra,0x3
    139c:	5ea080e7          	jalr	1514(ra) # 4982 <exec>
    13a0:	02054163          	bltz	a0,13c2 <exectest+0xfc>
  if (wait(&xstatus) != pid) {
    13a4:	fdc40513          	addi	a0,s0,-36
    13a8:	00003097          	auipc	ra,0x3
    13ac:	5aa080e7          	jalr	1450(ra) # 4952 <wait>
    13b0:	02951763          	bne	a0,s1,13de <exectest+0x118>
  if(xstatus != 0)
    13b4:	fdc42503          	lw	a0,-36(s0)
    13b8:	cd0d                	beqz	a0,13f2 <exectest+0x12c>
    exit(xstatus);
    13ba:	00003097          	auipc	ra,0x3
    13be:	590080e7          	jalr	1424(ra) # 494a <exit>
      printf("%s: exec echo failed\n", s);
    13c2:	85ca                	mv	a1,s2
    13c4:	00004517          	auipc	a0,0x4
    13c8:	2ac50513          	addi	a0,a0,684 # 5670 <malloc+0x8c0>
    13cc:	00004097          	auipc	ra,0x4
    13d0:	924080e7          	jalr	-1756(ra) # 4cf0 <printf>
      exit(1);
    13d4:	4505                	li	a0,1
    13d6:	00003097          	auipc	ra,0x3
    13da:	574080e7          	jalr	1396(ra) # 494a <exit>
    printf("%s: wait failed!\n", s);
    13de:	85ca                	mv	a1,s2
    13e0:	00004517          	auipc	a0,0x4
    13e4:	2a850513          	addi	a0,a0,680 # 5688 <malloc+0x8d8>
    13e8:	00004097          	auipc	ra,0x4
    13ec:	908080e7          	jalr	-1784(ra) # 4cf0 <printf>
    13f0:	b7d1                	j	13b4 <exectest+0xee>
  fd = open("echo-ok", O_RDONLY);
    13f2:	4581                	li	a1,0
    13f4:	00004517          	auipc	a0,0x4
    13f8:	24c50513          	addi	a0,a0,588 # 5640 <malloc+0x890>
    13fc:	00003097          	auipc	ra,0x3
    1400:	58e080e7          	jalr	1422(ra) # 498a <open>
  if(fd < 0) {
    1404:	02054a63          	bltz	a0,1438 <exectest+0x172>
  if (read(fd, buf, 2) != 2) {
    1408:	4609                	li	a2,2
    140a:	fb840593          	addi	a1,s0,-72
    140e:	00003097          	auipc	ra,0x3
    1412:	554080e7          	jalr	1364(ra) # 4962 <read>
    1416:	4789                	li	a5,2
    1418:	02f50e63          	beq	a0,a5,1454 <exectest+0x18e>
    printf("%s: read failed\n", s);
    141c:	85ca                	mv	a1,s2
    141e:	00004517          	auipc	a0,0x4
    1422:	ed250513          	addi	a0,a0,-302 # 52f0 <malloc+0x540>
    1426:	00004097          	auipc	ra,0x4
    142a:	8ca080e7          	jalr	-1846(ra) # 4cf0 <printf>
    exit(1);
    142e:	4505                	li	a0,1
    1430:	00003097          	auipc	ra,0x3
    1434:	51a080e7          	jalr	1306(ra) # 494a <exit>
    printf("%s: open failed\n", s);
    1438:	85ca                	mv	a1,s2
    143a:	00004517          	auipc	a0,0x4
    143e:	18e50513          	addi	a0,a0,398 # 55c8 <malloc+0x818>
    1442:	00004097          	auipc	ra,0x4
    1446:	8ae080e7          	jalr	-1874(ra) # 4cf0 <printf>
    exit(1);
    144a:	4505                	li	a0,1
    144c:	00003097          	auipc	ra,0x3
    1450:	4fe080e7          	jalr	1278(ra) # 494a <exit>
  remove("echo-ok");
    1454:	00004517          	auipc	a0,0x4
    1458:	1ec50513          	addi	a0,a0,492 # 5640 <malloc+0x890>
    145c:	00003097          	auipc	ra,0x3
    1460:	596080e7          	jalr	1430(ra) # 49f2 <remove>
  if(buf[0] == 'O' && buf[1] == 'K')
    1464:	fb844703          	lbu	a4,-72(s0)
    1468:	04f00793          	li	a5,79
    146c:	00f71863          	bne	a4,a5,147c <exectest+0x1b6>
    1470:	fb944703          	lbu	a4,-71(s0)
    1474:	04b00793          	li	a5,75
    1478:	02f70063          	beq	a4,a5,1498 <exectest+0x1d2>
    printf("%s: wrong output\n", s);
    147c:	85ca                	mv	a1,s2
    147e:	00004517          	auipc	a0,0x4
    1482:	22250513          	addi	a0,a0,546 # 56a0 <malloc+0x8f0>
    1486:	00004097          	auipc	ra,0x4
    148a:	86a080e7          	jalr	-1942(ra) # 4cf0 <printf>
    exit(1);
    148e:	4505                	li	a0,1
    1490:	00003097          	auipc	ra,0x3
    1494:	4ba080e7          	jalr	1210(ra) # 494a <exit>
    exit(0);
    1498:	4501                	li	a0,0
    149a:	00003097          	auipc	ra,0x3
    149e:	4b0080e7          	jalr	1200(ra) # 494a <exit>

00000000000014a2 <pipe1>:
{
    14a2:	715d                	addi	sp,sp,-80
    14a4:	e486                	sd	ra,72(sp)
    14a6:	e0a2                	sd	s0,64(sp)
    14a8:	fc26                	sd	s1,56(sp)
    14aa:	f84a                	sd	s2,48(sp)
    14ac:	f44e                	sd	s3,40(sp)
    14ae:	f052                	sd	s4,32(sp)
    14b0:	ec56                	sd	s5,24(sp)
    14b2:	e85a                	sd	s6,16(sp)
    14b4:	0880                	addi	s0,sp,80
    14b6:	89aa                	mv	s3,a0
  if(pipe(fds) != 0){
    14b8:	fb840513          	addi	a0,s0,-72
    14bc:	00003097          	auipc	ra,0x3
    14c0:	49e080e7          	jalr	1182(ra) # 495a <pipe>
    14c4:	ed25                	bnez	a0,153c <pipe1+0x9a>
    14c6:	84aa                	mv	s1,a0
  pid = fork();
    14c8:	00003097          	auipc	ra,0x3
    14cc:	47a080e7          	jalr	1146(ra) # 4942 <fork>
  if(pid == 0){
    14d0:	c541                	beqz	a0,1558 <pipe1+0xb6>
  } else if(pid > 0){
    14d2:	18a05b63          	blez	a0,1668 <pipe1+0x1c6>
    close(fds[1]);
    14d6:	fbc42503          	lw	a0,-68(s0)
    14da:	00003097          	auipc	ra,0x3
    14de:	498080e7          	jalr	1176(ra) # 4972 <close>
    total = 0;
    14e2:	8b26                	mv	s6,s1
    cc = 1;
    14e4:	4a05                	li	s4,1
    while((n = read(fds[0], buf, cc)) > 0){
    14e6:	00009917          	auipc	s2,0x9
    14ea:	38290913          	addi	s2,s2,898 # a868 <buf>
      if(cc > sizeof(buf))
    14ee:	6a89                	lui	s5,0x2
    14f0:	800a8a93          	addi	s5,s5,-2048 # 1800 <forkfork+0x28>
    while((n = read(fds[0], buf, cc)) > 0){
    14f4:	8652                	mv	a2,s4
    14f6:	85ca                	mv	a1,s2
    14f8:	fb842503          	lw	a0,-72(s0)
    14fc:	00003097          	auipc	ra,0x3
    1500:	466080e7          	jalr	1126(ra) # 4962 <read>
    1504:	10a05d63          	blez	a0,161e <pipe1+0x17c>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1508:	0014879b          	addiw	a5,s1,1
    150c:	00094683          	lbu	a3,0(s2)
    1510:	0ff4f713          	andi	a4,s1,255
    1514:	0ce69863          	bne	a3,a4,15e4 <pipe1+0x142>
    1518:	00009717          	auipc	a4,0x9
    151c:	35170713          	addi	a4,a4,849 # a869 <buf+0x1>
    1520:	9ca9                	addw	s1,s1,a0
      for(i = 0; i < n; i++){
    1522:	0e978463          	beq	a5,s1,160a <pipe1+0x168>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1526:	00074683          	lbu	a3,0(a4)
    152a:	0017861b          	addiw	a2,a5,1
    152e:	0705                	addi	a4,a4,1
    1530:	0ff7f793          	andi	a5,a5,255
    1534:	0af69863          	bne	a3,a5,15e4 <pipe1+0x142>
    1538:	87b2                	mv	a5,a2
    153a:	b7e5                	j	1522 <pipe1+0x80>
    printf("%s: pipe() failed\n", s);
    153c:	85ce                	mv	a1,s3
    153e:	00004517          	auipc	a0,0x4
    1542:	17a50513          	addi	a0,a0,378 # 56b8 <malloc+0x908>
    1546:	00003097          	auipc	ra,0x3
    154a:	7aa080e7          	jalr	1962(ra) # 4cf0 <printf>
    exit(1);
    154e:	4505                	li	a0,1
    1550:	00003097          	auipc	ra,0x3
    1554:	3fa080e7          	jalr	1018(ra) # 494a <exit>
    close(fds[0]);
    1558:	fb842503          	lw	a0,-72(s0)
    155c:	00003097          	auipc	ra,0x3
    1560:	416080e7          	jalr	1046(ra) # 4972 <close>
    for(n = 0; n < N; n++){
    1564:	00009a97          	auipc	s5,0x9
    1568:	304a8a93          	addi	s5,s5,772 # a868 <buf>
    156c:	0ffaf793          	andi	a5,s5,255
    1570:	40f004b3          	neg	s1,a5
    1574:	0ff4f493          	andi	s1,s1,255
    1578:	02d00a13          	li	s4,45
    157c:	40fa0a3b          	subw	s4,s4,a5
    1580:	0ffa7a13          	andi	s4,s4,255
    1584:	409a8913          	addi	s2,s5,1033
      if(write(fds[1], buf, SZ) != SZ){
    1588:	8b56                	mv	s6,s5
{
    158a:	87d6                	mv	a5,s5
        buf[i] = seq++;
    158c:	0097873b          	addw	a4,a5,s1
    1590:	00e78023          	sb	a4,0(a5)
      for(i = 0; i < SZ; i++)
    1594:	0785                	addi	a5,a5,1
    1596:	fef91be3          	bne	s2,a5,158c <pipe1+0xea>
      if(write(fds[1], buf, SZ) != SZ){
    159a:	40900613          	li	a2,1033
    159e:	85da                	mv	a1,s6
    15a0:	fbc42503          	lw	a0,-68(s0)
    15a4:	00003097          	auipc	ra,0x3
    15a8:	3c6080e7          	jalr	966(ra) # 496a <write>
    15ac:	40900793          	li	a5,1033
    15b0:	00f51c63          	bne	a0,a5,15c8 <pipe1+0x126>
    for(n = 0; n < N; n++){
    15b4:	24a5                	addiw	s1,s1,9
    15b6:	0ff4f493          	andi	s1,s1,255
    15ba:	fd4498e3          	bne	s1,s4,158a <pipe1+0xe8>
    exit(0);
    15be:	4501                	li	a0,0
    15c0:	00003097          	auipc	ra,0x3
    15c4:	38a080e7          	jalr	906(ra) # 494a <exit>
        printf("%s: pipe1 oops 1\n", s);
    15c8:	85ce                	mv	a1,s3
    15ca:	00004517          	auipc	a0,0x4
    15ce:	10650513          	addi	a0,a0,262 # 56d0 <malloc+0x920>
    15d2:	00003097          	auipc	ra,0x3
    15d6:	71e080e7          	jalr	1822(ra) # 4cf0 <printf>
        exit(1);
    15da:	4505                	li	a0,1
    15dc:	00003097          	auipc	ra,0x3
    15e0:	36e080e7          	jalr	878(ra) # 494a <exit>
          printf("%s: pipe1 oops 2\n", s);
    15e4:	85ce                	mv	a1,s3
    15e6:	00004517          	auipc	a0,0x4
    15ea:	10250513          	addi	a0,a0,258 # 56e8 <malloc+0x938>
    15ee:	00003097          	auipc	ra,0x3
    15f2:	702080e7          	jalr	1794(ra) # 4cf0 <printf>
}
    15f6:	60a6                	ld	ra,72(sp)
    15f8:	6406                	ld	s0,64(sp)
    15fa:	74e2                	ld	s1,56(sp)
    15fc:	7942                	ld	s2,48(sp)
    15fe:	79a2                	ld	s3,40(sp)
    1600:	7a02                	ld	s4,32(sp)
    1602:	6ae2                	ld	s5,24(sp)
    1604:	6b42                	ld	s6,16(sp)
    1606:	6161                	addi	sp,sp,80
    1608:	8082                	ret
      total += n;
    160a:	00ab0b3b          	addw	s6,s6,a0
      cc = cc * 2;
    160e:	001a179b          	slliw	a5,s4,0x1
    1612:	00078a1b          	sext.w	s4,a5
      if(cc > sizeof(buf))
    1616:	ed4affe3          	bleu	s4,s5,14f4 <pipe1+0x52>
        cc = sizeof(buf);
    161a:	8a56                	mv	s4,s5
    161c:	bde1                	j	14f4 <pipe1+0x52>
    if(total != N * SZ){
    161e:	6785                	lui	a5,0x1
    1620:	42d78793          	addi	a5,a5,1069 # 142d <exectest+0x167>
    1624:	02fb0063          	beq	s6,a5,1644 <pipe1+0x1a2>
      printf("%s: pipe1 oops 3 total %d\n", total);
    1628:	85da                	mv	a1,s6
    162a:	00004517          	auipc	a0,0x4
    162e:	0d650513          	addi	a0,a0,214 # 5700 <malloc+0x950>
    1632:	00003097          	auipc	ra,0x3
    1636:	6be080e7          	jalr	1726(ra) # 4cf0 <printf>
      exit(1);
    163a:	4505                	li	a0,1
    163c:	00003097          	auipc	ra,0x3
    1640:	30e080e7          	jalr	782(ra) # 494a <exit>
    close(fds[0]);
    1644:	fb842503          	lw	a0,-72(s0)
    1648:	00003097          	auipc	ra,0x3
    164c:	32a080e7          	jalr	810(ra) # 4972 <close>
    wait(&xstatus);
    1650:	fb440513          	addi	a0,s0,-76
    1654:	00003097          	auipc	ra,0x3
    1658:	2fe080e7          	jalr	766(ra) # 4952 <wait>
    exit(xstatus);
    165c:	fb442503          	lw	a0,-76(s0)
    1660:	00003097          	auipc	ra,0x3
    1664:	2ea080e7          	jalr	746(ra) # 494a <exit>
    printf("%s: fork() failed\n", s);
    1668:	85ce                	mv	a1,s3
    166a:	00004517          	auipc	a0,0x4
    166e:	0b650513          	addi	a0,a0,182 # 5720 <malloc+0x970>
    1672:	00003097          	auipc	ra,0x3
    1676:	67e080e7          	jalr	1662(ra) # 4cf0 <printf>
    exit(1);
    167a:	4505                	li	a0,1
    167c:	00003097          	auipc	ra,0x3
    1680:	2ce080e7          	jalr	718(ra) # 494a <exit>

0000000000001684 <exitwait>:
{
    1684:	715d                	addi	sp,sp,-80
    1686:	e486                	sd	ra,72(sp)
    1688:	e0a2                	sd	s0,64(sp)
    168a:	fc26                	sd	s1,56(sp)
    168c:	f84a                	sd	s2,48(sp)
    168e:	f44e                	sd	s3,40(sp)
    1690:	f052                	sd	s4,32(sp)
    1692:	ec56                	sd	s5,24(sp)
    1694:	0880                	addi	s0,sp,80
    1696:	8aaa                	mv	s5,a0
  for(i = 0; i < 100; i++){
    1698:	4481                	li	s1,0
      if(wait(&xstate) != pid){
    169a:	fbc40993          	addi	s3,s0,-68
  for(i = 0; i < 100; i++){
    169e:	06400a13          	li	s4,100
    pid = fork();
    16a2:	00003097          	auipc	ra,0x3
    16a6:	2a0080e7          	jalr	672(ra) # 4942 <fork>
    16aa:	892a                	mv	s2,a0
    if(pid < 0){
    16ac:	02054a63          	bltz	a0,16e0 <exitwait+0x5c>
    if(pid){
    16b0:	c151                	beqz	a0,1734 <exitwait+0xb0>
      if(wait(&xstate) != pid){
    16b2:	854e                	mv	a0,s3
    16b4:	00003097          	auipc	ra,0x3
    16b8:	29e080e7          	jalr	670(ra) # 4952 <wait>
    16bc:	05251063          	bne	a0,s2,16fc <exitwait+0x78>
      if(i != xstate) {
    16c0:	fbc42783          	lw	a5,-68(s0)
    16c4:	04979a63          	bne	a5,s1,1718 <exitwait+0x94>
  for(i = 0; i < 100; i++){
    16c8:	2485                	addiw	s1,s1,1
    16ca:	fd449ce3          	bne	s1,s4,16a2 <exitwait+0x1e>
}
    16ce:	60a6                	ld	ra,72(sp)
    16d0:	6406                	ld	s0,64(sp)
    16d2:	74e2                	ld	s1,56(sp)
    16d4:	7942                	ld	s2,48(sp)
    16d6:	79a2                	ld	s3,40(sp)
    16d8:	7a02                	ld	s4,32(sp)
    16da:	6ae2                	ld	s5,24(sp)
    16dc:	6161                	addi	sp,sp,80
    16de:	8082                	ret
      printf("%s: fork failed\n", s);
    16e0:	85d6                	mv	a1,s5
    16e2:	00004517          	auipc	a0,0x4
    16e6:	ece50513          	addi	a0,a0,-306 # 55b0 <malloc+0x800>
    16ea:	00003097          	auipc	ra,0x3
    16ee:	606080e7          	jalr	1542(ra) # 4cf0 <printf>
      exit(1);
    16f2:	4505                	li	a0,1
    16f4:	00003097          	auipc	ra,0x3
    16f8:	256080e7          	jalr	598(ra) # 494a <exit>
        printf("%s: wait wrong pid\n", s);
    16fc:	85d6                	mv	a1,s5
    16fe:	00004517          	auipc	a0,0x4
    1702:	03a50513          	addi	a0,a0,58 # 5738 <malloc+0x988>
    1706:	00003097          	auipc	ra,0x3
    170a:	5ea080e7          	jalr	1514(ra) # 4cf0 <printf>
        exit(1);
    170e:	4505                	li	a0,1
    1710:	00003097          	auipc	ra,0x3
    1714:	23a080e7          	jalr	570(ra) # 494a <exit>
        printf("%s: wait wrong exit status\n", s);
    1718:	85d6                	mv	a1,s5
    171a:	00004517          	auipc	a0,0x4
    171e:	03650513          	addi	a0,a0,54 # 5750 <malloc+0x9a0>
    1722:	00003097          	auipc	ra,0x3
    1726:	5ce080e7          	jalr	1486(ra) # 4cf0 <printf>
        exit(1);
    172a:	4505                	li	a0,1
    172c:	00003097          	auipc	ra,0x3
    1730:	21e080e7          	jalr	542(ra) # 494a <exit>
      exit(i);
    1734:	8526                	mv	a0,s1
    1736:	00003097          	auipc	ra,0x3
    173a:	214080e7          	jalr	532(ra) # 494a <exit>

000000000000173e <twochildren>:
{
    173e:	1101                	addi	sp,sp,-32
    1740:	ec06                	sd	ra,24(sp)
    1742:	e822                	sd	s0,16(sp)
    1744:	e426                	sd	s1,8(sp)
    1746:	e04a                	sd	s2,0(sp)
    1748:	1000                	addi	s0,sp,32
    174a:	892a                	mv	s2,a0
    174c:	3e800493          	li	s1,1000
    int pid1 = fork();
    1750:	00003097          	auipc	ra,0x3
    1754:	1f2080e7          	jalr	498(ra) # 4942 <fork>
    if(pid1 < 0){
    1758:	02054c63          	bltz	a0,1790 <twochildren+0x52>
    if(pid1 == 0){
    175c:	c921                	beqz	a0,17ac <twochildren+0x6e>
      int pid2 = fork();
    175e:	00003097          	auipc	ra,0x3
    1762:	1e4080e7          	jalr	484(ra) # 4942 <fork>
      if(pid2 < 0){
    1766:	04054763          	bltz	a0,17b4 <twochildren+0x76>
      if(pid2 == 0){
    176a:	c13d                	beqz	a0,17d0 <twochildren+0x92>
        wait(0);
    176c:	4501                	li	a0,0
    176e:	00003097          	auipc	ra,0x3
    1772:	1e4080e7          	jalr	484(ra) # 4952 <wait>
        wait(0);
    1776:	4501                	li	a0,0
    1778:	00003097          	auipc	ra,0x3
    177c:	1da080e7          	jalr	474(ra) # 4952 <wait>
  for(int i = 0; i < 1000; i++){
    1780:	34fd                	addiw	s1,s1,-1
    1782:	f4f9                	bnez	s1,1750 <twochildren+0x12>
}
    1784:	60e2                	ld	ra,24(sp)
    1786:	6442                	ld	s0,16(sp)
    1788:	64a2                	ld	s1,8(sp)
    178a:	6902                	ld	s2,0(sp)
    178c:	6105                	addi	sp,sp,32
    178e:	8082                	ret
      printf("%s: fork failed\n", s);
    1790:	85ca                	mv	a1,s2
    1792:	00004517          	auipc	a0,0x4
    1796:	e1e50513          	addi	a0,a0,-482 # 55b0 <malloc+0x800>
    179a:	00003097          	auipc	ra,0x3
    179e:	556080e7          	jalr	1366(ra) # 4cf0 <printf>
      exit(1);
    17a2:	4505                	li	a0,1
    17a4:	00003097          	auipc	ra,0x3
    17a8:	1a6080e7          	jalr	422(ra) # 494a <exit>
      exit(0);
    17ac:	00003097          	auipc	ra,0x3
    17b0:	19e080e7          	jalr	414(ra) # 494a <exit>
        printf("%s: fork failed\n", s);
    17b4:	85ca                	mv	a1,s2
    17b6:	00004517          	auipc	a0,0x4
    17ba:	dfa50513          	addi	a0,a0,-518 # 55b0 <malloc+0x800>
    17be:	00003097          	auipc	ra,0x3
    17c2:	532080e7          	jalr	1330(ra) # 4cf0 <printf>
        exit(1);
    17c6:	4505                	li	a0,1
    17c8:	00003097          	auipc	ra,0x3
    17cc:	182080e7          	jalr	386(ra) # 494a <exit>
        exit(0);
    17d0:	00003097          	auipc	ra,0x3
    17d4:	17a080e7          	jalr	378(ra) # 494a <exit>

00000000000017d8 <forkfork>:
{
    17d8:	7179                	addi	sp,sp,-48
    17da:	f406                	sd	ra,40(sp)
    17dc:	f022                	sd	s0,32(sp)
    17de:	ec26                	sd	s1,24(sp)
    17e0:	1800                	addi	s0,sp,48
    17e2:	84aa                	mv	s1,a0
    int pid = fork();
    17e4:	00003097          	auipc	ra,0x3
    17e8:	15e080e7          	jalr	350(ra) # 4942 <fork>
    if(pid < 0){
    17ec:	04054163          	bltz	a0,182e <forkfork+0x56>
    if(pid == 0){
    17f0:	cd29                	beqz	a0,184a <forkfork+0x72>
    int pid = fork();
    17f2:	00003097          	auipc	ra,0x3
    17f6:	150080e7          	jalr	336(ra) # 4942 <fork>
    if(pid < 0){
    17fa:	02054a63          	bltz	a0,182e <forkfork+0x56>
    if(pid == 0){
    17fe:	c531                	beqz	a0,184a <forkfork+0x72>
    wait(&xstatus);
    1800:	fdc40513          	addi	a0,s0,-36
    1804:	00003097          	auipc	ra,0x3
    1808:	14e080e7          	jalr	334(ra) # 4952 <wait>
    if(xstatus != 0) {
    180c:	fdc42783          	lw	a5,-36(s0)
    1810:	ebbd                	bnez	a5,1886 <forkfork+0xae>
    wait(&xstatus);
    1812:	fdc40513          	addi	a0,s0,-36
    1816:	00003097          	auipc	ra,0x3
    181a:	13c080e7          	jalr	316(ra) # 4952 <wait>
    if(xstatus != 0) {
    181e:	fdc42783          	lw	a5,-36(s0)
    1822:	e3b5                	bnez	a5,1886 <forkfork+0xae>
}
    1824:	70a2                	ld	ra,40(sp)
    1826:	7402                	ld	s0,32(sp)
    1828:	64e2                	ld	s1,24(sp)
    182a:	6145                	addi	sp,sp,48
    182c:	8082                	ret
      printf("%s: fork failed", s);
    182e:	85a6                	mv	a1,s1
    1830:	00004517          	auipc	a0,0x4
    1834:	f4050513          	addi	a0,a0,-192 # 5770 <malloc+0x9c0>
    1838:	00003097          	auipc	ra,0x3
    183c:	4b8080e7          	jalr	1208(ra) # 4cf0 <printf>
      exit(1);
    1840:	4505                	li	a0,1
    1842:	00003097          	auipc	ra,0x3
    1846:	108080e7          	jalr	264(ra) # 494a <exit>
{
    184a:	0c800493          	li	s1,200
        int pid1 = fork();
    184e:	00003097          	auipc	ra,0x3
    1852:	0f4080e7          	jalr	244(ra) # 4942 <fork>
        if(pid1 < 0){
    1856:	00054f63          	bltz	a0,1874 <forkfork+0x9c>
        if(pid1 == 0){
    185a:	c115                	beqz	a0,187e <forkfork+0xa6>
        wait(0);
    185c:	4501                	li	a0,0
    185e:	00003097          	auipc	ra,0x3
    1862:	0f4080e7          	jalr	244(ra) # 4952 <wait>
      for(int j = 0; j < 200; j++){
    1866:	34fd                	addiw	s1,s1,-1
    1868:	f0fd                	bnez	s1,184e <forkfork+0x76>
      exit(0);
    186a:	4501                	li	a0,0
    186c:	00003097          	auipc	ra,0x3
    1870:	0de080e7          	jalr	222(ra) # 494a <exit>
          exit(1);
    1874:	4505                	li	a0,1
    1876:	00003097          	auipc	ra,0x3
    187a:	0d4080e7          	jalr	212(ra) # 494a <exit>
          exit(0);
    187e:	00003097          	auipc	ra,0x3
    1882:	0cc080e7          	jalr	204(ra) # 494a <exit>
      printf("%s: fork in child failed", s);
    1886:	85a6                	mv	a1,s1
    1888:	00004517          	auipc	a0,0x4
    188c:	ef850513          	addi	a0,a0,-264 # 5780 <malloc+0x9d0>
    1890:	00003097          	auipc	ra,0x3
    1894:	460080e7          	jalr	1120(ra) # 4cf0 <printf>
      exit(1);
    1898:	4505                	li	a0,1
    189a:	00003097          	auipc	ra,0x3
    189e:	0b0080e7          	jalr	176(ra) # 494a <exit>

00000000000018a2 <reparent2>:
{
    18a2:	1101                	addi	sp,sp,-32
    18a4:	ec06                	sd	ra,24(sp)
    18a6:	e822                	sd	s0,16(sp)
    18a8:	e426                	sd	s1,8(sp)
    18aa:	1000                	addi	s0,sp,32
    18ac:	32000493          	li	s1,800
    int pid1 = fork();
    18b0:	00003097          	auipc	ra,0x3
    18b4:	092080e7          	jalr	146(ra) # 4942 <fork>
    if(pid1 < 0){
    18b8:	00054f63          	bltz	a0,18d6 <reparent2+0x34>
    if(pid1 == 0){
    18bc:	c915                	beqz	a0,18f0 <reparent2+0x4e>
    wait(0);
    18be:	4501                	li	a0,0
    18c0:	00003097          	auipc	ra,0x3
    18c4:	092080e7          	jalr	146(ra) # 4952 <wait>
  for(int i = 0; i < 800; i++){
    18c8:	34fd                	addiw	s1,s1,-1
    18ca:	f0fd                	bnez	s1,18b0 <reparent2+0xe>
  exit(0);
    18cc:	4501                	li	a0,0
    18ce:	00003097          	auipc	ra,0x3
    18d2:	07c080e7          	jalr	124(ra) # 494a <exit>
      printf("fork failed\n");
    18d6:	00004517          	auipc	a0,0x4
    18da:	05a50513          	addi	a0,a0,90 # 5930 <malloc+0xb80>
    18de:	00003097          	auipc	ra,0x3
    18e2:	412080e7          	jalr	1042(ra) # 4cf0 <printf>
      exit(1);
    18e6:	4505                	li	a0,1
    18e8:	00003097          	auipc	ra,0x3
    18ec:	062080e7          	jalr	98(ra) # 494a <exit>
      fork();
    18f0:	00003097          	auipc	ra,0x3
    18f4:	052080e7          	jalr	82(ra) # 4942 <fork>
      fork();
    18f8:	00003097          	auipc	ra,0x3
    18fc:	04a080e7          	jalr	74(ra) # 4942 <fork>
      exit(0);
    1900:	4501                	li	a0,0
    1902:	00003097          	auipc	ra,0x3
    1906:	048080e7          	jalr	72(ra) # 494a <exit>

000000000000190a <forktest>:
{
    190a:	7179                	addi	sp,sp,-48
    190c:	f406                	sd	ra,40(sp)
    190e:	f022                	sd	s0,32(sp)
    1910:	ec26                	sd	s1,24(sp)
    1912:	e84a                	sd	s2,16(sp)
    1914:	e44e                	sd	s3,8(sp)
    1916:	1800                	addi	s0,sp,48
    1918:	89aa                	mv	s3,a0
  for(n=0; n<N; n++){
    191a:	4481                	li	s1,0
    191c:	3e800913          	li	s2,1000
    pid = fork();
    1920:	00003097          	auipc	ra,0x3
    1924:	022080e7          	jalr	34(ra) # 4942 <fork>
    if(pid < 0)
    1928:	02054863          	bltz	a0,1958 <forktest+0x4e>
    if(pid == 0)
    192c:	c115                	beqz	a0,1950 <forktest+0x46>
  for(n=0; n<N; n++){
    192e:	2485                	addiw	s1,s1,1
    1930:	ff2498e3          	bne	s1,s2,1920 <forktest+0x16>
    printf("%s: fork claimed to work 1000 times!\n", s);
    1934:	85ce                	mv	a1,s3
    1936:	00004517          	auipc	a0,0x4
    193a:	e8250513          	addi	a0,a0,-382 # 57b8 <malloc+0xa08>
    193e:	00003097          	auipc	ra,0x3
    1942:	3b2080e7          	jalr	946(ra) # 4cf0 <printf>
    exit(1);
    1946:	4505                	li	a0,1
    1948:	00003097          	auipc	ra,0x3
    194c:	002080e7          	jalr	2(ra) # 494a <exit>
      exit(0);
    1950:	00003097          	auipc	ra,0x3
    1954:	ffa080e7          	jalr	-6(ra) # 494a <exit>
  if (n == 0) {
    1958:	cc9d                	beqz	s1,1996 <forktest+0x8c>
  if(n == N){
    195a:	3e800793          	li	a5,1000
    195e:	fcf48be3          	beq	s1,a5,1934 <forktest+0x2a>
  for(; n > 0; n--){
    1962:	00905b63          	blez	s1,1978 <forktest+0x6e>
    if(wait(0) < 0){
    1966:	4501                	li	a0,0
    1968:	00003097          	auipc	ra,0x3
    196c:	fea080e7          	jalr	-22(ra) # 4952 <wait>
    1970:	04054163          	bltz	a0,19b2 <forktest+0xa8>
  for(; n > 0; n--){
    1974:	34fd                	addiw	s1,s1,-1
    1976:	f8e5                	bnez	s1,1966 <forktest+0x5c>
  if(wait(0) != -1){
    1978:	4501                	li	a0,0
    197a:	00003097          	auipc	ra,0x3
    197e:	fd8080e7          	jalr	-40(ra) # 4952 <wait>
    1982:	57fd                	li	a5,-1
    1984:	04f51563          	bne	a0,a5,19ce <forktest+0xc4>
}
    1988:	70a2                	ld	ra,40(sp)
    198a:	7402                	ld	s0,32(sp)
    198c:	64e2                	ld	s1,24(sp)
    198e:	6942                	ld	s2,16(sp)
    1990:	69a2                	ld	s3,8(sp)
    1992:	6145                	addi	sp,sp,48
    1994:	8082                	ret
    printf("%s: no fork at all!\n", s);
    1996:	85ce                	mv	a1,s3
    1998:	00004517          	auipc	a0,0x4
    199c:	e0850513          	addi	a0,a0,-504 # 57a0 <malloc+0x9f0>
    19a0:	00003097          	auipc	ra,0x3
    19a4:	350080e7          	jalr	848(ra) # 4cf0 <printf>
    exit(1);
    19a8:	4505                	li	a0,1
    19aa:	00003097          	auipc	ra,0x3
    19ae:	fa0080e7          	jalr	-96(ra) # 494a <exit>
      printf("%s: wait stopped early\n", s);
    19b2:	85ce                	mv	a1,s3
    19b4:	00004517          	auipc	a0,0x4
    19b8:	e2c50513          	addi	a0,a0,-468 # 57e0 <malloc+0xa30>
    19bc:	00003097          	auipc	ra,0x3
    19c0:	334080e7          	jalr	820(ra) # 4cf0 <printf>
      exit(1);
    19c4:	4505                	li	a0,1
    19c6:	00003097          	auipc	ra,0x3
    19ca:	f84080e7          	jalr	-124(ra) # 494a <exit>
    printf("%s: wait got too many\n", s);
    19ce:	85ce                	mv	a1,s3
    19d0:	00004517          	auipc	a0,0x4
    19d4:	e2850513          	addi	a0,a0,-472 # 57f8 <malloc+0xa48>
    19d8:	00003097          	auipc	ra,0x3
    19dc:	318080e7          	jalr	792(ra) # 4cf0 <printf>
    exit(1);
    19e0:	4505                	li	a0,1
    19e2:	00003097          	auipc	ra,0x3
    19e6:	f68080e7          	jalr	-152(ra) # 494a <exit>

00000000000019ea <kernmem>:
{
    19ea:	715d                	addi	sp,sp,-80
    19ec:	e486                	sd	ra,72(sp)
    19ee:	e0a2                	sd	s0,64(sp)
    19f0:	fc26                	sd	s1,56(sp)
    19f2:	f84a                	sd	s2,48(sp)
    19f4:	f44e                	sd	s3,40(sp)
    19f6:	f052                	sd	s4,32(sp)
    19f8:	ec56                	sd	s5,24(sp)
    19fa:	e85a                	sd	s6,16(sp)
    19fc:	0880                	addi	s0,sp,80
    19fe:	8aaa                	mv	s5,a0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    1a00:	040014b7          	lui	s1,0x4001
    1a04:	0496                	slli	s1,s1,0x5
    wait(&xstatus);
    1a06:	fbc40b13          	addi	s6,s0,-68
    if(xstatus != -1)  // did kernel kill child?
    1a0a:	5a7d                	li	s4,-1
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    1a0c:	69b1                	lui	s3,0xc
    1a0e:	35098993          	addi	s3,s3,848 # c350 <_end+0x2d0>
    1a12:	10041937          	lui	s2,0x10041
    1a16:	090e                	slli	s2,s2,0x3
    1a18:	48090913          	addi	s2,s2,1152 # 10041480 <_end+0x10035400>
    pid = fork();
    1a1c:	00003097          	auipc	ra,0x3
    1a20:	f26080e7          	jalr	-218(ra) # 4942 <fork>
    if(pid < 0){
    1a24:	02054963          	bltz	a0,1a56 <kernmem+0x6c>
    if(pid == 0){
    1a28:	c529                	beqz	a0,1a72 <kernmem+0x88>
    wait(&xstatus);
    1a2a:	855a                	mv	a0,s6
    1a2c:	00003097          	auipc	ra,0x3
    1a30:	f26080e7          	jalr	-218(ra) # 4952 <wait>
    if(xstatus != -1)  // did kernel kill child?
    1a34:	fbc42783          	lw	a5,-68(s0)
    1a38:	05479d63          	bne	a5,s4,1a92 <kernmem+0xa8>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    1a3c:	94ce                	add	s1,s1,s3
    1a3e:	fd249fe3          	bne	s1,s2,1a1c <kernmem+0x32>
}
    1a42:	60a6                	ld	ra,72(sp)
    1a44:	6406                	ld	s0,64(sp)
    1a46:	74e2                	ld	s1,56(sp)
    1a48:	7942                	ld	s2,48(sp)
    1a4a:	79a2                	ld	s3,40(sp)
    1a4c:	7a02                	ld	s4,32(sp)
    1a4e:	6ae2                	ld	s5,24(sp)
    1a50:	6b42                	ld	s6,16(sp)
    1a52:	6161                	addi	sp,sp,80
    1a54:	8082                	ret
      printf("%s: fork failed\n", s);
    1a56:	85d6                	mv	a1,s5
    1a58:	00004517          	auipc	a0,0x4
    1a5c:	b5850513          	addi	a0,a0,-1192 # 55b0 <malloc+0x800>
    1a60:	00003097          	auipc	ra,0x3
    1a64:	290080e7          	jalr	656(ra) # 4cf0 <printf>
      exit(1);
    1a68:	4505                	li	a0,1
    1a6a:	00003097          	auipc	ra,0x3
    1a6e:	ee0080e7          	jalr	-288(ra) # 494a <exit>
      printf("%s: oops could read %x = %x\n", a, *a);
    1a72:	0004c603          	lbu	a2,0(s1) # 4001000 <_end+0x3ff4f80>
    1a76:	85a6                	mv	a1,s1
    1a78:	00004517          	auipc	a0,0x4
    1a7c:	d9850513          	addi	a0,a0,-616 # 5810 <malloc+0xa60>
    1a80:	00003097          	auipc	ra,0x3
    1a84:	270080e7          	jalr	624(ra) # 4cf0 <printf>
      exit(1);
    1a88:	4505                	li	a0,1
    1a8a:	00003097          	auipc	ra,0x3
    1a8e:	ec0080e7          	jalr	-320(ra) # 494a <exit>
      exit(1);
    1a92:	4505                	li	a0,1
    1a94:	00003097          	auipc	ra,0x3
    1a98:	eb6080e7          	jalr	-330(ra) # 494a <exit>

0000000000001a9c <bigargtest>:
{
    1a9c:	7179                	addi	sp,sp,-48
    1a9e:	f406                	sd	ra,40(sp)
    1aa0:	f022                	sd	s0,32(sp)
    1aa2:	ec26                	sd	s1,24(sp)
    1aa4:	1800                	addi	s0,sp,48
    1aa6:	84aa                	mv	s1,a0
  remove("bigarg-ok");
    1aa8:	00004517          	auipc	a0,0x4
    1aac:	d8850513          	addi	a0,a0,-632 # 5830 <malloc+0xa80>
    1ab0:	00003097          	auipc	ra,0x3
    1ab4:	f42080e7          	jalr	-190(ra) # 49f2 <remove>
  pid = fork();
    1ab8:	00003097          	auipc	ra,0x3
    1abc:	e8a080e7          	jalr	-374(ra) # 4942 <fork>
  if(pid == 0){
    1ac0:	c921                	beqz	a0,1b10 <bigargtest+0x74>
  } else if(pid < 0){
    1ac2:	0a054a63          	bltz	a0,1b76 <bigargtest+0xda>
  wait(&xstatus);
    1ac6:	fdc40513          	addi	a0,s0,-36
    1aca:	00003097          	auipc	ra,0x3
    1ace:	e88080e7          	jalr	-376(ra) # 4952 <wait>
  if(xstatus != 0)
    1ad2:	fdc42503          	lw	a0,-36(s0)
    1ad6:	ed55                	bnez	a0,1b92 <bigargtest+0xf6>
  fd = open("bigarg-ok", 0);
    1ad8:	4581                	li	a1,0
    1ada:	00004517          	auipc	a0,0x4
    1ade:	d5650513          	addi	a0,a0,-682 # 5830 <malloc+0xa80>
    1ae2:	00003097          	auipc	ra,0x3
    1ae6:	ea8080e7          	jalr	-344(ra) # 498a <open>
  if(fd < 0){
    1aea:	0a054863          	bltz	a0,1b9a <bigargtest+0xfe>
  close(fd);
    1aee:	00003097          	auipc	ra,0x3
    1af2:	e84080e7          	jalr	-380(ra) # 4972 <close>
  remove("bigarg-ok");
    1af6:	00004517          	auipc	a0,0x4
    1afa:	d3a50513          	addi	a0,a0,-710 # 5830 <malloc+0xa80>
    1afe:	00003097          	auipc	ra,0x3
    1b02:	ef4080e7          	jalr	-268(ra) # 49f2 <remove>
}
    1b06:	70a2                	ld	ra,40(sp)
    1b08:	7402                	ld	s0,32(sp)
    1b0a:	64e2                	ld	s1,24(sp)
    1b0c:	6145                	addi	sp,sp,48
    1b0e:	8082                	ret
    1b10:	00005797          	auipc	a5,0x5
    1b14:	54078793          	addi	a5,a5,1344 # 7050 <args.1791>
    1b18:	00005697          	auipc	a3,0x5
    1b1c:	63068693          	addi	a3,a3,1584 # 7148 <args.1791+0xf8>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    1b20:	00004717          	auipc	a4,0x4
    1b24:	d2070713          	addi	a4,a4,-736 # 5840 <malloc+0xa90>
    1b28:	e398                	sd	a4,0(a5)
    for(i = 0; i < MAXARG-1; i++)
    1b2a:	07a1                	addi	a5,a5,8
    1b2c:	fed79ee3          	bne	a5,a3,1b28 <bigargtest+0x8c>
    args[MAXARG-1] = 0;
    1b30:	00005797          	auipc	a5,0x5
    1b34:	6007bc23          	sd	zero,1560(a5) # 7148 <args.1791+0xf8>
    exec("echo", args);
    1b38:	00005597          	auipc	a1,0x5
    1b3c:	51858593          	addi	a1,a1,1304 # 7050 <args.1791>
    1b40:	00003517          	auipc	a0,0x3
    1b44:	3e050513          	addi	a0,a0,992 # 4f20 <malloc+0x170>
    1b48:	00003097          	auipc	ra,0x3
    1b4c:	e3a080e7          	jalr	-454(ra) # 4982 <exec>
    fd = open("bigarg-ok", O_CREATE);
    1b50:	20000593          	li	a1,512
    1b54:	00004517          	auipc	a0,0x4
    1b58:	cdc50513          	addi	a0,a0,-804 # 5830 <malloc+0xa80>
    1b5c:	00003097          	auipc	ra,0x3
    1b60:	e2e080e7          	jalr	-466(ra) # 498a <open>
    close(fd);
    1b64:	00003097          	auipc	ra,0x3
    1b68:	e0e080e7          	jalr	-498(ra) # 4972 <close>
    exit(0);
    1b6c:	4501                	li	a0,0
    1b6e:	00003097          	auipc	ra,0x3
    1b72:	ddc080e7          	jalr	-548(ra) # 494a <exit>
    printf("%s: bigargtest: fork failed\n", s);
    1b76:	85a6                	mv	a1,s1
    1b78:	00004517          	auipc	a0,0x4
    1b7c:	da850513          	addi	a0,a0,-600 # 5920 <malloc+0xb70>
    1b80:	00003097          	auipc	ra,0x3
    1b84:	170080e7          	jalr	368(ra) # 4cf0 <printf>
    exit(1);
    1b88:	4505                	li	a0,1
    1b8a:	00003097          	auipc	ra,0x3
    1b8e:	dc0080e7          	jalr	-576(ra) # 494a <exit>
    exit(xstatus);
    1b92:	00003097          	auipc	ra,0x3
    1b96:	db8080e7          	jalr	-584(ra) # 494a <exit>
    printf("%s: bigarg test failed!\n", s);
    1b9a:	85a6                	mv	a1,s1
    1b9c:	00004517          	auipc	a0,0x4
    1ba0:	da450513          	addi	a0,a0,-604 # 5940 <malloc+0xb90>
    1ba4:	00003097          	auipc	ra,0x3
    1ba8:	14c080e7          	jalr	332(ra) # 4cf0 <printf>
    exit(1);
    1bac:	4505                	li	a0,1
    1bae:	00003097          	auipc	ra,0x3
    1bb2:	d9c080e7          	jalr	-612(ra) # 494a <exit>

0000000000001bb6 <stacktest>:
{
    1bb6:	7179                	addi	sp,sp,-48
    1bb8:	f406                	sd	ra,40(sp)
    1bba:	f022                	sd	s0,32(sp)
    1bbc:	ec26                	sd	s1,24(sp)
    1bbe:	1800                	addi	s0,sp,48
    1bc0:	84aa                	mv	s1,a0
  pid = fork();
    1bc2:	00003097          	auipc	ra,0x3
    1bc6:	d80080e7          	jalr	-640(ra) # 4942 <fork>
  if(pid == 0) {
    1bca:	c115                	beqz	a0,1bee <stacktest+0x38>
  } else if(pid < 0){
    1bcc:	04054363          	bltz	a0,1c12 <stacktest+0x5c>
  wait(&xstatus);
    1bd0:	fdc40513          	addi	a0,s0,-36
    1bd4:	00003097          	auipc	ra,0x3
    1bd8:	d7e080e7          	jalr	-642(ra) # 4952 <wait>
  if(xstatus == -1)  // kernel killed child?
    1bdc:	fdc42503          	lw	a0,-36(s0)
    1be0:	57fd                	li	a5,-1
    1be2:	04f50663          	beq	a0,a5,1c2e <stacktest+0x78>
    exit(xstatus);
    1be6:	00003097          	auipc	ra,0x3
    1bea:	d64080e7          	jalr	-668(ra) # 494a <exit>

static inline uint64
r_sp()
{
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
    1bee:	870a                	mv	a4,sp
    printf("%s: stacktest: read below stack %p\n", *sp);
    1bf0:	77fd                	lui	a5,0xfffff
    1bf2:	97ba                	add	a5,a5,a4
    1bf4:	0007c583          	lbu	a1,0(a5) # fffffffffffff000 <_end+0xffffffffffff2f80>
    1bf8:	00004517          	auipc	a0,0x4
    1bfc:	d6850513          	addi	a0,a0,-664 # 5960 <malloc+0xbb0>
    1c00:	00003097          	auipc	ra,0x3
    1c04:	0f0080e7          	jalr	240(ra) # 4cf0 <printf>
    exit(1);
    1c08:	4505                	li	a0,1
    1c0a:	00003097          	auipc	ra,0x3
    1c0e:	d40080e7          	jalr	-704(ra) # 494a <exit>
    printf("%s: fork failed\n", s);
    1c12:	85a6                	mv	a1,s1
    1c14:	00004517          	auipc	a0,0x4
    1c18:	99c50513          	addi	a0,a0,-1636 # 55b0 <malloc+0x800>
    1c1c:	00003097          	auipc	ra,0x3
    1c20:	0d4080e7          	jalr	212(ra) # 4cf0 <printf>
    exit(1);
    1c24:	4505                	li	a0,1
    1c26:	00003097          	auipc	ra,0x3
    1c2a:	d24080e7          	jalr	-732(ra) # 494a <exit>
    exit(0);
    1c2e:	4501                	li	a0,0
    1c30:	00003097          	auipc	ra,0x3
    1c34:	d1a080e7          	jalr	-742(ra) # 494a <exit>

0000000000001c38 <copyinstr3>:
{
    1c38:	7179                	addi	sp,sp,-48
    1c3a:	f406                	sd	ra,40(sp)
    1c3c:	f022                	sd	s0,32(sp)
    1c3e:	ec26                	sd	s1,24(sp)
    1c40:	1800                	addi	s0,sp,48
  sbrk(8192);
    1c42:	6509                	lui	a0,0x2
    1c44:	00003097          	auipc	ra,0x3
    1c48:	d76080e7          	jalr	-650(ra) # 49ba <sbrk>
  uint64 top = (uint64) sbrk(0);
    1c4c:	4501                	li	a0,0
    1c4e:	00003097          	auipc	ra,0x3
    1c52:	d6c080e7          	jalr	-660(ra) # 49ba <sbrk>
  if((top % PGSIZE) != 0){
    1c56:	6785                	lui	a5,0x1
    1c58:	17fd                	addi	a5,a5,-1
    1c5a:	8fe9                	and	a5,a5,a0
    1c5c:	ebad                	bnez	a5,1cce <copyinstr3+0x96>
  top = (uint64) sbrk(0);
    1c5e:	4501                	li	a0,0
    1c60:	00003097          	auipc	ra,0x3
    1c64:	d5a080e7          	jalr	-678(ra) # 49ba <sbrk>
  if(top % PGSIZE){
    1c68:	6785                	lui	a5,0x1
    1c6a:	17fd                	addi	a5,a5,-1
    1c6c:	8fe9                	and	a5,a5,a0
    1c6e:	ebbd                	bnez	a5,1ce4 <copyinstr3+0xac>
  char *b = (char *) (top - 1);
    1c70:	fff50493          	addi	s1,a0,-1 # 1fff <sbrkmuch+0x121>
  *b = 'x';
    1c74:	07800793          	li	a5,120
    1c78:	fef50fa3          	sb	a5,-1(a0)
  int ret = remove(b);
    1c7c:	8526                	mv	a0,s1
    1c7e:	00003097          	auipc	ra,0x3
    1c82:	d74080e7          	jalr	-652(ra) # 49f2 <remove>
  if(ret != -1){
    1c86:	57fd                	li	a5,-1
    1c88:	06f51b63          	bne	a0,a5,1cfe <copyinstr3+0xc6>
  int fd = open(b, O_CREATE | O_WRONLY);
    1c8c:	20100593          	li	a1,513
    1c90:	8526                	mv	a0,s1
    1c92:	00003097          	auipc	ra,0x3
    1c96:	cf8080e7          	jalr	-776(ra) # 498a <open>
  if(fd != -1){
    1c9a:	57fd                	li	a5,-1
    1c9c:	08f51063          	bne	a0,a5,1d1c <copyinstr3+0xe4>
  char *args[] = { "xx", 0 };
    1ca0:	00004797          	auipc	a5,0x4
    1ca4:	47078793          	addi	a5,a5,1136 # 6110 <malloc+0x1360>
    1ca8:	fcf43823          	sd	a5,-48(s0)
    1cac:	fc043c23          	sd	zero,-40(s0)
  ret = exec(b, args);
    1cb0:	fd040593          	addi	a1,s0,-48
    1cb4:	8526                	mv	a0,s1
    1cb6:	00003097          	auipc	ra,0x3
    1cba:	ccc080e7          	jalr	-820(ra) # 4982 <exec>
  if(ret != -1){
    1cbe:	57fd                	li	a5,-1
    1cc0:	06f51d63          	bne	a0,a5,1d3a <copyinstr3+0x102>
}
    1cc4:	70a2                	ld	ra,40(sp)
    1cc6:	7402                	ld	s0,32(sp)
    1cc8:	64e2                	ld	s1,24(sp)
    1cca:	6145                	addi	sp,sp,48
    1ccc:	8082                	ret
    sbrk(PGSIZE - (top % PGSIZE));
    1cce:	6785                	lui	a5,0x1
    1cd0:	17fd                	addi	a5,a5,-1
    1cd2:	8d7d                	and	a0,a0,a5
    1cd4:	6785                	lui	a5,0x1
    1cd6:	40a7853b          	subw	a0,a5,a0
    1cda:	00003097          	auipc	ra,0x3
    1cde:	ce0080e7          	jalr	-800(ra) # 49ba <sbrk>
    1ce2:	bfb5                	j	1c5e <copyinstr3+0x26>
    printf("oops\n");
    1ce4:	00004517          	auipc	a0,0x4
    1ce8:	ca450513          	addi	a0,a0,-860 # 5988 <malloc+0xbd8>
    1cec:	00003097          	auipc	ra,0x3
    1cf0:	004080e7          	jalr	4(ra) # 4cf0 <printf>
    exit(1);
    1cf4:	4505                	li	a0,1
    1cf6:	00003097          	auipc	ra,0x3
    1cfa:	c54080e7          	jalr	-940(ra) # 494a <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    1cfe:	862a                	mv	a2,a0
    1d00:	85a6                	mv	a1,s1
    1d02:	00003517          	auipc	a0,0x3
    1d06:	7f650513          	addi	a0,a0,2038 # 54f8 <malloc+0x748>
    1d0a:	00003097          	auipc	ra,0x3
    1d0e:	fe6080e7          	jalr	-26(ra) # 4cf0 <printf>
    exit(1);
    1d12:	4505                	li	a0,1
    1d14:	00003097          	auipc	ra,0x3
    1d18:	c36080e7          	jalr	-970(ra) # 494a <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    1d1c:	862a                	mv	a2,a0
    1d1e:	85a6                	mv	a1,s1
    1d20:	00003517          	auipc	a0,0x3
    1d24:	7f850513          	addi	a0,a0,2040 # 5518 <malloc+0x768>
    1d28:	00003097          	auipc	ra,0x3
    1d2c:	fc8080e7          	jalr	-56(ra) # 4cf0 <printf>
    exit(1);
    1d30:	4505                	li	a0,1
    1d32:	00003097          	auipc	ra,0x3
    1d36:	c18080e7          	jalr	-1000(ra) # 494a <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1d3a:	567d                	li	a2,-1
    1d3c:	85a6                	mv	a1,s1
    1d3e:	00003517          	auipc	a0,0x3
    1d42:	7fa50513          	addi	a0,a0,2042 # 5538 <malloc+0x788>
    1d46:	00003097          	auipc	ra,0x3
    1d4a:	faa080e7          	jalr	-86(ra) # 4cf0 <printf>
    exit(1);
    1d4e:	4505                	li	a0,1
    1d50:	00003097          	auipc	ra,0x3
    1d54:	bfa080e7          	jalr	-1030(ra) # 494a <exit>

0000000000001d58 <sbrkbasic>:
{
    1d58:	715d                	addi	sp,sp,-80
    1d5a:	e486                	sd	ra,72(sp)
    1d5c:	e0a2                	sd	s0,64(sp)
    1d5e:	fc26                	sd	s1,56(sp)
    1d60:	f84a                	sd	s2,48(sp)
    1d62:	f44e                	sd	s3,40(sp)
    1d64:	f052                	sd	s4,32(sp)
    1d66:	ec56                	sd	s5,24(sp)
    1d68:	0880                	addi	s0,sp,80
    1d6a:	8aaa                	mv	s5,a0
  pid = fork();
    1d6c:	00003097          	auipc	ra,0x3
    1d70:	bd6080e7          	jalr	-1066(ra) # 4942 <fork>
  if(pid < 0){
    1d74:	02054c63          	bltz	a0,1dac <sbrkbasic+0x54>
  if(pid == 0){
    1d78:	ed21                	bnez	a0,1dd0 <sbrkbasic+0x78>
    a = sbrk(TOOMUCH);
    1d7a:	40000537          	lui	a0,0x40000
    1d7e:	00003097          	auipc	ra,0x3
    1d82:	c3c080e7          	jalr	-964(ra) # 49ba <sbrk>
    if(a == (char*)0xffffffffffffffffL){
    1d86:	57fd                	li	a5,-1
    1d88:	02f50f63          	beq	a0,a5,1dc6 <sbrkbasic+0x6e>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d8c:	400007b7          	lui	a5,0x40000
    1d90:	97aa                	add	a5,a5,a0
      *b = 99;
    1d92:	06300693          	li	a3,99
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d96:	6705                	lui	a4,0x1
      *b = 99;
    1d98:	00d50023          	sb	a3,0(a0) # 40000000 <_end+0x3fff3f80>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d9c:	953a                	add	a0,a0,a4
    1d9e:	fef51de3          	bne	a0,a5,1d98 <sbrkbasic+0x40>
    exit(1);
    1da2:	4505                	li	a0,1
    1da4:	00003097          	auipc	ra,0x3
    1da8:	ba6080e7          	jalr	-1114(ra) # 494a <exit>
    printf("fork failed in sbrkbasic\n");
    1dac:	00004517          	auipc	a0,0x4
    1db0:	be450513          	addi	a0,a0,-1052 # 5990 <malloc+0xbe0>
    1db4:	00003097          	auipc	ra,0x3
    1db8:	f3c080e7          	jalr	-196(ra) # 4cf0 <printf>
    exit(1);
    1dbc:	4505                	li	a0,1
    1dbe:	00003097          	auipc	ra,0x3
    1dc2:	b8c080e7          	jalr	-1140(ra) # 494a <exit>
      exit(0);
    1dc6:	4501                	li	a0,0
    1dc8:	00003097          	auipc	ra,0x3
    1dcc:	b82080e7          	jalr	-1150(ra) # 494a <exit>
  wait(&xstatus);
    1dd0:	fbc40513          	addi	a0,s0,-68
    1dd4:	00003097          	auipc	ra,0x3
    1dd8:	b7e080e7          	jalr	-1154(ra) # 4952 <wait>
  if(xstatus == 1){
    1ddc:	fbc42703          	lw	a4,-68(s0)
    1de0:	4785                	li	a5,1
    1de2:	00f70e63          	beq	a4,a5,1dfe <sbrkbasic+0xa6>
  a = sbrk(0);
    1de6:	4501                	li	a0,0
    1de8:	00003097          	auipc	ra,0x3
    1dec:	bd2080e7          	jalr	-1070(ra) # 49ba <sbrk>
    1df0:	84aa                	mv	s1,a0
  for(i = 0; i < 5000; i++){
    1df2:	4901                	li	s2,0
    *b = 1;
    1df4:	4a05                	li	s4,1
  for(i = 0; i < 5000; i++){
    1df6:	6985                	lui	s3,0x1
    1df8:	38898993          	addi	s3,s3,904 # 1388 <exectest+0xc2>
    1dfc:	a005                	j	1e1c <sbrkbasic+0xc4>
    printf("%s: too much memory allocated!\n", s);
    1dfe:	85d6                	mv	a1,s5
    1e00:	00004517          	auipc	a0,0x4
    1e04:	bb050513          	addi	a0,a0,-1104 # 59b0 <malloc+0xc00>
    1e08:	00003097          	auipc	ra,0x3
    1e0c:	ee8080e7          	jalr	-280(ra) # 4cf0 <printf>
    exit(1);
    1e10:	4505                	li	a0,1
    1e12:	00003097          	auipc	ra,0x3
    1e16:	b38080e7          	jalr	-1224(ra) # 494a <exit>
    a = b + 1;
    1e1a:	84be                	mv	s1,a5
    b = sbrk(1);
    1e1c:	4505                	li	a0,1
    1e1e:	00003097          	auipc	ra,0x3
    1e22:	b9c080e7          	jalr	-1124(ra) # 49ba <sbrk>
    if(b != a){
    1e26:	04951b63          	bne	a0,s1,1e7c <sbrkbasic+0x124>
    *b = 1;
    1e2a:	01448023          	sb	s4,0(s1)
    a = b + 1;
    1e2e:	00148793          	addi	a5,s1,1
  for(i = 0; i < 5000; i++){
    1e32:	2905                	addiw	s2,s2,1
    1e34:	ff3913e3          	bne	s2,s3,1e1a <sbrkbasic+0xc2>
  pid = fork();
    1e38:	00003097          	auipc	ra,0x3
    1e3c:	b0a080e7          	jalr	-1270(ra) # 4942 <fork>
    1e40:	892a                	mv	s2,a0
  if(pid < 0){
    1e42:	04054d63          	bltz	a0,1e9c <sbrkbasic+0x144>
  c = sbrk(1);
    1e46:	4505                	li	a0,1
    1e48:	00003097          	auipc	ra,0x3
    1e4c:	b72080e7          	jalr	-1166(ra) # 49ba <sbrk>
  c = sbrk(1);
    1e50:	4505                	li	a0,1
    1e52:	00003097          	auipc	ra,0x3
    1e56:	b68080e7          	jalr	-1176(ra) # 49ba <sbrk>
  if(c != a + 1){
    1e5a:	0489                	addi	s1,s1,2
    1e5c:	04a48e63          	beq	s1,a0,1eb8 <sbrkbasic+0x160>
    printf("%s: sbrk test failed post-fork\n", s);
    1e60:	85d6                	mv	a1,s5
    1e62:	00004517          	auipc	a0,0x4
    1e66:	bae50513          	addi	a0,a0,-1106 # 5a10 <malloc+0xc60>
    1e6a:	00003097          	auipc	ra,0x3
    1e6e:	e86080e7          	jalr	-378(ra) # 4cf0 <printf>
    exit(1);
    1e72:	4505                	li	a0,1
    1e74:	00003097          	auipc	ra,0x3
    1e78:	ad6080e7          	jalr	-1322(ra) # 494a <exit>
      printf("%s: sbrk test failed %d %x %x\n", i, a, b);
    1e7c:	86aa                	mv	a3,a0
    1e7e:	8626                	mv	a2,s1
    1e80:	85ca                	mv	a1,s2
    1e82:	00004517          	auipc	a0,0x4
    1e86:	b4e50513          	addi	a0,a0,-1202 # 59d0 <malloc+0xc20>
    1e8a:	00003097          	auipc	ra,0x3
    1e8e:	e66080e7          	jalr	-410(ra) # 4cf0 <printf>
      exit(1);
    1e92:	4505                	li	a0,1
    1e94:	00003097          	auipc	ra,0x3
    1e98:	ab6080e7          	jalr	-1354(ra) # 494a <exit>
    printf("%s: sbrk test fork failed\n", s);
    1e9c:	85d6                	mv	a1,s5
    1e9e:	00004517          	auipc	a0,0x4
    1ea2:	b5250513          	addi	a0,a0,-1198 # 59f0 <malloc+0xc40>
    1ea6:	00003097          	auipc	ra,0x3
    1eaa:	e4a080e7          	jalr	-438(ra) # 4cf0 <printf>
    exit(1);
    1eae:	4505                	li	a0,1
    1eb0:	00003097          	auipc	ra,0x3
    1eb4:	a9a080e7          	jalr	-1382(ra) # 494a <exit>
  if(pid == 0)
    1eb8:	00091763          	bnez	s2,1ec6 <sbrkbasic+0x16e>
    exit(0);
    1ebc:	4501                	li	a0,0
    1ebe:	00003097          	auipc	ra,0x3
    1ec2:	a8c080e7          	jalr	-1396(ra) # 494a <exit>
  wait(&xstatus);
    1ec6:	fbc40513          	addi	a0,s0,-68
    1eca:	00003097          	auipc	ra,0x3
    1ece:	a88080e7          	jalr	-1400(ra) # 4952 <wait>
  exit(xstatus);
    1ed2:	fbc42503          	lw	a0,-68(s0)
    1ed6:	00003097          	auipc	ra,0x3
    1eda:	a74080e7          	jalr	-1420(ra) # 494a <exit>

0000000000001ede <sbrkmuch>:
{
    1ede:	7179                	addi	sp,sp,-48
    1ee0:	f406                	sd	ra,40(sp)
    1ee2:	f022                	sd	s0,32(sp)
    1ee4:	ec26                	sd	s1,24(sp)
    1ee6:	e84a                	sd	s2,16(sp)
    1ee8:	e44e                	sd	s3,8(sp)
    1eea:	e052                	sd	s4,0(sp)
    1eec:	1800                	addi	s0,sp,48
    1eee:	89aa                	mv	s3,a0
  oldbrk = sbrk(0);
    1ef0:	4501                	li	a0,0
    1ef2:	00003097          	auipc	ra,0x3
    1ef6:	ac8080e7          	jalr	-1336(ra) # 49ba <sbrk>
    1efa:	892a                	mv	s2,a0
  a = sbrk(0);
    1efc:	4501                	li	a0,0
    1efe:	00003097          	auipc	ra,0x3
    1f02:	abc080e7          	jalr	-1348(ra) # 49ba <sbrk>
    1f06:	84aa                	mv	s1,a0
  p = sbrk(amt);
    1f08:	00300537          	lui	a0,0x300
    1f0c:	9d05                	subw	a0,a0,s1
    1f0e:	00003097          	auipc	ra,0x3
    1f12:	aac080e7          	jalr	-1364(ra) # 49ba <sbrk>
  if (p != a) {
    1f16:	0ca49763          	bne	s1,a0,1fe4 <sbrkmuch+0x106>
  char *eee = sbrk(0);
    1f1a:	4501                	li	a0,0
    1f1c:	00003097          	auipc	ra,0x3
    1f20:	a9e080e7          	jalr	-1378(ra) # 49ba <sbrk>
  for(char *pp = a; pp < eee; pp += 4096)
    1f24:	00a4f963          	bleu	a0,s1,1f36 <sbrkmuch+0x58>
    *pp = 1;
    1f28:	4705                	li	a4,1
  for(char *pp = a; pp < eee; pp += 4096)
    1f2a:	6785                	lui	a5,0x1
    *pp = 1;
    1f2c:	00e48023          	sb	a4,0(s1)
  for(char *pp = a; pp < eee; pp += 4096)
    1f30:	94be                	add	s1,s1,a5
    1f32:	fea4ede3          	bltu	s1,a0,1f2c <sbrkmuch+0x4e>
  *lastaddr = 99;
    1f36:	003007b7          	lui	a5,0x300
    1f3a:	06300713          	li	a4,99
    1f3e:	fee78fa3          	sb	a4,-1(a5) # 2fffff <_end+0x2f3f7f>
  a = sbrk(0);
    1f42:	4501                	li	a0,0
    1f44:	00003097          	auipc	ra,0x3
    1f48:	a76080e7          	jalr	-1418(ra) # 49ba <sbrk>
    1f4c:	84aa                	mv	s1,a0
  c = sbrk(-PGSIZE);
    1f4e:	757d                	lui	a0,0xfffff
    1f50:	00003097          	auipc	ra,0x3
    1f54:	a6a080e7          	jalr	-1430(ra) # 49ba <sbrk>
  if(c == (char*)0xffffffffffffffffL){
    1f58:	57fd                	li	a5,-1
    1f5a:	0af50363          	beq	a0,a5,2000 <sbrkmuch+0x122>
  c = sbrk(0);
    1f5e:	4501                	li	a0,0
    1f60:	00003097          	auipc	ra,0x3
    1f64:	a5a080e7          	jalr	-1446(ra) # 49ba <sbrk>
  if(c != a - PGSIZE){
    1f68:	77fd                	lui	a5,0xfffff
    1f6a:	97a6                	add	a5,a5,s1
    1f6c:	0af51863          	bne	a0,a5,201c <sbrkmuch+0x13e>
  a = sbrk(0);
    1f70:	4501                	li	a0,0
    1f72:	00003097          	auipc	ra,0x3
    1f76:	a48080e7          	jalr	-1464(ra) # 49ba <sbrk>
    1f7a:	84aa                	mv	s1,a0
  c = sbrk(PGSIZE);
    1f7c:	6505                	lui	a0,0x1
    1f7e:	00003097          	auipc	ra,0x3
    1f82:	a3c080e7          	jalr	-1476(ra) # 49ba <sbrk>
    1f86:	8a2a                	mv	s4,a0
  if(c != a || sbrk(0) != a + PGSIZE){
    1f88:	0aa49963          	bne	s1,a0,203a <sbrkmuch+0x15c>
    1f8c:	4501                	li	a0,0
    1f8e:	00003097          	auipc	ra,0x3
    1f92:	a2c080e7          	jalr	-1492(ra) # 49ba <sbrk>
    1f96:	6785                	lui	a5,0x1
    1f98:	97a6                	add	a5,a5,s1
    1f9a:	0af51063          	bne	a0,a5,203a <sbrkmuch+0x15c>
  if(*lastaddr == 99){
    1f9e:	003007b7          	lui	a5,0x300
    1fa2:	fff7c703          	lbu	a4,-1(a5) # 2fffff <_end+0x2f3f7f>
    1fa6:	06300793          	li	a5,99
    1faa:	0af70763          	beq	a4,a5,2058 <sbrkmuch+0x17a>
  a = sbrk(0);
    1fae:	4501                	li	a0,0
    1fb0:	00003097          	auipc	ra,0x3
    1fb4:	a0a080e7          	jalr	-1526(ra) # 49ba <sbrk>
    1fb8:	84aa                	mv	s1,a0
  c = sbrk(-(sbrk(0) - oldbrk));
    1fba:	4501                	li	a0,0
    1fbc:	00003097          	auipc	ra,0x3
    1fc0:	9fe080e7          	jalr	-1538(ra) # 49ba <sbrk>
    1fc4:	40a9053b          	subw	a0,s2,a0
    1fc8:	00003097          	auipc	ra,0x3
    1fcc:	9f2080e7          	jalr	-1550(ra) # 49ba <sbrk>
  if(c != a){
    1fd0:	0aa49263          	bne	s1,a0,2074 <sbrkmuch+0x196>
}
    1fd4:	70a2                	ld	ra,40(sp)
    1fd6:	7402                	ld	s0,32(sp)
    1fd8:	64e2                	ld	s1,24(sp)
    1fda:	6942                	ld	s2,16(sp)
    1fdc:	69a2                	ld	s3,8(sp)
    1fde:	6a02                	ld	s4,0(sp)
    1fe0:	6145                	addi	sp,sp,48
    1fe2:	8082                	ret
    printf("%s: sbrk test failed to grow big address space; enough phys mem?\n", s);
    1fe4:	85ce                	mv	a1,s3
    1fe6:	00004517          	auipc	a0,0x4
    1fea:	a4a50513          	addi	a0,a0,-1462 # 5a30 <malloc+0xc80>
    1fee:	00003097          	auipc	ra,0x3
    1ff2:	d02080e7          	jalr	-766(ra) # 4cf0 <printf>
    exit(1);
    1ff6:	4505                	li	a0,1
    1ff8:	00003097          	auipc	ra,0x3
    1ffc:	952080e7          	jalr	-1710(ra) # 494a <exit>
    printf("%s: sbrk could not deallocate\n", s);
    2000:	85ce                	mv	a1,s3
    2002:	00004517          	auipc	a0,0x4
    2006:	a7650513          	addi	a0,a0,-1418 # 5a78 <malloc+0xcc8>
    200a:	00003097          	auipc	ra,0x3
    200e:	ce6080e7          	jalr	-794(ra) # 4cf0 <printf>
    exit(1);
    2012:	4505                	li	a0,1
    2014:	00003097          	auipc	ra,0x3
    2018:	936080e7          	jalr	-1738(ra) # 494a <exit>
    printf("%s: sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    201c:	862a                	mv	a2,a0
    201e:	85a6                	mv	a1,s1
    2020:	00004517          	auipc	a0,0x4
    2024:	a7850513          	addi	a0,a0,-1416 # 5a98 <malloc+0xce8>
    2028:	00003097          	auipc	ra,0x3
    202c:	cc8080e7          	jalr	-824(ra) # 4cf0 <printf>
    exit(1);
    2030:	4505                	li	a0,1
    2032:	00003097          	auipc	ra,0x3
    2036:	918080e7          	jalr	-1768(ra) # 494a <exit>
    printf("%s: sbrk re-allocation failed, a %x c %x\n", a, c);
    203a:	8652                	mv	a2,s4
    203c:	85a6                	mv	a1,s1
    203e:	00004517          	auipc	a0,0x4
    2042:	a9a50513          	addi	a0,a0,-1382 # 5ad8 <malloc+0xd28>
    2046:	00003097          	auipc	ra,0x3
    204a:	caa080e7          	jalr	-854(ra) # 4cf0 <printf>
    exit(1);
    204e:	4505                	li	a0,1
    2050:	00003097          	auipc	ra,0x3
    2054:	8fa080e7          	jalr	-1798(ra) # 494a <exit>
    printf("%s: sbrk de-allocation didn't really deallocate\n", s);
    2058:	85ce                	mv	a1,s3
    205a:	00004517          	auipc	a0,0x4
    205e:	aae50513          	addi	a0,a0,-1362 # 5b08 <malloc+0xd58>
    2062:	00003097          	auipc	ra,0x3
    2066:	c8e080e7          	jalr	-882(ra) # 4cf0 <printf>
    exit(1);
    206a:	4505                	li	a0,1
    206c:	00003097          	auipc	ra,0x3
    2070:	8de080e7          	jalr	-1826(ra) # 494a <exit>
    printf("%s: sbrk downsize failed, a %x c %x\n", a, c);
    2074:	862a                	mv	a2,a0
    2076:	85a6                	mv	a1,s1
    2078:	00004517          	auipc	a0,0x4
    207c:	ac850513          	addi	a0,a0,-1336 # 5b40 <malloc+0xd90>
    2080:	00003097          	auipc	ra,0x3
    2084:	c70080e7          	jalr	-912(ra) # 4cf0 <printf>
    exit(1);
    2088:	4505                	li	a0,1
    208a:	00003097          	auipc	ra,0x3
    208e:	8c0080e7          	jalr	-1856(ra) # 494a <exit>

0000000000002092 <sbrkarg>:
{
    2092:	7179                	addi	sp,sp,-48
    2094:	f406                	sd	ra,40(sp)
    2096:	f022                	sd	s0,32(sp)
    2098:	ec26                	sd	s1,24(sp)
    209a:	e84a                	sd	s2,16(sp)
    209c:	e44e                	sd	s3,8(sp)
    209e:	1800                	addi	s0,sp,48
    20a0:	89aa                	mv	s3,a0
  a = sbrk(PGSIZE);
    20a2:	6505                	lui	a0,0x1
    20a4:	00003097          	auipc	ra,0x3
    20a8:	916080e7          	jalr	-1770(ra) # 49ba <sbrk>
    20ac:	892a                	mv	s2,a0
  fd = open("sbrk", O_CREATE|O_WRONLY);
    20ae:	20100593          	li	a1,513
    20b2:	00004517          	auipc	a0,0x4
    20b6:	ab650513          	addi	a0,a0,-1354 # 5b68 <malloc+0xdb8>
    20ba:	00003097          	auipc	ra,0x3
    20be:	8d0080e7          	jalr	-1840(ra) # 498a <open>
    20c2:	84aa                	mv	s1,a0
  remove("sbrk");
    20c4:	00004517          	auipc	a0,0x4
    20c8:	aa450513          	addi	a0,a0,-1372 # 5b68 <malloc+0xdb8>
    20cc:	00003097          	auipc	ra,0x3
    20d0:	926080e7          	jalr	-1754(ra) # 49f2 <remove>
  if(fd < 0)  {
    20d4:	0404c163          	bltz	s1,2116 <sbrkarg+0x84>
  if ((n = write(fd, a, PGSIZE)) < 0) {
    20d8:	6605                	lui	a2,0x1
    20da:	85ca                	mv	a1,s2
    20dc:	8526                	mv	a0,s1
    20de:	00003097          	auipc	ra,0x3
    20e2:	88c080e7          	jalr	-1908(ra) # 496a <write>
    20e6:	04054663          	bltz	a0,2132 <sbrkarg+0xa0>
  close(fd);
    20ea:	8526                	mv	a0,s1
    20ec:	00003097          	auipc	ra,0x3
    20f0:	886080e7          	jalr	-1914(ra) # 4972 <close>
  a = sbrk(PGSIZE);
    20f4:	6505                	lui	a0,0x1
    20f6:	00003097          	auipc	ra,0x3
    20fa:	8c4080e7          	jalr	-1852(ra) # 49ba <sbrk>
  if(pipe((int *) a) != 0){
    20fe:	00003097          	auipc	ra,0x3
    2102:	85c080e7          	jalr	-1956(ra) # 495a <pipe>
    2106:	e521                	bnez	a0,214e <sbrkarg+0xbc>
}
    2108:	70a2                	ld	ra,40(sp)
    210a:	7402                	ld	s0,32(sp)
    210c:	64e2                	ld	s1,24(sp)
    210e:	6942                	ld	s2,16(sp)
    2110:	69a2                	ld	s3,8(sp)
    2112:	6145                	addi	sp,sp,48
    2114:	8082                	ret
    printf("%s: open sbrk failed\n", s);
    2116:	85ce                	mv	a1,s3
    2118:	00004517          	auipc	a0,0x4
    211c:	a5850513          	addi	a0,a0,-1448 # 5b70 <malloc+0xdc0>
    2120:	00003097          	auipc	ra,0x3
    2124:	bd0080e7          	jalr	-1072(ra) # 4cf0 <printf>
    exit(1);
    2128:	4505                	li	a0,1
    212a:	00003097          	auipc	ra,0x3
    212e:	820080e7          	jalr	-2016(ra) # 494a <exit>
    printf("%s: write sbrk failed\n", s);
    2132:	85ce                	mv	a1,s3
    2134:	00004517          	auipc	a0,0x4
    2138:	a5450513          	addi	a0,a0,-1452 # 5b88 <malloc+0xdd8>
    213c:	00003097          	auipc	ra,0x3
    2140:	bb4080e7          	jalr	-1100(ra) # 4cf0 <printf>
    exit(1);
    2144:	4505                	li	a0,1
    2146:	00003097          	auipc	ra,0x3
    214a:	804080e7          	jalr	-2044(ra) # 494a <exit>
    printf("%s: pipe() failed\n", s);
    214e:	85ce                	mv	a1,s3
    2150:	00003517          	auipc	a0,0x3
    2154:	56850513          	addi	a0,a0,1384 # 56b8 <malloc+0x908>
    2158:	00003097          	auipc	ra,0x3
    215c:	b98080e7          	jalr	-1128(ra) # 4cf0 <printf>
    exit(1);
    2160:	4505                	li	a0,1
    2162:	00002097          	auipc	ra,0x2
    2166:	7e8080e7          	jalr	2024(ra) # 494a <exit>

000000000000216a <argptest>:
{
    216a:	1101                	addi	sp,sp,-32
    216c:	ec06                	sd	ra,24(sp)
    216e:	e822                	sd	s0,16(sp)
    2170:	e426                	sd	s1,8(sp)
    2172:	e04a                	sd	s2,0(sp)
    2174:	1000                	addi	s0,sp,32
    2176:	892a                	mv	s2,a0
  fd = open("init", O_RDONLY);
    2178:	4581                	li	a1,0
    217a:	00004517          	auipc	a0,0x4
    217e:	a2650513          	addi	a0,a0,-1498 # 5ba0 <malloc+0xdf0>
    2182:	00003097          	auipc	ra,0x3
    2186:	808080e7          	jalr	-2040(ra) # 498a <open>
  if (fd < 0) {
    218a:	02054b63          	bltz	a0,21c0 <argptest+0x56>
    218e:	84aa                	mv	s1,a0
  read(fd, sbrk(0) - 1, -1);
    2190:	4501                	li	a0,0
    2192:	00003097          	auipc	ra,0x3
    2196:	828080e7          	jalr	-2008(ra) # 49ba <sbrk>
    219a:	567d                	li	a2,-1
    219c:	fff50593          	addi	a1,a0,-1
    21a0:	8526                	mv	a0,s1
    21a2:	00002097          	auipc	ra,0x2
    21a6:	7c0080e7          	jalr	1984(ra) # 4962 <read>
  close(fd);
    21aa:	8526                	mv	a0,s1
    21ac:	00002097          	auipc	ra,0x2
    21b0:	7c6080e7          	jalr	1990(ra) # 4972 <close>
}
    21b4:	60e2                	ld	ra,24(sp)
    21b6:	6442                	ld	s0,16(sp)
    21b8:	64a2                	ld	s1,8(sp)
    21ba:	6902                	ld	s2,0(sp)
    21bc:	6105                	addi	sp,sp,32
    21be:	8082                	ret
    printf("%s: open failed\n", s);
    21c0:	85ca                	mv	a1,s2
    21c2:	00003517          	auipc	a0,0x3
    21c6:	40650513          	addi	a0,a0,1030 # 55c8 <malloc+0x818>
    21ca:	00003097          	auipc	ra,0x3
    21ce:	b26080e7          	jalr	-1242(ra) # 4cf0 <printf>
    exit(1);
    21d2:	4505                	li	a0,1
    21d4:	00002097          	auipc	ra,0x2
    21d8:	776080e7          	jalr	1910(ra) # 494a <exit>

00000000000021dc <sbrkbugs>:
{
    21dc:	1141                	addi	sp,sp,-16
    21de:	e406                	sd	ra,8(sp)
    21e0:	e022                	sd	s0,0(sp)
    21e2:	0800                	addi	s0,sp,16
  int pid = fork();
    21e4:	00002097          	auipc	ra,0x2
    21e8:	75e080e7          	jalr	1886(ra) # 4942 <fork>
  if(pid < 0){
    21ec:	02054363          	bltz	a0,2212 <sbrkbugs+0x36>
  if(pid == 0){
    21f0:	ed15                	bnez	a0,222c <sbrkbugs+0x50>
    int sz = (uint64) sbrk(0);
    21f2:	00002097          	auipc	ra,0x2
    21f6:	7c8080e7          	jalr	1992(ra) # 49ba <sbrk>
    sbrk(-sz);
    21fa:	40a0053b          	negw	a0,a0
    21fe:	2501                	sext.w	a0,a0
    2200:	00002097          	auipc	ra,0x2
    2204:	7ba080e7          	jalr	1978(ra) # 49ba <sbrk>
    exit(0);
    2208:	4501                	li	a0,0
    220a:	00002097          	auipc	ra,0x2
    220e:	740080e7          	jalr	1856(ra) # 494a <exit>
    printf("fork failed\n");
    2212:	00003517          	auipc	a0,0x3
    2216:	71e50513          	addi	a0,a0,1822 # 5930 <malloc+0xb80>
    221a:	00003097          	auipc	ra,0x3
    221e:	ad6080e7          	jalr	-1322(ra) # 4cf0 <printf>
    exit(1);
    2222:	4505                	li	a0,1
    2224:	00002097          	auipc	ra,0x2
    2228:	726080e7          	jalr	1830(ra) # 494a <exit>
  wait(0);
    222c:	4501                	li	a0,0
    222e:	00002097          	auipc	ra,0x2
    2232:	724080e7          	jalr	1828(ra) # 4952 <wait>
  pid = fork();
    2236:	00002097          	auipc	ra,0x2
    223a:	70c080e7          	jalr	1804(ra) # 4942 <fork>
  if(pid < 0){
    223e:	02054563          	bltz	a0,2268 <sbrkbugs+0x8c>
  if(pid == 0){
    2242:	e121                	bnez	a0,2282 <sbrkbugs+0xa6>
    int sz = (uint64) sbrk(0);
    2244:	00002097          	auipc	ra,0x2
    2248:	776080e7          	jalr	1910(ra) # 49ba <sbrk>
    sbrk(-(sz - 3500));
    224c:	6785                	lui	a5,0x1
    224e:	dac7879b          	addiw	a5,a5,-596
    2252:	40a7853b          	subw	a0,a5,a0
    2256:	00002097          	auipc	ra,0x2
    225a:	764080e7          	jalr	1892(ra) # 49ba <sbrk>
    exit(0);
    225e:	4501                	li	a0,0
    2260:	00002097          	auipc	ra,0x2
    2264:	6ea080e7          	jalr	1770(ra) # 494a <exit>
    printf("fork failed\n");
    2268:	00003517          	auipc	a0,0x3
    226c:	6c850513          	addi	a0,a0,1736 # 5930 <malloc+0xb80>
    2270:	00003097          	auipc	ra,0x3
    2274:	a80080e7          	jalr	-1408(ra) # 4cf0 <printf>
    exit(1);
    2278:	4505                	li	a0,1
    227a:	00002097          	auipc	ra,0x2
    227e:	6d0080e7          	jalr	1744(ra) # 494a <exit>
  wait(0);
    2282:	4501                	li	a0,0
    2284:	00002097          	auipc	ra,0x2
    2288:	6ce080e7          	jalr	1742(ra) # 4952 <wait>
  pid = fork();
    228c:	00002097          	auipc	ra,0x2
    2290:	6b6080e7          	jalr	1718(ra) # 4942 <fork>
  if(pid < 0){
    2294:	02054a63          	bltz	a0,22c8 <sbrkbugs+0xec>
  if(pid == 0){
    2298:	e529                	bnez	a0,22e2 <sbrkbugs+0x106>
    sbrk((10*4096 + 2048) - (uint64)sbrk(0));
    229a:	00002097          	auipc	ra,0x2
    229e:	720080e7          	jalr	1824(ra) # 49ba <sbrk>
    22a2:	67ad                	lui	a5,0xb
    22a4:	8007879b          	addiw	a5,a5,-2048
    22a8:	40a7853b          	subw	a0,a5,a0
    22ac:	00002097          	auipc	ra,0x2
    22b0:	70e080e7          	jalr	1806(ra) # 49ba <sbrk>
    sbrk(-10);
    22b4:	5559                	li	a0,-10
    22b6:	00002097          	auipc	ra,0x2
    22ba:	704080e7          	jalr	1796(ra) # 49ba <sbrk>
    exit(0);
    22be:	4501                	li	a0,0
    22c0:	00002097          	auipc	ra,0x2
    22c4:	68a080e7          	jalr	1674(ra) # 494a <exit>
    printf("fork failed\n");
    22c8:	00003517          	auipc	a0,0x3
    22cc:	66850513          	addi	a0,a0,1640 # 5930 <malloc+0xb80>
    22d0:	00003097          	auipc	ra,0x3
    22d4:	a20080e7          	jalr	-1504(ra) # 4cf0 <printf>
    exit(1);
    22d8:	4505                	li	a0,1
    22da:	00002097          	auipc	ra,0x2
    22de:	670080e7          	jalr	1648(ra) # 494a <exit>
  wait(0);
    22e2:	4501                	li	a0,0
    22e4:	00002097          	auipc	ra,0x2
    22e8:	66e080e7          	jalr	1646(ra) # 4952 <wait>
  exit(0);
    22ec:	4501                	li	a0,0
    22ee:	00002097          	auipc	ra,0x2
    22f2:	65c080e7          	jalr	1628(ra) # 494a <exit>

00000000000022f6 <execout>:
// test the exec() code that cleans up if it runs out
// of memory. it's really a test that such a condition
// doesn't cause a panic.
void
execout(char *s)
{
    22f6:	715d                	addi	sp,sp,-80
    22f8:	e486                	sd	ra,72(sp)
    22fa:	e0a2                	sd	s0,64(sp)
    22fc:	fc26                	sd	s1,56(sp)
    22fe:	f84a                	sd	s2,48(sp)
    2300:	f44e                	sd	s3,40(sp)
    2302:	f052                	sd	s4,32(sp)
    2304:	0880                	addi	s0,sp,80
  for(int avail = 0; avail < 15; avail++){
    2306:	4901                	li	s2,0
    2308:	49bd                	li	s3,15
    int pid = fork();
    230a:	00002097          	auipc	ra,0x2
    230e:	638080e7          	jalr	1592(ra) # 4942 <fork>
    2312:	84aa                	mv	s1,a0
    if(pid < 0){
    2314:	02054063          	bltz	a0,2334 <execout+0x3e>
      printf("fork failed\n");
      exit(1);
    } else if(pid == 0){
    2318:	c91d                	beqz	a0,234e <execout+0x58>
      close(1);
      char *args[] = { "echo", "x", 0 };
      exec("echo", args);
      exit(0);
    } else {
      wait((int*)0);
    231a:	4501                	li	a0,0
    231c:	00002097          	auipc	ra,0x2
    2320:	636080e7          	jalr	1590(ra) # 4952 <wait>
  for(int avail = 0; avail < 15; avail++){
    2324:	2905                	addiw	s2,s2,1
    2326:	ff3912e3          	bne	s2,s3,230a <execout+0x14>
    }
  }

  exit(0);
    232a:	4501                	li	a0,0
    232c:	00002097          	auipc	ra,0x2
    2330:	61e080e7          	jalr	1566(ra) # 494a <exit>
      printf("fork failed\n");
    2334:	00003517          	auipc	a0,0x3
    2338:	5fc50513          	addi	a0,a0,1532 # 5930 <malloc+0xb80>
    233c:	00003097          	auipc	ra,0x3
    2340:	9b4080e7          	jalr	-1612(ra) # 4cf0 <printf>
      exit(1);
    2344:	4505                	li	a0,1
    2346:	00002097          	auipc	ra,0x2
    234a:	604080e7          	jalr	1540(ra) # 494a <exit>
        if(a == 0xffffffffffffffffLL)
    234e:	59fd                	li	s3,-1
        *(char*)(a + 4096 - 1) = 1;
    2350:	4a05                	li	s4,1
        uint64 a = (uint64) sbrk(4096);
    2352:	6505                	lui	a0,0x1
    2354:	00002097          	auipc	ra,0x2
    2358:	666080e7          	jalr	1638(ra) # 49ba <sbrk>
        if(a == 0xffffffffffffffffLL)
    235c:	01350763          	beq	a0,s3,236a <execout+0x74>
        *(char*)(a + 4096 - 1) = 1;
    2360:	6785                	lui	a5,0x1
    2362:	97aa                	add	a5,a5,a0
    2364:	ff478fa3          	sb	s4,-1(a5) # fff <copyinstr2+0xb7>
      while(1){
    2368:	b7ed                	j	2352 <execout+0x5c>
      for(int i = 0; i < avail; i++)
    236a:	01205a63          	blez	s2,237e <execout+0x88>
        sbrk(-4096);
    236e:	757d                	lui	a0,0xfffff
    2370:	00002097          	auipc	ra,0x2
    2374:	64a080e7          	jalr	1610(ra) # 49ba <sbrk>
      for(int i = 0; i < avail; i++)
    2378:	2485                	addiw	s1,s1,1
    237a:	ff249ae3          	bne	s1,s2,236e <execout+0x78>
      close(1);
    237e:	4505                	li	a0,1
    2380:	00002097          	auipc	ra,0x2
    2384:	5f2080e7          	jalr	1522(ra) # 4972 <close>
      char *args[] = { "echo", "x", 0 };
    2388:	00003517          	auipc	a0,0x3
    238c:	b9850513          	addi	a0,a0,-1128 # 4f20 <malloc+0x170>
    2390:	faa43c23          	sd	a0,-72(s0)
    2394:	00003797          	auipc	a5,0x3
    2398:	bfc78793          	addi	a5,a5,-1028 # 4f90 <malloc+0x1e0>
    239c:	fcf43023          	sd	a5,-64(s0)
    23a0:	fc043423          	sd	zero,-56(s0)
      exec("echo", args);
    23a4:	fb840593          	addi	a1,s0,-72
    23a8:	00002097          	auipc	ra,0x2
    23ac:	5da080e7          	jalr	1498(ra) # 4982 <exec>
      exit(0);
    23b0:	4501                	li	a0,0
    23b2:	00002097          	auipc	ra,0x2
    23b6:	598080e7          	jalr	1432(ra) # 494a <exit>

00000000000023ba <iputtest>:
{
    23ba:	1101                	addi	sp,sp,-32
    23bc:	ec06                	sd	ra,24(sp)
    23be:	e822                	sd	s0,16(sp)
    23c0:	e426                	sd	s1,8(sp)
    23c2:	1000                	addi	s0,sp,32
    23c4:	84aa                	mv	s1,a0
  if(mkdir("iputdir") < 0){
    23c6:	00003517          	auipc	a0,0x3
    23ca:	7e250513          	addi	a0,a0,2018 # 5ba8 <malloc+0xdf8>
    23ce:	00002097          	auipc	ra,0x2
    23d2:	5cc080e7          	jalr	1484(ra) # 499a <mkdir>
    23d6:	04054563          	bltz	a0,2420 <iputtest+0x66>
  if(chdir("iputdir") < 0){
    23da:	00003517          	auipc	a0,0x3
    23de:	7ce50513          	addi	a0,a0,1998 # 5ba8 <malloc+0xdf8>
    23e2:	00002097          	auipc	ra,0x2
    23e6:	5c0080e7          	jalr	1472(ra) # 49a2 <chdir>
    23ea:	04054963          	bltz	a0,243c <iputtest+0x82>
  if(remove("../iputdir") < 0){
    23ee:	00003517          	auipc	a0,0x3
    23f2:	7fa50513          	addi	a0,a0,2042 # 5be8 <malloc+0xe38>
    23f6:	00002097          	auipc	ra,0x2
    23fa:	5fc080e7          	jalr	1532(ra) # 49f2 <remove>
    23fe:	04054d63          	bltz	a0,2458 <iputtest+0x9e>
  if(chdir("/") < 0){
    2402:	00004517          	auipc	a0,0x4
    2406:	81650513          	addi	a0,a0,-2026 # 5c18 <malloc+0xe68>
    240a:	00002097          	auipc	ra,0x2
    240e:	598080e7          	jalr	1432(ra) # 49a2 <chdir>
    2412:	06054163          	bltz	a0,2474 <iputtest+0xba>
}
    2416:	60e2                	ld	ra,24(sp)
    2418:	6442                	ld	s0,16(sp)
    241a:	64a2                	ld	s1,8(sp)
    241c:	6105                	addi	sp,sp,32
    241e:	8082                	ret
    printf("%s: mkdir failed\n", s);
    2420:	85a6                	mv	a1,s1
    2422:	00003517          	auipc	a0,0x3
    2426:	78e50513          	addi	a0,a0,1934 # 5bb0 <malloc+0xe00>
    242a:	00003097          	auipc	ra,0x3
    242e:	8c6080e7          	jalr	-1850(ra) # 4cf0 <printf>
    exit(1);
    2432:	4505                	li	a0,1
    2434:	00002097          	auipc	ra,0x2
    2438:	516080e7          	jalr	1302(ra) # 494a <exit>
    printf("%s: chdir iputdir failed\n", s);
    243c:	85a6                	mv	a1,s1
    243e:	00003517          	auipc	a0,0x3
    2442:	78a50513          	addi	a0,a0,1930 # 5bc8 <malloc+0xe18>
    2446:	00003097          	auipc	ra,0x3
    244a:	8aa080e7          	jalr	-1878(ra) # 4cf0 <printf>
    exit(1);
    244e:	4505                	li	a0,1
    2450:	00002097          	auipc	ra,0x2
    2454:	4fa080e7          	jalr	1274(ra) # 494a <exit>
    printf("%s: remove ../iputdir failed\n", s);
    2458:	85a6                	mv	a1,s1
    245a:	00003517          	auipc	a0,0x3
    245e:	79e50513          	addi	a0,a0,1950 # 5bf8 <malloc+0xe48>
    2462:	00003097          	auipc	ra,0x3
    2466:	88e080e7          	jalr	-1906(ra) # 4cf0 <printf>
    exit(1);
    246a:	4505                	li	a0,1
    246c:	00002097          	auipc	ra,0x2
    2470:	4de080e7          	jalr	1246(ra) # 494a <exit>
    printf("%s: chdir / failed\n", s);
    2474:	85a6                	mv	a1,s1
    2476:	00003517          	auipc	a0,0x3
    247a:	7aa50513          	addi	a0,a0,1962 # 5c20 <malloc+0xe70>
    247e:	00003097          	auipc	ra,0x3
    2482:	872080e7          	jalr	-1934(ra) # 4cf0 <printf>
    exit(1);
    2486:	4505                	li	a0,1
    2488:	00002097          	auipc	ra,0x2
    248c:	4c2080e7          	jalr	1218(ra) # 494a <exit>

0000000000002490 <exitiputtest>:
{
    2490:	7179                	addi	sp,sp,-48
    2492:	f406                	sd	ra,40(sp)
    2494:	f022                	sd	s0,32(sp)
    2496:	ec26                	sd	s1,24(sp)
    2498:	1800                	addi	s0,sp,48
    249a:	84aa                	mv	s1,a0
  pid = fork();
    249c:	00002097          	auipc	ra,0x2
    24a0:	4a6080e7          	jalr	1190(ra) # 4942 <fork>
  if(pid < 0){
    24a4:	04054663          	bltz	a0,24f0 <exitiputtest+0x60>
  if(pid == 0){
    24a8:	ed45                	bnez	a0,2560 <exitiputtest+0xd0>
    if(mkdir("iputdir") < 0){
    24aa:	00003517          	auipc	a0,0x3
    24ae:	6fe50513          	addi	a0,a0,1790 # 5ba8 <malloc+0xdf8>
    24b2:	00002097          	auipc	ra,0x2
    24b6:	4e8080e7          	jalr	1256(ra) # 499a <mkdir>
    24ba:	04054963          	bltz	a0,250c <exitiputtest+0x7c>
    if(chdir("iputdir") < 0){
    24be:	00003517          	auipc	a0,0x3
    24c2:	6ea50513          	addi	a0,a0,1770 # 5ba8 <malloc+0xdf8>
    24c6:	00002097          	auipc	ra,0x2
    24ca:	4dc080e7          	jalr	1244(ra) # 49a2 <chdir>
    24ce:	04054d63          	bltz	a0,2528 <exitiputtest+0x98>
    if(remove("../iputdir") < 0){
    24d2:	00003517          	auipc	a0,0x3
    24d6:	71650513          	addi	a0,a0,1814 # 5be8 <malloc+0xe38>
    24da:	00002097          	auipc	ra,0x2
    24de:	518080e7          	jalr	1304(ra) # 49f2 <remove>
    24e2:	06054163          	bltz	a0,2544 <exitiputtest+0xb4>
    exit(0);
    24e6:	4501                	li	a0,0
    24e8:	00002097          	auipc	ra,0x2
    24ec:	462080e7          	jalr	1122(ra) # 494a <exit>
    printf("%s: fork failed\n", s);
    24f0:	85a6                	mv	a1,s1
    24f2:	00003517          	auipc	a0,0x3
    24f6:	0be50513          	addi	a0,a0,190 # 55b0 <malloc+0x800>
    24fa:	00002097          	auipc	ra,0x2
    24fe:	7f6080e7          	jalr	2038(ra) # 4cf0 <printf>
    exit(1);
    2502:	4505                	li	a0,1
    2504:	00002097          	auipc	ra,0x2
    2508:	446080e7          	jalr	1094(ra) # 494a <exit>
      printf("%s: mkdir failed\n", s);
    250c:	85a6                	mv	a1,s1
    250e:	00003517          	auipc	a0,0x3
    2512:	6a250513          	addi	a0,a0,1698 # 5bb0 <malloc+0xe00>
    2516:	00002097          	auipc	ra,0x2
    251a:	7da080e7          	jalr	2010(ra) # 4cf0 <printf>
      exit(1);
    251e:	4505                	li	a0,1
    2520:	00002097          	auipc	ra,0x2
    2524:	42a080e7          	jalr	1066(ra) # 494a <exit>
      printf("%s: child chdir failed\n", s);
    2528:	85a6                	mv	a1,s1
    252a:	00003517          	auipc	a0,0x3
    252e:	70e50513          	addi	a0,a0,1806 # 5c38 <malloc+0xe88>
    2532:	00002097          	auipc	ra,0x2
    2536:	7be080e7          	jalr	1982(ra) # 4cf0 <printf>
      exit(1);
    253a:	4505                	li	a0,1
    253c:	00002097          	auipc	ra,0x2
    2540:	40e080e7          	jalr	1038(ra) # 494a <exit>
      printf("%s: remove ../iputdir failed\n", s);
    2544:	85a6                	mv	a1,s1
    2546:	00003517          	auipc	a0,0x3
    254a:	6b250513          	addi	a0,a0,1714 # 5bf8 <malloc+0xe48>
    254e:	00002097          	auipc	ra,0x2
    2552:	7a2080e7          	jalr	1954(ra) # 4cf0 <printf>
      exit(1);
    2556:	4505                	li	a0,1
    2558:	00002097          	auipc	ra,0x2
    255c:	3f2080e7          	jalr	1010(ra) # 494a <exit>
  wait(&xstatus);
    2560:	fdc40513          	addi	a0,s0,-36
    2564:	00002097          	auipc	ra,0x2
    2568:	3ee080e7          	jalr	1006(ra) # 4952 <wait>
  exit(xstatus);
    256c:	fdc42503          	lw	a0,-36(s0)
    2570:	00002097          	auipc	ra,0x2
    2574:	3da080e7          	jalr	986(ra) # 494a <exit>

0000000000002578 <subdir>:
{
    2578:	1101                	addi	sp,sp,-32
    257a:	ec06                	sd	ra,24(sp)
    257c:	e822                	sd	s0,16(sp)
    257e:	e426                	sd	s1,8(sp)
    2580:	e04a                	sd	s2,0(sp)
    2582:	1000                	addi	s0,sp,32
    2584:	892a                	mv	s2,a0
  remove("ff");
    2586:	00003517          	auipc	a0,0x3
    258a:	6ca50513          	addi	a0,a0,1738 # 5c50 <malloc+0xea0>
    258e:	00002097          	auipc	ra,0x2
    2592:	464080e7          	jalr	1124(ra) # 49f2 <remove>
  if(mkdir("dd") != 0){
    2596:	00003517          	auipc	a0,0x3
    259a:	6c250513          	addi	a0,a0,1730 # 5c58 <malloc+0xea8>
    259e:	00002097          	auipc	ra,0x2
    25a2:	3fc080e7          	jalr	1020(ra) # 499a <mkdir>
    25a6:	24051363          	bnez	a0,27ec <subdir+0x274>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    25aa:	20200593          	li	a1,514
    25ae:	00003517          	auipc	a0,0x3
    25b2:	6ca50513          	addi	a0,a0,1738 # 5c78 <malloc+0xec8>
    25b6:	00002097          	auipc	ra,0x2
    25ba:	3d4080e7          	jalr	980(ra) # 498a <open>
    25be:	84aa                	mv	s1,a0
  if(fd < 0){
    25c0:	24054463          	bltz	a0,2808 <subdir+0x290>
  write(fd, "ff", 2);
    25c4:	4609                	li	a2,2
    25c6:	00003597          	auipc	a1,0x3
    25ca:	68a58593          	addi	a1,a1,1674 # 5c50 <malloc+0xea0>
    25ce:	00002097          	auipc	ra,0x2
    25d2:	39c080e7          	jalr	924(ra) # 496a <write>
  close(fd);
    25d6:	8526                	mv	a0,s1
    25d8:	00002097          	auipc	ra,0x2
    25dc:	39a080e7          	jalr	922(ra) # 4972 <close>
  if(remove("dd") >= 0){
    25e0:	00003517          	auipc	a0,0x3
    25e4:	67850513          	addi	a0,a0,1656 # 5c58 <malloc+0xea8>
    25e8:	00002097          	auipc	ra,0x2
    25ec:	40a080e7          	jalr	1034(ra) # 49f2 <remove>
    25f0:	22055a63          	bgez	a0,2824 <subdir+0x2ac>
  if(mkdir("/dd/dd") != 0){
    25f4:	00003517          	auipc	a0,0x3
    25f8:	6dc50513          	addi	a0,a0,1756 # 5cd0 <malloc+0xf20>
    25fc:	00002097          	auipc	ra,0x2
    2600:	39e080e7          	jalr	926(ra) # 499a <mkdir>
    2604:	22051e63          	bnez	a0,2840 <subdir+0x2c8>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2608:	20200593          	li	a1,514
    260c:	00003517          	auipc	a0,0x3
    2610:	6ec50513          	addi	a0,a0,1772 # 5cf8 <malloc+0xf48>
    2614:	00002097          	auipc	ra,0x2
    2618:	376080e7          	jalr	886(ra) # 498a <open>
    261c:	84aa                	mv	s1,a0
  if(fd < 0){
    261e:	22054f63          	bltz	a0,285c <subdir+0x2e4>
  write(fd, "FF", 2);
    2622:	4609                	li	a2,2
    2624:	00003597          	auipc	a1,0x3
    2628:	70458593          	addi	a1,a1,1796 # 5d28 <malloc+0xf78>
    262c:	00002097          	auipc	ra,0x2
    2630:	33e080e7          	jalr	830(ra) # 496a <write>
  close(fd);
    2634:	8526                	mv	a0,s1
    2636:	00002097          	auipc	ra,0x2
    263a:	33c080e7          	jalr	828(ra) # 4972 <close>
  fd = open("dd/dd/../ff", 0);
    263e:	4581                	li	a1,0
    2640:	00003517          	auipc	a0,0x3
    2644:	6f050513          	addi	a0,a0,1776 # 5d30 <malloc+0xf80>
    2648:	00002097          	auipc	ra,0x2
    264c:	342080e7          	jalr	834(ra) # 498a <open>
    2650:	84aa                	mv	s1,a0
  if(fd < 0){
    2652:	22054363          	bltz	a0,2878 <subdir+0x300>
  cc = read(fd, buf, sizeof(buf));
    2656:	6609                	lui	a2,0x2
    2658:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x28>
    265c:	00008597          	auipc	a1,0x8
    2660:	20c58593          	addi	a1,a1,524 # a868 <buf>
    2664:	00002097          	auipc	ra,0x2
    2668:	2fe080e7          	jalr	766(ra) # 4962 <read>
  if(cc != 2 || buf[0] != 'f'){
    266c:	4789                	li	a5,2
    266e:	22f51363          	bne	a0,a5,2894 <subdir+0x31c>
    2672:	00008717          	auipc	a4,0x8
    2676:	1f674703          	lbu	a4,502(a4) # a868 <buf>
    267a:	06600793          	li	a5,102
    267e:	20f71b63          	bne	a4,a5,2894 <subdir+0x31c>
  close(fd);
    2682:	8526                	mv	a0,s1
    2684:	00002097          	auipc	ra,0x2
    2688:	2ee080e7          	jalr	750(ra) # 4972 <close>
  if(remove("dd/dd/ff") != 0){
    268c:	00003517          	auipc	a0,0x3
    2690:	66c50513          	addi	a0,a0,1644 # 5cf8 <malloc+0xf48>
    2694:	00002097          	auipc	ra,0x2
    2698:	35e080e7          	jalr	862(ra) # 49f2 <remove>
    269c:	20051a63          	bnez	a0,28b0 <subdir+0x338>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    26a0:	4581                	li	a1,0
    26a2:	00003517          	auipc	a0,0x3
    26a6:	65650513          	addi	a0,a0,1622 # 5cf8 <malloc+0xf48>
    26aa:	00002097          	auipc	ra,0x2
    26ae:	2e0080e7          	jalr	736(ra) # 498a <open>
    26b2:	20055d63          	bgez	a0,28cc <subdir+0x354>
  if(chdir("dd") != 0){
    26b6:	00003517          	auipc	a0,0x3
    26ba:	5a250513          	addi	a0,a0,1442 # 5c58 <malloc+0xea8>
    26be:	00002097          	auipc	ra,0x2
    26c2:	2e4080e7          	jalr	740(ra) # 49a2 <chdir>
    26c6:	22051163          	bnez	a0,28e8 <subdir+0x370>
  if(chdir("dd/../../dd") != 0){
    26ca:	00003517          	auipc	a0,0x3
    26ce:	71650513          	addi	a0,a0,1814 # 5de0 <malloc+0x1030>
    26d2:	00002097          	auipc	ra,0x2
    26d6:	2d0080e7          	jalr	720(ra) # 49a2 <chdir>
    26da:	22051563          	bnez	a0,2904 <subdir+0x38c>
  if(chdir("dd/../../../dd") != 0){
    26de:	00003517          	auipc	a0,0x3
    26e2:	73250513          	addi	a0,a0,1842 # 5e10 <malloc+0x1060>
    26e6:	00002097          	auipc	ra,0x2
    26ea:	2bc080e7          	jalr	700(ra) # 49a2 <chdir>
    26ee:	22051963          	bnez	a0,2920 <subdir+0x3a8>
  if(chdir("./..") != 0){
    26f2:	00003517          	auipc	a0,0x3
    26f6:	74e50513          	addi	a0,a0,1870 # 5e40 <malloc+0x1090>
    26fa:	00002097          	auipc	ra,0x2
    26fe:	2a8080e7          	jalr	680(ra) # 49a2 <chdir>
    2702:	22051d63          	bnez	a0,293c <subdir+0x3c4>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2706:	4581                	li	a1,0
    2708:	00003517          	auipc	a0,0x3
    270c:	5f050513          	addi	a0,a0,1520 # 5cf8 <malloc+0xf48>
    2710:	00002097          	auipc	ra,0x2
    2714:	27a080e7          	jalr	634(ra) # 498a <open>
    2718:	24055063          	bgez	a0,2958 <subdir+0x3e0>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    271c:	20200593          	li	a1,514
    2720:	00003517          	auipc	a0,0x3
    2724:	77050513          	addi	a0,a0,1904 # 5e90 <malloc+0x10e0>
    2728:	00002097          	auipc	ra,0x2
    272c:	262080e7          	jalr	610(ra) # 498a <open>
    2730:	24055263          	bgez	a0,2974 <subdir+0x3fc>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2734:	20200593          	li	a1,514
    2738:	00003517          	auipc	a0,0x3
    273c:	78850513          	addi	a0,a0,1928 # 5ec0 <malloc+0x1110>
    2740:	00002097          	auipc	ra,0x2
    2744:	24a080e7          	jalr	586(ra) # 498a <open>
    2748:	24055463          	bgez	a0,2990 <subdir+0x418>
  if(open("dd", O_CREATE) >= 0){
    274c:	20000593          	li	a1,512
    2750:	00003517          	auipc	a0,0x3
    2754:	50850513          	addi	a0,a0,1288 # 5c58 <malloc+0xea8>
    2758:	00002097          	auipc	ra,0x2
    275c:	232080e7          	jalr	562(ra) # 498a <open>
    2760:	24055663          	bgez	a0,29ac <subdir+0x434>
  if(open("dd", O_RDWR) >= 0){
    2764:	4589                	li	a1,2
    2766:	00003517          	auipc	a0,0x3
    276a:	4f250513          	addi	a0,a0,1266 # 5c58 <malloc+0xea8>
    276e:	00002097          	auipc	ra,0x2
    2772:	21c080e7          	jalr	540(ra) # 498a <open>
    2776:	24055963          	bgez	a0,29c8 <subdir+0x450>
  if(open("dd", O_WRONLY) >= 0){
    277a:	4585                	li	a1,1
    277c:	00003517          	auipc	a0,0x3
    2780:	4dc50513          	addi	a0,a0,1244 # 5c58 <malloc+0xea8>
    2784:	00002097          	auipc	ra,0x2
    2788:	206080e7          	jalr	518(ra) # 498a <open>
    278c:	24055c63          	bgez	a0,29e4 <subdir+0x46c>
  if(remove("dd/ff") != 0){
    2790:	00003517          	auipc	a0,0x3
    2794:	4e850513          	addi	a0,a0,1256 # 5c78 <malloc+0xec8>
    2798:	00002097          	auipc	ra,0x2
    279c:	25a080e7          	jalr	602(ra) # 49f2 <remove>
    27a0:	26051063          	bnez	a0,2a00 <subdir+0x488>
  if(remove("dd") == 0){
    27a4:	00003517          	auipc	a0,0x3
    27a8:	4b450513          	addi	a0,a0,1204 # 5c58 <malloc+0xea8>
    27ac:	00002097          	auipc	ra,0x2
    27b0:	246080e7          	jalr	582(ra) # 49f2 <remove>
    27b4:	26050463          	beqz	a0,2a1c <subdir+0x4a4>
  if(remove("dd/dd") < 0){
    27b8:	00003517          	auipc	a0,0x3
    27bc:	7e050513          	addi	a0,a0,2016 # 5f98 <malloc+0x11e8>
    27c0:	00002097          	auipc	ra,0x2
    27c4:	232080e7          	jalr	562(ra) # 49f2 <remove>
    27c8:	26054863          	bltz	a0,2a38 <subdir+0x4c0>
  if(remove("dd") < 0){
    27cc:	00003517          	auipc	a0,0x3
    27d0:	48c50513          	addi	a0,a0,1164 # 5c58 <malloc+0xea8>
    27d4:	00002097          	auipc	ra,0x2
    27d8:	21e080e7          	jalr	542(ra) # 49f2 <remove>
    27dc:	26054c63          	bltz	a0,2a54 <subdir+0x4dc>
}
    27e0:	60e2                	ld	ra,24(sp)
    27e2:	6442                	ld	s0,16(sp)
    27e4:	64a2                	ld	s1,8(sp)
    27e6:	6902                	ld	s2,0(sp)
    27e8:	6105                	addi	sp,sp,32
    27ea:	8082                	ret
    printf("%s: mkdir dd failed\n", s);
    27ec:	85ca                	mv	a1,s2
    27ee:	00003517          	auipc	a0,0x3
    27f2:	47250513          	addi	a0,a0,1138 # 5c60 <malloc+0xeb0>
    27f6:	00002097          	auipc	ra,0x2
    27fa:	4fa080e7          	jalr	1274(ra) # 4cf0 <printf>
    exit(1);
    27fe:	4505                	li	a0,1
    2800:	00002097          	auipc	ra,0x2
    2804:	14a080e7          	jalr	330(ra) # 494a <exit>
    printf("%s: create dd/ff failed\n", s);
    2808:	85ca                	mv	a1,s2
    280a:	00003517          	auipc	a0,0x3
    280e:	47650513          	addi	a0,a0,1142 # 5c80 <malloc+0xed0>
    2812:	00002097          	auipc	ra,0x2
    2816:	4de080e7          	jalr	1246(ra) # 4cf0 <printf>
    exit(1);
    281a:	4505                	li	a0,1
    281c:	00002097          	auipc	ra,0x2
    2820:	12e080e7          	jalr	302(ra) # 494a <exit>
    printf("%s: remove dd (non-empty dir) succeeded!\n", s);
    2824:	85ca                	mv	a1,s2
    2826:	00003517          	auipc	a0,0x3
    282a:	47a50513          	addi	a0,a0,1146 # 5ca0 <malloc+0xef0>
    282e:	00002097          	auipc	ra,0x2
    2832:	4c2080e7          	jalr	1218(ra) # 4cf0 <printf>
    exit(1);
    2836:	4505                	li	a0,1
    2838:	00002097          	auipc	ra,0x2
    283c:	112080e7          	jalr	274(ra) # 494a <exit>
    printf("subdir mkdir dd/dd failed\n", s);
    2840:	85ca                	mv	a1,s2
    2842:	00003517          	auipc	a0,0x3
    2846:	49650513          	addi	a0,a0,1174 # 5cd8 <malloc+0xf28>
    284a:	00002097          	auipc	ra,0x2
    284e:	4a6080e7          	jalr	1190(ra) # 4cf0 <printf>
    exit(1);
    2852:	4505                	li	a0,1
    2854:	00002097          	auipc	ra,0x2
    2858:	0f6080e7          	jalr	246(ra) # 494a <exit>
    printf("%s: create dd/dd/ff failed\n", s);
    285c:	85ca                	mv	a1,s2
    285e:	00003517          	auipc	a0,0x3
    2862:	4aa50513          	addi	a0,a0,1194 # 5d08 <malloc+0xf58>
    2866:	00002097          	auipc	ra,0x2
    286a:	48a080e7          	jalr	1162(ra) # 4cf0 <printf>
    exit(1);
    286e:	4505                	li	a0,1
    2870:	00002097          	auipc	ra,0x2
    2874:	0da080e7          	jalr	218(ra) # 494a <exit>
    printf("%s: open dd/dd/../ff failed\n", s);
    2878:	85ca                	mv	a1,s2
    287a:	00003517          	auipc	a0,0x3
    287e:	4c650513          	addi	a0,a0,1222 # 5d40 <malloc+0xf90>
    2882:	00002097          	auipc	ra,0x2
    2886:	46e080e7          	jalr	1134(ra) # 4cf0 <printf>
    exit(1);
    288a:	4505                	li	a0,1
    288c:	00002097          	auipc	ra,0x2
    2890:	0be080e7          	jalr	190(ra) # 494a <exit>
    printf("%s: dd/dd/../ff wrong content\n", s);
    2894:	85ca                	mv	a1,s2
    2896:	00003517          	auipc	a0,0x3
    289a:	4ca50513          	addi	a0,a0,1226 # 5d60 <malloc+0xfb0>
    289e:	00002097          	auipc	ra,0x2
    28a2:	452080e7          	jalr	1106(ra) # 4cf0 <printf>
    exit(1);
    28a6:	4505                	li	a0,1
    28a8:	00002097          	auipc	ra,0x2
    28ac:	0a2080e7          	jalr	162(ra) # 494a <exit>
    printf("%s: remove dd/dd/ff failed\n", s);
    28b0:	85ca                	mv	a1,s2
    28b2:	00003517          	auipc	a0,0x3
    28b6:	4ce50513          	addi	a0,a0,1230 # 5d80 <malloc+0xfd0>
    28ba:	00002097          	auipc	ra,0x2
    28be:	436080e7          	jalr	1078(ra) # 4cf0 <printf>
    exit(1);
    28c2:	4505                	li	a0,1
    28c4:	00002097          	auipc	ra,0x2
    28c8:	086080e7          	jalr	134(ra) # 494a <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded\n", s);
    28cc:	85ca                	mv	a1,s2
    28ce:	00003517          	auipc	a0,0x3
    28d2:	4d250513          	addi	a0,a0,1234 # 5da0 <malloc+0xff0>
    28d6:	00002097          	auipc	ra,0x2
    28da:	41a080e7          	jalr	1050(ra) # 4cf0 <printf>
    exit(1);
    28de:	4505                	li	a0,1
    28e0:	00002097          	auipc	ra,0x2
    28e4:	06a080e7          	jalr	106(ra) # 494a <exit>
    printf("%s: chdir dd failed\n", s);
    28e8:	85ca                	mv	a1,s2
    28ea:	00003517          	auipc	a0,0x3
    28ee:	4de50513          	addi	a0,a0,1246 # 5dc8 <malloc+0x1018>
    28f2:	00002097          	auipc	ra,0x2
    28f6:	3fe080e7          	jalr	1022(ra) # 4cf0 <printf>
    exit(1);
    28fa:	4505                	li	a0,1
    28fc:	00002097          	auipc	ra,0x2
    2900:	04e080e7          	jalr	78(ra) # 494a <exit>
    printf("%s: chdir dd/../../dd failed\n", s);
    2904:	85ca                	mv	a1,s2
    2906:	00003517          	auipc	a0,0x3
    290a:	4ea50513          	addi	a0,a0,1258 # 5df0 <malloc+0x1040>
    290e:	00002097          	auipc	ra,0x2
    2912:	3e2080e7          	jalr	994(ra) # 4cf0 <printf>
    exit(1);
    2916:	4505                	li	a0,1
    2918:	00002097          	auipc	ra,0x2
    291c:	032080e7          	jalr	50(ra) # 494a <exit>
    printf("chdir dd/../../dd failed\n", s);
    2920:	85ca                	mv	a1,s2
    2922:	00003517          	auipc	a0,0x3
    2926:	4fe50513          	addi	a0,a0,1278 # 5e20 <malloc+0x1070>
    292a:	00002097          	auipc	ra,0x2
    292e:	3c6080e7          	jalr	966(ra) # 4cf0 <printf>
    exit(1);
    2932:	4505                	li	a0,1
    2934:	00002097          	auipc	ra,0x2
    2938:	016080e7          	jalr	22(ra) # 494a <exit>
    printf("%s: chdir ./.. failed\n", s);
    293c:	85ca                	mv	a1,s2
    293e:	00003517          	auipc	a0,0x3
    2942:	50a50513          	addi	a0,a0,1290 # 5e48 <malloc+0x1098>
    2946:	00002097          	auipc	ra,0x2
    294a:	3aa080e7          	jalr	938(ra) # 4cf0 <printf>
    exit(1);
    294e:	4505                	li	a0,1
    2950:	00002097          	auipc	ra,0x2
    2954:	ffa080e7          	jalr	-6(ra) # 494a <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded!\n", s);
    2958:	85ca                	mv	a1,s2
    295a:	00003517          	auipc	a0,0x3
    295e:	50650513          	addi	a0,a0,1286 # 5e60 <malloc+0x10b0>
    2962:	00002097          	auipc	ra,0x2
    2966:	38e080e7          	jalr	910(ra) # 4cf0 <printf>
    exit(1);
    296a:	4505                	li	a0,1
    296c:	00002097          	auipc	ra,0x2
    2970:	fde080e7          	jalr	-34(ra) # 494a <exit>
    printf("%s: create dd/ff/ff succeeded!\n", s);
    2974:	85ca                	mv	a1,s2
    2976:	00003517          	auipc	a0,0x3
    297a:	52a50513          	addi	a0,a0,1322 # 5ea0 <malloc+0x10f0>
    297e:	00002097          	auipc	ra,0x2
    2982:	372080e7          	jalr	882(ra) # 4cf0 <printf>
    exit(1);
    2986:	4505                	li	a0,1
    2988:	00002097          	auipc	ra,0x2
    298c:	fc2080e7          	jalr	-62(ra) # 494a <exit>
    printf("%s: create dd/xx/ff succeeded!\n", s);
    2990:	85ca                	mv	a1,s2
    2992:	00003517          	auipc	a0,0x3
    2996:	53e50513          	addi	a0,a0,1342 # 5ed0 <malloc+0x1120>
    299a:	00002097          	auipc	ra,0x2
    299e:	356080e7          	jalr	854(ra) # 4cf0 <printf>
    exit(1);
    29a2:	4505                	li	a0,1
    29a4:	00002097          	auipc	ra,0x2
    29a8:	fa6080e7          	jalr	-90(ra) # 494a <exit>
    printf("%s: create dd succeeded!\n", s);
    29ac:	85ca                	mv	a1,s2
    29ae:	00003517          	auipc	a0,0x3
    29b2:	54250513          	addi	a0,a0,1346 # 5ef0 <malloc+0x1140>
    29b6:	00002097          	auipc	ra,0x2
    29ba:	33a080e7          	jalr	826(ra) # 4cf0 <printf>
    exit(1);
    29be:	4505                	li	a0,1
    29c0:	00002097          	auipc	ra,0x2
    29c4:	f8a080e7          	jalr	-118(ra) # 494a <exit>
    printf("%s: open dd rdwr succeeded!\n", s);
    29c8:	85ca                	mv	a1,s2
    29ca:	00003517          	auipc	a0,0x3
    29ce:	54650513          	addi	a0,a0,1350 # 5f10 <malloc+0x1160>
    29d2:	00002097          	auipc	ra,0x2
    29d6:	31e080e7          	jalr	798(ra) # 4cf0 <printf>
    exit(1);
    29da:	4505                	li	a0,1
    29dc:	00002097          	auipc	ra,0x2
    29e0:	f6e080e7          	jalr	-146(ra) # 494a <exit>
    printf("%s: open dd wronly succeeded!\n", s);
    29e4:	85ca                	mv	a1,s2
    29e6:	00003517          	auipc	a0,0x3
    29ea:	54a50513          	addi	a0,a0,1354 # 5f30 <malloc+0x1180>
    29ee:	00002097          	auipc	ra,0x2
    29f2:	302080e7          	jalr	770(ra) # 4cf0 <printf>
    exit(1);
    29f6:	4505                	li	a0,1
    29f8:	00002097          	auipc	ra,0x2
    29fc:	f52080e7          	jalr	-174(ra) # 494a <exit>
    printf("%s: remove dd/ff failed\n", s);
    2a00:	85ca                	mv	a1,s2
    2a02:	00003517          	auipc	a0,0x3
    2a06:	54e50513          	addi	a0,a0,1358 # 5f50 <malloc+0x11a0>
    2a0a:	00002097          	auipc	ra,0x2
    2a0e:	2e6080e7          	jalr	742(ra) # 4cf0 <printf>
    exit(1);
    2a12:	4505                	li	a0,1
    2a14:	00002097          	auipc	ra,0x2
    2a18:	f36080e7          	jalr	-202(ra) # 494a <exit>
    printf("%s: remove non-empty dd succeeded!\n", s);
    2a1c:	85ca                	mv	a1,s2
    2a1e:	00003517          	auipc	a0,0x3
    2a22:	55250513          	addi	a0,a0,1362 # 5f70 <malloc+0x11c0>
    2a26:	00002097          	auipc	ra,0x2
    2a2a:	2ca080e7          	jalr	714(ra) # 4cf0 <printf>
    exit(1);
    2a2e:	4505                	li	a0,1
    2a30:	00002097          	auipc	ra,0x2
    2a34:	f1a080e7          	jalr	-230(ra) # 494a <exit>
    printf("%s: remove dd/dd failed\n", s);
    2a38:	85ca                	mv	a1,s2
    2a3a:	00003517          	auipc	a0,0x3
    2a3e:	56650513          	addi	a0,a0,1382 # 5fa0 <malloc+0x11f0>
    2a42:	00002097          	auipc	ra,0x2
    2a46:	2ae080e7          	jalr	686(ra) # 4cf0 <printf>
    exit(1);
    2a4a:	4505                	li	a0,1
    2a4c:	00002097          	auipc	ra,0x2
    2a50:	efe080e7          	jalr	-258(ra) # 494a <exit>
    printf("%s: remove dd failed\n", s);
    2a54:	85ca                	mv	a1,s2
    2a56:	00003517          	auipc	a0,0x3
    2a5a:	56a50513          	addi	a0,a0,1386 # 5fc0 <malloc+0x1210>
    2a5e:	00002097          	auipc	ra,0x2
    2a62:	292080e7          	jalr	658(ra) # 4cf0 <printf>
    exit(1);
    2a66:	4505                	li	a0,1
    2a68:	00002097          	auipc	ra,0x2
    2a6c:	ee2080e7          	jalr	-286(ra) # 494a <exit>

0000000000002a70 <rmdot>:
{
    2a70:	1101                	addi	sp,sp,-32
    2a72:	ec06                	sd	ra,24(sp)
    2a74:	e822                	sd	s0,16(sp)
    2a76:	e426                	sd	s1,8(sp)
    2a78:	1000                	addi	s0,sp,32
    2a7a:	84aa                	mv	s1,a0
  if(mkdir("dots") != 0){
    2a7c:	00003517          	auipc	a0,0x3
    2a80:	55c50513          	addi	a0,a0,1372 # 5fd8 <malloc+0x1228>
    2a84:	00002097          	auipc	ra,0x2
    2a88:	f16080e7          	jalr	-234(ra) # 499a <mkdir>
    2a8c:	e549                	bnez	a0,2b16 <rmdot+0xa6>
  if(chdir("dots") != 0){
    2a8e:	00003517          	auipc	a0,0x3
    2a92:	54a50513          	addi	a0,a0,1354 # 5fd8 <malloc+0x1228>
    2a96:	00002097          	auipc	ra,0x2
    2a9a:	f0c080e7          	jalr	-244(ra) # 49a2 <chdir>
    2a9e:	e951                	bnez	a0,2b32 <rmdot+0xc2>
  if(remove(".") == 0){
    2aa0:	00003517          	auipc	a0,0x3
    2aa4:	57050513          	addi	a0,a0,1392 # 6010 <malloc+0x1260>
    2aa8:	00002097          	auipc	ra,0x2
    2aac:	f4a080e7          	jalr	-182(ra) # 49f2 <remove>
    2ab0:	cd59                	beqz	a0,2b4e <rmdot+0xde>
  if(remove("..") == 0){
    2ab2:	00003517          	auipc	a0,0x3
    2ab6:	57e50513          	addi	a0,a0,1406 # 6030 <malloc+0x1280>
    2aba:	00002097          	auipc	ra,0x2
    2abe:	f38080e7          	jalr	-200(ra) # 49f2 <remove>
    2ac2:	c545                	beqz	a0,2b6a <rmdot+0xfa>
  if(chdir("/") != 0){
    2ac4:	00003517          	auipc	a0,0x3
    2ac8:	15450513          	addi	a0,a0,340 # 5c18 <malloc+0xe68>
    2acc:	00002097          	auipc	ra,0x2
    2ad0:	ed6080e7          	jalr	-298(ra) # 49a2 <chdir>
    2ad4:	e94d                	bnez	a0,2b86 <rmdot+0x116>
  if(remove("dots/.") == 0){
    2ad6:	00003517          	auipc	a0,0x3
    2ada:	57a50513          	addi	a0,a0,1402 # 6050 <malloc+0x12a0>
    2ade:	00002097          	auipc	ra,0x2
    2ae2:	f14080e7          	jalr	-236(ra) # 49f2 <remove>
    2ae6:	cd55                	beqz	a0,2ba2 <rmdot+0x132>
  if(remove("dots/..") == 0){
    2ae8:	00003517          	auipc	a0,0x3
    2aec:	59050513          	addi	a0,a0,1424 # 6078 <malloc+0x12c8>
    2af0:	00002097          	auipc	ra,0x2
    2af4:	f02080e7          	jalr	-254(ra) # 49f2 <remove>
    2af8:	c179                	beqz	a0,2bbe <rmdot+0x14e>
  if(remove("dots") != 0){
    2afa:	00003517          	auipc	a0,0x3
    2afe:	4de50513          	addi	a0,a0,1246 # 5fd8 <malloc+0x1228>
    2b02:	00002097          	auipc	ra,0x2
    2b06:	ef0080e7          	jalr	-272(ra) # 49f2 <remove>
    2b0a:	e961                	bnez	a0,2bda <rmdot+0x16a>
}
    2b0c:	60e2                	ld	ra,24(sp)
    2b0e:	6442                	ld	s0,16(sp)
    2b10:	64a2                	ld	s1,8(sp)
    2b12:	6105                	addi	sp,sp,32
    2b14:	8082                	ret
    printf("%s: mkdir dots failed\n", s);
    2b16:	85a6                	mv	a1,s1
    2b18:	00003517          	auipc	a0,0x3
    2b1c:	4c850513          	addi	a0,a0,1224 # 5fe0 <malloc+0x1230>
    2b20:	00002097          	auipc	ra,0x2
    2b24:	1d0080e7          	jalr	464(ra) # 4cf0 <printf>
    exit(1);
    2b28:	4505                	li	a0,1
    2b2a:	00002097          	auipc	ra,0x2
    2b2e:	e20080e7          	jalr	-480(ra) # 494a <exit>
    printf("%s: chdir dots failed\n", s);
    2b32:	85a6                	mv	a1,s1
    2b34:	00003517          	auipc	a0,0x3
    2b38:	4c450513          	addi	a0,a0,1220 # 5ff8 <malloc+0x1248>
    2b3c:	00002097          	auipc	ra,0x2
    2b40:	1b4080e7          	jalr	436(ra) # 4cf0 <printf>
    exit(1);
    2b44:	4505                	li	a0,1
    2b46:	00002097          	auipc	ra,0x2
    2b4a:	e04080e7          	jalr	-508(ra) # 494a <exit>
    printf("%s: rm . worked!\n", s);
    2b4e:	85a6                	mv	a1,s1
    2b50:	00003517          	auipc	a0,0x3
    2b54:	4c850513          	addi	a0,a0,1224 # 6018 <malloc+0x1268>
    2b58:	00002097          	auipc	ra,0x2
    2b5c:	198080e7          	jalr	408(ra) # 4cf0 <printf>
    exit(1);
    2b60:	4505                	li	a0,1
    2b62:	00002097          	auipc	ra,0x2
    2b66:	de8080e7          	jalr	-536(ra) # 494a <exit>
    printf("%s: rm .. worked!\n", s);
    2b6a:	85a6                	mv	a1,s1
    2b6c:	00003517          	auipc	a0,0x3
    2b70:	4cc50513          	addi	a0,a0,1228 # 6038 <malloc+0x1288>
    2b74:	00002097          	auipc	ra,0x2
    2b78:	17c080e7          	jalr	380(ra) # 4cf0 <printf>
    exit(1);
    2b7c:	4505                	li	a0,1
    2b7e:	00002097          	auipc	ra,0x2
    2b82:	dcc080e7          	jalr	-564(ra) # 494a <exit>
    printf("%s: chdir / failed\n", s);
    2b86:	85a6                	mv	a1,s1
    2b88:	00003517          	auipc	a0,0x3
    2b8c:	09850513          	addi	a0,a0,152 # 5c20 <malloc+0xe70>
    2b90:	00002097          	auipc	ra,0x2
    2b94:	160080e7          	jalr	352(ra) # 4cf0 <printf>
    exit(1);
    2b98:	4505                	li	a0,1
    2b9a:	00002097          	auipc	ra,0x2
    2b9e:	db0080e7          	jalr	-592(ra) # 494a <exit>
    printf("%s: remove dots/. worked!\n", s);
    2ba2:	85a6                	mv	a1,s1
    2ba4:	00003517          	auipc	a0,0x3
    2ba8:	4b450513          	addi	a0,a0,1204 # 6058 <malloc+0x12a8>
    2bac:	00002097          	auipc	ra,0x2
    2bb0:	144080e7          	jalr	324(ra) # 4cf0 <printf>
    exit(1);
    2bb4:	4505                	li	a0,1
    2bb6:	00002097          	auipc	ra,0x2
    2bba:	d94080e7          	jalr	-620(ra) # 494a <exit>
    printf("%s: remove dots/.. worked!\n", s);
    2bbe:	85a6                	mv	a1,s1
    2bc0:	00003517          	auipc	a0,0x3
    2bc4:	4c050513          	addi	a0,a0,1216 # 6080 <malloc+0x12d0>
    2bc8:	00002097          	auipc	ra,0x2
    2bcc:	128080e7          	jalr	296(ra) # 4cf0 <printf>
    exit(1);
    2bd0:	4505                	li	a0,1
    2bd2:	00002097          	auipc	ra,0x2
    2bd6:	d78080e7          	jalr	-648(ra) # 494a <exit>
    printf("%s: remove dots failed!\n", s);
    2bda:	85a6                	mv	a1,s1
    2bdc:	00003517          	auipc	a0,0x3
    2be0:	4c450513          	addi	a0,a0,1220 # 60a0 <malloc+0x12f0>
    2be4:	00002097          	auipc	ra,0x2
    2be8:	10c080e7          	jalr	268(ra) # 4cf0 <printf>
    exit(1);
    2bec:	4505                	li	a0,1
    2bee:	00002097          	auipc	ra,0x2
    2bf2:	d5c080e7          	jalr	-676(ra) # 494a <exit>

0000000000002bf6 <dirfile>:
{
    2bf6:	1101                	addi	sp,sp,-32
    2bf8:	ec06                	sd	ra,24(sp)
    2bfa:	e822                	sd	s0,16(sp)
    2bfc:	e426                	sd	s1,8(sp)
    2bfe:	e04a                	sd	s2,0(sp)
    2c00:	1000                	addi	s0,sp,32
    2c02:	892a                	mv	s2,a0
  fd = open("dirfile", O_CREATE);
    2c04:	20000593          	li	a1,512
    2c08:	00003517          	auipc	a0,0x3
    2c0c:	4b850513          	addi	a0,a0,1208 # 60c0 <malloc+0x1310>
    2c10:	00002097          	auipc	ra,0x2
    2c14:	d7a080e7          	jalr	-646(ra) # 498a <open>
  if(fd < 0){
    2c18:	0c054d63          	bltz	a0,2cf2 <dirfile+0xfc>
  close(fd);
    2c1c:	00002097          	auipc	ra,0x2
    2c20:	d56080e7          	jalr	-682(ra) # 4972 <close>
  if(chdir("dirfile") == 0){
    2c24:	00003517          	auipc	a0,0x3
    2c28:	49c50513          	addi	a0,a0,1180 # 60c0 <malloc+0x1310>
    2c2c:	00002097          	auipc	ra,0x2
    2c30:	d76080e7          	jalr	-650(ra) # 49a2 <chdir>
    2c34:	cd69                	beqz	a0,2d0e <dirfile+0x118>
  fd = open("dirfile/xx", 0);
    2c36:	4581                	li	a1,0
    2c38:	00003517          	auipc	a0,0x3
    2c3c:	4d050513          	addi	a0,a0,1232 # 6108 <malloc+0x1358>
    2c40:	00002097          	auipc	ra,0x2
    2c44:	d4a080e7          	jalr	-694(ra) # 498a <open>
  if(fd >= 0){
    2c48:	0e055163          	bgez	a0,2d2a <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    2c4c:	20000593          	li	a1,512
    2c50:	00003517          	auipc	a0,0x3
    2c54:	4b850513          	addi	a0,a0,1208 # 6108 <malloc+0x1358>
    2c58:	00002097          	auipc	ra,0x2
    2c5c:	d32080e7          	jalr	-718(ra) # 498a <open>
  if(fd >= 0){
    2c60:	0e055363          	bgez	a0,2d46 <dirfile+0x150>
  if(mkdir("dirfile/xx") == 0){
    2c64:	00003517          	auipc	a0,0x3
    2c68:	4a450513          	addi	a0,a0,1188 # 6108 <malloc+0x1358>
    2c6c:	00002097          	auipc	ra,0x2
    2c70:	d2e080e7          	jalr	-722(ra) # 499a <mkdir>
    2c74:	c57d                	beqz	a0,2d62 <dirfile+0x16c>
  if(remove("dirfile/xx") == 0){
    2c76:	00003517          	auipc	a0,0x3
    2c7a:	49250513          	addi	a0,a0,1170 # 6108 <malloc+0x1358>
    2c7e:	00002097          	auipc	ra,0x2
    2c82:	d74080e7          	jalr	-652(ra) # 49f2 <remove>
    2c86:	cd65                	beqz	a0,2d7e <dirfile+0x188>
  if(remove("dirfile") != 0){
    2c88:	00003517          	auipc	a0,0x3
    2c8c:	43850513          	addi	a0,a0,1080 # 60c0 <malloc+0x1310>
    2c90:	00002097          	auipc	ra,0x2
    2c94:	d62080e7          	jalr	-670(ra) # 49f2 <remove>
    2c98:	10051163          	bnez	a0,2d9a <dirfile+0x1a4>
  fd = open(".", O_RDWR);
    2c9c:	4589                	li	a1,2
    2c9e:	00003517          	auipc	a0,0x3
    2ca2:	37250513          	addi	a0,a0,882 # 6010 <malloc+0x1260>
    2ca6:	00002097          	auipc	ra,0x2
    2caa:	ce4080e7          	jalr	-796(ra) # 498a <open>
  if(fd >= 0){
    2cae:	10055463          	bgez	a0,2db6 <dirfile+0x1c0>
  fd = open(".", 0);
    2cb2:	4581                	li	a1,0
    2cb4:	00003517          	auipc	a0,0x3
    2cb8:	35c50513          	addi	a0,a0,860 # 6010 <malloc+0x1260>
    2cbc:	00002097          	auipc	ra,0x2
    2cc0:	cce080e7          	jalr	-818(ra) # 498a <open>
    2cc4:	84aa                	mv	s1,a0
  if(write(fd, "x", 1) > 0){
    2cc6:	4605                	li	a2,1
    2cc8:	00002597          	auipc	a1,0x2
    2ccc:	2c858593          	addi	a1,a1,712 # 4f90 <malloc+0x1e0>
    2cd0:	00002097          	auipc	ra,0x2
    2cd4:	c9a080e7          	jalr	-870(ra) # 496a <write>
    2cd8:	0ea04d63          	bgtz	a0,2dd2 <dirfile+0x1dc>
  close(fd);
    2cdc:	8526                	mv	a0,s1
    2cde:	00002097          	auipc	ra,0x2
    2ce2:	c94080e7          	jalr	-876(ra) # 4972 <close>
}
    2ce6:	60e2                	ld	ra,24(sp)
    2ce8:	6442                	ld	s0,16(sp)
    2cea:	64a2                	ld	s1,8(sp)
    2cec:	6902                	ld	s2,0(sp)
    2cee:	6105                	addi	sp,sp,32
    2cf0:	8082                	ret
    printf("%s: create dirfile failed\n", s);
    2cf2:	85ca                	mv	a1,s2
    2cf4:	00003517          	auipc	a0,0x3
    2cf8:	3d450513          	addi	a0,a0,980 # 60c8 <malloc+0x1318>
    2cfc:	00002097          	auipc	ra,0x2
    2d00:	ff4080e7          	jalr	-12(ra) # 4cf0 <printf>
    exit(1);
    2d04:	4505                	li	a0,1
    2d06:	00002097          	auipc	ra,0x2
    2d0a:	c44080e7          	jalr	-956(ra) # 494a <exit>
    printf("%s: chdir dirfile succeeded!\n", s);
    2d0e:	85ca                	mv	a1,s2
    2d10:	00003517          	auipc	a0,0x3
    2d14:	3d850513          	addi	a0,a0,984 # 60e8 <malloc+0x1338>
    2d18:	00002097          	auipc	ra,0x2
    2d1c:	fd8080e7          	jalr	-40(ra) # 4cf0 <printf>
    exit(1);
    2d20:	4505                	li	a0,1
    2d22:	00002097          	auipc	ra,0x2
    2d26:	c28080e7          	jalr	-984(ra) # 494a <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2d2a:	85ca                	mv	a1,s2
    2d2c:	00003517          	auipc	a0,0x3
    2d30:	3ec50513          	addi	a0,a0,1004 # 6118 <malloc+0x1368>
    2d34:	00002097          	auipc	ra,0x2
    2d38:	fbc080e7          	jalr	-68(ra) # 4cf0 <printf>
    exit(1);
    2d3c:	4505                	li	a0,1
    2d3e:	00002097          	auipc	ra,0x2
    2d42:	c0c080e7          	jalr	-1012(ra) # 494a <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2d46:	85ca                	mv	a1,s2
    2d48:	00003517          	auipc	a0,0x3
    2d4c:	3d050513          	addi	a0,a0,976 # 6118 <malloc+0x1368>
    2d50:	00002097          	auipc	ra,0x2
    2d54:	fa0080e7          	jalr	-96(ra) # 4cf0 <printf>
    exit(1);
    2d58:	4505                	li	a0,1
    2d5a:	00002097          	auipc	ra,0x2
    2d5e:	bf0080e7          	jalr	-1040(ra) # 494a <exit>
    printf("%s: mkdir dirfile/xx succeeded!\n", s);
    2d62:	85ca                	mv	a1,s2
    2d64:	00003517          	auipc	a0,0x3
    2d68:	3dc50513          	addi	a0,a0,988 # 6140 <malloc+0x1390>
    2d6c:	00002097          	auipc	ra,0x2
    2d70:	f84080e7          	jalr	-124(ra) # 4cf0 <printf>
    exit(1);
    2d74:	4505                	li	a0,1
    2d76:	00002097          	auipc	ra,0x2
    2d7a:	bd4080e7          	jalr	-1068(ra) # 494a <exit>
    printf("%s: remove dirfile/xx succeeded!\n", s);
    2d7e:	85ca                	mv	a1,s2
    2d80:	00003517          	auipc	a0,0x3
    2d84:	3e850513          	addi	a0,a0,1000 # 6168 <malloc+0x13b8>
    2d88:	00002097          	auipc	ra,0x2
    2d8c:	f68080e7          	jalr	-152(ra) # 4cf0 <printf>
    exit(1);
    2d90:	4505                	li	a0,1
    2d92:	00002097          	auipc	ra,0x2
    2d96:	bb8080e7          	jalr	-1096(ra) # 494a <exit>
    printf("%s: remove dirfile failed!\n", s);
    2d9a:	85ca                	mv	a1,s2
    2d9c:	00003517          	auipc	a0,0x3
    2da0:	3f450513          	addi	a0,a0,1012 # 6190 <malloc+0x13e0>
    2da4:	00002097          	auipc	ra,0x2
    2da8:	f4c080e7          	jalr	-180(ra) # 4cf0 <printf>
    exit(1);
    2dac:	4505                	li	a0,1
    2dae:	00002097          	auipc	ra,0x2
    2db2:	b9c080e7          	jalr	-1124(ra) # 494a <exit>
    printf("%s: open . for writing succeeded!\n", s);
    2db6:	85ca                	mv	a1,s2
    2db8:	00003517          	auipc	a0,0x3
    2dbc:	3f850513          	addi	a0,a0,1016 # 61b0 <malloc+0x1400>
    2dc0:	00002097          	auipc	ra,0x2
    2dc4:	f30080e7          	jalr	-208(ra) # 4cf0 <printf>
    exit(1);
    2dc8:	4505                	li	a0,1
    2dca:	00002097          	auipc	ra,0x2
    2dce:	b80080e7          	jalr	-1152(ra) # 494a <exit>
    printf("%s: write . succeeded!\n", s);
    2dd2:	85ca                	mv	a1,s2
    2dd4:	00003517          	auipc	a0,0x3
    2dd8:	40450513          	addi	a0,a0,1028 # 61d8 <malloc+0x1428>
    2ddc:	00002097          	auipc	ra,0x2
    2de0:	f14080e7          	jalr	-236(ra) # 4cf0 <printf>
    exit(1);
    2de4:	4505                	li	a0,1
    2de6:	00002097          	auipc	ra,0x2
    2dea:	b64080e7          	jalr	-1180(ra) # 494a <exit>

0000000000002dee <iref>:
{
    2dee:	7139                	addi	sp,sp,-64
    2df0:	fc06                	sd	ra,56(sp)
    2df2:	f822                	sd	s0,48(sp)
    2df4:	f426                	sd	s1,40(sp)
    2df6:	f04a                	sd	s2,32(sp)
    2df8:	ec4e                	sd	s3,24(sp)
    2dfa:	e852                	sd	s4,16(sp)
    2dfc:	e456                	sd	s5,8(sp)
    2dfe:	0080                	addi	s0,sp,64
    2e00:	8aaa                	mv	s5,a0
    2e02:	02e00493          	li	s1,46
    if(mkdir("irefd") != 0){
    2e06:	00003917          	auipc	s2,0x3
    2e0a:	3ea90913          	addi	s2,s2,1002 # 61f0 <malloc+0x1440>
    mkdir("");
    2e0e:	00003a17          	auipc	s4,0x3
    2e12:	07aa0a13          	addi	s4,s4,122 # 5e88 <malloc+0x10d8>
    fd = open("xx", O_CREATE);
    2e16:	00003997          	auipc	s3,0x3
    2e1a:	2fa98993          	addi	s3,s3,762 # 6110 <malloc+0x1360>
    2e1e:	a889                	j	2e70 <iref+0x82>
      printf("%s: mkdir irefd failed\n", s);
    2e20:	85d6                	mv	a1,s5
    2e22:	00003517          	auipc	a0,0x3
    2e26:	3d650513          	addi	a0,a0,982 # 61f8 <malloc+0x1448>
    2e2a:	00002097          	auipc	ra,0x2
    2e2e:	ec6080e7          	jalr	-314(ra) # 4cf0 <printf>
      exit(1);
    2e32:	4505                	li	a0,1
    2e34:	00002097          	auipc	ra,0x2
    2e38:	b16080e7          	jalr	-1258(ra) # 494a <exit>
      printf("%s: chdir irefd failed\n", s);
    2e3c:	85d6                	mv	a1,s5
    2e3e:	00003517          	auipc	a0,0x3
    2e42:	3d250513          	addi	a0,a0,978 # 6210 <malloc+0x1460>
    2e46:	00002097          	auipc	ra,0x2
    2e4a:	eaa080e7          	jalr	-342(ra) # 4cf0 <printf>
      exit(1);
    2e4e:	4505                	li	a0,1
    2e50:	00002097          	auipc	ra,0x2
    2e54:	afa080e7          	jalr	-1286(ra) # 494a <exit>
      close(fd);
    2e58:	00002097          	auipc	ra,0x2
    2e5c:	b1a080e7          	jalr	-1254(ra) # 4972 <close>
    2e60:	a091                	j	2ea4 <iref+0xb6>
    remove("xx");
    2e62:	854e                	mv	a0,s3
    2e64:	00002097          	auipc	ra,0x2
    2e68:	b8e080e7          	jalr	-1138(ra) # 49f2 <remove>
  for(i = 0; i < NINODE - 4; i++){
    2e6c:	34fd                	addiw	s1,s1,-1
    2e6e:	c8a9                	beqz	s1,2ec0 <iref+0xd2>
    if(mkdir("irefd") != 0){
    2e70:	854a                	mv	a0,s2
    2e72:	00002097          	auipc	ra,0x2
    2e76:	b28080e7          	jalr	-1240(ra) # 499a <mkdir>
    2e7a:	f15d                	bnez	a0,2e20 <iref+0x32>
    if(chdir("irefd") != 0){
    2e7c:	854a                	mv	a0,s2
    2e7e:	00002097          	auipc	ra,0x2
    2e82:	b24080e7          	jalr	-1244(ra) # 49a2 <chdir>
    2e86:	f95d                	bnez	a0,2e3c <iref+0x4e>
    mkdir("");
    2e88:	8552                	mv	a0,s4
    2e8a:	00002097          	auipc	ra,0x2
    2e8e:	b10080e7          	jalr	-1264(ra) # 499a <mkdir>
    fd = open("", O_CREATE);
    2e92:	20000593          	li	a1,512
    2e96:	8552                	mv	a0,s4
    2e98:	00002097          	auipc	ra,0x2
    2e9c:	af2080e7          	jalr	-1294(ra) # 498a <open>
    if(fd >= 0)
    2ea0:	fa055ce3          	bgez	a0,2e58 <iref+0x6a>
    fd = open("xx", O_CREATE);
    2ea4:	20000593          	li	a1,512
    2ea8:	854e                	mv	a0,s3
    2eaa:	00002097          	auipc	ra,0x2
    2eae:	ae0080e7          	jalr	-1312(ra) # 498a <open>
    if(fd >= 0)
    2eb2:	fa0548e3          	bltz	a0,2e62 <iref+0x74>
      close(fd);
    2eb6:	00002097          	auipc	ra,0x2
    2eba:	abc080e7          	jalr	-1348(ra) # 4972 <close>
    2ebe:	b755                	j	2e62 <iref+0x74>
    2ec0:	03300493          	li	s1,51
    chdir("..");
    2ec4:	00003997          	auipc	s3,0x3
    2ec8:	16c98993          	addi	s3,s3,364 # 6030 <malloc+0x1280>
    remove("irefd");
    2ecc:	00003917          	auipc	s2,0x3
    2ed0:	32490913          	addi	s2,s2,804 # 61f0 <malloc+0x1440>
    chdir("..");
    2ed4:	854e                	mv	a0,s3
    2ed6:	00002097          	auipc	ra,0x2
    2eda:	acc080e7          	jalr	-1332(ra) # 49a2 <chdir>
    remove("irefd");
    2ede:	854a                	mv	a0,s2
    2ee0:	00002097          	auipc	ra,0x2
    2ee4:	b12080e7          	jalr	-1262(ra) # 49f2 <remove>
  for(i = 0; i < NINODE + 1; i++){
    2ee8:	34fd                	addiw	s1,s1,-1
    2eea:	f4ed                	bnez	s1,2ed4 <iref+0xe6>
  chdir("/");
    2eec:	00003517          	auipc	a0,0x3
    2ef0:	d2c50513          	addi	a0,a0,-724 # 5c18 <malloc+0xe68>
    2ef4:	00002097          	auipc	ra,0x2
    2ef8:	aae080e7          	jalr	-1362(ra) # 49a2 <chdir>
}
    2efc:	70e2                	ld	ra,56(sp)
    2efe:	7442                	ld	s0,48(sp)
    2f00:	74a2                	ld	s1,40(sp)
    2f02:	7902                	ld	s2,32(sp)
    2f04:	69e2                	ld	s3,24(sp)
    2f06:	6a42                	ld	s4,16(sp)
    2f08:	6aa2                	ld	s5,8(sp)
    2f0a:	6121                	addi	sp,sp,64
    2f0c:	8082                	ret

0000000000002f0e <openiputtest>:
{
    2f0e:	7179                	addi	sp,sp,-48
    2f10:	f406                	sd	ra,40(sp)
    2f12:	f022                	sd	s0,32(sp)
    2f14:	ec26                	sd	s1,24(sp)
    2f16:	1800                	addi	s0,sp,48
    2f18:	84aa                	mv	s1,a0
  if(mkdir("oidir") < 0){
    2f1a:	00003517          	auipc	a0,0x3
    2f1e:	30e50513          	addi	a0,a0,782 # 6228 <malloc+0x1478>
    2f22:	00002097          	auipc	ra,0x2
    2f26:	a78080e7          	jalr	-1416(ra) # 499a <mkdir>
    2f2a:	04054263          	bltz	a0,2f6e <openiputtest+0x60>
  pid = fork();
    2f2e:	00002097          	auipc	ra,0x2
    2f32:	a14080e7          	jalr	-1516(ra) # 4942 <fork>
  if(pid < 0){
    2f36:	04054a63          	bltz	a0,2f8a <openiputtest+0x7c>
  if(pid == 0){
    2f3a:	e93d                	bnez	a0,2fb0 <openiputtest+0xa2>
    int fd = open("oidir", O_RDWR);
    2f3c:	4589                	li	a1,2
    2f3e:	00003517          	auipc	a0,0x3
    2f42:	2ea50513          	addi	a0,a0,746 # 6228 <malloc+0x1478>
    2f46:	00002097          	auipc	ra,0x2
    2f4a:	a44080e7          	jalr	-1468(ra) # 498a <open>
    if(fd >= 0){
    2f4e:	04054c63          	bltz	a0,2fa6 <openiputtest+0x98>
      printf("%s: open directory for write succeeded\n", s);
    2f52:	85a6                	mv	a1,s1
    2f54:	00003517          	auipc	a0,0x3
    2f58:	2f450513          	addi	a0,a0,756 # 6248 <malloc+0x1498>
    2f5c:	00002097          	auipc	ra,0x2
    2f60:	d94080e7          	jalr	-620(ra) # 4cf0 <printf>
      exit(1);
    2f64:	4505                	li	a0,1
    2f66:	00002097          	auipc	ra,0x2
    2f6a:	9e4080e7          	jalr	-1564(ra) # 494a <exit>
    printf("%s: mkdir oidir failed\n", s);
    2f6e:	85a6                	mv	a1,s1
    2f70:	00003517          	auipc	a0,0x3
    2f74:	2c050513          	addi	a0,a0,704 # 6230 <malloc+0x1480>
    2f78:	00002097          	auipc	ra,0x2
    2f7c:	d78080e7          	jalr	-648(ra) # 4cf0 <printf>
    exit(1);
    2f80:	4505                	li	a0,1
    2f82:	00002097          	auipc	ra,0x2
    2f86:	9c8080e7          	jalr	-1592(ra) # 494a <exit>
    printf("%s: fork failed\n", s);
    2f8a:	85a6                	mv	a1,s1
    2f8c:	00002517          	auipc	a0,0x2
    2f90:	62450513          	addi	a0,a0,1572 # 55b0 <malloc+0x800>
    2f94:	00002097          	auipc	ra,0x2
    2f98:	d5c080e7          	jalr	-676(ra) # 4cf0 <printf>
    exit(1);
    2f9c:	4505                	li	a0,1
    2f9e:	00002097          	auipc	ra,0x2
    2fa2:	9ac080e7          	jalr	-1620(ra) # 494a <exit>
    exit(0);
    2fa6:	4501                	li	a0,0
    2fa8:	00002097          	auipc	ra,0x2
    2fac:	9a2080e7          	jalr	-1630(ra) # 494a <exit>
  sleep(1);
    2fb0:	4505                	li	a0,1
    2fb2:	00002097          	auipc	ra,0x2
    2fb6:	a10080e7          	jalr	-1520(ra) # 49c2 <sleep>
  if(remove("oidir") != 0){
    2fba:	00003517          	auipc	a0,0x3
    2fbe:	26e50513          	addi	a0,a0,622 # 6228 <malloc+0x1478>
    2fc2:	00002097          	auipc	ra,0x2
    2fc6:	a30080e7          	jalr	-1488(ra) # 49f2 <remove>
    2fca:	cd19                	beqz	a0,2fe8 <openiputtest+0xda>
    printf("%s: remove failed\n", s);
    2fcc:	85a6                	mv	a1,s1
    2fce:	00003517          	auipc	a0,0x3
    2fd2:	2a250513          	addi	a0,a0,674 # 6270 <malloc+0x14c0>
    2fd6:	00002097          	auipc	ra,0x2
    2fda:	d1a080e7          	jalr	-742(ra) # 4cf0 <printf>
    exit(1);
    2fde:	4505                	li	a0,1
    2fe0:	00002097          	auipc	ra,0x2
    2fe4:	96a080e7          	jalr	-1686(ra) # 494a <exit>
  wait(&xstatus);
    2fe8:	fdc40513          	addi	a0,s0,-36
    2fec:	00002097          	auipc	ra,0x2
    2ff0:	966080e7          	jalr	-1690(ra) # 4952 <wait>
  exit(xstatus);
    2ff4:	fdc42503          	lw	a0,-36(s0)
    2ff8:	00002097          	auipc	ra,0x2
    2ffc:	952080e7          	jalr	-1710(ra) # 494a <exit>

0000000000003000 <forkforkfork>:
{
    3000:	1101                	addi	sp,sp,-32
    3002:	ec06                	sd	ra,24(sp)
    3004:	e822                	sd	s0,16(sp)
    3006:	e426                	sd	s1,8(sp)
    3008:	1000                	addi	s0,sp,32
    300a:	84aa                	mv	s1,a0
  remove("stopforking");
    300c:	00003517          	auipc	a0,0x3
    3010:	27c50513          	addi	a0,a0,636 # 6288 <malloc+0x14d8>
    3014:	00002097          	auipc	ra,0x2
    3018:	9de080e7          	jalr	-1570(ra) # 49f2 <remove>
  int pid = fork();
    301c:	00002097          	auipc	ra,0x2
    3020:	926080e7          	jalr	-1754(ra) # 4942 <fork>
  if(pid < 0){
    3024:	04054d63          	bltz	a0,307e <forkforkfork+0x7e>
  if(pid == 0){
    3028:	c92d                	beqz	a0,309a <forkforkfork+0x9a>
  sleep(20); // two seconds
    302a:	4551                	li	a0,20
    302c:	00002097          	auipc	ra,0x2
    3030:	996080e7          	jalr	-1642(ra) # 49c2 <sleep>
  close(open("stopforking", O_CREATE|O_RDWR));
    3034:	20200593          	li	a1,514
    3038:	00003517          	auipc	a0,0x3
    303c:	25050513          	addi	a0,a0,592 # 6288 <malloc+0x14d8>
    3040:	00002097          	auipc	ra,0x2
    3044:	94a080e7          	jalr	-1718(ra) # 498a <open>
    3048:	00002097          	auipc	ra,0x2
    304c:	92a080e7          	jalr	-1750(ra) # 4972 <close>
  wait(0);
    3050:	4501                	li	a0,0
    3052:	00002097          	auipc	ra,0x2
    3056:	900080e7          	jalr	-1792(ra) # 4952 <wait>
  sleep(10); // one second
    305a:	4529                	li	a0,10
    305c:	00002097          	auipc	ra,0x2
    3060:	966080e7          	jalr	-1690(ra) # 49c2 <sleep>
  remove("stopforking");
    3064:	00003517          	auipc	a0,0x3
    3068:	22450513          	addi	a0,a0,548 # 6288 <malloc+0x14d8>
    306c:	00002097          	auipc	ra,0x2
    3070:	986080e7          	jalr	-1658(ra) # 49f2 <remove>
}
    3074:	60e2                	ld	ra,24(sp)
    3076:	6442                	ld	s0,16(sp)
    3078:	64a2                	ld	s1,8(sp)
    307a:	6105                	addi	sp,sp,32
    307c:	8082                	ret
    printf("%s: fork failed", s);
    307e:	85a6                	mv	a1,s1
    3080:	00002517          	auipc	a0,0x2
    3084:	6f050513          	addi	a0,a0,1776 # 5770 <malloc+0x9c0>
    3088:	00002097          	auipc	ra,0x2
    308c:	c68080e7          	jalr	-920(ra) # 4cf0 <printf>
    exit(1);
    3090:	4505                	li	a0,1
    3092:	00002097          	auipc	ra,0x2
    3096:	8b8080e7          	jalr	-1864(ra) # 494a <exit>
      int fd = open("stopforking", 0);
    309a:	00003497          	auipc	s1,0x3
    309e:	1ee48493          	addi	s1,s1,494 # 6288 <malloc+0x14d8>
    30a2:	4581                	li	a1,0
    30a4:	8526                	mv	a0,s1
    30a6:	00002097          	auipc	ra,0x2
    30aa:	8e4080e7          	jalr	-1820(ra) # 498a <open>
      if(fd >= 0){
    30ae:	02055463          	bgez	a0,30d6 <forkforkfork+0xd6>
      if(fork() < 0){
    30b2:	00002097          	auipc	ra,0x2
    30b6:	890080e7          	jalr	-1904(ra) # 4942 <fork>
    30ba:	fe0554e3          	bgez	a0,30a2 <forkforkfork+0xa2>
        close(open("stopforking", O_CREATE|O_RDWR));
    30be:	20200593          	li	a1,514
    30c2:	8526                	mv	a0,s1
    30c4:	00002097          	auipc	ra,0x2
    30c8:	8c6080e7          	jalr	-1850(ra) # 498a <open>
    30cc:	00002097          	auipc	ra,0x2
    30d0:	8a6080e7          	jalr	-1882(ra) # 4972 <close>
    30d4:	b7f9                	j	30a2 <forkforkfork+0xa2>
        exit(0);
    30d6:	4501                	li	a0,0
    30d8:	00002097          	auipc	ra,0x2
    30dc:	872080e7          	jalr	-1934(ra) # 494a <exit>

00000000000030e0 <preempt>:
{
    30e0:	7139                	addi	sp,sp,-64
    30e2:	fc06                	sd	ra,56(sp)
    30e4:	f822                	sd	s0,48(sp)
    30e6:	f426                	sd	s1,40(sp)
    30e8:	f04a                	sd	s2,32(sp)
    30ea:	ec4e                	sd	s3,24(sp)
    30ec:	e852                	sd	s4,16(sp)
    30ee:	0080                	addi	s0,sp,64
    30f0:	8a2a                	mv	s4,a0
  pid1 = fork();
    30f2:	00002097          	auipc	ra,0x2
    30f6:	850080e7          	jalr	-1968(ra) # 4942 <fork>
  if(pid1 < 0) {
    30fa:	00054563          	bltz	a0,3104 <preempt+0x24>
    30fe:	89aa                	mv	s3,a0
  if(pid1 == 0)
    3100:	ed19                	bnez	a0,311e <preempt+0x3e>
    for(;;)
    3102:	a001                	j	3102 <preempt+0x22>
    printf("%s: fork failed");
    3104:	00002517          	auipc	a0,0x2
    3108:	66c50513          	addi	a0,a0,1644 # 5770 <malloc+0x9c0>
    310c:	00002097          	auipc	ra,0x2
    3110:	be4080e7          	jalr	-1052(ra) # 4cf0 <printf>
    exit(1);
    3114:	4505                	li	a0,1
    3116:	00002097          	auipc	ra,0x2
    311a:	834080e7          	jalr	-1996(ra) # 494a <exit>
  pid2 = fork();
    311e:	00002097          	auipc	ra,0x2
    3122:	824080e7          	jalr	-2012(ra) # 4942 <fork>
    3126:	892a                	mv	s2,a0
  if(pid2 < 0) {
    3128:	00054463          	bltz	a0,3130 <preempt+0x50>
  if(pid2 == 0)
    312c:	e105                	bnez	a0,314c <preempt+0x6c>
    for(;;)
    312e:	a001                	j	312e <preempt+0x4e>
    printf("%s: fork failed\n", s);
    3130:	85d2                	mv	a1,s4
    3132:	00002517          	auipc	a0,0x2
    3136:	47e50513          	addi	a0,a0,1150 # 55b0 <malloc+0x800>
    313a:	00002097          	auipc	ra,0x2
    313e:	bb6080e7          	jalr	-1098(ra) # 4cf0 <printf>
    exit(1);
    3142:	4505                	li	a0,1
    3144:	00002097          	auipc	ra,0x2
    3148:	806080e7          	jalr	-2042(ra) # 494a <exit>
  pipe(pfds);
    314c:	fc840513          	addi	a0,s0,-56
    3150:	00002097          	auipc	ra,0x2
    3154:	80a080e7          	jalr	-2038(ra) # 495a <pipe>
  pid3 = fork();
    3158:	00001097          	auipc	ra,0x1
    315c:	7ea080e7          	jalr	2026(ra) # 4942 <fork>
    3160:	84aa                	mv	s1,a0
  if(pid3 < 0) {
    3162:	02054e63          	bltz	a0,319e <preempt+0xbe>
  if(pid3 == 0){
    3166:	e13d                	bnez	a0,31cc <preempt+0xec>
    close(pfds[0]);
    3168:	fc842503          	lw	a0,-56(s0)
    316c:	00002097          	auipc	ra,0x2
    3170:	806080e7          	jalr	-2042(ra) # 4972 <close>
    if(write(pfds[1], "x", 1) != 1)
    3174:	4605                	li	a2,1
    3176:	00002597          	auipc	a1,0x2
    317a:	e1a58593          	addi	a1,a1,-486 # 4f90 <malloc+0x1e0>
    317e:	fcc42503          	lw	a0,-52(s0)
    3182:	00001097          	auipc	ra,0x1
    3186:	7e8080e7          	jalr	2024(ra) # 496a <write>
    318a:	4785                	li	a5,1
    318c:	02f51763          	bne	a0,a5,31ba <preempt+0xda>
    close(pfds[1]);
    3190:	fcc42503          	lw	a0,-52(s0)
    3194:	00001097          	auipc	ra,0x1
    3198:	7de080e7          	jalr	2014(ra) # 4972 <close>
    for(;;)
    319c:	a001                	j	319c <preempt+0xbc>
     printf("%s: fork failed\n", s);
    319e:	85d2                	mv	a1,s4
    31a0:	00002517          	auipc	a0,0x2
    31a4:	41050513          	addi	a0,a0,1040 # 55b0 <malloc+0x800>
    31a8:	00002097          	auipc	ra,0x2
    31ac:	b48080e7          	jalr	-1208(ra) # 4cf0 <printf>
     exit(1);
    31b0:	4505                	li	a0,1
    31b2:	00001097          	auipc	ra,0x1
    31b6:	798080e7          	jalr	1944(ra) # 494a <exit>
      printf("%s: preempt write error");
    31ba:	00003517          	auipc	a0,0x3
    31be:	0de50513          	addi	a0,a0,222 # 6298 <malloc+0x14e8>
    31c2:	00002097          	auipc	ra,0x2
    31c6:	b2e080e7          	jalr	-1234(ra) # 4cf0 <printf>
    31ca:	b7d9                	j	3190 <preempt+0xb0>
  close(pfds[1]);
    31cc:	fcc42503          	lw	a0,-52(s0)
    31d0:	00001097          	auipc	ra,0x1
    31d4:	7a2080e7          	jalr	1954(ra) # 4972 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    31d8:	6609                	lui	a2,0x2
    31da:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x28>
    31de:	00007597          	auipc	a1,0x7
    31e2:	68a58593          	addi	a1,a1,1674 # a868 <buf>
    31e6:	fc842503          	lw	a0,-56(s0)
    31ea:	00001097          	auipc	ra,0x1
    31ee:	778080e7          	jalr	1912(ra) # 4962 <read>
    31f2:	4785                	li	a5,1
    31f4:	02f50263          	beq	a0,a5,3218 <preempt+0x138>
    printf("%s: preempt read error");
    31f8:	00003517          	auipc	a0,0x3
    31fc:	0b850513          	addi	a0,a0,184 # 62b0 <malloc+0x1500>
    3200:	00002097          	auipc	ra,0x2
    3204:	af0080e7          	jalr	-1296(ra) # 4cf0 <printf>
}
    3208:	70e2                	ld	ra,56(sp)
    320a:	7442                	ld	s0,48(sp)
    320c:	74a2                	ld	s1,40(sp)
    320e:	7902                	ld	s2,32(sp)
    3210:	69e2                	ld	s3,24(sp)
    3212:	6a42                	ld	s4,16(sp)
    3214:	6121                	addi	sp,sp,64
    3216:	8082                	ret
  close(pfds[0]);
    3218:	fc842503          	lw	a0,-56(s0)
    321c:	00001097          	auipc	ra,0x1
    3220:	756080e7          	jalr	1878(ra) # 4972 <close>
  printf("kill... ");
    3224:	00003517          	auipc	a0,0x3
    3228:	0a450513          	addi	a0,a0,164 # 62c8 <malloc+0x1518>
    322c:	00002097          	auipc	ra,0x2
    3230:	ac4080e7          	jalr	-1340(ra) # 4cf0 <printf>
  kill(pid1);
    3234:	854e                	mv	a0,s3
    3236:	00001097          	auipc	ra,0x1
    323a:	744080e7          	jalr	1860(ra) # 497a <kill>
  kill(pid2);
    323e:	854a                	mv	a0,s2
    3240:	00001097          	auipc	ra,0x1
    3244:	73a080e7          	jalr	1850(ra) # 497a <kill>
  kill(pid3);
    3248:	8526                	mv	a0,s1
    324a:	00001097          	auipc	ra,0x1
    324e:	730080e7          	jalr	1840(ra) # 497a <kill>
  printf("wait... ");
    3252:	00003517          	auipc	a0,0x3
    3256:	08650513          	addi	a0,a0,134 # 62d8 <malloc+0x1528>
    325a:	00002097          	auipc	ra,0x2
    325e:	a96080e7          	jalr	-1386(ra) # 4cf0 <printf>
  wait(0);
    3262:	4501                	li	a0,0
    3264:	00001097          	auipc	ra,0x1
    3268:	6ee080e7          	jalr	1774(ra) # 4952 <wait>
  wait(0);
    326c:	4501                	li	a0,0
    326e:	00001097          	auipc	ra,0x1
    3272:	6e4080e7          	jalr	1764(ra) # 4952 <wait>
  wait(0);
    3276:	4501                	li	a0,0
    3278:	00001097          	auipc	ra,0x1
    327c:	6da080e7          	jalr	1754(ra) # 4952 <wait>
    3280:	b761                	j	3208 <preempt+0x128>

0000000000003282 <sbrkfail>:
{
    3282:	7119                	addi	sp,sp,-128
    3284:	fc86                	sd	ra,120(sp)
    3286:	f8a2                	sd	s0,112(sp)
    3288:	f4a6                	sd	s1,104(sp)
    328a:	f0ca                	sd	s2,96(sp)
    328c:	ecce                	sd	s3,88(sp)
    328e:	e8d2                	sd	s4,80(sp)
    3290:	e4d6                	sd	s5,72(sp)
    3292:	e0da                	sd	s6,64(sp)
    3294:	0100                	addi	s0,sp,128
    3296:	8b2a                	mv	s6,a0
  if(pipe(fds) != 0){
    3298:	fb040513          	addi	a0,s0,-80
    329c:	00001097          	auipc	ra,0x1
    32a0:	6be080e7          	jalr	1726(ra) # 495a <pipe>
    32a4:	e911                	bnez	a0,32b8 <sbrkfail+0x36>
    32a6:	f8040493          	addi	s1,s0,-128
    32aa:	fa840993          	addi	s3,s0,-88
    32ae:	8926                	mv	s2,s1
    if(pids[i] != -1)
    32b0:	5afd                	li	s5,-1
      read(fds[0], &scratch, 1);
    32b2:	faf40a13          	addi	s4,s0,-81
    32b6:	a085                	j	3316 <sbrkfail+0x94>
    printf("%s: pipe() failed\n", s);
    32b8:	85da                	mv	a1,s6
    32ba:	00002517          	auipc	a0,0x2
    32be:	3fe50513          	addi	a0,a0,1022 # 56b8 <malloc+0x908>
    32c2:	00002097          	auipc	ra,0x2
    32c6:	a2e080e7          	jalr	-1490(ra) # 4cf0 <printf>
    exit(1);
    32ca:	4505                	li	a0,1
    32cc:	00001097          	auipc	ra,0x1
    32d0:	67e080e7          	jalr	1662(ra) # 494a <exit>
      sbrk(BIG - (uint64)sbrk(0));
    32d4:	00001097          	auipc	ra,0x1
    32d8:	6e6080e7          	jalr	1766(ra) # 49ba <sbrk>
    32dc:	064007b7          	lui	a5,0x6400
    32e0:	40a7853b          	subw	a0,a5,a0
    32e4:	00001097          	auipc	ra,0x1
    32e8:	6d6080e7          	jalr	1750(ra) # 49ba <sbrk>
      write(fds[1], "x", 1);
    32ec:	4605                	li	a2,1
    32ee:	00002597          	auipc	a1,0x2
    32f2:	ca258593          	addi	a1,a1,-862 # 4f90 <malloc+0x1e0>
    32f6:	fb442503          	lw	a0,-76(s0)
    32fa:	00001097          	auipc	ra,0x1
    32fe:	670080e7          	jalr	1648(ra) # 496a <write>
      for(;;) sleep(1000);
    3302:	3e800513          	li	a0,1000
    3306:	00001097          	auipc	ra,0x1
    330a:	6bc080e7          	jalr	1724(ra) # 49c2 <sleep>
    330e:	bfd5                	j	3302 <sbrkfail+0x80>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3310:	0911                	addi	s2,s2,4
    3312:	03390463          	beq	s2,s3,333a <sbrkfail+0xb8>
    if((pids[i] = fork()) == 0){
    3316:	00001097          	auipc	ra,0x1
    331a:	62c080e7          	jalr	1580(ra) # 4942 <fork>
    331e:	00a92023          	sw	a0,0(s2)
    3322:	d94d                	beqz	a0,32d4 <sbrkfail+0x52>
    if(pids[i] != -1)
    3324:	ff5506e3          	beq	a0,s5,3310 <sbrkfail+0x8e>
      read(fds[0], &scratch, 1);
    3328:	4605                	li	a2,1
    332a:	85d2                	mv	a1,s4
    332c:	fb042503          	lw	a0,-80(s0)
    3330:	00001097          	auipc	ra,0x1
    3334:	632080e7          	jalr	1586(ra) # 4962 <read>
    3338:	bfe1                	j	3310 <sbrkfail+0x8e>
  c = sbrk(PGSIZE);
    333a:	6505                	lui	a0,0x1
    333c:	00001097          	auipc	ra,0x1
    3340:	67e080e7          	jalr	1662(ra) # 49ba <sbrk>
    3344:	892a                	mv	s2,a0
    if(pids[i] == -1)
    3346:	5a7d                	li	s4,-1
    3348:	a021                	j	3350 <sbrkfail+0xce>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    334a:	0491                	addi	s1,s1,4
    334c:	01348f63          	beq	s1,s3,336a <sbrkfail+0xe8>
    if(pids[i] == -1)
    3350:	4088                	lw	a0,0(s1)
    3352:	ff450ce3          	beq	a0,s4,334a <sbrkfail+0xc8>
    kill(pids[i]);
    3356:	00001097          	auipc	ra,0x1
    335a:	624080e7          	jalr	1572(ra) # 497a <kill>
    wait(0);
    335e:	4501                	li	a0,0
    3360:	00001097          	auipc	ra,0x1
    3364:	5f2080e7          	jalr	1522(ra) # 4952 <wait>
    3368:	b7cd                	j	334a <sbrkfail+0xc8>
  if(c == (char*)0xffffffffffffffffL){
    336a:	57fd                	li	a5,-1
    336c:	04f90263          	beq	s2,a5,33b0 <sbrkfail+0x12e>
  pid = fork();
    3370:	00001097          	auipc	ra,0x1
    3374:	5d2080e7          	jalr	1490(ra) # 4942 <fork>
    3378:	84aa                	mv	s1,a0
  if(pid < 0){
    337a:	04054963          	bltz	a0,33cc <sbrkfail+0x14a>
  if(pid == 0){
    337e:	c52d                	beqz	a0,33e8 <sbrkfail+0x166>
  wait(&xstatus);
    3380:	fbc40513          	addi	a0,s0,-68
    3384:	00001097          	auipc	ra,0x1
    3388:	5ce080e7          	jalr	1486(ra) # 4952 <wait>
  if(xstatus != -1 && xstatus != 2)
    338c:	fbc42783          	lw	a5,-68(s0)
    3390:	577d                	li	a4,-1
    3392:	00e78563          	beq	a5,a4,339c <sbrkfail+0x11a>
    3396:	4709                	li	a4,2
    3398:	08e79d63          	bne	a5,a4,3432 <sbrkfail+0x1b0>
}
    339c:	70e6                	ld	ra,120(sp)
    339e:	7446                	ld	s0,112(sp)
    33a0:	74a6                	ld	s1,104(sp)
    33a2:	7906                	ld	s2,96(sp)
    33a4:	69e6                	ld	s3,88(sp)
    33a6:	6a46                	ld	s4,80(sp)
    33a8:	6aa6                	ld	s5,72(sp)
    33aa:	6b06                	ld	s6,64(sp)
    33ac:	6109                	addi	sp,sp,128
    33ae:	8082                	ret
    printf("%s: failed sbrk leaked memory\n", s);
    33b0:	85da                	mv	a1,s6
    33b2:	00003517          	auipc	a0,0x3
    33b6:	f3650513          	addi	a0,a0,-202 # 62e8 <malloc+0x1538>
    33ba:	00002097          	auipc	ra,0x2
    33be:	936080e7          	jalr	-1738(ra) # 4cf0 <printf>
    exit(1);
    33c2:	4505                	li	a0,1
    33c4:	00001097          	auipc	ra,0x1
    33c8:	586080e7          	jalr	1414(ra) # 494a <exit>
    printf("%s: fork failed\n", s);
    33cc:	85da                	mv	a1,s6
    33ce:	00002517          	auipc	a0,0x2
    33d2:	1e250513          	addi	a0,a0,482 # 55b0 <malloc+0x800>
    33d6:	00002097          	auipc	ra,0x2
    33da:	91a080e7          	jalr	-1766(ra) # 4cf0 <printf>
    exit(1);
    33de:	4505                	li	a0,1
    33e0:	00001097          	auipc	ra,0x1
    33e4:	56a080e7          	jalr	1386(ra) # 494a <exit>
    a = sbrk(0);
    33e8:	4501                	li	a0,0
    33ea:	00001097          	auipc	ra,0x1
    33ee:	5d0080e7          	jalr	1488(ra) # 49ba <sbrk>
    33f2:	892a                	mv	s2,a0
    sbrk(10*BIG);
    33f4:	3e800537          	lui	a0,0x3e800
    33f8:	00001097          	auipc	ra,0x1
    33fc:	5c2080e7          	jalr	1474(ra) # 49ba <sbrk>
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    3400:	874a                	mv	a4,s2
    3402:	3e8007b7          	lui	a5,0x3e800
    3406:	97ca                	add	a5,a5,s2
    3408:	6685                	lui	a3,0x1
      n += *(a+i);
    340a:	00074603          	lbu	a2,0(a4)
    340e:	9cb1                	addw	s1,s1,a2
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    3410:	9736                	add	a4,a4,a3
    3412:	fee79ce3          	bne	a5,a4,340a <sbrkfail+0x188>
    printf("%s: allocate a lot of memory succeeded %d\n", n);
    3416:	85a6                	mv	a1,s1
    3418:	00003517          	auipc	a0,0x3
    341c:	ef050513          	addi	a0,a0,-272 # 6308 <malloc+0x1558>
    3420:	00002097          	auipc	ra,0x2
    3424:	8d0080e7          	jalr	-1840(ra) # 4cf0 <printf>
    exit(1);
    3428:	4505                	li	a0,1
    342a:	00001097          	auipc	ra,0x1
    342e:	520080e7          	jalr	1312(ra) # 494a <exit>
    exit(1);
    3432:	4505                	li	a0,1
    3434:	00001097          	auipc	ra,0x1
    3438:	516080e7          	jalr	1302(ra) # 494a <exit>

000000000000343c <reparent>:
{
    343c:	7179                	addi	sp,sp,-48
    343e:	f406                	sd	ra,40(sp)
    3440:	f022                	sd	s0,32(sp)
    3442:	ec26                	sd	s1,24(sp)
    3444:	e84a                	sd	s2,16(sp)
    3446:	e44e                	sd	s3,8(sp)
    3448:	e052                	sd	s4,0(sp)
    344a:	1800                	addi	s0,sp,48
    344c:	89aa                	mv	s3,a0
  int master_pid = getpid();
    344e:	00001097          	auipc	ra,0x1
    3452:	564080e7          	jalr	1380(ra) # 49b2 <getpid>
    3456:	8a2a                	mv	s4,a0
    3458:	0c800913          	li	s2,200
    int pid = fork();
    345c:	00001097          	auipc	ra,0x1
    3460:	4e6080e7          	jalr	1254(ra) # 4942 <fork>
    3464:	84aa                	mv	s1,a0
    if(pid < 0){
    3466:	02054263          	bltz	a0,348a <reparent+0x4e>
    if(pid){
    346a:	cd21                	beqz	a0,34c2 <reparent+0x86>
      if(wait(0) != pid){
    346c:	4501                	li	a0,0
    346e:	00001097          	auipc	ra,0x1
    3472:	4e4080e7          	jalr	1252(ra) # 4952 <wait>
    3476:	02951863          	bne	a0,s1,34a6 <reparent+0x6a>
  for(int i = 0; i < 200; i++){
    347a:	397d                	addiw	s2,s2,-1
    347c:	fe0910e3          	bnez	s2,345c <reparent+0x20>
  exit(0);
    3480:	4501                	li	a0,0
    3482:	00001097          	auipc	ra,0x1
    3486:	4c8080e7          	jalr	1224(ra) # 494a <exit>
      printf("%s: fork failed\n", s);
    348a:	85ce                	mv	a1,s3
    348c:	00002517          	auipc	a0,0x2
    3490:	12450513          	addi	a0,a0,292 # 55b0 <malloc+0x800>
    3494:	00002097          	auipc	ra,0x2
    3498:	85c080e7          	jalr	-1956(ra) # 4cf0 <printf>
      exit(1);
    349c:	4505                	li	a0,1
    349e:	00001097          	auipc	ra,0x1
    34a2:	4ac080e7          	jalr	1196(ra) # 494a <exit>
        printf("%s: wait wrong pid\n", s);
    34a6:	85ce                	mv	a1,s3
    34a8:	00002517          	auipc	a0,0x2
    34ac:	29050513          	addi	a0,a0,656 # 5738 <malloc+0x988>
    34b0:	00002097          	auipc	ra,0x2
    34b4:	840080e7          	jalr	-1984(ra) # 4cf0 <printf>
        exit(1);
    34b8:	4505                	li	a0,1
    34ba:	00001097          	auipc	ra,0x1
    34be:	490080e7          	jalr	1168(ra) # 494a <exit>
      int pid2 = fork();
    34c2:	00001097          	auipc	ra,0x1
    34c6:	480080e7          	jalr	1152(ra) # 4942 <fork>
      if(pid2 < 0){
    34ca:	00054763          	bltz	a0,34d8 <reparent+0x9c>
      exit(0);
    34ce:	4501                	li	a0,0
    34d0:	00001097          	auipc	ra,0x1
    34d4:	47a080e7          	jalr	1146(ra) # 494a <exit>
        kill(master_pid);
    34d8:	8552                	mv	a0,s4
    34da:	00001097          	auipc	ra,0x1
    34de:	4a0080e7          	jalr	1184(ra) # 497a <kill>
        exit(1);
    34e2:	4505                	li	a0,1
    34e4:	00001097          	auipc	ra,0x1
    34e8:	466080e7          	jalr	1126(ra) # 494a <exit>

00000000000034ec <mem>:
{
    34ec:	7139                	addi	sp,sp,-64
    34ee:	fc06                	sd	ra,56(sp)
    34f0:	f822                	sd	s0,48(sp)
    34f2:	f426                	sd	s1,40(sp)
    34f4:	f04a                	sd	s2,32(sp)
    34f6:	ec4e                	sd	s3,24(sp)
    34f8:	0080                	addi	s0,sp,64
    34fa:	89aa                	mv	s3,a0
  if((pid = fork()) == 0){
    34fc:	00001097          	auipc	ra,0x1
    3500:	446080e7          	jalr	1094(ra) # 4942 <fork>
    m1 = 0;
    3504:	4481                	li	s1,0
    while((m2 = malloc(10001)) != 0){
    3506:	6909                	lui	s2,0x2
    3508:	71190913          	addi	s2,s2,1809 # 2711 <subdir+0x199>
  if((pid = fork()) == 0){
    350c:	e135                	bnez	a0,3570 <mem+0x84>
    while((m2 = malloc(10001)) != 0){
    350e:	854a                	mv	a0,s2
    3510:	00002097          	auipc	ra,0x2
    3514:	8a0080e7          	jalr	-1888(ra) # 4db0 <malloc>
    3518:	c501                	beqz	a0,3520 <mem+0x34>
      *(char**)m2 = m1;
    351a:	e104                	sd	s1,0(a0)
      m1 = m2;
    351c:	84aa                	mv	s1,a0
    351e:	bfc5                	j	350e <mem+0x22>
    while(m1){
    3520:	c899                	beqz	s1,3536 <mem+0x4a>
      m2 = *(char**)m1;
    3522:	0004b903          	ld	s2,0(s1)
      free(m1);
    3526:	8526                	mv	a0,s1
    3528:	00001097          	auipc	ra,0x1
    352c:	7fe080e7          	jalr	2046(ra) # 4d26 <free>
      m1 = m2;
    3530:	84ca                	mv	s1,s2
    while(m1){
    3532:	fe0918e3          	bnez	s2,3522 <mem+0x36>
    m1 = malloc(1024*20);
    3536:	6515                	lui	a0,0x5
    3538:	00002097          	auipc	ra,0x2
    353c:	878080e7          	jalr	-1928(ra) # 4db0 <malloc>
    if(m1 == 0){
    3540:	c911                	beqz	a0,3554 <mem+0x68>
    free(m1);
    3542:	00001097          	auipc	ra,0x1
    3546:	7e4080e7          	jalr	2020(ra) # 4d26 <free>
    exit(0);
    354a:	4501                	li	a0,0
    354c:	00001097          	auipc	ra,0x1
    3550:	3fe080e7          	jalr	1022(ra) # 494a <exit>
      printf("couldn't allocate mem?!!\n", s);
    3554:	85ce                	mv	a1,s3
    3556:	00003517          	auipc	a0,0x3
    355a:	de250513          	addi	a0,a0,-542 # 6338 <malloc+0x1588>
    355e:	00001097          	auipc	ra,0x1
    3562:	792080e7          	jalr	1938(ra) # 4cf0 <printf>
      exit(1);
    3566:	4505                	li	a0,1
    3568:	00001097          	auipc	ra,0x1
    356c:	3e2080e7          	jalr	994(ra) # 494a <exit>
    wait(&xstatus);
    3570:	fcc40513          	addi	a0,s0,-52
    3574:	00001097          	auipc	ra,0x1
    3578:	3de080e7          	jalr	990(ra) # 4952 <wait>
    if(xstatus == -1){
    357c:	fcc42503          	lw	a0,-52(s0)
    3580:	57fd                	li	a5,-1
    3582:	00f50663          	beq	a0,a5,358e <mem+0xa2>
    exit(xstatus);
    3586:	00001097          	auipc	ra,0x1
    358a:	3c4080e7          	jalr	964(ra) # 494a <exit>
      exit(0);
    358e:	4501                	li	a0,0
    3590:	00001097          	auipc	ra,0x1
    3594:	3ba080e7          	jalr	954(ra) # 494a <exit>

0000000000003598 <sharedfd>:
{
    3598:	7159                	addi	sp,sp,-112
    359a:	f486                	sd	ra,104(sp)
    359c:	f0a2                	sd	s0,96(sp)
    359e:	eca6                	sd	s1,88(sp)
    35a0:	e8ca                	sd	s2,80(sp)
    35a2:	e4ce                	sd	s3,72(sp)
    35a4:	e0d2                	sd	s4,64(sp)
    35a6:	fc56                	sd	s5,56(sp)
    35a8:	f85a                	sd	s6,48(sp)
    35aa:	f45e                	sd	s7,40(sp)
    35ac:	f062                	sd	s8,32(sp)
    35ae:	1880                	addi	s0,sp,112
    35b0:	8a2a                	mv	s4,a0
  remove("sharedfd");
    35b2:	00003517          	auipc	a0,0x3
    35b6:	da650513          	addi	a0,a0,-602 # 6358 <malloc+0x15a8>
    35ba:	00001097          	auipc	ra,0x1
    35be:	438080e7          	jalr	1080(ra) # 49f2 <remove>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    35c2:	20200593          	li	a1,514
    35c6:	00003517          	auipc	a0,0x3
    35ca:	d9250513          	addi	a0,a0,-622 # 6358 <malloc+0x15a8>
    35ce:	00001097          	auipc	ra,0x1
    35d2:	3bc080e7          	jalr	956(ra) # 498a <open>
  if(fd < 0){
    35d6:	04054b63          	bltz	a0,362c <sharedfd+0x94>
    35da:	892a                	mv	s2,a0
  pid = fork();
    35dc:	00001097          	auipc	ra,0x1
    35e0:	366080e7          	jalr	870(ra) # 4942 <fork>
    35e4:	8aaa                	mv	s5,a0
  memset(buf, pid==0?'c':'p', sizeof(buf));
    35e6:	06300593          	li	a1,99
    35ea:	c119                	beqz	a0,35f0 <sharedfd+0x58>
    35ec:	07000593          	li	a1,112
    35f0:	4629                	li	a2,10
    35f2:	fa040513          	addi	a0,s0,-96
    35f6:	00001097          	auipc	ra,0x1
    35fa:	122080e7          	jalr	290(ra) # 4718 <memset>
    35fe:	3e800493          	li	s1,1000
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    3602:	fa040993          	addi	s3,s0,-96
    3606:	4629                	li	a2,10
    3608:	85ce                	mv	a1,s3
    360a:	854a                	mv	a0,s2
    360c:	00001097          	auipc	ra,0x1
    3610:	35e080e7          	jalr	862(ra) # 496a <write>
    3614:	47a9                	li	a5,10
    3616:	02f51963          	bne	a0,a5,3648 <sharedfd+0xb0>
  for(i = 0; i < N; i++){
    361a:	34fd                	addiw	s1,s1,-1
    361c:	f4ed                	bnez	s1,3606 <sharedfd+0x6e>
  if(pid == 0) {
    361e:	040a9363          	bnez	s5,3664 <sharedfd+0xcc>
    exit(0);
    3622:	4501                	li	a0,0
    3624:	00001097          	auipc	ra,0x1
    3628:	326080e7          	jalr	806(ra) # 494a <exit>
    printf("%s: cannot open sharedfd for writing", s);
    362c:	85d2                	mv	a1,s4
    362e:	00003517          	auipc	a0,0x3
    3632:	d3a50513          	addi	a0,a0,-710 # 6368 <malloc+0x15b8>
    3636:	00001097          	auipc	ra,0x1
    363a:	6ba080e7          	jalr	1722(ra) # 4cf0 <printf>
    exit(1);
    363e:	4505                	li	a0,1
    3640:	00001097          	auipc	ra,0x1
    3644:	30a080e7          	jalr	778(ra) # 494a <exit>
      printf("%s: write sharedfd failed\n", s);
    3648:	85d2                	mv	a1,s4
    364a:	00003517          	auipc	a0,0x3
    364e:	d4650513          	addi	a0,a0,-698 # 6390 <malloc+0x15e0>
    3652:	00001097          	auipc	ra,0x1
    3656:	69e080e7          	jalr	1694(ra) # 4cf0 <printf>
      exit(1);
    365a:	4505                	li	a0,1
    365c:	00001097          	auipc	ra,0x1
    3660:	2ee080e7          	jalr	750(ra) # 494a <exit>
    wait(&xstatus);
    3664:	f9c40513          	addi	a0,s0,-100
    3668:	00001097          	auipc	ra,0x1
    366c:	2ea080e7          	jalr	746(ra) # 4952 <wait>
    if(xstatus != 0)
    3670:	f9c42983          	lw	s3,-100(s0)
    3674:	00098763          	beqz	s3,3682 <sharedfd+0xea>
      exit(xstatus);
    3678:	854e                	mv	a0,s3
    367a:	00001097          	auipc	ra,0x1
    367e:	2d0080e7          	jalr	720(ra) # 494a <exit>
  close(fd);
    3682:	854a                	mv	a0,s2
    3684:	00001097          	auipc	ra,0x1
    3688:	2ee080e7          	jalr	750(ra) # 4972 <close>
  fd = open("sharedfd", 0);
    368c:	4581                	li	a1,0
    368e:	00003517          	auipc	a0,0x3
    3692:	cca50513          	addi	a0,a0,-822 # 6358 <malloc+0x15a8>
    3696:	00001097          	auipc	ra,0x1
    369a:	2f4080e7          	jalr	756(ra) # 498a <open>
    369e:	8baa                	mv	s7,a0
  nc = np = 0;
    36a0:	8ace                	mv	s5,s3
  if(fd < 0){
    36a2:	02054663          	bltz	a0,36ce <sharedfd+0x136>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    36a6:	fa040c13          	addi	s8,s0,-96
    36aa:	faa40913          	addi	s2,s0,-86
      if(buf[i] == 'c')
    36ae:	06300493          	li	s1,99
      if(buf[i] == 'p')
    36b2:	07000b13          	li	s6,112
  while((n = read(fd, buf, sizeof(buf))) > 0){
    36b6:	4629                	li	a2,10
    36b8:	85e2                	mv	a1,s8
    36ba:	855e                	mv	a0,s7
    36bc:	00001097          	auipc	ra,0x1
    36c0:	2a6080e7          	jalr	678(ra) # 4962 <read>
    36c4:	02a05f63          	blez	a0,3702 <sharedfd+0x16a>
    36c8:	fa040793          	addi	a5,s0,-96
    36cc:	a01d                	j	36f2 <sharedfd+0x15a>
    printf("%s: cannot open sharedfd for reading\n", s);
    36ce:	85d2                	mv	a1,s4
    36d0:	00003517          	auipc	a0,0x3
    36d4:	ce050513          	addi	a0,a0,-800 # 63b0 <malloc+0x1600>
    36d8:	00001097          	auipc	ra,0x1
    36dc:	618080e7          	jalr	1560(ra) # 4cf0 <printf>
    exit(1);
    36e0:	4505                	li	a0,1
    36e2:	00001097          	auipc	ra,0x1
    36e6:	268080e7          	jalr	616(ra) # 494a <exit>
        nc++;
    36ea:	2985                	addiw	s3,s3,1
    for(i = 0; i < sizeof(buf); i++){
    36ec:	0785                	addi	a5,a5,1
    36ee:	fd2784e3          	beq	a5,s2,36b6 <sharedfd+0x11e>
      if(buf[i] == 'c')
    36f2:	0007c703          	lbu	a4,0(a5) # 3e800000 <_end+0x3e7f3f80>
    36f6:	fe970ae3          	beq	a4,s1,36ea <sharedfd+0x152>
      if(buf[i] == 'p')
    36fa:	ff6719e3          	bne	a4,s6,36ec <sharedfd+0x154>
        np++;
    36fe:	2a85                	addiw	s5,s5,1
    3700:	b7f5                	j	36ec <sharedfd+0x154>
  close(fd);
    3702:	855e                	mv	a0,s7
    3704:	00001097          	auipc	ra,0x1
    3708:	26e080e7          	jalr	622(ra) # 4972 <close>
  remove("sharedfd");
    370c:	00003517          	auipc	a0,0x3
    3710:	c4c50513          	addi	a0,a0,-948 # 6358 <malloc+0x15a8>
    3714:	00001097          	auipc	ra,0x1
    3718:	2de080e7          	jalr	734(ra) # 49f2 <remove>
  if(nc == N*SZ && np == N*SZ){
    371c:	6789                	lui	a5,0x2
    371e:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x198>
    3722:	00f99763          	bne	s3,a5,3730 <sharedfd+0x198>
    3726:	6789                	lui	a5,0x2
    3728:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x198>
    372c:	02fa8063          	beq	s5,a5,374c <sharedfd+0x1b4>
    printf("%s: nc/np test fails\n", s);
    3730:	85d2                	mv	a1,s4
    3732:	00003517          	auipc	a0,0x3
    3736:	ca650513          	addi	a0,a0,-858 # 63d8 <malloc+0x1628>
    373a:	00001097          	auipc	ra,0x1
    373e:	5b6080e7          	jalr	1462(ra) # 4cf0 <printf>
    exit(1);
    3742:	4505                	li	a0,1
    3744:	00001097          	auipc	ra,0x1
    3748:	206080e7          	jalr	518(ra) # 494a <exit>
    exit(0);
    374c:	4501                	li	a0,0
    374e:	00001097          	auipc	ra,0x1
    3752:	1fc080e7          	jalr	508(ra) # 494a <exit>

0000000000003756 <fourfiles>:
{
    3756:	7171                	addi	sp,sp,-176
    3758:	f506                	sd	ra,168(sp)
    375a:	f122                	sd	s0,160(sp)
    375c:	ed26                	sd	s1,152(sp)
    375e:	e94a                	sd	s2,144(sp)
    3760:	e54e                	sd	s3,136(sp)
    3762:	e152                	sd	s4,128(sp)
    3764:	fcd6                	sd	s5,120(sp)
    3766:	f8da                	sd	s6,112(sp)
    3768:	f4de                	sd	s7,104(sp)
    376a:	f0e2                	sd	s8,96(sp)
    376c:	ece6                	sd	s9,88(sp)
    376e:	e8ea                	sd	s10,80(sp)
    3770:	e4ee                	sd	s11,72(sp)
    3772:	1900                	addi	s0,sp,176
    3774:	8daa                	mv	s11,a0
  char *names[] = { "f0", "f1", "f2", "f3" };
    3776:	00003797          	auipc	a5,0x3
    377a:	c7a78793          	addi	a5,a5,-902 # 63f0 <malloc+0x1640>
    377e:	f6f43823          	sd	a5,-144(s0)
    3782:	00003797          	auipc	a5,0x3
    3786:	c7678793          	addi	a5,a5,-906 # 63f8 <malloc+0x1648>
    378a:	f6f43c23          	sd	a5,-136(s0)
    378e:	00003797          	auipc	a5,0x3
    3792:	c7278793          	addi	a5,a5,-910 # 6400 <malloc+0x1650>
    3796:	f8f43023          	sd	a5,-128(s0)
    379a:	00003797          	auipc	a5,0x3
    379e:	c6e78793          	addi	a5,a5,-914 # 6408 <malloc+0x1658>
    37a2:	f8f43423          	sd	a5,-120(s0)
  for(pi = 0; pi < NCHILD; pi++){
    37a6:	f7040b93          	addi	s7,s0,-144
  char *names[] = { "f0", "f1", "f2", "f3" };
    37aa:	895e                	mv	s2,s7
  for(pi = 0; pi < NCHILD; pi++){
    37ac:	4481                	li	s1,0
    37ae:	4a11                	li	s4,4
    fname = names[pi];
    37b0:	00093983          	ld	s3,0(s2)
    remove(fname);
    37b4:	854e                	mv	a0,s3
    37b6:	00001097          	auipc	ra,0x1
    37ba:	23c080e7          	jalr	572(ra) # 49f2 <remove>
    pid = fork();
    37be:	00001097          	auipc	ra,0x1
    37c2:	184080e7          	jalr	388(ra) # 4942 <fork>
    if(pid < 0){
    37c6:	04054563          	bltz	a0,3810 <fourfiles+0xba>
    if(pid == 0){
    37ca:	c12d                	beqz	a0,382c <fourfiles+0xd6>
  for(pi = 0; pi < NCHILD; pi++){
    37cc:	2485                	addiw	s1,s1,1
    37ce:	0921                	addi	s2,s2,8
    37d0:	ff4490e3          	bne	s1,s4,37b0 <fourfiles+0x5a>
    37d4:	4491                	li	s1,4
    wait(&xstatus);
    37d6:	f6c40913          	addi	s2,s0,-148
    37da:	854a                	mv	a0,s2
    37dc:	00001097          	auipc	ra,0x1
    37e0:	176080e7          	jalr	374(ra) # 4952 <wait>
    if(xstatus != 0)
    37e4:	f6c42503          	lw	a0,-148(s0)
    37e8:	ed61                	bnez	a0,38c0 <fourfiles+0x16a>
  for(pi = 0; pi < NCHILD; pi++){
    37ea:	34fd                	addiw	s1,s1,-1
    37ec:	f4fd                	bnez	s1,37da <fourfiles+0x84>
    37ee:	03000b13          	li	s6,48
    total = 0;
    37f2:	f4a43c23          	sd	a0,-168(s0)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    37f6:	6a89                	lui	s5,0x2
    37f8:	800a8a93          	addi	s5,s5,-2048 # 1800 <forkfork+0x28>
    37fc:	00007997          	auipc	s3,0x7
    3800:	06c98993          	addi	s3,s3,108 # a868 <buf>
    if(total != N*SZ){
    3804:	6c85                	lui	s9,0x1
    3806:	770c8c93          	addi	s9,s9,1904 # 1770 <twochildren+0x32>
  for(i = 0; i < NCHILD; i++){
    380a:	03400d13          	li	s10,52
    380e:	aa15                	j	3942 <fourfiles+0x1ec>
      printf("fork failed\n", s);
    3810:	85ee                	mv	a1,s11
    3812:	00002517          	auipc	a0,0x2
    3816:	11e50513          	addi	a0,a0,286 # 5930 <malloc+0xb80>
    381a:	00001097          	auipc	ra,0x1
    381e:	4d6080e7          	jalr	1238(ra) # 4cf0 <printf>
      exit(1);
    3822:	4505                	li	a0,1
    3824:	00001097          	auipc	ra,0x1
    3828:	126080e7          	jalr	294(ra) # 494a <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    382c:	20200593          	li	a1,514
    3830:	854e                	mv	a0,s3
    3832:	00001097          	auipc	ra,0x1
    3836:	158080e7          	jalr	344(ra) # 498a <open>
    383a:	892a                	mv	s2,a0
      if(fd < 0){
    383c:	04054663          	bltz	a0,3888 <fourfiles+0x132>
      memset(buf, '0'+pi, SZ);
    3840:	1f400613          	li	a2,500
    3844:	0304859b          	addiw	a1,s1,48
    3848:	00007517          	auipc	a0,0x7
    384c:	02050513          	addi	a0,a0,32 # a868 <buf>
    3850:	00001097          	auipc	ra,0x1
    3854:	ec8080e7          	jalr	-312(ra) # 4718 <memset>
    3858:	44b1                	li	s1,12
        if((n = write(fd, buf, SZ)) != SZ){
    385a:	00007997          	auipc	s3,0x7
    385e:	00e98993          	addi	s3,s3,14 # a868 <buf>
    3862:	1f400613          	li	a2,500
    3866:	85ce                	mv	a1,s3
    3868:	854a                	mv	a0,s2
    386a:	00001097          	auipc	ra,0x1
    386e:	100080e7          	jalr	256(ra) # 496a <write>
    3872:	1f400793          	li	a5,500
    3876:	02f51763          	bne	a0,a5,38a4 <fourfiles+0x14e>
      for(i = 0; i < N; i++){
    387a:	34fd                	addiw	s1,s1,-1
    387c:	f0fd                	bnez	s1,3862 <fourfiles+0x10c>
      exit(0);
    387e:	4501                	li	a0,0
    3880:	00001097          	auipc	ra,0x1
    3884:	0ca080e7          	jalr	202(ra) # 494a <exit>
        printf("create failed\n", s);
    3888:	85ee                	mv	a1,s11
    388a:	00003517          	auipc	a0,0x3
    388e:	b8650513          	addi	a0,a0,-1146 # 6410 <malloc+0x1660>
    3892:	00001097          	auipc	ra,0x1
    3896:	45e080e7          	jalr	1118(ra) # 4cf0 <printf>
        exit(1);
    389a:	4505                	li	a0,1
    389c:	00001097          	auipc	ra,0x1
    38a0:	0ae080e7          	jalr	174(ra) # 494a <exit>
          printf("write failed %d\n", n);
    38a4:	85aa                	mv	a1,a0
    38a6:	00003517          	auipc	a0,0x3
    38aa:	b7a50513          	addi	a0,a0,-1158 # 6420 <malloc+0x1670>
    38ae:	00001097          	auipc	ra,0x1
    38b2:	442080e7          	jalr	1090(ra) # 4cf0 <printf>
          exit(1);
    38b6:	4505                	li	a0,1
    38b8:	00001097          	auipc	ra,0x1
    38bc:	092080e7          	jalr	146(ra) # 494a <exit>
      exit(xstatus);
    38c0:	00001097          	auipc	ra,0x1
    38c4:	08a080e7          	jalr	138(ra) # 494a <exit>
      total += n;
    38c8:	00a9093b          	addw	s2,s2,a0
    while((n = read(fd, buf, sizeof(buf))) > 0){
    38cc:	8656                	mv	a2,s5
    38ce:	85ce                	mv	a1,s3
    38d0:	8552                	mv	a0,s4
    38d2:	00001097          	auipc	ra,0x1
    38d6:	090080e7          	jalr	144(ra) # 4962 <read>
    38da:	04a05463          	blez	a0,3922 <fourfiles+0x1cc>
        if(buf[j] != '0'+i){
    38de:	0009c783          	lbu	a5,0(s3)
    38e2:	02979263          	bne	a5,s1,3906 <fourfiles+0x1b0>
    38e6:	00007797          	auipc	a5,0x7
    38ea:	f8378793          	addi	a5,a5,-125 # a869 <buf+0x1>
    38ee:	fff5069b          	addiw	a3,a0,-1
    38f2:	1682                	slli	a3,a3,0x20
    38f4:	9281                	srli	a3,a3,0x20
    38f6:	96be                	add	a3,a3,a5
      for(j = 0; j < n; j++){
    38f8:	fcd788e3          	beq	a5,a3,38c8 <fourfiles+0x172>
        if(buf[j] != '0'+i){
    38fc:	0007c703          	lbu	a4,0(a5)
    3900:	0785                	addi	a5,a5,1
    3902:	fe970be3          	beq	a4,s1,38f8 <fourfiles+0x1a2>
          printf("wrong char\n", s);
    3906:	85ee                	mv	a1,s11
    3908:	00003517          	auipc	a0,0x3
    390c:	b3050513          	addi	a0,a0,-1232 # 6438 <malloc+0x1688>
    3910:	00001097          	auipc	ra,0x1
    3914:	3e0080e7          	jalr	992(ra) # 4cf0 <printf>
          exit(1);
    3918:	4505                	li	a0,1
    391a:	00001097          	auipc	ra,0x1
    391e:	030080e7          	jalr	48(ra) # 494a <exit>
    close(fd);
    3922:	8552                	mv	a0,s4
    3924:	00001097          	auipc	ra,0x1
    3928:	04e080e7          	jalr	78(ra) # 4972 <close>
    if(total != N*SZ){
    392c:	03991963          	bne	s2,s9,395e <fourfiles+0x208>
    remove(fname);
    3930:	8562                	mv	a0,s8
    3932:	00001097          	auipc	ra,0x1
    3936:	0c0080e7          	jalr	192(ra) # 49f2 <remove>
  for(i = 0; i < NCHILD; i++){
    393a:	0ba1                	addi	s7,s7,8
    393c:	2b05                	addiw	s6,s6,1
    393e:	03ab0e63          	beq	s6,s10,397a <fourfiles+0x224>
    fname = names[i];
    3942:	000bbc03          	ld	s8,0(s7)
    fd = open(fname, 0);
    3946:	4581                	li	a1,0
    3948:	8562                	mv	a0,s8
    394a:	00001097          	auipc	ra,0x1
    394e:	040080e7          	jalr	64(ra) # 498a <open>
    3952:	8a2a                	mv	s4,a0
    total = 0;
    3954:	f5843903          	ld	s2,-168(s0)
    3958:	000b049b          	sext.w	s1,s6
    while((n = read(fd, buf, sizeof(buf))) > 0){
    395c:	bf85                	j	38cc <fourfiles+0x176>
      printf("wrong length %d\n", total);
    395e:	85ca                	mv	a1,s2
    3960:	00003517          	auipc	a0,0x3
    3964:	ae850513          	addi	a0,a0,-1304 # 6448 <malloc+0x1698>
    3968:	00001097          	auipc	ra,0x1
    396c:	388080e7          	jalr	904(ra) # 4cf0 <printf>
      exit(1);
    3970:	4505                	li	a0,1
    3972:	00001097          	auipc	ra,0x1
    3976:	fd8080e7          	jalr	-40(ra) # 494a <exit>
}
    397a:	70aa                	ld	ra,168(sp)
    397c:	740a                	ld	s0,160(sp)
    397e:	64ea                	ld	s1,152(sp)
    3980:	694a                	ld	s2,144(sp)
    3982:	69aa                	ld	s3,136(sp)
    3984:	6a0a                	ld	s4,128(sp)
    3986:	7ae6                	ld	s5,120(sp)
    3988:	7b46                	ld	s6,112(sp)
    398a:	7ba6                	ld	s7,104(sp)
    398c:	7c06                	ld	s8,96(sp)
    398e:	6ce6                	ld	s9,88(sp)
    3990:	6d46                	ld	s10,80(sp)
    3992:	6da6                	ld	s11,72(sp)
    3994:	614d                	addi	sp,sp,176
    3996:	8082                	ret

0000000000003998 <bigfile>:
{
    3998:	7139                	addi	sp,sp,-64
    399a:	fc06                	sd	ra,56(sp)
    399c:	f822                	sd	s0,48(sp)
    399e:	f426                	sd	s1,40(sp)
    39a0:	f04a                	sd	s2,32(sp)
    39a2:	ec4e                	sd	s3,24(sp)
    39a4:	e852                	sd	s4,16(sp)
    39a6:	e456                	sd	s5,8(sp)
    39a8:	0080                	addi	s0,sp,64
    39aa:	8aaa                	mv	s5,a0
  remove("bigfile.dat");
    39ac:	00003517          	auipc	a0,0x3
    39b0:	ab450513          	addi	a0,a0,-1356 # 6460 <malloc+0x16b0>
    39b4:	00001097          	auipc	ra,0x1
    39b8:	03e080e7          	jalr	62(ra) # 49f2 <remove>
  fd = open("bigfile.dat", O_CREATE | O_RDWR);
    39bc:	20200593          	li	a1,514
    39c0:	00003517          	auipc	a0,0x3
    39c4:	aa050513          	addi	a0,a0,-1376 # 6460 <malloc+0x16b0>
    39c8:	00001097          	auipc	ra,0x1
    39cc:	fc2080e7          	jalr	-62(ra) # 498a <open>
    39d0:	89aa                	mv	s3,a0
  for(i = 0; i < N; i++){
    39d2:	4481                	li	s1,0
    memset(buf, i, SZ);
    39d4:	00007917          	auipc	s2,0x7
    39d8:	e9490913          	addi	s2,s2,-364 # a868 <buf>
  for(i = 0; i < N; i++){
    39dc:	4a51                	li	s4,20
  if(fd < 0){
    39de:	0a054063          	bltz	a0,3a7e <bigfile+0xe6>
    memset(buf, i, SZ);
    39e2:	25800613          	li	a2,600
    39e6:	85a6                	mv	a1,s1
    39e8:	854a                	mv	a0,s2
    39ea:	00001097          	auipc	ra,0x1
    39ee:	d2e080e7          	jalr	-722(ra) # 4718 <memset>
    if(write(fd, buf, SZ) != SZ){
    39f2:	25800613          	li	a2,600
    39f6:	85ca                	mv	a1,s2
    39f8:	854e                	mv	a0,s3
    39fa:	00001097          	auipc	ra,0x1
    39fe:	f70080e7          	jalr	-144(ra) # 496a <write>
    3a02:	25800793          	li	a5,600
    3a06:	08f51a63          	bne	a0,a5,3a9a <bigfile+0x102>
  for(i = 0; i < N; i++){
    3a0a:	2485                	addiw	s1,s1,1
    3a0c:	fd449be3          	bne	s1,s4,39e2 <bigfile+0x4a>
  close(fd);
    3a10:	854e                	mv	a0,s3
    3a12:	00001097          	auipc	ra,0x1
    3a16:	f60080e7          	jalr	-160(ra) # 4972 <close>
  fd = open("bigfile.dat", 0);
    3a1a:	4581                	li	a1,0
    3a1c:	00003517          	auipc	a0,0x3
    3a20:	a4450513          	addi	a0,a0,-1468 # 6460 <malloc+0x16b0>
    3a24:	00001097          	auipc	ra,0x1
    3a28:	f66080e7          	jalr	-154(ra) # 498a <open>
    3a2c:	8a2a                	mv	s4,a0
  total = 0;
    3a2e:	4981                	li	s3,0
  for(i = 0; ; i++){
    3a30:	4481                	li	s1,0
    cc = read(fd, buf, SZ/2);
    3a32:	00007917          	auipc	s2,0x7
    3a36:	e3690913          	addi	s2,s2,-458 # a868 <buf>
  if(fd < 0){
    3a3a:	06054e63          	bltz	a0,3ab6 <bigfile+0x11e>
    cc = read(fd, buf, SZ/2);
    3a3e:	12c00613          	li	a2,300
    3a42:	85ca                	mv	a1,s2
    3a44:	8552                	mv	a0,s4
    3a46:	00001097          	auipc	ra,0x1
    3a4a:	f1c080e7          	jalr	-228(ra) # 4962 <read>
    if(cc < 0){
    3a4e:	08054263          	bltz	a0,3ad2 <bigfile+0x13a>
    if(cc == 0)
    3a52:	c971                	beqz	a0,3b26 <bigfile+0x18e>
    if(cc != SZ/2){
    3a54:	12c00793          	li	a5,300
    3a58:	08f51b63          	bne	a0,a5,3aee <bigfile+0x156>
    if(buf[0] != i/2 || buf[SZ/2-1] != i/2){
    3a5c:	01f4d79b          	srliw	a5,s1,0x1f
    3a60:	9fa5                	addw	a5,a5,s1
    3a62:	4017d79b          	sraiw	a5,a5,0x1
    3a66:	00094703          	lbu	a4,0(s2)
    3a6a:	0af71063          	bne	a4,a5,3b0a <bigfile+0x172>
    3a6e:	12b94703          	lbu	a4,299(s2)
    3a72:	08f71c63          	bne	a4,a5,3b0a <bigfile+0x172>
    total += cc;
    3a76:	12c9899b          	addiw	s3,s3,300
  for(i = 0; ; i++){
    3a7a:	2485                	addiw	s1,s1,1
    cc = read(fd, buf, SZ/2);
    3a7c:	b7c9                	j	3a3e <bigfile+0xa6>
    printf("%s: cannot create bigfile", s);
    3a7e:	85d6                	mv	a1,s5
    3a80:	00003517          	auipc	a0,0x3
    3a84:	9f050513          	addi	a0,a0,-1552 # 6470 <malloc+0x16c0>
    3a88:	00001097          	auipc	ra,0x1
    3a8c:	268080e7          	jalr	616(ra) # 4cf0 <printf>
    exit(1);
    3a90:	4505                	li	a0,1
    3a92:	00001097          	auipc	ra,0x1
    3a96:	eb8080e7          	jalr	-328(ra) # 494a <exit>
      printf("%s: write bigfile failed\n", s);
    3a9a:	85d6                	mv	a1,s5
    3a9c:	00003517          	auipc	a0,0x3
    3aa0:	9f450513          	addi	a0,a0,-1548 # 6490 <malloc+0x16e0>
    3aa4:	00001097          	auipc	ra,0x1
    3aa8:	24c080e7          	jalr	588(ra) # 4cf0 <printf>
      exit(1);
    3aac:	4505                	li	a0,1
    3aae:	00001097          	auipc	ra,0x1
    3ab2:	e9c080e7          	jalr	-356(ra) # 494a <exit>
    printf("%s: cannot open bigfile\n", s);
    3ab6:	85d6                	mv	a1,s5
    3ab8:	00003517          	auipc	a0,0x3
    3abc:	9f850513          	addi	a0,a0,-1544 # 64b0 <malloc+0x1700>
    3ac0:	00001097          	auipc	ra,0x1
    3ac4:	230080e7          	jalr	560(ra) # 4cf0 <printf>
    exit(1);
    3ac8:	4505                	li	a0,1
    3aca:	00001097          	auipc	ra,0x1
    3ace:	e80080e7          	jalr	-384(ra) # 494a <exit>
      printf("%s: read bigfile failed\n", s);
    3ad2:	85d6                	mv	a1,s5
    3ad4:	00003517          	auipc	a0,0x3
    3ad8:	9fc50513          	addi	a0,a0,-1540 # 64d0 <malloc+0x1720>
    3adc:	00001097          	auipc	ra,0x1
    3ae0:	214080e7          	jalr	532(ra) # 4cf0 <printf>
      exit(1);
    3ae4:	4505                	li	a0,1
    3ae6:	00001097          	auipc	ra,0x1
    3aea:	e64080e7          	jalr	-412(ra) # 494a <exit>
      printf("%s: short read bigfile\n", s);
    3aee:	85d6                	mv	a1,s5
    3af0:	00003517          	auipc	a0,0x3
    3af4:	a0050513          	addi	a0,a0,-1536 # 64f0 <malloc+0x1740>
    3af8:	00001097          	auipc	ra,0x1
    3afc:	1f8080e7          	jalr	504(ra) # 4cf0 <printf>
      exit(1);
    3b00:	4505                	li	a0,1
    3b02:	00001097          	auipc	ra,0x1
    3b06:	e48080e7          	jalr	-440(ra) # 494a <exit>
      printf("%s: read bigfile wrong data\n", s);
    3b0a:	85d6                	mv	a1,s5
    3b0c:	00003517          	auipc	a0,0x3
    3b10:	9fc50513          	addi	a0,a0,-1540 # 6508 <malloc+0x1758>
    3b14:	00001097          	auipc	ra,0x1
    3b18:	1dc080e7          	jalr	476(ra) # 4cf0 <printf>
      exit(1);
    3b1c:	4505                	li	a0,1
    3b1e:	00001097          	auipc	ra,0x1
    3b22:	e2c080e7          	jalr	-468(ra) # 494a <exit>
  close(fd);
    3b26:	8552                	mv	a0,s4
    3b28:	00001097          	auipc	ra,0x1
    3b2c:	e4a080e7          	jalr	-438(ra) # 4972 <close>
  if(total != N*SZ){
    3b30:	678d                	lui	a5,0x3
    3b32:	ee078793          	addi	a5,a5,-288 # 2ee0 <iref+0xf2>
    3b36:	02f99363          	bne	s3,a5,3b5c <bigfile+0x1c4>
  remove("bigfile.dat");
    3b3a:	00003517          	auipc	a0,0x3
    3b3e:	92650513          	addi	a0,a0,-1754 # 6460 <malloc+0x16b0>
    3b42:	00001097          	auipc	ra,0x1
    3b46:	eb0080e7          	jalr	-336(ra) # 49f2 <remove>
}
    3b4a:	70e2                	ld	ra,56(sp)
    3b4c:	7442                	ld	s0,48(sp)
    3b4e:	74a2                	ld	s1,40(sp)
    3b50:	7902                	ld	s2,32(sp)
    3b52:	69e2                	ld	s3,24(sp)
    3b54:	6a42                	ld	s4,16(sp)
    3b56:	6aa2                	ld	s5,8(sp)
    3b58:	6121                	addi	sp,sp,64
    3b5a:	8082                	ret
    printf("%s: read bigfile wrong total\n", s);
    3b5c:	85d6                	mv	a1,s5
    3b5e:	00003517          	auipc	a0,0x3
    3b62:	9ca50513          	addi	a0,a0,-1590 # 6528 <malloc+0x1778>
    3b66:	00001097          	auipc	ra,0x1
    3b6a:	18a080e7          	jalr	394(ra) # 4cf0 <printf>
    exit(1);
    3b6e:	4505                	li	a0,1
    3b70:	00001097          	auipc	ra,0x1
    3b74:	dda080e7          	jalr	-550(ra) # 494a <exit>

0000000000003b78 <createdelete>:
{
    3b78:	7171                	addi	sp,sp,-176
    3b7a:	f506                	sd	ra,168(sp)
    3b7c:	f122                	sd	s0,160(sp)
    3b7e:	ed26                	sd	s1,152(sp)
    3b80:	e94a                	sd	s2,144(sp)
    3b82:	e54e                	sd	s3,136(sp)
    3b84:	e152                	sd	s4,128(sp)
    3b86:	fcd6                	sd	s5,120(sp)
    3b88:	f8da                	sd	s6,112(sp)
    3b8a:	f4de                	sd	s7,104(sp)
    3b8c:	f0e2                	sd	s8,96(sp)
    3b8e:	ece6                	sd	s9,88(sp)
    3b90:	e8ea                	sd	s10,80(sp)
    3b92:	e4ee                	sd	s11,72(sp)
    3b94:	1900                	addi	s0,sp,176
    3b96:	8daa                	mv	s11,a0
  char illegal[] = { '\"', '*', '/', ':', '<', '>', '?', '\\', '|', 0 };
    3b98:	00001797          	auipc	a5,0x1
    3b9c:	30078793          	addi	a5,a5,768 # 4e98 <malloc+0xe8>
    3ba0:	6398                	ld	a4,0(a5)
    3ba2:	f6e43023          	sd	a4,-160(s0)
    3ba6:	0087d783          	lhu	a5,8(a5)
    3baa:	f6f41423          	sh	a5,-152(s0)
  for(pi = 0; pi < NCHILD; pi++){
    3bae:	4901                	li	s2,0
    3bb0:	4991                	li	s3,4
    pid = fork();
    3bb2:	00001097          	auipc	ra,0x1
    3bb6:	d90080e7          	jalr	-624(ra) # 4942 <fork>
    3bba:	84aa                	mv	s1,a0
    if(pid < 0){
    3bbc:	04054163          	bltz	a0,3bfe <createdelete+0x86>
    if(pid == 0){
    3bc0:	cd29                	beqz	a0,3c1a <createdelete+0xa2>
  for(pi = 0; pi < NCHILD; pi++){
    3bc2:	2905                	addiw	s2,s2,1
    3bc4:	ff3917e3          	bne	s2,s3,3bb2 <createdelete+0x3a>
    3bc8:	4491                	li	s1,4
    wait(&xstatus);
    3bca:	f5c40913          	addi	s2,s0,-164
    3bce:	854a                	mv	a0,s2
    3bd0:	00001097          	auipc	ra,0x1
    3bd4:	d82080e7          	jalr	-638(ra) # 4952 <wait>
    if(xstatus != 0)
    3bd8:	f5c42983          	lw	s3,-164(s0)
    3bdc:	10099863          	bnez	s3,3cec <createdelete+0x174>
  for(pi = 0; pi < NCHILD; pi++){
    3be0:	34fd                	addiw	s1,s1,-1
    3be2:	f4f5                	bnez	s1,3bce <createdelete+0x56>
  name[0] = name[1] = name[2] = 0;
    3be4:	f6040923          	sb	zero,-142(s0)
    3be8:	03000913          	li	s2,48
    3bec:	07000c93          	li	s9,112
      if (strchr(illegal, name[1]) != 0) { continue; }
    3bf0:	f6040a93          	addi	s5,s0,-160
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3bf4:	4c21                	li	s8,8
      if((i == 0 || i >= N/2) && fd < 0){
    3bf6:	4d25                	li	s10,9
      fd = open(name, 0);
    3bf8:	f7040b93          	addi	s7,s0,-144
    3bfc:	aa69                	j	3d96 <createdelete+0x21e>
      printf("fork failed\n", s);
    3bfe:	85ee                	mv	a1,s11
    3c00:	00002517          	auipc	a0,0x2
    3c04:	d3050513          	addi	a0,a0,-720 # 5930 <malloc+0xb80>
    3c08:	00001097          	auipc	ra,0x1
    3c0c:	0e8080e7          	jalr	232(ra) # 4cf0 <printf>
      exit(1);
    3c10:	4505                	li	a0,1
    3c12:	00001097          	auipc	ra,0x1
    3c16:	d38080e7          	jalr	-712(ra) # 494a <exit>
      name[0] = 'p' + pi;
    3c1a:	0709091b          	addiw	s2,s2,112
    3c1e:	f7240823          	sb	s2,-144(s0)
      name[2] = '\0';
    3c22:	f6040923          	sb	zero,-142(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c26:	f6040913          	addi	s2,s0,-160
          fd = open(name, O_CREATE | O_RDWR);
    3c2a:	f7040a13          	addi	s4,s0,-144
      for(i = 0; i < N; i++){
    3c2e:	49d1                	li	s3,20
    3c30:	a091                	j	3c74 <createdelete+0xfc>
          fd = open(name, O_CREATE | O_RDWR);
    3c32:	20200593          	li	a1,514
    3c36:	8552                	mv	a0,s4
    3c38:	00001097          	auipc	ra,0x1
    3c3c:	d52080e7          	jalr	-686(ra) # 498a <open>
          if(fd < 0){
    3c40:	00054763          	bltz	a0,3c4e <createdelete+0xd6>
          close(fd);
    3c44:	00001097          	auipc	ra,0x1
    3c48:	d2e080e7          	jalr	-722(ra) # 4972 <close>
    3c4c:	a081                	j	3c8c <createdelete+0x114>
            printf("%s: create %s failed\n", s, name);
    3c4e:	f7040613          	addi	a2,s0,-144
    3c52:	85ee                	mv	a1,s11
    3c54:	00003517          	auipc	a0,0x3
    3c58:	8f450513          	addi	a0,a0,-1804 # 6548 <malloc+0x1798>
    3c5c:	00001097          	auipc	ra,0x1
    3c60:	094080e7          	jalr	148(ra) # 4cf0 <printf>
            exit(1);
    3c64:	4505                	li	a0,1
    3c66:	00001097          	auipc	ra,0x1
    3c6a:	ce4080e7          	jalr	-796(ra) # 494a <exit>
      for(i = 0; i < N; i++){
    3c6e:	2485                	addiw	s1,s1,1
    3c70:	07348963          	beq	s1,s3,3ce2 <createdelete+0x16a>
        name[1] = '0' + i;
    3c74:	0304859b          	addiw	a1,s1,48
    3c78:	0ff5f593          	andi	a1,a1,255
    3c7c:	f6b408a3          	sb	a1,-143(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c80:	854a                	mv	a0,s2
    3c82:	00001097          	auipc	ra,0x1
    3c86:	abc080e7          	jalr	-1348(ra) # 473e <strchr>
    3c8a:	d545                	beqz	a0,3c32 <createdelete+0xba>
        if(i > 0 && (i % 2 ) == 0){
    3c8c:	fe9051e3          	blez	s1,3c6e <createdelete+0xf6>
    3c90:	0014f793          	andi	a5,s1,1
    3c94:	ffe9                	bnez	a5,3c6e <createdelete+0xf6>
          name[1] = '0' + (i / 2);
    3c96:	01f4d59b          	srliw	a1,s1,0x1f
    3c9a:	9da5                	addw	a1,a1,s1
    3c9c:	4015d59b          	sraiw	a1,a1,0x1
    3ca0:	0305859b          	addiw	a1,a1,48
    3ca4:	0ff5f593          	andi	a1,a1,255
    3ca8:	f6b408a3          	sb	a1,-143(s0)
          if (strchr(illegal, name[1]) == 0) {
    3cac:	854a                	mv	a0,s2
    3cae:	00001097          	auipc	ra,0x1
    3cb2:	a90080e7          	jalr	-1392(ra) # 473e <strchr>
    3cb6:	fd45                	bnez	a0,3c6e <createdelete+0xf6>
            if(remove(name) < 0){
    3cb8:	8552                	mv	a0,s4
    3cba:	00001097          	auipc	ra,0x1
    3cbe:	d38080e7          	jalr	-712(ra) # 49f2 <remove>
    3cc2:	fa0556e3          	bgez	a0,3c6e <createdelete+0xf6>
              printf("%s: remove failed\n", s);
    3cc6:	85ee                	mv	a1,s11
    3cc8:	00002517          	auipc	a0,0x2
    3ccc:	5a850513          	addi	a0,a0,1448 # 6270 <malloc+0x14c0>
    3cd0:	00001097          	auipc	ra,0x1
    3cd4:	020080e7          	jalr	32(ra) # 4cf0 <printf>
              exit(1);
    3cd8:	4505                	li	a0,1
    3cda:	00001097          	auipc	ra,0x1
    3cde:	c70080e7          	jalr	-912(ra) # 494a <exit>
      exit(0);
    3ce2:	4501                	li	a0,0
    3ce4:	00001097          	auipc	ra,0x1
    3ce8:	c66080e7          	jalr	-922(ra) # 494a <exit>
      exit(1);
    3cec:	4505                	li	a0,1
    3cee:	00001097          	auipc	ra,0x1
    3cf2:	c5c080e7          	jalr	-932(ra) # 494a <exit>
        printf("%s: oops createdelete %s didn't exist\n", s, name);
    3cf6:	f7040613          	addi	a2,s0,-144
    3cfa:	85ee                	mv	a1,s11
    3cfc:	00003517          	auipc	a0,0x3
    3d00:	86450513          	addi	a0,a0,-1948 # 6560 <malloc+0x17b0>
    3d04:	00001097          	auipc	ra,0x1
    3d08:	fec080e7          	jalr	-20(ra) # 4cf0 <printf>
        exit(1);
    3d0c:	4505                	li	a0,1
    3d0e:	00001097          	auipc	ra,0x1
    3d12:	c3c080e7          	jalr	-964(ra) # 494a <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d16:	056c7763          	bleu	s6,s8,3d64 <createdelete+0x1ec>
      if(fd >= 0)
    3d1a:	04055063          	bgez	a0,3d5a <createdelete+0x1e2>
    for(pi = 0; pi < NCHILD; pi++){
    3d1e:	2485                	addiw	s1,s1,1
    3d20:	0ff4f493          	andi	s1,s1,255
    3d24:	07448263          	beq	s1,s4,3d88 <createdelete+0x210>
      name[0] = 'p' + pi;
    3d28:	f6940823          	sb	s1,-144(s0)
      name[1] = '0' + i;
    3d2c:	f72408a3          	sb	s2,-143(s0)
      if (strchr(illegal, name[1]) != 0) { continue; }
    3d30:	85ca                	mv	a1,s2
    3d32:	8556                	mv	a0,s5
    3d34:	00001097          	auipc	ra,0x1
    3d38:	a0a080e7          	jalr	-1526(ra) # 473e <strchr>
    3d3c:	f16d                	bnez	a0,3d1e <createdelete+0x1a6>
      fd = open(name, 0);
    3d3e:	4581                	li	a1,0
    3d40:	855e                	mv	a0,s7
    3d42:	00001097          	auipc	ra,0x1
    3d46:	c48080e7          	jalr	-952(ra) # 498a <open>
      if((i == 0 || i >= N/2) && fd < 0){
    3d4a:	00098463          	beqz	s3,3d52 <createdelete+0x1da>
    3d4e:	fd3d54e3          	ble	s3,s10,3d16 <createdelete+0x19e>
    3d52:	fa0542e3          	bltz	a0,3cf6 <createdelete+0x17e>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d56:	016c7963          	bleu	s6,s8,3d68 <createdelete+0x1f0>
        close(fd);
    3d5a:	00001097          	auipc	ra,0x1
    3d5e:	c18080e7          	jalr	-1000(ra) # 4972 <close>
    3d62:	bf75                	j	3d1e <createdelete+0x1a6>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d64:	fa054de3          	bltz	a0,3d1e <createdelete+0x1a6>
        printf("%s: oops createdelete %s did exist\n", s, name);
    3d68:	f7040613          	addi	a2,s0,-144
    3d6c:	85ee                	mv	a1,s11
    3d6e:	00003517          	auipc	a0,0x3
    3d72:	81a50513          	addi	a0,a0,-2022 # 6588 <malloc+0x17d8>
    3d76:	00001097          	auipc	ra,0x1
    3d7a:	f7a080e7          	jalr	-134(ra) # 4cf0 <printf>
        exit(1);
    3d7e:	4505                	li	a0,1
    3d80:	00001097          	auipc	ra,0x1
    3d84:	bca080e7          	jalr	-1078(ra) # 494a <exit>
  for(i = 0; i < N; i++){
    3d88:	2985                	addiw	s3,s3,1
    3d8a:	2905                	addiw	s2,s2,1
    3d8c:	0ff97913          	andi	s2,s2,255
    3d90:	47d1                	li	a5,20
    3d92:	02f98d63          	beq	s3,a5,3dcc <createdelete+0x254>
    for(pi = 0; pi < NCHILD; pi++){
    3d96:	84e6                	mv	s1,s9
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d98:	fff98b1b          	addiw	s6,s3,-1
    for(pi = 0; pi < NCHILD; pi++){
    3d9c:	07400a13          	li	s4,116
    3da0:	b761                	j	3d28 <createdelete+0x1b0>
  for(i = 0; i < N; i++){
    3da2:	2905                	addiw	s2,s2,1
    3da4:	0ff97913          	andi	s2,s2,255
    3da8:	03590d63          	beq	s2,s5,3de2 <createdelete+0x26a>
  name[0] = name[1] = name[2] = 0;
    3dac:	84da                	mv	s1,s6
      name[0] = 'p' + pi;
    3dae:	f6940823          	sb	s1,-144(s0)
      name[1] = '0' + i;
    3db2:	f72408a3          	sb	s2,-143(s0)
      remove(name);
    3db6:	8552                	mv	a0,s4
    3db8:	00001097          	auipc	ra,0x1
    3dbc:	c3a080e7          	jalr	-966(ra) # 49f2 <remove>
    for(pi = 0; pi < NCHILD; pi++){
    3dc0:	2485                	addiw	s1,s1,1
    3dc2:	0ff4f493          	andi	s1,s1,255
    3dc6:	ff3494e3          	bne	s1,s3,3dae <createdelete+0x236>
    3dca:	bfe1                	j	3da2 <createdelete+0x22a>
    3dcc:	03000913          	li	s2,48
  name[0] = name[1] = name[2] = 0;
    3dd0:	07000b13          	li	s6,112
      remove(name);
    3dd4:	f7040a13          	addi	s4,s0,-144
    for(pi = 0; pi < NCHILD; pi++){
    3dd8:	07400993          	li	s3,116
  for(i = 0; i < N; i++){
    3ddc:	04400a93          	li	s5,68
    3de0:	b7f1                	j	3dac <createdelete+0x234>
}
    3de2:	70aa                	ld	ra,168(sp)
    3de4:	740a                	ld	s0,160(sp)
    3de6:	64ea                	ld	s1,152(sp)
    3de8:	694a                	ld	s2,144(sp)
    3dea:	69aa                	ld	s3,136(sp)
    3dec:	6a0a                	ld	s4,128(sp)
    3dee:	7ae6                	ld	s5,120(sp)
    3df0:	7b46                	ld	s6,112(sp)
    3df2:	7ba6                	ld	s7,104(sp)
    3df4:	7c06                	ld	s8,96(sp)
    3df6:	6ce6                	ld	s9,88(sp)
    3df8:	6d46                	ld	s10,80(sp)
    3dfa:	6da6                	ld	s11,72(sp)
    3dfc:	614d                	addi	sp,sp,176
    3dfe:	8082                	ret

0000000000003e00 <dirtest>:
{
    3e00:	1101                	addi	sp,sp,-32
    3e02:	ec06                	sd	ra,24(sp)
    3e04:	e822                	sd	s0,16(sp)
    3e06:	e426                	sd	s1,8(sp)
    3e08:	1000                	addi	s0,sp,32
    3e0a:	84aa                	mv	s1,a0
  printf("mkdir test\n");
    3e0c:	00002517          	auipc	a0,0x2
    3e10:	7a450513          	addi	a0,a0,1956 # 65b0 <malloc+0x1800>
    3e14:	00001097          	auipc	ra,0x1
    3e18:	edc080e7          	jalr	-292(ra) # 4cf0 <printf>
  if(mkdir("dir0") < 0){
    3e1c:	00002517          	auipc	a0,0x2
    3e20:	7a450513          	addi	a0,a0,1956 # 65c0 <malloc+0x1810>
    3e24:	00001097          	auipc	ra,0x1
    3e28:	b76080e7          	jalr	-1162(ra) # 499a <mkdir>
    3e2c:	04054d63          	bltz	a0,3e86 <dirtest+0x86>
  if(chdir("dir0") < 0){
    3e30:	00002517          	auipc	a0,0x2
    3e34:	79050513          	addi	a0,a0,1936 # 65c0 <malloc+0x1810>
    3e38:	00001097          	auipc	ra,0x1
    3e3c:	b6a080e7          	jalr	-1174(ra) # 49a2 <chdir>
    3e40:	06054163          	bltz	a0,3ea2 <dirtest+0xa2>
  if(chdir("..") < 0){
    3e44:	00002517          	auipc	a0,0x2
    3e48:	1ec50513          	addi	a0,a0,492 # 6030 <malloc+0x1280>
    3e4c:	00001097          	auipc	ra,0x1
    3e50:	b56080e7          	jalr	-1194(ra) # 49a2 <chdir>
    3e54:	06054563          	bltz	a0,3ebe <dirtest+0xbe>
  if(remove("dir0") < 0){
    3e58:	00002517          	auipc	a0,0x2
    3e5c:	76850513          	addi	a0,a0,1896 # 65c0 <malloc+0x1810>
    3e60:	00001097          	auipc	ra,0x1
    3e64:	b92080e7          	jalr	-1134(ra) # 49f2 <remove>
    3e68:	06054963          	bltz	a0,3eda <dirtest+0xda>
  printf("%s: mkdir test ok\n");
    3e6c:	00002517          	auipc	a0,0x2
    3e70:	7a450513          	addi	a0,a0,1956 # 6610 <malloc+0x1860>
    3e74:	00001097          	auipc	ra,0x1
    3e78:	e7c080e7          	jalr	-388(ra) # 4cf0 <printf>
}
    3e7c:	60e2                	ld	ra,24(sp)
    3e7e:	6442                	ld	s0,16(sp)
    3e80:	64a2                	ld	s1,8(sp)
    3e82:	6105                	addi	sp,sp,32
    3e84:	8082                	ret
    printf("%s: mkdir failed\n", s);
    3e86:	85a6                	mv	a1,s1
    3e88:	00002517          	auipc	a0,0x2
    3e8c:	d2850513          	addi	a0,a0,-728 # 5bb0 <malloc+0xe00>
    3e90:	00001097          	auipc	ra,0x1
    3e94:	e60080e7          	jalr	-416(ra) # 4cf0 <printf>
    exit(1);
    3e98:	4505                	li	a0,1
    3e9a:	00001097          	auipc	ra,0x1
    3e9e:	ab0080e7          	jalr	-1360(ra) # 494a <exit>
    printf("%s: chdir dir0 failed\n", s);
    3ea2:	85a6                	mv	a1,s1
    3ea4:	00002517          	auipc	a0,0x2
    3ea8:	72450513          	addi	a0,a0,1828 # 65c8 <malloc+0x1818>
    3eac:	00001097          	auipc	ra,0x1
    3eb0:	e44080e7          	jalr	-444(ra) # 4cf0 <printf>
    exit(1);
    3eb4:	4505                	li	a0,1
    3eb6:	00001097          	auipc	ra,0x1
    3eba:	a94080e7          	jalr	-1388(ra) # 494a <exit>
    printf("%s: chdir .. failed\n", s);
    3ebe:	85a6                	mv	a1,s1
    3ec0:	00002517          	auipc	a0,0x2
    3ec4:	72050513          	addi	a0,a0,1824 # 65e0 <malloc+0x1830>
    3ec8:	00001097          	auipc	ra,0x1
    3ecc:	e28080e7          	jalr	-472(ra) # 4cf0 <printf>
    exit(1);
    3ed0:	4505                	li	a0,1
    3ed2:	00001097          	auipc	ra,0x1
    3ed6:	a78080e7          	jalr	-1416(ra) # 494a <exit>
    printf("%s: remove dir0 failed\n", s);
    3eda:	85a6                	mv	a1,s1
    3edc:	00002517          	auipc	a0,0x2
    3ee0:	71c50513          	addi	a0,a0,1820 # 65f8 <malloc+0x1848>
    3ee4:	00001097          	auipc	ra,0x1
    3ee8:	e0c080e7          	jalr	-500(ra) # 4cf0 <printf>
    exit(1);
    3eec:	4505                	li	a0,1
    3eee:	00001097          	auipc	ra,0x1
    3ef2:	a5c080e7          	jalr	-1444(ra) # 494a <exit>

0000000000003ef6 <fourteen>:
{
    3ef6:	1101                	addi	sp,sp,-32
    3ef8:	ec06                	sd	ra,24(sp)
    3efa:	e822                	sd	s0,16(sp)
    3efc:	e426                	sd	s1,8(sp)
    3efe:	1000                	addi	s0,sp,32
    3f00:	84aa                	mv	s1,a0
  if(mkdir("12345678901234") != 0){
    3f02:	00003517          	auipc	a0,0x3
    3f06:	8f650513          	addi	a0,a0,-1802 # 67f8 <malloc+0x1a48>
    3f0a:	00001097          	auipc	ra,0x1
    3f0e:	a90080e7          	jalr	-1392(ra) # 499a <mkdir>
    3f12:	e165                	bnez	a0,3ff2 <fourteen+0xfc>
  if(mkdir("12345678901234/123456789012345") != 0){
    3f14:	00002517          	auipc	a0,0x2
    3f18:	73c50513          	addi	a0,a0,1852 # 6650 <malloc+0x18a0>
    3f1c:	00001097          	auipc	ra,0x1
    3f20:	a7e080e7          	jalr	-1410(ra) # 499a <mkdir>
    3f24:	e56d                	bnez	a0,400e <fourteen+0x118>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    3f26:	20000593          	li	a1,512
    3f2a:	00002517          	auipc	a0,0x2
    3f2e:	77e50513          	addi	a0,a0,1918 # 66a8 <malloc+0x18f8>
    3f32:	00001097          	auipc	ra,0x1
    3f36:	a58080e7          	jalr	-1448(ra) # 498a <open>
  if(fd < 0){
    3f3a:	0e054863          	bltz	a0,402a <fourteen+0x134>
  close(fd);
    3f3e:	00001097          	auipc	ra,0x1
    3f42:	a34080e7          	jalr	-1484(ra) # 4972 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    3f46:	4581                	li	a1,0
    3f48:	00002517          	auipc	a0,0x2
    3f4c:	7d850513          	addi	a0,a0,2008 # 6720 <malloc+0x1970>
    3f50:	00001097          	auipc	ra,0x1
    3f54:	a3a080e7          	jalr	-1478(ra) # 498a <open>
  if(fd < 0){
    3f58:	0e054763          	bltz	a0,4046 <fourteen+0x150>
  close(fd);
    3f5c:	00001097          	auipc	ra,0x1
    3f60:	a16080e7          	jalr	-1514(ra) # 4972 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    3f64:	00003517          	auipc	a0,0x3
    3f68:	82c50513          	addi	a0,a0,-2004 # 6790 <malloc+0x19e0>
    3f6c:	00001097          	auipc	ra,0x1
    3f70:	a2e080e7          	jalr	-1490(ra) # 499a <mkdir>
    3f74:	c57d                	beqz	a0,4062 <fourteen+0x16c>
  if(mkdir("123456789012345/12345678901234") == 0){
    3f76:	00003517          	auipc	a0,0x3
    3f7a:	87250513          	addi	a0,a0,-1934 # 67e8 <malloc+0x1a38>
    3f7e:	00001097          	auipc	ra,0x1
    3f82:	a1c080e7          	jalr	-1508(ra) # 499a <mkdir>
    3f86:	cd65                	beqz	a0,407e <fourteen+0x188>
  remove("123456789012345/12345678901234");
    3f88:	00003517          	auipc	a0,0x3
    3f8c:	86050513          	addi	a0,a0,-1952 # 67e8 <malloc+0x1a38>
    3f90:	00001097          	auipc	ra,0x1
    3f94:	a62080e7          	jalr	-1438(ra) # 49f2 <remove>
  remove("12345678901234/12345678901234");
    3f98:	00002517          	auipc	a0,0x2
    3f9c:	7f850513          	addi	a0,a0,2040 # 6790 <malloc+0x19e0>
    3fa0:	00001097          	auipc	ra,0x1
    3fa4:	a52080e7          	jalr	-1454(ra) # 49f2 <remove>
  remove("12345678901234/12345678901234/12345678901234");
    3fa8:	00002517          	auipc	a0,0x2
    3fac:	77850513          	addi	a0,a0,1912 # 6720 <malloc+0x1970>
    3fb0:	00001097          	auipc	ra,0x1
    3fb4:	a42080e7          	jalr	-1470(ra) # 49f2 <remove>
  remove("123456789012345/123456789012345/123456789012345");
    3fb8:	00002517          	auipc	a0,0x2
    3fbc:	6f050513          	addi	a0,a0,1776 # 66a8 <malloc+0x18f8>
    3fc0:	00001097          	auipc	ra,0x1
    3fc4:	a32080e7          	jalr	-1486(ra) # 49f2 <remove>
  remove("12345678901234/123456789012345");
    3fc8:	00002517          	auipc	a0,0x2
    3fcc:	68850513          	addi	a0,a0,1672 # 6650 <malloc+0x18a0>
    3fd0:	00001097          	auipc	ra,0x1
    3fd4:	a22080e7          	jalr	-1502(ra) # 49f2 <remove>
  remove("12345678901234");
    3fd8:	00003517          	auipc	a0,0x3
    3fdc:	82050513          	addi	a0,a0,-2016 # 67f8 <malloc+0x1a48>
    3fe0:	00001097          	auipc	ra,0x1
    3fe4:	a12080e7          	jalr	-1518(ra) # 49f2 <remove>
}
    3fe8:	60e2                	ld	ra,24(sp)
    3fea:	6442                	ld	s0,16(sp)
    3fec:	64a2                	ld	s1,8(sp)
    3fee:	6105                	addi	sp,sp,32
    3ff0:	8082                	ret
    printf("%s: mkdir 12345678901234 failed\n", s);
    3ff2:	85a6                	mv	a1,s1
    3ff4:	00002517          	auipc	a0,0x2
    3ff8:	63450513          	addi	a0,a0,1588 # 6628 <malloc+0x1878>
    3ffc:	00001097          	auipc	ra,0x1
    4000:	cf4080e7          	jalr	-780(ra) # 4cf0 <printf>
    exit(1);
    4004:	4505                	li	a0,1
    4006:	00001097          	auipc	ra,0x1
    400a:	944080e7          	jalr	-1724(ra) # 494a <exit>
    printf("%s: mkdir 12345678901234/123456789012345 failed\n", s);
    400e:	85a6                	mv	a1,s1
    4010:	00002517          	auipc	a0,0x2
    4014:	66050513          	addi	a0,a0,1632 # 6670 <malloc+0x18c0>
    4018:	00001097          	auipc	ra,0x1
    401c:	cd8080e7          	jalr	-808(ra) # 4cf0 <printf>
    exit(1);
    4020:	4505                	li	a0,1
    4022:	00001097          	auipc	ra,0x1
    4026:	928080e7          	jalr	-1752(ra) # 494a <exit>
    printf("%s: create 123456789012345/123456789012345/123456789012345 failed\n", s);
    402a:	85a6                	mv	a1,s1
    402c:	00002517          	auipc	a0,0x2
    4030:	6ac50513          	addi	a0,a0,1708 # 66d8 <malloc+0x1928>
    4034:	00001097          	auipc	ra,0x1
    4038:	cbc080e7          	jalr	-836(ra) # 4cf0 <printf>
    exit(1);
    403c:	4505                	li	a0,1
    403e:	00001097          	auipc	ra,0x1
    4042:	90c080e7          	jalr	-1780(ra) # 494a <exit>
    printf("%s: open 12345678901234/12345678901234/12345678901234 failed\n", s);
    4046:	85a6                	mv	a1,s1
    4048:	00002517          	auipc	a0,0x2
    404c:	70850513          	addi	a0,a0,1800 # 6750 <malloc+0x19a0>
    4050:	00001097          	auipc	ra,0x1
    4054:	ca0080e7          	jalr	-864(ra) # 4cf0 <printf>
    exit(1);
    4058:	4505                	li	a0,1
    405a:	00001097          	auipc	ra,0x1
    405e:	8f0080e7          	jalr	-1808(ra) # 494a <exit>
    printf("%s: mkdir 12345678901234/12345678901234 succeeded!\n", s);
    4062:	85a6                	mv	a1,s1
    4064:	00002517          	auipc	a0,0x2
    4068:	74c50513          	addi	a0,a0,1868 # 67b0 <malloc+0x1a00>
    406c:	00001097          	auipc	ra,0x1
    4070:	c84080e7          	jalr	-892(ra) # 4cf0 <printf>
    exit(1);
    4074:	4505                	li	a0,1
    4076:	00001097          	auipc	ra,0x1
    407a:	8d4080e7          	jalr	-1836(ra) # 494a <exit>
    printf("%s: mkdir 12345678901234/123456789012345 succeeded!\n", s);
    407e:	85a6                	mv	a1,s1
    4080:	00002517          	auipc	a0,0x2
    4084:	78850513          	addi	a0,a0,1928 # 6808 <malloc+0x1a58>
    4088:	00001097          	auipc	ra,0x1
    408c:	c68080e7          	jalr	-920(ra) # 4cf0 <printf>
    exit(1);
    4090:	4505                	li	a0,1
    4092:	00001097          	auipc	ra,0x1
    4096:	8b8080e7          	jalr	-1864(ra) # 494a <exit>

000000000000409a <fsfull>:
{
    409a:	7171                	addi	sp,sp,-176
    409c:	f506                	sd	ra,168(sp)
    409e:	f122                	sd	s0,160(sp)
    40a0:	ed26                	sd	s1,152(sp)
    40a2:	e94a                	sd	s2,144(sp)
    40a4:	e54e                	sd	s3,136(sp)
    40a6:	e152                	sd	s4,128(sp)
    40a8:	fcd6                	sd	s5,120(sp)
    40aa:	f8da                	sd	s6,112(sp)
    40ac:	f4de                	sd	s7,104(sp)
    40ae:	f0e2                	sd	s8,96(sp)
    40b0:	ece6                	sd	s9,88(sp)
    40b2:	e8ea                	sd	s10,80(sp)
    40b4:	e4ee                	sd	s11,72(sp)
    40b6:	1900                	addi	s0,sp,176
  printf("fsfull test\n");
    40b8:	00002517          	auipc	a0,0x2
    40bc:	78850513          	addi	a0,a0,1928 # 6840 <malloc+0x1a90>
    40c0:	00001097          	auipc	ra,0x1
    40c4:	c30080e7          	jalr	-976(ra) # 4cf0 <printf>
  for(nfiles = 0; ; nfiles++){
    40c8:	4481                	li	s1,0
    name[0] = 'f';
    40ca:	06600d93          	li	s11,102
    name[1] = '0' + nfiles / 1000;
    40ce:	3e800c93          	li	s9,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    40d2:	06400c13          	li	s8,100
    name[3] = '0' + (nfiles % 100) / 10;
    40d6:	4ba9                	li	s7,10
    printf("%s: writing %s\n", name);
    40d8:	f5040b13          	addi	s6,s0,-176
    40dc:	00002d17          	auipc	s10,0x2
    40e0:	774d0d13          	addi	s10,s10,1908 # 6850 <malloc+0x1aa0>
      int cc = write(fd, buf, BSIZE);
    40e4:	00006a17          	auipc	s4,0x6
    40e8:	784a0a13          	addi	s4,s4,1924 # a868 <buf>
    name[0] = 'f';
    40ec:	f5b40823          	sb	s11,-176(s0)
    name[1] = '0' + nfiles / 1000;
    40f0:	0394c7bb          	divw	a5,s1,s9
    40f4:	0307879b          	addiw	a5,a5,48
    40f8:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    40fc:	0394e7bb          	remw	a5,s1,s9
    4100:	0387c7bb          	divw	a5,a5,s8
    4104:	0307879b          	addiw	a5,a5,48
    4108:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    410c:	0384e7bb          	remw	a5,s1,s8
    4110:	0377c7bb          	divw	a5,a5,s7
    4114:	0307879b          	addiw	a5,a5,48
    4118:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    411c:	0374e7bb          	remw	a5,s1,s7
    4120:	0307879b          	addiw	a5,a5,48
    4124:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    4128:	f4040aa3          	sb	zero,-171(s0)
    printf("%s: writing %s\n", name);
    412c:	85da                	mv	a1,s6
    412e:	856a                	mv	a0,s10
    4130:	00001097          	auipc	ra,0x1
    4134:	bc0080e7          	jalr	-1088(ra) # 4cf0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    4138:	20200593          	li	a1,514
    413c:	855a                	mv	a0,s6
    413e:	00001097          	auipc	ra,0x1
    4142:	84c080e7          	jalr	-1972(ra) # 498a <open>
    4146:	89aa                	mv	s3,a0
    if(fd < 0){
    4148:	0a055763          	bgez	a0,41f6 <fsfull+0x15c>
      printf("%s: open %s failed\n", name);
    414c:	f5040593          	addi	a1,s0,-176
    4150:	00002517          	auipc	a0,0x2
    4154:	71050513          	addi	a0,a0,1808 # 6860 <malloc+0x1ab0>
    4158:	00001097          	auipc	ra,0x1
    415c:	b98080e7          	jalr	-1128(ra) # 4cf0 <printf>
  while(nfiles >= 0){
    4160:	0604c463          	bltz	s1,41c8 <fsfull+0x12e>
    name[0] = 'f';
    4164:	06600b93          	li	s7,102
    name[1] = '0' + nfiles / 1000;
    4168:	3e800a13          	li	s4,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    416c:	06400993          	li	s3,100
    name[3] = '0' + (nfiles % 100) / 10;
    4170:	4929                	li	s2,10
    remove(name);
    4172:	f5040b13          	addi	s6,s0,-176
  while(nfiles >= 0){
    4176:	5afd                	li	s5,-1
    name[0] = 'f';
    4178:	f5740823          	sb	s7,-176(s0)
    name[1] = '0' + nfiles / 1000;
    417c:	0344c7bb          	divw	a5,s1,s4
    4180:	0307879b          	addiw	a5,a5,48
    4184:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    4188:	0344e7bb          	remw	a5,s1,s4
    418c:	0337c7bb          	divw	a5,a5,s3
    4190:	0307879b          	addiw	a5,a5,48
    4194:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    4198:	0334e7bb          	remw	a5,s1,s3
    419c:	0327c7bb          	divw	a5,a5,s2
    41a0:	0307879b          	addiw	a5,a5,48
    41a4:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    41a8:	0324e7bb          	remw	a5,s1,s2
    41ac:	0307879b          	addiw	a5,a5,48
    41b0:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    41b4:	f4040aa3          	sb	zero,-171(s0)
    remove(name);
    41b8:	855a                	mv	a0,s6
    41ba:	00001097          	auipc	ra,0x1
    41be:	838080e7          	jalr	-1992(ra) # 49f2 <remove>
    nfiles--;
    41c2:	34fd                	addiw	s1,s1,-1
  while(nfiles >= 0){
    41c4:	fb549ae3          	bne	s1,s5,4178 <fsfull+0xde>
  printf("fsfull test finished\n");
    41c8:	00002517          	auipc	a0,0x2
    41cc:	6c850513          	addi	a0,a0,1736 # 6890 <malloc+0x1ae0>
    41d0:	00001097          	auipc	ra,0x1
    41d4:	b20080e7          	jalr	-1248(ra) # 4cf0 <printf>
}
    41d8:	70aa                	ld	ra,168(sp)
    41da:	740a                	ld	s0,160(sp)
    41dc:	64ea                	ld	s1,152(sp)
    41de:	694a                	ld	s2,144(sp)
    41e0:	69aa                	ld	s3,136(sp)
    41e2:	6a0a                	ld	s4,128(sp)
    41e4:	7ae6                	ld	s5,120(sp)
    41e6:	7b46                	ld	s6,112(sp)
    41e8:	7ba6                	ld	s7,104(sp)
    41ea:	7c06                	ld	s8,96(sp)
    41ec:	6ce6                	ld	s9,88(sp)
    41ee:	6d46                	ld	s10,80(sp)
    41f0:	6da6                	ld	s11,72(sp)
    41f2:	614d                	addi	sp,sp,176
    41f4:	8082                	ret
    int total = 0;
    41f6:	4901                	li	s2,0
      if(cc < BSIZE)
    41f8:	1ff00a93          	li	s5,511
      int cc = write(fd, buf, BSIZE);
    41fc:	20000613          	li	a2,512
    4200:	85d2                	mv	a1,s4
    4202:	854e                	mv	a0,s3
    4204:	00000097          	auipc	ra,0x0
    4208:	766080e7          	jalr	1894(ra) # 496a <write>
      if(cc < BSIZE)
    420c:	00aad563          	ble	a0,s5,4216 <fsfull+0x17c>
      total += cc;
    4210:	00a9093b          	addw	s2,s2,a0
    while(1){
    4214:	b7e5                	j	41fc <fsfull+0x162>
    printf("%s: wrote %d bytes\n", total);
    4216:	85ca                	mv	a1,s2
    4218:	00002517          	auipc	a0,0x2
    421c:	66050513          	addi	a0,a0,1632 # 6878 <malloc+0x1ac8>
    4220:	00001097          	auipc	ra,0x1
    4224:	ad0080e7          	jalr	-1328(ra) # 4cf0 <printf>
    close(fd);
    4228:	854e                	mv	a0,s3
    422a:	00000097          	auipc	ra,0x0
    422e:	748080e7          	jalr	1864(ra) # 4972 <close>
    if(total == 0)
    4232:	f20907e3          	beqz	s2,4160 <fsfull+0xc6>
  for(nfiles = 0; ; nfiles++){
    4236:	2485                	addiw	s1,s1,1
    4238:	bd55                	j	40ec <fsfull+0x52>

000000000000423a <rand>:
{
    423a:	1141                	addi	sp,sp,-16
    423c:	e422                	sd	s0,8(sp)
    423e:	0800                	addi	s0,sp,16
  randstate = randstate * 1664525 + 1013904223;
    4240:	00003717          	auipc	a4,0x3
    4244:	aa070713          	addi	a4,a4,-1376 # 6ce0 <digits+0x20>
    4248:	7308                	ld	a0,32(a4)
    424a:	001967b7          	lui	a5,0x196
    424e:	60d78793          	addi	a5,a5,1549 # 19660d <_end+0x18a58d>
    4252:	02f50533          	mul	a0,a0,a5
    4256:	3c6ef7b7          	lui	a5,0x3c6ef
    425a:	35f78793          	addi	a5,a5,863 # 3c6ef35f <_end+0x3c6e32df>
    425e:	953e                	add	a0,a0,a5
    4260:	f308                	sd	a0,32(a4)
}
    4262:	2501                	sext.w	a0,a0
    4264:	6422                	ld	s0,8(sp)
    4266:	0141                	addi	sp,sp,16
    4268:	8082                	ret

000000000000426a <countfree>:
// because out of memory with lazy allocation results in the process
// taking a fault and being killed, fork and report back.
//
int
countfree()
{
    426a:	7139                	addi	sp,sp,-64
    426c:	fc06                	sd	ra,56(sp)
    426e:	f822                	sd	s0,48(sp)
    4270:	f426                	sd	s1,40(sp)
    4272:	f04a                	sd	s2,32(sp)
    4274:	ec4e                	sd	s3,24(sp)
    4276:	0080                	addi	s0,sp,64
  int fds[2];

  if(pipe(fds) < 0){
    4278:	fc840513          	addi	a0,s0,-56
    427c:	00000097          	auipc	ra,0x0
    4280:	6de080e7          	jalr	1758(ra) # 495a <pipe>
    4284:	06054863          	bltz	a0,42f4 <countfree+0x8a>
    printf("pipe() failed in countfree()\n");
    exit(1);
  }
  
  int pid = fork();
    4288:	00000097          	auipc	ra,0x0
    428c:	6ba080e7          	jalr	1722(ra) # 4942 <fork>

  if(pid < 0){
    4290:	06054f63          	bltz	a0,430e <countfree+0xa4>
    printf("fork failed in countfree()\n");
    exit(1);
  }

  if(pid == 0){
    4294:	ed59                	bnez	a0,4332 <countfree+0xc8>
    close(fds[0]);
    4296:	fc842503          	lw	a0,-56(s0)
    429a:	00000097          	auipc	ra,0x0
    429e:	6d8080e7          	jalr	1752(ra) # 4972 <close>
    
    while(1){
      uint64 a = (uint64) sbrk(4096);
      if(a == 0xffffffffffffffff){
    42a2:	54fd                	li	s1,-1
        break;
      }

      // modify the memory to make sure it's really allocated.
      *(char *)(a + 4096 - 1) = 1;
    42a4:	4985                	li	s3,1

      // report back one more page.
      if(write(fds[1], "x", 1) != 1){
    42a6:	00001917          	auipc	s2,0x1
    42aa:	cea90913          	addi	s2,s2,-790 # 4f90 <malloc+0x1e0>
      uint64 a = (uint64) sbrk(4096);
    42ae:	6505                	lui	a0,0x1
    42b0:	00000097          	auipc	ra,0x0
    42b4:	70a080e7          	jalr	1802(ra) # 49ba <sbrk>
      if(a == 0xffffffffffffffff){
    42b8:	06950863          	beq	a0,s1,4328 <countfree+0xbe>
      *(char *)(a + 4096 - 1) = 1;
    42bc:	6785                	lui	a5,0x1
    42be:	97aa                	add	a5,a5,a0
    42c0:	ff378fa3          	sb	s3,-1(a5) # fff <copyinstr2+0xb7>
      if(write(fds[1], "x", 1) != 1){
    42c4:	4605                	li	a2,1
    42c6:	85ca                	mv	a1,s2
    42c8:	fcc42503          	lw	a0,-52(s0)
    42cc:	00000097          	auipc	ra,0x0
    42d0:	69e080e7          	jalr	1694(ra) # 496a <write>
    42d4:	4785                	li	a5,1
    42d6:	fcf50ce3          	beq	a0,a5,42ae <countfree+0x44>
        printf("write() failed in countfree()\n");
    42da:	00002517          	auipc	a0,0x2
    42de:	60e50513          	addi	a0,a0,1550 # 68e8 <malloc+0x1b38>
    42e2:	00001097          	auipc	ra,0x1
    42e6:	a0e080e7          	jalr	-1522(ra) # 4cf0 <printf>
        exit(1);
    42ea:	4505                	li	a0,1
    42ec:	00000097          	auipc	ra,0x0
    42f0:	65e080e7          	jalr	1630(ra) # 494a <exit>
    printf("pipe() failed in countfree()\n");
    42f4:	00002517          	auipc	a0,0x2
    42f8:	5b450513          	addi	a0,a0,1460 # 68a8 <malloc+0x1af8>
    42fc:	00001097          	auipc	ra,0x1
    4300:	9f4080e7          	jalr	-1548(ra) # 4cf0 <printf>
    exit(1);
    4304:	4505                	li	a0,1
    4306:	00000097          	auipc	ra,0x0
    430a:	644080e7          	jalr	1604(ra) # 494a <exit>
    printf("fork failed in countfree()\n");
    430e:	00002517          	auipc	a0,0x2
    4312:	5ba50513          	addi	a0,a0,1466 # 68c8 <malloc+0x1b18>
    4316:	00001097          	auipc	ra,0x1
    431a:	9da080e7          	jalr	-1574(ra) # 4cf0 <printf>
    exit(1);
    431e:	4505                	li	a0,1
    4320:	00000097          	auipc	ra,0x0
    4324:	62a080e7          	jalr	1578(ra) # 494a <exit>
      }
    }

    exit(0);
    4328:	4501                	li	a0,0
    432a:	00000097          	auipc	ra,0x0
    432e:	620080e7          	jalr	1568(ra) # 494a <exit>
  }

  close(fds[1]);
    4332:	fcc42503          	lw	a0,-52(s0)
    4336:	00000097          	auipc	ra,0x0
    433a:	63c080e7          	jalr	1596(ra) # 4972 <close>

  int n = 0;
    433e:	4481                	li	s1,0
  while(1){
    char c;
    int cc = read(fds[0], &c, 1);
    4340:	fc740913          	addi	s2,s0,-57
    4344:	a839                	j	4362 <countfree+0xf8>
    if(cc < 0){
      printf("read() failed in countfree()\n");
    4346:	00002517          	auipc	a0,0x2
    434a:	5c250513          	addi	a0,a0,1474 # 6908 <malloc+0x1b58>
    434e:	00001097          	auipc	ra,0x1
    4352:	9a2080e7          	jalr	-1630(ra) # 4cf0 <printf>
      exit(1);
    4356:	4505                	li	a0,1
    4358:	00000097          	auipc	ra,0x0
    435c:	5f2080e7          	jalr	1522(ra) # 494a <exit>
    }
    if(cc == 0)
      break;
    n += 1;
    4360:	2485                	addiw	s1,s1,1
    int cc = read(fds[0], &c, 1);
    4362:	4605                	li	a2,1
    4364:	85ca                	mv	a1,s2
    4366:	fc842503          	lw	a0,-56(s0)
    436a:	00000097          	auipc	ra,0x0
    436e:	5f8080e7          	jalr	1528(ra) # 4962 <read>
    if(cc < 0){
    4372:	fc054ae3          	bltz	a0,4346 <countfree+0xdc>
    if(cc == 0)
    4376:	f56d                	bnez	a0,4360 <countfree+0xf6>
  }

  close(fds[0]);
    4378:	fc842503          	lw	a0,-56(s0)
    437c:	00000097          	auipc	ra,0x0
    4380:	5f6080e7          	jalr	1526(ra) # 4972 <close>
  wait((int*)0);
    4384:	4501                	li	a0,0
    4386:	00000097          	auipc	ra,0x0
    438a:	5cc080e7          	jalr	1484(ra) # 4952 <wait>
  
  return n;
}
    438e:	8526                	mv	a0,s1
    4390:	70e2                	ld	ra,56(sp)
    4392:	7442                	ld	s0,48(sp)
    4394:	74a2                	ld	s1,40(sp)
    4396:	7902                	ld	s2,32(sp)
    4398:	69e2                	ld	s3,24(sp)
    439a:	6121                	addi	sp,sp,64
    439c:	8082                	ret

000000000000439e <run>:

// run each test in its own process. run returns 1 if child's exit()
// indicates success.
int
run(void f(char *), char *s) {
    439e:	7179                	addi	sp,sp,-48
    43a0:	f406                	sd	ra,40(sp)
    43a2:	f022                	sd	s0,32(sp)
    43a4:	ec26                	sd	s1,24(sp)
    43a6:	e84a                	sd	s2,16(sp)
    43a8:	1800                	addi	s0,sp,48
    43aa:	84aa                	mv	s1,a0
    43ac:	892e                	mv	s2,a1
  int pid;
  int xstatus;

  printf("test %s: ", s);
    43ae:	00002517          	auipc	a0,0x2
    43b2:	57a50513          	addi	a0,a0,1402 # 6928 <malloc+0x1b78>
    43b6:	00001097          	auipc	ra,0x1
    43ba:	93a080e7          	jalr	-1734(ra) # 4cf0 <printf>
  if((pid = fork()) < 0) {
    43be:	00000097          	auipc	ra,0x0
    43c2:	584080e7          	jalr	1412(ra) # 4942 <fork>
    43c6:	02054e63          	bltz	a0,4402 <run+0x64>
    printf("runtest: fork error\n");
    exit(1);
  }
  if(pid == 0) {
    43ca:	c929                	beqz	a0,441c <run+0x7e>
    f(s);
    exit(0);
  } else {
    wait(&xstatus);
    43cc:	fdc40513          	addi	a0,s0,-36
    43d0:	00000097          	auipc	ra,0x0
    43d4:	582080e7          	jalr	1410(ra) # 4952 <wait>
    if(xstatus != 0) 
    43d8:	fdc42783          	lw	a5,-36(s0)
    43dc:	c7b9                	beqz	a5,442a <run+0x8c>
      printf("FAILED\n");
    43de:	00002517          	auipc	a0,0x2
    43e2:	57250513          	addi	a0,a0,1394 # 6950 <malloc+0x1ba0>
    43e6:	00001097          	auipc	ra,0x1
    43ea:	90a080e7          	jalr	-1782(ra) # 4cf0 <printf>
    else
      printf("OK\n");
    return xstatus == 0;
    43ee:	fdc42503          	lw	a0,-36(s0)
  }
}
    43f2:	00153513          	seqz	a0,a0
    43f6:	70a2                	ld	ra,40(sp)
    43f8:	7402                	ld	s0,32(sp)
    43fa:	64e2                	ld	s1,24(sp)
    43fc:	6942                	ld	s2,16(sp)
    43fe:	6145                	addi	sp,sp,48
    4400:	8082                	ret
    printf("runtest: fork error\n");
    4402:	00002517          	auipc	a0,0x2
    4406:	53650513          	addi	a0,a0,1334 # 6938 <malloc+0x1b88>
    440a:	00001097          	auipc	ra,0x1
    440e:	8e6080e7          	jalr	-1818(ra) # 4cf0 <printf>
    exit(1);
    4412:	4505                	li	a0,1
    4414:	00000097          	auipc	ra,0x0
    4418:	536080e7          	jalr	1334(ra) # 494a <exit>
    f(s);
    441c:	854a                	mv	a0,s2
    441e:	9482                	jalr	s1
    exit(0);
    4420:	4501                	li	a0,0
    4422:	00000097          	auipc	ra,0x0
    4426:	528080e7          	jalr	1320(ra) # 494a <exit>
      printf("OK\n");
    442a:	00002517          	auipc	a0,0x2
    442e:	52e50513          	addi	a0,a0,1326 # 6958 <malloc+0x1ba8>
    4432:	00001097          	auipc	ra,0x1
    4436:	8be080e7          	jalr	-1858(ra) # 4cf0 <printf>
    443a:	bf55                	j	43ee <run+0x50>

000000000000443c <main>:

int
main(int argc, char *argv[])
{
    443c:	c8010113          	addi	sp,sp,-896
    4440:	36113c23          	sd	ra,888(sp)
    4444:	36813823          	sd	s0,880(sp)
    4448:	36913423          	sd	s1,872(sp)
    444c:	37213023          	sd	s2,864(sp)
    4450:	35313c23          	sd	s3,856(sp)
    4454:	35413823          	sd	s4,848(sp)
    4458:	35513423          	sd	s5,840(sp)
    445c:	35613023          	sd	s6,832(sp)
    4460:	0700                	addi	s0,sp,896
    4462:	89aa                	mv	s3,a0
  int continuous = 0;
  char *justone = 0;

  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    4464:	4789                	li	a5,2
    4466:	08f50863          	beq	a0,a5,44f6 <main+0xba>
    continuous = 1;
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    continuous = 2;
  } else if(argc == 2 && argv[1][0] != '-'){
    justone = argv[1];
  } else if(argc > 1){
    446a:	4785                	li	a5,1
    446c:	0ca7c363          	blt	a5,a0,4532 <main+0xf6>
  char *justone = 0;
    4470:	4981                	li	s3,0
  }
  
  struct test {
    void (*f)(char *);
    char *s;
  } tests[] = {
    4472:	00003797          	auipc	a5,0x3
    4476:	89678793          	addi	a5,a5,-1898 # 6d08 <randstate+0x8>
    447a:	c8040713          	addi	a4,s0,-896
    447e:	00003817          	auipc	a6,0x3
    4482:	bca80813          	addi	a6,a6,-1078 # 7048 <_edata>
    4486:	6388                	ld	a0,0(a5)
    4488:	678c                	ld	a1,8(a5)
    448a:	6b90                	ld	a2,16(a5)
    448c:	6f94                	ld	a3,24(a5)
    448e:	e308                	sd	a0,0(a4)
    4490:	e70c                	sd	a1,8(a4)
    4492:	eb10                	sd	a2,16(a4)
    4494:	ef14                	sd	a3,24(a4)
    4496:	02078793          	addi	a5,a5,32
    449a:	02070713          	addi	a4,a4,32
    449e:	ff0794e3          	bne	a5,a6,4486 <main+0x4a>
          exit(1);
      }
    }
  }

  printf("usertests starting\n");
    44a2:	00002517          	auipc	a0,0x2
    44a6:	56e50513          	addi	a0,a0,1390 # 6a10 <malloc+0x1c60>
    44aa:	00001097          	auipc	ra,0x1
    44ae:	846080e7          	jalr	-1978(ra) # 4cf0 <printf>
  int free0 = countfree();
    44b2:	00000097          	auipc	ra,0x0
    44b6:	db8080e7          	jalr	-584(ra) # 426a <countfree>
    44ba:	8b2a                	mv	s6,a0
  int free1 = 0;
  int fail = 0;
  for (struct test *t = tests; t->s != 0; t++) {
    44bc:	c8843903          	ld	s2,-888(s0)
    44c0:	c8040493          	addi	s1,s0,-896
  int fail = 0;
    44c4:	4a01                	li	s4,0
    if((justone == 0) || strcmp(t->s, justone) == 0) {
      if(!run(t->f, t->s))
        fail = 1;
    44c6:	4a85                	li	s5,1
  for (struct test *t = tests; t->s != 0; t++) {
    44c8:	0a091a63          	bnez	s2,457c <main+0x140>
  }

  if(fail){
    printf("SOME TESTS FAILED\n");
    exit(1);
  } else if((free1 = countfree()) < free0){
    44cc:	00000097          	auipc	ra,0x0
    44d0:	d9e080e7          	jalr	-610(ra) # 426a <countfree>
    44d4:	85aa                	mv	a1,a0
    44d6:	0f655463          	ble	s6,a0,45be <main+0x182>
    printf("FAILED -- lost some free pages %d (out of %d)\n", free1, free0);
    44da:	865a                	mv	a2,s6
    44dc:	00002517          	auipc	a0,0x2
    44e0:	4ec50513          	addi	a0,a0,1260 # 69c8 <malloc+0x1c18>
    44e4:	00001097          	auipc	ra,0x1
    44e8:	80c080e7          	jalr	-2036(ra) # 4cf0 <printf>
    exit(1);
    44ec:	4505                	li	a0,1
    44ee:	00000097          	auipc	ra,0x0
    44f2:	45c080e7          	jalr	1116(ra) # 494a <exit>
    44f6:	84ae                	mv	s1,a1
  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    44f8:	00002597          	auipc	a1,0x2
    44fc:	46858593          	addi	a1,a1,1128 # 6960 <malloc+0x1bb0>
    4500:	6488                	ld	a0,8(s1)
    4502:	00000097          	auipc	ra,0x0
    4506:	1b8080e7          	jalr	440(ra) # 46ba <strcmp>
    450a:	10050863          	beqz	a0,461a <main+0x1de>
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    450e:	00002597          	auipc	a1,0x2
    4512:	53a58593          	addi	a1,a1,1338 # 6a48 <malloc+0x1c98>
    4516:	6488                	ld	a0,8(s1)
    4518:	00000097          	auipc	ra,0x0
    451c:	1a2080e7          	jalr	418(ra) # 46ba <strcmp>
    4520:	cd75                	beqz	a0,461c <main+0x1e0>
  } else if(argc == 2 && argv[1][0] != '-'){
    4522:	0084b983          	ld	s3,8(s1)
    4526:	0009c703          	lbu	a4,0(s3)
    452a:	02d00793          	li	a5,45
    452e:	f4f712e3          	bne	a4,a5,4472 <main+0x36>
    printf("Usage: usertests [-c] [testname]\n");
    4532:	00002517          	auipc	a0,0x2
    4536:	43650513          	addi	a0,a0,1078 # 6968 <malloc+0x1bb8>
    453a:	00000097          	auipc	ra,0x0
    453e:	7b6080e7          	jalr	1974(ra) # 4cf0 <printf>
    exit(1);
    4542:	4505                	li	a0,1
    4544:	00000097          	auipc	ra,0x0
    4548:	406080e7          	jalr	1030(ra) # 494a <exit>
          exit(1);
    454c:	4505                	li	a0,1
    454e:	00000097          	auipc	ra,0x0
    4552:	3fc080e7          	jalr	1020(ra) # 494a <exit>
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    4556:	40a905bb          	subw	a1,s2,a0
    455a:	855a                	mv	a0,s6
    455c:	00000097          	auipc	ra,0x0
    4560:	794080e7          	jalr	1940(ra) # 4cf0 <printf>
        if(continuous != 2)
    4564:	09498763          	beq	s3,s4,45f2 <main+0x1b6>
          exit(1);
    4568:	4505                	li	a0,1
    456a:	00000097          	auipc	ra,0x0
    456e:	3e0080e7          	jalr	992(ra) # 494a <exit>
  for (struct test *t = tests; t->s != 0; t++) {
    4572:	04c1                	addi	s1,s1,16
    4574:	0084b903          	ld	s2,8(s1)
    4578:	02090463          	beqz	s2,45a0 <main+0x164>
    if((justone == 0) || strcmp(t->s, justone) == 0) {
    457c:	00098963          	beqz	s3,458e <main+0x152>
    4580:	85ce                	mv	a1,s3
    4582:	854a                	mv	a0,s2
    4584:	00000097          	auipc	ra,0x0
    4588:	136080e7          	jalr	310(ra) # 46ba <strcmp>
    458c:	f17d                	bnez	a0,4572 <main+0x136>
      if(!run(t->f, t->s))
    458e:	85ca                	mv	a1,s2
    4590:	6088                	ld	a0,0(s1)
    4592:	00000097          	auipc	ra,0x0
    4596:	e0c080e7          	jalr	-500(ra) # 439e <run>
    459a:	fd61                	bnez	a0,4572 <main+0x136>
        fail = 1;
    459c:	8a56                	mv	s4,s5
    459e:	bfd1                	j	4572 <main+0x136>
  if(fail){
    45a0:	f20a06e3          	beqz	s4,44cc <main+0x90>
    printf("SOME TESTS FAILED\n");
    45a4:	00002517          	auipc	a0,0x2
    45a8:	40c50513          	addi	a0,a0,1036 # 69b0 <malloc+0x1c00>
    45ac:	00000097          	auipc	ra,0x0
    45b0:	744080e7          	jalr	1860(ra) # 4cf0 <printf>
    exit(1);
    45b4:	4505                	li	a0,1
    45b6:	00000097          	auipc	ra,0x0
    45ba:	394080e7          	jalr	916(ra) # 494a <exit>
  } else {
    printf("ALL TESTS PASSED\n");
    45be:	00002517          	auipc	a0,0x2
    45c2:	43a50513          	addi	a0,a0,1082 # 69f8 <malloc+0x1c48>
    45c6:	00000097          	auipc	ra,0x0
    45ca:	72a080e7          	jalr	1834(ra) # 4cf0 <printf>
    exit(0);
    45ce:	4501                	li	a0,0
    45d0:	00000097          	auipc	ra,0x0
    45d4:	37a080e7          	jalr	890(ra) # 494a <exit>
        printf("SOME TESTS FAILED\n");
    45d8:	8556                	mv	a0,s5
    45da:	00000097          	auipc	ra,0x0
    45de:	716080e7          	jalr	1814(ra) # 4cf0 <printf>
        if(continuous != 2)
    45e2:	f74995e3          	bne	s3,s4,454c <main+0x110>
      int free1 = countfree();
    45e6:	00000097          	auipc	ra,0x0
    45ea:	c84080e7          	jalr	-892(ra) # 426a <countfree>
      if(free1 < free0){
    45ee:	f72544e3          	blt	a0,s2,4556 <main+0x11a>
      int free0 = countfree();
    45f2:	00000097          	auipc	ra,0x0
    45f6:	c78080e7          	jalr	-904(ra) # 426a <countfree>
    45fa:	892a                	mv	s2,a0
      for (struct test *t = tests; t->s != 0; t++) {
    45fc:	c8843583          	ld	a1,-888(s0)
    4600:	d1fd                	beqz	a1,45e6 <main+0x1aa>
    4602:	c8040493          	addi	s1,s0,-896
        if(!run(t->f, t->s)){
    4606:	6088                	ld	a0,0(s1)
    4608:	00000097          	auipc	ra,0x0
    460c:	d96080e7          	jalr	-618(ra) # 439e <run>
    4610:	d561                	beqz	a0,45d8 <main+0x19c>
      for (struct test *t = tests; t->s != 0; t++) {
    4612:	04c1                	addi	s1,s1,16
    4614:	648c                	ld	a1,8(s1)
    4616:	f9e5                	bnez	a1,4606 <main+0x1ca>
    4618:	b7f9                	j	45e6 <main+0x1aa>
    continuous = 1;
    461a:	4985                	li	s3,1
  } tests[] = {
    461c:	00002797          	auipc	a5,0x2
    4620:	6ec78793          	addi	a5,a5,1772 # 6d08 <randstate+0x8>
    4624:	c8040713          	addi	a4,s0,-896
    4628:	00003817          	auipc	a6,0x3
    462c:	a2080813          	addi	a6,a6,-1504 # 7048 <_edata>
    4630:	6388                	ld	a0,0(a5)
    4632:	678c                	ld	a1,8(a5)
    4634:	6b90                	ld	a2,16(a5)
    4636:	6f94                	ld	a3,24(a5)
    4638:	e308                	sd	a0,0(a4)
    463a:	e70c                	sd	a1,8(a4)
    463c:	eb10                	sd	a2,16(a4)
    463e:	ef14                	sd	a3,24(a4)
    4640:	02078793          	addi	a5,a5,32
    4644:	02070713          	addi	a4,a4,32
    4648:	ff0794e3          	bne	a5,a6,4630 <main+0x1f4>
    printf("continuous usertests starting\n");
    464c:	00002517          	auipc	a0,0x2
    4650:	3dc50513          	addi	a0,a0,988 # 6a28 <malloc+0x1c78>
    4654:	00000097          	auipc	ra,0x0
    4658:	69c080e7          	jalr	1692(ra) # 4cf0 <printf>
        printf("SOME TESTS FAILED\n");
    465c:	00002a97          	auipc	s5,0x2
    4660:	354a8a93          	addi	s5,s5,852 # 69b0 <malloc+0x1c00>
        if(continuous != 2)
    4664:	4a09                	li	s4,2
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    4666:	00002b17          	auipc	s6,0x2
    466a:	32ab0b13          	addi	s6,s6,810 # 6990 <malloc+0x1be0>
    466e:	b751                	j	45f2 <main+0x1b6>

0000000000004670 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
    4670:	1141                	addi	sp,sp,-16
    4672:	e422                	sd	s0,8(sp)
    4674:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    4676:	87aa                	mv	a5,a0
    4678:	0585                	addi	a1,a1,1
    467a:	0785                	addi	a5,a5,1
    467c:	fff5c703          	lbu	a4,-1(a1)
    4680:	fee78fa3          	sb	a4,-1(a5)
    4684:	fb75                	bnez	a4,4678 <strcpy+0x8>
    ;
  return os;
}
    4686:	6422                	ld	s0,8(sp)
    4688:	0141                	addi	sp,sp,16
    468a:	8082                	ret

000000000000468c <strcat>:

char*
strcat(char *s, const char *t)
{
    468c:	1141                	addi	sp,sp,-16
    468e:	e422                	sd	s0,8(sp)
    4690:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
    4692:	00054783          	lbu	a5,0(a0)
    4696:	c385                	beqz	a5,46b6 <strcat+0x2a>
    4698:	87aa                	mv	a5,a0
    s++;
    469a:	0785                	addi	a5,a5,1
  while(*s)
    469c:	0007c703          	lbu	a4,0(a5)
    46a0:	ff6d                	bnez	a4,469a <strcat+0xe>
  while((*s++ = *t++))
    46a2:	0585                	addi	a1,a1,1
    46a4:	0785                	addi	a5,a5,1
    46a6:	fff5c703          	lbu	a4,-1(a1)
    46aa:	fee78fa3          	sb	a4,-1(a5)
    46ae:	fb75                	bnez	a4,46a2 <strcat+0x16>
    ;
  return os;
}
    46b0:	6422                	ld	s0,8(sp)
    46b2:	0141                	addi	sp,sp,16
    46b4:	8082                	ret
  while(*s)
    46b6:	87aa                	mv	a5,a0
    46b8:	b7ed                	j	46a2 <strcat+0x16>

00000000000046ba <strcmp>:


int
strcmp(const char *p, const char *q)
{
    46ba:	1141                	addi	sp,sp,-16
    46bc:	e422                	sd	s0,8(sp)
    46be:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    46c0:	00054783          	lbu	a5,0(a0)
    46c4:	cf91                	beqz	a5,46e0 <strcmp+0x26>
    46c6:	0005c703          	lbu	a4,0(a1)
    46ca:	00f71b63          	bne	a4,a5,46e0 <strcmp+0x26>
    p++, q++;
    46ce:	0505                	addi	a0,a0,1
    46d0:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    46d2:	00054783          	lbu	a5,0(a0)
    46d6:	c789                	beqz	a5,46e0 <strcmp+0x26>
    46d8:	0005c703          	lbu	a4,0(a1)
    46dc:	fef709e3          	beq	a4,a5,46ce <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
    46e0:	0005c503          	lbu	a0,0(a1)
}
    46e4:	40a7853b          	subw	a0,a5,a0
    46e8:	6422                	ld	s0,8(sp)
    46ea:	0141                	addi	sp,sp,16
    46ec:	8082                	ret

00000000000046ee <strlen>:

uint
strlen(const char *s)
{
    46ee:	1141                	addi	sp,sp,-16
    46f0:	e422                	sd	s0,8(sp)
    46f2:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    46f4:	00054783          	lbu	a5,0(a0)
    46f8:	cf91                	beqz	a5,4714 <strlen+0x26>
    46fa:	0505                	addi	a0,a0,1
    46fc:	87aa                	mv	a5,a0
    46fe:	4685                	li	a3,1
    4700:	9e89                	subw	a3,a3,a0
    4702:	00f6853b          	addw	a0,a3,a5
    4706:	0785                	addi	a5,a5,1
    4708:	fff7c703          	lbu	a4,-1(a5)
    470c:	fb7d                	bnez	a4,4702 <strlen+0x14>
    ;
  return n;
}
    470e:	6422                	ld	s0,8(sp)
    4710:	0141                	addi	sp,sp,16
    4712:	8082                	ret
  for(n = 0; s[n]; n++)
    4714:	4501                	li	a0,0
    4716:	bfe5                	j	470e <strlen+0x20>

0000000000004718 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4718:	1141                	addi	sp,sp,-16
    471a:	e422                	sd	s0,8(sp)
    471c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    471e:	ce09                	beqz	a2,4738 <memset+0x20>
    4720:	87aa                	mv	a5,a0
    4722:	fff6071b          	addiw	a4,a2,-1
    4726:	1702                	slli	a4,a4,0x20
    4728:	9301                	srli	a4,a4,0x20
    472a:	0705                	addi	a4,a4,1
    472c:	972a                	add	a4,a4,a0
    cdst[i] = c;
    472e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    4732:	0785                	addi	a5,a5,1
    4734:	fee79de3          	bne	a5,a4,472e <memset+0x16>
  }
  return dst;
}
    4738:	6422                	ld	s0,8(sp)
    473a:	0141                	addi	sp,sp,16
    473c:	8082                	ret

000000000000473e <strchr>:

char*
strchr(const char *s, char c)
{
    473e:	1141                	addi	sp,sp,-16
    4740:	e422                	sd	s0,8(sp)
    4742:	0800                	addi	s0,sp,16
  for(; *s; s++)
    4744:	00054783          	lbu	a5,0(a0)
    4748:	cf91                	beqz	a5,4764 <strchr+0x26>
    if(*s == c)
    474a:	00f58a63          	beq	a1,a5,475e <strchr+0x20>
  for(; *s; s++)
    474e:	0505                	addi	a0,a0,1
    4750:	00054783          	lbu	a5,0(a0)
    4754:	c781                	beqz	a5,475c <strchr+0x1e>
    if(*s == c)
    4756:	feb79ce3          	bne	a5,a1,474e <strchr+0x10>
    475a:	a011                	j	475e <strchr+0x20>
      return (char*)s;
  return 0;
    475c:	4501                	li	a0,0
}
    475e:	6422                	ld	s0,8(sp)
    4760:	0141                	addi	sp,sp,16
    4762:	8082                	ret
  return 0;
    4764:	4501                	li	a0,0
    4766:	bfe5                	j	475e <strchr+0x20>

0000000000004768 <gets>:

char*
gets(char *buf, int max)
{
    4768:	711d                	addi	sp,sp,-96
    476a:	ec86                	sd	ra,88(sp)
    476c:	e8a2                	sd	s0,80(sp)
    476e:	e4a6                	sd	s1,72(sp)
    4770:	e0ca                	sd	s2,64(sp)
    4772:	fc4e                	sd	s3,56(sp)
    4774:	f852                	sd	s4,48(sp)
    4776:	f456                	sd	s5,40(sp)
    4778:	f05a                	sd	s6,32(sp)
    477a:	ec5e                	sd	s7,24(sp)
    477c:	e862                	sd	s8,16(sp)
    477e:	1080                	addi	s0,sp,96
    4780:	8c2a                	mv	s8,a0
    4782:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4784:	892a                	mv	s2,a0
    4786:	4981                	li	s3,0
    cc = read(0, &c, 1);
    4788:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    478c:	4b29                	li	s6,10
    478e:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
    4790:	0019849b          	addiw	s1,s3,1
    4794:	0344d763          	ble	s4,s1,47c2 <gets+0x5a>
    cc = read(0, &c, 1);
    4798:	4605                	li	a2,1
    479a:	85d6                	mv	a1,s5
    479c:	4501                	li	a0,0
    479e:	00000097          	auipc	ra,0x0
    47a2:	1c4080e7          	jalr	452(ra) # 4962 <read>
    if(cc < 1)
    47a6:	00a05e63          	blez	a0,47c2 <gets+0x5a>
    buf[i++] = c;
    47aa:	faf44783          	lbu	a5,-81(s0)
    47ae:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    47b2:	01678763          	beq	a5,s6,47c0 <gets+0x58>
    47b6:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
    47b8:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
    47ba:	fd779be3          	bne	a5,s7,4790 <gets+0x28>
    47be:	a011                	j	47c2 <gets+0x5a>
  for(i=0; i+1 < max; ){
    47c0:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    47c2:	99e2                	add	s3,s3,s8
    47c4:	00098023          	sb	zero,0(s3)
  return buf;
}
    47c8:	8562                	mv	a0,s8
    47ca:	60e6                	ld	ra,88(sp)
    47cc:	6446                	ld	s0,80(sp)
    47ce:	64a6                	ld	s1,72(sp)
    47d0:	6906                	ld	s2,64(sp)
    47d2:	79e2                	ld	s3,56(sp)
    47d4:	7a42                	ld	s4,48(sp)
    47d6:	7aa2                	ld	s5,40(sp)
    47d8:	7b02                	ld	s6,32(sp)
    47da:	6be2                	ld	s7,24(sp)
    47dc:	6c42                	ld	s8,16(sp)
    47de:	6125                	addi	sp,sp,96
    47e0:	8082                	ret

00000000000047e2 <stat>:

int
stat(const char *n, struct stat *st)
{
    47e2:	1101                	addi	sp,sp,-32
    47e4:	ec06                	sd	ra,24(sp)
    47e6:	e822                	sd	s0,16(sp)
    47e8:	e426                	sd	s1,8(sp)
    47ea:	e04a                	sd	s2,0(sp)
    47ec:	1000                	addi	s0,sp,32
    47ee:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    47f0:	4581                	li	a1,0
    47f2:	00000097          	auipc	ra,0x0
    47f6:	198080e7          	jalr	408(ra) # 498a <open>
  if(fd < 0)
    47fa:	02054563          	bltz	a0,4824 <stat+0x42>
    47fe:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    4800:	85ca                	mv	a1,s2
    4802:	00000097          	auipc	ra,0x0
    4806:	190080e7          	jalr	400(ra) # 4992 <fstat>
    480a:	892a                	mv	s2,a0
  close(fd);
    480c:	8526                	mv	a0,s1
    480e:	00000097          	auipc	ra,0x0
    4812:	164080e7          	jalr	356(ra) # 4972 <close>
  return r;
}
    4816:	854a                	mv	a0,s2
    4818:	60e2                	ld	ra,24(sp)
    481a:	6442                	ld	s0,16(sp)
    481c:	64a2                	ld	s1,8(sp)
    481e:	6902                	ld	s2,0(sp)
    4820:	6105                	addi	sp,sp,32
    4822:	8082                	ret
    return -1;
    4824:	597d                	li	s2,-1
    4826:	bfc5                	j	4816 <stat+0x34>

0000000000004828 <atoi>:

int
atoi(const char *s)
{
    4828:	1141                	addi	sp,sp,-16
    482a:	e422                	sd	s0,8(sp)
    482c:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
    482e:	00054703          	lbu	a4,0(a0)
    4832:	02d00793          	li	a5,45
  int neg = 1;
    4836:	4805                	li	a6,1
  if (*s == '-') {
    4838:	04f70363          	beq	a4,a5,487e <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
    483c:	00054683          	lbu	a3,0(a0)
    4840:	fd06879b          	addiw	a5,a3,-48
    4844:	0ff7f793          	andi	a5,a5,255
    4848:	4725                	li	a4,9
    484a:	02f76d63          	bltu	a4,a5,4884 <atoi+0x5c>
  n = 0;
    484e:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
    4850:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
    4852:	0505                	addi	a0,a0,1
    4854:	0026179b          	slliw	a5,a2,0x2
    4858:	9fb1                	addw	a5,a5,a2
    485a:	0017979b          	slliw	a5,a5,0x1
    485e:	9fb5                	addw	a5,a5,a3
    4860:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
    4864:	00054683          	lbu	a3,0(a0)
    4868:	fd06871b          	addiw	a4,a3,-48
    486c:	0ff77713          	andi	a4,a4,255
    4870:	fee5f1e3          	bleu	a4,a1,4852 <atoi+0x2a>
  return n * neg;
}
    4874:	02c8053b          	mulw	a0,a6,a2
    4878:	6422                	ld	s0,8(sp)
    487a:	0141                	addi	sp,sp,16
    487c:	8082                	ret
    s++;
    487e:	0505                	addi	a0,a0,1
    neg = -1;
    4880:	587d                	li	a6,-1
    4882:	bf6d                	j	483c <atoi+0x14>
  n = 0;
    4884:	4601                	li	a2,0
    4886:	b7fd                	j	4874 <atoi+0x4c>

0000000000004888 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    4888:	1141                	addi	sp,sp,-16
    488a:	e422                	sd	s0,8(sp)
    488c:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    488e:	02b57663          	bleu	a1,a0,48ba <memmove+0x32>
    while(n-- > 0)
    4892:	02c05163          	blez	a2,48b4 <memmove+0x2c>
    4896:	fff6079b          	addiw	a5,a2,-1
    489a:	1782                	slli	a5,a5,0x20
    489c:	9381                	srli	a5,a5,0x20
    489e:	0785                	addi	a5,a5,1
    48a0:	97aa                	add	a5,a5,a0
  dst = vdst;
    48a2:	872a                	mv	a4,a0
      *dst++ = *src++;
    48a4:	0585                	addi	a1,a1,1
    48a6:	0705                	addi	a4,a4,1
    48a8:	fff5c683          	lbu	a3,-1(a1)
    48ac:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    48b0:	fee79ae3          	bne	a5,a4,48a4 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    48b4:	6422                	ld	s0,8(sp)
    48b6:	0141                	addi	sp,sp,16
    48b8:	8082                	ret
    dst += n;
    48ba:	00c50733          	add	a4,a0,a2
    src += n;
    48be:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    48c0:	fec05ae3          	blez	a2,48b4 <memmove+0x2c>
    48c4:	fff6079b          	addiw	a5,a2,-1
    48c8:	1782                	slli	a5,a5,0x20
    48ca:	9381                	srli	a5,a5,0x20
    48cc:	fff7c793          	not	a5,a5
    48d0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    48d2:	15fd                	addi	a1,a1,-1
    48d4:	177d                	addi	a4,a4,-1
    48d6:	0005c683          	lbu	a3,0(a1)
    48da:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    48de:	fef71ae3          	bne	a4,a5,48d2 <memmove+0x4a>
    48e2:	bfc9                	j	48b4 <memmove+0x2c>

00000000000048e4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    48e4:	1141                	addi	sp,sp,-16
    48e6:	e422                	sd	s0,8(sp)
    48e8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    48ea:	ce15                	beqz	a2,4926 <memcmp+0x42>
    48ec:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
    48f0:	00054783          	lbu	a5,0(a0)
    48f4:	0005c703          	lbu	a4,0(a1)
    48f8:	02e79063          	bne	a5,a4,4918 <memcmp+0x34>
    48fc:	1682                	slli	a3,a3,0x20
    48fe:	9281                	srli	a3,a3,0x20
    4900:	0685                	addi	a3,a3,1
    4902:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
    4904:	0505                	addi	a0,a0,1
    p2++;
    4906:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    4908:	00d50d63          	beq	a0,a3,4922 <memcmp+0x3e>
    if (*p1 != *p2) {
    490c:	00054783          	lbu	a5,0(a0)
    4910:	0005c703          	lbu	a4,0(a1)
    4914:	fee788e3          	beq	a5,a4,4904 <memcmp+0x20>
      return *p1 - *p2;
    4918:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
    491c:	6422                	ld	s0,8(sp)
    491e:	0141                	addi	sp,sp,16
    4920:	8082                	ret
  return 0;
    4922:	4501                	li	a0,0
    4924:	bfe5                	j	491c <memcmp+0x38>
    4926:	4501                	li	a0,0
    4928:	bfd5                	j	491c <memcmp+0x38>

000000000000492a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    492a:	1141                	addi	sp,sp,-16
    492c:	e406                	sd	ra,8(sp)
    492e:	e022                	sd	s0,0(sp)
    4930:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    4932:	00000097          	auipc	ra,0x0
    4936:	f56080e7          	jalr	-170(ra) # 4888 <memmove>
}
    493a:	60a2                	ld	ra,8(sp)
    493c:	6402                	ld	s0,0(sp)
    493e:	0141                	addi	sp,sp,16
    4940:	8082                	ret

0000000000004942 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
    4942:	4885                	li	a7,1
 ecall
    4944:	00000073          	ecall
 ret
    4948:	8082                	ret

000000000000494a <exit>:
.global exit
exit:
 li a7, SYS_exit
    494a:	4889                	li	a7,2
 ecall
    494c:	00000073          	ecall
 ret
    4950:	8082                	ret

0000000000004952 <wait>:
.global wait
wait:
 li a7, SYS_wait
    4952:	488d                	li	a7,3
 ecall
    4954:	00000073          	ecall
 ret
    4958:	8082                	ret

000000000000495a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    495a:	4891                	li	a7,4
 ecall
    495c:	00000073          	ecall
 ret
    4960:	8082                	ret

0000000000004962 <read>:
.global read
read:
 li a7, SYS_read
    4962:	4895                	li	a7,5
 ecall
    4964:	00000073          	ecall
 ret
    4968:	8082                	ret

000000000000496a <write>:
.global write
write:
 li a7, SYS_write
    496a:	48c1                	li	a7,16
 ecall
    496c:	00000073          	ecall
 ret
    4970:	8082                	ret

0000000000004972 <close>:
.global close
close:
 li a7, SYS_close
    4972:	48d5                	li	a7,21
 ecall
    4974:	00000073          	ecall
 ret
    4978:	8082                	ret

000000000000497a <kill>:
.global kill
kill:
 li a7, SYS_kill
    497a:	4899                	li	a7,6
 ecall
    497c:	00000073          	ecall
 ret
    4980:	8082                	ret

0000000000004982 <exec>:
.global exec
exec:
 li a7, SYS_exec
    4982:	489d                	li	a7,7
 ecall
    4984:	00000073          	ecall
 ret
    4988:	8082                	ret

000000000000498a <open>:
.global open
open:
 li a7, SYS_open
    498a:	48bd                	li	a7,15
 ecall
    498c:	00000073          	ecall
 ret
    4990:	8082                	ret

0000000000004992 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    4992:	48a1                	li	a7,8
 ecall
    4994:	00000073          	ecall
 ret
    4998:	8082                	ret

000000000000499a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    499a:	48d1                	li	a7,20
 ecall
    499c:	00000073          	ecall
 ret
    49a0:	8082                	ret

00000000000049a2 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    49a2:	48a5                	li	a7,9
 ecall
    49a4:	00000073          	ecall
 ret
    49a8:	8082                	ret

00000000000049aa <dup>:
.global dup
dup:
 li a7, SYS_dup
    49aa:	48a9                	li	a7,10
 ecall
    49ac:	00000073          	ecall
 ret
    49b0:	8082                	ret

00000000000049b2 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    49b2:	48ad                	li	a7,11
 ecall
    49b4:	00000073          	ecall
 ret
    49b8:	8082                	ret

00000000000049ba <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    49ba:	48b1                	li	a7,12
 ecall
    49bc:	00000073          	ecall
 ret
    49c0:	8082                	ret

00000000000049c2 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    49c2:	48b5                	li	a7,13
 ecall
    49c4:	00000073          	ecall
 ret
    49c8:	8082                	ret

00000000000049ca <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    49ca:	48b9                	li	a7,14
 ecall
    49cc:	00000073          	ecall
 ret
    49d0:	8082                	ret

00000000000049d2 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
    49d2:	48d9                	li	a7,22
 ecall
    49d4:	00000073          	ecall
 ret
    49d8:	8082                	ret

00000000000049da <dev>:
.global dev
dev:
 li a7, SYS_dev
    49da:	48dd                	li	a7,23
 ecall
    49dc:	00000073          	ecall
 ret
    49e0:	8082                	ret

00000000000049e2 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
    49e2:	48e1                	li	a7,24
 ecall
    49e4:	00000073          	ecall
 ret
    49e8:	8082                	ret

00000000000049ea <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
    49ea:	48e5                	li	a7,25
 ecall
    49ec:	00000073          	ecall
 ret
    49f0:	8082                	ret

00000000000049f2 <remove>:
.global remove
remove:
 li a7, SYS_remove
    49f2:	48c5                	li	a7,17
 ecall
    49f4:	00000073          	ecall
 ret
    49f8:	8082                	ret

00000000000049fa <trace>:
.global trace
trace:
 li a7, SYS_trace
    49fa:	48c9                	li	a7,18
 ecall
    49fc:	00000073          	ecall
 ret
    4a00:	8082                	ret

0000000000004a02 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
    4a02:	48cd                	li	a7,19
 ecall
    4a04:	00000073          	ecall
 ret
    4a08:	8082                	ret

0000000000004a0a <rename>:
.global rename
rename:
 li a7, SYS_rename
    4a0a:	48e9                	li	a7,26
 ecall
    4a0c:	00000073          	ecall
 ret
    4a10:	8082                	ret

0000000000004a12 <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
    4a12:	48ed                	li	a7,27
 ecall
    4a14:	00000073          	ecall
 ret
    4a18:	8082                	ret

0000000000004a1a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    4a1a:	1101                	addi	sp,sp,-32
    4a1c:	ec06                	sd	ra,24(sp)
    4a1e:	e822                	sd	s0,16(sp)
    4a20:	1000                	addi	s0,sp,32
    4a22:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    4a26:	4605                	li	a2,1
    4a28:	fef40593          	addi	a1,s0,-17
    4a2c:	00000097          	auipc	ra,0x0
    4a30:	f3e080e7          	jalr	-194(ra) # 496a <write>
}
    4a34:	60e2                	ld	ra,24(sp)
    4a36:	6442                	ld	s0,16(sp)
    4a38:	6105                	addi	sp,sp,32
    4a3a:	8082                	ret

0000000000004a3c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4a3c:	7139                	addi	sp,sp,-64
    4a3e:	fc06                	sd	ra,56(sp)
    4a40:	f822                	sd	s0,48(sp)
    4a42:	f426                	sd	s1,40(sp)
    4a44:	f04a                	sd	s2,32(sp)
    4a46:	ec4e                	sd	s3,24(sp)
    4a48:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4a4a:	c299                	beqz	a3,4a50 <printint+0x14>
    4a4c:	0005ce63          	bltz	a1,4a68 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    4a50:	2581                	sext.w	a1,a1
  neg = 0;
    4a52:	4301                	li	t1,0
  }

  i = 0;
    4a54:	fc040913          	addi	s2,s0,-64
  neg = 0;
    4a58:	874a                	mv	a4,s2
  i = 0;
    4a5a:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
    4a5c:	2601                	sext.w	a2,a2
    4a5e:	00002897          	auipc	a7,0x2
    4a62:	26288893          	addi	a7,a7,610 # 6cc0 <digits>
    4a66:	a801                	j	4a76 <printint+0x3a>
    x = -xx;
    4a68:	40b005bb          	negw	a1,a1
    4a6c:	2581                	sext.w	a1,a1
    neg = 1;
    4a6e:	4305                	li	t1,1
    x = -xx;
    4a70:	b7d5                	j	4a54 <printint+0x18>
  }while((x /= base) != 0);
    4a72:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
    4a74:	8836                	mv	a6,a3
    4a76:	0018069b          	addiw	a3,a6,1
    4a7a:	02c5f7bb          	remuw	a5,a1,a2
    4a7e:	1782                	slli	a5,a5,0x20
    4a80:	9381                	srli	a5,a5,0x20
    4a82:	97c6                	add	a5,a5,a7
    4a84:	0007c783          	lbu	a5,0(a5)
    4a88:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
    4a8c:	0705                	addi	a4,a4,1
    4a8e:	02c5d7bb          	divuw	a5,a1,a2
    4a92:	fec5f0e3          	bleu	a2,a1,4a72 <printint+0x36>
  if(neg)
    4a96:	00030b63          	beqz	t1,4aac <printint+0x70>
    buf[i++] = '-';
    4a9a:	fd040793          	addi	a5,s0,-48
    4a9e:	96be                	add	a3,a3,a5
    4aa0:	02d00793          	li	a5,45
    4aa4:	fef68823          	sb	a5,-16(a3) # ff0 <copyinstr2+0xa8>
    4aa8:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
    4aac:	02d05763          	blez	a3,4ada <printint+0x9e>
    4ab0:	89aa                	mv	s3,a0
    4ab2:	fc040493          	addi	s1,s0,-64
    4ab6:	94b6                	add	s1,s1,a3
    4ab8:	197d                	addi	s2,s2,-1
    4aba:	9936                	add	s2,s2,a3
    4abc:	36fd                	addiw	a3,a3,-1
    4abe:	1682                	slli	a3,a3,0x20
    4ac0:	9281                	srli	a3,a3,0x20
    4ac2:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
    4ac6:	fff4c583          	lbu	a1,-1(s1)
    4aca:	854e                	mv	a0,s3
    4acc:	00000097          	auipc	ra,0x0
    4ad0:	f4e080e7          	jalr	-178(ra) # 4a1a <putc>
  while(--i >= 0)
    4ad4:	14fd                	addi	s1,s1,-1
    4ad6:	ff2498e3          	bne	s1,s2,4ac6 <printint+0x8a>
}
    4ada:	70e2                	ld	ra,56(sp)
    4adc:	7442                	ld	s0,48(sp)
    4ade:	74a2                	ld	s1,40(sp)
    4ae0:	7902                	ld	s2,32(sp)
    4ae2:	69e2                	ld	s3,24(sp)
    4ae4:	6121                	addi	sp,sp,64
    4ae6:	8082                	ret

0000000000004ae8 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    4ae8:	7119                	addi	sp,sp,-128
    4aea:	fc86                	sd	ra,120(sp)
    4aec:	f8a2                	sd	s0,112(sp)
    4aee:	f4a6                	sd	s1,104(sp)
    4af0:	f0ca                	sd	s2,96(sp)
    4af2:	ecce                	sd	s3,88(sp)
    4af4:	e8d2                	sd	s4,80(sp)
    4af6:	e4d6                	sd	s5,72(sp)
    4af8:	e0da                	sd	s6,64(sp)
    4afa:	fc5e                	sd	s7,56(sp)
    4afc:	f862                	sd	s8,48(sp)
    4afe:	f466                	sd	s9,40(sp)
    4b00:	f06a                	sd	s10,32(sp)
    4b02:	ec6e                	sd	s11,24(sp)
    4b04:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    4b06:	0005c483          	lbu	s1,0(a1)
    4b0a:	18048d63          	beqz	s1,4ca4 <vprintf+0x1bc>
    4b0e:	8aaa                	mv	s5,a0
    4b10:	8b32                	mv	s6,a2
    4b12:	00158913          	addi	s2,a1,1
  state = 0;
    4b16:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    4b18:	02500a13          	li	s4,37
      if(c == 'd'){
    4b1c:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
    4b20:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
    4b24:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
    4b28:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    4b2c:	00002b97          	auipc	s7,0x2
    4b30:	194b8b93          	addi	s7,s7,404 # 6cc0 <digits>
    4b34:	a839                	j	4b52 <vprintf+0x6a>
        putc(fd, c);
    4b36:	85a6                	mv	a1,s1
    4b38:	8556                	mv	a0,s5
    4b3a:	00000097          	auipc	ra,0x0
    4b3e:	ee0080e7          	jalr	-288(ra) # 4a1a <putc>
    4b42:	a019                	j	4b48 <vprintf+0x60>
    } else if(state == '%'){
    4b44:	01498f63          	beq	s3,s4,4b62 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
    4b48:	0905                	addi	s2,s2,1
    4b4a:	fff94483          	lbu	s1,-1(s2)
    4b4e:	14048b63          	beqz	s1,4ca4 <vprintf+0x1bc>
    c = fmt[i] & 0xff;
    4b52:	0004879b          	sext.w	a5,s1
    if(state == 0){
    4b56:	fe0997e3          	bnez	s3,4b44 <vprintf+0x5c>
      if(c == '%'){
    4b5a:	fd479ee3          	bne	a5,s4,4b36 <vprintf+0x4e>
        state = '%';
    4b5e:	89be                	mv	s3,a5
    4b60:	b7e5                	j	4b48 <vprintf+0x60>
      if(c == 'd'){
    4b62:	05878063          	beq	a5,s8,4ba2 <vprintf+0xba>
      } else if(c == 'l') {
    4b66:	05978c63          	beq	a5,s9,4bbe <vprintf+0xd6>
      } else if(c == 'x') {
    4b6a:	07a78863          	beq	a5,s10,4bda <vprintf+0xf2>
      } else if(c == 'p') {
    4b6e:	09b78463          	beq	a5,s11,4bf6 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
    4b72:	07300713          	li	a4,115
    4b76:	0ce78563          	beq	a5,a4,4c40 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4b7a:	06300713          	li	a4,99
    4b7e:	0ee78c63          	beq	a5,a4,4c76 <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
    4b82:	11478663          	beq	a5,s4,4c8e <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4b86:	85d2                	mv	a1,s4
    4b88:	8556                	mv	a0,s5
    4b8a:	00000097          	auipc	ra,0x0
    4b8e:	e90080e7          	jalr	-368(ra) # 4a1a <putc>
        putc(fd, c);
    4b92:	85a6                	mv	a1,s1
    4b94:	8556                	mv	a0,s5
    4b96:	00000097          	auipc	ra,0x0
    4b9a:	e84080e7          	jalr	-380(ra) # 4a1a <putc>
      }
      state = 0;
    4b9e:	4981                	li	s3,0
    4ba0:	b765                	j	4b48 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
    4ba2:	008b0493          	addi	s1,s6,8
    4ba6:	4685                	li	a3,1
    4ba8:	4629                	li	a2,10
    4baa:	000b2583          	lw	a1,0(s6)
    4bae:	8556                	mv	a0,s5
    4bb0:	00000097          	auipc	ra,0x0
    4bb4:	e8c080e7          	jalr	-372(ra) # 4a3c <printint>
    4bb8:	8b26                	mv	s6,s1
      state = 0;
    4bba:	4981                	li	s3,0
    4bbc:	b771                	j	4b48 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    4bbe:	008b0493          	addi	s1,s6,8
    4bc2:	4681                	li	a3,0
    4bc4:	4629                	li	a2,10
    4bc6:	000b2583          	lw	a1,0(s6)
    4bca:	8556                	mv	a0,s5
    4bcc:	00000097          	auipc	ra,0x0
    4bd0:	e70080e7          	jalr	-400(ra) # 4a3c <printint>
    4bd4:	8b26                	mv	s6,s1
      state = 0;
    4bd6:	4981                	li	s3,0
    4bd8:	bf85                	j	4b48 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    4bda:	008b0493          	addi	s1,s6,8
    4bde:	4681                	li	a3,0
    4be0:	4641                	li	a2,16
    4be2:	000b2583          	lw	a1,0(s6)
    4be6:	8556                	mv	a0,s5
    4be8:	00000097          	auipc	ra,0x0
    4bec:	e54080e7          	jalr	-428(ra) # 4a3c <printint>
    4bf0:	8b26                	mv	s6,s1
      state = 0;
    4bf2:	4981                	li	s3,0
    4bf4:	bf91                	j	4b48 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    4bf6:	008b0793          	addi	a5,s6,8
    4bfa:	f8f43423          	sd	a5,-120(s0)
    4bfe:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    4c02:	03000593          	li	a1,48
    4c06:	8556                	mv	a0,s5
    4c08:	00000097          	auipc	ra,0x0
    4c0c:	e12080e7          	jalr	-494(ra) # 4a1a <putc>
  putc(fd, 'x');
    4c10:	85ea                	mv	a1,s10
    4c12:	8556                	mv	a0,s5
    4c14:	00000097          	auipc	ra,0x0
    4c18:	e06080e7          	jalr	-506(ra) # 4a1a <putc>
    4c1c:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    4c1e:	03c9d793          	srli	a5,s3,0x3c
    4c22:	97de                	add	a5,a5,s7
    4c24:	0007c583          	lbu	a1,0(a5)
    4c28:	8556                	mv	a0,s5
    4c2a:	00000097          	auipc	ra,0x0
    4c2e:	df0080e7          	jalr	-528(ra) # 4a1a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    4c32:	0992                	slli	s3,s3,0x4
    4c34:	34fd                	addiw	s1,s1,-1
    4c36:	f4e5                	bnez	s1,4c1e <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
    4c38:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    4c3c:	4981                	li	s3,0
    4c3e:	b729                	j	4b48 <vprintf+0x60>
        s = va_arg(ap, char*);
    4c40:	008b0993          	addi	s3,s6,8
    4c44:	000b3483          	ld	s1,0(s6)
        if(s == 0)
    4c48:	c085                	beqz	s1,4c68 <vprintf+0x180>
        while(*s != 0){
    4c4a:	0004c583          	lbu	a1,0(s1)
    4c4e:	c9a1                	beqz	a1,4c9e <vprintf+0x1b6>
          putc(fd, *s);
    4c50:	8556                	mv	a0,s5
    4c52:	00000097          	auipc	ra,0x0
    4c56:	dc8080e7          	jalr	-568(ra) # 4a1a <putc>
          s++;
    4c5a:	0485                	addi	s1,s1,1
        while(*s != 0){
    4c5c:	0004c583          	lbu	a1,0(s1)
    4c60:	f9e5                	bnez	a1,4c50 <vprintf+0x168>
        s = va_arg(ap, char*);
    4c62:	8b4e                	mv	s6,s3
      state = 0;
    4c64:	4981                	li	s3,0
    4c66:	b5cd                	j	4b48 <vprintf+0x60>
          s = "(null)";
    4c68:	00002497          	auipc	s1,0x2
    4c6c:	07048493          	addi	s1,s1,112 # 6cd8 <digits+0x18>
        while(*s != 0){
    4c70:	02800593          	li	a1,40
    4c74:	bff1                	j	4c50 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
    4c76:	008b0493          	addi	s1,s6,8
    4c7a:	000b4583          	lbu	a1,0(s6)
    4c7e:	8556                	mv	a0,s5
    4c80:	00000097          	auipc	ra,0x0
    4c84:	d9a080e7          	jalr	-614(ra) # 4a1a <putc>
    4c88:	8b26                	mv	s6,s1
      state = 0;
    4c8a:	4981                	li	s3,0
    4c8c:	bd75                	j	4b48 <vprintf+0x60>
        putc(fd, c);
    4c8e:	85d2                	mv	a1,s4
    4c90:	8556                	mv	a0,s5
    4c92:	00000097          	auipc	ra,0x0
    4c96:	d88080e7          	jalr	-632(ra) # 4a1a <putc>
      state = 0;
    4c9a:	4981                	li	s3,0
    4c9c:	b575                	j	4b48 <vprintf+0x60>
        s = va_arg(ap, char*);
    4c9e:	8b4e                	mv	s6,s3
      state = 0;
    4ca0:	4981                	li	s3,0
    4ca2:	b55d                	j	4b48 <vprintf+0x60>
    }
  }
}
    4ca4:	70e6                	ld	ra,120(sp)
    4ca6:	7446                	ld	s0,112(sp)
    4ca8:	74a6                	ld	s1,104(sp)
    4caa:	7906                	ld	s2,96(sp)
    4cac:	69e6                	ld	s3,88(sp)
    4cae:	6a46                	ld	s4,80(sp)
    4cb0:	6aa6                	ld	s5,72(sp)
    4cb2:	6b06                	ld	s6,64(sp)
    4cb4:	7be2                	ld	s7,56(sp)
    4cb6:	7c42                	ld	s8,48(sp)
    4cb8:	7ca2                	ld	s9,40(sp)
    4cba:	7d02                	ld	s10,32(sp)
    4cbc:	6de2                	ld	s11,24(sp)
    4cbe:	6109                	addi	sp,sp,128
    4cc0:	8082                	ret

0000000000004cc2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    4cc2:	715d                	addi	sp,sp,-80
    4cc4:	ec06                	sd	ra,24(sp)
    4cc6:	e822                	sd	s0,16(sp)
    4cc8:	1000                	addi	s0,sp,32
    4cca:	e010                	sd	a2,0(s0)
    4ccc:	e414                	sd	a3,8(s0)
    4cce:	e818                	sd	a4,16(s0)
    4cd0:	ec1c                	sd	a5,24(s0)
    4cd2:	03043023          	sd	a6,32(s0)
    4cd6:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    4cda:	8622                	mv	a2,s0
    4cdc:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    4ce0:	00000097          	auipc	ra,0x0
    4ce4:	e08080e7          	jalr	-504(ra) # 4ae8 <vprintf>
}
    4ce8:	60e2                	ld	ra,24(sp)
    4cea:	6442                	ld	s0,16(sp)
    4cec:	6161                	addi	sp,sp,80
    4cee:	8082                	ret

0000000000004cf0 <printf>:

void
printf(const char *fmt, ...)
{
    4cf0:	711d                	addi	sp,sp,-96
    4cf2:	ec06                	sd	ra,24(sp)
    4cf4:	e822                	sd	s0,16(sp)
    4cf6:	1000                	addi	s0,sp,32
    4cf8:	e40c                	sd	a1,8(s0)
    4cfa:	e810                	sd	a2,16(s0)
    4cfc:	ec14                	sd	a3,24(s0)
    4cfe:	f018                	sd	a4,32(s0)
    4d00:	f41c                	sd	a5,40(s0)
    4d02:	03043823          	sd	a6,48(s0)
    4d06:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    4d0a:	00840613          	addi	a2,s0,8
    4d0e:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    4d12:	85aa                	mv	a1,a0
    4d14:	4505                	li	a0,1
    4d16:	00000097          	auipc	ra,0x0
    4d1a:	dd2080e7          	jalr	-558(ra) # 4ae8 <vprintf>
}
    4d1e:	60e2                	ld	ra,24(sp)
    4d20:	6442                	ld	s0,16(sp)
    4d22:	6125                	addi	sp,sp,96
    4d24:	8082                	ret

0000000000004d26 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4d26:	1141                	addi	sp,sp,-16
    4d28:	e422                	sd	s0,8(sp)
    4d2a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4d2c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4d30:	00007797          	auipc	a5,0x7
    4d34:	33878793          	addi	a5,a5,824 # c068 <freep>
    4d38:	639c                	ld	a5,0(a5)
    4d3a:	a805                	j	4d6a <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    4d3c:	4618                	lw	a4,8(a2)
    4d3e:	9db9                	addw	a1,a1,a4
    4d40:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    4d44:	6398                	ld	a4,0(a5)
    4d46:	6318                	ld	a4,0(a4)
    4d48:	fee53823          	sd	a4,-16(a0)
    4d4c:	a091                	j	4d90 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    4d4e:	ff852703          	lw	a4,-8(a0)
    4d52:	9e39                	addw	a2,a2,a4
    4d54:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    4d56:	ff053703          	ld	a4,-16(a0)
    4d5a:	e398                	sd	a4,0(a5)
    4d5c:	a099                	j	4da2 <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4d5e:	6398                	ld	a4,0(a5)
    4d60:	00e7e463          	bltu	a5,a4,4d68 <free+0x42>
    4d64:	00e6ea63          	bltu	a3,a4,4d78 <free+0x52>
{
    4d68:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4d6a:	fed7fae3          	bleu	a3,a5,4d5e <free+0x38>
    4d6e:	6398                	ld	a4,0(a5)
    4d70:	00e6e463          	bltu	a3,a4,4d78 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4d74:	fee7eae3          	bltu	a5,a4,4d68 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
    4d78:	ff852583          	lw	a1,-8(a0)
    4d7c:	6390                	ld	a2,0(a5)
    4d7e:	02059713          	slli	a4,a1,0x20
    4d82:	9301                	srli	a4,a4,0x20
    4d84:	0712                	slli	a4,a4,0x4
    4d86:	9736                	add	a4,a4,a3
    4d88:	fae60ae3          	beq	a2,a4,4d3c <free+0x16>
    bp->s.ptr = p->s.ptr;
    4d8c:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    4d90:	4790                	lw	a2,8(a5)
    4d92:	02061713          	slli	a4,a2,0x20
    4d96:	9301                	srli	a4,a4,0x20
    4d98:	0712                	slli	a4,a4,0x4
    4d9a:	973e                	add	a4,a4,a5
    4d9c:	fae689e3          	beq	a3,a4,4d4e <free+0x28>
  } else
    p->s.ptr = bp;
    4da0:	e394                	sd	a3,0(a5)
  freep = p;
    4da2:	00007717          	auipc	a4,0x7
    4da6:	2cf73323          	sd	a5,710(a4) # c068 <freep>
}
    4daa:	6422                	ld	s0,8(sp)
    4dac:	0141                	addi	sp,sp,16
    4dae:	8082                	ret

0000000000004db0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4db0:	7139                	addi	sp,sp,-64
    4db2:	fc06                	sd	ra,56(sp)
    4db4:	f822                	sd	s0,48(sp)
    4db6:	f426                	sd	s1,40(sp)
    4db8:	f04a                	sd	s2,32(sp)
    4dba:	ec4e                	sd	s3,24(sp)
    4dbc:	e852                	sd	s4,16(sp)
    4dbe:	e456                	sd	s5,8(sp)
    4dc0:	e05a                	sd	s6,0(sp)
    4dc2:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4dc4:	02051993          	slli	s3,a0,0x20
    4dc8:	0209d993          	srli	s3,s3,0x20
    4dcc:	09bd                	addi	s3,s3,15
    4dce:	0049d993          	srli	s3,s3,0x4
    4dd2:	2985                	addiw	s3,s3,1
    4dd4:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
    4dd8:	00007797          	auipc	a5,0x7
    4ddc:	29078793          	addi	a5,a5,656 # c068 <freep>
    4de0:	6388                	ld	a0,0(a5)
    4de2:	c515                	beqz	a0,4e0e <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4de4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    4de6:	4798                	lw	a4,8(a5)
    4de8:	03277d63          	bleu	s2,a4,4e22 <malloc+0x72>
    4dec:	8a4e                	mv	s4,s3
    4dee:	0009871b          	sext.w	a4,s3
    4df2:	6685                	lui	a3,0x1
    4df4:	00d77363          	bleu	a3,a4,4dfa <malloc+0x4a>
    4df8:	6a05                	lui	s4,0x1
    4dfa:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
    4dfe:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4e02:	00007497          	auipc	s1,0x7
    4e06:	26648493          	addi	s1,s1,614 # c068 <freep>
  if(p == (char*)-1)
    4e0a:	5b7d                	li	s6,-1
    4e0c:	a0b5                	j	4e78 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
    4e0e:	00007717          	auipc	a4,0x7
    4e12:	26270713          	addi	a4,a4,610 # c070 <base>
    4e16:	e398                	sd	a4,0(a5)
    4e18:	e798                	sd	a4,8(a5)
    base.s.size = 0;
    4e1a:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4e1e:	87ba                	mv	a5,a4
    4e20:	b7f1                	j	4dec <malloc+0x3c>
      if(p->s.size == nunits)
    4e22:	02e90b63          	beq	s2,a4,4e58 <malloc+0xa8>
        p->s.size -= nunits;
    4e26:	4137073b          	subw	a4,a4,s3
    4e2a:	c798                	sw	a4,8(a5)
        p += p->s.size;
    4e2c:	1702                	slli	a4,a4,0x20
    4e2e:	9301                	srli	a4,a4,0x20
    4e30:	0712                	slli	a4,a4,0x4
    4e32:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    4e34:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    4e38:	00007717          	auipc	a4,0x7
    4e3c:	22a73823          	sd	a0,560(a4) # c068 <freep>
      return (void*)(p + 1);
    4e40:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    4e44:	70e2                	ld	ra,56(sp)
    4e46:	7442                	ld	s0,48(sp)
    4e48:	74a2                	ld	s1,40(sp)
    4e4a:	7902                	ld	s2,32(sp)
    4e4c:	69e2                	ld	s3,24(sp)
    4e4e:	6a42                	ld	s4,16(sp)
    4e50:	6aa2                	ld	s5,8(sp)
    4e52:	6b02                	ld	s6,0(sp)
    4e54:	6121                	addi	sp,sp,64
    4e56:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    4e58:	6398                	ld	a4,0(a5)
    4e5a:	e118                	sd	a4,0(a0)
    4e5c:	bff1                	j	4e38 <malloc+0x88>
  hp->s.size = nu;
    4e5e:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
    4e62:	0541                	addi	a0,a0,16
    4e64:	00000097          	auipc	ra,0x0
    4e68:	ec2080e7          	jalr	-318(ra) # 4d26 <free>
  return freep;
    4e6c:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
    4e6e:	d979                	beqz	a0,4e44 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4e70:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    4e72:	4798                	lw	a4,8(a5)
    4e74:	fb2777e3          	bleu	s2,a4,4e22 <malloc+0x72>
    if(p == freep)
    4e78:	6098                	ld	a4,0(s1)
    4e7a:	853e                	mv	a0,a5
    4e7c:	fef71ae3          	bne	a4,a5,4e70 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
    4e80:	8552                	mv	a0,s4
    4e82:	00000097          	auipc	ra,0x0
    4e86:	b38080e7          	jalr	-1224(ra) # 49ba <sbrk>
  if(p == (char*)-1)
    4e8a:	fd651ae3          	bne	a0,s6,4e5e <malloc+0xae>
        return 0;
    4e8e:	4501                	li	a0,0
    4e90:	bf55                	j	4e44 <malloc+0x94>
