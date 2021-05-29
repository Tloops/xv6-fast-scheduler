
xv6-user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <checkenvname>:

char mycwd[128];

int
checkenvname(char* s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e422                	sd	s0,8(sp)
       4:	0800                	addi	s0,sp,16
  if((*s >= 'A' && *s <= 'Z') ||
       6:	00054683          	lbu	a3,0(a0)
       a:	fdf6f793          	andi	a5,a3,-33
       e:	fbf7879b          	addiw	a5,a5,-65
      12:	0ff7f793          	andi	a5,a5,255
      16:	4765                	li	a4,25
      18:	00f77763          	bleu	a5,a4,26 <checkenvname+0x26>
     (*s >= 'a' && *s <= 'z') ||
      1c:	05f00793          	li	a5,95
      *s == '_')
    ;
  else
    return 0;
      20:	4701                	li	a4,0
     (*s >= 'a' && *s <= 'z') ||
      22:	02f69d63          	bne	a3,a5,5c <checkenvname+0x5c>
  char *tmp = s + 1;
      26:	00150713          	addi	a4,a0,1
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      2a:	4665                	li	a2,25
        (*tmp >= 'a' && *tmp <= 'z') ||
      2c:	45a5                	li	a1,9
        (*tmp >= '0' && *tmp <= '9') ||
      2e:	05f00813          	li	a6,95
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      32:	a011                	j	36 <checkenvname+0x36>
         *tmp == '_')
    tmp++;
      34:	0705                	addi	a4,a4,1
  while((*tmp >= 'A' && *tmp <= 'Z') ||
      36:	00074683          	lbu	a3,0(a4)
      3a:	fdf6f793          	andi	a5,a3,-33
      3e:	fbf7879b          	addiw	a5,a5,-65
      42:	0ff7f793          	andi	a5,a5,255
      46:	fef677e3          	bleu	a5,a2,34 <checkenvname+0x34>
        (*tmp >= '0' && *tmp <= '9') ||
      4a:	fd06879b          	addiw	a5,a3,-48
        (*tmp >= 'a' && *tmp <= 'z') ||
      4e:	0ff7f793          	andi	a5,a5,255
      52:	fef5f1e3          	bleu	a5,a1,34 <checkenvname+0x34>
        (*tmp >= '0' && *tmp <= '9') ||
      56:	fd068fe3          	beq	a3,a6,34 <checkenvname+0x34>
  return (int)(tmp - s);
      5a:	9f09                	subw	a4,a4,a0
}
      5c:	853a                	mv	a0,a4
      5e:	6422                	ld	s0,8(sp)
      60:	0141                	addi	sp,sp,16
      62:	8082                	ret

0000000000000064 <export>:

int
export(char *argv[])
{
      64:	7131                	addi	sp,sp,-192
      66:	fd06                	sd	ra,184(sp)
      68:	f922                	sd	s0,176(sp)
      6a:	f526                	sd	s1,168(sp)
      6c:	f14a                	sd	s2,160(sp)
      6e:	ed4e                	sd	s3,152(sp)
      70:	e952                	sd	s4,144(sp)
      72:	e556                	sd	s5,136(sp)
      74:	e15a                	sd	s6,128(sp)
      76:	0180                	addi	s0,sp,192
      78:	84aa                	mv	s1,a0
  if(!strcmp(argv[1], "-p"))
      7a:	00002597          	auipc	a1,0x2
      7e:	81658593          	addi	a1,a1,-2026 # 1890 <malloc+0x118>
      82:	6508                	ld	a0,8(a0)
      84:	00001097          	auipc	ra,0x1
      88:	ffe080e7          	jalr	-2(ra) # 1082 <strcmp>
      8c:	e125                	bnez	a0,ec <export+0x88>
      8e:	89aa                	mv	s3,a0
  { // print all the env vars
    if(!nenv)
      90:	00002797          	auipc	a5,0x2
      94:	9e078793          	addi	a5,a5,-1568 # 1a70 <_edata>
      98:	0007ab03          	lw	s6,0(a5)
      9c:	020b0e63          	beqz	s6,d8 <export+0x74>
    {
      printf("NO env var exported\n");
      return 0;
    }
    for(int i=0; i<nenv; i++)
      a0:	00002497          	auipc	s1,0x2
      a4:	ac048493          	addi	s1,s1,-1344 # 1b60 <envs>
      a8:	892a                	mv	s2,a0
      printf("export %s=%s\n", envs[i].name, envs[i].value);
      aa:	00002a97          	auipc	s5,0x2
      ae:	806a8a93          	addi	s5,s5,-2042 # 18b0 <malloc+0x138>
    for(int i=0; i<nenv; i++)
      b2:	8a3e                	mv	s4,a5
      b4:	0f605e63          	blez	s6,1b0 <export+0x14c>
      printf("export %s=%s\n", envs[i].name, envs[i].value);
      b8:	02048613          	addi	a2,s1,32
      bc:	85a6                	mv	a1,s1
      be:	8556                	mv	a0,s5
      c0:	00001097          	auipc	ra,0x1
      c4:	5f8080e7          	jalr	1528(ra) # 16b8 <printf>
    for(int i=0; i<nenv; i++)
      c8:	2905                	addiw	s2,s2,1
      ca:	08048493          	addi	s1,s1,128
      ce:	000a2783          	lw	a5,0(s4)
      d2:	fef943e3          	blt	s2,a5,b8 <export+0x54>
      d6:	a8e9                	j	1b0 <export+0x14c>
      printf("NO env var exported\n");
      d8:	00001517          	auipc	a0,0x1
      dc:	7c050513          	addi	a0,a0,1984 # 1898 <malloc+0x120>
      e0:	00001097          	auipc	ra,0x1
      e4:	5d8080e7          	jalr	1496(ra) # 16b8 <printf>
      return 0;
      e8:	89da                	mv	s3,s6
      ea:	a0d9                	j	1b0 <export+0x14c>
    return 0;
  }
  else if(nenv == NENVS)
      ec:	00002797          	auipc	a5,0x2
      f0:	98478793          	addi	a5,a5,-1660 # 1a70 <_edata>
      f4:	0007a983          	lw	s3,0(a5)
      f8:	47c1                	li	a5,16
      fa:	0cf98663          	beq	s3,a5,1c6 <export+0x162>
  {
    fprintf(2, "too many env vars\n");
    return -1;
  }
  char name[32], value[96];
  char *s = argv[1], *t = name;
      fe:	0084b903          	ld	s2,8(s1)

  for(s=argv[1], t=name; (*t=*s++)!='='; t++)
     102:	00190493          	addi	s1,s2,1
     106:	00094783          	lbu	a5,0(s2)
     10a:	faf40023          	sb	a5,-96(s0)
     10e:	03d00713          	li	a4,61
     112:	0ce78563          	beq	a5,a4,1dc <export+0x178>
     116:	fa040793          	addi	a5,s0,-96
     11a:	03d00693          	li	a3,61
     11e:	0785                	addi	a5,a5,1
     120:	0485                	addi	s1,s1,1
     122:	fff4c703          	lbu	a4,-1(s1)
     126:	00e78023          	sb	a4,0(a5)
     12a:	fed71ae3          	bne	a4,a3,11e <export+0xba>
    ;
  *t = 0;
     12e:	00078023          	sb	zero,0(a5)

  if(checkenvname(name) != ((s - argv[1]) - 1))
     132:	fa040513          	addi	a0,s0,-96
     136:	00000097          	auipc	ra,0x0
     13a:	eca080e7          	jalr	-310(ra) # 0 <checkenvname>
     13e:	41248933          	sub	s2,s1,s2
     142:	197d                	addi	s2,s2,-1
     144:	09251f63          	bne	a0,s2,1e2 <export+0x17e>
  {
    fprintf(2, "Invalid NAME!\n");
    return -1;
  }
  for(t=value; (*t=*s); s++, t++)
     148:	0004c703          	lbu	a4,0(s1)
     14c:	f4e40023          	sb	a4,-192(s0)
     150:	f4040793          	addi	a5,s0,-192
     154:	cb01                	beqz	a4,164 <export+0x100>
     156:	0485                	addi	s1,s1,1
     158:	0785                	addi	a5,a5,1
     15a:	0004c703          	lbu	a4,0(s1)
     15e:	00e78023          	sb	a4,0(a5)
     162:	fb75                	bnez	a4,156 <export+0xf2>
    ;
  if(*--t == '/')
     164:	fff7c683          	lbu	a3,-1(a5)
     168:	02f00713          	li	a4,47
     16c:	08e68663          	beq	a3,a4,1f8 <export+0x194>
    *t = 0;
  
  strcpy(envs[nenv].name, name);
     170:	00799513          	slli	a0,s3,0x7
     174:	00002917          	auipc	s2,0x2
     178:	9ec90913          	addi	s2,s2,-1556 # 1b60 <envs>
     17c:	fa040593          	addi	a1,s0,-96
     180:	954a                	add	a0,a0,s2
     182:	00001097          	auipc	ra,0x1
     186:	eb6080e7          	jalr	-330(ra) # 1038 <strcpy>
  strcpy(envs[nenv].value, value);
     18a:	00002497          	auipc	s1,0x2
     18e:	8e648493          	addi	s1,s1,-1818 # 1a70 <_edata>
     192:	4088                	lw	a0,0(s1)
     194:	051e                	slli	a0,a0,0x7
     196:	02050513          	addi	a0,a0,32
     19a:	f4040593          	addi	a1,s0,-192
     19e:	954a                	add	a0,a0,s2
     1a0:	00001097          	auipc	ra,0x1
     1a4:	e98080e7          	jalr	-360(ra) # 1038 <strcpy>
  nenv++;
     1a8:	409c                	lw	a5,0(s1)
     1aa:	2785                	addiw	a5,a5,1
     1ac:	c09c                	sw	a5,0(s1)
  return 0;
     1ae:	4981                	li	s3,0
}
     1b0:	854e                	mv	a0,s3
     1b2:	70ea                	ld	ra,184(sp)
     1b4:	744a                	ld	s0,176(sp)
     1b6:	74aa                	ld	s1,168(sp)
     1b8:	790a                	ld	s2,160(sp)
     1ba:	69ea                	ld	s3,152(sp)
     1bc:	6a4a                	ld	s4,144(sp)
     1be:	6aaa                	ld	s5,136(sp)
     1c0:	6b0a                	ld	s6,128(sp)
     1c2:	6129                	addi	sp,sp,192
     1c4:	8082                	ret
    fprintf(2, "too many env vars\n");
     1c6:	00001597          	auipc	a1,0x1
     1ca:	6fa58593          	addi	a1,a1,1786 # 18c0 <malloc+0x148>
     1ce:	4509                	li	a0,2
     1d0:	00001097          	auipc	ra,0x1
     1d4:	4ba080e7          	jalr	1210(ra) # 168a <fprintf>
    return -1;
     1d8:	59fd                	li	s3,-1
     1da:	bfd9                	j	1b0 <export+0x14c>
  for(s=argv[1], t=name; (*t=*s++)!='='; t++)
     1dc:	fa040793          	addi	a5,s0,-96
     1e0:	b7b9                	j	12e <export+0xca>
    fprintf(2, "Invalid NAME!\n");
     1e2:	00001597          	auipc	a1,0x1
     1e6:	6f658593          	addi	a1,a1,1782 # 18d8 <malloc+0x160>
     1ea:	4509                	li	a0,2
     1ec:	00001097          	auipc	ra,0x1
     1f0:	49e080e7          	jalr	1182(ra) # 168a <fprintf>
    return -1;
     1f4:	59fd                	li	s3,-1
     1f6:	bf6d                	j	1b0 <export+0x14c>
    *t = 0;
     1f8:	fe078fa3          	sb	zero,-1(a5)
     1fc:	bf95                	j	170 <export+0x10c>

00000000000001fe <replace>:

int
replace(char *buf)
{
     1fe:	7111                	addi	sp,sp,-256
     200:	fd86                	sd	ra,248(sp)
     202:	f9a2                	sd	s0,240(sp)
     204:	f5a6                	sd	s1,232(sp)
     206:	f1ca                	sd	s2,224(sp)
     208:	edce                	sd	s3,216(sp)
     20a:	e9d2                	sd	s4,208(sp)
     20c:	e5d6                	sd	s5,200(sp)
     20e:	e1da                	sd	s6,192(sp)
     210:	fd5e                	sd	s7,184(sp)
     212:	f962                	sd	s8,176(sp)
     214:	f566                	sd	s9,168(sp)
     216:	f16a                	sd	s10,160(sp)
     218:	ed6e                	sd	s11,152(sp)
     21a:	0200                	addi	s0,sp,256
     21c:	89aa                	mv	s3,a0
  char raw[100], name[32], *s, *t, *tmp;
  int n = 0;
  strcpy(raw, buf);
     21e:	85aa                	mv	a1,a0
     220:	f2840513          	addi	a0,s0,-216
     224:	00001097          	auipc	ra,0x1
     228:	e14080e7          	jalr	-492(ra) # 1038 <strcpy>
  for(s=raw, t=buf; (*t=*s); t++)
     22c:	f2844783          	lbu	a5,-216(s0)
     230:	00f98023          	sb	a5,0(s3)
     234:	c7f5                	beqz	a5,320 <replace+0x122>
  int n = 0;
     236:	4c81                	li	s9,0
  for(s=raw, t=buf; (*t=*s); t++)
     238:	f2840713          	addi	a4,s0,-216
  {
    if(*s++ == '$'){
     23c:	02400c13          	li	s8,36
      tmp = name;
      if((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || *s == '_')
     240:	4965                	li	s2,25
      {
        *tmp++ = *s++;
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     242:	4a25                	li	s4,9
     244:	05f00a93          	li	s5,95
          *tmp++ = *s++;
        *tmp = 0;
        for(int i=0; i<nenv; i++)
     248:	00002b17          	auipc	s6,0x2
     24c:	828b0b13          	addi	s6,s6,-2008 # 1a70 <_edata>
          if(!strcmp(name, envs[i].name))
     250:	f0840b93          	addi	s7,s0,-248
     254:	a03d                	j	282 <replace+0x84>
      if((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || *s == '_')
     256:	00174683          	lbu	a3,1(a4)
     25a:	fdf6f793          	andi	a5,a3,-33
     25e:	fbf7879b          	addiw	a5,a5,-65
     262:	0ff7f793          	andi	a5,a5,255
     266:	02f97563          	bleu	a5,s2,290 <replace+0x92>
     26a:	03568363          	beq	a3,s5,290 <replace+0x92>
            for(tmp=envs[i].value; (*t=*tmp); t++, tmp++)
              ;
        t--;
      }
      n++;
     26e:	2c85                	addiw	s9,s9,1
     270:	86ce                	mv	a3,s3
     272:	8726                	mv	a4,s1
  for(s=raw, t=buf; (*t=*s); t++)
     274:	00168993          	addi	s3,a3,1
     278:	00074783          	lbu	a5,0(a4)
     27c:	00f680a3          	sb	a5,1(a3)
     280:	c3cd                	beqz	a5,322 <replace+0x124>
    if(*s++ == '$'){
     282:	00170493          	addi	s1,a4,1
     286:	fd8788e3          	beq	a5,s8,256 <replace+0x58>
     28a:	86ce                	mv	a3,s3
     28c:	8726                	mv	a4,s1
     28e:	b7dd                	j	274 <replace+0x76>
        *tmp++ = *s++;
     290:	00270493          	addi	s1,a4,2
     294:	f0d40423          	sb	a3,-248(s0)
     298:	f0940693          	addi	a3,s0,-247
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     29c:	a029                	j	2a6 <replace+0xa8>
          *tmp++ = *s++;
     29e:	0485                	addi	s1,s1,1
     2a0:	0685                	addi	a3,a3,1
     2a2:	fee68fa3          	sb	a4,-1(a3)
        while((*s >= 'A' && *s <= 'Z') || (*s >= 'a' && *s <= 'z') || (*s >= '0' && *s <= '9') || *s == '_')
     2a6:	0004c703          	lbu	a4,0(s1)
     2aa:	fdf77793          	andi	a5,a4,-33
     2ae:	fbf7879b          	addiw	a5,a5,-65
     2b2:	0ff7f793          	andi	a5,a5,255
     2b6:	fef974e3          	bleu	a5,s2,29e <replace+0xa0>
     2ba:	fd07079b          	addiw	a5,a4,-48
     2be:	0ff7f793          	andi	a5,a5,255
     2c2:	fcfa7ee3          	bleu	a5,s4,29e <replace+0xa0>
     2c6:	fd570ce3          	beq	a4,s5,29e <replace+0xa0>
        *tmp = 0;
     2ca:	00068023          	sb	zero,0(a3)
        for(int i=0; i<nenv; i++)
     2ce:	000b2783          	lw	a5,0(s6)
     2d2:	04f05563          	blez	a5,31c <replace+0x11e>
     2d6:	00002d17          	auipc	s10,0x2
     2da:	88ad0d13          	addi	s10,s10,-1910 # 1b60 <envs>
     2de:	4d81                	li	s11,0
     2e0:	a801                	j	2f0 <replace+0xf2>
     2e2:	2d85                	addiw	s11,s11,1
     2e4:	080d0d13          	addi	s10,s10,128
     2e8:	000b2783          	lw	a5,0(s6)
     2ec:	02fdd863          	ble	a5,s11,31c <replace+0x11e>
          if(!strcmp(name, envs[i].name))
     2f0:	85ea                	mv	a1,s10
     2f2:	855e                	mv	a0,s7
     2f4:	00001097          	auipc	ra,0x1
     2f8:	d8e080e7          	jalr	-626(ra) # 1082 <strcmp>
     2fc:	f17d                	bnez	a0,2e2 <replace+0xe4>
            for(tmp=envs[i].value; (*t=*tmp); t++, tmp++)
     2fe:	020d0793          	addi	a5,s10,32
     302:	020d4703          	lbu	a4,32(s10)
     306:	00e98023          	sb	a4,0(s3)
     30a:	df61                	beqz	a4,2e2 <replace+0xe4>
     30c:	0985                	addi	s3,s3,1
     30e:	0785                	addi	a5,a5,1
     310:	0007c703          	lbu	a4,0(a5)
     314:	00e98023          	sb	a4,0(s3)
     318:	fb75                	bnez	a4,30c <replace+0x10e>
     31a:	b7e1                	j	2e2 <replace+0xe4>
        t--;
     31c:	19fd                	addi	s3,s3,-1
     31e:	bf81                	j	26e <replace+0x70>
  int n = 0;
     320:	4c81                	li	s9,0
    }
  }
  return n;
}
     322:	8566                	mv	a0,s9
     324:	70ee                	ld	ra,248(sp)
     326:	744e                	ld	s0,240(sp)
     328:	74ae                	ld	s1,232(sp)
     32a:	790e                	ld	s2,224(sp)
     32c:	69ee                	ld	s3,216(sp)
     32e:	6a4e                	ld	s4,208(sp)
     330:	6aae                	ld	s5,200(sp)
     332:	6b0e                	ld	s6,192(sp)
     334:	7bea                	ld	s7,184(sp)
     336:	7c4a                	ld	s8,176(sp)
     338:	7caa                	ld	s9,168(sp)
     33a:	7d0a                	ld	s10,160(sp)
     33c:	6dea                	ld	s11,152(sp)
     33e:	6111                	addi	sp,sp,256
     340:	8082                	ret

0000000000000342 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
     342:	1101                	addi	sp,sp,-32
     344:	ec06                	sd	ra,24(sp)
     346:	e822                	sd	s0,16(sp)
     348:	e426                	sd	s1,8(sp)
     34a:	e04a                	sd	s2,0(sp)
     34c:	1000                	addi	s0,sp,32
     34e:	84aa                	mv	s1,a0
     350:	892e                	mv	s2,a1
  fprintf(2, "-> %s $ ", mycwd);
     352:	00001617          	auipc	a2,0x1
     356:	72660613          	addi	a2,a2,1830 # 1a78 <mycwd>
     35a:	00001597          	auipc	a1,0x1
     35e:	58e58593          	addi	a1,a1,1422 # 18e8 <malloc+0x170>
     362:	4509                	li	a0,2
     364:	00001097          	auipc	ra,0x1
     368:	326080e7          	jalr	806(ra) # 168a <fprintf>
  memset(buf, 0, nbuf);
     36c:	864a                	mv	a2,s2
     36e:	4581                	li	a1,0
     370:	8526                	mv	a0,s1
     372:	00001097          	auipc	ra,0x1
     376:	d6e080e7          	jalr	-658(ra) # 10e0 <memset>
  gets(buf, nbuf);
     37a:	85ca                	mv	a1,s2
     37c:	8526                	mv	a0,s1
     37e:	00001097          	auipc	ra,0x1
     382:	db2080e7          	jalr	-590(ra) # 1130 <gets>
  if(buf[0] == 0) // EOF
     386:	0004c503          	lbu	a0,0(s1)
     38a:	00153513          	seqz	a0,a0
     38e:	40a0053b          	negw	a0,a0
    return -1;
  return 0;
}
     392:	2501                	sext.w	a0,a0
     394:	60e2                	ld	ra,24(sp)
     396:	6442                	ld	s0,16(sp)
     398:	64a2                	ld	s1,8(sp)
     39a:	6902                	ld	s2,0(sp)
     39c:	6105                	addi	sp,sp,32
     39e:	8082                	ret

00000000000003a0 <panic>:
  exit(0);
}

void
panic(char *s)
{
     3a0:	1141                	addi	sp,sp,-16
     3a2:	e406                	sd	ra,8(sp)
     3a4:	e022                	sd	s0,0(sp)
     3a6:	0800                	addi	s0,sp,16
  fprintf(2, "%s\n", s);
     3a8:	862a                	mv	a2,a0
     3aa:	00001597          	auipc	a1,0x1
     3ae:	54e58593          	addi	a1,a1,1358 # 18f8 <malloc+0x180>
     3b2:	4509                	li	a0,2
     3b4:	00001097          	auipc	ra,0x1
     3b8:	2d6080e7          	jalr	726(ra) # 168a <fprintf>
  exit(1);
     3bc:	4505                	li	a0,1
     3be:	00001097          	auipc	ra,0x1
     3c2:	f54080e7          	jalr	-172(ra) # 1312 <exit>

00000000000003c6 <fork1>:
}

int
fork1(void)
{
     3c6:	1141                	addi	sp,sp,-16
     3c8:	e406                	sd	ra,8(sp)
     3ca:	e022                	sd	s0,0(sp)
     3cc:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
     3ce:	00001097          	auipc	ra,0x1
     3d2:	f3c080e7          	jalr	-196(ra) # 130a <fork>
  if(pid == -1)
     3d6:	57fd                	li	a5,-1
     3d8:	00f50663          	beq	a0,a5,3e4 <fork1+0x1e>
    panic("fork");
  return pid;
}
     3dc:	60a2                	ld	ra,8(sp)
     3de:	6402                	ld	s0,0(sp)
     3e0:	0141                	addi	sp,sp,16
     3e2:	8082                	ret
    panic("fork");
     3e4:	00001517          	auipc	a0,0x1
     3e8:	51c50513          	addi	a0,a0,1308 # 1900 <malloc+0x188>
     3ec:	00000097          	auipc	ra,0x0
     3f0:	fb4080e7          	jalr	-76(ra) # 3a0 <panic>

00000000000003f4 <runcmd>:
{
     3f4:	7135                	addi	sp,sp,-160
     3f6:	ed06                	sd	ra,152(sp)
     3f8:	e922                	sd	s0,144(sp)
     3fa:	e526                	sd	s1,136(sp)
     3fc:	e14a                	sd	s2,128(sp)
     3fe:	fcce                	sd	s3,120(sp)
     400:	f8d2                	sd	s4,112(sp)
     402:	f4d6                	sd	s5,104(sp)
     404:	f0da                	sd	s6,96(sp)
     406:	ecde                	sd	s7,88(sp)
     408:	1100                	addi	s0,sp,160
  if(cmd == 0)
     40a:	c10d                	beqz	a0,42c <runcmd+0x38>
     40c:	84aa                	mv	s1,a0
  switch(cmd->type){
     40e:	4118                	lw	a4,0(a0)
     410:	4795                	li	a5,5
     412:	02e7e263          	bltu	a5,a4,436 <runcmd+0x42>
     416:	00056783          	lwu	a5,0(a0)
     41a:	078a                	slli	a5,a5,0x2
     41c:	00001717          	auipc	a4,0x1
     420:	44470713          	addi	a4,a4,1092 # 1860 <malloc+0xe8>
     424:	97ba                	add	a5,a5,a4
     426:	439c                	lw	a5,0(a5)
     428:	97ba                	add	a5,a5,a4
     42a:	8782                	jr	a5
    exit(1);
     42c:	4505                	li	a0,1
     42e:	00001097          	auipc	ra,0x1
     432:	ee4080e7          	jalr	-284(ra) # 1312 <exit>
    panic("runcmd");
     436:	00001517          	auipc	a0,0x1
     43a:	4d250513          	addi	a0,a0,1234 # 1908 <malloc+0x190>
     43e:	00000097          	auipc	ra,0x0
     442:	f62080e7          	jalr	-158(ra) # 3a0 <panic>
    if(ecmd->argv[0] == 0)
     446:	6508                	ld	a0,8(a0)
     448:	c15d                	beqz	a0,4ee <runcmd+0xfa>
    exec(ecmd->argv[0], ecmd->argv);
     44a:	00848a13          	addi	s4,s1,8
     44e:	85d2                	mv	a1,s4
     450:	00001097          	auipc	ra,0x1
     454:	efa080e7          	jalr	-262(ra) # 134a <exec>
    for(i=0; i<nenv; i++)
     458:	00001797          	auipc	a5,0x1
     45c:	61878793          	addi	a5,a5,1560 # 1a70 <_edata>
     460:	439c                	lw	a5,0(a5)
     462:	06f05763          	blez	a5,4d0 <runcmd+0xdc>
     466:	00001917          	auipc	s2,0x1
     46a:	71b90913          	addi	s2,s2,1819 # 1b81 <envs+0x21>
     46e:	4981                	li	s3,0
      *s_tmp++ = '/';
     470:	02f00b93          	li	s7,47
      exec(env_cmd, ecmd->argv);
     474:	f6840b13          	addi	s6,s0,-152
    for(i=0; i<nenv; i++)
     478:	00001a97          	auipc	s5,0x1
     47c:	5f8a8a93          	addi	s5,s5,1528 # 1a70 <_edata>
      while((*s_tmp = *d_tmp++))
     480:	874a                	mv	a4,s2
     482:	fff94783          	lbu	a5,-1(s2)
     486:	f6f40423          	sb	a5,-152(s0)
     48a:	c7bd                	beqz	a5,4f8 <runcmd+0x104>
      char *s_tmp = env_cmd;
     48c:	f6840793          	addi	a5,s0,-152
        s_tmp++;
     490:	0785                	addi	a5,a5,1
      while((*s_tmp = *d_tmp++))
     492:	0705                	addi	a4,a4,1
     494:	fff74683          	lbu	a3,-1(a4)
     498:	00d78023          	sb	a3,0(a5)
     49c:	faf5                	bnez	a3,490 <runcmd+0x9c>
      *s_tmp++ = '/';
     49e:	00178713          	addi	a4,a5,1
     4a2:	01778023          	sb	s7,0(a5)
      d_tmp = ecmd->argv[0];
     4a6:	649c                	ld	a5,8(s1)
      while((*s_tmp++ = *d_tmp++))
     4a8:	0785                	addi	a5,a5,1
     4aa:	0705                	addi	a4,a4,1
     4ac:	fff7c683          	lbu	a3,-1(a5)
     4b0:	fed70fa3          	sb	a3,-1(a4)
     4b4:	faf5                	bnez	a3,4a8 <runcmd+0xb4>
      exec(env_cmd, ecmd->argv);
     4b6:	85d2                	mv	a1,s4
     4b8:	855a                	mv	a0,s6
     4ba:	00001097          	auipc	ra,0x1
     4be:	e90080e7          	jalr	-368(ra) # 134a <exec>
    for(i=0; i<nenv; i++)
     4c2:	2985                	addiw	s3,s3,1
     4c4:	08090913          	addi	s2,s2,128
     4c8:	000aa783          	lw	a5,0(s5)
     4cc:	faf9cae3          	blt	s3,a5,480 <runcmd+0x8c>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     4d0:	6490                	ld	a2,8(s1)
     4d2:	00001597          	auipc	a1,0x1
     4d6:	43e58593          	addi	a1,a1,1086 # 1910 <malloc+0x198>
     4da:	4509                	li	a0,2
     4dc:	00001097          	auipc	ra,0x1
     4e0:	1ae080e7          	jalr	430(ra) # 168a <fprintf>
  exit(0);
     4e4:	4501                	li	a0,0
     4e6:	00001097          	auipc	ra,0x1
     4ea:	e2c080e7          	jalr	-468(ra) # 1312 <exit>
      exit(1);
     4ee:	4505                	li	a0,1
     4f0:	00001097          	auipc	ra,0x1
     4f4:	e22080e7          	jalr	-478(ra) # 1312 <exit>
      char *s_tmp = env_cmd;
     4f8:	f6840793          	addi	a5,s0,-152
     4fc:	b74d                	j	49e <runcmd+0xaa>
    close(rcmd->fd);
     4fe:	5148                	lw	a0,36(a0)
     500:	00001097          	auipc	ra,0x1
     504:	e3a080e7          	jalr	-454(ra) # 133a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     508:	508c                	lw	a1,32(s1)
     50a:	6888                	ld	a0,16(s1)
     50c:	00001097          	auipc	ra,0x1
     510:	e46080e7          	jalr	-442(ra) # 1352 <open>
     514:	00054763          	bltz	a0,522 <runcmd+0x12e>
    runcmd(rcmd->cmd);
     518:	6488                	ld	a0,8(s1)
     51a:	00000097          	auipc	ra,0x0
     51e:	eda080e7          	jalr	-294(ra) # 3f4 <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     522:	6890                	ld	a2,16(s1)
     524:	00001597          	auipc	a1,0x1
     528:	3fc58593          	addi	a1,a1,1020 # 1920 <malloc+0x1a8>
     52c:	4509                	li	a0,2
     52e:	00001097          	auipc	ra,0x1
     532:	15c080e7          	jalr	348(ra) # 168a <fprintf>
      exit(1);
     536:	4505                	li	a0,1
     538:	00001097          	auipc	ra,0x1
     53c:	dda080e7          	jalr	-550(ra) # 1312 <exit>
    if(fork1() == 0)
     540:	00000097          	auipc	ra,0x0
     544:	e86080e7          	jalr	-378(ra) # 3c6 <fork1>
     548:	c919                	beqz	a0,55e <runcmd+0x16a>
    wait(0);
     54a:	4501                	li	a0,0
     54c:	00001097          	auipc	ra,0x1
     550:	dce080e7          	jalr	-562(ra) # 131a <wait>
    runcmd(lcmd->right);
     554:	6888                	ld	a0,16(s1)
     556:	00000097          	auipc	ra,0x0
     55a:	e9e080e7          	jalr	-354(ra) # 3f4 <runcmd>
      runcmd(lcmd->left);
     55e:	6488                	ld	a0,8(s1)
     560:	00000097          	auipc	ra,0x0
     564:	e94080e7          	jalr	-364(ra) # 3f4 <runcmd>
    if(pipe(p) < 0)
     568:	fa840513          	addi	a0,s0,-88
     56c:	00001097          	auipc	ra,0x1
     570:	db6080e7          	jalr	-586(ra) # 1322 <pipe>
     574:	04054363          	bltz	a0,5ba <runcmd+0x1c6>
    if(fork1() == 0){
     578:	00000097          	auipc	ra,0x0
     57c:	e4e080e7          	jalr	-434(ra) # 3c6 <fork1>
     580:	c529                	beqz	a0,5ca <runcmd+0x1d6>
    if(fork1() == 0){
     582:	00000097          	auipc	ra,0x0
     586:	e44080e7          	jalr	-444(ra) # 3c6 <fork1>
     58a:	cd25                	beqz	a0,602 <runcmd+0x20e>
    close(p[0]);
     58c:	fa842503          	lw	a0,-88(s0)
     590:	00001097          	auipc	ra,0x1
     594:	daa080e7          	jalr	-598(ra) # 133a <close>
    close(p[1]);
     598:	fac42503          	lw	a0,-84(s0)
     59c:	00001097          	auipc	ra,0x1
     5a0:	d9e080e7          	jalr	-610(ra) # 133a <close>
    wait(0);
     5a4:	4501                	li	a0,0
     5a6:	00001097          	auipc	ra,0x1
     5aa:	d74080e7          	jalr	-652(ra) # 131a <wait>
    wait(0);
     5ae:	4501                	li	a0,0
     5b0:	00001097          	auipc	ra,0x1
     5b4:	d6a080e7          	jalr	-662(ra) # 131a <wait>
    break;
     5b8:	b735                	j	4e4 <runcmd+0xf0>
      panic("pipe");
     5ba:	00001517          	auipc	a0,0x1
     5be:	37650513          	addi	a0,a0,886 # 1930 <malloc+0x1b8>
     5c2:	00000097          	auipc	ra,0x0
     5c6:	dde080e7          	jalr	-546(ra) # 3a0 <panic>
      close(1);
     5ca:	4505                	li	a0,1
     5cc:	00001097          	auipc	ra,0x1
     5d0:	d6e080e7          	jalr	-658(ra) # 133a <close>
      dup(p[1]);
     5d4:	fac42503          	lw	a0,-84(s0)
     5d8:	00001097          	auipc	ra,0x1
     5dc:	d9a080e7          	jalr	-614(ra) # 1372 <dup>
      close(p[0]);
     5e0:	fa842503          	lw	a0,-88(s0)
     5e4:	00001097          	auipc	ra,0x1
     5e8:	d56080e7          	jalr	-682(ra) # 133a <close>
      close(p[1]);
     5ec:	fac42503          	lw	a0,-84(s0)
     5f0:	00001097          	auipc	ra,0x1
     5f4:	d4a080e7          	jalr	-694(ra) # 133a <close>
      runcmd(pcmd->left);
     5f8:	6488                	ld	a0,8(s1)
     5fa:	00000097          	auipc	ra,0x0
     5fe:	dfa080e7          	jalr	-518(ra) # 3f4 <runcmd>
      close(0);
     602:	00001097          	auipc	ra,0x1
     606:	d38080e7          	jalr	-712(ra) # 133a <close>
      dup(p[0]);
     60a:	fa842503          	lw	a0,-88(s0)
     60e:	00001097          	auipc	ra,0x1
     612:	d64080e7          	jalr	-668(ra) # 1372 <dup>
      close(p[0]);
     616:	fa842503          	lw	a0,-88(s0)
     61a:	00001097          	auipc	ra,0x1
     61e:	d20080e7          	jalr	-736(ra) # 133a <close>
      close(p[1]);
     622:	fac42503          	lw	a0,-84(s0)
     626:	00001097          	auipc	ra,0x1
     62a:	d14080e7          	jalr	-748(ra) # 133a <close>
      runcmd(pcmd->right);
     62e:	6888                	ld	a0,16(s1)
     630:	00000097          	auipc	ra,0x0
     634:	dc4080e7          	jalr	-572(ra) # 3f4 <runcmd>
    if(fork1() == 0)
     638:	00000097          	auipc	ra,0x0
     63c:	d8e080e7          	jalr	-626(ra) # 3c6 <fork1>
     640:	ea0512e3          	bnez	a0,4e4 <runcmd+0xf0>
      runcmd(bcmd->cmd);
     644:	6488                	ld	a0,8(s1)
     646:	00000097          	auipc	ra,0x0
     64a:	dae080e7          	jalr	-594(ra) # 3f4 <runcmd>

000000000000064e <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     64e:	1101                	addi	sp,sp,-32
     650:	ec06                	sd	ra,24(sp)
     652:	e822                	sd	s0,16(sp)
     654:	e426                	sd	s1,8(sp)
     656:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     658:	0a800513          	li	a0,168
     65c:	00001097          	auipc	ra,0x1
     660:	11c080e7          	jalr	284(ra) # 1778 <malloc>
     664:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     666:	0a800613          	li	a2,168
     66a:	4581                	li	a1,0
     66c:	00001097          	auipc	ra,0x1
     670:	a74080e7          	jalr	-1420(ra) # 10e0 <memset>
  cmd->type = EXEC;
     674:	4785                	li	a5,1
     676:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     678:	8526                	mv	a0,s1
     67a:	60e2                	ld	ra,24(sp)
     67c:	6442                	ld	s0,16(sp)
     67e:	64a2                	ld	s1,8(sp)
     680:	6105                	addi	sp,sp,32
     682:	8082                	ret

0000000000000684 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     684:	7139                	addi	sp,sp,-64
     686:	fc06                	sd	ra,56(sp)
     688:	f822                	sd	s0,48(sp)
     68a:	f426                	sd	s1,40(sp)
     68c:	f04a                	sd	s2,32(sp)
     68e:	ec4e                	sd	s3,24(sp)
     690:	e852                	sd	s4,16(sp)
     692:	e456                	sd	s5,8(sp)
     694:	e05a                	sd	s6,0(sp)
     696:	0080                	addi	s0,sp,64
     698:	8b2a                	mv	s6,a0
     69a:	8aae                	mv	s5,a1
     69c:	8a32                	mv	s4,a2
     69e:	89b6                	mv	s3,a3
     6a0:	893a                	mv	s2,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6a2:	02800513          	li	a0,40
     6a6:	00001097          	auipc	ra,0x1
     6aa:	0d2080e7          	jalr	210(ra) # 1778 <malloc>
     6ae:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     6b0:	02800613          	li	a2,40
     6b4:	4581                	li	a1,0
     6b6:	00001097          	auipc	ra,0x1
     6ba:	a2a080e7          	jalr	-1494(ra) # 10e0 <memset>
  cmd->type = REDIR;
     6be:	4789                	li	a5,2
     6c0:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     6c2:	0164b423          	sd	s6,8(s1)
  cmd->file = file;
     6c6:	0154b823          	sd	s5,16(s1)
  cmd->efile = efile;
     6ca:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     6ce:	0334a023          	sw	s3,32(s1)
  cmd->fd = fd;
     6d2:	0324a223          	sw	s2,36(s1)
  return (struct cmd*)cmd;
}
     6d6:	8526                	mv	a0,s1
     6d8:	70e2                	ld	ra,56(sp)
     6da:	7442                	ld	s0,48(sp)
     6dc:	74a2                	ld	s1,40(sp)
     6de:	7902                	ld	s2,32(sp)
     6e0:	69e2                	ld	s3,24(sp)
     6e2:	6a42                	ld	s4,16(sp)
     6e4:	6aa2                	ld	s5,8(sp)
     6e6:	6b02                	ld	s6,0(sp)
     6e8:	6121                	addi	sp,sp,64
     6ea:	8082                	ret

00000000000006ec <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     6ec:	7179                	addi	sp,sp,-48
     6ee:	f406                	sd	ra,40(sp)
     6f0:	f022                	sd	s0,32(sp)
     6f2:	ec26                	sd	s1,24(sp)
     6f4:	e84a                	sd	s2,16(sp)
     6f6:	e44e                	sd	s3,8(sp)
     6f8:	1800                	addi	s0,sp,48
     6fa:	89aa                	mv	s3,a0
     6fc:	892e                	mv	s2,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6fe:	4561                	li	a0,24
     700:	00001097          	auipc	ra,0x1
     704:	078080e7          	jalr	120(ra) # 1778 <malloc>
     708:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     70a:	4661                	li	a2,24
     70c:	4581                	li	a1,0
     70e:	00001097          	auipc	ra,0x1
     712:	9d2080e7          	jalr	-1582(ra) # 10e0 <memset>
  cmd->type = PIPE;
     716:	478d                	li	a5,3
     718:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     71a:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     71e:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     722:	8526                	mv	a0,s1
     724:	70a2                	ld	ra,40(sp)
     726:	7402                	ld	s0,32(sp)
     728:	64e2                	ld	s1,24(sp)
     72a:	6942                	ld	s2,16(sp)
     72c:	69a2                	ld	s3,8(sp)
     72e:	6145                	addi	sp,sp,48
     730:	8082                	ret

0000000000000732 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     732:	7179                	addi	sp,sp,-48
     734:	f406                	sd	ra,40(sp)
     736:	f022                	sd	s0,32(sp)
     738:	ec26                	sd	s1,24(sp)
     73a:	e84a                	sd	s2,16(sp)
     73c:	e44e                	sd	s3,8(sp)
     73e:	1800                	addi	s0,sp,48
     740:	89aa                	mv	s3,a0
     742:	892e                	mv	s2,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     744:	4561                	li	a0,24
     746:	00001097          	auipc	ra,0x1
     74a:	032080e7          	jalr	50(ra) # 1778 <malloc>
     74e:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     750:	4661                	li	a2,24
     752:	4581                	li	a1,0
     754:	00001097          	auipc	ra,0x1
     758:	98c080e7          	jalr	-1652(ra) # 10e0 <memset>
  cmd->type = LIST;
     75c:	4791                	li	a5,4
     75e:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     760:	0134b423          	sd	s3,8(s1)
  cmd->right = right;
     764:	0124b823          	sd	s2,16(s1)
  return (struct cmd*)cmd;
}
     768:	8526                	mv	a0,s1
     76a:	70a2                	ld	ra,40(sp)
     76c:	7402                	ld	s0,32(sp)
     76e:	64e2                	ld	s1,24(sp)
     770:	6942                	ld	s2,16(sp)
     772:	69a2                	ld	s3,8(sp)
     774:	6145                	addi	sp,sp,48
     776:	8082                	ret

0000000000000778 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     778:	1101                	addi	sp,sp,-32
     77a:	ec06                	sd	ra,24(sp)
     77c:	e822                	sd	s0,16(sp)
     77e:	e426                	sd	s1,8(sp)
     780:	e04a                	sd	s2,0(sp)
     782:	1000                	addi	s0,sp,32
     784:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     786:	4541                	li	a0,16
     788:	00001097          	auipc	ra,0x1
     78c:	ff0080e7          	jalr	-16(ra) # 1778 <malloc>
     790:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     792:	4641                	li	a2,16
     794:	4581                	li	a1,0
     796:	00001097          	auipc	ra,0x1
     79a:	94a080e7          	jalr	-1718(ra) # 10e0 <memset>
  cmd->type = BACK;
     79e:	4795                	li	a5,5
     7a0:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     7a2:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     7a6:	8526                	mv	a0,s1
     7a8:	60e2                	ld	ra,24(sp)
     7aa:	6442                	ld	s0,16(sp)
     7ac:	64a2                	ld	s1,8(sp)
     7ae:	6902                	ld	s2,0(sp)
     7b0:	6105                	addi	sp,sp,32
     7b2:	8082                	ret

00000000000007b4 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     7b4:	7139                	addi	sp,sp,-64
     7b6:	fc06                	sd	ra,56(sp)
     7b8:	f822                	sd	s0,48(sp)
     7ba:	f426                	sd	s1,40(sp)
     7bc:	f04a                	sd	s2,32(sp)
     7be:	ec4e                	sd	s3,24(sp)
     7c0:	e852                	sd	s4,16(sp)
     7c2:	e456                	sd	s5,8(sp)
     7c4:	e05a                	sd	s6,0(sp)
     7c6:	0080                	addi	s0,sp,64
     7c8:	8a2a                	mv	s4,a0
     7ca:	892e                	mv	s2,a1
     7cc:	8ab2                	mv	s5,a2
     7ce:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     7d0:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     7d2:	00001997          	auipc	s3,0x1
     7d6:	28e98993          	addi	s3,s3,654 # 1a60 <whitespace>
     7da:	00b4fd63          	bleu	a1,s1,7f4 <gettoken+0x40>
     7de:	0004c583          	lbu	a1,0(s1)
     7e2:	854e                	mv	a0,s3
     7e4:	00001097          	auipc	ra,0x1
     7e8:	922080e7          	jalr	-1758(ra) # 1106 <strchr>
     7ec:	c501                	beqz	a0,7f4 <gettoken+0x40>
    s++;
     7ee:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     7f0:	fe9917e3          	bne	s2,s1,7de <gettoken+0x2a>
  if(q)
     7f4:	000a8463          	beqz	s5,7fc <gettoken+0x48>
    *q = s;
     7f8:	009ab023          	sd	s1,0(s5)
  ret = *s;
     7fc:	0004c783          	lbu	a5,0(s1)
     800:	00078a9b          	sext.w	s5,a5
  switch(*s){
     804:	02900713          	li	a4,41
     808:	08f76f63          	bltu	a4,a5,8a6 <gettoken+0xf2>
     80c:	02800713          	li	a4,40
     810:	0ae7f863          	bleu	a4,a5,8c0 <gettoken+0x10c>
     814:	e3b9                	bnez	a5,85a <gettoken+0xa6>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     816:	000b0463          	beqz	s6,81e <gettoken+0x6a>
    *eq = s;
     81a:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     81e:	00001997          	auipc	s3,0x1
     822:	24298993          	addi	s3,s3,578 # 1a60 <whitespace>
     826:	0124fd63          	bleu	s2,s1,840 <gettoken+0x8c>
     82a:	0004c583          	lbu	a1,0(s1)
     82e:	854e                	mv	a0,s3
     830:	00001097          	auipc	ra,0x1
     834:	8d6080e7          	jalr	-1834(ra) # 1106 <strchr>
     838:	c501                	beqz	a0,840 <gettoken+0x8c>
    s++;
     83a:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     83c:	fe9917e3          	bne	s2,s1,82a <gettoken+0x76>
  *ps = s;
     840:	009a3023          	sd	s1,0(s4)
  return ret;
}
     844:	8556                	mv	a0,s5
     846:	70e2                	ld	ra,56(sp)
     848:	7442                	ld	s0,48(sp)
     84a:	74a2                	ld	s1,40(sp)
     84c:	7902                	ld	s2,32(sp)
     84e:	69e2                	ld	s3,24(sp)
     850:	6a42                	ld	s4,16(sp)
     852:	6aa2                	ld	s5,8(sp)
     854:	6b02                	ld	s6,0(sp)
     856:	6121                	addi	sp,sp,64
     858:	8082                	ret
  switch(*s){
     85a:	02600713          	li	a4,38
     85e:	06e78163          	beq	a5,a4,8c0 <gettoken+0x10c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     862:	00001997          	auipc	s3,0x1
     866:	1fe98993          	addi	s3,s3,510 # 1a60 <whitespace>
     86a:	00001a97          	auipc	s5,0x1
     86e:	1fea8a93          	addi	s5,s5,510 # 1a68 <symbols>
     872:	0324f563          	bleu	s2,s1,89c <gettoken+0xe8>
     876:	0004c583          	lbu	a1,0(s1)
     87a:	854e                	mv	a0,s3
     87c:	00001097          	auipc	ra,0x1
     880:	88a080e7          	jalr	-1910(ra) # 1106 <strchr>
     884:	e53d                	bnez	a0,8f2 <gettoken+0x13e>
     886:	0004c583          	lbu	a1,0(s1)
     88a:	8556                	mv	a0,s5
     88c:	00001097          	auipc	ra,0x1
     890:	87a080e7          	jalr	-1926(ra) # 1106 <strchr>
     894:	ed21                	bnez	a0,8ec <gettoken+0x138>
      s++;
     896:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     898:	fc991fe3          	bne	s2,s1,876 <gettoken+0xc2>
  if(eq)
     89c:	06100a93          	li	s5,97
     8a0:	f60b1de3          	bnez	s6,81a <gettoken+0x66>
     8a4:	bf71                	j	840 <gettoken+0x8c>
  switch(*s){
     8a6:	03e00713          	li	a4,62
     8aa:	02e78263          	beq	a5,a4,8ce <gettoken+0x11a>
     8ae:	00f76b63          	bltu	a4,a5,8c4 <gettoken+0x110>
     8b2:	fc57879b          	addiw	a5,a5,-59
     8b6:	0ff7f793          	andi	a5,a5,255
     8ba:	4705                	li	a4,1
     8bc:	faf763e3          	bltu	a4,a5,862 <gettoken+0xae>
    s++;
     8c0:	0485                	addi	s1,s1,1
    break;
     8c2:	bf91                	j	816 <gettoken+0x62>
  switch(*s){
     8c4:	07c00713          	li	a4,124
     8c8:	fee78ce3          	beq	a5,a4,8c0 <gettoken+0x10c>
     8cc:	bf59                	j	862 <gettoken+0xae>
    s++;
     8ce:	00148693          	addi	a3,s1,1
    if(*s == '>'){
     8d2:	0014c703          	lbu	a4,1(s1)
     8d6:	03e00793          	li	a5,62
      s++;
     8da:	0489                	addi	s1,s1,2
      ret = '+';
     8dc:	02b00a93          	li	s5,43
    if(*s == '>'){
     8e0:	f2f70be3          	beq	a4,a5,816 <gettoken+0x62>
    s++;
     8e4:	84b6                	mv	s1,a3
  ret = *s;
     8e6:	03e00a93          	li	s5,62
     8ea:	b735                	j	816 <gettoken+0x62>
    ret = 'a';
     8ec:	06100a93          	li	s5,97
     8f0:	b71d                	j	816 <gettoken+0x62>
     8f2:	06100a93          	li	s5,97
     8f6:	b705                	j	816 <gettoken+0x62>

00000000000008f8 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     8f8:	7139                	addi	sp,sp,-64
     8fa:	fc06                	sd	ra,56(sp)
     8fc:	f822                	sd	s0,48(sp)
     8fe:	f426                	sd	s1,40(sp)
     900:	f04a                	sd	s2,32(sp)
     902:	ec4e                	sd	s3,24(sp)
     904:	e852                	sd	s4,16(sp)
     906:	e456                	sd	s5,8(sp)
     908:	0080                	addi	s0,sp,64
     90a:	8a2a                	mv	s4,a0
     90c:	892e                	mv	s2,a1
     90e:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     910:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     912:	00001997          	auipc	s3,0x1
     916:	14e98993          	addi	s3,s3,334 # 1a60 <whitespace>
     91a:	00b4fd63          	bleu	a1,s1,934 <peek+0x3c>
     91e:	0004c583          	lbu	a1,0(s1)
     922:	854e                	mv	a0,s3
     924:	00000097          	auipc	ra,0x0
     928:	7e2080e7          	jalr	2018(ra) # 1106 <strchr>
     92c:	c501                	beqz	a0,934 <peek+0x3c>
    s++;
     92e:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     930:	fe9917e3          	bne	s2,s1,91e <peek+0x26>
  *ps = s;
     934:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     938:	0004c583          	lbu	a1,0(s1)
     93c:	4501                	li	a0,0
     93e:	e991                	bnez	a1,952 <peek+0x5a>
}
     940:	70e2                	ld	ra,56(sp)
     942:	7442                	ld	s0,48(sp)
     944:	74a2                	ld	s1,40(sp)
     946:	7902                	ld	s2,32(sp)
     948:	69e2                	ld	s3,24(sp)
     94a:	6a42                	ld	s4,16(sp)
     94c:	6aa2                	ld	s5,8(sp)
     94e:	6121                	addi	sp,sp,64
     950:	8082                	ret
  return *s && strchr(toks, *s);
     952:	8556                	mv	a0,s5
     954:	00000097          	auipc	ra,0x0
     958:	7b2080e7          	jalr	1970(ra) # 1106 <strchr>
     95c:	00a03533          	snez	a0,a0
     960:	b7c5                	j	940 <peek+0x48>

0000000000000962 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     962:	7119                	addi	sp,sp,-128
     964:	fc86                	sd	ra,120(sp)
     966:	f8a2                	sd	s0,112(sp)
     968:	f4a6                	sd	s1,104(sp)
     96a:	f0ca                	sd	s2,96(sp)
     96c:	ecce                	sd	s3,88(sp)
     96e:	e8d2                	sd	s4,80(sp)
     970:	e4d6                	sd	s5,72(sp)
     972:	e0da                	sd	s6,64(sp)
     974:	fc5e                	sd	s7,56(sp)
     976:	f862                	sd	s8,48(sp)
     978:	f466                	sd	s9,40(sp)
     97a:	f06a                	sd	s10,32(sp)
     97c:	ec6e                	sd	s11,24(sp)
     97e:	0100                	addi	s0,sp,128
     980:	8b2a                	mv	s6,a0
     982:	89ae                	mv	s3,a1
     984:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     986:	00001b97          	auipc	s7,0x1
     98a:	fd2b8b93          	addi	s7,s7,-46 # 1958 <malloc+0x1e0>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     98e:	06100d13          	li	s10,97
      panic("missing file for redirection");
    switch(tok){
     992:	03c00d93          	li	s11,60
    if(gettoken(ps, es, &q, &eq) != 'a')
     996:	f8040c93          	addi	s9,s0,-128
     99a:	f8840c13          	addi	s8,s0,-120
  while(peek(ps, es, "<>")){
     99e:	a02d                	j	9c8 <parseredirs+0x66>
      panic("missing file for redirection");
     9a0:	00001517          	auipc	a0,0x1
     9a4:	f9850513          	addi	a0,a0,-104 # 1938 <malloc+0x1c0>
     9a8:	00000097          	auipc	ra,0x0
     9ac:	9f8080e7          	jalr	-1544(ra) # 3a0 <panic>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     9b0:	4701                	li	a4,0
     9b2:	4681                	li	a3,0
     9b4:	f8043603          	ld	a2,-128(s0)
     9b8:	f8843583          	ld	a1,-120(s0)
     9bc:	855a                	mv	a0,s6
     9be:	00000097          	auipc	ra,0x0
     9c2:	cc6080e7          	jalr	-826(ra) # 684 <redircmd>
     9c6:	8b2a                	mv	s6,a0
    switch(tok){
     9c8:	03e00a93          	li	s5,62
     9cc:	02b00a13          	li	s4,43
  while(peek(ps, es, "<>")){
     9d0:	865e                	mv	a2,s7
     9d2:	85ca                	mv	a1,s2
     9d4:	854e                	mv	a0,s3
     9d6:	00000097          	auipc	ra,0x0
     9da:	f22080e7          	jalr	-222(ra) # 8f8 <peek>
     9de:	c535                	beqz	a0,a4a <parseredirs+0xe8>
    tok = gettoken(ps, es, 0, 0);
     9e0:	4681                	li	a3,0
     9e2:	4601                	li	a2,0
     9e4:	85ca                	mv	a1,s2
     9e6:	854e                	mv	a0,s3
     9e8:	00000097          	auipc	ra,0x0
     9ec:	dcc080e7          	jalr	-564(ra) # 7b4 <gettoken>
     9f0:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     9f2:	86e6                	mv	a3,s9
     9f4:	8662                	mv	a2,s8
     9f6:	85ca                	mv	a1,s2
     9f8:	854e                	mv	a0,s3
     9fa:	00000097          	auipc	ra,0x0
     9fe:	dba080e7          	jalr	-582(ra) # 7b4 <gettoken>
     a02:	f9a51fe3          	bne	a0,s10,9a0 <parseredirs+0x3e>
    switch(tok){
     a06:	fbb485e3          	beq	s1,s11,9b0 <parseredirs+0x4e>
     a0a:	03548263          	beq	s1,s5,a2e <parseredirs+0xcc>
     a0e:	fd4491e3          	bne	s1,s4,9d0 <parseredirs+0x6e>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_APPEND, 1);
     a12:	4705                	li	a4,1
     a14:	20500693          	li	a3,517
     a18:	f8043603          	ld	a2,-128(s0)
     a1c:	f8843583          	ld	a1,-120(s0)
     a20:	855a                	mv	a0,s6
     a22:	00000097          	auipc	ra,0x0
     a26:	c62080e7          	jalr	-926(ra) # 684 <redircmd>
     a2a:	8b2a                	mv	s6,a0
      break;
     a2c:	bf71                	j	9c8 <parseredirs+0x66>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     a2e:	4705                	li	a4,1
     a30:	60100693          	li	a3,1537
     a34:	f8043603          	ld	a2,-128(s0)
     a38:	f8843583          	ld	a1,-120(s0)
     a3c:	855a                	mv	a0,s6
     a3e:	00000097          	auipc	ra,0x0
     a42:	c46080e7          	jalr	-954(ra) # 684 <redircmd>
     a46:	8b2a                	mv	s6,a0
      break;
     a48:	b741                	j	9c8 <parseredirs+0x66>
    }
  }
  return cmd;
}
     a4a:	855a                	mv	a0,s6
     a4c:	70e6                	ld	ra,120(sp)
     a4e:	7446                	ld	s0,112(sp)
     a50:	74a6                	ld	s1,104(sp)
     a52:	7906                	ld	s2,96(sp)
     a54:	69e6                	ld	s3,88(sp)
     a56:	6a46                	ld	s4,80(sp)
     a58:	6aa6                	ld	s5,72(sp)
     a5a:	6b06                	ld	s6,64(sp)
     a5c:	7be2                	ld	s7,56(sp)
     a5e:	7c42                	ld	s8,48(sp)
     a60:	7ca2                	ld	s9,40(sp)
     a62:	7d02                	ld	s10,32(sp)
     a64:	6de2                	ld	s11,24(sp)
     a66:	6109                	addi	sp,sp,128
     a68:	8082                	ret

0000000000000a6a <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     a6a:	7119                	addi	sp,sp,-128
     a6c:	fc86                	sd	ra,120(sp)
     a6e:	f8a2                	sd	s0,112(sp)
     a70:	f4a6                	sd	s1,104(sp)
     a72:	f0ca                	sd	s2,96(sp)
     a74:	ecce                	sd	s3,88(sp)
     a76:	e8d2                	sd	s4,80(sp)
     a78:	e4d6                	sd	s5,72(sp)
     a7a:	e0da                	sd	s6,64(sp)
     a7c:	fc5e                	sd	s7,56(sp)
     a7e:	f862                	sd	s8,48(sp)
     a80:	f466                	sd	s9,40(sp)
     a82:	f06a                	sd	s10,32(sp)
     a84:	ec6e                	sd	s11,24(sp)
     a86:	0100                	addi	s0,sp,128
     a88:	89aa                	mv	s3,a0
     a8a:	8a2e                	mv	s4,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     a8c:	00001617          	auipc	a2,0x1
     a90:	ed460613          	addi	a2,a2,-300 # 1960 <malloc+0x1e8>
     a94:	00000097          	auipc	ra,0x0
     a98:	e64080e7          	jalr	-412(ra) # 8f8 <peek>
     a9c:	ed05                	bnez	a0,ad4 <parseexec+0x6a>
     a9e:	892a                	mv	s2,a0
    return parseblock(ps, es);

  ret = execcmd();
     aa0:	00000097          	auipc	ra,0x0
     aa4:	bae080e7          	jalr	-1106(ra) # 64e <execcmd>
     aa8:	8d2a                	mv	s10,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     aaa:	8652                	mv	a2,s4
     aac:	85ce                	mv	a1,s3
     aae:	00000097          	auipc	ra,0x0
     ab2:	eb4080e7          	jalr	-332(ra) # 962 <parseredirs>
     ab6:	8aaa                	mv	s5,a0
  while(!peek(ps, es, "|)&;")){
     ab8:	008d0493          	addi	s1,s10,8
     abc:	00001b17          	auipc	s6,0x1
     ac0:	ec4b0b13          	addi	s6,s6,-316 # 1980 <malloc+0x208>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     ac4:	f8040c13          	addi	s8,s0,-128
     ac8:	f8840b93          	addi	s7,s0,-120
      break;
    if(tok != 'a')
     acc:	06100d93          	li	s11,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     ad0:	4ca9                	li	s9,10
  while(!peek(ps, es, "|)&;")){
     ad2:	a881                	j	b22 <parseexec+0xb8>
    return parseblock(ps, es);
     ad4:	85d2                	mv	a1,s4
     ad6:	854e                	mv	a0,s3
     ad8:	00000097          	auipc	ra,0x0
     adc:	1b8080e7          	jalr	440(ra) # c90 <parseblock>
     ae0:	8aaa                	mv	s5,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     ae2:	8556                	mv	a0,s5
     ae4:	70e6                	ld	ra,120(sp)
     ae6:	7446                	ld	s0,112(sp)
     ae8:	74a6                	ld	s1,104(sp)
     aea:	7906                	ld	s2,96(sp)
     aec:	69e6                	ld	s3,88(sp)
     aee:	6a46                	ld	s4,80(sp)
     af0:	6aa6                	ld	s5,72(sp)
     af2:	6b06                	ld	s6,64(sp)
     af4:	7be2                	ld	s7,56(sp)
     af6:	7c42                	ld	s8,48(sp)
     af8:	7ca2                	ld	s9,40(sp)
     afa:	7d02                	ld	s10,32(sp)
     afc:	6de2                	ld	s11,24(sp)
     afe:	6109                	addi	sp,sp,128
     b00:	8082                	ret
      panic("syntax");
     b02:	00001517          	auipc	a0,0x1
     b06:	e6650513          	addi	a0,a0,-410 # 1968 <malloc+0x1f0>
     b0a:	00000097          	auipc	ra,0x0
     b0e:	896080e7          	jalr	-1898(ra) # 3a0 <panic>
    ret = parseredirs(ret, ps, es);
     b12:	8652                	mv	a2,s4
     b14:	85ce                	mv	a1,s3
     b16:	8556                	mv	a0,s5
     b18:	00000097          	auipc	ra,0x0
     b1c:	e4a080e7          	jalr	-438(ra) # 962 <parseredirs>
     b20:	8aaa                	mv	s5,a0
  while(!peek(ps, es, "|)&;")){
     b22:	865a                	mv	a2,s6
     b24:	85d2                	mv	a1,s4
     b26:	854e                	mv	a0,s3
     b28:	00000097          	auipc	ra,0x0
     b2c:	dd0080e7          	jalr	-560(ra) # 8f8 <peek>
     b30:	ed15                	bnez	a0,b6c <parseexec+0x102>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b32:	86e2                	mv	a3,s8
     b34:	865e                	mv	a2,s7
     b36:	85d2                	mv	a1,s4
     b38:	854e                	mv	a0,s3
     b3a:	00000097          	auipc	ra,0x0
     b3e:	c7a080e7          	jalr	-902(ra) # 7b4 <gettoken>
     b42:	c50d                	beqz	a0,b6c <parseexec+0x102>
    if(tok != 'a')
     b44:	fbb51fe3          	bne	a0,s11,b02 <parseexec+0x98>
    cmd->argv[argc] = q;
     b48:	f8843783          	ld	a5,-120(s0)
     b4c:	e09c                	sd	a5,0(s1)
    cmd->eargv[argc] = eq;
     b4e:	f8043783          	ld	a5,-128(s0)
     b52:	e8bc                	sd	a5,80(s1)
    argc++;
     b54:	2905                	addiw	s2,s2,1
    if(argc >= MAXARGS)
     b56:	04a1                	addi	s1,s1,8
     b58:	fb991de3          	bne	s2,s9,b12 <parseexec+0xa8>
      panic("too many args");
     b5c:	00001517          	auipc	a0,0x1
     b60:	e1450513          	addi	a0,a0,-492 # 1970 <malloc+0x1f8>
     b64:	00000097          	auipc	ra,0x0
     b68:	83c080e7          	jalr	-1988(ra) # 3a0 <panic>
  cmd->argv[argc] = 0;
     b6c:	090e                	slli	s2,s2,0x3
     b6e:	996a                	add	s2,s2,s10
     b70:	00093423          	sd	zero,8(s2)
  cmd->eargv[argc] = 0;
     b74:	04093c23          	sd	zero,88(s2)
  return ret;
     b78:	b7ad                	j	ae2 <parseexec+0x78>

0000000000000b7a <parsepipe>:
{
     b7a:	7179                	addi	sp,sp,-48
     b7c:	f406                	sd	ra,40(sp)
     b7e:	f022                	sd	s0,32(sp)
     b80:	ec26                	sd	s1,24(sp)
     b82:	e84a                	sd	s2,16(sp)
     b84:	e44e                	sd	s3,8(sp)
     b86:	1800                	addi	s0,sp,48
     b88:	892a                	mv	s2,a0
     b8a:	89ae                	mv	s3,a1
  cmd = parseexec(ps, es);
     b8c:	00000097          	auipc	ra,0x0
     b90:	ede080e7          	jalr	-290(ra) # a6a <parseexec>
     b94:	84aa                	mv	s1,a0
  if(peek(ps, es, "|")){
     b96:	00001617          	auipc	a2,0x1
     b9a:	df260613          	addi	a2,a2,-526 # 1988 <malloc+0x210>
     b9e:	85ce                	mv	a1,s3
     ba0:	854a                	mv	a0,s2
     ba2:	00000097          	auipc	ra,0x0
     ba6:	d56080e7          	jalr	-682(ra) # 8f8 <peek>
     baa:	e909                	bnez	a0,bbc <parsepipe+0x42>
}
     bac:	8526                	mv	a0,s1
     bae:	70a2                	ld	ra,40(sp)
     bb0:	7402                	ld	s0,32(sp)
     bb2:	64e2                	ld	s1,24(sp)
     bb4:	6942                	ld	s2,16(sp)
     bb6:	69a2                	ld	s3,8(sp)
     bb8:	6145                	addi	sp,sp,48
     bba:	8082                	ret
    gettoken(ps, es, 0, 0);
     bbc:	4681                	li	a3,0
     bbe:	4601                	li	a2,0
     bc0:	85ce                	mv	a1,s3
     bc2:	854a                	mv	a0,s2
     bc4:	00000097          	auipc	ra,0x0
     bc8:	bf0080e7          	jalr	-1040(ra) # 7b4 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     bcc:	85ce                	mv	a1,s3
     bce:	854a                	mv	a0,s2
     bd0:	00000097          	auipc	ra,0x0
     bd4:	faa080e7          	jalr	-86(ra) # b7a <parsepipe>
     bd8:	85aa                	mv	a1,a0
     bda:	8526                	mv	a0,s1
     bdc:	00000097          	auipc	ra,0x0
     be0:	b10080e7          	jalr	-1264(ra) # 6ec <pipecmd>
     be4:	84aa                	mv	s1,a0
  return cmd;
     be6:	b7d9                	j	bac <parsepipe+0x32>

0000000000000be8 <parseline>:
{
     be8:	7179                	addi	sp,sp,-48
     bea:	f406                	sd	ra,40(sp)
     bec:	f022                	sd	s0,32(sp)
     bee:	ec26                	sd	s1,24(sp)
     bf0:	e84a                	sd	s2,16(sp)
     bf2:	e44e                	sd	s3,8(sp)
     bf4:	e052                	sd	s4,0(sp)
     bf6:	1800                	addi	s0,sp,48
     bf8:	84aa                	mv	s1,a0
     bfa:	892e                	mv	s2,a1
  cmd = parsepipe(ps, es);
     bfc:	00000097          	auipc	ra,0x0
     c00:	f7e080e7          	jalr	-130(ra) # b7a <parsepipe>
     c04:	89aa                	mv	s3,a0
  while(peek(ps, es, "&")){
     c06:	00001a17          	auipc	s4,0x1
     c0a:	d8aa0a13          	addi	s4,s4,-630 # 1990 <malloc+0x218>
     c0e:	8652                	mv	a2,s4
     c10:	85ca                	mv	a1,s2
     c12:	8526                	mv	a0,s1
     c14:	00000097          	auipc	ra,0x0
     c18:	ce4080e7          	jalr	-796(ra) # 8f8 <peek>
     c1c:	c105                	beqz	a0,c3c <parseline+0x54>
    gettoken(ps, es, 0, 0);
     c1e:	4681                	li	a3,0
     c20:	4601                	li	a2,0
     c22:	85ca                	mv	a1,s2
     c24:	8526                	mv	a0,s1
     c26:	00000097          	auipc	ra,0x0
     c2a:	b8e080e7          	jalr	-1138(ra) # 7b4 <gettoken>
    cmd = backcmd(cmd);
     c2e:	854e                	mv	a0,s3
     c30:	00000097          	auipc	ra,0x0
     c34:	b48080e7          	jalr	-1208(ra) # 778 <backcmd>
     c38:	89aa                	mv	s3,a0
     c3a:	bfd1                	j	c0e <parseline+0x26>
  if(peek(ps, es, ";")){
     c3c:	00001617          	auipc	a2,0x1
     c40:	d5c60613          	addi	a2,a2,-676 # 1998 <malloc+0x220>
     c44:	85ca                	mv	a1,s2
     c46:	8526                	mv	a0,s1
     c48:	00000097          	auipc	ra,0x0
     c4c:	cb0080e7          	jalr	-848(ra) # 8f8 <peek>
     c50:	e911                	bnez	a0,c64 <parseline+0x7c>
}
     c52:	854e                	mv	a0,s3
     c54:	70a2                	ld	ra,40(sp)
     c56:	7402                	ld	s0,32(sp)
     c58:	64e2                	ld	s1,24(sp)
     c5a:	6942                	ld	s2,16(sp)
     c5c:	69a2                	ld	s3,8(sp)
     c5e:	6a02                	ld	s4,0(sp)
     c60:	6145                	addi	sp,sp,48
     c62:	8082                	ret
    gettoken(ps, es, 0, 0);
     c64:	4681                	li	a3,0
     c66:	4601                	li	a2,0
     c68:	85ca                	mv	a1,s2
     c6a:	8526                	mv	a0,s1
     c6c:	00000097          	auipc	ra,0x0
     c70:	b48080e7          	jalr	-1208(ra) # 7b4 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     c74:	85ca                	mv	a1,s2
     c76:	8526                	mv	a0,s1
     c78:	00000097          	auipc	ra,0x0
     c7c:	f70080e7          	jalr	-144(ra) # be8 <parseline>
     c80:	85aa                	mv	a1,a0
     c82:	854e                	mv	a0,s3
     c84:	00000097          	auipc	ra,0x0
     c88:	aae080e7          	jalr	-1362(ra) # 732 <listcmd>
     c8c:	89aa                	mv	s3,a0
  return cmd;
     c8e:	b7d1                	j	c52 <parseline+0x6a>

0000000000000c90 <parseblock>:
{
     c90:	7179                	addi	sp,sp,-48
     c92:	f406                	sd	ra,40(sp)
     c94:	f022                	sd	s0,32(sp)
     c96:	ec26                	sd	s1,24(sp)
     c98:	e84a                	sd	s2,16(sp)
     c9a:	e44e                	sd	s3,8(sp)
     c9c:	1800                	addi	s0,sp,48
     c9e:	84aa                	mv	s1,a0
     ca0:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     ca2:	00001617          	auipc	a2,0x1
     ca6:	cbe60613          	addi	a2,a2,-834 # 1960 <malloc+0x1e8>
     caa:	00000097          	auipc	ra,0x0
     cae:	c4e080e7          	jalr	-946(ra) # 8f8 <peek>
     cb2:	c12d                	beqz	a0,d14 <parseblock+0x84>
  gettoken(ps, es, 0, 0);
     cb4:	4681                	li	a3,0
     cb6:	4601                	li	a2,0
     cb8:	85ca                	mv	a1,s2
     cba:	8526                	mv	a0,s1
     cbc:	00000097          	auipc	ra,0x0
     cc0:	af8080e7          	jalr	-1288(ra) # 7b4 <gettoken>
  cmd = parseline(ps, es);
     cc4:	85ca                	mv	a1,s2
     cc6:	8526                	mv	a0,s1
     cc8:	00000097          	auipc	ra,0x0
     ccc:	f20080e7          	jalr	-224(ra) # be8 <parseline>
     cd0:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     cd2:	00001617          	auipc	a2,0x1
     cd6:	cde60613          	addi	a2,a2,-802 # 19b0 <malloc+0x238>
     cda:	85ca                	mv	a1,s2
     cdc:	8526                	mv	a0,s1
     cde:	00000097          	auipc	ra,0x0
     ce2:	c1a080e7          	jalr	-998(ra) # 8f8 <peek>
     ce6:	cd1d                	beqz	a0,d24 <parseblock+0x94>
  gettoken(ps, es, 0, 0);
     ce8:	4681                	li	a3,0
     cea:	4601                	li	a2,0
     cec:	85ca                	mv	a1,s2
     cee:	8526                	mv	a0,s1
     cf0:	00000097          	auipc	ra,0x0
     cf4:	ac4080e7          	jalr	-1340(ra) # 7b4 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     cf8:	864a                	mv	a2,s2
     cfa:	85a6                	mv	a1,s1
     cfc:	854e                	mv	a0,s3
     cfe:	00000097          	auipc	ra,0x0
     d02:	c64080e7          	jalr	-924(ra) # 962 <parseredirs>
}
     d06:	70a2                	ld	ra,40(sp)
     d08:	7402                	ld	s0,32(sp)
     d0a:	64e2                	ld	s1,24(sp)
     d0c:	6942                	ld	s2,16(sp)
     d0e:	69a2                	ld	s3,8(sp)
     d10:	6145                	addi	sp,sp,48
     d12:	8082                	ret
    panic("parseblock");
     d14:	00001517          	auipc	a0,0x1
     d18:	c8c50513          	addi	a0,a0,-884 # 19a0 <malloc+0x228>
     d1c:	fffff097          	auipc	ra,0xfffff
     d20:	684080e7          	jalr	1668(ra) # 3a0 <panic>
    panic("syntax - missing )");
     d24:	00001517          	auipc	a0,0x1
     d28:	c9450513          	addi	a0,a0,-876 # 19b8 <malloc+0x240>
     d2c:	fffff097          	auipc	ra,0xfffff
     d30:	674080e7          	jalr	1652(ra) # 3a0 <panic>

0000000000000d34 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     d34:	1101                	addi	sp,sp,-32
     d36:	ec06                	sd	ra,24(sp)
     d38:	e822                	sd	s0,16(sp)
     d3a:	e426                	sd	s1,8(sp)
     d3c:	1000                	addi	s0,sp,32
     d3e:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     d40:	c521                	beqz	a0,d88 <nulterminate+0x54>
    return 0;

  switch(cmd->type){
     d42:	4118                	lw	a4,0(a0)
     d44:	4795                	li	a5,5
     d46:	04e7e163          	bltu	a5,a4,d88 <nulterminate+0x54>
     d4a:	00056783          	lwu	a5,0(a0)
     d4e:	078a                	slli	a5,a5,0x2
     d50:	00001717          	auipc	a4,0x1
     d54:	b2870713          	addi	a4,a4,-1240 # 1878 <malloc+0x100>
     d58:	97ba                	add	a5,a5,a4
     d5a:	439c                	lw	a5,0(a5)
     d5c:	97ba                	add	a5,a5,a4
     d5e:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     d60:	651c                	ld	a5,8(a0)
     d62:	c39d                	beqz	a5,d88 <nulterminate+0x54>
     d64:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     d68:	67b8                	ld	a4,72(a5)
     d6a:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     d6e:	07a1                	addi	a5,a5,8
     d70:	ff87b703          	ld	a4,-8(a5)
     d74:	fb75                	bnez	a4,d68 <nulterminate+0x34>
     d76:	a809                	j	d88 <nulterminate+0x54>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     d78:	6508                	ld	a0,8(a0)
     d7a:	00000097          	auipc	ra,0x0
     d7e:	fba080e7          	jalr	-70(ra) # d34 <nulterminate>
    *rcmd->efile = 0;
     d82:	6c9c                	ld	a5,24(s1)
     d84:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
     d88:	8526                	mv	a0,s1
     d8a:	60e2                	ld	ra,24(sp)
     d8c:	6442                	ld	s0,16(sp)
     d8e:	64a2                	ld	s1,8(sp)
     d90:	6105                	addi	sp,sp,32
     d92:	8082                	ret
    nulterminate(pcmd->left);
     d94:	6508                	ld	a0,8(a0)
     d96:	00000097          	auipc	ra,0x0
     d9a:	f9e080e7          	jalr	-98(ra) # d34 <nulterminate>
    nulterminate(pcmd->right);
     d9e:	6888                	ld	a0,16(s1)
     da0:	00000097          	auipc	ra,0x0
     da4:	f94080e7          	jalr	-108(ra) # d34 <nulterminate>
    break;
     da8:	b7c5                	j	d88 <nulterminate+0x54>
    nulterminate(lcmd->left);
     daa:	6508                	ld	a0,8(a0)
     dac:	00000097          	auipc	ra,0x0
     db0:	f88080e7          	jalr	-120(ra) # d34 <nulterminate>
    nulterminate(lcmd->right);
     db4:	6888                	ld	a0,16(s1)
     db6:	00000097          	auipc	ra,0x0
     dba:	f7e080e7          	jalr	-130(ra) # d34 <nulterminate>
    break;
     dbe:	b7e9                	j	d88 <nulterminate+0x54>
    nulterminate(bcmd->cmd);
     dc0:	6508                	ld	a0,8(a0)
     dc2:	00000097          	auipc	ra,0x0
     dc6:	f72080e7          	jalr	-142(ra) # d34 <nulterminate>
    break;
     dca:	bf7d                	j	d88 <nulterminate+0x54>

0000000000000dcc <parsecmd>:
{
     dcc:	7139                	addi	sp,sp,-64
     dce:	fc06                	sd	ra,56(sp)
     dd0:	f822                	sd	s0,48(sp)
     dd2:	f426                	sd	s1,40(sp)
     dd4:	f04a                	sd	s2,32(sp)
     dd6:	ec4e                	sd	s3,24(sp)
     dd8:	0080                	addi	s0,sp,64
     dda:	fca43423          	sd	a0,-56(s0)
  es = s + strlen(s);
     dde:	84aa                	mv	s1,a0
     de0:	00000097          	auipc	ra,0x0
     de4:	2d6080e7          	jalr	726(ra) # 10b6 <strlen>
     de8:	1502                	slli	a0,a0,0x20
     dea:	9101                	srli	a0,a0,0x20
     dec:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     dee:	85a6                	mv	a1,s1
     df0:	fc840913          	addi	s2,s0,-56
     df4:	854a                	mv	a0,s2
     df6:	00000097          	auipc	ra,0x0
     dfa:	df2080e7          	jalr	-526(ra) # be8 <parseline>
     dfe:	89aa                	mv	s3,a0
  peek(&s, es, "");
     e00:	00001617          	auipc	a2,0x1
     e04:	c2860613          	addi	a2,a2,-984 # 1a28 <malloc+0x2b0>
     e08:	85a6                	mv	a1,s1
     e0a:	854a                	mv	a0,s2
     e0c:	00000097          	auipc	ra,0x0
     e10:	aec080e7          	jalr	-1300(ra) # 8f8 <peek>
  if(s != es){
     e14:	fc843603          	ld	a2,-56(s0)
     e18:	00961f63          	bne	a2,s1,e36 <parsecmd+0x6a>
  nulterminate(cmd);
     e1c:	854e                	mv	a0,s3
     e1e:	00000097          	auipc	ra,0x0
     e22:	f16080e7          	jalr	-234(ra) # d34 <nulterminate>
}
     e26:	854e                	mv	a0,s3
     e28:	70e2                	ld	ra,56(sp)
     e2a:	7442                	ld	s0,48(sp)
     e2c:	74a2                	ld	s1,40(sp)
     e2e:	7902                	ld	s2,32(sp)
     e30:	69e2                	ld	s3,24(sp)
     e32:	6121                	addi	sp,sp,64
     e34:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     e36:	00001597          	auipc	a1,0x1
     e3a:	b9a58593          	addi	a1,a1,-1126 # 19d0 <malloc+0x258>
     e3e:	4509                	li	a0,2
     e40:	00001097          	auipc	ra,0x1
     e44:	84a080e7          	jalr	-1974(ra) # 168a <fprintf>
    panic("syntax");
     e48:	00001517          	auipc	a0,0x1
     e4c:	b2050513          	addi	a0,a0,-1248 # 1968 <malloc+0x1f0>
     e50:	fffff097          	auipc	ra,0xfffff
     e54:	550080e7          	jalr	1360(ra) # 3a0 <panic>

0000000000000e58 <main>:
{
     e58:	711d                	addi	sp,sp,-96
     e5a:	ec86                	sd	ra,88(sp)
     e5c:	e8a2                	sd	s0,80(sp)
     e5e:	e4a6                	sd	s1,72(sp)
     e60:	e0ca                	sd	s2,64(sp)
     e62:	fc4e                	sd	s3,56(sp)
     e64:	f852                	sd	s4,48(sp)
     e66:	f456                	sd	s5,40(sp)
     e68:	f05a                	sd	s6,32(sp)
     e6a:	ec5e                	sd	s7,24(sp)
     e6c:	e862                	sd	s8,16(sp)
     e6e:	e466                	sd	s9,8(sp)
     e70:	1080                	addi	s0,sp,96
  while((fd = dev(O_RDWR, 1, 0)) >= 0){
     e72:	4601                	li	a2,0
     e74:	4585                	li	a1,1
     e76:	4509                	li	a0,2
     e78:	00000097          	auipc	ra,0x0
     e7c:	52a080e7          	jalr	1322(ra) # 13a2 <dev>
     e80:	00054963          	bltz	a0,e92 <main+0x3a>
    if(fd >= 3){
     e84:	4789                	li	a5,2
     e86:	fea7d6e3          	ble	a0,a5,e72 <main+0x1a>
      close(fd);
     e8a:	00000097          	auipc	ra,0x0
     e8e:	4b0080e7          	jalr	1200(ra) # 133a <close>
  strcpy(envs[nenv].name, "SHELL");
     e92:	00001497          	auipc	s1,0x1
     e96:	bde48493          	addi	s1,s1,-1058 # 1a70 <_edata>
     e9a:	4088                	lw	a0,0(s1)
     e9c:	051e                	slli	a0,a0,0x7
     e9e:	00001917          	auipc	s2,0x1
     ea2:	cc290913          	addi	s2,s2,-830 # 1b60 <envs>
     ea6:	00001597          	auipc	a1,0x1
     eaa:	b3a58593          	addi	a1,a1,-1222 # 19e0 <malloc+0x268>
     eae:	954a                	add	a0,a0,s2
     eb0:	00000097          	auipc	ra,0x0
     eb4:	188080e7          	jalr	392(ra) # 1038 <strcpy>
  strcpy(envs[nenv].value, "/bin");
     eb8:	4088                	lw	a0,0(s1)
     eba:	051e                	slli	a0,a0,0x7
     ebc:	02050513          	addi	a0,a0,32
     ec0:	00001597          	auipc	a1,0x1
     ec4:	b2858593          	addi	a1,a1,-1240 # 19e8 <malloc+0x270>
     ec8:	954a                	add	a0,a0,s2
     eca:	00000097          	auipc	ra,0x0
     ece:	16e080e7          	jalr	366(ra) # 1038 <strcpy>
  nenv++;
     ed2:	409c                	lw	a5,0(s1)
     ed4:	2785                	addiw	a5,a5,1
     ed6:	c09c                	sw	a5,0(s1)
  getcwd(mycwd);
     ed8:	00001517          	auipc	a0,0x1
     edc:	ba050513          	addi	a0,a0,-1120 # 1a78 <mycwd>
     ee0:	00000097          	auipc	ra,0x0
     ee4:	4d2080e7          	jalr	1234(ra) # 13b2 <getcwd>
  while(getcmd(buf, sizeof(buf)) >= 0){
     ee8:	00001917          	auipc	s2,0x1
     eec:	c1090913          	addi	s2,s2,-1008 # 1af8 <buf.1241>
    replace(buf);
     ef0:	89a6                	mv	s3,s1
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     ef2:	06300a13          	li	s4,99
      else if(!strcmp(ecmd->argv[0], "export"))
     ef6:	00001a97          	auipc	s5,0x1
     efa:	b0aa8a93          	addi	s5,s5,-1270 # 1a00 <malloc+0x288>
          fprintf(2, "export failed\n");
     efe:	00001b97          	auipc	s7,0x1
     f02:	b32b8b93          	addi	s7,s7,-1230 # 1a30 <malloc+0x2b8>
          fprintf(2, "Usage: export [-p] [NAME=VALUE]\n");
     f06:	00001b17          	auipc	s6,0x1
     f0a:	b02b0b13          	addi	s6,s6,-1278 # 1a08 <malloc+0x290>
      if(chdir(buf+3) < 0)
     f0e:	00001c17          	auipc	s8,0x1
     f12:	bedc0c13          	addi	s8,s8,-1043 # 1afb <buf.1241+0x3>
      getcwd(mycwd);
     f16:	00001c97          	auipc	s9,0x1
     f1a:	b62c8c93          	addi	s9,s9,-1182 # 1a78 <mycwd>
  while(getcmd(buf, sizeof(buf)) >= 0){
     f1e:	a8a5                	j	f96 <main+0x13e>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     f20:	08a9c703          	lbu	a4,138(s3)
     f24:	02000793          	li	a5,32
     f28:	08f71f63          	bne	a4,a5,fc6 <main+0x16e>
      buf[strlen(buf)-1] = 0;  // chop \n
     f2c:	854a                	mv	a0,s2
     f2e:	00000097          	auipc	ra,0x0
     f32:	188080e7          	jalr	392(ra) # 10b6 <strlen>
     f36:	fff5079b          	addiw	a5,a0,-1
     f3a:	1782                	slli	a5,a5,0x20
     f3c:	9381                	srli	a5,a5,0x20
     f3e:	97ce                	add	a5,a5,s3
     f40:	08078423          	sb	zero,136(a5)
      if(chdir(buf+3) < 0)
     f44:	8562                	mv	a0,s8
     f46:	00000097          	auipc	ra,0x0
     f4a:	424080e7          	jalr	1060(ra) # 136a <chdir>
     f4e:	00054863          	bltz	a0,f5e <main+0x106>
      getcwd(mycwd);
     f52:	8566                	mv	a0,s9
     f54:	00000097          	auipc	ra,0x0
     f58:	45e080e7          	jalr	1118(ra) # 13b2 <getcwd>
     f5c:	a82d                	j	f96 <main+0x13e>
        fprintf(2, "cannot cd %s\n", buf+3);
     f5e:	8662                	mv	a2,s8
     f60:	00001597          	auipc	a1,0x1
     f64:	a9058593          	addi	a1,a1,-1392 # 19f0 <malloc+0x278>
     f68:	4509                	li	a0,2
     f6a:	00000097          	auipc	ra,0x0
     f6e:	720080e7          	jalr	1824(ra) # 168a <fprintf>
     f72:	b7c5                	j	f52 <main+0xfa>
        free(cmd);
     f74:	8526                	mv	a0,s1
     f76:	00000097          	auipc	ra,0x0
     f7a:	778080e7          	jalr	1912(ra) # 16ee <free>
        continue;
     f7e:	a821                	j	f96 <main+0x13e>
          fprintf(2, "Usage: export [-p] [NAME=VALUE]\n");
     f80:	85da                	mv	a1,s6
     f82:	4509                	li	a0,2
     f84:	00000097          	auipc	ra,0x0
     f88:	706080e7          	jalr	1798(ra) # 168a <fprintf>
        free(cmd);
     f8c:	8526                	mv	a0,s1
     f8e:	00000097          	auipc	ra,0x0
     f92:	760080e7          	jalr	1888(ra) # 16ee <free>
  while(getcmd(buf, sizeof(buf)) >= 0){
     f96:	06400593          	li	a1,100
     f9a:	854a                	mv	a0,s2
     f9c:	fffff097          	auipc	ra,0xfffff
     fa0:	3a6080e7          	jalr	934(ra) # 342 <getcmd>
     fa4:	08054563          	bltz	a0,102e <main+0x1d6>
    replace(buf);
     fa8:	854a                	mv	a0,s2
     faa:	fffff097          	auipc	ra,0xfffff
     fae:	254080e7          	jalr	596(ra) # 1fe <replace>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     fb2:	0889c783          	lbu	a5,136(s3)
     fb6:	01479863          	bne	a5,s4,fc6 <main+0x16e>
     fba:	0899c703          	lbu	a4,137(s3)
     fbe:	06400793          	li	a5,100
     fc2:	f4f70fe3          	beq	a4,a5,f20 <main+0xc8>
      struct cmd *cmd = parsecmd(buf);
     fc6:	854a                	mv	a0,s2
     fc8:	00000097          	auipc	ra,0x0
     fcc:	e04080e7          	jalr	-508(ra) # dcc <parsecmd>
     fd0:	84aa                	mv	s1,a0
      if(ecmd->argv[0] == 0) {
     fd2:	6508                	ld	a0,8(a0)
     fd4:	d145                	beqz	a0,f74 <main+0x11c>
      else if(!strcmp(ecmd->argv[0], "export"))
     fd6:	85d6                	mv	a1,s5
     fd8:	00000097          	auipc	ra,0x0
     fdc:	0aa080e7          	jalr	170(ra) # 1082 <strcmp>
     fe0:	e115                	bnez	a0,1004 <main+0x1ac>
        if(ecmd->argv[1] == NULL)
     fe2:	689c                	ld	a5,16(s1)
     fe4:	dfd1                	beqz	a5,f80 <main+0x128>
        else if(export(ecmd->argv) < 0)
     fe6:	00848513          	addi	a0,s1,8
     fea:	fffff097          	auipc	ra,0xfffff
     fee:	07a080e7          	jalr	122(ra) # 64 <export>
     ff2:	f8055de3          	bgez	a0,f8c <main+0x134>
          fprintf(2, "export failed\n");
     ff6:	85de                	mv	a1,s7
     ff8:	4509                	li	a0,2
     ffa:	00000097          	auipc	ra,0x0
     ffe:	690080e7          	jalr	1680(ra) # 168a <fprintf>
    1002:	b769                	j	f8c <main+0x134>
      else if(fork1() == 0) 
    1004:	fffff097          	auipc	ra,0xfffff
    1008:	3c2080e7          	jalr	962(ra) # 3c6 <fork1>
    100c:	cd01                	beqz	a0,1024 <main+0x1cc>
      wait(0);
    100e:	4501                	li	a0,0
    1010:	00000097          	auipc	ra,0x0
    1014:	30a080e7          	jalr	778(ra) # 131a <wait>
      free(cmd);
    1018:	8526                	mv	a0,s1
    101a:	00000097          	auipc	ra,0x0
    101e:	6d4080e7          	jalr	1748(ra) # 16ee <free>
    1022:	bf95                	j	f96 <main+0x13e>
        runcmd(cmd);
    1024:	8526                	mv	a0,s1
    1026:	fffff097          	auipc	ra,0xfffff
    102a:	3ce080e7          	jalr	974(ra) # 3f4 <runcmd>
  exit(0);
    102e:	4501                	li	a0,0
    1030:	00000097          	auipc	ra,0x0
    1034:	2e2080e7          	jalr	738(ra) # 1312 <exit>

0000000000001038 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
    1038:	1141                	addi	sp,sp,-16
    103a:	e422                	sd	s0,8(sp)
    103c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103e:	87aa                	mv	a5,a0
    1040:	0585                	addi	a1,a1,1
    1042:	0785                	addi	a5,a5,1
    1044:	fff5c703          	lbu	a4,-1(a1)
    1048:	fee78fa3          	sb	a4,-1(a5)
    104c:	fb75                	bnez	a4,1040 <strcpy+0x8>
    ;
  return os;
}
    104e:	6422                	ld	s0,8(sp)
    1050:	0141                	addi	sp,sp,16
    1052:	8082                	ret

0000000000001054 <strcat>:

char*
strcat(char *s, const char *t)
{
    1054:	1141                	addi	sp,sp,-16
    1056:	e422                	sd	s0,8(sp)
    1058:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
    105a:	00054783          	lbu	a5,0(a0)
    105e:	c385                	beqz	a5,107e <strcat+0x2a>
    1060:	87aa                	mv	a5,a0
    s++;
    1062:	0785                	addi	a5,a5,1
  while(*s)
    1064:	0007c703          	lbu	a4,0(a5)
    1068:	ff6d                	bnez	a4,1062 <strcat+0xe>
  while((*s++ = *t++))
    106a:	0585                	addi	a1,a1,1
    106c:	0785                	addi	a5,a5,1
    106e:	fff5c703          	lbu	a4,-1(a1)
    1072:	fee78fa3          	sb	a4,-1(a5)
    1076:	fb75                	bnez	a4,106a <strcat+0x16>
    ;
  return os;
}
    1078:	6422                	ld	s0,8(sp)
    107a:	0141                	addi	sp,sp,16
    107c:	8082                	ret
  while(*s)
    107e:	87aa                	mv	a5,a0
    1080:	b7ed                	j	106a <strcat+0x16>

0000000000001082 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    1082:	1141                	addi	sp,sp,-16
    1084:	e422                	sd	s0,8(sp)
    1086:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    1088:	00054783          	lbu	a5,0(a0)
    108c:	cf91                	beqz	a5,10a8 <strcmp+0x26>
    108e:	0005c703          	lbu	a4,0(a1)
    1092:	00f71b63          	bne	a4,a5,10a8 <strcmp+0x26>
    p++, q++;
    1096:	0505                	addi	a0,a0,1
    1098:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    109a:	00054783          	lbu	a5,0(a0)
    109e:	c789                	beqz	a5,10a8 <strcmp+0x26>
    10a0:	0005c703          	lbu	a4,0(a1)
    10a4:	fef709e3          	beq	a4,a5,1096 <strcmp+0x14>
  return (uchar)*p - (uchar)*q;
    10a8:	0005c503          	lbu	a0,0(a1)
}
    10ac:	40a7853b          	subw	a0,a5,a0
    10b0:	6422                	ld	s0,8(sp)
    10b2:	0141                	addi	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <strlen>:

uint
strlen(const char *s)
{
    10b6:	1141                	addi	sp,sp,-16
    10b8:	e422                	sd	s0,8(sp)
    10ba:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    10bc:	00054783          	lbu	a5,0(a0)
    10c0:	cf91                	beqz	a5,10dc <strlen+0x26>
    10c2:	0505                	addi	a0,a0,1
    10c4:	87aa                	mv	a5,a0
    10c6:	4685                	li	a3,1
    10c8:	9e89                	subw	a3,a3,a0
    10ca:	00f6853b          	addw	a0,a3,a5
    10ce:	0785                	addi	a5,a5,1
    10d0:	fff7c703          	lbu	a4,-1(a5)
    10d4:	fb7d                	bnez	a4,10ca <strlen+0x14>
    ;
  return n;
}
    10d6:	6422                	ld	s0,8(sp)
    10d8:	0141                	addi	sp,sp,16
    10da:	8082                	ret
  for(n = 0; s[n]; n++)
    10dc:	4501                	li	a0,0
    10de:	bfe5                	j	10d6 <strlen+0x20>

00000000000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	1141                	addi	sp,sp,-16
    10e2:	e422                	sd	s0,8(sp)
    10e4:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    10e6:	ce09                	beqz	a2,1100 <memset+0x20>
    10e8:	87aa                	mv	a5,a0
    10ea:	fff6071b          	addiw	a4,a2,-1
    10ee:	1702                	slli	a4,a4,0x20
    10f0:	9301                	srli	a4,a4,0x20
    10f2:	0705                	addi	a4,a4,1
    10f4:	972a                	add	a4,a4,a0
    cdst[i] = c;
    10f6:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    10fa:	0785                	addi	a5,a5,1
    10fc:	fee79de3          	bne	a5,a4,10f6 <memset+0x16>
  }
  return dst;
}
    1100:	6422                	ld	s0,8(sp)
    1102:	0141                	addi	sp,sp,16
    1104:	8082                	ret

0000000000001106 <strchr>:

char*
strchr(const char *s, char c)
{
    1106:	1141                	addi	sp,sp,-16
    1108:	e422                	sd	s0,8(sp)
    110a:	0800                	addi	s0,sp,16
  for(; *s; s++)
    110c:	00054783          	lbu	a5,0(a0)
    1110:	cf91                	beqz	a5,112c <strchr+0x26>
    if(*s == c)
    1112:	00f58a63          	beq	a1,a5,1126 <strchr+0x20>
  for(; *s; s++)
    1116:	0505                	addi	a0,a0,1
    1118:	00054783          	lbu	a5,0(a0)
    111c:	c781                	beqz	a5,1124 <strchr+0x1e>
    if(*s == c)
    111e:	feb79ce3          	bne	a5,a1,1116 <strchr+0x10>
    1122:	a011                	j	1126 <strchr+0x20>
      return (char*)s;
  return 0;
    1124:	4501                	li	a0,0
}
    1126:	6422                	ld	s0,8(sp)
    1128:	0141                	addi	sp,sp,16
    112a:	8082                	ret
  return 0;
    112c:	4501                	li	a0,0
    112e:	bfe5                	j	1126 <strchr+0x20>

0000000000001130 <gets>:

char*
gets(char *buf, int max)
{
    1130:	711d                	addi	sp,sp,-96
    1132:	ec86                	sd	ra,88(sp)
    1134:	e8a2                	sd	s0,80(sp)
    1136:	e4a6                	sd	s1,72(sp)
    1138:	e0ca                	sd	s2,64(sp)
    113a:	fc4e                	sd	s3,56(sp)
    113c:	f852                	sd	s4,48(sp)
    113e:	f456                	sd	s5,40(sp)
    1140:	f05a                	sd	s6,32(sp)
    1142:	ec5e                	sd	s7,24(sp)
    1144:	e862                	sd	s8,16(sp)
    1146:	1080                	addi	s0,sp,96
    1148:	8c2a                	mv	s8,a0
    114a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    114c:	892a                	mv	s2,a0
    114e:	4981                	li	s3,0
    cc = read(0, &c, 1);
    1150:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    1154:	4b29                	li	s6,10
    1156:	4bb5                	li	s7,13
  for(i=0; i+1 < max; ){
    1158:	0019849b          	addiw	s1,s3,1
    115c:	0344d763          	ble	s4,s1,118a <gets+0x5a>
    cc = read(0, &c, 1);
    1160:	4605                	li	a2,1
    1162:	85d6                	mv	a1,s5
    1164:	4501                	li	a0,0
    1166:	00000097          	auipc	ra,0x0
    116a:	1c4080e7          	jalr	452(ra) # 132a <read>
    if(cc < 1)
    116e:	00a05e63          	blez	a0,118a <gets+0x5a>
    buf[i++] = c;
    1172:	faf44783          	lbu	a5,-81(s0)
    1176:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    117a:	01678763          	beq	a5,s6,1188 <gets+0x58>
    117e:	0905                	addi	s2,s2,1
  for(i=0; i+1 < max; ){
    1180:	89a6                	mv	s3,s1
    if(c == '\n' || c == '\r')
    1182:	fd779be3          	bne	a5,s7,1158 <gets+0x28>
    1186:	a011                	j	118a <gets+0x5a>
  for(i=0; i+1 < max; ){
    1188:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    118a:	99e2                	add	s3,s3,s8
    118c:	00098023          	sb	zero,0(s3)
  return buf;
}
    1190:	8562                	mv	a0,s8
    1192:	60e6                	ld	ra,88(sp)
    1194:	6446                	ld	s0,80(sp)
    1196:	64a6                	ld	s1,72(sp)
    1198:	6906                	ld	s2,64(sp)
    119a:	79e2                	ld	s3,56(sp)
    119c:	7a42                	ld	s4,48(sp)
    119e:	7aa2                	ld	s5,40(sp)
    11a0:	7b02                	ld	s6,32(sp)
    11a2:	6be2                	ld	s7,24(sp)
    11a4:	6c42                	ld	s8,16(sp)
    11a6:	6125                	addi	sp,sp,96
    11a8:	8082                	ret

00000000000011aa <stat>:

int
stat(const char *n, struct stat *st)
{
    11aa:	1101                	addi	sp,sp,-32
    11ac:	ec06                	sd	ra,24(sp)
    11ae:	e822                	sd	s0,16(sp)
    11b0:	e426                	sd	s1,8(sp)
    11b2:	e04a                	sd	s2,0(sp)
    11b4:	1000                	addi	s0,sp,32
    11b6:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11b8:	4581                	li	a1,0
    11ba:	00000097          	auipc	ra,0x0
    11be:	198080e7          	jalr	408(ra) # 1352 <open>
  if(fd < 0)
    11c2:	02054563          	bltz	a0,11ec <stat+0x42>
    11c6:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    11c8:	85ca                	mv	a1,s2
    11ca:	00000097          	auipc	ra,0x0
    11ce:	190080e7          	jalr	400(ra) # 135a <fstat>
    11d2:	892a                	mv	s2,a0
  close(fd);
    11d4:	8526                	mv	a0,s1
    11d6:	00000097          	auipc	ra,0x0
    11da:	164080e7          	jalr	356(ra) # 133a <close>
  return r;
}
    11de:	854a                	mv	a0,s2
    11e0:	60e2                	ld	ra,24(sp)
    11e2:	6442                	ld	s0,16(sp)
    11e4:	64a2                	ld	s1,8(sp)
    11e6:	6902                	ld	s2,0(sp)
    11e8:	6105                	addi	sp,sp,32
    11ea:	8082                	ret
    return -1;
    11ec:	597d                	li	s2,-1
    11ee:	bfc5                	j	11de <stat+0x34>

00000000000011f0 <atoi>:

int
atoi(const char *s)
{
    11f0:	1141                	addi	sp,sp,-16
    11f2:	e422                	sd	s0,8(sp)
    11f4:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
    11f6:	00054703          	lbu	a4,0(a0)
    11fa:	02d00793          	li	a5,45
  int neg = 1;
    11fe:	4805                	li	a6,1
  if (*s == '-') {
    1200:	04f70363          	beq	a4,a5,1246 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
    1204:	00054683          	lbu	a3,0(a0)
    1208:	fd06879b          	addiw	a5,a3,-48
    120c:	0ff7f793          	andi	a5,a5,255
    1210:	4725                	li	a4,9
    1212:	02f76d63          	bltu	a4,a5,124c <atoi+0x5c>
  n = 0;
    1216:	4601                	li	a2,0
  while('0' <= *s && *s <= '9')
    1218:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
    121a:	0505                	addi	a0,a0,1
    121c:	0026179b          	slliw	a5,a2,0x2
    1220:	9fb1                	addw	a5,a5,a2
    1222:	0017979b          	slliw	a5,a5,0x1
    1226:	9fb5                	addw	a5,a5,a3
    1228:	fd07861b          	addiw	a2,a5,-48
  while('0' <= *s && *s <= '9')
    122c:	00054683          	lbu	a3,0(a0)
    1230:	fd06871b          	addiw	a4,a3,-48
    1234:	0ff77713          	andi	a4,a4,255
    1238:	fee5f1e3          	bleu	a4,a1,121a <atoi+0x2a>
  return n * neg;
}
    123c:	02c8053b          	mulw	a0,a6,a2
    1240:	6422                	ld	s0,8(sp)
    1242:	0141                	addi	sp,sp,16
    1244:	8082                	ret
    s++;
    1246:	0505                	addi	a0,a0,1
    neg = -1;
    1248:	587d                	li	a6,-1
    124a:	bf6d                	j	1204 <atoi+0x14>
  n = 0;
    124c:	4601                	li	a2,0
    124e:	b7fd                	j	123c <atoi+0x4c>

0000000000001250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1250:	1141                	addi	sp,sp,-16
    1252:	e422                	sd	s0,8(sp)
    1254:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    1256:	02b57663          	bleu	a1,a0,1282 <memmove+0x32>
    while(n-- > 0)
    125a:	02c05163          	blez	a2,127c <memmove+0x2c>
    125e:	fff6079b          	addiw	a5,a2,-1
    1262:	1782                	slli	a5,a5,0x20
    1264:	9381                	srli	a5,a5,0x20
    1266:	0785                	addi	a5,a5,1
    1268:	97aa                	add	a5,a5,a0
  dst = vdst;
    126a:	872a                	mv	a4,a0
      *dst++ = *src++;
    126c:	0585                	addi	a1,a1,1
    126e:	0705                	addi	a4,a4,1
    1270:	fff5c683          	lbu	a3,-1(a1)
    1274:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    1278:	fee79ae3          	bne	a5,a4,126c <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    127c:	6422                	ld	s0,8(sp)
    127e:	0141                	addi	sp,sp,16
    1280:	8082                	ret
    dst += n;
    1282:	00c50733          	add	a4,a0,a2
    src += n;
    1286:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    1288:	fec05ae3          	blez	a2,127c <memmove+0x2c>
    128c:	fff6079b          	addiw	a5,a2,-1
    1290:	1782                	slli	a5,a5,0x20
    1292:	9381                	srli	a5,a5,0x20
    1294:	fff7c793          	not	a5,a5
    1298:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    129a:	15fd                	addi	a1,a1,-1
    129c:	177d                	addi	a4,a4,-1
    129e:	0005c683          	lbu	a3,0(a1)
    12a2:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    12a6:	fef71ae3          	bne	a4,a5,129a <memmove+0x4a>
    12aa:	bfc9                	j	127c <memmove+0x2c>

00000000000012ac <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    12ac:	1141                	addi	sp,sp,-16
    12ae:	e422                	sd	s0,8(sp)
    12b0:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    12b2:	ce15                	beqz	a2,12ee <memcmp+0x42>
    12b4:	fff6069b          	addiw	a3,a2,-1
    if (*p1 != *p2) {
    12b8:	00054783          	lbu	a5,0(a0)
    12bc:	0005c703          	lbu	a4,0(a1)
    12c0:	02e79063          	bne	a5,a4,12e0 <memcmp+0x34>
    12c4:	1682                	slli	a3,a3,0x20
    12c6:	9281                	srli	a3,a3,0x20
    12c8:	0685                	addi	a3,a3,1
    12ca:	96aa                	add	a3,a3,a0
      return *p1 - *p2;
    }
    p1++;
    12cc:	0505                	addi	a0,a0,1
    p2++;
    12ce:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    12d0:	00d50d63          	beq	a0,a3,12ea <memcmp+0x3e>
    if (*p1 != *p2) {
    12d4:	00054783          	lbu	a5,0(a0)
    12d8:	0005c703          	lbu	a4,0(a1)
    12dc:	fee788e3          	beq	a5,a4,12cc <memcmp+0x20>
      return *p1 - *p2;
    12e0:	40e7853b          	subw	a0,a5,a4
  }
  return 0;
}
    12e4:	6422                	ld	s0,8(sp)
    12e6:	0141                	addi	sp,sp,16
    12e8:	8082                	ret
  return 0;
    12ea:	4501                	li	a0,0
    12ec:	bfe5                	j	12e4 <memcmp+0x38>
    12ee:	4501                	li	a0,0
    12f0:	bfd5                	j	12e4 <memcmp+0x38>

00000000000012f2 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    12f2:	1141                	addi	sp,sp,-16
    12f4:	e406                	sd	ra,8(sp)
    12f6:	e022                	sd	s0,0(sp)
    12f8:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    12fa:	00000097          	auipc	ra,0x0
    12fe:	f56080e7          	jalr	-170(ra) # 1250 <memmove>
}
    1302:	60a2                	ld	ra,8(sp)
    1304:	6402                	ld	s0,0(sp)
    1306:	0141                	addi	sp,sp,16
    1308:	8082                	ret

000000000000130a <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
    130a:	4885                	li	a7,1
 ecall
    130c:	00000073          	ecall
 ret
    1310:	8082                	ret

0000000000001312 <exit>:
.global exit
exit:
 li a7, SYS_exit
    1312:	4889                	li	a7,2
 ecall
    1314:	00000073          	ecall
 ret
    1318:	8082                	ret

000000000000131a <wait>:
.global wait
wait:
 li a7, SYS_wait
    131a:	488d                	li	a7,3
 ecall
    131c:	00000073          	ecall
 ret
    1320:	8082                	ret

0000000000001322 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    1322:	4891                	li	a7,4
 ecall
    1324:	00000073          	ecall
 ret
    1328:	8082                	ret

000000000000132a <read>:
.global read
read:
 li a7, SYS_read
    132a:	4895                	li	a7,5
 ecall
    132c:	00000073          	ecall
 ret
    1330:	8082                	ret

0000000000001332 <write>:
.global write
write:
 li a7, SYS_write
    1332:	48c1                	li	a7,16
 ecall
    1334:	00000073          	ecall
 ret
    1338:	8082                	ret

000000000000133a <close>:
.global close
close:
 li a7, SYS_close
    133a:	48d5                	li	a7,21
 ecall
    133c:	00000073          	ecall
 ret
    1340:	8082                	ret

0000000000001342 <kill>:
.global kill
kill:
 li a7, SYS_kill
    1342:	4899                	li	a7,6
 ecall
    1344:	00000073          	ecall
 ret
    1348:	8082                	ret

000000000000134a <exec>:
.global exec
exec:
 li a7, SYS_exec
    134a:	489d                	li	a7,7
 ecall
    134c:	00000073          	ecall
 ret
    1350:	8082                	ret

0000000000001352 <open>:
.global open
open:
 li a7, SYS_open
    1352:	48bd                	li	a7,15
 ecall
    1354:	00000073          	ecall
 ret
    1358:	8082                	ret

000000000000135a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    135a:	48a1                	li	a7,8
 ecall
    135c:	00000073          	ecall
 ret
    1360:	8082                	ret

0000000000001362 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1362:	48d1                	li	a7,20
 ecall
    1364:	00000073          	ecall
 ret
    1368:	8082                	ret

000000000000136a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    136a:	48a5                	li	a7,9
 ecall
    136c:	00000073          	ecall
 ret
    1370:	8082                	ret

0000000000001372 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1372:	48a9                	li	a7,10
 ecall
    1374:	00000073          	ecall
 ret
    1378:	8082                	ret

000000000000137a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    137a:	48ad                	li	a7,11
 ecall
    137c:	00000073          	ecall
 ret
    1380:	8082                	ret

0000000000001382 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    1382:	48b1                	li	a7,12
 ecall
    1384:	00000073          	ecall
 ret
    1388:	8082                	ret

000000000000138a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    138a:	48b5                	li	a7,13
 ecall
    138c:	00000073          	ecall
 ret
    1390:	8082                	ret

0000000000001392 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1392:	48b9                	li	a7,14
 ecall
    1394:	00000073          	ecall
 ret
    1398:	8082                	ret

000000000000139a <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
    139a:	48d9                	li	a7,22
 ecall
    139c:	00000073          	ecall
 ret
    13a0:	8082                	ret

00000000000013a2 <dev>:
.global dev
dev:
 li a7, SYS_dev
    13a2:	48dd                	li	a7,23
 ecall
    13a4:	00000073          	ecall
 ret
    13a8:	8082                	ret

00000000000013aa <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
    13aa:	48e1                	li	a7,24
 ecall
    13ac:	00000073          	ecall
 ret
    13b0:	8082                	ret

00000000000013b2 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
    13b2:	48e5                	li	a7,25
 ecall
    13b4:	00000073          	ecall
 ret
    13b8:	8082                	ret

00000000000013ba <remove>:
.global remove
remove:
 li a7, SYS_remove
    13ba:	48c5                	li	a7,17
 ecall
    13bc:	00000073          	ecall
 ret
    13c0:	8082                	ret

00000000000013c2 <trace>:
.global trace
trace:
 li a7, SYS_trace
    13c2:	48c9                	li	a7,18
 ecall
    13c4:	00000073          	ecall
 ret
    13c8:	8082                	ret

00000000000013ca <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
    13ca:	48cd                	li	a7,19
 ecall
    13cc:	00000073          	ecall
 ret
    13d0:	8082                	ret

00000000000013d2 <rename>:
.global rename
rename:
 li a7, SYS_rename
    13d2:	48e9                	li	a7,26
 ecall
    13d4:	00000073          	ecall
 ret
    13d8:	8082                	ret

00000000000013da <setqos>:
.global setqos
setqos:
 li a7, SYS_setqos
    13da:	48ed                	li	a7,27
 ecall
    13dc:	00000073          	ecall
 ret
    13e0:	8082                	ret

00000000000013e2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    13e2:	1101                	addi	sp,sp,-32
    13e4:	ec06                	sd	ra,24(sp)
    13e6:	e822                	sd	s0,16(sp)
    13e8:	1000                	addi	s0,sp,32
    13ea:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    13ee:	4605                	li	a2,1
    13f0:	fef40593          	addi	a1,s0,-17
    13f4:	00000097          	auipc	ra,0x0
    13f8:	f3e080e7          	jalr	-194(ra) # 1332 <write>
}
    13fc:	60e2                	ld	ra,24(sp)
    13fe:	6442                	ld	s0,16(sp)
    1400:	6105                	addi	sp,sp,32
    1402:	8082                	ret

0000000000001404 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1404:	7139                	addi	sp,sp,-64
    1406:	fc06                	sd	ra,56(sp)
    1408:	f822                	sd	s0,48(sp)
    140a:	f426                	sd	s1,40(sp)
    140c:	f04a                	sd	s2,32(sp)
    140e:	ec4e                	sd	s3,24(sp)
    1410:	0080                	addi	s0,sp,64
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1412:	c299                	beqz	a3,1418 <printint+0x14>
    1414:	0005ce63          	bltz	a1,1430 <printint+0x2c>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1418:	2581                	sext.w	a1,a1
  neg = 0;
    141a:	4301                	li	t1,0
  }

  i = 0;
    141c:	fc040913          	addi	s2,s0,-64
  neg = 0;
    1420:	874a                	mv	a4,s2
  i = 0;
    1422:	4801                	li	a6,0
  do{
    buf[i++] = digits[x % base];
    1424:	2601                	sext.w	a2,a2
    1426:	00000897          	auipc	a7,0x0
    142a:	61a88893          	addi	a7,a7,1562 # 1a40 <digits>
    142e:	a801                	j	143e <printint+0x3a>
    x = -xx;
    1430:	40b005bb          	negw	a1,a1
    1434:	2581                	sext.w	a1,a1
    neg = 1;
    1436:	4305                	li	t1,1
    x = -xx;
    1438:	b7d5                	j	141c <printint+0x18>
  }while((x /= base) != 0);
    143a:	85be                	mv	a1,a5
    buf[i++] = digits[x % base];
    143c:	8836                	mv	a6,a3
    143e:	0018069b          	addiw	a3,a6,1
    1442:	02c5f7bb          	remuw	a5,a1,a2
    1446:	1782                	slli	a5,a5,0x20
    1448:	9381                	srli	a5,a5,0x20
    144a:	97c6                	add	a5,a5,a7
    144c:	0007c783          	lbu	a5,0(a5)
    1450:	00f70023          	sb	a5,0(a4)
  }while((x /= base) != 0);
    1454:	0705                	addi	a4,a4,1
    1456:	02c5d7bb          	divuw	a5,a1,a2
    145a:	fec5f0e3          	bleu	a2,a1,143a <printint+0x36>
  if(neg)
    145e:	00030b63          	beqz	t1,1474 <printint+0x70>
    buf[i++] = '-';
    1462:	fd040793          	addi	a5,s0,-48
    1466:	96be                	add	a3,a3,a5
    1468:	02d00793          	li	a5,45
    146c:	fef68823          	sb	a5,-16(a3)
    1470:	0028069b          	addiw	a3,a6,2

  while(--i >= 0)
    1474:	02d05763          	blez	a3,14a2 <printint+0x9e>
    1478:	89aa                	mv	s3,a0
    147a:	fc040493          	addi	s1,s0,-64
    147e:	94b6                	add	s1,s1,a3
    1480:	197d                	addi	s2,s2,-1
    1482:	9936                	add	s2,s2,a3
    1484:	36fd                	addiw	a3,a3,-1
    1486:	1682                	slli	a3,a3,0x20
    1488:	9281                	srli	a3,a3,0x20
    148a:	40d90933          	sub	s2,s2,a3
    putc(fd, buf[i]);
    148e:	fff4c583          	lbu	a1,-1(s1)
    1492:	854e                	mv	a0,s3
    1494:	00000097          	auipc	ra,0x0
    1498:	f4e080e7          	jalr	-178(ra) # 13e2 <putc>
  while(--i >= 0)
    149c:	14fd                	addi	s1,s1,-1
    149e:	ff2498e3          	bne	s1,s2,148e <printint+0x8a>
}
    14a2:	70e2                	ld	ra,56(sp)
    14a4:	7442                	ld	s0,48(sp)
    14a6:	74a2                	ld	s1,40(sp)
    14a8:	7902                	ld	s2,32(sp)
    14aa:	69e2                	ld	s3,24(sp)
    14ac:	6121                	addi	sp,sp,64
    14ae:	8082                	ret

00000000000014b0 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    14b0:	7119                	addi	sp,sp,-128
    14b2:	fc86                	sd	ra,120(sp)
    14b4:	f8a2                	sd	s0,112(sp)
    14b6:	f4a6                	sd	s1,104(sp)
    14b8:	f0ca                	sd	s2,96(sp)
    14ba:	ecce                	sd	s3,88(sp)
    14bc:	e8d2                	sd	s4,80(sp)
    14be:	e4d6                	sd	s5,72(sp)
    14c0:	e0da                	sd	s6,64(sp)
    14c2:	fc5e                	sd	s7,56(sp)
    14c4:	f862                	sd	s8,48(sp)
    14c6:	f466                	sd	s9,40(sp)
    14c8:	f06a                	sd	s10,32(sp)
    14ca:	ec6e                	sd	s11,24(sp)
    14cc:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    14ce:	0005c483          	lbu	s1,0(a1)
    14d2:	18048d63          	beqz	s1,166c <vprintf+0x1bc>
    14d6:	8aaa                	mv	s5,a0
    14d8:	8b32                	mv	s6,a2
    14da:	00158913          	addi	s2,a1,1
  state = 0;
    14de:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    14e0:	02500a13          	li	s4,37
      if(c == 'd'){
    14e4:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
    14e8:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
    14ec:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
    14f0:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    14f4:	00000b97          	auipc	s7,0x0
    14f8:	54cb8b93          	addi	s7,s7,1356 # 1a40 <digits>
    14fc:	a839                	j	151a <vprintf+0x6a>
        putc(fd, c);
    14fe:	85a6                	mv	a1,s1
    1500:	8556                	mv	a0,s5
    1502:	00000097          	auipc	ra,0x0
    1506:	ee0080e7          	jalr	-288(ra) # 13e2 <putc>
    150a:	a019                	j	1510 <vprintf+0x60>
    } else if(state == '%'){
    150c:	01498f63          	beq	s3,s4,152a <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
    1510:	0905                	addi	s2,s2,1
    1512:	fff94483          	lbu	s1,-1(s2)
    1516:	14048b63          	beqz	s1,166c <vprintf+0x1bc>
    c = fmt[i] & 0xff;
    151a:	0004879b          	sext.w	a5,s1
    if(state == 0){
    151e:	fe0997e3          	bnez	s3,150c <vprintf+0x5c>
      if(c == '%'){
    1522:	fd479ee3          	bne	a5,s4,14fe <vprintf+0x4e>
        state = '%';
    1526:	89be                	mv	s3,a5
    1528:	b7e5                	j	1510 <vprintf+0x60>
      if(c == 'd'){
    152a:	05878063          	beq	a5,s8,156a <vprintf+0xba>
      } else if(c == 'l') {
    152e:	05978c63          	beq	a5,s9,1586 <vprintf+0xd6>
      } else if(c == 'x') {
    1532:	07a78863          	beq	a5,s10,15a2 <vprintf+0xf2>
      } else if(c == 'p') {
    1536:	09b78463          	beq	a5,s11,15be <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
    153a:	07300713          	li	a4,115
    153e:	0ce78563          	beq	a5,a4,1608 <vprintf+0x158>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1542:	06300713          	li	a4,99
    1546:	0ee78c63          	beq	a5,a4,163e <vprintf+0x18e>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
    154a:	11478663          	beq	a5,s4,1656 <vprintf+0x1a6>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    154e:	85d2                	mv	a1,s4
    1550:	8556                	mv	a0,s5
    1552:	00000097          	auipc	ra,0x0
    1556:	e90080e7          	jalr	-368(ra) # 13e2 <putc>
        putc(fd, c);
    155a:	85a6                	mv	a1,s1
    155c:	8556                	mv	a0,s5
    155e:	00000097          	auipc	ra,0x0
    1562:	e84080e7          	jalr	-380(ra) # 13e2 <putc>
      }
      state = 0;
    1566:	4981                	li	s3,0
    1568:	b765                	j	1510 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
    156a:	008b0493          	addi	s1,s6,8
    156e:	4685                	li	a3,1
    1570:	4629                	li	a2,10
    1572:	000b2583          	lw	a1,0(s6)
    1576:	8556                	mv	a0,s5
    1578:	00000097          	auipc	ra,0x0
    157c:	e8c080e7          	jalr	-372(ra) # 1404 <printint>
    1580:	8b26                	mv	s6,s1
      state = 0;
    1582:	4981                	li	s3,0
    1584:	b771                	j	1510 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1586:	008b0493          	addi	s1,s6,8
    158a:	4681                	li	a3,0
    158c:	4629                	li	a2,10
    158e:	000b2583          	lw	a1,0(s6)
    1592:	8556                	mv	a0,s5
    1594:	00000097          	auipc	ra,0x0
    1598:	e70080e7          	jalr	-400(ra) # 1404 <printint>
    159c:	8b26                	mv	s6,s1
      state = 0;
    159e:	4981                	li	s3,0
    15a0:	bf85                	j	1510 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    15a2:	008b0493          	addi	s1,s6,8
    15a6:	4681                	li	a3,0
    15a8:	4641                	li	a2,16
    15aa:	000b2583          	lw	a1,0(s6)
    15ae:	8556                	mv	a0,s5
    15b0:	00000097          	auipc	ra,0x0
    15b4:	e54080e7          	jalr	-428(ra) # 1404 <printint>
    15b8:	8b26                	mv	s6,s1
      state = 0;
    15ba:	4981                	li	s3,0
    15bc:	bf91                	j	1510 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    15be:	008b0793          	addi	a5,s6,8
    15c2:	f8f43423          	sd	a5,-120(s0)
    15c6:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    15ca:	03000593          	li	a1,48
    15ce:	8556                	mv	a0,s5
    15d0:	00000097          	auipc	ra,0x0
    15d4:	e12080e7          	jalr	-494(ra) # 13e2 <putc>
  putc(fd, 'x');
    15d8:	85ea                	mv	a1,s10
    15da:	8556                	mv	a0,s5
    15dc:	00000097          	auipc	ra,0x0
    15e0:	e06080e7          	jalr	-506(ra) # 13e2 <putc>
    15e4:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    15e6:	03c9d793          	srli	a5,s3,0x3c
    15ea:	97de                	add	a5,a5,s7
    15ec:	0007c583          	lbu	a1,0(a5)
    15f0:	8556                	mv	a0,s5
    15f2:	00000097          	auipc	ra,0x0
    15f6:	df0080e7          	jalr	-528(ra) # 13e2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    15fa:	0992                	slli	s3,s3,0x4
    15fc:	34fd                	addiw	s1,s1,-1
    15fe:	f4e5                	bnez	s1,15e6 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
    1600:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    1604:	4981                	li	s3,0
    1606:	b729                	j	1510 <vprintf+0x60>
        s = va_arg(ap, char*);
    1608:	008b0993          	addi	s3,s6,8
    160c:	000b3483          	ld	s1,0(s6)
        if(s == 0)
    1610:	c085                	beqz	s1,1630 <vprintf+0x180>
        while(*s != 0){
    1612:	0004c583          	lbu	a1,0(s1)
    1616:	c9a1                	beqz	a1,1666 <vprintf+0x1b6>
          putc(fd, *s);
    1618:	8556                	mv	a0,s5
    161a:	00000097          	auipc	ra,0x0
    161e:	dc8080e7          	jalr	-568(ra) # 13e2 <putc>
          s++;
    1622:	0485                	addi	s1,s1,1
        while(*s != 0){
    1624:	0004c583          	lbu	a1,0(s1)
    1628:	f9e5                	bnez	a1,1618 <vprintf+0x168>
        s = va_arg(ap, char*);
    162a:	8b4e                	mv	s6,s3
      state = 0;
    162c:	4981                	li	s3,0
    162e:	b5cd                	j	1510 <vprintf+0x60>
          s = "(null)";
    1630:	00000497          	auipc	s1,0x0
    1634:	42848493          	addi	s1,s1,1064 # 1a58 <digits+0x18>
        while(*s != 0){
    1638:	02800593          	li	a1,40
    163c:	bff1                	j	1618 <vprintf+0x168>
        putc(fd, va_arg(ap, uint));
    163e:	008b0493          	addi	s1,s6,8
    1642:	000b4583          	lbu	a1,0(s6)
    1646:	8556                	mv	a0,s5
    1648:	00000097          	auipc	ra,0x0
    164c:	d9a080e7          	jalr	-614(ra) # 13e2 <putc>
    1650:	8b26                	mv	s6,s1
      state = 0;
    1652:	4981                	li	s3,0
    1654:	bd75                	j	1510 <vprintf+0x60>
        putc(fd, c);
    1656:	85d2                	mv	a1,s4
    1658:	8556                	mv	a0,s5
    165a:	00000097          	auipc	ra,0x0
    165e:	d88080e7          	jalr	-632(ra) # 13e2 <putc>
      state = 0;
    1662:	4981                	li	s3,0
    1664:	b575                	j	1510 <vprintf+0x60>
        s = va_arg(ap, char*);
    1666:	8b4e                	mv	s6,s3
      state = 0;
    1668:	4981                	li	s3,0
    166a:	b55d                	j	1510 <vprintf+0x60>
    }
  }
}
    166c:	70e6                	ld	ra,120(sp)
    166e:	7446                	ld	s0,112(sp)
    1670:	74a6                	ld	s1,104(sp)
    1672:	7906                	ld	s2,96(sp)
    1674:	69e6                	ld	s3,88(sp)
    1676:	6a46                	ld	s4,80(sp)
    1678:	6aa6                	ld	s5,72(sp)
    167a:	6b06                	ld	s6,64(sp)
    167c:	7be2                	ld	s7,56(sp)
    167e:	7c42                	ld	s8,48(sp)
    1680:	7ca2                	ld	s9,40(sp)
    1682:	7d02                	ld	s10,32(sp)
    1684:	6de2                	ld	s11,24(sp)
    1686:	6109                	addi	sp,sp,128
    1688:	8082                	ret

000000000000168a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    168a:	715d                	addi	sp,sp,-80
    168c:	ec06                	sd	ra,24(sp)
    168e:	e822                	sd	s0,16(sp)
    1690:	1000                	addi	s0,sp,32
    1692:	e010                	sd	a2,0(s0)
    1694:	e414                	sd	a3,8(s0)
    1696:	e818                	sd	a4,16(s0)
    1698:	ec1c                	sd	a5,24(s0)
    169a:	03043023          	sd	a6,32(s0)
    169e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    16a2:	8622                	mv	a2,s0
    16a4:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    16a8:	00000097          	auipc	ra,0x0
    16ac:	e08080e7          	jalr	-504(ra) # 14b0 <vprintf>
}
    16b0:	60e2                	ld	ra,24(sp)
    16b2:	6442                	ld	s0,16(sp)
    16b4:	6161                	addi	sp,sp,80
    16b6:	8082                	ret

00000000000016b8 <printf>:

void
printf(const char *fmt, ...)
{
    16b8:	711d                	addi	sp,sp,-96
    16ba:	ec06                	sd	ra,24(sp)
    16bc:	e822                	sd	s0,16(sp)
    16be:	1000                	addi	s0,sp,32
    16c0:	e40c                	sd	a1,8(s0)
    16c2:	e810                	sd	a2,16(s0)
    16c4:	ec14                	sd	a3,24(s0)
    16c6:	f018                	sd	a4,32(s0)
    16c8:	f41c                	sd	a5,40(s0)
    16ca:	03043823          	sd	a6,48(s0)
    16ce:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    16d2:	00840613          	addi	a2,s0,8
    16d6:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    16da:	85aa                	mv	a1,a0
    16dc:	4505                	li	a0,1
    16de:	00000097          	auipc	ra,0x0
    16e2:	dd2080e7          	jalr	-558(ra) # 14b0 <vprintf>
}
    16e6:	60e2                	ld	ra,24(sp)
    16e8:	6442                	ld	s0,16(sp)
    16ea:	6125                	addi	sp,sp,96
    16ec:	8082                	ret

00000000000016ee <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16ee:	1141                	addi	sp,sp,-16
    16f0:	e422                	sd	s0,8(sp)
    16f2:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16f4:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f8:	00001797          	auipc	a5,0x1
    16fc:	c6878793          	addi	a5,a5,-920 # 2360 <freep>
    1700:	639c                	ld	a5,0(a5)
    1702:	a805                	j	1732 <free+0x44>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1704:	4618                	lw	a4,8(a2)
    1706:	9db9                	addw	a1,a1,a4
    1708:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    170c:	6398                	ld	a4,0(a5)
    170e:	6318                	ld	a4,0(a4)
    1710:	fee53823          	sd	a4,-16(a0)
    1714:	a091                	j	1758 <free+0x6a>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1716:	ff852703          	lw	a4,-8(a0)
    171a:	9e39                	addw	a2,a2,a4
    171c:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
    171e:	ff053703          	ld	a4,-16(a0)
    1722:	e398                	sd	a4,0(a5)
    1724:	a099                	j	176a <free+0x7c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1726:	6398                	ld	a4,0(a5)
    1728:	00e7e463          	bltu	a5,a4,1730 <free+0x42>
    172c:	00e6ea63          	bltu	a3,a4,1740 <free+0x52>
{
    1730:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1732:	fed7fae3          	bleu	a3,a5,1726 <free+0x38>
    1736:	6398                	ld	a4,0(a5)
    1738:	00e6e463          	bltu	a3,a4,1740 <free+0x52>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    173c:	fee7eae3          	bltu	a5,a4,1730 <free+0x42>
  if(bp + bp->s.size == p->s.ptr){
    1740:	ff852583          	lw	a1,-8(a0)
    1744:	6390                	ld	a2,0(a5)
    1746:	02059713          	slli	a4,a1,0x20
    174a:	9301                	srli	a4,a4,0x20
    174c:	0712                	slli	a4,a4,0x4
    174e:	9736                	add	a4,a4,a3
    1750:	fae60ae3          	beq	a2,a4,1704 <free+0x16>
    bp->s.ptr = p->s.ptr;
    1754:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    1758:	4790                	lw	a2,8(a5)
    175a:	02061713          	slli	a4,a2,0x20
    175e:	9301                	srli	a4,a4,0x20
    1760:	0712                	slli	a4,a4,0x4
    1762:	973e                	add	a4,a4,a5
    1764:	fae689e3          	beq	a3,a4,1716 <free+0x28>
  } else
    p->s.ptr = bp;
    1768:	e394                	sd	a3,0(a5)
  freep = p;
    176a:	00001717          	auipc	a4,0x1
    176e:	bef73b23          	sd	a5,-1034(a4) # 2360 <freep>
}
    1772:	6422                	ld	s0,8(sp)
    1774:	0141                	addi	sp,sp,16
    1776:	8082                	ret

0000000000001778 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1778:	7139                	addi	sp,sp,-64
    177a:	fc06                	sd	ra,56(sp)
    177c:	f822                	sd	s0,48(sp)
    177e:	f426                	sd	s1,40(sp)
    1780:	f04a                	sd	s2,32(sp)
    1782:	ec4e                	sd	s3,24(sp)
    1784:	e852                	sd	s4,16(sp)
    1786:	e456                	sd	s5,8(sp)
    1788:	e05a                	sd	s6,0(sp)
    178a:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    178c:	02051993          	slli	s3,a0,0x20
    1790:	0209d993          	srli	s3,s3,0x20
    1794:	09bd                	addi	s3,s3,15
    1796:	0049d993          	srli	s3,s3,0x4
    179a:	2985                	addiw	s3,s3,1
    179c:	0009891b          	sext.w	s2,s3
  if((prevp = freep) == 0){
    17a0:	00001797          	auipc	a5,0x1
    17a4:	bc078793          	addi	a5,a5,-1088 # 2360 <freep>
    17a8:	6388                	ld	a0,0(a5)
    17aa:	c515                	beqz	a0,17d6 <malloc+0x5e>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17ac:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    17ae:	4798                	lw	a4,8(a5)
    17b0:	03277d63          	bleu	s2,a4,17ea <malloc+0x72>
    17b4:	8a4e                	mv	s4,s3
    17b6:	0009871b          	sext.w	a4,s3
    17ba:	6685                	lui	a3,0x1
    17bc:	00d77363          	bleu	a3,a4,17c2 <malloc+0x4a>
    17c0:	6a05                	lui	s4,0x1
    17c2:	000a0a9b          	sext.w	s5,s4
  p = sbrk(nu * sizeof(Header));
    17c6:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17ca:	00001497          	auipc	s1,0x1
    17ce:	b9648493          	addi	s1,s1,-1130 # 2360 <freep>
  if(p == (char*)-1)
    17d2:	5b7d                	li	s6,-1
    17d4:	a0b5                	j	1840 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
    17d6:	00001717          	auipc	a4,0x1
    17da:	b9270713          	addi	a4,a4,-1134 # 2368 <base>
    17de:	e398                	sd	a4,0(a5)
    17e0:	e798                	sd	a4,8(a5)
    base.s.size = 0;
    17e2:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e6:	87ba                	mv	a5,a4
    17e8:	b7f1                	j	17b4 <malloc+0x3c>
      if(p->s.size == nunits)
    17ea:	02e90b63          	beq	s2,a4,1820 <malloc+0xa8>
        p->s.size -= nunits;
    17ee:	4137073b          	subw	a4,a4,s3
    17f2:	c798                	sw	a4,8(a5)
        p += p->s.size;
    17f4:	1702                	slli	a4,a4,0x20
    17f6:	9301                	srli	a4,a4,0x20
    17f8:	0712                	slli	a4,a4,0x4
    17fa:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    17fc:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    1800:	00001717          	auipc	a4,0x1
    1804:	b6a73023          	sd	a0,-1184(a4) # 2360 <freep>
      return (void*)(p + 1);
    1808:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    180c:	70e2                	ld	ra,56(sp)
    180e:	7442                	ld	s0,48(sp)
    1810:	74a2                	ld	s1,40(sp)
    1812:	7902                	ld	s2,32(sp)
    1814:	69e2                	ld	s3,24(sp)
    1816:	6a42                	ld	s4,16(sp)
    1818:	6aa2                	ld	s5,8(sp)
    181a:	6b02                	ld	s6,0(sp)
    181c:	6121                	addi	sp,sp,64
    181e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    1820:	6398                	ld	a4,0(a5)
    1822:	e118                	sd	a4,0(a0)
    1824:	bff1                	j	1800 <malloc+0x88>
  hp->s.size = nu;
    1826:	01552423          	sw	s5,8(a0)
  free((void*)(hp + 1));
    182a:	0541                	addi	a0,a0,16
    182c:	00000097          	auipc	ra,0x0
    1830:	ec2080e7          	jalr	-318(ra) # 16ee <free>
  return freep;
    1834:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
    1836:	d979                	beqz	a0,180c <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1838:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    183a:	4798                	lw	a4,8(a5)
    183c:	fb2777e3          	bleu	s2,a4,17ea <malloc+0x72>
    if(p == freep)
    1840:	6098                	ld	a4,0(s1)
    1842:	853e                	mv	a0,a5
    1844:	fef71ae3          	bne	a4,a5,1838 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
    1848:	8552                	mv	a0,s4
    184a:	00000097          	auipc	ra,0x0
    184e:	b38080e7          	jalr	-1224(ra) # 1382 <sbrk>
  if(p == (char*)-1)
    1852:	fd651ae3          	bne	a0,s6,1826 <malloc+0xae>
        return 0;
    1856:	4501                	li	a0,0
    1858:	bf55                	j	180c <malloc+0x94>
