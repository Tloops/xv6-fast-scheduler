
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000a117          	auipc	sp,0xa
    8020000a:	28213103          	ld	sp,642(sp) # 8020a288 <_GLOBAL_OFFSET_TABLE_+0x50>
    8020000e:	9116                	add	sp,sp,t0
    80200010:	223000ef          	jal	ra,80200a32 <main>

0000000080200014 <loop>:
    80200014:	a001                	j	80200014 <loop>

0000000080200016 <printint>:
    }
}

static void
printint(int xx, int base, int sign)
{
    80200016:	7179                	addi	sp,sp,-48
    80200018:	f406                	sd	ra,40(sp)
    8020001a:	f022                	sd	s0,32(sp)
    8020001c:	ec26                	sd	s1,24(sp)
    8020001e:	e84a                	sd	s2,16(sp)
    80200020:	1800                	addi	s0,sp,48
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80200022:	c219                	beqz	a2,80200028 <printint+0x12>
    80200024:	00054e63          	bltz	a0,80200040 <printint+0x2a>
    x = -xx;
  else
    x = xx;
    80200028:	2501                	sext.w	a0,a0
    8020002a:	4881                	li	a7,0

  i = 0;
    8020002c:	fd040913          	addi	s2,s0,-48
    x = xx;
    80200030:	874a                	mv	a4,s2
  i = 0;
    80200032:	4601                	li	a2,0
  do {
    buf[i++] = digits[x % base];
    80200034:	2581                	sext.w	a1,a1
    80200036:	00009817          	auipc	a6,0x9
    8020003a:	fca80813          	addi	a6,a6,-54 # 80209000 <etext>
    8020003e:	a801                	j	8020004e <printint+0x38>
    x = -xx;
    80200040:	40a0053b          	negw	a0,a0
    80200044:	2501                	sext.w	a0,a0
  if(sign && (sign = xx < 0))
    80200046:	4885                	li	a7,1
    x = -xx;
    80200048:	b7d5                	j	8020002c <printint+0x16>
  } while((x /= base) != 0);
    8020004a:	853e                	mv	a0,a5
    buf[i++] = digits[x % base];
    8020004c:	8636                	mv	a2,a3
    8020004e:	0016069b          	addiw	a3,a2,1
    80200052:	02b577bb          	remuw	a5,a0,a1
    80200056:	1782                	slli	a5,a5,0x20
    80200058:	9381                	srli	a5,a5,0x20
    8020005a:	97c2                	add	a5,a5,a6
    8020005c:	0007c783          	lbu	a5,0(a5)
    80200060:	00f70023          	sb	a5,0(a4)
  } while((x /= base) != 0);
    80200064:	0705                	addi	a4,a4,1
    80200066:	02b557bb          	divuw	a5,a0,a1
    8020006a:	feb570e3          	bleu	a1,a0,8020004a <printint+0x34>

  if(sign)
    8020006e:	00088b63          	beqz	a7,80200084 <printint+0x6e>
    buf[i++] = '-';
    80200072:	fe040793          	addi	a5,s0,-32
    80200076:	96be                	add	a3,a3,a5
    80200078:	02d00793          	li	a5,45
    8020007c:	fef68823          	sb	a5,-16(a3)
    80200080:	0026069b          	addiw	a3,a2,2

  while(--i >= 0)
    80200084:	02d05563          	blez	a3,802000ae <printint+0x98>
    80200088:	fd040493          	addi	s1,s0,-48
    8020008c:	94b6                	add	s1,s1,a3
    8020008e:	197d                	addi	s2,s2,-1
    80200090:	9936                	add	s2,s2,a3
    80200092:	36fd                	addiw	a3,a3,-1
    80200094:	1682                	slli	a3,a3,0x20
    80200096:	9281                	srli	a3,a3,0x20
    80200098:	40d90933          	sub	s2,s2,a3
    consputc(buf[i]);
    8020009c:	fff4c503          	lbu	a0,-1(s1)
    802000a0:	00007097          	auipc	ra,0x7
    802000a4:	d5c080e7          	jalr	-676(ra) # 80206dfc <consputc>
  while(--i >= 0)
    802000a8:	14fd                	addi	s1,s1,-1
    802000aa:	ff2499e3          	bne	s1,s2,8020009c <printint+0x86>
}
    802000ae:	70a2                	ld	ra,40(sp)
    802000b0:	7402                	ld	s0,32(sp)
    802000b2:	64e2                	ld	s1,24(sp)
    802000b4:	6942                	ld	s2,16(sp)
    802000b6:	6145                	addi	sp,sp,48
    802000b8:	8082                	ret

00000000802000ba <printstring>:
void printstring(const char* s) {
    802000ba:	1101                	addi	sp,sp,-32
    802000bc:	ec06                	sd	ra,24(sp)
    802000be:	e822                	sd	s0,16(sp)
    802000c0:	e426                	sd	s1,8(sp)
    802000c2:	1000                	addi	s0,sp,32
    802000c4:	84aa                	mv	s1,a0
    while (*s)
    802000c6:	00054503          	lbu	a0,0(a0)
    802000ca:	c909                	beqz	a0,802000dc <printstring+0x22>
        consputc(*s++);
    802000cc:	0485                	addi	s1,s1,1
    802000ce:	00007097          	auipc	ra,0x7
    802000d2:	d2e080e7          	jalr	-722(ra) # 80206dfc <consputc>
    while (*s)
    802000d6:	0004c503          	lbu	a0,0(s1)
    802000da:	f96d                	bnez	a0,802000cc <printstring+0x12>
}
    802000dc:	60e2                	ld	ra,24(sp)
    802000de:	6442                	ld	s0,16(sp)
    802000e0:	64a2                	ld	s1,8(sp)
    802000e2:	6105                	addi	sp,sp,32
    802000e4:	8082                	ret

00000000802000e6 <backtrace>:
  for(;;)
    ;
}

void backtrace()
{
    802000e6:	7179                	addi	sp,sp,-48
    802000e8:	f406                	sd	ra,40(sp)
    802000ea:	f022                	sd	s0,32(sp)
    802000ec:	ec26                	sd	s1,24(sp)
    802000ee:	e84a                	sd	s2,16(sp)
    802000f0:	e44e                	sd	s3,8(sp)
    802000f2:	1800                	addi	s0,sp,48

static inline uint64
r_fp()
{
  uint64 x;
  asm volatile("mv %0, s0" : "=r" (x) );
    802000f4:	8922                	mv	s2,s0
  uint64 *fp = (uint64 *)r_fp();
    802000f6:	84ca                	mv	s1,s2
  uint64 *bottom = (uint64 *)PGROUNDUP((uint64)fp);
    802000f8:	6785                	lui	a5,0x1
    802000fa:	17fd                	addi	a5,a5,-1
    802000fc:	993e                	add	s2,s2,a5
    802000fe:	77fd                	lui	a5,0xfffff
    80200100:	00f97933          	and	s2,s2,a5
  printf("backtrace:\n");
    80200104:	00009517          	auipc	a0,0x9
    80200108:	f1450513          	addi	a0,a0,-236 # 80209018 <etext+0x18>
    8020010c:	00000097          	auipc	ra,0x0
    80200110:	084080e7          	jalr	132(ra) # 80200190 <printf>
  while (fp < bottom) {
    80200114:	0324f263          	bleu	s2,s1,80200138 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200118:	00009997          	auipc	s3,0x9
    8020011c:	4d098993          	addi	s3,s3,1232 # 802095e8 <etext+0x5e8>
    80200120:	ff84b583          	ld	a1,-8(s1)
    80200124:	15f1                	addi	a1,a1,-4
    80200126:	854e                	mv	a0,s3
    80200128:	00000097          	auipc	ra,0x0
    8020012c:	068080e7          	jalr	104(ra) # 80200190 <printf>
    fp = (uint64 *)*(fp - 2);
    80200130:	ff04b483          	ld	s1,-16(s1)
  while (fp < bottom) {
    80200134:	ff24e6e3          	bltu	s1,s2,80200120 <backtrace+0x3a>
  }
}
    80200138:	70a2                	ld	ra,40(sp)
    8020013a:	7402                	ld	s0,32(sp)
    8020013c:	64e2                	ld	s1,24(sp)
    8020013e:	6942                	ld	s2,16(sp)
    80200140:	69a2                	ld	s3,8(sp)
    80200142:	6145                	addi	sp,sp,48
    80200144:	8082                	ret

0000000080200146 <panic>:
{
    80200146:	1101                	addi	sp,sp,-32
    80200148:	ec06                	sd	ra,24(sp)
    8020014a:	e822                	sd	s0,16(sp)
    8020014c:	e426                	sd	s1,8(sp)
    8020014e:	1000                	addi	s0,sp,32
    80200150:	84aa                	mv	s1,a0
  printf("panic: ");
    80200152:	00009517          	auipc	a0,0x9
    80200156:	ed650513          	addi	a0,a0,-298 # 80209028 <etext+0x28>
    8020015a:	00000097          	auipc	ra,0x0
    8020015e:	036080e7          	jalr	54(ra) # 80200190 <printf>
  printf(s);
    80200162:	8526                	mv	a0,s1
    80200164:	00000097          	auipc	ra,0x0
    80200168:	02c080e7          	jalr	44(ra) # 80200190 <printf>
  printf("\n");
    8020016c:	00009517          	auipc	a0,0x9
    80200170:	f8450513          	addi	a0,a0,-124 # 802090f0 <etext+0xf0>
    80200174:	00000097          	auipc	ra,0x0
    80200178:	01c080e7          	jalr	28(ra) # 80200190 <printf>
  backtrace();
    8020017c:	00000097          	auipc	ra,0x0
    80200180:	f6a080e7          	jalr	-150(ra) # 802000e6 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200184:	4785                	li	a5,1
    80200186:	00013717          	auipc	a4,0x13
    8020018a:	e6f72d23          	sw	a5,-390(a4) # 80213000 <panicked>
  for(;;)
    8020018e:	a001                	j	8020018e <panic+0x48>

0000000080200190 <printf>:
{
    80200190:	7131                	addi	sp,sp,-192
    80200192:	fc86                	sd	ra,120(sp)
    80200194:	f8a2                	sd	s0,112(sp)
    80200196:	f4a6                	sd	s1,104(sp)
    80200198:	f0ca                	sd	s2,96(sp)
    8020019a:	ecce                	sd	s3,88(sp)
    8020019c:	e8d2                	sd	s4,80(sp)
    8020019e:	e4d6                	sd	s5,72(sp)
    802001a0:	e0da                	sd	s6,64(sp)
    802001a2:	fc5e                	sd	s7,56(sp)
    802001a4:	f862                	sd	s8,48(sp)
    802001a6:	f466                	sd	s9,40(sp)
    802001a8:	f06a                	sd	s10,32(sp)
    802001aa:	ec6e                	sd	s11,24(sp)
    802001ac:	0100                	addi	s0,sp,128
    802001ae:	8aaa                	mv	s5,a0
    802001b0:	e40c                	sd	a1,8(s0)
    802001b2:	e810                	sd	a2,16(s0)
    802001b4:	ec14                	sd	a3,24(s0)
    802001b6:	f018                	sd	a4,32(s0)
    802001b8:	f41c                	sd	a5,40(s0)
    802001ba:	03043823          	sd	a6,48(s0)
    802001be:	03143c23          	sd	a7,56(s0)
  locking = pr.locking;
    802001c2:	00013797          	auipc	a5,0x13
    802001c6:	e3e78793          	addi	a5,a5,-450 # 80213000 <panicked>
    802001ca:	0207ad83          	lw	s11,32(a5)
  if(locking)
    802001ce:	020d9b63          	bnez	s11,80200204 <printf+0x74>
  if (fmt == 0)
    802001d2:	040a8263          	beqz	s5,80200216 <printf+0x86>
  va_start(ap, fmt);
    802001d6:	00840793          	addi	a5,s0,8
    802001da:	f8f43423          	sd	a5,-120(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    802001de:	000ac503          	lbu	a0,0(s5)
    802001e2:	16050363          	beqz	a0,80200348 <printf+0x1b8>
    802001e6:	4481                	li	s1,0
    if(c != '%'){
    802001e8:	02500a13          	li	s4,37
    switch(c){
    802001ec:	07000b13          	li	s6,112
  consputc('x');
    802001f0:	4d41                	li	s10,16
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802001f2:	00009b97          	auipc	s7,0x9
    802001f6:	e0eb8b93          	addi	s7,s7,-498 # 80209000 <etext>
    switch(c){
    802001fa:	07300c93          	li	s9,115
    802001fe:	06400c13          	li	s8,100
    80200202:	a82d                	j	8020023c <printf+0xac>
    acquire(&pr.lock);
    80200204:	00013517          	auipc	a0,0x13
    80200208:	e0450513          	addi	a0,a0,-508 # 80213008 <pr>
    8020020c:	00000097          	auipc	ra,0x0
    80200210:	4cc080e7          	jalr	1228(ra) # 802006d8 <acquire>
    80200214:	bf7d                	j	802001d2 <printf+0x42>
    panic("null fmt");
    80200216:	00009517          	auipc	a0,0x9
    8020021a:	e2250513          	addi	a0,a0,-478 # 80209038 <etext+0x38>
    8020021e:	00000097          	auipc	ra,0x0
    80200222:	f28080e7          	jalr	-216(ra) # 80200146 <panic>
      consputc(c);
    80200226:	00007097          	auipc	ra,0x7
    8020022a:	bd6080e7          	jalr	-1066(ra) # 80206dfc <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    8020022e:	2485                	addiw	s1,s1,1
    80200230:	009a87b3          	add	a5,s5,s1
    80200234:	0007c503          	lbu	a0,0(a5)
    80200238:	10050863          	beqz	a0,80200348 <printf+0x1b8>
    if(c != '%'){
    8020023c:	ff4515e3          	bne	a0,s4,80200226 <printf+0x96>
    c = fmt[++i] & 0xff;
    80200240:	2485                	addiw	s1,s1,1
    80200242:	009a87b3          	add	a5,s5,s1
    80200246:	0007c783          	lbu	a5,0(a5)
    8020024a:	0007891b          	sext.w	s2,a5
    if(c == 0)
    8020024e:	0e090d63          	beqz	s2,80200348 <printf+0x1b8>
    switch(c){
    80200252:	05678a63          	beq	a5,s6,802002a6 <printf+0x116>
    80200256:	02fb7663          	bleu	a5,s6,80200282 <printf+0xf2>
    8020025a:	09978963          	beq	a5,s9,802002ec <printf+0x15c>
    8020025e:	07800713          	li	a4,120
    80200262:	0ce79863          	bne	a5,a4,80200332 <printf+0x1a2>
      printint(va_arg(ap, int), 16, 1);
    80200266:	f8843783          	ld	a5,-120(s0)
    8020026a:	00878713          	addi	a4,a5,8
    8020026e:	f8e43423          	sd	a4,-120(s0)
    80200272:	4605                	li	a2,1
    80200274:	85ea                	mv	a1,s10
    80200276:	4388                	lw	a0,0(a5)
    80200278:	00000097          	auipc	ra,0x0
    8020027c:	d9e080e7          	jalr	-610(ra) # 80200016 <printint>
      break;
    80200280:	b77d                	j	8020022e <printf+0x9e>
    switch(c){
    80200282:	0b478263          	beq	a5,s4,80200326 <printf+0x196>
    80200286:	0b879663          	bne	a5,s8,80200332 <printf+0x1a2>
      printint(va_arg(ap, int), 10, 1);
    8020028a:	f8843783          	ld	a5,-120(s0)
    8020028e:	00878713          	addi	a4,a5,8
    80200292:	f8e43423          	sd	a4,-120(s0)
    80200296:	4605                	li	a2,1
    80200298:	45a9                	li	a1,10
    8020029a:	4388                	lw	a0,0(a5)
    8020029c:	00000097          	auipc	ra,0x0
    802002a0:	d7a080e7          	jalr	-646(ra) # 80200016 <printint>
      break;
    802002a4:	b769                	j	8020022e <printf+0x9e>
      printptr(va_arg(ap, uint64));
    802002a6:	f8843783          	ld	a5,-120(s0)
    802002aa:	00878713          	addi	a4,a5,8
    802002ae:	f8e43423          	sd	a4,-120(s0)
    802002b2:	0007b983          	ld	s3,0(a5)
  consputc('0');
    802002b6:	03000513          	li	a0,48
    802002ba:	00007097          	auipc	ra,0x7
    802002be:	b42080e7          	jalr	-1214(ra) # 80206dfc <consputc>
  consputc('x');
    802002c2:	07800513          	li	a0,120
    802002c6:	00007097          	auipc	ra,0x7
    802002ca:	b36080e7          	jalr	-1226(ra) # 80206dfc <consputc>
    802002ce:	896a                	mv	s2,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002d0:	03c9d793          	srli	a5,s3,0x3c
    802002d4:	97de                	add	a5,a5,s7
    802002d6:	0007c503          	lbu	a0,0(a5)
    802002da:	00007097          	auipc	ra,0x7
    802002de:	b22080e7          	jalr	-1246(ra) # 80206dfc <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    802002e2:	0992                	slli	s3,s3,0x4
    802002e4:	397d                	addiw	s2,s2,-1
    802002e6:	fe0915e3          	bnez	s2,802002d0 <printf+0x140>
    802002ea:	b791                	j	8020022e <printf+0x9e>
      if((s = va_arg(ap, char*)) == 0)
    802002ec:	f8843783          	ld	a5,-120(s0)
    802002f0:	00878713          	addi	a4,a5,8
    802002f4:	f8e43423          	sd	a4,-120(s0)
    802002f8:	0007b903          	ld	s2,0(a5)
    802002fc:	00090e63          	beqz	s2,80200318 <printf+0x188>
      for(; *s; s++)
    80200300:	00094503          	lbu	a0,0(s2)
    80200304:	d50d                	beqz	a0,8020022e <printf+0x9e>
        consputc(*s);
    80200306:	00007097          	auipc	ra,0x7
    8020030a:	af6080e7          	jalr	-1290(ra) # 80206dfc <consputc>
      for(; *s; s++)
    8020030e:	0905                	addi	s2,s2,1
    80200310:	00094503          	lbu	a0,0(s2)
    80200314:	f96d                	bnez	a0,80200306 <printf+0x176>
    80200316:	bf21                	j	8020022e <printf+0x9e>
        s = "(null)";
    80200318:	00009917          	auipc	s2,0x9
    8020031c:	d1890913          	addi	s2,s2,-744 # 80209030 <etext+0x30>
      for(; *s; s++)
    80200320:	02800513          	li	a0,40
    80200324:	b7cd                	j	80200306 <printf+0x176>
      consputc('%');
    80200326:	8552                	mv	a0,s4
    80200328:	00007097          	auipc	ra,0x7
    8020032c:	ad4080e7          	jalr	-1324(ra) # 80206dfc <consputc>
      break;
    80200330:	bdfd                	j	8020022e <printf+0x9e>
      consputc('%');
    80200332:	8552                	mv	a0,s4
    80200334:	00007097          	auipc	ra,0x7
    80200338:	ac8080e7          	jalr	-1336(ra) # 80206dfc <consputc>
      consputc(c);
    8020033c:	854a                	mv	a0,s2
    8020033e:	00007097          	auipc	ra,0x7
    80200342:	abe080e7          	jalr	-1346(ra) # 80206dfc <consputc>
      break;
    80200346:	b5e5                	j	8020022e <printf+0x9e>
  if(locking)
    80200348:	020d9163          	bnez	s11,8020036a <printf+0x1da>
}
    8020034c:	70e6                	ld	ra,120(sp)
    8020034e:	7446                	ld	s0,112(sp)
    80200350:	74a6                	ld	s1,104(sp)
    80200352:	7906                	ld	s2,96(sp)
    80200354:	69e6                	ld	s3,88(sp)
    80200356:	6a46                	ld	s4,80(sp)
    80200358:	6aa6                	ld	s5,72(sp)
    8020035a:	6b06                	ld	s6,64(sp)
    8020035c:	7be2                	ld	s7,56(sp)
    8020035e:	7c42                	ld	s8,48(sp)
    80200360:	7ca2                	ld	s9,40(sp)
    80200362:	7d02                	ld	s10,32(sp)
    80200364:	6de2                	ld	s11,24(sp)
    80200366:	6129                	addi	sp,sp,192
    80200368:	8082                	ret
    release(&pr.lock);
    8020036a:	00013517          	auipc	a0,0x13
    8020036e:	c9e50513          	addi	a0,a0,-866 # 80213008 <pr>
    80200372:	00000097          	auipc	ra,0x0
    80200376:	3ba080e7          	jalr	954(ra) # 8020072c <release>
}
    8020037a:	bfc9                	j	8020034c <printf+0x1bc>

000000008020037c <printfinit>:

void
printfinit(void)
{
    8020037c:	1141                	addi	sp,sp,-16
    8020037e:	e406                	sd	ra,8(sp)
    80200380:	e022                	sd	s0,0(sp)
    80200382:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80200384:	00009597          	auipc	a1,0x9
    80200388:	cc458593          	addi	a1,a1,-828 # 80209048 <etext+0x48>
    8020038c:	00013517          	auipc	a0,0x13
    80200390:	c7c50513          	addi	a0,a0,-900 # 80213008 <pr>
    80200394:	00000097          	auipc	ra,0x0
    80200398:	300080e7          	jalr	768(ra) # 80200694 <initlock>
  pr.locking = 1;   // changed, used to be 1
    8020039c:	4785                	li	a5,1
    8020039e:	00013717          	auipc	a4,0x13
    802003a2:	c8f72123          	sw	a5,-894(a4) # 80213020 <pr+0x18>
}
    802003a6:	60a2                	ld	ra,8(sp)
    802003a8:	6402                	ld	s0,0(sp)
    802003aa:	0141                	addi	sp,sp,16
    802003ac:	8082                	ret

00000000802003ae <print_logo>:

#ifdef QEMU
void print_logo() {
    802003ae:	1141                	addi	sp,sp,-16
    802003b0:	e406                	sd	ra,8(sp)
    802003b2:	e022                	sd	s0,0(sp)
    802003b4:	0800                	addi	s0,sp,16
    printf("  (`-.            (`-.                            .-')       ('-.    _   .-')\n");
    802003b6:	00009517          	auipc	a0,0x9
    802003ba:	c9a50513          	addi	a0,a0,-870 # 80209050 <etext+0x50>
    802003be:	00000097          	auipc	ra,0x0
    802003c2:	dd2080e7          	jalr	-558(ra) # 80200190 <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003c6:	00009517          	auipc	a0,0x9
    802003ca:	cda50513          	addi	a0,a0,-806 # 802090a0 <etext+0xa0>
    802003ce:	00000097          	auipc	ra,0x0
    802003d2:	dc2080e7          	jalr	-574(ra) # 80200190 <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003d6:	00009517          	auipc	a0,0x9
    802003da:	d2250513          	addi	a0,a0,-734 # 802090f8 <etext+0xf8>
    802003de:	00000097          	auipc	ra,0x0
    802003e2:	db2080e7          	jalr	-590(ra) # 80200190 <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003e6:	00009517          	auipc	a0,0x9
    802003ea:	d7250513          	addi	a0,a0,-654 # 80209158 <etext+0x158>
    802003ee:	00000097          	auipc	ra,0x0
    802003f2:	da2080e7          	jalr	-606(ra) # 80200190 <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003f6:	00009517          	auipc	a0,0x9
    802003fa:	dc250513          	addi	a0,a0,-574 # 802091b8 <etext+0x1b8>
    802003fe:	00000097          	auipc	ra,0x0
    80200402:	d92080e7          	jalr	-622(ra) # 80200190 <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    80200406:	00009517          	auipc	a0,0x9
    8020040a:	e1250513          	addi	a0,a0,-494 # 80209218 <etext+0x218>
    8020040e:	00000097          	auipc	ra,0x0
    80200412:	d82080e7          	jalr	-638(ra) # 80200190 <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    80200416:	00009517          	auipc	a0,0x9
    8020041a:	e6250513          	addi	a0,a0,-414 # 80209278 <etext+0x278>
    8020041e:	00000097          	auipc	ra,0x0
    80200422:	d72080e7          	jalr	-654(ra) # 80200190 <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    80200426:	00009517          	auipc	a0,0x9
    8020042a:	eb250513          	addi	a0,a0,-334 # 802092d8 <etext+0x2d8>
    8020042e:	00000097          	auipc	ra,0x0
    80200432:	d62080e7          	jalr	-670(ra) # 80200190 <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    80200436:	00009517          	auipc	a0,0x9
    8020043a:	f0250513          	addi	a0,a0,-254 # 80209338 <etext+0x338>
    8020043e:	00000097          	auipc	ra,0x0
    80200442:	d52080e7          	jalr	-686(ra) # 80200190 <printf>
}
    80200446:	60a2                	ld	ra,8(sp)
    80200448:	6402                	ld	s0,0(sp)
    8020044a:	0141                	addi	sp,sp,16
    8020044c:	8082                	ret

000000008020044e <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    8020044e:	1101                	addi	sp,sp,-32
    80200450:	ec06                	sd	ra,24(sp)
    80200452:	e822                	sd	s0,16(sp)
    80200454:	e426                	sd	s1,8(sp)
    80200456:	e04a                	sd	s2,0(sp)
    80200458:	1000                	addi	s0,sp,32
  struct run *r;
  
  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < kernel_end || (uint64)pa >= PHYSTOP)
    8020045a:	6785                	lui	a5,0x1
    8020045c:	17fd                	addi	a5,a5,-1
    8020045e:	8fe9                	and	a5,a5,a0
    80200460:	e3ad                	bnez	a5,802004c2 <kfree+0x74>
    80200462:	84aa                	mv	s1,a0
    80200464:	0000a797          	auipc	a5,0xa
    80200468:	dfc7b783          	ld	a5,-516(a5) # 8020a260 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020046c:	04f56b63          	bltu	a0,a5,802004c2 <kfree+0x74>
    80200470:	40300793          	li	a5,1027
    80200474:	07d6                	slli	a5,a5,0x15
    80200476:	04f57663          	bleu	a5,a0,802004c2 <kfree+0x74>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    8020047a:	6605                	lui	a2,0x1
    8020047c:	4585                	li	a1,1
    8020047e:	00000097          	auipc	ra,0x0
    80200482:	2f6080e7          	jalr	758(ra) # 80200774 <memset>

  r = (struct run*)pa;

  acquire(&kmem.lock);
    80200486:	00013917          	auipc	s2,0x13
    8020048a:	ba290913          	addi	s2,s2,-1118 # 80213028 <kmem>
    8020048e:	854a                	mv	a0,s2
    80200490:	00000097          	auipc	ra,0x0
    80200494:	248080e7          	jalr	584(ra) # 802006d8 <acquire>
  r->next = kmem.freelist;
    80200498:	01893783          	ld	a5,24(s2)
    8020049c:	e09c                	sd	a5,0(s1)
  kmem.freelist = r;
    8020049e:	00993c23          	sd	s1,24(s2)
  kmem.npage++;
    802004a2:	02093783          	ld	a5,32(s2)
    802004a6:	0785                	addi	a5,a5,1
    802004a8:	02f93023          	sd	a5,32(s2)
  release(&kmem.lock);
    802004ac:	854a                	mv	a0,s2
    802004ae:	00000097          	auipc	ra,0x0
    802004b2:	27e080e7          	jalr	638(ra) # 8020072c <release>
}
    802004b6:	60e2                	ld	ra,24(sp)
    802004b8:	6442                	ld	s0,16(sp)
    802004ba:	64a2                	ld	s1,8(sp)
    802004bc:	6902                	ld	s2,0(sp)
    802004be:	6105                	addi	sp,sp,32
    802004c0:	8082                	ret
    panic("kfree");
    802004c2:	00009517          	auipc	a0,0x9
    802004c6:	ed650513          	addi	a0,a0,-298 # 80209398 <etext+0x398>
    802004ca:	00000097          	auipc	ra,0x0
    802004ce:	c7c080e7          	jalr	-900(ra) # 80200146 <panic>

00000000802004d2 <freerange>:
{
    802004d2:	7179                	addi	sp,sp,-48
    802004d4:	f406                	sd	ra,40(sp)
    802004d6:	f022                	sd	s0,32(sp)
    802004d8:	ec26                	sd	s1,24(sp)
    802004da:	e84a                	sd	s2,16(sp)
    802004dc:	e44e                	sd	s3,8(sp)
    802004de:	e052                	sd	s4,0(sp)
    802004e0:	1800                	addi	s0,sp,48
  p = (char*)PGROUNDUP((uint64)pa_start);
    802004e2:	6705                	lui	a4,0x1
    802004e4:	fff70793          	addi	a5,a4,-1 # fff <BASE_ADDRESS-0x801ff001>
    802004e8:	00f504b3          	add	s1,a0,a5
    802004ec:	77fd                	lui	a5,0xfffff
    802004ee:	8cfd                	and	s1,s1,a5
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004f0:	94ba                	add	s1,s1,a4
    802004f2:	0095ee63          	bltu	a1,s1,8020050e <freerange+0x3c>
    802004f6:	892e                	mv	s2,a1
    kfree(p);
    802004f8:	7a7d                	lui	s4,0xfffff
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004fa:	6985                	lui	s3,0x1
    kfree(p);
    802004fc:	01448533          	add	a0,s1,s4
    80200500:	00000097          	auipc	ra,0x0
    80200504:	f4e080e7          	jalr	-178(ra) # 8020044e <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80200508:	94ce                	add	s1,s1,s3
    8020050a:	fe9979e3          	bleu	s1,s2,802004fc <freerange+0x2a>
}
    8020050e:	70a2                	ld	ra,40(sp)
    80200510:	7402                	ld	s0,32(sp)
    80200512:	64e2                	ld	s1,24(sp)
    80200514:	6942                	ld	s2,16(sp)
    80200516:	69a2                	ld	s3,8(sp)
    80200518:	6a02                	ld	s4,0(sp)
    8020051a:	6145                	addi	sp,sp,48
    8020051c:	8082                	ret

000000008020051e <kinit>:
{
    8020051e:	1101                	addi	sp,sp,-32
    80200520:	ec06                	sd	ra,24(sp)
    80200522:	e822                	sd	s0,16(sp)
    80200524:	e426                	sd	s1,8(sp)
    80200526:	1000                	addi	s0,sp,32
  initlock(&kmem.lock, "kmem");
    80200528:	00013497          	auipc	s1,0x13
    8020052c:	b0048493          	addi	s1,s1,-1280 # 80213028 <kmem>
    80200530:	00009597          	auipc	a1,0x9
    80200534:	e7058593          	addi	a1,a1,-400 # 802093a0 <etext+0x3a0>
    80200538:	8526                	mv	a0,s1
    8020053a:	00000097          	auipc	ra,0x0
    8020053e:	15a080e7          	jalr	346(ra) # 80200694 <initlock>
  kmem.freelist = 0;
    80200542:	0004bc23          	sd	zero,24(s1)
  kmem.npage = 0;
    80200546:	0204b023          	sd	zero,32(s1)
  freerange(kernel_end, (void*)PHYSTOP);
    8020054a:	40300593          	li	a1,1027
    8020054e:	05d6                	slli	a1,a1,0x15
    80200550:	0000a517          	auipc	a0,0xa
    80200554:	d1053503          	ld	a0,-752(a0) # 8020a260 <_GLOBAL_OFFSET_TABLE_+0x28>
    80200558:	00000097          	auipc	ra,0x0
    8020055c:	f7a080e7          	jalr	-134(ra) # 802004d2 <freerange>
}
    80200560:	60e2                	ld	ra,24(sp)
    80200562:	6442                	ld	s0,16(sp)
    80200564:	64a2                	ld	s1,8(sp)
    80200566:	6105                	addi	sp,sp,32
    80200568:	8082                	ret

000000008020056a <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    8020056a:	1101                	addi	sp,sp,-32
    8020056c:	ec06                	sd	ra,24(sp)
    8020056e:	e822                	sd	s0,16(sp)
    80200570:	e426                	sd	s1,8(sp)
    80200572:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80200574:	00013497          	auipc	s1,0x13
    80200578:	ab448493          	addi	s1,s1,-1356 # 80213028 <kmem>
    8020057c:	8526                	mv	a0,s1
    8020057e:	00000097          	auipc	ra,0x0
    80200582:	15a080e7          	jalr	346(ra) # 802006d8 <acquire>
  r = kmem.freelist;
    80200586:	6c84                	ld	s1,24(s1)
  if(r) {
    80200588:	c89d                	beqz	s1,802005be <kalloc+0x54>
    kmem.freelist = r->next;
    8020058a:	609c                	ld	a5,0(s1)
    8020058c:	00013517          	auipc	a0,0x13
    80200590:	a9c50513          	addi	a0,a0,-1380 # 80213028 <kmem>
    80200594:	ed1c                	sd	a5,24(a0)
    kmem.npage--;
    80200596:	711c                	ld	a5,32(a0)
    80200598:	17fd                	addi	a5,a5,-1
    8020059a:	f11c                	sd	a5,32(a0)
  }
  release(&kmem.lock);
    8020059c:	00000097          	auipc	ra,0x0
    802005a0:	190080e7          	jalr	400(ra) # 8020072c <release>

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
    802005a4:	6605                	lui	a2,0x1
    802005a6:	4595                	li	a1,5
    802005a8:	8526                	mv	a0,s1
    802005aa:	00000097          	auipc	ra,0x0
    802005ae:	1ca080e7          	jalr	458(ra) # 80200774 <memset>
  return (void*)r;
}
    802005b2:	8526                	mv	a0,s1
    802005b4:	60e2                	ld	ra,24(sp)
    802005b6:	6442                	ld	s0,16(sp)
    802005b8:	64a2                	ld	s1,8(sp)
    802005ba:	6105                	addi	sp,sp,32
    802005bc:	8082                	ret
  release(&kmem.lock);
    802005be:	00013517          	auipc	a0,0x13
    802005c2:	a6a50513          	addi	a0,a0,-1430 # 80213028 <kmem>
    802005c6:	00000097          	auipc	ra,0x0
    802005ca:	166080e7          	jalr	358(ra) # 8020072c <release>
  if(r)
    802005ce:	b7d5                	j	802005b2 <kalloc+0x48>

00000000802005d0 <freemem_amount>:

uint64
freemem_amount(void)
{
    802005d0:	1141                	addi	sp,sp,-16
    802005d2:	e422                	sd	s0,8(sp)
    802005d4:	0800                	addi	s0,sp,16
  return kmem.npage << PGSHIFT;
    802005d6:	00013797          	auipc	a5,0x13
    802005da:	a5278793          	addi	a5,a5,-1454 # 80213028 <kmem>
    802005de:	7388                	ld	a0,32(a5)
}
    802005e0:	0532                	slli	a0,a0,0xc
    802005e2:	6422                	ld	s0,8(sp)
    802005e4:	0141                	addi	sp,sp,16
    802005e6:	8082                	ret

00000000802005e8 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    802005e8:	1101                	addi	sp,sp,-32
    802005ea:	ec06                	sd	ra,24(sp)
    802005ec:	e822                	sd	s0,16(sp)
    802005ee:	e426                	sd	s1,8(sp)
    802005f0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802005f2:	100024f3          	csrr	s1,sstatus
    802005f6:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    802005fa:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802005fc:	10079073          	csrw	sstatus,a5
  int old = intr_get();

  intr_off();
  //printf("\e[32mpush_off()\e[0m: cpuid(): %d\n", cpuid());
  if(mycpu()->noff == 0)
    80200600:	00001097          	auipc	ra,0x1
    80200604:	4a4080e7          	jalr	1188(ra) # 80201aa4 <mycpu>
    80200608:	5d3c                	lw	a5,120(a0)
    8020060a:	cf89                	beqz	a5,80200624 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    8020060c:	00001097          	auipc	ra,0x1
    80200610:	498080e7          	jalr	1176(ra) # 80201aa4 <mycpu>
    80200614:	5d3c                	lw	a5,120(a0)
    80200616:	2785                	addiw	a5,a5,1
    80200618:	dd3c                	sw	a5,120(a0)
}
    8020061a:	60e2                	ld	ra,24(sp)
    8020061c:	6442                	ld	s0,16(sp)
    8020061e:	64a2                	ld	s1,8(sp)
    80200620:	6105                	addi	sp,sp,32
    80200622:	8082                	ret
    mycpu()->intena = old;
    80200624:	00001097          	auipc	ra,0x1
    80200628:	480080e7          	jalr	1152(ra) # 80201aa4 <mycpu>
  return (x & SSTATUS_SIE) != 0;
    8020062c:	8085                	srli	s1,s1,0x1
    8020062e:	8885                	andi	s1,s1,1
    80200630:	dd64                	sw	s1,124(a0)
    80200632:	bfe9                	j	8020060c <push_off+0x24>

0000000080200634 <pop_off>:

void
pop_off(void)
{
    80200634:	1141                	addi	sp,sp,-16
    80200636:	e406                	sd	ra,8(sp)
    80200638:	e022                	sd	s0,0(sp)
    8020063a:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
    8020063c:	00001097          	auipc	ra,0x1
    80200640:	468080e7          	jalr	1128(ra) # 80201aa4 <mycpu>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200644:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80200648:	8b89                	andi	a5,a5,2

  //printf("\e[31mpop_off()\e[0m: cpuid(): %d\n", cpuid());
  if(intr_get())
    8020064a:	e78d                	bnez	a5,80200674 <pop_off+0x40>
    panic("pop_off - interruptible");
  if(c->noff < 1) {
    8020064c:	5d3c                	lw	a5,120(a0)
    8020064e:	02f05b63          	blez	a5,80200684 <pop_off+0x50>
    //printf("c->noff = %d\n", c->noff);
    panic("pop_off");
  }
  //printf("c->noff: %d\n", c->noff);
  //printf("c: %x\n", c);
  c->noff -= 1;
    80200652:	37fd                	addiw	a5,a5,-1
    80200654:	0007871b          	sext.w	a4,a5
    80200658:	dd3c                	sw	a5,120(a0)
  if(c->noff == 0 && c->intena)
    8020065a:	eb09                	bnez	a4,8020066c <pop_off+0x38>
    8020065c:	5d7c                	lw	a5,124(a0)
    8020065e:	c799                	beqz	a5,8020066c <pop_off+0x38>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200660:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80200664:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200668:	10079073          	csrw	sstatus,a5
    intr_on();
}
    8020066c:	60a2                	ld	ra,8(sp)
    8020066e:	6402                	ld	s0,0(sp)
    80200670:	0141                	addi	sp,sp,16
    80200672:	8082                	ret
    panic("pop_off - interruptible");
    80200674:	00009517          	auipc	a0,0x9
    80200678:	d3450513          	addi	a0,a0,-716 # 802093a8 <etext+0x3a8>
    8020067c:	00000097          	auipc	ra,0x0
    80200680:	aca080e7          	jalr	-1334(ra) # 80200146 <panic>
    panic("pop_off");
    80200684:	00009517          	auipc	a0,0x9
    80200688:	d3c50513          	addi	a0,a0,-708 # 802093c0 <etext+0x3c0>
    8020068c:	00000097          	auipc	ra,0x0
    80200690:	aba080e7          	jalr	-1350(ra) # 80200146 <panic>

0000000080200694 <initlock>:
#include "include/intr.h"
#include "include/printf.h"

void
initlock(struct spinlock *lk, char *name)
{
    80200694:	1141                	addi	sp,sp,-16
    80200696:	e422                	sd	s0,8(sp)
    80200698:	0800                	addi	s0,sp,16
  lk->name = name;
    8020069a:	e50c                	sd	a1,8(a0)
  lk->locked = 0;
    8020069c:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
    802006a0:	00053823          	sd	zero,16(a0)
}
    802006a4:	6422                	ld	s0,8(sp)
    802006a6:	0141                	addi	sp,sp,16
    802006a8:	8082                	ret

00000000802006aa <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    802006aa:	411c                	lw	a5,0(a0)
    802006ac:	e399                	bnez	a5,802006b2 <holding+0x8>
    802006ae:	4501                	li	a0,0
  return r;
}
    802006b0:	8082                	ret
{
    802006b2:	1101                	addi	sp,sp,-32
    802006b4:	ec06                	sd	ra,24(sp)
    802006b6:	e822                	sd	s0,16(sp)
    802006b8:	e426                	sd	s1,8(sp)
    802006ba:	1000                	addi	s0,sp,32
  r = (lk->locked && lk->cpu == mycpu());
    802006bc:	6904                	ld	s1,16(a0)
    802006be:	00001097          	auipc	ra,0x1
    802006c2:	3e6080e7          	jalr	998(ra) # 80201aa4 <mycpu>
    802006c6:	40a48533          	sub	a0,s1,a0
    802006ca:	00153513          	seqz	a0,a0
}
    802006ce:	60e2                	ld	ra,24(sp)
    802006d0:	6442                	ld	s0,16(sp)
    802006d2:	64a2                	ld	s1,8(sp)
    802006d4:	6105                	addi	sp,sp,32
    802006d6:	8082                	ret

00000000802006d8 <acquire>:
{
    802006d8:	1101                	addi	sp,sp,-32
    802006da:	ec06                	sd	ra,24(sp)
    802006dc:	e822                	sd	s0,16(sp)
    802006de:	e426                	sd	s1,8(sp)
    802006e0:	1000                	addi	s0,sp,32
    802006e2:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
    802006e4:	00000097          	auipc	ra,0x0
    802006e8:	f04080e7          	jalr	-252(ra) # 802005e8 <push_off>
  if(holding(lk))
    802006ec:	8526                	mv	a0,s1
    802006ee:	00000097          	auipc	ra,0x0
    802006f2:	fbc080e7          	jalr	-68(ra) # 802006aa <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    802006f6:	4705                	li	a4,1
  if(holding(lk))
    802006f8:	e115                	bnez	a0,8020071c <acquire+0x44>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    802006fa:	87ba                	mv	a5,a4
    802006fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80200700:	2781                	sext.w	a5,a5
    80200702:	ffe5                	bnez	a5,802006fa <acquire+0x22>
  __sync_synchronize();
    80200704:	0ff0000f          	fence
  lk->cpu = mycpu();
    80200708:	00001097          	auipc	ra,0x1
    8020070c:	39c080e7          	jalr	924(ra) # 80201aa4 <mycpu>
    80200710:	e888                	sd	a0,16(s1)
}
    80200712:	60e2                	ld	ra,24(sp)
    80200714:	6442                	ld	s0,16(sp)
    80200716:	64a2                	ld	s1,8(sp)
    80200718:	6105                	addi	sp,sp,32
    8020071a:	8082                	ret
    panic("acquire");
    8020071c:	00009517          	auipc	a0,0x9
    80200720:	cac50513          	addi	a0,a0,-852 # 802093c8 <etext+0x3c8>
    80200724:	00000097          	auipc	ra,0x0
    80200728:	a22080e7          	jalr	-1502(ra) # 80200146 <panic>

000000008020072c <release>:
{
    8020072c:	1101                	addi	sp,sp,-32
    8020072e:	ec06                	sd	ra,24(sp)
    80200730:	e822                	sd	s0,16(sp)
    80200732:	e426                	sd	s1,8(sp)
    80200734:	1000                	addi	s0,sp,32
    80200736:	84aa                	mv	s1,a0
  if(!holding(lk))
    80200738:	00000097          	auipc	ra,0x0
    8020073c:	f72080e7          	jalr	-142(ra) # 802006aa <holding>
    80200740:	c115                	beqz	a0,80200764 <release+0x38>
  lk->cpu = 0;
    80200742:	0004b823          	sd	zero,16(s1)
  __sync_synchronize();
    80200746:	0ff0000f          	fence
  __sync_lock_release(&lk->locked);
    8020074a:	0f50000f          	fence	iorw,ow
    8020074e:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
    80200752:	00000097          	auipc	ra,0x0
    80200756:	ee2080e7          	jalr	-286(ra) # 80200634 <pop_off>
}
    8020075a:	60e2                	ld	ra,24(sp)
    8020075c:	6442                	ld	s0,16(sp)
    8020075e:	64a2                	ld	s1,8(sp)
    80200760:	6105                	addi	sp,sp,32
    80200762:	8082                	ret
    panic("release");
    80200764:	00009517          	auipc	a0,0x9
    80200768:	c6c50513          	addi	a0,a0,-916 # 802093d0 <etext+0x3d0>
    8020076c:	00000097          	auipc	ra,0x0
    80200770:	9da080e7          	jalr	-1574(ra) # 80200146 <panic>

0000000080200774 <memset>:
#include "include/types.h"

void*
memset(void *dst, int c, uint n)
{
    80200774:	1141                	addi	sp,sp,-16
    80200776:	e422                	sd	s0,8(sp)
    80200778:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    8020077a:	ce09                	beqz	a2,80200794 <memset+0x20>
    8020077c:	87aa                	mv	a5,a0
    8020077e:	fff6071b          	addiw	a4,a2,-1
    80200782:	1702                	slli	a4,a4,0x20
    80200784:	9301                	srli	a4,a4,0x20
    80200786:	0705                	addi	a4,a4,1
    80200788:	972a                	add	a4,a4,a0
    cdst[i] = c;
    8020078a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    8020078e:	0785                	addi	a5,a5,1
    80200790:	fee79de3          	bne	a5,a4,8020078a <memset+0x16>
  }
  return dst;
}
    80200794:	6422                	ld	s0,8(sp)
    80200796:	0141                	addi	sp,sp,16
    80200798:	8082                	ret

000000008020079a <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    8020079a:	1141                	addi	sp,sp,-16
    8020079c:	e422                	sd	s0,8(sp)
    8020079e:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    802007a0:	ce15                	beqz	a2,802007dc <memcmp+0x42>
    802007a2:	fff6069b          	addiw	a3,a2,-1
    if(*s1 != *s2)
    802007a6:	00054783          	lbu	a5,0(a0)
    802007aa:	0005c703          	lbu	a4,0(a1)
    802007ae:	02e79063          	bne	a5,a4,802007ce <memcmp+0x34>
    802007b2:	1682                	slli	a3,a3,0x20
    802007b4:	9281                	srli	a3,a3,0x20
    802007b6:	0685                	addi	a3,a3,1
    802007b8:	96aa                	add	a3,a3,a0
      return *s1 - *s2;
    s1++, s2++;
    802007ba:	0505                	addi	a0,a0,1
    802007bc:	0585                	addi	a1,a1,1
  while(n-- > 0){
    802007be:	00d50d63          	beq	a0,a3,802007d8 <memcmp+0x3e>
    if(*s1 != *s2)
    802007c2:	00054783          	lbu	a5,0(a0)
    802007c6:	0005c703          	lbu	a4,0(a1)
    802007ca:	fee788e3          	beq	a5,a4,802007ba <memcmp+0x20>
      return *s1 - *s2;
    802007ce:	40e7853b          	subw	a0,a5,a4
  }

  return 0;
}
    802007d2:	6422                	ld	s0,8(sp)
    802007d4:	0141                	addi	sp,sp,16
    802007d6:	8082                	ret
  return 0;
    802007d8:	4501                	li	a0,0
    802007da:	bfe5                	j	802007d2 <memcmp+0x38>
    802007dc:	4501                	li	a0,0
    802007de:	bfd5                	j	802007d2 <memcmp+0x38>

00000000802007e0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    802007e0:	1141                	addi	sp,sp,-16
    802007e2:	e422                	sd	s0,8(sp)
    802007e4:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
    802007e6:	00a5f963          	bleu	a0,a1,802007f8 <memmove+0x18>
    802007ea:	02061713          	slli	a4,a2,0x20
    802007ee:	9301                	srli	a4,a4,0x20
    802007f0:	00e587b3          	add	a5,a1,a4
    802007f4:	02f56563          	bltu	a0,a5,8020081e <memmove+0x3e>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
    802007f8:	fff6069b          	addiw	a3,a2,-1
    802007fc:	ce11                	beqz	a2,80200818 <memmove+0x38>
    802007fe:	1682                	slli	a3,a3,0x20
    80200800:	9281                	srli	a3,a3,0x20
    80200802:	0685                	addi	a3,a3,1
    80200804:	96ae                	add	a3,a3,a1
    80200806:	87aa                	mv	a5,a0
      *d++ = *s++;
    80200808:	0585                	addi	a1,a1,1
    8020080a:	0785                	addi	a5,a5,1
    8020080c:	fff5c703          	lbu	a4,-1(a1)
    80200810:	fee78fa3          	sb	a4,-1(a5)
    while(n-- > 0)
    80200814:	fed59ae3          	bne	a1,a3,80200808 <memmove+0x28>

  return dst;
}
    80200818:	6422                	ld	s0,8(sp)
    8020081a:	0141                	addi	sp,sp,16
    8020081c:	8082                	ret
    d += n;
    8020081e:	972a                	add	a4,a4,a0
    while(n-- > 0)
    80200820:	fff6069b          	addiw	a3,a2,-1
    80200824:	da75                	beqz	a2,80200818 <memmove+0x38>
    80200826:	02069613          	slli	a2,a3,0x20
    8020082a:	9201                	srli	a2,a2,0x20
    8020082c:	fff64613          	not	a2,a2
    80200830:	963e                	add	a2,a2,a5
      *--d = *--s;
    80200832:	17fd                	addi	a5,a5,-1
    80200834:	177d                	addi	a4,a4,-1
    80200836:	0007c683          	lbu	a3,0(a5)
    8020083a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    8020083e:	fef61ae3          	bne	a2,a5,80200832 <memmove+0x52>
    80200842:	bfd9                	j	80200818 <memmove+0x38>

0000000080200844 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80200844:	1141                	addi	sp,sp,-16
    80200846:	e406                	sd	ra,8(sp)
    80200848:	e022                	sd	s0,0(sp)
    8020084a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    8020084c:	00000097          	auipc	ra,0x0
    80200850:	f94080e7          	jalr	-108(ra) # 802007e0 <memmove>
}
    80200854:	60a2                	ld	ra,8(sp)
    80200856:	6402                	ld	s0,0(sp)
    80200858:	0141                	addi	sp,sp,16
    8020085a:	8082                	ret

000000008020085c <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    8020085c:	1141                	addi	sp,sp,-16
    8020085e:	e422                	sd	s0,8(sp)
    80200860:	0800                	addi	s0,sp,16
  while(n > 0 && *p && *p == *q)
    80200862:	c229                	beqz	a2,802008a4 <strncmp+0x48>
    80200864:	00054783          	lbu	a5,0(a0)
    80200868:	c795                	beqz	a5,80200894 <strncmp+0x38>
    8020086a:	0005c703          	lbu	a4,0(a1)
    8020086e:	02f71363          	bne	a4,a5,80200894 <strncmp+0x38>
    80200872:	fff6071b          	addiw	a4,a2,-1
    80200876:	1702                	slli	a4,a4,0x20
    80200878:	9301                	srli	a4,a4,0x20
    8020087a:	0705                	addi	a4,a4,1
    8020087c:	972a                	add	a4,a4,a0
    n--, p++, q++;
    8020087e:	0505                	addi	a0,a0,1
    80200880:	0585                	addi	a1,a1,1
  while(n > 0 && *p && *p == *q)
    80200882:	02e50363          	beq	a0,a4,802008a8 <strncmp+0x4c>
    80200886:	00054783          	lbu	a5,0(a0)
    8020088a:	c789                	beqz	a5,80200894 <strncmp+0x38>
    8020088c:	0005c683          	lbu	a3,0(a1)
    80200890:	fef687e3          	beq	a3,a5,8020087e <strncmp+0x22>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
    80200894:	00054503          	lbu	a0,0(a0)
    80200898:	0005c783          	lbu	a5,0(a1)
    8020089c:	9d1d                	subw	a0,a0,a5
}
    8020089e:	6422                	ld	s0,8(sp)
    802008a0:	0141                	addi	sp,sp,16
    802008a2:	8082                	ret
    return 0;
    802008a4:	4501                	li	a0,0
    802008a6:	bfe5                	j	8020089e <strncmp+0x42>
    802008a8:	4501                	li	a0,0
    802008aa:	bfd5                	j	8020089e <strncmp+0x42>

00000000802008ac <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    802008ac:	1141                	addi	sp,sp,-16
    802008ae:	e422                	sd	s0,8(sp)
    802008b0:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    802008b2:	872a                	mv	a4,a0
    802008b4:	a011                	j	802008b8 <strncpy+0xc>
    802008b6:	8636                	mv	a2,a3
    802008b8:	fff6069b          	addiw	a3,a2,-1
    802008bc:	00c05963          	blez	a2,802008ce <strncpy+0x22>
    802008c0:	0705                	addi	a4,a4,1
    802008c2:	0005c783          	lbu	a5,0(a1)
    802008c6:	fef70fa3          	sb	a5,-1(a4)
    802008ca:	0585                	addi	a1,a1,1
    802008cc:	f7ed                	bnez	a5,802008b6 <strncpy+0xa>
    ;
  while(n-- > 0)
    802008ce:	00d05c63          	blez	a3,802008e6 <strncpy+0x3a>
    802008d2:	86ba                	mv	a3,a4
    *s++ = 0;
    802008d4:	0685                	addi	a3,a3,1
    802008d6:	fe068fa3          	sb	zero,-1(a3)
  while(n-- > 0)
    802008da:	fff6c793          	not	a5,a3
    802008de:	9fb9                	addw	a5,a5,a4
    802008e0:	9fb1                	addw	a5,a5,a2
    802008e2:	fef049e3          	bgtz	a5,802008d4 <strncpy+0x28>
  return os;
}
    802008e6:	6422                	ld	s0,8(sp)
    802008e8:	0141                	addi	sp,sp,16
    802008ea:	8082                	ret

00000000802008ec <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    802008ec:	1141                	addi	sp,sp,-16
    802008ee:	e422                	sd	s0,8(sp)
    802008f0:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if(n <= 0)
    802008f2:	02c05363          	blez	a2,80200918 <safestrcpy+0x2c>
    802008f6:	fff6069b          	addiw	a3,a2,-1
    802008fa:	1682                	slli	a3,a3,0x20
    802008fc:	9281                	srli	a3,a3,0x20
    802008fe:	96ae                	add	a3,a3,a1
    80200900:	87aa                	mv	a5,a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    80200902:	00d58963          	beq	a1,a3,80200914 <safestrcpy+0x28>
    80200906:	0585                	addi	a1,a1,1
    80200908:	0785                	addi	a5,a5,1
    8020090a:	fff5c703          	lbu	a4,-1(a1)
    8020090e:	fee78fa3          	sb	a4,-1(a5)
    80200912:	fb65                	bnez	a4,80200902 <safestrcpy+0x16>
    ;
  *s = 0;
    80200914:	00078023          	sb	zero,0(a5)
  return os;
}
    80200918:	6422                	ld	s0,8(sp)
    8020091a:	0141                	addi	sp,sp,16
    8020091c:	8082                	ret

000000008020091e <strlen>:

int
strlen(const char *s)
{
    8020091e:	1141                	addi	sp,sp,-16
    80200920:	e422                	sd	s0,8(sp)
    80200922:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    80200924:	00054783          	lbu	a5,0(a0)
    80200928:	cf91                	beqz	a5,80200944 <strlen+0x26>
    8020092a:	0505                	addi	a0,a0,1
    8020092c:	87aa                	mv	a5,a0
    8020092e:	4685                	li	a3,1
    80200930:	9e89                	subw	a3,a3,a0
    80200932:	00f6853b          	addw	a0,a3,a5
    80200936:	0785                	addi	a5,a5,1
    80200938:	fff7c703          	lbu	a4,-1(a5)
    8020093c:	fb7d                	bnez	a4,80200932 <strlen+0x14>
    ;
  return n;
}
    8020093e:	6422                	ld	s0,8(sp)
    80200940:	0141                	addi	sp,sp,16
    80200942:	8082                	ret
  for(n = 0; s[n]; n++)
    80200944:	4501                	li	a0,0
    80200946:	bfe5                	j	8020093e <strlen+0x20>

0000000080200948 <wnstr>:

// convert uchar string into wide char string 
void wnstr(wchar *dst, char const *src, int len) {
    80200948:	1141                	addi	sp,sp,-16
    8020094a:	e422                	sd	s0,8(sp)
    8020094c:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    8020094e:	ca15                	beqz	a2,80200982 <wnstr+0x3a>
    80200950:	0005c783          	lbu	a5,0(a1)
    80200954:	cb8d                	beqz	a5,80200986 <wnstr+0x3e>
    80200956:	fff6071b          	addiw	a4,a2,-1
    8020095a:	1702                	slli	a4,a4,0x20
    8020095c:	9301                	srli	a4,a4,0x20
    8020095e:	0705                	addi	a4,a4,1
    80200960:	0706                	slli	a4,a4,0x1
    80200962:	972a                	add	a4,a4,a0
    *(uchar*)dst = *src++;
    80200964:	0585                	addi	a1,a1,1
    80200966:	00f50023          	sb	a5,0(a0)
    dst ++;
    8020096a:	0509                	addi	a0,a0,2
  while (len -- && *src) {
    8020096c:	00e50663          	beq	a0,a4,80200978 <wnstr+0x30>
    80200970:	0005c783          	lbu	a5,0(a1)
    80200974:	fbe5                	bnez	a5,80200964 <wnstr+0x1c>
    dst ++;
    80200976:	872a                	mv	a4,a0
  }

  *dst = 0;
    80200978:	00071023          	sh	zero,0(a4)
}
    8020097c:	6422                	ld	s0,8(sp)
    8020097e:	0141                	addi	sp,sp,16
    80200980:	8082                	ret
  while (len -- && *src) {
    80200982:	872a                	mv	a4,a0
    80200984:	bfd5                	j	80200978 <wnstr+0x30>
    80200986:	872a                	mv	a4,a0
    80200988:	bfc5                	j	80200978 <wnstr+0x30>

000000008020098a <snstr>:

// convert wide char string into uchar string 
void snstr(char *dst, wchar const *src, int len) {
    8020098a:	1141                	addi	sp,sp,-16
    8020098c:	e422                	sd	s0,8(sp)
    8020098e:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200990:	c229                	beqz	a2,802009d2 <snstr+0x48>
    80200992:	fff6071b          	addiw	a4,a2,-1
    80200996:	0005d783          	lhu	a5,0(a1)
    8020099a:	cf99                	beqz	a5,802009b8 <snstr+0x2e>
    8020099c:	3679                	addiw	a2,a2,-2
    8020099e:	56fd                	li	a3,-1
    *dst++ = (uchar)(*src & 0xff);
    802009a0:	0505                	addi	a0,a0,1
    802009a2:	fef50fa3          	sb	a5,-1(a0)
    src ++;
    802009a6:	0589                	addi	a1,a1,2
  while (len -- && *src) {
    802009a8:	0006071b          	sext.w	a4,a2
    802009ac:	02d60363          	beq	a2,a3,802009d2 <snstr+0x48>
    802009b0:	0005d783          	lhu	a5,0(a1)
    802009b4:	367d                	addiw	a2,a2,-1
    802009b6:	f7ed                	bnez	a5,802009a0 <snstr+0x16>
  }
  while(len-- > 0)
    802009b8:	00e05d63          	blez	a4,802009d2 <snstr+0x48>
    802009bc:	fff7079b          	addiw	a5,a4,-1
    802009c0:	1782                	slli	a5,a5,0x20
    802009c2:	9381                	srli	a5,a5,0x20
    802009c4:	0785                	addi	a5,a5,1
    802009c6:	97aa                	add	a5,a5,a0
    *dst++ = 0;
    802009c8:	0505                	addi	a0,a0,1
    802009ca:	fe050fa3          	sb	zero,-1(a0)
  while(len-- > 0)
    802009ce:	fea79de3          	bne	a5,a0,802009c8 <snstr+0x3e>
}
    802009d2:	6422                	ld	s0,8(sp)
    802009d4:	0141                	addi	sp,sp,16
    802009d6:	8082                	ret

00000000802009d8 <wcsncmp>:

int wcsncmp(wchar const *s1, wchar const *s2, int len) {
    802009d8:	1141                	addi	sp,sp,-16
    802009da:	e422                	sd	s0,8(sp)
    802009dc:	0800                	addi	s0,sp,16
  int ret = 0;

  while (len-- && *s1) {
    802009de:	1602                	slli	a2,a2,0x20
    802009e0:	9201                	srli	a2,a2,0x20
    802009e2:	0606                	slli	a2,a2,0x1
    802009e4:	962e                	add	a2,a2,a1
    802009e6:	00c58c63          	beq	a1,a2,802009fe <wcsncmp+0x26>
    802009ea:	00055783          	lhu	a5,0(a0)
    802009ee:	cb89                	beqz	a5,80200a00 <wcsncmp+0x28>
    ret = (int)(*s1++ - *s2++);
    802009f0:	0509                	addi	a0,a0,2
    802009f2:	0589                	addi	a1,a1,2
    802009f4:	ffe5d703          	lhu	a4,-2(a1)
    802009f8:	9f99                	subw	a5,a5,a4
    if (ret) break;
    802009fa:	d7f5                	beqz	a5,802009e6 <wcsncmp+0xe>
    802009fc:	a011                	j	80200a00 <wcsncmp+0x28>
    802009fe:	4781                	li	a5,0
  }

  return ret;
}
    80200a00:	853e                	mv	a0,a5
    80200a02:	6422                	ld	s0,8(sp)
    80200a04:	0141                	addi	sp,sp,16
    80200a06:	8082                	ret

0000000080200a08 <strchr>:

char*
strchr(const char *s, char c)
{
    80200a08:	1141                	addi	sp,sp,-16
    80200a0a:	e422                	sd	s0,8(sp)
    80200a0c:	0800                	addi	s0,sp,16
  for(; *s; s++)
    80200a0e:	00054783          	lbu	a5,0(a0)
    80200a12:	cf91                	beqz	a5,80200a2e <strchr+0x26>
    if(*s == c)
    80200a14:	00f58a63          	beq	a1,a5,80200a28 <strchr+0x20>
  for(; *s; s++)
    80200a18:	0505                	addi	a0,a0,1
    80200a1a:	00054783          	lbu	a5,0(a0)
    80200a1e:	c781                	beqz	a5,80200a26 <strchr+0x1e>
    if(*s == c)
    80200a20:	feb79ce3          	bne	a5,a1,80200a18 <strchr+0x10>
    80200a24:	a011                	j	80200a28 <strchr+0x20>
      return (char*)s;
  return 0;
    80200a26:	4501                	li	a0,0
    80200a28:	6422                	ld	s0,8(sp)
    80200a2a:	0141                	addi	sp,sp,16
    80200a2c:	8082                	ret
  return 0;
    80200a2e:	4501                	li	a0,0
    80200a30:	bfe5                	j	80200a28 <strchr+0x20>

0000000080200a32 <main>:

volatile static int started = 0;

void
main(unsigned long hartid, unsigned long dtb_pa)
{
    80200a32:	1101                	addi	sp,sp,-32
    80200a34:	ec06                	sd	ra,24(sp)
    80200a36:	e822                	sd	s0,16(sp)
    80200a38:	1000                	addi	s0,sp,32
  asm volatile("mv tp, %0" : : "r" (hartid & 0x1));
    80200a3a:	00157793          	andi	a5,a0,1
    80200a3e:	823e                	mv	tp,a5
    started = 1;
  }
  else
  {
    // hart 1
    while (started == 0)
    80200a40:	00012717          	auipc	a4,0x12
    80200a44:	61070713          	addi	a4,a4,1552 # 80213050 <started>
  if (hartid == 0) {
    80200a48:	cd15                	beqz	a0,80200a84 <main+0x52>
    while (started == 0)
    80200a4a:	431c                	lw	a5,0(a4)
    80200a4c:	2781                	sext.w	a5,a5
    80200a4e:	dff5                	beqz	a5,80200a4a <main+0x18>
      ;
    __sync_synchronize();
    80200a50:	0ff0000f          	fence
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    #endif
    kvminithart();
    80200a54:	00000097          	auipc	ra,0x0
    80200a58:	0de080e7          	jalr	222(ra) # 80200b32 <kvminithart>
    trapinithart();
    80200a5c:	00002097          	auipc	ra,0x2
    80200a60:	d6a080e7          	jalr	-662(ra) # 802027c6 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a64:	00006097          	auipc	ra,0x6
    80200a68:	14e080e7          	jalr	334(ra) # 80206bb2 <plicinithart>
    printf("hart 1 init done\n");
    80200a6c:	00009517          	auipc	a0,0x9
    80200a70:	98450513          	addi	a0,a0,-1660 # 802093f0 <etext+0x3f0>
    80200a74:	fffff097          	auipc	ra,0xfffff
    80200a78:	71c080e7          	jalr	1820(ra) # 80200190 <printf>
  }
  scheduler();
    80200a7c:	00001097          	auipc	ra,0x1
    80200a80:	5d6080e7          	jalr	1494(ra) # 80202052 <scheduler>
    consoleinit();
    80200a84:	00006097          	auipc	ra,0x6
    80200a88:	56a080e7          	jalr	1386(ra) # 80206fee <consoleinit>
    printfinit();   // init a lock for printf 
    80200a8c:	00000097          	auipc	ra,0x0
    80200a90:	8f0080e7          	jalr	-1808(ra) # 8020037c <printfinit>
    print_logo();
    80200a94:	00000097          	auipc	ra,0x0
    80200a98:	91a080e7          	jalr	-1766(ra) # 802003ae <print_logo>
    kinit();         // physical page allocator
    80200a9c:	00000097          	auipc	ra,0x0
    80200aa0:	a82080e7          	jalr	-1406(ra) # 8020051e <kinit>
    kvminit();       // create kernel page table
    80200aa4:	00000097          	auipc	ra,0x0
    80200aa8:	2dc080e7          	jalr	732(ra) # 80200d80 <kvminit>
    kvminithart();   // turn on paging
    80200aac:	00000097          	auipc	ra,0x0
    80200ab0:	086080e7          	jalr	134(ra) # 80200b32 <kvminithart>
    timerinit();     // init a lock for timer
    80200ab4:	00004097          	auipc	ra,0x4
    80200ab8:	66a080e7          	jalr	1642(ra) # 8020511e <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200abc:	00002097          	auipc	ra,0x2
    80200ac0:	d0a080e7          	jalr	-758(ra) # 802027c6 <trapinithart>
    procinit();
    80200ac4:	00001097          	auipc	ra,0x1
    80200ac8:	f5a080e7          	jalr	-166(ra) # 80201a1e <procinit>
    plicinit();
    80200acc:	00006097          	auipc	ra,0x6
    80200ad0:	0ce080e7          	jalr	206(ra) # 80206b9a <plicinit>
    plicinithart();
    80200ad4:	00006097          	auipc	ra,0x6
    80200ad8:	0de080e7          	jalr	222(ra) # 80206bb2 <plicinithart>
    disk_init();
    80200adc:	00004097          	auipc	ra,0x4
    80200ae0:	6f4080e7          	jalr	1780(ra) # 802051d0 <disk_init>
    binit();         // buffer cache
    80200ae4:	00003097          	auipc	ra,0x3
    80200ae8:	974080e7          	jalr	-1676(ra) # 80203458 <binit>
    fileinit();      // file table
    80200aec:	00003097          	auipc	ra,0x3
    80200af0:	d8a080e7          	jalr	-630(ra) # 80203876 <fileinit>
    userinit();      // first user process
    80200af4:	00001097          	auipc	ra,0x1
    80200af8:	2f0080e7          	jalr	752(ra) # 80201de4 <userinit>
    printf("hart 0 init done\n");
    80200afc:	00009517          	auipc	a0,0x9
    80200b00:	8dc50513          	addi	a0,a0,-1828 # 802093d8 <etext+0x3d8>
    80200b04:	fffff097          	auipc	ra,0xfffff
    80200b08:	68c080e7          	jalr	1676(ra) # 80200190 <printf>
      unsigned long mask = 1 << i;
    80200b0c:	4789                	li	a5,2
    80200b0e:	fef43423          	sd	a5,-24(s0)
	SBI_CALL_0(SBI_CLEAR_IPI);
}

static inline void sbi_send_ipi(const unsigned long *hart_mask)
{
	SBI_CALL_1(SBI_SEND_IPI, hart_mask);
    80200b12:	fe840513          	addi	a0,s0,-24
    80200b16:	4581                	li	a1,0
    80200b18:	4601                	li	a2,0
    80200b1a:	4681                	li	a3,0
    80200b1c:	4891                	li	a7,4
    80200b1e:	00000073          	ecall
    __sync_synchronize();
    80200b22:	0ff0000f          	fence
    started = 1;
    80200b26:	4785                	li	a5,1
    80200b28:	00012717          	auipc	a4,0x12
    80200b2c:	52f72423          	sw	a5,1320(a4) # 80213050 <started>
    80200b30:	b7b1                	j	80200a7c <main+0x4a>

0000000080200b32 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80200b32:	1141                	addi	sp,sp,-16
    80200b34:	e422                	sd	s0,8(sp)
    80200b36:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80200b38:	00012797          	auipc	a5,0x12
    80200b3c:	52078793          	addi	a5,a5,1312 # 80213058 <kernel_pagetable>
    80200b40:	639c                	ld	a5,0(a5)
    80200b42:	83b1                	srli	a5,a5,0xc
    80200b44:	577d                	li	a4,-1
    80200b46:	177e                	slli	a4,a4,0x3f
    80200b48:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80200b4a:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    80200b4e:	12000073          	sfence.vma
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
  #endif
}
    80200b52:	6422                	ld	s0,8(sp)
    80200b54:	0141                	addi	sp,sp,16
    80200b56:	8082                	ret

0000000080200b58 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80200b58:	7139                	addi	sp,sp,-64
    80200b5a:	fc06                	sd	ra,56(sp)
    80200b5c:	f822                	sd	s0,48(sp)
    80200b5e:	f426                	sd	s1,40(sp)
    80200b60:	f04a                	sd	s2,32(sp)
    80200b62:	ec4e                	sd	s3,24(sp)
    80200b64:	e852                	sd	s4,16(sp)
    80200b66:	e456                	sd	s5,8(sp)
    80200b68:	e05a                	sd	s6,0(sp)
    80200b6a:	0080                	addi	s0,sp,64
    80200b6c:	84aa                	mv	s1,a0
    80200b6e:	89ae                	mv	s3,a1
    80200b70:	8b32                	mv	s6,a2
  
  if(va >= MAXVA)
    80200b72:	57fd                	li	a5,-1
    80200b74:	83e9                	srli	a5,a5,0x1a
    80200b76:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80200b78:	4ab1                	li	s5,12
  if(va >= MAXVA)
    80200b7a:	04b7f263          	bleu	a1,a5,80200bbe <walk+0x66>
    panic("walk");
    80200b7e:	00009517          	auipc	a0,0x9
    80200b82:	88a50513          	addi	a0,a0,-1910 # 80209408 <etext+0x408>
    80200b86:	fffff097          	auipc	ra,0xfffff
    80200b8a:	5c0080e7          	jalr	1472(ra) # 80200146 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
    80200b8e:	060b0663          	beqz	s6,80200bfa <walk+0xa2>
    80200b92:	00000097          	auipc	ra,0x0
    80200b96:	9d8080e7          	jalr	-1576(ra) # 8020056a <kalloc>
    80200b9a:	84aa                	mv	s1,a0
    80200b9c:	c529                	beqz	a0,80200be6 <walk+0x8e>
        return NULL;
      memset(pagetable, 0, PGSIZE);
    80200b9e:	6605                	lui	a2,0x1
    80200ba0:	4581                	li	a1,0
    80200ba2:	00000097          	auipc	ra,0x0
    80200ba6:	bd2080e7          	jalr	-1070(ra) # 80200774 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80200baa:	00c4d793          	srli	a5,s1,0xc
    80200bae:	07aa                	slli	a5,a5,0xa
    80200bb0:	0017e793          	ori	a5,a5,1
    80200bb4:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    80200bb8:	3a5d                	addiw	s4,s4,-9
    80200bba:	035a0063          	beq	s4,s5,80200bda <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    80200bbe:	0149d933          	srl	s2,s3,s4
    80200bc2:	1ff97913          	andi	s2,s2,511
    80200bc6:	090e                	slli	s2,s2,0x3
    80200bc8:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    80200bca:	00093483          	ld	s1,0(s2)
    80200bce:	0014f793          	andi	a5,s1,1
    80200bd2:	dfd5                	beqz	a5,80200b8e <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80200bd4:	80a9                	srli	s1,s1,0xa
    80200bd6:	04b2                	slli	s1,s1,0xc
    80200bd8:	b7c5                	j	80200bb8 <walk+0x60>
    }
  }
  return &pagetable[PX(0, va)];
    80200bda:	00c9d513          	srli	a0,s3,0xc
    80200bde:	1ff57513          	andi	a0,a0,511
    80200be2:	050e                	slli	a0,a0,0x3
    80200be4:	9526                	add	a0,a0,s1
}
    80200be6:	70e2                	ld	ra,56(sp)
    80200be8:	7442                	ld	s0,48(sp)
    80200bea:	74a2                	ld	s1,40(sp)
    80200bec:	7902                	ld	s2,32(sp)
    80200bee:	69e2                	ld	s3,24(sp)
    80200bf0:	6a42                	ld	s4,16(sp)
    80200bf2:	6aa2                	ld	s5,8(sp)
    80200bf4:	6b02                	ld	s6,0(sp)
    80200bf6:	6121                	addi	sp,sp,64
    80200bf8:	8082                	ret
        return NULL;
    80200bfa:	4501                	li	a0,0
    80200bfc:	b7ed                	j	80200be6 <walk+0x8e>

0000000080200bfe <walkaddr>:
walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80200bfe:	57fd                	li	a5,-1
    80200c00:	83e9                	srli	a5,a5,0x1a
    80200c02:	00b7f463          	bleu	a1,a5,80200c0a <walkaddr+0xc>
    return NULL;
    80200c06:	4501                	li	a0,0
    return NULL;
  if((*pte & PTE_U) == 0)
    return NULL;
  pa = PTE2PA(*pte);
  return pa;
}
    80200c08:	8082                	ret
{
    80200c0a:	1141                	addi	sp,sp,-16
    80200c0c:	e406                	sd	ra,8(sp)
    80200c0e:	e022                	sd	s0,0(sp)
    80200c10:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80200c12:	4601                	li	a2,0
    80200c14:	00000097          	auipc	ra,0x0
    80200c18:	f44080e7          	jalr	-188(ra) # 80200b58 <walk>
  if(pte == 0)
    80200c1c:	c105                	beqz	a0,80200c3c <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    80200c1e:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    80200c20:	0117f693          	andi	a3,a5,17
    80200c24:	4745                	li	a4,17
    return NULL;
    80200c26:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80200c28:	00e68663          	beq	a3,a4,80200c34 <walkaddr+0x36>
}
    80200c2c:	60a2                	ld	ra,8(sp)
    80200c2e:	6402                	ld	s0,0(sp)
    80200c30:	0141                	addi	sp,sp,16
    80200c32:	8082                	ret
  pa = PTE2PA(*pte);
    80200c34:	00a7d513          	srli	a0,a5,0xa
    80200c38:	0532                	slli	a0,a0,0xc
  return pa;
    80200c3a:	bfcd                	j	80200c2c <walkaddr+0x2e>
    return NULL;
    80200c3c:	4501                	li	a0,0
    80200c3e:	b7fd                	j	80200c2c <walkaddr+0x2e>

0000000080200c40 <kwalkaddr>:
  return kwalkaddr(kernel_pagetable, va);
}

uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
    80200c40:	1101                	addi	sp,sp,-32
    80200c42:	ec06                	sd	ra,24(sp)
    80200c44:	e822                	sd	s0,16(sp)
    80200c46:	e426                	sd	s1,8(sp)
    80200c48:	1000                	addi	s0,sp,32
  uint64 off = va % PGSIZE;
    80200c4a:	6785                	lui	a5,0x1
    80200c4c:	17fd                	addi	a5,a5,-1
    80200c4e:	00f5f4b3          	and	s1,a1,a5
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
    80200c52:	4601                	li	a2,0
    80200c54:	00000097          	auipc	ra,0x0
    80200c58:	f04080e7          	jalr	-252(ra) # 80200b58 <walk>
  if(pte == 0)
    80200c5c:	cd09                	beqz	a0,80200c76 <kwalkaddr+0x36>
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    80200c5e:	6108                	ld	a0,0(a0)
    80200c60:	00157793          	andi	a5,a0,1
    80200c64:	c38d                	beqz	a5,80200c86 <kwalkaddr+0x46>
    panic("kvmpa");
  pa = PTE2PA(*pte);
    80200c66:	8129                	srli	a0,a0,0xa
    80200c68:	0532                	slli	a0,a0,0xc
  return pa+off;
}
    80200c6a:	9526                	add	a0,a0,s1
    80200c6c:	60e2                	ld	ra,24(sp)
    80200c6e:	6442                	ld	s0,16(sp)
    80200c70:	64a2                	ld	s1,8(sp)
    80200c72:	6105                	addi	sp,sp,32
    80200c74:	8082                	ret
    panic("kvmpa");
    80200c76:	00008517          	auipc	a0,0x8
    80200c7a:	79a50513          	addi	a0,a0,1946 # 80209410 <etext+0x410>
    80200c7e:	fffff097          	auipc	ra,0xfffff
    80200c82:	4c8080e7          	jalr	1224(ra) # 80200146 <panic>
    panic("kvmpa");
    80200c86:	00008517          	auipc	a0,0x8
    80200c8a:	78a50513          	addi	a0,a0,1930 # 80209410 <etext+0x410>
    80200c8e:	fffff097          	auipc	ra,0xfffff
    80200c92:	4b8080e7          	jalr	1208(ra) # 80200146 <panic>

0000000080200c96 <kvmpa>:
{
    80200c96:	1141                	addi	sp,sp,-16
    80200c98:	e406                	sd	ra,8(sp)
    80200c9a:	e022                	sd	s0,0(sp)
    80200c9c:	0800                	addi	s0,sp,16
  return kwalkaddr(kernel_pagetable, va);
    80200c9e:	85aa                	mv	a1,a0
    80200ca0:	00012797          	auipc	a5,0x12
    80200ca4:	3b878793          	addi	a5,a5,952 # 80213058 <kernel_pagetable>
    80200ca8:	6388                	ld	a0,0(a5)
    80200caa:	00000097          	auipc	ra,0x0
    80200cae:	f96080e7          	jalr	-106(ra) # 80200c40 <kwalkaddr>
}
    80200cb2:	60a2                	ld	ra,8(sp)
    80200cb4:	6402                	ld	s0,0(sp)
    80200cb6:	0141                	addi	sp,sp,16
    80200cb8:	8082                	ret

0000000080200cba <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80200cba:	715d                	addi	sp,sp,-80
    80200cbc:	e486                	sd	ra,72(sp)
    80200cbe:	e0a2                	sd	s0,64(sp)
    80200cc0:	fc26                	sd	s1,56(sp)
    80200cc2:	f84a                	sd	s2,48(sp)
    80200cc4:	f44e                	sd	s3,40(sp)
    80200cc6:	f052                	sd	s4,32(sp)
    80200cc8:	ec56                	sd	s5,24(sp)
    80200cca:	e85a                	sd	s6,16(sp)
    80200ccc:	e45e                	sd	s7,8(sp)
    80200cce:	0880                	addi	s0,sp,80
    80200cd0:	8aaa                	mv	s5,a0
    80200cd2:	8b3a                	mv	s6,a4
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80200cd4:	79fd                	lui	s3,0xfffff
    80200cd6:	0135fa33          	and	s4,a1,s3
  last = PGROUNDDOWN(va + size - 1);
    80200cda:	167d                	addi	a2,a2,-1
    80200cdc:	962e                	add	a2,a2,a1
    80200cde:	013679b3          	and	s3,a2,s3
  a = PGROUNDDOWN(va);
    80200ce2:	8952                	mv	s2,s4
    80200ce4:	41468a33          	sub	s4,a3,s4
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    80200ce8:	6b85                	lui	s7,0x1
    80200cea:	a811                	j	80200cfe <mappages+0x44>
      panic("remap");
    80200cec:	00008517          	auipc	a0,0x8
    80200cf0:	72c50513          	addi	a0,a0,1836 # 80209418 <etext+0x418>
    80200cf4:	fffff097          	auipc	ra,0xfffff
    80200cf8:	452080e7          	jalr	1106(ra) # 80200146 <panic>
    a += PGSIZE;
    80200cfc:	995e                	add	s2,s2,s7
  for(;;){
    80200cfe:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200d02:	4605                	li	a2,1
    80200d04:	85ca                	mv	a1,s2
    80200d06:	8556                	mv	a0,s5
    80200d08:	00000097          	auipc	ra,0x0
    80200d0c:	e50080e7          	jalr	-432(ra) # 80200b58 <walk>
    80200d10:	cd19                	beqz	a0,80200d2e <mappages+0x74>
    if(*pte & PTE_V)
    80200d12:	611c                	ld	a5,0(a0)
    80200d14:	8b85                	andi	a5,a5,1
    80200d16:	fbf9                	bnez	a5,80200cec <mappages+0x32>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80200d18:	80b1                	srli	s1,s1,0xc
    80200d1a:	04aa                	slli	s1,s1,0xa
    80200d1c:	0164e4b3          	or	s1,s1,s6
    80200d20:	0014e493          	ori	s1,s1,1
    80200d24:	e104                	sd	s1,0(a0)
    if(a == last)
    80200d26:	fd391be3          	bne	s2,s3,80200cfc <mappages+0x42>
    pa += PGSIZE;
  }
  return 0;
    80200d2a:	4501                	li	a0,0
    80200d2c:	a011                	j	80200d30 <mappages+0x76>
      return -1;
    80200d2e:	557d                	li	a0,-1
}
    80200d30:	60a6                	ld	ra,72(sp)
    80200d32:	6406                	ld	s0,64(sp)
    80200d34:	74e2                	ld	s1,56(sp)
    80200d36:	7942                	ld	s2,48(sp)
    80200d38:	79a2                	ld	s3,40(sp)
    80200d3a:	7a02                	ld	s4,32(sp)
    80200d3c:	6ae2                	ld	s5,24(sp)
    80200d3e:	6b42                	ld	s6,16(sp)
    80200d40:	6ba2                	ld	s7,8(sp)
    80200d42:	6161                	addi	sp,sp,80
    80200d44:	8082                	ret

0000000080200d46 <kvmmap>:
{
    80200d46:	1141                	addi	sp,sp,-16
    80200d48:	e406                	sd	ra,8(sp)
    80200d4a:	e022                	sd	s0,0(sp)
    80200d4c:	0800                	addi	s0,sp,16
  if(mappages(kernel_pagetable, va, sz, pa, perm) != 0)
    80200d4e:	8736                	mv	a4,a3
    80200d50:	86ae                	mv	a3,a1
    80200d52:	85aa                	mv	a1,a0
    80200d54:	00012797          	auipc	a5,0x12
    80200d58:	30478793          	addi	a5,a5,772 # 80213058 <kernel_pagetable>
    80200d5c:	6388                	ld	a0,0(a5)
    80200d5e:	00000097          	auipc	ra,0x0
    80200d62:	f5c080e7          	jalr	-164(ra) # 80200cba <mappages>
    80200d66:	e509                	bnez	a0,80200d70 <kvmmap+0x2a>
}
    80200d68:	60a2                	ld	ra,8(sp)
    80200d6a:	6402                	ld	s0,0(sp)
    80200d6c:	0141                	addi	sp,sp,16
    80200d6e:	8082                	ret
    panic("kvmmap");
    80200d70:	00008517          	auipc	a0,0x8
    80200d74:	6b050513          	addi	a0,a0,1712 # 80209420 <etext+0x420>
    80200d78:	fffff097          	auipc	ra,0xfffff
    80200d7c:	3ce080e7          	jalr	974(ra) # 80200146 <panic>

0000000080200d80 <kvminit>:
{
    80200d80:	1101                	addi	sp,sp,-32
    80200d82:	ec06                	sd	ra,24(sp)
    80200d84:	e822                	sd	s0,16(sp)
    80200d86:	e426                	sd	s1,8(sp)
    80200d88:	1000                	addi	s0,sp,32
  kernel_pagetable = (pagetable_t) kalloc();
    80200d8a:	fffff097          	auipc	ra,0xfffff
    80200d8e:	7e0080e7          	jalr	2016(ra) # 8020056a <kalloc>
    80200d92:	00012797          	auipc	a5,0x12
    80200d96:	2ca7b323          	sd	a0,710(a5) # 80213058 <kernel_pagetable>
  memset(kernel_pagetable, 0, PGSIZE);
    80200d9a:	6605                	lui	a2,0x1
    80200d9c:	4581                	li	a1,0
    80200d9e:	00000097          	auipc	ra,0x0
    80200da2:	9d6080e7          	jalr	-1578(ra) # 80200774 <memset>
  kvmmap(UART_V, UART, PGSIZE, PTE_R | PTE_W);
    80200da6:	4699                	li	a3,6
    80200da8:	6605                	lui	a2,0x1
    80200daa:	100005b7          	lui	a1,0x10000
    80200dae:	3f100513          	li	a0,1009
    80200db2:	0572                	slli	a0,a0,0x1c
    80200db4:	00000097          	auipc	ra,0x0
    80200db8:	f92080e7          	jalr	-110(ra) # 80200d46 <kvmmap>
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80200dbc:	4699                	li	a3,6
    80200dbe:	6605                	lui	a2,0x1
    80200dc0:	100015b7          	lui	a1,0x10001
    80200dc4:	03f10537          	lui	a0,0x3f10
    80200dc8:	0505                	addi	a0,a0,1
    80200dca:	0532                	slli	a0,a0,0xc
    80200dcc:	00000097          	auipc	ra,0x0
    80200dd0:	f7a080e7          	jalr	-134(ra) # 80200d46 <kvmmap>
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200dd4:	4699                	li	a3,6
    80200dd6:	6641                	lui	a2,0x10
    80200dd8:	020005b7          	lui	a1,0x2000
    80200ddc:	01f81537          	lui	a0,0x1f81
    80200de0:	0536                	slli	a0,a0,0xd
    80200de2:	00000097          	auipc	ra,0x0
    80200de6:	f64080e7          	jalr	-156(ra) # 80200d46 <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x4000, PTE_R | PTE_W);
    80200dea:	4699                	li	a3,6
    80200dec:	6611                	lui	a2,0x4
    80200dee:	0c0005b7          	lui	a1,0xc000
    80200df2:	00fc3537          	lui	a0,0xfc3
    80200df6:	053a                	slli	a0,a0,0xe
    80200df8:	00000097          	auipc	ra,0x0
    80200dfc:	f4e080e7          	jalr	-178(ra) # 80200d46 <kvmmap>
  kvmmap(PLIC_V + 0x200000, PLIC + 0x200000, 0x4000, PTE_R | PTE_W);
    80200e00:	4699                	li	a3,6
    80200e02:	6611                	lui	a2,0x4
    80200e04:	0c2005b7          	lui	a1,0xc200
    80200e08:	1f861537          	lui	a0,0x1f861
    80200e0c:	0526                	slli	a0,a0,0x9
    80200e0e:	00000097          	auipc	ra,0x0
    80200e12:	f38080e7          	jalr	-200(ra) # 80200d46 <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200e16:	00009497          	auipc	s1,0x9
    80200e1a:	4424b483          	ld	s1,1090(s1) # 8020a258 <_GLOBAL_OFFSET_TABLE_+0x20>
    80200e1e:	46a9                	li	a3,10
    80200e20:	bff00613          	li	a2,-1025
    80200e24:	0656                	slli	a2,a2,0x15
    80200e26:	9626                	add	a2,a2,s1
    80200e28:	40100593          	li	a1,1025
    80200e2c:	05d6                	slli	a1,a1,0x15
    80200e2e:	852e                	mv	a0,a1
    80200e30:	00000097          	auipc	ra,0x0
    80200e34:	f16080e7          	jalr	-234(ra) # 80200d46 <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200e38:	4699                	li	a3,6
    80200e3a:	40300613          	li	a2,1027
    80200e3e:	0656                	slli	a2,a2,0x15
    80200e40:	8e05                	sub	a2,a2,s1
    80200e42:	85a6                	mv	a1,s1
    80200e44:	8526                	mv	a0,s1
    80200e46:	00000097          	auipc	ra,0x0
    80200e4a:	f00080e7          	jalr	-256(ra) # 80200d46 <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200e4e:	46a9                	li	a3,10
    80200e50:	6605                	lui	a2,0x1
    80200e52:	00009597          	auipc	a1,0x9
    80200e56:	3ee5b583          	ld	a1,1006(a1) # 8020a240 <_GLOBAL_OFFSET_TABLE_+0x8>
    80200e5a:	04000537          	lui	a0,0x4000
    80200e5e:	157d                	addi	a0,a0,-1
    80200e60:	0532                	slli	a0,a0,0xc
    80200e62:	00000097          	auipc	ra,0x0
    80200e66:	ee4080e7          	jalr	-284(ra) # 80200d46 <kvmmap>
}
    80200e6a:	60e2                	ld	ra,24(sp)
    80200e6c:	6442                	ld	s0,16(sp)
    80200e6e:	64a2                	ld	s1,8(sp)
    80200e70:	6105                	addi	sp,sp,32
    80200e72:	8082                	ret

0000000080200e74 <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200e74:	715d                	addi	sp,sp,-80
    80200e76:	e486                	sd	ra,72(sp)
    80200e78:	e0a2                	sd	s0,64(sp)
    80200e7a:	fc26                	sd	s1,56(sp)
    80200e7c:	f84a                	sd	s2,48(sp)
    80200e7e:	f44e                	sd	s3,40(sp)
    80200e80:	f052                	sd	s4,32(sp)
    80200e82:	ec56                	sd	s5,24(sp)
    80200e84:	e85a                	sd	s6,16(sp)
    80200e86:	e45e                	sd	s7,8(sp)
    80200e88:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200e8a:	6785                	lui	a5,0x1
    80200e8c:	17fd                	addi	a5,a5,-1
    80200e8e:	8fed                	and	a5,a5,a1
    80200e90:	e795                	bnez	a5,80200ebc <vmunmap+0x48>
    80200e92:	8a2a                	mv	s4,a0
    80200e94:	84ae                	mv	s1,a1
    80200e96:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200e98:	0632                	slli	a2,a2,0xc
    80200e9a:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200e9e:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200ea0:	6b05                	lui	s6,0x1
    80200ea2:	0735e863          	bltu	a1,s3,80200f12 <vmunmap+0x9e>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200ea6:	60a6                	ld	ra,72(sp)
    80200ea8:	6406                	ld	s0,64(sp)
    80200eaa:	74e2                	ld	s1,56(sp)
    80200eac:	7942                	ld	s2,48(sp)
    80200eae:	79a2                	ld	s3,40(sp)
    80200eb0:	7a02                	ld	s4,32(sp)
    80200eb2:	6ae2                	ld	s5,24(sp)
    80200eb4:	6b42                	ld	s6,16(sp)
    80200eb6:	6ba2                	ld	s7,8(sp)
    80200eb8:	6161                	addi	sp,sp,80
    80200eba:	8082                	ret
    panic("vmunmap: not aligned");
    80200ebc:	00008517          	auipc	a0,0x8
    80200ec0:	56c50513          	addi	a0,a0,1388 # 80209428 <etext+0x428>
    80200ec4:	fffff097          	auipc	ra,0xfffff
    80200ec8:	282080e7          	jalr	642(ra) # 80200146 <panic>
      panic("vmunmap: walk");
    80200ecc:	00008517          	auipc	a0,0x8
    80200ed0:	57450513          	addi	a0,a0,1396 # 80209440 <etext+0x440>
    80200ed4:	fffff097          	auipc	ra,0xfffff
    80200ed8:	272080e7          	jalr	626(ra) # 80200146 <panic>
      panic("vmunmap: not mapped");
    80200edc:	00008517          	auipc	a0,0x8
    80200ee0:	57450513          	addi	a0,a0,1396 # 80209450 <etext+0x450>
    80200ee4:	fffff097          	auipc	ra,0xfffff
    80200ee8:	262080e7          	jalr	610(ra) # 80200146 <panic>
      panic("vmunmap: not a leaf");
    80200eec:	00008517          	auipc	a0,0x8
    80200ef0:	57c50513          	addi	a0,a0,1404 # 80209468 <etext+0x468>
    80200ef4:	fffff097          	auipc	ra,0xfffff
    80200ef8:	252080e7          	jalr	594(ra) # 80200146 <panic>
      uint64 pa = PTE2PA(*pte);
    80200efc:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    80200efe:	0532                	slli	a0,a0,0xc
    80200f00:	fffff097          	auipc	ra,0xfffff
    80200f04:	54e080e7          	jalr	1358(ra) # 8020044e <kfree>
    *pte = 0;
    80200f08:	00093023          	sd	zero,0(s2)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200f0c:	94da                	add	s1,s1,s6
    80200f0e:	f934fce3          	bleu	s3,s1,80200ea6 <vmunmap+0x32>
    if((pte = walk(pagetable, a, 0)) == 0)
    80200f12:	4601                	li	a2,0
    80200f14:	85a6                	mv	a1,s1
    80200f16:	8552                	mv	a0,s4
    80200f18:	00000097          	auipc	ra,0x0
    80200f1c:	c40080e7          	jalr	-960(ra) # 80200b58 <walk>
    80200f20:	892a                	mv	s2,a0
    80200f22:	d54d                	beqz	a0,80200ecc <vmunmap+0x58>
    if((*pte & PTE_V) == 0)
    80200f24:	6108                	ld	a0,0(a0)
    80200f26:	00157793          	andi	a5,a0,1
    80200f2a:	dbcd                	beqz	a5,80200edc <vmunmap+0x68>
    if(PTE_FLAGS(*pte) == PTE_V)
    80200f2c:	3ff57793          	andi	a5,a0,1023
    80200f30:	fb778ee3          	beq	a5,s7,80200eec <vmunmap+0x78>
    if(do_free){
    80200f34:	fc0a8ae3          	beqz	s5,80200f08 <vmunmap+0x94>
    80200f38:	b7d1                	j	80200efc <vmunmap+0x88>

0000000080200f3a <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80200f3a:	1101                	addi	sp,sp,-32
    80200f3c:	ec06                	sd	ra,24(sp)
    80200f3e:	e822                	sd	s0,16(sp)
    80200f40:	e426                	sd	s1,8(sp)
    80200f42:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80200f44:	fffff097          	auipc	ra,0xfffff
    80200f48:	626080e7          	jalr	1574(ra) # 8020056a <kalloc>
    80200f4c:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    80200f4e:	c519                	beqz	a0,80200f5c <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80200f50:	6605                	lui	a2,0x1
    80200f52:	4581                	li	a1,0
    80200f54:	00000097          	auipc	ra,0x0
    80200f58:	820080e7          	jalr	-2016(ra) # 80200774 <memset>
  return pagetable;
}
    80200f5c:	8526                	mv	a0,s1
    80200f5e:	60e2                	ld	ra,24(sp)
    80200f60:	6442                	ld	s0,16(sp)
    80200f62:	64a2                	ld	s1,8(sp)
    80200f64:	6105                	addi	sp,sp,32
    80200f66:	8082                	ret

0000000080200f68 <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80200f68:	7139                	addi	sp,sp,-64
    80200f6a:	fc06                	sd	ra,56(sp)
    80200f6c:	f822                	sd	s0,48(sp)
    80200f6e:	f426                	sd	s1,40(sp)
    80200f70:	f04a                	sd	s2,32(sp)
    80200f72:	ec4e                	sd	s3,24(sp)
    80200f74:	e852                	sd	s4,16(sp)
    80200f76:	e456                	sd	s5,8(sp)
    80200f78:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    80200f7a:	6785                	lui	a5,0x1
    80200f7c:	06f6f363          	bleu	a5,a3,80200fe2 <uvminit+0x7a>
    80200f80:	8aaa                	mv	s5,a0
    80200f82:	8a2e                	mv	s4,a1
    80200f84:	89b2                	mv	s3,a2
    80200f86:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80200f88:	fffff097          	auipc	ra,0xfffff
    80200f8c:	5e2080e7          	jalr	1506(ra) # 8020056a <kalloc>
    80200f90:	84aa                	mv	s1,a0
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);
    80200f92:	6605                	lui	a2,0x1
    80200f94:	4581                	li	a1,0
    80200f96:	fffff097          	auipc	ra,0xfffff
    80200f9a:	7de080e7          	jalr	2014(ra) # 80200774 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80200f9e:	4779                	li	a4,30
    80200fa0:	86a6                	mv	a3,s1
    80200fa2:	6605                	lui	a2,0x1
    80200fa4:	4581                	li	a1,0
    80200fa6:	8556                	mv	a0,s5
    80200fa8:	00000097          	auipc	ra,0x0
    80200fac:	d12080e7          	jalr	-750(ra) # 80200cba <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    80200fb0:	4739                	li	a4,14
    80200fb2:	86a6                	mv	a3,s1
    80200fb4:	6605                	lui	a2,0x1
    80200fb6:	4581                	li	a1,0
    80200fb8:	8552                	mv	a0,s4
    80200fba:	00000097          	auipc	ra,0x0
    80200fbe:	d00080e7          	jalr	-768(ra) # 80200cba <mappages>
  memmove(mem, src, sz);
    80200fc2:	864a                	mv	a2,s2
    80200fc4:	85ce                	mv	a1,s3
    80200fc6:	8526                	mv	a0,s1
    80200fc8:	00000097          	auipc	ra,0x0
    80200fcc:	818080e7          	jalr	-2024(ra) # 802007e0 <memmove>
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
    80200fd0:	70e2                	ld	ra,56(sp)
    80200fd2:	7442                	ld	s0,48(sp)
    80200fd4:	74a2                	ld	s1,40(sp)
    80200fd6:	7902                	ld	s2,32(sp)
    80200fd8:	69e2                	ld	s3,24(sp)
    80200fda:	6a42                	ld	s4,16(sp)
    80200fdc:	6aa2                	ld	s5,8(sp)
    80200fde:	6121                	addi	sp,sp,64
    80200fe0:	8082                	ret
    panic("inituvm: more than a page");
    80200fe2:	00008517          	auipc	a0,0x8
    80200fe6:	49e50513          	addi	a0,a0,1182 # 80209480 <etext+0x480>
    80200fea:	fffff097          	auipc	ra,0xfffff
    80200fee:	15c080e7          	jalr	348(ra) # 80200146 <panic>

0000000080200ff2 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    80200ff2:	7179                	addi	sp,sp,-48
    80200ff4:	f406                	sd	ra,40(sp)
    80200ff6:	f022                	sd	s0,32(sp)
    80200ff8:	ec26                	sd	s1,24(sp)
    80200ffa:	e84a                	sd	s2,16(sp)
    80200ffc:	e44e                	sd	s3,8(sp)
    80200ffe:	e052                	sd	s4,0(sp)
    80201000:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    80201002:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    80201004:	02c6f063          	bleu	a2,a3,80201024 <uvmdealloc+0x32>
    80201008:	8a2a                	mv	s4,a0
    8020100a:	852e                	mv	a0,a1
    8020100c:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    8020100e:	6785                	lui	a5,0x1
    80201010:	17fd                	addi	a5,a5,-1
    80201012:	00f689b3          	add	s3,a3,a5
    80201016:	777d                	lui	a4,0xfffff
    80201018:	00e9f9b3          	and	s3,s3,a4
    8020101c:	963e                	add	a2,a2,a5
    8020101e:	8e79                	and	a2,a2,a4
    80201020:	00c9eb63          	bltu	s3,a2,80201036 <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    80201024:	854a                	mv	a0,s2
    80201026:	70a2                	ld	ra,40(sp)
    80201028:	7402                	ld	s0,32(sp)
    8020102a:	64e2                	ld	s1,24(sp)
    8020102c:	6942                	ld	s2,16(sp)
    8020102e:	69a2                	ld	s3,8(sp)
    80201030:	6a02                	ld	s4,0(sp)
    80201032:	6145                	addi	sp,sp,48
    80201034:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80201036:	413604b3          	sub	s1,a2,s3
    8020103a:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    8020103c:	2481                	sext.w	s1,s1
    8020103e:	4681                	li	a3,0
    80201040:	8626                	mv	a2,s1
    80201042:	85ce                	mv	a1,s3
    80201044:	00000097          	auipc	ra,0x0
    80201048:	e30080e7          	jalr	-464(ra) # 80200e74 <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    8020104c:	4685                	li	a3,1
    8020104e:	8626                	mv	a2,s1
    80201050:	85ce                	mv	a1,s3
    80201052:	8552                	mv	a0,s4
    80201054:	00000097          	auipc	ra,0x0
    80201058:	e20080e7          	jalr	-480(ra) # 80200e74 <vmunmap>
    8020105c:	b7e1                	j	80201024 <uvmdealloc+0x32>

000000008020105e <uvmalloc>:
  if(newsz < oldsz)
    8020105e:	0ec6e763          	bltu	a3,a2,8020114c <uvmalloc+0xee>
{
    80201062:	7139                	addi	sp,sp,-64
    80201064:	fc06                	sd	ra,56(sp)
    80201066:	f822                	sd	s0,48(sp)
    80201068:	f426                	sd	s1,40(sp)
    8020106a:	f04a                	sd	s2,32(sp)
    8020106c:	ec4e                	sd	s3,24(sp)
    8020106e:	e852                	sd	s4,16(sp)
    80201070:	e456                	sd	s5,8(sp)
    80201072:	e05a                	sd	s6,0(sp)
    80201074:	0080                	addi	s0,sp,64
  oldsz = PGROUNDUP(oldsz);
    80201076:	6a05                	lui	s4,0x1
    80201078:	1a7d                	addi	s4,s4,-1
    8020107a:	9652                	add	a2,a2,s4
    8020107c:	7a7d                	lui	s4,0xfffff
    8020107e:	01467a33          	and	s4,a2,s4
  for(a = oldsz; a < newsz; a += PGSIZE){
    80201082:	0cda7763          	bleu	a3,s4,80201150 <uvmalloc+0xf2>
    80201086:	89b6                	mv	s3,a3
    80201088:	8b2e                	mv	s6,a1
    8020108a:	8aaa                	mv	s5,a0
    8020108c:	84d2                	mv	s1,s4
    mem = kalloc();
    8020108e:	fffff097          	auipc	ra,0xfffff
    80201092:	4dc080e7          	jalr	1244(ra) # 8020056a <kalloc>
    80201096:	892a                	mv	s2,a0
    if(mem == NULL){
    80201098:	c129                	beqz	a0,802010da <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    8020109a:	6605                	lui	a2,0x1
    8020109c:	4581                	li	a1,0
    8020109e:	fffff097          	auipc	ra,0xfffff
    802010a2:	6d6080e7          	jalr	1750(ra) # 80200774 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    802010a6:	4779                	li	a4,30
    802010a8:	86ca                	mv	a3,s2
    802010aa:	6605                	lui	a2,0x1
    802010ac:	85a6                	mv	a1,s1
    802010ae:	8556                	mv	a0,s5
    802010b0:	00000097          	auipc	ra,0x0
    802010b4:	c0a080e7          	jalr	-1014(ra) # 80200cba <mappages>
    802010b8:	e521                	bnez	a0,80201100 <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    802010ba:	4739                	li	a4,14
    802010bc:	86ca                	mv	a3,s2
    802010be:	6605                	lui	a2,0x1
    802010c0:	85a6                	mv	a1,s1
    802010c2:	855a                	mv	a0,s6
    802010c4:	00000097          	auipc	ra,0x0
    802010c8:	bf6080e7          	jalr	-1034(ra) # 80200cba <mappages>
    802010cc:	e929                	bnez	a0,8020111e <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    802010ce:	6785                	lui	a5,0x1
    802010d0:	94be                	add	s1,s1,a5
    802010d2:	fb34eee3          	bltu	s1,s3,8020108e <uvmalloc+0x30>
  return newsz;
    802010d6:	854e                	mv	a0,s3
    802010d8:	a811                	j	802010ec <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    802010da:	86d2                	mv	a3,s4
    802010dc:	8626                	mv	a2,s1
    802010de:	85da                	mv	a1,s6
    802010e0:	8556                	mv	a0,s5
    802010e2:	00000097          	auipc	ra,0x0
    802010e6:	f10080e7          	jalr	-240(ra) # 80200ff2 <uvmdealloc>
      return 0;
    802010ea:	4501                	li	a0,0
}
    802010ec:	70e2                	ld	ra,56(sp)
    802010ee:	7442                	ld	s0,48(sp)
    802010f0:	74a2                	ld	s1,40(sp)
    802010f2:	7902                	ld	s2,32(sp)
    802010f4:	69e2                	ld	s3,24(sp)
    802010f6:	6a42                	ld	s4,16(sp)
    802010f8:	6aa2                	ld	s5,8(sp)
    802010fa:	6b02                	ld	s6,0(sp)
    802010fc:	6121                	addi	sp,sp,64
    802010fe:	8082                	ret
      kfree(mem);
    80201100:	854a                	mv	a0,s2
    80201102:	fffff097          	auipc	ra,0xfffff
    80201106:	34c080e7          	jalr	844(ra) # 8020044e <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    8020110a:	86d2                	mv	a3,s4
    8020110c:	8626                	mv	a2,s1
    8020110e:	85da                	mv	a1,s6
    80201110:	8556                	mv	a0,s5
    80201112:	00000097          	auipc	ra,0x0
    80201116:	ee0080e7          	jalr	-288(ra) # 80200ff2 <uvmdealloc>
      return 0;
    8020111a:	4501                	li	a0,0
    8020111c:	bfc1                	j	802010ec <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    8020111e:	414484b3          	sub	s1,s1,s4
    80201122:	80b1                	srli	s1,s1,0xc
    80201124:	2481                	sext.w	s1,s1
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    80201126:	4685                	li	a3,1
    80201128:	0014861b          	addiw	a2,s1,1
    8020112c:	85d2                	mv	a1,s4
    8020112e:	8556                	mv	a0,s5
    80201130:	00000097          	auipc	ra,0x0
    80201134:	d44080e7          	jalr	-700(ra) # 80200e74 <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    80201138:	4681                	li	a3,0
    8020113a:	8626                	mv	a2,s1
    8020113c:	85d2                	mv	a1,s4
    8020113e:	855a                	mv	a0,s6
    80201140:	00000097          	auipc	ra,0x0
    80201144:	d34080e7          	jalr	-716(ra) # 80200e74 <vmunmap>
      return 0;
    80201148:	4501                	li	a0,0
    8020114a:	b74d                	j	802010ec <uvmalloc+0x8e>
    return oldsz;
    8020114c:	8532                	mv	a0,a2
}
    8020114e:	8082                	ret
  return newsz;
    80201150:	8536                	mv	a0,a3
    80201152:	bf69                	j	802010ec <uvmalloc+0x8e>

0000000080201154 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80201154:	7179                	addi	sp,sp,-48
    80201156:	f406                	sd	ra,40(sp)
    80201158:	f022                	sd	s0,32(sp)
    8020115a:	ec26                	sd	s1,24(sp)
    8020115c:	e84a                	sd	s2,16(sp)
    8020115e:	e44e                	sd	s3,8(sp)
    80201160:	e052                	sd	s4,0(sp)
    80201162:	1800                	addi	s0,sp,48
    80201164:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80201166:	84aa                	mv	s1,a0
    80201168:	6905                	lui	s2,0x1
    8020116a:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8020116c:	4985                	li	s3,1
    8020116e:	a821                	j	80201186 <freewalk+0x32>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80201170:	8129                	srli	a0,a0,0xa
      freewalk((pagetable_t)child);
    80201172:	0532                	slli	a0,a0,0xc
    80201174:	00000097          	auipc	ra,0x0
    80201178:	fe0080e7          	jalr	-32(ra) # 80201154 <freewalk>
      pagetable[i] = 0;
    8020117c:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    80201180:	04a1                	addi	s1,s1,8
    80201182:	03248163          	beq	s1,s2,802011a4 <freewalk+0x50>
    pte_t pte = pagetable[i];
    80201186:	6088                	ld	a0,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80201188:	00f57793          	andi	a5,a0,15
    8020118c:	ff3782e3          	beq	a5,s3,80201170 <freewalk+0x1c>
    } else if(pte & PTE_V){
    80201190:	8905                	andi	a0,a0,1
    80201192:	d57d                	beqz	a0,80201180 <freewalk+0x2c>
      panic("freewalk: leaf");
    80201194:	00008517          	auipc	a0,0x8
    80201198:	30c50513          	addi	a0,a0,780 # 802094a0 <etext+0x4a0>
    8020119c:	fffff097          	auipc	ra,0xfffff
    802011a0:	faa080e7          	jalr	-86(ra) # 80200146 <panic>
    }
  }
  kfree((void*)pagetable);
    802011a4:	8552                	mv	a0,s4
    802011a6:	fffff097          	auipc	ra,0xfffff
    802011aa:	2a8080e7          	jalr	680(ra) # 8020044e <kfree>
}
    802011ae:	70a2                	ld	ra,40(sp)
    802011b0:	7402                	ld	s0,32(sp)
    802011b2:	64e2                	ld	s1,24(sp)
    802011b4:	6942                	ld	s2,16(sp)
    802011b6:	69a2                	ld	s3,8(sp)
    802011b8:	6a02                	ld	s4,0(sp)
    802011ba:	6145                	addi	sp,sp,48
    802011bc:	8082                	ret

00000000802011be <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    802011be:	1101                	addi	sp,sp,-32
    802011c0:	ec06                	sd	ra,24(sp)
    802011c2:	e822                	sd	s0,16(sp)
    802011c4:	e426                	sd	s1,8(sp)
    802011c6:	1000                	addi	s0,sp,32
    802011c8:	84aa                	mv	s1,a0
  if(sz > 0)
    802011ca:	e999                	bnez	a1,802011e0 <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    802011cc:	8526                	mv	a0,s1
    802011ce:	00000097          	auipc	ra,0x0
    802011d2:	f86080e7          	jalr	-122(ra) # 80201154 <freewalk>
}
    802011d6:	60e2                	ld	ra,24(sp)
    802011d8:	6442                	ld	s0,16(sp)
    802011da:	64a2                	ld	s1,8(sp)
    802011dc:	6105                	addi	sp,sp,32
    802011de:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    802011e0:	6605                	lui	a2,0x1
    802011e2:	167d                	addi	a2,a2,-1
    802011e4:	962e                	add	a2,a2,a1
    802011e6:	4685                	li	a3,1
    802011e8:	8231                	srli	a2,a2,0xc
    802011ea:	4581                	li	a1,0
    802011ec:	00000097          	auipc	ra,0x0
    802011f0:	c88080e7          	jalr	-888(ra) # 80200e74 <vmunmap>
    802011f4:	bfe1                	j	802011cc <uvmfree+0xe>

00000000802011f6 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    802011f6:	10068563          	beqz	a3,80201300 <uvmcopy+0x10a>
{
    802011fa:	715d                	addi	sp,sp,-80
    802011fc:	e486                	sd	ra,72(sp)
    802011fe:	e0a2                	sd	s0,64(sp)
    80201200:	fc26                	sd	s1,56(sp)
    80201202:	f84a                	sd	s2,48(sp)
    80201204:	f44e                	sd	s3,40(sp)
    80201206:	f052                	sd	s4,32(sp)
    80201208:	ec56                	sd	s5,24(sp)
    8020120a:	e85a                	sd	s6,16(sp)
    8020120c:	e45e                	sd	s7,8(sp)
    8020120e:	e062                	sd	s8,0(sp)
    80201210:	0880                	addi	s0,sp,80
    80201212:	8b36                	mv	s6,a3
    80201214:	8bb2                	mv	s7,a2
    80201216:	8aae                	mv	s5,a1
    80201218:	8c2a                	mv	s8,a0
  uint64 pa, i = 0, ki = 0;
    8020121a:	4901                	li	s2,0
    8020121c:	a011                	j	80201220 <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    8020121e:	8952                	mv	s2,s4
    if((pte = walk(old, i, 0)) == NULL)
    80201220:	4601                	li	a2,0
    80201222:	85ca                	mv	a1,s2
    80201224:	8562                	mv	a0,s8
    80201226:	00000097          	auipc	ra,0x0
    8020122a:	932080e7          	jalr	-1742(ra) # 80200b58 <walk>
    8020122e:	c135                	beqz	a0,80201292 <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    80201230:	6118                	ld	a4,0(a0)
    80201232:	00177793          	andi	a5,a4,1
    80201236:	c7b5                	beqz	a5,802012a2 <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    80201238:	00a75593          	srli	a1,a4,0xa
    8020123c:	00c59a13          	slli	s4,a1,0xc
    flags = PTE_FLAGS(*pte);
    80201240:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    80201244:	fffff097          	auipc	ra,0xfffff
    80201248:	326080e7          	jalr	806(ra) # 8020056a <kalloc>
    8020124c:	89aa                	mv	s3,a0
    8020124e:	c92d                	beqz	a0,802012c0 <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    80201250:	6605                	lui	a2,0x1
    80201252:	85d2                	mv	a1,s4
    80201254:	fffff097          	auipc	ra,0xfffff
    80201258:	58c080e7          	jalr	1420(ra) # 802007e0 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    8020125c:	2481                	sext.w	s1,s1
    8020125e:	8726                	mv	a4,s1
    80201260:	86ce                	mv	a3,s3
    80201262:	6605                	lui	a2,0x1
    80201264:	85ca                	mv	a1,s2
    80201266:	8556                	mv	a0,s5
    80201268:	00000097          	auipc	ra,0x0
    8020126c:	a52080e7          	jalr	-1454(ra) # 80200cba <mappages>
    80201270:	e129                	bnez	a0,802012b2 <uvmcopy+0xbc>
    i += PGSIZE;
    80201272:	6a05                	lui	s4,0x1
    80201274:	9a4a                	add	s4,s4,s2
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    80201276:	3ef4f713          	andi	a4,s1,1007
    8020127a:	86ce                	mv	a3,s3
    8020127c:	6605                	lui	a2,0x1
    8020127e:	85ca                	mv	a1,s2
    80201280:	855e                	mv	a0,s7
    80201282:	00000097          	auipc	ra,0x0
    80201286:	a38080e7          	jalr	-1480(ra) # 80200cba <mappages>
    8020128a:	ed05                	bnez	a0,802012c2 <uvmcopy+0xcc>
  while (i < sz){
    8020128c:	f96a69e3          	bltu	s4,s6,8020121e <uvmcopy+0x28>
    80201290:	a8a1                	j	802012e8 <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    80201292:	00008517          	auipc	a0,0x8
    80201296:	21e50513          	addi	a0,a0,542 # 802094b0 <etext+0x4b0>
    8020129a:	fffff097          	auipc	ra,0xfffff
    8020129e:	eac080e7          	jalr	-340(ra) # 80200146 <panic>
      panic("uvmcopy: page not present");
    802012a2:	00008517          	auipc	a0,0x8
    802012a6:	22e50513          	addi	a0,a0,558 # 802094d0 <etext+0x4d0>
    802012aa:	fffff097          	auipc	ra,0xfffff
    802012ae:	e9c080e7          	jalr	-356(ra) # 80200146 <panic>
      kfree(mem);
    802012b2:	854e                	mv	a0,s3
    802012b4:	fffff097          	auipc	ra,0xfffff
    802012b8:	19a080e7          	jalr	410(ra) # 8020044e <kfree>
      goto err;
    802012bc:	8a4a                	mv	s4,s2
    802012be:	a011                	j	802012c2 <uvmcopy+0xcc>
    802012c0:	8a4a                	mv	s4,s2
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    802012c2:	4681                	li	a3,0
    802012c4:	00c95613          	srli	a2,s2,0xc
    802012c8:	4581                	li	a1,0
    802012ca:	855e                	mv	a0,s7
    802012cc:	00000097          	auipc	ra,0x0
    802012d0:	ba8080e7          	jalr	-1112(ra) # 80200e74 <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    802012d4:	4685                	li	a3,1
    802012d6:	00ca5613          	srli	a2,s4,0xc
    802012da:	4581                	li	a1,0
    802012dc:	8556                	mv	a0,s5
    802012de:	00000097          	auipc	ra,0x0
    802012e2:	b96080e7          	jalr	-1130(ra) # 80200e74 <vmunmap>
  return -1;
    802012e6:	557d                	li	a0,-1
}
    802012e8:	60a6                	ld	ra,72(sp)
    802012ea:	6406                	ld	s0,64(sp)
    802012ec:	74e2                	ld	s1,56(sp)
    802012ee:	7942                	ld	s2,48(sp)
    802012f0:	79a2                	ld	s3,40(sp)
    802012f2:	7a02                	ld	s4,32(sp)
    802012f4:	6ae2                	ld	s5,24(sp)
    802012f6:	6b42                	ld	s6,16(sp)
    802012f8:	6ba2                	ld	s7,8(sp)
    802012fa:	6c02                	ld	s8,0(sp)
    802012fc:	6161                	addi	sp,sp,80
    802012fe:	8082                	ret
  return 0;
    80201300:	4501                	li	a0,0
}
    80201302:	8082                	ret

0000000080201304 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80201304:	1141                	addi	sp,sp,-16
    80201306:	e406                	sd	ra,8(sp)
    80201308:	e022                	sd	s0,0(sp)
    8020130a:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8020130c:	4601                	li	a2,0
    8020130e:	00000097          	auipc	ra,0x0
    80201312:	84a080e7          	jalr	-1974(ra) # 80200b58 <walk>
  if(pte == NULL)
    80201316:	c901                	beqz	a0,80201326 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    80201318:	611c                	ld	a5,0(a0)
    8020131a:	9bbd                	andi	a5,a5,-17
    8020131c:	e11c                	sd	a5,0(a0)
}
    8020131e:	60a2                	ld	ra,8(sp)
    80201320:	6402                	ld	s0,0(sp)
    80201322:	0141                	addi	sp,sp,16
    80201324:	8082                	ret
    panic("uvmclear");
    80201326:	00008517          	auipc	a0,0x8
    8020132a:	1ca50513          	addi	a0,a0,458 # 802094f0 <etext+0x4f0>
    8020132e:	fffff097          	auipc	ra,0xfffff
    80201332:	e18080e7          	jalr	-488(ra) # 80200146 <panic>

0000000080201336 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201336:	c6bd                	beqz	a3,802013a4 <copyout+0x6e>
{
    80201338:	715d                	addi	sp,sp,-80
    8020133a:	e486                	sd	ra,72(sp)
    8020133c:	e0a2                	sd	s0,64(sp)
    8020133e:	fc26                	sd	s1,56(sp)
    80201340:	f84a                	sd	s2,48(sp)
    80201342:	f44e                	sd	s3,40(sp)
    80201344:	f052                	sd	s4,32(sp)
    80201346:	ec56                	sd	s5,24(sp)
    80201348:	e85a                	sd	s6,16(sp)
    8020134a:	e45e                	sd	s7,8(sp)
    8020134c:	e062                	sd	s8,0(sp)
    8020134e:	0880                	addi	s0,sp,80
    80201350:	8baa                	mv	s7,a0
    80201352:	8a2e                	mv	s4,a1
    80201354:	8ab2                	mv	s5,a2
    80201356:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    80201358:	7c7d                	lui	s8,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    8020135a:	6b05                	lui	s6,0x1
    8020135c:	a015                	j	80201380 <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8020135e:	9552                	add	a0,a0,s4
    80201360:	0004861b          	sext.w	a2,s1
    80201364:	85d6                	mv	a1,s5
    80201366:	41250533          	sub	a0,a0,s2
    8020136a:	fffff097          	auipc	ra,0xfffff
    8020136e:	476080e7          	jalr	1142(ra) # 802007e0 <memmove>

    len -= n;
    80201372:	409989b3          	sub	s3,s3,s1
    src += n;
    80201376:	9aa6                	add	s5,s5,s1
    dstva = va0 + PGSIZE;
    80201378:	01690a33          	add	s4,s2,s6
  while(len > 0){
    8020137c:	02098263          	beqz	s3,802013a0 <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    80201380:	018a7933          	and	s2,s4,s8
    pa0 = walkaddr(pagetable, va0);
    80201384:	85ca                	mv	a1,s2
    80201386:	855e                	mv	a0,s7
    80201388:	00000097          	auipc	ra,0x0
    8020138c:	876080e7          	jalr	-1930(ra) # 80200bfe <walkaddr>
    if(pa0 == NULL)
    80201390:	cd01                	beqz	a0,802013a8 <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    80201392:	414904b3          	sub	s1,s2,s4
    80201396:	94da                	add	s1,s1,s6
    if(n > len)
    80201398:	fc99f3e3          	bleu	s1,s3,8020135e <copyout+0x28>
    8020139c:	84ce                	mv	s1,s3
    8020139e:	b7c1                	j	8020135e <copyout+0x28>
  }
  return 0;
    802013a0:	4501                	li	a0,0
    802013a2:	a021                	j	802013aa <copyout+0x74>
    802013a4:	4501                	li	a0,0
}
    802013a6:	8082                	ret
      return -1;
    802013a8:	557d                	li	a0,-1
}
    802013aa:	60a6                	ld	ra,72(sp)
    802013ac:	6406                	ld	s0,64(sp)
    802013ae:	74e2                	ld	s1,56(sp)
    802013b0:	7942                	ld	s2,48(sp)
    802013b2:	79a2                	ld	s3,40(sp)
    802013b4:	7a02                	ld	s4,32(sp)
    802013b6:	6ae2                	ld	s5,24(sp)
    802013b8:	6b42                	ld	s6,16(sp)
    802013ba:	6ba2                	ld	s7,8(sp)
    802013bc:	6c02                	ld	s8,0(sp)
    802013be:	6161                	addi	sp,sp,80
    802013c0:	8082                	ret

00000000802013c2 <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    802013c2:	7179                	addi	sp,sp,-48
    802013c4:	f406                	sd	ra,40(sp)
    802013c6:	f022                	sd	s0,32(sp)
    802013c8:	ec26                	sd	s1,24(sp)
    802013ca:	e84a                	sd	s2,16(sp)
    802013cc:	e44e                	sd	s3,8(sp)
    802013ce:	1800                	addi	s0,sp,48
    802013d0:	84aa                	mv	s1,a0
    802013d2:	89ae                	mv	s3,a1
    802013d4:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802013d6:	00000097          	auipc	ra,0x0
    802013da:	6ea080e7          	jalr	1770(ra) # 80201ac0 <myproc>
    802013de:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    802013e0:	01248733          	add	a4,s1,s2
    802013e4:	02e7e463          	bltu	a5,a4,8020140c <copyout2+0x4a>
    802013e8:	02f4f463          	bleu	a5,s1,80201410 <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    802013ec:	0009061b          	sext.w	a2,s2
    802013f0:	85ce                	mv	a1,s3
    802013f2:	8526                	mv	a0,s1
    802013f4:	fffff097          	auipc	ra,0xfffff
    802013f8:	3ec080e7          	jalr	1004(ra) # 802007e0 <memmove>
  return 0;
    802013fc:	4501                	li	a0,0
}
    802013fe:	70a2                	ld	ra,40(sp)
    80201400:	7402                	ld	s0,32(sp)
    80201402:	64e2                	ld	s1,24(sp)
    80201404:	6942                	ld	s2,16(sp)
    80201406:	69a2                	ld	s3,8(sp)
    80201408:	6145                	addi	sp,sp,48
    8020140a:	8082                	ret
    return -1;
    8020140c:	557d                	li	a0,-1
    8020140e:	bfc5                	j	802013fe <copyout2+0x3c>
    80201410:	557d                	li	a0,-1
    80201412:	b7f5                	j	802013fe <copyout2+0x3c>

0000000080201414 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201414:	caa5                	beqz	a3,80201484 <copyin+0x70>
{
    80201416:	715d                	addi	sp,sp,-80
    80201418:	e486                	sd	ra,72(sp)
    8020141a:	e0a2                	sd	s0,64(sp)
    8020141c:	fc26                	sd	s1,56(sp)
    8020141e:	f84a                	sd	s2,48(sp)
    80201420:	f44e                	sd	s3,40(sp)
    80201422:	f052                	sd	s4,32(sp)
    80201424:	ec56                	sd	s5,24(sp)
    80201426:	e85a                	sd	s6,16(sp)
    80201428:	e45e                	sd	s7,8(sp)
    8020142a:	e062                	sd	s8,0(sp)
    8020142c:	0880                	addi	s0,sp,80
    8020142e:	8baa                	mv	s7,a0
    80201430:	8aae                	mv	s5,a1
    80201432:	8a32                	mv	s4,a2
    80201434:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    80201436:	7c7d                	lui	s8,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201438:	6b05                	lui	s6,0x1
    8020143a:	a01d                	j	80201460 <copyin+0x4c>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8020143c:	014505b3          	add	a1,a0,s4
    80201440:	0004861b          	sext.w	a2,s1
    80201444:	412585b3          	sub	a1,a1,s2
    80201448:	8556                	mv	a0,s5
    8020144a:	fffff097          	auipc	ra,0xfffff
    8020144e:	396080e7          	jalr	918(ra) # 802007e0 <memmove>

    len -= n;
    80201452:	409989b3          	sub	s3,s3,s1
    dst += n;
    80201456:	9aa6                	add	s5,s5,s1
    srcva = va0 + PGSIZE;
    80201458:	01690a33          	add	s4,s2,s6
  while(len > 0){
    8020145c:	02098263          	beqz	s3,80201480 <copyin+0x6c>
    va0 = PGROUNDDOWN(srcva);
    80201460:	018a7933          	and	s2,s4,s8
    pa0 = walkaddr(pagetable, va0);
    80201464:	85ca                	mv	a1,s2
    80201466:	855e                	mv	a0,s7
    80201468:	fffff097          	auipc	ra,0xfffff
    8020146c:	796080e7          	jalr	1942(ra) # 80200bfe <walkaddr>
    if(pa0 == NULL)
    80201470:	cd01                	beqz	a0,80201488 <copyin+0x74>
    n = PGSIZE - (srcva - va0);
    80201472:	414904b3          	sub	s1,s2,s4
    80201476:	94da                	add	s1,s1,s6
    if(n > len)
    80201478:	fc99f2e3          	bleu	s1,s3,8020143c <copyin+0x28>
    8020147c:	84ce                	mv	s1,s3
    8020147e:	bf7d                	j	8020143c <copyin+0x28>
  }
  return 0;
    80201480:	4501                	li	a0,0
    80201482:	a021                	j	8020148a <copyin+0x76>
    80201484:	4501                	li	a0,0
}
    80201486:	8082                	ret
      return -1;
    80201488:	557d                	li	a0,-1
}
    8020148a:	60a6                	ld	ra,72(sp)
    8020148c:	6406                	ld	s0,64(sp)
    8020148e:	74e2                	ld	s1,56(sp)
    80201490:	7942                	ld	s2,48(sp)
    80201492:	79a2                	ld	s3,40(sp)
    80201494:	7a02                	ld	s4,32(sp)
    80201496:	6ae2                	ld	s5,24(sp)
    80201498:	6b42                	ld	s6,16(sp)
    8020149a:	6ba2                	ld	s7,8(sp)
    8020149c:	6c02                	ld	s8,0(sp)
    8020149e:	6161                	addi	sp,sp,80
    802014a0:	8082                	ret

00000000802014a2 <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    802014a2:	7179                	addi	sp,sp,-48
    802014a4:	f406                	sd	ra,40(sp)
    802014a6:	f022                	sd	s0,32(sp)
    802014a8:	ec26                	sd	s1,24(sp)
    802014aa:	e84a                	sd	s2,16(sp)
    802014ac:	e44e                	sd	s3,8(sp)
    802014ae:	1800                	addi	s0,sp,48
    802014b0:	89aa                	mv	s3,a0
    802014b2:	84ae                	mv	s1,a1
    802014b4:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802014b6:	00000097          	auipc	ra,0x0
    802014ba:	60a080e7          	jalr	1546(ra) # 80201ac0 <myproc>
    802014be:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    802014c0:	01248733          	add	a4,s1,s2
    802014c4:	02e7e463          	bltu	a5,a4,802014ec <copyin2+0x4a>
    802014c8:	02f4f463          	bleu	a5,s1,802014f0 <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    802014cc:	0009061b          	sext.w	a2,s2
    802014d0:	85a6                	mv	a1,s1
    802014d2:	854e                	mv	a0,s3
    802014d4:	fffff097          	auipc	ra,0xfffff
    802014d8:	30c080e7          	jalr	780(ra) # 802007e0 <memmove>
  return 0;
    802014dc:	4501                	li	a0,0
}
    802014de:	70a2                	ld	ra,40(sp)
    802014e0:	7402                	ld	s0,32(sp)
    802014e2:	64e2                	ld	s1,24(sp)
    802014e4:	6942                	ld	s2,16(sp)
    802014e6:	69a2                	ld	s3,8(sp)
    802014e8:	6145                	addi	sp,sp,48
    802014ea:	8082                	ret
    return -1;
    802014ec:	557d                	li	a0,-1
    802014ee:	bfc5                	j	802014de <copyin2+0x3c>
    802014f0:	557d                	li	a0,-1
    802014f2:	b7f5                	j	802014de <copyin2+0x3c>

00000000802014f4 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    802014f4:	ced5                	beqz	a3,802015b0 <copyinstr+0xbc>
{
    802014f6:	715d                	addi	sp,sp,-80
    802014f8:	e486                	sd	ra,72(sp)
    802014fa:	e0a2                	sd	s0,64(sp)
    802014fc:	fc26                	sd	s1,56(sp)
    802014fe:	f84a                	sd	s2,48(sp)
    80201500:	f44e                	sd	s3,40(sp)
    80201502:	f052                	sd	s4,32(sp)
    80201504:	ec56                	sd	s5,24(sp)
    80201506:	e85a                	sd	s6,16(sp)
    80201508:	e45e                	sd	s7,8(sp)
    8020150a:	e062                	sd	s8,0(sp)
    8020150c:	0880                	addi	s0,sp,80
    8020150e:	8aaa                	mv	s5,a0
    80201510:	84ae                	mv	s1,a1
    80201512:	8c32                	mv	s8,a2
    80201514:	8bb6                	mv	s7,a3
    va0 = PGROUNDDOWN(srcva);
    80201516:	7a7d                	lui	s4,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201518:	6985                	lui	s3,0x1
    8020151a:	4b05                	li	s6,1
    8020151c:	a801                	j	8020152c <copyinstr+0x38>
    if(n > max)
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
    8020151e:	87a6                	mv	a5,s1
    80201520:	a085                	j	80201580 <copyinstr+0x8c>
        *dst = *p;
      }
      --n;
      --max;
      p++;
      dst++;
    80201522:	84b2                	mv	s1,a2
    }

    srcva = va0 + PGSIZE;
    80201524:	01390c33          	add	s8,s2,s3
  while(got_null == 0 && max > 0){
    80201528:	080b8063          	beqz	s7,802015a8 <copyinstr+0xb4>
    va0 = PGROUNDDOWN(srcva);
    8020152c:	014c7933          	and	s2,s8,s4
    pa0 = walkaddr(pagetable, va0);
    80201530:	85ca                	mv	a1,s2
    80201532:	8556                	mv	a0,s5
    80201534:	fffff097          	auipc	ra,0xfffff
    80201538:	6ca080e7          	jalr	1738(ra) # 80200bfe <walkaddr>
    if(pa0 == NULL)
    8020153c:	c925                	beqz	a0,802015ac <copyinstr+0xb8>
    n = PGSIZE - (srcva - va0);
    8020153e:	41890633          	sub	a2,s2,s8
    80201542:	964e                	add	a2,a2,s3
    if(n > max)
    80201544:	00cbf363          	bleu	a2,s7,8020154a <copyinstr+0x56>
    80201548:	865e                	mv	a2,s7
    char *p = (char *) (pa0 + (srcva - va0));
    8020154a:	9562                	add	a0,a0,s8
    8020154c:	41250533          	sub	a0,a0,s2
    while(n > 0){
    80201550:	da71                	beqz	a2,80201524 <copyinstr+0x30>
      if(*p == '\0'){
    80201552:	00054703          	lbu	a4,0(a0)
    80201556:	d761                	beqz	a4,8020151e <copyinstr+0x2a>
    80201558:	9626                	add	a2,a2,s1
    8020155a:	87a6                	mv	a5,s1
    8020155c:	1bfd                	addi	s7,s7,-1
    8020155e:	009b86b3          	add	a3,s7,s1
    80201562:	409b04b3          	sub	s1,s6,s1
    80201566:	94aa                	add	s1,s1,a0
        *dst = *p;
    80201568:	00e78023          	sb	a4,0(a5) # 1000 <BASE_ADDRESS-0x801ff000>
      --max;
    8020156c:	40f68bb3          	sub	s7,a3,a5
      p++;
    80201570:	00f48733          	add	a4,s1,a5
      dst++;
    80201574:	0785                	addi	a5,a5,1
    while(n > 0){
    80201576:	faf606e3          	beq	a2,a5,80201522 <copyinstr+0x2e>
      if(*p == '\0'){
    8020157a:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdda000>
    8020157e:	f76d                	bnez	a4,80201568 <copyinstr+0x74>
        *dst = '\0';
    80201580:	00078023          	sb	zero,0(a5)
    80201584:	4785                	li	a5,1
  }
  if(got_null){
    80201586:	0017b513          	seqz	a0,a5
    8020158a:	40a0053b          	negw	a0,a0
    8020158e:	2501                	sext.w	a0,a0
    return 0;
  } else {
    return -1;
  }
}
    80201590:	60a6                	ld	ra,72(sp)
    80201592:	6406                	ld	s0,64(sp)
    80201594:	74e2                	ld	s1,56(sp)
    80201596:	7942                	ld	s2,48(sp)
    80201598:	79a2                	ld	s3,40(sp)
    8020159a:	7a02                	ld	s4,32(sp)
    8020159c:	6ae2                	ld	s5,24(sp)
    8020159e:	6b42                	ld	s6,16(sp)
    802015a0:	6ba2                	ld	s7,8(sp)
    802015a2:	6c02                	ld	s8,0(sp)
    802015a4:	6161                	addi	sp,sp,80
    802015a6:	8082                	ret
    802015a8:	4781                	li	a5,0
    802015aa:	bff1                	j	80201586 <copyinstr+0x92>
      return -1;
    802015ac:	557d                	li	a0,-1
    802015ae:	b7cd                	j	80201590 <copyinstr+0x9c>
  int got_null = 0;
    802015b0:	4781                	li	a5,0
  if(got_null){
    802015b2:	0017b513          	seqz	a0,a5
    802015b6:	40a0053b          	negw	a0,a0
    802015ba:	2501                	sext.w	a0,a0
}
    802015bc:	8082                	ret

00000000802015be <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    802015be:	7179                	addi	sp,sp,-48
    802015c0:	f406                	sd	ra,40(sp)
    802015c2:	f022                	sd	s0,32(sp)
    802015c4:	ec26                	sd	s1,24(sp)
    802015c6:	e84a                	sd	s2,16(sp)
    802015c8:	e44e                	sd	s3,8(sp)
    802015ca:	1800                	addi	s0,sp,48
    802015cc:	89aa                	mv	s3,a0
    802015ce:	84ae                	mv	s1,a1
    802015d0:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    802015d2:	00000097          	auipc	ra,0x0
    802015d6:	4ee080e7          	jalr	1262(ra) # 80201ac0 <myproc>
    802015da:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    802015dc:	04d4f863          	bleu	a3,s1,8020162c <copyinstr2+0x6e>
    802015e0:	04090863          	beqz	s2,80201630 <copyinstr2+0x72>
    char *p = (char *)srcva;
    if(*p == '\0'){
    802015e4:	0004c703          	lbu	a4,0(s1)
    802015e8:	cf15                	beqz	a4,80201624 <copyinstr2+0x66>
    802015ea:	8e85                	sub	a3,a3,s1
    802015ec:	96ce                	add	a3,a3,s3
    802015ee:	01298633          	add	a2,s3,s2
    802015f2:	87ce                	mv	a5,s3
    802015f4:	413485b3          	sub	a1,s1,s3
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    802015f8:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    802015fc:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    802015fe:	02f68b63          	beq	a3,a5,80201634 <copyinstr2+0x76>
    80201602:	02c78363          	beq	a5,a2,80201628 <copyinstr2+0x6a>
    if(*p == '\0'){
    80201606:	00b78733          	add	a4,a5,a1
    8020160a:	00074703          	lbu	a4,0(a4)
    8020160e:	f76d                	bnez	a4,802015f8 <copyinstr2+0x3a>
      *dst = '\0';
    80201610:	00078023          	sb	zero,0(a5)
  }
  if(got_null){
    return 0;
    80201614:	4501                	li	a0,0
  } else {
    return -1;
  }
}
    80201616:	70a2                	ld	ra,40(sp)
    80201618:	7402                	ld	s0,32(sp)
    8020161a:	64e2                	ld	s1,24(sp)
    8020161c:	6942                	ld	s2,16(sp)
    8020161e:	69a2                	ld	s3,8(sp)
    80201620:	6145                	addi	sp,sp,48
    80201622:	8082                	ret
    if(*p == '\0'){
    80201624:	87ce                	mv	a5,s3
    80201626:	b7ed                	j	80201610 <copyinstr2+0x52>
    return -1;
    80201628:	557d                	li	a0,-1
    8020162a:	b7f5                	j	80201616 <copyinstr2+0x58>
    8020162c:	557d                	li	a0,-1
    8020162e:	b7e5                	j	80201616 <copyinstr2+0x58>
    80201630:	557d                	li	a0,-1
    80201632:	b7d5                	j	80201616 <copyinstr2+0x58>
    80201634:	557d                	li	a0,-1
    80201636:	b7c5                	j	80201616 <copyinstr2+0x58>

0000000080201638 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    80201638:	7179                	addi	sp,sp,-48
    8020163a:	f406                	sd	ra,40(sp)
    8020163c:	f022                	sd	s0,32(sp)
    8020163e:	ec26                	sd	s1,24(sp)
    80201640:	e84a                	sd	s2,16(sp)
    80201642:	e44e                	sd	s3,8(sp)
    80201644:	e052                	sd	s4,0(sp)
    80201646:	1800                	addi	s0,sp,48
    80201648:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    8020164a:	84aa                	mv	s1,a0
    8020164c:	6905                	lui	s2,0x1
    8020164e:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201650:	4985                	li	s3,1
    80201652:	a821                	j	8020166a <kfreewalk+0x32>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201654:	8129                	srli	a0,a0,0xa
    80201656:	0532                	slli	a0,a0,0xc
    80201658:	00000097          	auipc	ra,0x0
    8020165c:	fe0080e7          	jalr	-32(ra) # 80201638 <kfreewalk>
      kpt[i] = 0;
    80201660:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    80201664:	04a1                	addi	s1,s1,8
    80201666:	01248963          	beq	s1,s2,80201678 <kfreewalk+0x40>
    pte_t pte = kpt[i];
    8020166a:	6088                	ld	a0,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    8020166c:	00f57793          	andi	a5,a0,15
    80201670:	ff3782e3          	beq	a5,s3,80201654 <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    80201674:	8905                	andi	a0,a0,1
    80201676:	d57d                	beqz	a0,80201664 <kfreewalk+0x2c>
      break;
    }
  }
  kfree((void *) kpt);
    80201678:	8552                	mv	a0,s4
    8020167a:	fffff097          	auipc	ra,0xfffff
    8020167e:	dd4080e7          	jalr	-556(ra) # 8020044e <kfree>
}
    80201682:	70a2                	ld	ra,40(sp)
    80201684:	7402                	ld	s0,32(sp)
    80201686:	64e2                	ld	s1,24(sp)
    80201688:	6942                	ld	s2,16(sp)
    8020168a:	69a2                	ld	s3,8(sp)
    8020168c:	6a02                	ld	s4,0(sp)
    8020168e:	6145                	addi	sp,sp,48
    80201690:	8082                	ret

0000000080201692 <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    80201692:	1101                	addi	sp,sp,-32
    80201694:	ec06                	sd	ra,24(sp)
    80201696:	e822                	sd	s0,16(sp)
    80201698:	e426                	sd	s1,8(sp)
    8020169a:	1000                	addi	s0,sp,32
    8020169c:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    8020169e:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016a0:	00f57713          	andi	a4,a0,15
    802016a4:	4785                	li	a5,1
    802016a6:	00f70d63          	beq	a4,a5,802016c0 <kvmfreeusr+0x2e>
    pte = kpt[i];
    802016aa:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016ac:	00f57713          	andi	a4,a0,15
    802016b0:	4785                	li	a5,1
    802016b2:	02f70063          	beq	a4,a5,802016d2 <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    802016b6:	60e2                	ld	ra,24(sp)
    802016b8:	6442                	ld	s0,16(sp)
    802016ba:	64a2                	ld	s1,8(sp)
    802016bc:	6105                	addi	sp,sp,32
    802016be:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016c0:	8129                	srli	a0,a0,0xa
    802016c2:	0532                	slli	a0,a0,0xc
    802016c4:	00000097          	auipc	ra,0x0
    802016c8:	f74080e7          	jalr	-140(ra) # 80201638 <kfreewalk>
      kpt[i] = 0;
    802016cc:	0004b023          	sd	zero,0(s1)
    802016d0:	bfe9                	j	802016aa <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016d2:	8129                	srli	a0,a0,0xa
    802016d4:	0532                	slli	a0,a0,0xc
    802016d6:	00000097          	auipc	ra,0x0
    802016da:	f62080e7          	jalr	-158(ra) # 80201638 <kfreewalk>
      kpt[i] = 0;
    802016de:	0004b423          	sd	zero,8(s1)
}
    802016e2:	bfd1                	j	802016b6 <kvmfreeusr+0x24>

00000000802016e4 <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    802016e4:	1101                	addi	sp,sp,-32
    802016e6:	ec06                	sd	ra,24(sp)
    802016e8:	e822                	sd	s0,16(sp)
    802016ea:	e426                	sd	s1,8(sp)
    802016ec:	1000                	addi	s0,sp,32
    802016ee:	84aa                	mv	s1,a0
  if (stack_free) {
    802016f0:	e185                	bnez	a1,80201710 <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    802016f2:	8526                	mv	a0,s1
    802016f4:	00000097          	auipc	ra,0x0
    802016f8:	f9e080e7          	jalr	-98(ra) # 80201692 <kvmfreeusr>
  kfree(kpt);
    802016fc:	8526                	mv	a0,s1
    802016fe:	fffff097          	auipc	ra,0xfffff
    80201702:	d50080e7          	jalr	-688(ra) # 8020044e <kfree>
}
    80201706:	60e2                	ld	ra,24(sp)
    80201708:	6442                	ld	s0,16(sp)
    8020170a:	64a2                	ld	s1,8(sp)
    8020170c:	6105                	addi	sp,sp,32
    8020170e:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    80201710:	4685                	li	a3,1
    80201712:	4605                	li	a2,1
    80201714:	0fb00593          	li	a1,251
    80201718:	05fa                	slli	a1,a1,0x1e
    8020171a:	fffff097          	auipc	ra,0xfffff
    8020171e:	75a080e7          	jalr	1882(ra) # 80200e74 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    80201722:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201726:	00f57713          	andi	a4,a0,15
    8020172a:	4785                	li	a5,1
    8020172c:	fcf713e3          	bne	a4,a5,802016f2 <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    80201730:	8129                	srli	a0,a0,0xa
    80201732:	0532                	slli	a0,a0,0xc
    80201734:	00000097          	auipc	ra,0x0
    80201738:	f04080e7          	jalr	-252(ra) # 80201638 <kfreewalk>
    8020173c:	bf5d                	j	802016f2 <kvmfree+0xe>

000000008020173e <proc_kpagetable>:
{
    8020173e:	1101                	addi	sp,sp,-32
    80201740:	ec06                	sd	ra,24(sp)
    80201742:	e822                	sd	s0,16(sp)
    80201744:	e426                	sd	s1,8(sp)
    80201746:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    80201748:	fffff097          	auipc	ra,0xfffff
    8020174c:	e22080e7          	jalr	-478(ra) # 8020056a <kalloc>
    80201750:	84aa                	mv	s1,a0
  if (kpt == NULL)
    80201752:	cd05                	beqz	a0,8020178a <proc_kpagetable+0x4c>
  memmove(kpt, kernel_pagetable, PGSIZE);
    80201754:	6605                	lui	a2,0x1
    80201756:	00012797          	auipc	a5,0x12
    8020175a:	90278793          	addi	a5,a5,-1790 # 80213058 <kernel_pagetable>
    8020175e:	638c                	ld	a1,0(a5)
    80201760:	fffff097          	auipc	ra,0xfffff
    80201764:	080080e7          	jalr	128(ra) # 802007e0 <memmove>
  char *pstack = kalloc();
    80201768:	fffff097          	auipc	ra,0xfffff
    8020176c:	e02080e7          	jalr	-510(ra) # 8020056a <kalloc>
  if(pstack == NULL)
    80201770:	c11d                	beqz	a0,80201796 <proc_kpagetable+0x58>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    80201772:	4719                	li	a4,6
    80201774:	86aa                	mv	a3,a0
    80201776:	6605                	lui	a2,0x1
    80201778:	0fb00593          	li	a1,251
    8020177c:	05fa                	slli	a1,a1,0x1e
    8020177e:	8526                	mv	a0,s1
    80201780:	fffff097          	auipc	ra,0xfffff
    80201784:	53a080e7          	jalr	1338(ra) # 80200cba <mappages>
    80201788:	e519                	bnez	a0,80201796 <proc_kpagetable+0x58>
}
    8020178a:	8526                	mv	a0,s1
    8020178c:	60e2                	ld	ra,24(sp)
    8020178e:	6442                	ld	s0,16(sp)
    80201790:	64a2                	ld	s1,8(sp)
    80201792:	6105                	addi	sp,sp,32
    80201794:	8082                	ret
  kvmfree(kpt, 1);
    80201796:	4585                	li	a1,1
    80201798:	8526                	mv	a0,s1
    8020179a:	00000097          	auipc	ra,0x0
    8020179e:	f4a080e7          	jalr	-182(ra) # 802016e4 <kvmfree>
  return NULL;
    802017a2:	4481                	li	s1,0
    802017a4:	b7dd                	j	8020178a <proc_kpagetable+0x4c>

00000000802017a6 <vmprint>:

void vmprint(pagetable_t pagetable)
{
    802017a6:	7119                	addi	sp,sp,-128
    802017a8:	fc86                	sd	ra,120(sp)
    802017aa:	f8a2                	sd	s0,112(sp)
    802017ac:	f4a6                	sd	s1,104(sp)
    802017ae:	f0ca                	sd	s2,96(sp)
    802017b0:	ecce                	sd	s3,88(sp)
    802017b2:	e8d2                	sd	s4,80(sp)
    802017b4:	e4d6                	sd	s5,72(sp)
    802017b6:	e0da                	sd	s6,64(sp)
    802017b8:	fc5e                	sd	s7,56(sp)
    802017ba:	f862                	sd	s8,48(sp)
    802017bc:	f466                	sd	s9,40(sp)
    802017be:	f06a                	sd	s10,32(sp)
    802017c0:	ec6e                	sd	s11,24(sp)
    802017c2:	0100                	addi	s0,sp,128
    802017c4:	8baa                	mv	s7,a0
    802017c6:	f8a43023          	sd	a0,-128(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    802017ca:	85aa                	mv	a1,a0
    802017cc:	00008517          	auipc	a0,0x8
    802017d0:	d3450513          	addi	a0,a0,-716 # 80209500 <etext+0x500>
    802017d4:	fffff097          	auipc	ra,0xfffff
    802017d8:	9bc080e7          	jalr	-1604(ra) # 80200190 <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802017dc:	6d05                	lui	s10,0x1
    802017de:	9d5e                	add	s10,s10,s7
    802017e0:	6c05                	lui	s8,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802017e2:	00008d97          	auipc	s11,0x8
    802017e6:	d46d8d93          	addi	s11,s11,-698 # 80209528 <etext+0x528>
    802017ea:	20000793          	li	a5,512
    802017ee:	f8f43423          	sd	a5,-120(s0)

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    802017f2:	00008a17          	auipc	s4,0x8
    802017f6:	d4ea0a13          	addi	s4,s4,-690 # 80209540 <etext+0x540>
    802017fa:	a88d                	j	8020186c <vmprint+0xc6>
    802017fc:	00a65693          	srli	a3,a2,0xa
    80201800:	413485b3          	sub	a1,s1,s3
    80201804:	06b2                	slli	a3,a3,0xc
    80201806:	858d                	srai	a1,a1,0x3
    80201808:	8552                	mv	a0,s4
    8020180a:	fffff097          	auipc	ra,0xfffff
    8020180e:	986080e7          	jalr	-1658(ra) # 80200190 <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    80201812:	04a1                	addi	s1,s1,8
    80201814:	01248763          	beq	s1,s2,80201822 <vmprint+0x7c>
            if (*pte3 & PTE_V)
    80201818:	6090                	ld	a2,0(s1)
    8020181a:	00167793          	andi	a5,a2,1
    8020181e:	dbf5                	beqz	a5,80201812 <vmprint+0x6c>
    80201820:	bff1                	j	802017fc <vmprint+0x56>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    80201822:	0aa1                	addi	s5,s5,8
    80201824:	056a8163          	beq	s5,s6,80201866 <vmprint+0xc0>
        if (*pte2 & PTE_V)
    80201828:	000ab603          	ld	a2,0(s5)
    8020182c:	00167793          	andi	a5,a2,1
    80201830:	dbed                	beqz	a5,80201822 <vmprint+0x7c>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    80201832:	00a65493          	srli	s1,a2,0xa
    80201836:	04b2                	slli	s1,s1,0xc
    80201838:	89a6                	mv	s3,s1
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    8020183a:	419a85b3          	sub	a1,s5,s9
    8020183e:	86a6                	mv	a3,s1
    80201840:	858d                	srai	a1,a1,0x3
    80201842:	856e                	mv	a0,s11
    80201844:	fffff097          	auipc	ra,0xfffff
    80201848:	94c080e7          	jalr	-1716(ra) # 80200190 <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    8020184c:	00848693          	addi	a3,s1,8
    80201850:	01848733          	add	a4,s1,s8
    80201854:	f8843783          	ld	a5,-120(s0)
    80201858:	00d77363          	bleu	a3,a4,8020185e <vmprint+0xb8>
    8020185c:	4785                	li	a5,1
    8020185e:	078e                	slli	a5,a5,0x3
    80201860:	00978933          	add	s2,a5,s1
    80201864:	bf55                	j	80201818 <vmprint+0x72>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201866:	0ba1                	addi	s7,s7,8
    80201868:	05ab8763          	beq	s7,s10,802018b6 <vmprint+0x110>
    if (*pte & PTE_V)
    8020186c:	000bb603          	ld	a2,0(s7) # 1000 <BASE_ADDRESS-0x801ff000>
    80201870:	00167793          	andi	a5,a2,1
    80201874:	dbed                	beqz	a5,80201866 <vmprint+0xc0>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    80201876:	00a65a93          	srli	s5,a2,0xa
    8020187a:	0ab2                	slli	s5,s5,0xc
    8020187c:	8cd6                	mv	s9,s5
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    8020187e:	f8043783          	ld	a5,-128(s0)
    80201882:	40fb87b3          	sub	a5,s7,a5
    80201886:	86d6                	mv	a3,s5
    80201888:	4037d593          	srai	a1,a5,0x3
    8020188c:	00008517          	auipc	a0,0x8
    80201890:	c8450513          	addi	a0,a0,-892 # 80209510 <etext+0x510>
    80201894:	fffff097          	auipc	ra,0xfffff
    80201898:	8fc080e7          	jalr	-1796(ra) # 80200190 <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    8020189c:	018a86b3          	add	a3,s5,s8
    802018a0:	008a8713          	addi	a4,s5,8
    802018a4:	20000793          	li	a5,512
    802018a8:	00e6f363          	bleu	a4,a3,802018ae <vmprint+0x108>
    802018ac:	4785                	li	a5,1
    802018ae:	078e                	slli	a5,a5,0x3
    802018b0:	01578b33          	add	s6,a5,s5
    802018b4:	bf95                	j	80201828 <vmprint+0x82>
        }
      }
    }
  }
  return;
    802018b6:	70e6                	ld	ra,120(sp)
    802018b8:	7446                	ld	s0,112(sp)
    802018ba:	74a6                	ld	s1,104(sp)
    802018bc:	7906                	ld	s2,96(sp)
    802018be:	69e6                	ld	s3,88(sp)
    802018c0:	6a46                	ld	s4,80(sp)
    802018c2:	6aa6                	ld	s5,72(sp)
    802018c4:	6b06                	ld	s6,64(sp)
    802018c6:	7be2                	ld	s7,56(sp)
    802018c8:	7c42                	ld	s8,48(sp)
    802018ca:	7ca2                	ld	s9,40(sp)
    802018cc:	7d02                	ld	s10,32(sp)
    802018ce:	6de2                	ld	s11,24(sp)
    802018d0:	6109                	addi	sp,sp,128
    802018d2:	8082                	ret

00000000802018d4 <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    802018d4:	1101                	addi	sp,sp,-32
    802018d6:	ec06                	sd	ra,24(sp)
    802018d8:	e822                	sd	s0,16(sp)
    802018da:	e426                	sd	s1,8(sp)
    802018dc:	1000                	addi	s0,sp,32
    802018de:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802018e0:	fffff097          	auipc	ra,0xfffff
    802018e4:	dca080e7          	jalr	-566(ra) # 802006aa <holding>
    802018e8:	c909                	beqz	a0,802018fa <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    802018ea:	749c                	ld	a5,40(s1)
    802018ec:	00978f63          	beq	a5,s1,8020190a <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    802018f0:	60e2                	ld	ra,24(sp)
    802018f2:	6442                	ld	s0,16(sp)
    802018f4:	64a2                	ld	s1,8(sp)
    802018f6:	6105                	addi	sp,sp,32
    802018f8:	8082                	ret
    panic("wakeup1");
    802018fa:	00008517          	auipc	a0,0x8
    802018fe:	c6650513          	addi	a0,a0,-922 # 80209560 <etext+0x560>
    80201902:	fffff097          	auipc	ra,0xfffff
    80201906:	844080e7          	jalr	-1980(ra) # 80200146 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    8020190a:	4c98                	lw	a4,24(s1)
    8020190c:	4785                	li	a5,1
    8020190e:	fef711e3          	bne	a4,a5,802018f0 <wakeup1+0x1c>
    p->state = RUNNABLE;
    80201912:	4789                	li	a5,2
    80201914:	cc9c                	sw	a5,24(s1)
}
    80201916:	bfe9                	j	802018f0 <wakeup1+0x1c>

0000000080201918 <reg_info>:
void reg_info(void) {
    80201918:	1141                	addi	sp,sp,-16
    8020191a:	e406                	sd	ra,8(sp)
    8020191c:	e022                	sd	s0,0(sp)
    8020191e:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    80201920:	00008517          	auipc	a0,0x8
    80201924:	c4850513          	addi	a0,a0,-952 # 80209568 <etext+0x568>
    80201928:	fffff097          	auipc	ra,0xfffff
    8020192c:	868080e7          	jalr	-1944(ra) # 80200190 <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80201930:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    80201934:	00008517          	auipc	a0,0x8
    80201938:	c4c50513          	addi	a0,a0,-948 # 80209580 <etext+0x580>
    8020193c:	fffff097          	auipc	ra,0xfffff
    80201940:	854080e7          	jalr	-1964(ra) # 80200190 <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    80201944:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    80201948:	00008517          	auipc	a0,0x8
    8020194c:	c4850513          	addi	a0,a0,-952 # 80209590 <etext+0x590>
    80201950:	fffff097          	auipc	ra,0xfffff
    80201954:	840080e7          	jalr	-1984(ra) # 80200190 <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    80201958:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    8020195c:	00008517          	auipc	a0,0x8
    80201960:	c4450513          	addi	a0,a0,-956 # 802095a0 <etext+0x5a0>
    80201964:	fffff097          	auipc	ra,0xfffff
    80201968:	82c080e7          	jalr	-2004(ra) # 80200190 <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    8020196c:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201970:	00008517          	auipc	a0,0x8
    80201974:	c4050513          	addi	a0,a0,-960 # 802095b0 <etext+0x5b0>
    80201978:	fffff097          	auipc	ra,0xfffff
    8020197c:	818080e7          	jalr	-2024(ra) # 80200190 <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201980:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    80201984:	00008517          	auipc	a0,0x8
    80201988:	c3c50513          	addi	a0,a0,-964 # 802095c0 <etext+0x5c0>
    8020198c:	fffff097          	auipc	ra,0xfffff
    80201990:	804080e7          	jalr	-2044(ra) # 80200190 <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    80201994:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    80201998:	00008517          	auipc	a0,0x8
    8020199c:	c3850513          	addi	a0,a0,-968 # 802095d0 <etext+0x5d0>
    802019a0:	ffffe097          	auipc	ra,0xffffe
    802019a4:	7f0080e7          	jalr	2032(ra) # 80200190 <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    802019a8:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    802019ac:	00008517          	auipc	a0,0x8
    802019b0:	c3450513          	addi	a0,a0,-972 # 802095e0 <etext+0x5e0>
    802019b4:	ffffe097          	auipc	ra,0xffffe
    802019b8:	7dc080e7          	jalr	2012(ra) # 80200190 <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    802019bc:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    802019c0:	00008517          	auipc	a0,0x8
    802019c4:	c3050513          	addi	a0,a0,-976 # 802095f0 <etext+0x5f0>
    802019c8:	ffffe097          	auipc	ra,0xffffe
    802019cc:	7c8080e7          	jalr	1992(ra) # 80200190 <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    802019d0:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    802019d2:	00008517          	auipc	a0,0x8
    802019d6:	c2e50513          	addi	a0,a0,-978 # 80209600 <etext+0x600>
    802019da:	ffffe097          	auipc	ra,0xffffe
    802019de:	7b6080e7          	jalr	1974(ra) # 80200190 <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    802019e2:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    802019e4:	00008517          	auipc	a0,0x8
    802019e8:	c2450513          	addi	a0,a0,-988 # 80209608 <etext+0x608>
    802019ec:	ffffe097          	auipc	ra,0xffffe
    802019f0:	7a4080e7          	jalr	1956(ra) # 80200190 <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    802019f4:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    802019f6:	00008517          	auipc	a0,0x8
    802019fa:	c1a50513          	addi	a0,a0,-998 # 80209610 <etext+0x610>
    802019fe:	ffffe097          	auipc	ra,0xffffe
    80201a02:	792080e7          	jalr	1938(ra) # 80200190 <printf>
  printf("}\n");
    80201a06:	00008517          	auipc	a0,0x8
    80201a0a:	c1250513          	addi	a0,a0,-1006 # 80209618 <etext+0x618>
    80201a0e:	ffffe097          	auipc	ra,0xffffe
    80201a12:	782080e7          	jalr	1922(ra) # 80200190 <printf>
}
    80201a16:	60a2                	ld	ra,8(sp)
    80201a18:	6402                	ld	s0,0(sp)
    80201a1a:	0141                	addi	sp,sp,16
    80201a1c:	8082                	ret

0000000080201a1e <procinit>:
{
    80201a1e:	7179                	addi	sp,sp,-48
    80201a20:	f406                	sd	ra,40(sp)
    80201a22:	f022                	sd	s0,32(sp)
    80201a24:	ec26                	sd	s1,24(sp)
    80201a26:	e84a                	sd	s2,16(sp)
    80201a28:	e44e                	sd	s3,8(sp)
    80201a2a:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    80201a2c:	00008597          	auipc	a1,0x8
    80201a30:	bf458593          	addi	a1,a1,-1036 # 80209620 <etext+0x620>
    80201a34:	00011517          	auipc	a0,0x11
    80201a38:	62c50513          	addi	a0,a0,1580 # 80213060 <pid_lock>
    80201a3c:	fffff097          	auipc	ra,0xfffff
    80201a40:	c58080e7          	jalr	-936(ra) # 80200694 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a44:	00011497          	auipc	s1,0x11
    80201a48:	73c48493          	addi	s1,s1,1852 # 80213180 <proc>
      initlock(&p->lock, "proc");
    80201a4c:	00008997          	auipc	s3,0x8
    80201a50:	bdc98993          	addi	s3,s3,-1060 # 80209628 <etext+0x628>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a54:	00016917          	auipc	s2,0x16
    80201a58:	22c90913          	addi	s2,s2,556 # 80217c80 <bcache>
      initlock(&p->lock, "proc");
    80201a5c:	85ce                	mv	a1,s3
    80201a5e:	8526                	mv	a0,s1
    80201a60:	fffff097          	auipc	ra,0xfffff
    80201a64:	c34080e7          	jalr	-972(ra) # 80200694 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a68:	18048493          	addi	s1,s1,384
    80201a6c:	ff2498e3          	bne	s1,s2,80201a5c <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201a70:	10000613          	li	a2,256
    80201a74:	4581                	li	a1,0
    80201a76:	00011517          	auipc	a0,0x11
    80201a7a:	60250513          	addi	a0,a0,1538 # 80213078 <cpus>
    80201a7e:	fffff097          	auipc	ra,0xfffff
    80201a82:	cf6080e7          	jalr	-778(ra) # 80200774 <memset>
}
    80201a86:	70a2                	ld	ra,40(sp)
    80201a88:	7402                	ld	s0,32(sp)
    80201a8a:	64e2                	ld	s1,24(sp)
    80201a8c:	6942                	ld	s2,16(sp)
    80201a8e:	69a2                	ld	s3,8(sp)
    80201a90:	6145                	addi	sp,sp,48
    80201a92:	8082                	ret

0000000080201a94 <cpuid>:
{
    80201a94:	1141                	addi	sp,sp,-16
    80201a96:	e422                	sd	s0,8(sp)
    80201a98:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201a9a:	8512                	mv	a0,tp
}
    80201a9c:	2501                	sext.w	a0,a0
    80201a9e:	6422                	ld	s0,8(sp)
    80201aa0:	0141                	addi	sp,sp,16
    80201aa2:	8082                	ret

0000000080201aa4 <mycpu>:
mycpu(void) {
    80201aa4:	1141                	addi	sp,sp,-16
    80201aa6:	e422                	sd	s0,8(sp)
    80201aa8:	0800                	addi	s0,sp,16
    80201aaa:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201aac:	2781                	sext.w	a5,a5
    80201aae:	079e                	slli	a5,a5,0x7
}
    80201ab0:	00011517          	auipc	a0,0x11
    80201ab4:	5c850513          	addi	a0,a0,1480 # 80213078 <cpus>
    80201ab8:	953e                	add	a0,a0,a5
    80201aba:	6422                	ld	s0,8(sp)
    80201abc:	0141                	addi	sp,sp,16
    80201abe:	8082                	ret

0000000080201ac0 <myproc>:
myproc(void) {
    80201ac0:	1101                	addi	sp,sp,-32
    80201ac2:	ec06                	sd	ra,24(sp)
    80201ac4:	e822                	sd	s0,16(sp)
    80201ac6:	e426                	sd	s1,8(sp)
    80201ac8:	1000                	addi	s0,sp,32
  push_off();
    80201aca:	fffff097          	auipc	ra,0xfffff
    80201ace:	b1e080e7          	jalr	-1250(ra) # 802005e8 <push_off>
    80201ad2:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201ad4:	2781                	sext.w	a5,a5
    80201ad6:	079e                	slli	a5,a5,0x7
    80201ad8:	00011717          	auipc	a4,0x11
    80201adc:	58870713          	addi	a4,a4,1416 # 80213060 <pid_lock>
    80201ae0:	97ba                	add	a5,a5,a4
    80201ae2:	6f84                	ld	s1,24(a5)
  pop_off();
    80201ae4:	fffff097          	auipc	ra,0xfffff
    80201ae8:	b50080e7          	jalr	-1200(ra) # 80200634 <pop_off>
}
    80201aec:	8526                	mv	a0,s1
    80201aee:	60e2                	ld	ra,24(sp)
    80201af0:	6442                	ld	s0,16(sp)
    80201af2:	64a2                	ld	s1,8(sp)
    80201af4:	6105                	addi	sp,sp,32
    80201af6:	8082                	ret

0000000080201af8 <forkret>:
{
    80201af8:	1101                	addi	sp,sp,-32
    80201afa:	ec06                	sd	ra,24(sp)
    80201afc:	e822                	sd	s0,16(sp)
    80201afe:	e426                	sd	s1,8(sp)
    80201b00:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201b02:	00000097          	auipc	ra,0x0
    80201b06:	fbe080e7          	jalr	-66(ra) # 80201ac0 <myproc>
    80201b0a:	fffff097          	auipc	ra,0xfffff
    80201b0e:	c22080e7          	jalr	-990(ra) # 8020072c <release>
  if (first) {
    80201b12:	00008797          	auipc	a5,0x8
    80201b16:	4ee78793          	addi	a5,a5,1262 # 8020a000 <data_start>
    80201b1a:	439c                	lw	a5,0(a5)
    80201b1c:	eb91                	bnez	a5,80201b30 <forkret+0x38>
  usertrapret();
    80201b1e:	00001097          	auipc	ra,0x1
    80201b22:	ce4080e7          	jalr	-796(ra) # 80202802 <usertrapret>
}
    80201b26:	60e2                	ld	ra,24(sp)
    80201b28:	6442                	ld	s0,16(sp)
    80201b2a:	64a2                	ld	s1,8(sp)
    80201b2c:	6105                	addi	sp,sp,32
    80201b2e:	8082                	ret
    first = 0;
    80201b30:	00008797          	auipc	a5,0x8
    80201b34:	4c07a823          	sw	zero,1232(a5) # 8020a000 <data_start>
    fat32_init();
    80201b38:	00004097          	auipc	ra,0x4
    80201b3c:	dc8080e7          	jalr	-568(ra) # 80205900 <fat32_init>
    myproc()->cwd = ename("/");
    80201b40:	00000097          	auipc	ra,0x0
    80201b44:	f80080e7          	jalr	-128(ra) # 80201ac0 <myproc>
    80201b48:	84aa                	mv	s1,a0
    80201b4a:	00008517          	auipc	a0,0x8
    80201b4e:	ae650513          	addi	a0,a0,-1306 # 80209630 <etext+0x630>
    80201b52:	00005097          	auipc	ra,0x5
    80201b56:	00e080e7          	jalr	14(ra) # 80206b60 <ename>
    80201b5a:	14a4bc23          	sd	a0,344(s1)
    80201b5e:	b7c1                	j	80201b1e <forkret+0x26>

0000000080201b60 <allocpid>:
allocpid() {
    80201b60:	1101                	addi	sp,sp,-32
    80201b62:	ec06                	sd	ra,24(sp)
    80201b64:	e822                	sd	s0,16(sp)
    80201b66:	e426                	sd	s1,8(sp)
    80201b68:	e04a                	sd	s2,0(sp)
    80201b6a:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b6c:	00011917          	auipc	s2,0x11
    80201b70:	4f490913          	addi	s2,s2,1268 # 80213060 <pid_lock>
    80201b74:	854a                	mv	a0,s2
    80201b76:	fffff097          	auipc	ra,0xfffff
    80201b7a:	b62080e7          	jalr	-1182(ra) # 802006d8 <acquire>
  pid = nextpid;
    80201b7e:	00008797          	auipc	a5,0x8
    80201b82:	48278793          	addi	a5,a5,1154 # 8020a000 <data_start>
    80201b86:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b88:	0014871b          	addiw	a4,s1,1
    80201b8c:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201b8e:	854a                	mv	a0,s2
    80201b90:	fffff097          	auipc	ra,0xfffff
    80201b94:	b9c080e7          	jalr	-1124(ra) # 8020072c <release>
}
    80201b98:	8526                	mv	a0,s1
    80201b9a:	60e2                	ld	ra,24(sp)
    80201b9c:	6442                	ld	s0,16(sp)
    80201b9e:	64a2                	ld	s1,8(sp)
    80201ba0:	6902                	ld	s2,0(sp)
    80201ba2:	6105                	addi	sp,sp,32
    80201ba4:	8082                	ret

0000000080201ba6 <proc_pagetable>:
{
    80201ba6:	1101                	addi	sp,sp,-32
    80201ba8:	ec06                	sd	ra,24(sp)
    80201baa:	e822                	sd	s0,16(sp)
    80201bac:	e426                	sd	s1,8(sp)
    80201bae:	e04a                	sd	s2,0(sp)
    80201bb0:	1000                	addi	s0,sp,32
    80201bb2:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201bb4:	fffff097          	auipc	ra,0xfffff
    80201bb8:	386080e7          	jalr	902(ra) # 80200f3a <uvmcreate>
    80201bbc:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201bbe:	c121                	beqz	a0,80201bfe <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201bc0:	4729                	li	a4,10
    80201bc2:	00008697          	auipc	a3,0x8
    80201bc6:	67e6b683          	ld	a3,1662(a3) # 8020a240 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201bca:	6605                	lui	a2,0x1
    80201bcc:	040005b7          	lui	a1,0x4000
    80201bd0:	15fd                	addi	a1,a1,-1
    80201bd2:	05b2                	slli	a1,a1,0xc
    80201bd4:	fffff097          	auipc	ra,0xfffff
    80201bd8:	0e6080e7          	jalr	230(ra) # 80200cba <mappages>
    80201bdc:	02054863          	bltz	a0,80201c0c <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201be0:	4719                	li	a4,6
    80201be2:	06093683          	ld	a3,96(s2)
    80201be6:	6605                	lui	a2,0x1
    80201be8:	020005b7          	lui	a1,0x2000
    80201bec:	15fd                	addi	a1,a1,-1
    80201bee:	05b6                	slli	a1,a1,0xd
    80201bf0:	8526                	mv	a0,s1
    80201bf2:	fffff097          	auipc	ra,0xfffff
    80201bf6:	0c8080e7          	jalr	200(ra) # 80200cba <mappages>
    80201bfa:	02054163          	bltz	a0,80201c1c <proc_pagetable+0x76>
}
    80201bfe:	8526                	mv	a0,s1
    80201c00:	60e2                	ld	ra,24(sp)
    80201c02:	6442                	ld	s0,16(sp)
    80201c04:	64a2                	ld	s1,8(sp)
    80201c06:	6902                	ld	s2,0(sp)
    80201c08:	6105                	addi	sp,sp,32
    80201c0a:	8082                	ret
    uvmfree(pagetable, 0);
    80201c0c:	4581                	li	a1,0
    80201c0e:	8526                	mv	a0,s1
    80201c10:	fffff097          	auipc	ra,0xfffff
    80201c14:	5ae080e7          	jalr	1454(ra) # 802011be <uvmfree>
    return NULL;
    80201c18:	4481                	li	s1,0
    80201c1a:	b7d5                	j	80201bfe <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c1c:	4681                	li	a3,0
    80201c1e:	4605                	li	a2,1
    80201c20:	040005b7          	lui	a1,0x4000
    80201c24:	15fd                	addi	a1,a1,-1
    80201c26:	05b2                	slli	a1,a1,0xc
    80201c28:	8526                	mv	a0,s1
    80201c2a:	fffff097          	auipc	ra,0xfffff
    80201c2e:	24a080e7          	jalr	586(ra) # 80200e74 <vmunmap>
    uvmfree(pagetable, 0);
    80201c32:	4581                	li	a1,0
    80201c34:	8526                	mv	a0,s1
    80201c36:	fffff097          	auipc	ra,0xfffff
    80201c3a:	588080e7          	jalr	1416(ra) # 802011be <uvmfree>
    return NULL;
    80201c3e:	4481                	li	s1,0
    80201c40:	bf7d                	j	80201bfe <proc_pagetable+0x58>

0000000080201c42 <proc_freepagetable>:
{
    80201c42:	1101                	addi	sp,sp,-32
    80201c44:	ec06                	sd	ra,24(sp)
    80201c46:	e822                	sd	s0,16(sp)
    80201c48:	e426                	sd	s1,8(sp)
    80201c4a:	e04a                	sd	s2,0(sp)
    80201c4c:	1000                	addi	s0,sp,32
    80201c4e:	84aa                	mv	s1,a0
    80201c50:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c52:	4681                	li	a3,0
    80201c54:	4605                	li	a2,1
    80201c56:	040005b7          	lui	a1,0x4000
    80201c5a:	15fd                	addi	a1,a1,-1
    80201c5c:	05b2                	slli	a1,a1,0xc
    80201c5e:	fffff097          	auipc	ra,0xfffff
    80201c62:	216080e7          	jalr	534(ra) # 80200e74 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201c66:	4681                	li	a3,0
    80201c68:	4605                	li	a2,1
    80201c6a:	020005b7          	lui	a1,0x2000
    80201c6e:	15fd                	addi	a1,a1,-1
    80201c70:	05b6                	slli	a1,a1,0xd
    80201c72:	8526                	mv	a0,s1
    80201c74:	fffff097          	auipc	ra,0xfffff
    80201c78:	200080e7          	jalr	512(ra) # 80200e74 <vmunmap>
  uvmfree(pagetable, sz);
    80201c7c:	85ca                	mv	a1,s2
    80201c7e:	8526                	mv	a0,s1
    80201c80:	fffff097          	auipc	ra,0xfffff
    80201c84:	53e080e7          	jalr	1342(ra) # 802011be <uvmfree>
}
    80201c88:	60e2                	ld	ra,24(sp)
    80201c8a:	6442                	ld	s0,16(sp)
    80201c8c:	64a2                	ld	s1,8(sp)
    80201c8e:	6902                	ld	s2,0(sp)
    80201c90:	6105                	addi	sp,sp,32
    80201c92:	8082                	ret

0000000080201c94 <freeproc>:
{
    80201c94:	1101                	addi	sp,sp,-32
    80201c96:	ec06                	sd	ra,24(sp)
    80201c98:	e822                	sd	s0,16(sp)
    80201c9a:	e426                	sd	s1,8(sp)
    80201c9c:	1000                	addi	s0,sp,32
    80201c9e:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201ca0:	7128                	ld	a0,96(a0)
    80201ca2:	c509                	beqz	a0,80201cac <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201ca4:	ffffe097          	auipc	ra,0xffffe
    80201ca8:	7aa080e7          	jalr	1962(ra) # 8020044e <kfree>
  p->trapframe = 0;
    80201cac:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201cb0:	6ca8                	ld	a0,88(s1)
    80201cb2:	c511                	beqz	a0,80201cbe <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201cb4:	4585                	li	a1,1
    80201cb6:	00000097          	auipc	ra,0x0
    80201cba:	a2e080e7          	jalr	-1490(ra) # 802016e4 <kvmfree>
  p->kpagetable = 0;
    80201cbe:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201cc2:	68a8                	ld	a0,80(s1)
    80201cc4:	c511                	beqz	a0,80201cd0 <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201cc6:	64ac                	ld	a1,72(s1)
    80201cc8:	00000097          	auipc	ra,0x0
    80201ccc:	f7a080e7          	jalr	-134(ra) # 80201c42 <proc_freepagetable>
  p->pagetable = 0;
    80201cd0:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201cd4:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201cd8:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201cdc:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201ce0:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201ce4:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201ce8:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201cec:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201cf0:	0004ac23          	sw	zero,24(s1)
}
    80201cf4:	60e2                	ld	ra,24(sp)
    80201cf6:	6442                	ld	s0,16(sp)
    80201cf8:	64a2                	ld	s1,8(sp)
    80201cfa:	6105                	addi	sp,sp,32
    80201cfc:	8082                	ret

0000000080201cfe <allocproc>:
{
    80201cfe:	1101                	addi	sp,sp,-32
    80201d00:	ec06                	sd	ra,24(sp)
    80201d02:	e822                	sd	s0,16(sp)
    80201d04:	e426                	sd	s1,8(sp)
    80201d06:	e04a                	sd	s2,0(sp)
    80201d08:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d0a:	00011497          	auipc	s1,0x11
    80201d0e:	47648493          	addi	s1,s1,1142 # 80213180 <proc>
    80201d12:	00016917          	auipc	s2,0x16
    80201d16:	f6e90913          	addi	s2,s2,-146 # 80217c80 <bcache>
    acquire(&p->lock);
    80201d1a:	8526                	mv	a0,s1
    80201d1c:	fffff097          	auipc	ra,0xfffff
    80201d20:	9bc080e7          	jalr	-1604(ra) # 802006d8 <acquire>
    if(p->state == UNUSED) {
    80201d24:	4c9c                	lw	a5,24(s1)
    80201d26:	cf81                	beqz	a5,80201d3e <allocproc+0x40>
      release(&p->lock);
    80201d28:	8526                	mv	a0,s1
    80201d2a:	fffff097          	auipc	ra,0xfffff
    80201d2e:	a02080e7          	jalr	-1534(ra) # 8020072c <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d32:	18048493          	addi	s1,s1,384
    80201d36:	ff2492e3          	bne	s1,s2,80201d1a <allocproc+0x1c>
  return NULL;
    80201d3a:	4481                	li	s1,0
    80201d3c:	a895                	j	80201db0 <allocproc+0xb2>
  p->pid = allocpid();
    80201d3e:	00000097          	auipc	ra,0x0
    80201d42:	e22080e7          	jalr	-478(ra) # 80201b60 <allocpid>
    80201d46:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201d48:	fffff097          	auipc	ra,0xfffff
    80201d4c:	822080e7          	jalr	-2014(ra) # 8020056a <kalloc>
    80201d50:	892a                	mv	s2,a0
    80201d52:	f0a8                	sd	a0,96(s1)
    80201d54:	c52d                	beqz	a0,80201dbe <allocproc+0xc0>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d56:	8526                	mv	a0,s1
    80201d58:	00000097          	auipc	ra,0x0
    80201d5c:	e4e080e7          	jalr	-434(ra) # 80201ba6 <proc_pagetable>
    80201d60:	e8a8                	sd	a0,80(s1)
    80201d62:	c52d                	beqz	a0,80201dcc <allocproc+0xce>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201d64:	00000097          	auipc	ra,0x0
    80201d68:	9da080e7          	jalr	-1574(ra) # 8020173e <proc_kpagetable>
    80201d6c:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d6e:	cd39                	beqz	a0,80201dcc <allocproc+0xce>
  p->kstack = VKSTACK;
    80201d70:	0fb00793          	li	a5,251
    80201d74:	07fa                	slli	a5,a5,0x1e
    80201d76:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d78:	07000613          	li	a2,112
    80201d7c:	4581                	li	a1,0
    80201d7e:	06848513          	addi	a0,s1,104
    80201d82:	fffff097          	auipc	ra,0xfffff
    80201d86:	9f2080e7          	jalr	-1550(ra) # 80200774 <memset>
  p->context.ra = (uint64)forkret;
    80201d8a:	00000797          	auipc	a5,0x0
    80201d8e:	d6e78793          	addi	a5,a5,-658 # 80201af8 <forkret>
    80201d92:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201d94:	60bc                	ld	a5,64(s1)
    80201d96:	6705                	lui	a4,0x1
    80201d98:	97ba                	add	a5,a5,a4
    80201d9a:	f8bc                	sd	a5,112(s1)
  p->qos = DEFAULT_QOS;
    80201d9c:	03200793          	li	a5,50
    80201da0:	16f4aa23          	sw	a5,372(s1)
  p->last_tick = get_tick();
    80201da4:	00003097          	auipc	ra,0x3
    80201da8:	416080e7          	jalr	1046(ra) # 802051ba <get_tick>
    80201dac:	16a4ac23          	sw	a0,376(s1)
}
    80201db0:	8526                	mv	a0,s1
    80201db2:	60e2                	ld	ra,24(sp)
    80201db4:	6442                	ld	s0,16(sp)
    80201db6:	64a2                	ld	s1,8(sp)
    80201db8:	6902                	ld	s2,0(sp)
    80201dba:	6105                	addi	sp,sp,32
    80201dbc:	8082                	ret
    release(&p->lock);
    80201dbe:	8526                	mv	a0,s1
    80201dc0:	fffff097          	auipc	ra,0xfffff
    80201dc4:	96c080e7          	jalr	-1684(ra) # 8020072c <release>
    return NULL;
    80201dc8:	84ca                	mv	s1,s2
    80201dca:	b7dd                	j	80201db0 <allocproc+0xb2>
    freeproc(p);
    80201dcc:	8526                	mv	a0,s1
    80201dce:	00000097          	auipc	ra,0x0
    80201dd2:	ec6080e7          	jalr	-314(ra) # 80201c94 <freeproc>
    release(&p->lock);
    80201dd6:	8526                	mv	a0,s1
    80201dd8:	fffff097          	auipc	ra,0xfffff
    80201ddc:	954080e7          	jalr	-1708(ra) # 8020072c <release>
    return NULL;
    80201de0:	4481                	li	s1,0
    80201de2:	b7f9                	j	80201db0 <allocproc+0xb2>

0000000080201de4 <userinit>:
{
    80201de4:	1101                	addi	sp,sp,-32
    80201de6:	ec06                	sd	ra,24(sp)
    80201de8:	e822                	sd	s0,16(sp)
    80201dea:	e426                	sd	s1,8(sp)
    80201dec:	1000                	addi	s0,sp,32
  p = allocproc();
    80201dee:	00000097          	auipc	ra,0x0
    80201df2:	f10080e7          	jalr	-240(ra) # 80201cfe <allocproc>
    80201df6:	84aa                	mv	s1,a0
  initproc = p;
    80201df8:	00011797          	auipc	a5,0x11
    80201dfc:	38a7b023          	sd	a0,896(a5) # 80213178 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201e00:	03400693          	li	a3,52
    80201e04:	00008617          	auipc	a2,0x8
    80201e08:	20460613          	addi	a2,a2,516 # 8020a008 <initcode>
    80201e0c:	6d2c                	ld	a1,88(a0)
    80201e0e:	6928                	ld	a0,80(a0)
    80201e10:	fffff097          	auipc	ra,0xfffff
    80201e14:	158080e7          	jalr	344(ra) # 80200f68 <uvminit>
  p->sz = PGSIZE;
    80201e18:	6785                	lui	a5,0x1
    80201e1a:	e4bc                	sd	a5,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201e1c:	70b8                	ld	a4,96(s1)
    80201e1e:	00073c23          	sd	zero,24(a4) # 1018 <BASE_ADDRESS-0x801fefe8>
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201e22:	70b8                	ld	a4,96(s1)
    80201e24:	fb1c                	sd	a5,48(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201e26:	4641                	li	a2,16
    80201e28:	00008597          	auipc	a1,0x8
    80201e2c:	81058593          	addi	a1,a1,-2032 # 80209638 <etext+0x638>
    80201e30:	16048513          	addi	a0,s1,352
    80201e34:	fffff097          	auipc	ra,0xfffff
    80201e38:	ab8080e7          	jalr	-1352(ra) # 802008ec <safestrcpy>
  p->state = RUNNABLE;
    80201e3c:	4789                	li	a5,2
    80201e3e:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201e40:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201e44:	8526                	mv	a0,s1
    80201e46:	fffff097          	auipc	ra,0xfffff
    80201e4a:	8e6080e7          	jalr	-1818(ra) # 8020072c <release>
}
    80201e4e:	60e2                	ld	ra,24(sp)
    80201e50:	6442                	ld	s0,16(sp)
    80201e52:	64a2                	ld	s1,8(sp)
    80201e54:	6105                	addi	sp,sp,32
    80201e56:	8082                	ret

0000000080201e58 <growproc>:
{
    80201e58:	1101                	addi	sp,sp,-32
    80201e5a:	ec06                	sd	ra,24(sp)
    80201e5c:	e822                	sd	s0,16(sp)
    80201e5e:	e426                	sd	s1,8(sp)
    80201e60:	e04a                	sd	s2,0(sp)
    80201e62:	1000                	addi	s0,sp,32
    80201e64:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e66:	00000097          	auipc	ra,0x0
    80201e6a:	c5a080e7          	jalr	-934(ra) # 80201ac0 <myproc>
    80201e6e:	892a                	mv	s2,a0
  sz = p->sz;
    80201e70:	6530                	ld	a2,72(a0)
    80201e72:	0006051b          	sext.w	a0,a2
  if(n > 0){
    80201e76:	00904f63          	bgtz	s1,80201e94 <growproc+0x3c>
  } else if(n < 0){
    80201e7a:	0204cf63          	bltz	s1,80201eb8 <growproc+0x60>
  p->sz = sz;
    80201e7e:	1502                	slli	a0,a0,0x20
    80201e80:	9101                	srli	a0,a0,0x20
    80201e82:	04a93423          	sd	a0,72(s2)
  return 0;
    80201e86:	4501                	li	a0,0
}
    80201e88:	60e2                	ld	ra,24(sp)
    80201e8a:	6442                	ld	s0,16(sp)
    80201e8c:	64a2                	ld	s1,8(sp)
    80201e8e:	6902                	ld	s2,0(sp)
    80201e90:	6105                	addi	sp,sp,32
    80201e92:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201e94:	00a486bb          	addw	a3,s1,a0
    80201e98:	1682                	slli	a3,a3,0x20
    80201e9a:	9281                	srli	a3,a3,0x20
    80201e9c:	1602                	slli	a2,a2,0x20
    80201e9e:	9201                	srli	a2,a2,0x20
    80201ea0:	05893583          	ld	a1,88(s2)
    80201ea4:	05093503          	ld	a0,80(s2)
    80201ea8:	fffff097          	auipc	ra,0xfffff
    80201eac:	1b6080e7          	jalr	438(ra) # 8020105e <uvmalloc>
    80201eb0:	2501                	sext.w	a0,a0
    80201eb2:	f571                	bnez	a0,80201e7e <growproc+0x26>
      return -1;
    80201eb4:	557d                	li	a0,-1
    80201eb6:	bfc9                	j	80201e88 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201eb8:	00a486bb          	addw	a3,s1,a0
    80201ebc:	1682                	slli	a3,a3,0x20
    80201ebe:	9281                	srli	a3,a3,0x20
    80201ec0:	1602                	slli	a2,a2,0x20
    80201ec2:	9201                	srli	a2,a2,0x20
    80201ec4:	05893583          	ld	a1,88(s2)
    80201ec8:	05093503          	ld	a0,80(s2)
    80201ecc:	fffff097          	auipc	ra,0xfffff
    80201ed0:	126080e7          	jalr	294(ra) # 80200ff2 <uvmdealloc>
    80201ed4:	2501                	sext.w	a0,a0
    80201ed6:	b765                	j	80201e7e <growproc+0x26>

0000000080201ed8 <fork>:
{
    80201ed8:	7179                	addi	sp,sp,-48
    80201eda:	f406                	sd	ra,40(sp)
    80201edc:	f022                	sd	s0,32(sp)
    80201ede:	ec26                	sd	s1,24(sp)
    80201ee0:	e84a                	sd	s2,16(sp)
    80201ee2:	e44e                	sd	s3,8(sp)
    80201ee4:	e052                	sd	s4,0(sp)
    80201ee6:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80201ee8:	00000097          	auipc	ra,0x0
    80201eec:	bd8080e7          	jalr	-1064(ra) # 80201ac0 <myproc>
    80201ef0:	892a                	mv	s2,a0
  if((np = allocproc()) == NULL){
    80201ef2:	00000097          	auipc	ra,0x0
    80201ef6:	e0c080e7          	jalr	-500(ra) # 80201cfe <allocproc>
    80201efa:	c57d                	beqz	a0,80201fe8 <fork+0x110>
    80201efc:	89aa                	mv	s3,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201efe:	04893683          	ld	a3,72(s2)
    80201f02:	6d30                	ld	a2,88(a0)
    80201f04:	692c                	ld	a1,80(a0)
    80201f06:	05093503          	ld	a0,80(s2)
    80201f0a:	fffff097          	auipc	ra,0xfffff
    80201f0e:	2ec080e7          	jalr	748(ra) # 802011f6 <uvmcopy>
    80201f12:	04054c63          	bltz	a0,80201f6a <fork+0x92>
  np->sz = p->sz;
    80201f16:	04893783          	ld	a5,72(s2)
    80201f1a:	04f9b423          	sd	a5,72(s3)
  np->parent = p;
    80201f1e:	0329b023          	sd	s2,32(s3)
  np->tmask = p->tmask;
    80201f22:	17092783          	lw	a5,368(s2)
    80201f26:	16f9a823          	sw	a5,368(s3)
  *(np->trapframe) = *(p->trapframe);
    80201f2a:	06093683          	ld	a3,96(s2)
    80201f2e:	87b6                	mv	a5,a3
    80201f30:	0609b703          	ld	a4,96(s3)
    80201f34:	12068693          	addi	a3,a3,288
    80201f38:	0007b803          	ld	a6,0(a5) # 1000 <BASE_ADDRESS-0x801ff000>
    80201f3c:	6788                	ld	a0,8(a5)
    80201f3e:	6b8c                	ld	a1,16(a5)
    80201f40:	6f90                	ld	a2,24(a5)
    80201f42:	01073023          	sd	a6,0(a4)
    80201f46:	e708                	sd	a0,8(a4)
    80201f48:	eb0c                	sd	a1,16(a4)
    80201f4a:	ef10                	sd	a2,24(a4)
    80201f4c:	02078793          	addi	a5,a5,32
    80201f50:	02070713          	addi	a4,a4,32
    80201f54:	fed792e3          	bne	a5,a3,80201f38 <fork+0x60>
  np->trapframe->a0 = 0;
    80201f58:	0609b783          	ld	a5,96(s3)
    80201f5c:	0607b823          	sd	zero,112(a5)
    80201f60:	0d800493          	li	s1,216
  for(i = 0; i < NOFILE; i++)
    80201f64:	15800a13          	li	s4,344
    80201f68:	a03d                	j	80201f96 <fork+0xbe>
    freeproc(np);
    80201f6a:	854e                	mv	a0,s3
    80201f6c:	00000097          	auipc	ra,0x0
    80201f70:	d28080e7          	jalr	-728(ra) # 80201c94 <freeproc>
    release(&np->lock);
    80201f74:	854e                	mv	a0,s3
    80201f76:	ffffe097          	auipc	ra,0xffffe
    80201f7a:	7b6080e7          	jalr	1974(ra) # 8020072c <release>
    return -1;
    80201f7e:	54fd                	li	s1,-1
    80201f80:	a899                	j	80201fd6 <fork+0xfe>
      np->ofile[i] = filedup(p->ofile[i]);
    80201f82:	00002097          	auipc	ra,0x2
    80201f86:	9ca080e7          	jalr	-1590(ra) # 8020394c <filedup>
    80201f8a:	009987b3          	add	a5,s3,s1
    80201f8e:	e388                	sd	a0,0(a5)
  for(i = 0; i < NOFILE; i++)
    80201f90:	04a1                	addi	s1,s1,8
    80201f92:	01448763          	beq	s1,s4,80201fa0 <fork+0xc8>
    if(p->ofile[i])
    80201f96:	009907b3          	add	a5,s2,s1
    80201f9a:	6388                	ld	a0,0(a5)
    80201f9c:	f17d                	bnez	a0,80201f82 <fork+0xaa>
    80201f9e:	bfcd                	j	80201f90 <fork+0xb8>
  np->cwd = edup(p->cwd);
    80201fa0:	15893503          	ld	a0,344(s2)
    80201fa4:	00004097          	auipc	ra,0x4
    80201fa8:	1b2080e7          	jalr	434(ra) # 80206156 <edup>
    80201fac:	14a9bc23          	sd	a0,344(s3)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201fb0:	4641                	li	a2,16
    80201fb2:	16090593          	addi	a1,s2,352
    80201fb6:	16098513          	addi	a0,s3,352
    80201fba:	fffff097          	auipc	ra,0xfffff
    80201fbe:	932080e7          	jalr	-1742(ra) # 802008ec <safestrcpy>
  pid = np->pid;
    80201fc2:	0389a483          	lw	s1,56(s3)
  np->state = RUNNABLE;
    80201fc6:	4789                	li	a5,2
    80201fc8:	00f9ac23          	sw	a5,24(s3)
  release(&np->lock);
    80201fcc:	854e                	mv	a0,s3
    80201fce:	ffffe097          	auipc	ra,0xffffe
    80201fd2:	75e080e7          	jalr	1886(ra) # 8020072c <release>
}
    80201fd6:	8526                	mv	a0,s1
    80201fd8:	70a2                	ld	ra,40(sp)
    80201fda:	7402                	ld	s0,32(sp)
    80201fdc:	64e2                	ld	s1,24(sp)
    80201fde:	6942                	ld	s2,16(sp)
    80201fe0:	69a2                	ld	s3,8(sp)
    80201fe2:	6a02                	ld	s4,0(sp)
    80201fe4:	6145                	addi	sp,sp,48
    80201fe6:	8082                	ret
    return -1;
    80201fe8:	54fd                	li	s1,-1
    80201fea:	b7f5                	j	80201fd6 <fork+0xfe>

0000000080201fec <reparent>:
{
    80201fec:	7179                	addi	sp,sp,-48
    80201fee:	f406                	sd	ra,40(sp)
    80201ff0:	f022                	sd	s0,32(sp)
    80201ff2:	ec26                	sd	s1,24(sp)
    80201ff4:	e84a                	sd	s2,16(sp)
    80201ff6:	e44e                	sd	s3,8(sp)
    80201ff8:	e052                	sd	s4,0(sp)
    80201ffa:	1800                	addi	s0,sp,48
    80201ffc:	89aa                	mv	s3,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80201ffe:	00011497          	auipc	s1,0x11
    80202002:	18248493          	addi	s1,s1,386 # 80213180 <proc>
      pp->parent = initproc;
    80202006:	00011a17          	auipc	s4,0x11
    8020200a:	05aa0a13          	addi	s4,s4,90 # 80213060 <pid_lock>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    8020200e:	00016917          	auipc	s2,0x16
    80202012:	c7290913          	addi	s2,s2,-910 # 80217c80 <bcache>
    80202016:	a029                	j	80202020 <reparent+0x34>
    80202018:	18048493          	addi	s1,s1,384
    8020201c:	03248363          	beq	s1,s2,80202042 <reparent+0x56>
    if(pp->parent == p){
    80202020:	709c                	ld	a5,32(s1)
    80202022:	ff379be3          	bne	a5,s3,80202018 <reparent+0x2c>
      acquire(&pp->lock);
    80202026:	8526                	mv	a0,s1
    80202028:	ffffe097          	auipc	ra,0xffffe
    8020202c:	6b0080e7          	jalr	1712(ra) # 802006d8 <acquire>
      pp->parent = initproc;
    80202030:	118a3783          	ld	a5,280(s4)
    80202034:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80202036:	8526                	mv	a0,s1
    80202038:	ffffe097          	auipc	ra,0xffffe
    8020203c:	6f4080e7          	jalr	1780(ra) # 8020072c <release>
    80202040:	bfe1                	j	80202018 <reparent+0x2c>
}
    80202042:	70a2                	ld	ra,40(sp)
    80202044:	7402                	ld	s0,32(sp)
    80202046:	64e2                	ld	s1,24(sp)
    80202048:	6942                	ld	s2,16(sp)
    8020204a:	69a2                	ld	s3,8(sp)
    8020204c:	6a02                	ld	s4,0(sp)
    8020204e:	6145                	addi	sp,sp,48
    80202050:	8082                	ret

0000000080202052 <scheduler>:
{
    80202052:	7119                	addi	sp,sp,-128
    80202054:	fc86                	sd	ra,120(sp)
    80202056:	f8a2                	sd	s0,112(sp)
    80202058:	f4a6                	sd	s1,104(sp)
    8020205a:	f0ca                	sd	s2,96(sp)
    8020205c:	ecce                	sd	s3,88(sp)
    8020205e:	e8d2                	sd	s4,80(sp)
    80202060:	e4d6                	sd	s5,72(sp)
    80202062:	e0da                	sd	s6,64(sp)
    80202064:	fc5e                	sd	s7,56(sp)
    80202066:	f862                	sd	s8,48(sp)
    80202068:	f466                	sd	s9,40(sp)
    8020206a:	f06a                	sd	s10,32(sp)
    8020206c:	ec6e                	sd	s11,24(sp)
    8020206e:	0100                	addi	s0,sp,128
    80202070:	8792                	mv	a5,tp
  int id = r_tp();
    80202072:	2781                	sext.w	a5,a5
  c->proc = 0;
    80202074:	00779693          	slli	a3,a5,0x7
    80202078:	00011717          	auipc	a4,0x11
    8020207c:	fe870713          	addi	a4,a4,-24 # 80213060 <pid_lock>
    80202080:	9736                	add	a4,a4,a3
    80202082:	00073c23          	sd	zero,24(a4)
      swtch(&c->context, &maxProc->context);
    80202086:	00011717          	auipc	a4,0x11
    8020208a:	ffa70713          	addi	a4,a4,-6 # 80213080 <cpus+0x8>
    8020208e:	9736                	add	a4,a4,a3
    80202090:	f8e43423          	sd	a4,-120(s0)
    struct proc *maxProc = NULL;
    80202094:	4d01                	li	s10,0
    int maxQos = -1;
    80202096:	5cfd                	li	s9,-1
    for(p = proc; p < &proc[NPROC]; p++) {
    80202098:	00016997          	auipc	s3,0x16
    8020209c:	be898993          	addi	s3,s3,-1048 # 80217c80 <bcache>
      c->proc = maxProc;
    802020a0:	00011b97          	auipc	s7,0x11
    802020a4:	fc0b8b93          	addi	s7,s7,-64 # 80213060 <pid_lock>
    802020a8:	9bb6                	add	s7,s7,a3
      w_satp(MAKE_SATP(maxProc->kpagetable));
    802020aa:	03fc9c13          	slli	s8,s9,0x3f
      w_satp(MAKE_SATP(kernel_pagetable));
    802020ae:	00008d97          	auipc	s11,0x8
    802020b2:	1d2dbd83          	ld	s11,466(s11) # 8020a280 <_GLOBAL_OFFSET_TABLE_+0x48>
    802020b6:	a06d                	j	80202160 <scheduler+0x10e>
        release(&p->lock);
    802020b8:	8526                	mv	a0,s1
    802020ba:	ffffe097          	auipc	ra,0xffffe
    802020be:	672080e7          	jalr	1650(ra) # 8020072c <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    802020c2:	18048493          	addi	s1,s1,384
    802020c6:	05348363          	beq	s1,s3,8020210c <scheduler+0xba>
      acquire(&p->lock);
    802020ca:	8526                	mv	a0,s1
    802020cc:	ffffe097          	auipc	ra,0xffffe
    802020d0:	60c080e7          	jalr	1548(ra) # 802006d8 <acquire>
      if(p->state == RUNNABLE && 10 * p->qos + (cur_tick - p->last_tick) > maxQos) {
    802020d4:	4c9c                	lw	a5,24(s1)
    802020d6:	ff2791e3          	bne	a5,s2,802020b8 <scheduler+0x66>
    802020da:	1744a703          	lw	a4,372(s1)
    802020de:	0027179b          	slliw	a5,a4,0x2
    802020e2:	9fb9                	addw	a5,a5,a4
    802020e4:	0017979b          	slliw	a5,a5,0x1
    802020e8:	1784a703          	lw	a4,376(s1)
    802020ec:	40eb073b          	subw	a4,s6,a4
    802020f0:	9fb9                	addw	a5,a5,a4
    802020f2:	fcfa53e3          	ble	a5,s4,802020b8 <scheduler+0x66>
        if(maxProc != NULL) {
    802020f6:	000a8763          	beqz	s5,80202104 <scheduler+0xb2>
          release(&maxProc->lock);
    802020fa:	8556                	mv	a0,s5
    802020fc:	ffffe097          	auipc	ra,0xffffe
    80202100:	630080e7          	jalr	1584(ra) # 8020072c <release>
        maxQos = p->qos;
    80202104:	1744aa03          	lw	s4,372(s1)
        maxProc = p;
    80202108:	8aa6                	mv	s5,s1
    8020210a:	bf65                	j	802020c2 <scheduler+0x70>
    if(maxProc != NULL) {
    8020210c:	060a8d63          	beqz	s5,80202186 <scheduler+0x134>
      maxProc->state = RUNNING;
    80202110:	478d                	li	a5,3
    80202112:	00faac23          	sw	a5,24(s5)
      c->proc = maxProc;
    80202116:	015bbc23          	sd	s5,24(s7)
      maxProc->last_tick = cur_tick; // renew the tick last time using this process
    8020211a:	176aac23          	sw	s6,376(s5)
      w_satp(MAKE_SATP(maxProc->kpagetable));
    8020211e:	058ab783          	ld	a5,88(s5)
    80202122:	83b1                	srli	a5,a5,0xc
    80202124:	0187e7b3          	or	a5,a5,s8
  asm volatile("csrw satp, %0" : : "r" (x));
    80202128:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020212c:	12000073          	sfence.vma
      swtch(&c->context, &maxProc->context);
    80202130:	068a8593          	addi	a1,s5,104
    80202134:	f8843503          	ld	a0,-120(s0)
    80202138:	00000097          	auipc	ra,0x0
    8020213c:	624080e7          	jalr	1572(ra) # 8020275c <swtch>
      w_satp(MAKE_SATP(kernel_pagetable));
    80202140:	000db783          	ld	a5,0(s11)
    80202144:	83b1                	srli	a5,a5,0xc
    80202146:	0187e7b3          	or	a5,a5,s8
  asm volatile("csrw satp, %0" : : "r" (x));
    8020214a:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    8020214e:	12000073          	sfence.vma
      c->proc = 0;
    80202152:	000bbc23          	sd	zero,24(s7)
      release(&maxProc->lock);
    80202156:	8556                	mv	a0,s5
    80202158:	ffffe097          	auipc	ra,0xffffe
    8020215c:	5d4080e7          	jalr	1492(ra) # 8020072c <release>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202160:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202164:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202168:	10079073          	csrw	sstatus,a5
    int cur_tick = get_tick();
    8020216c:	00003097          	auipc	ra,0x3
    80202170:	04e080e7          	jalr	78(ra) # 802051ba <get_tick>
    80202174:	8b2a                	mv	s6,a0
    struct proc *maxProc = NULL;
    80202176:	8aea                	mv	s5,s10
    int maxQos = -1;
    80202178:	8a66                	mv	s4,s9
    for(p = proc; p < &proc[NPROC]; p++) {
    8020217a:	00011497          	auipc	s1,0x11
    8020217e:	00648493          	addi	s1,s1,6 # 80213180 <proc>
      if(p->state == RUNNABLE && 10 * p->qos + (cur_tick - p->last_tick) > maxQos) {
    80202182:	4909                	li	s2,2
    80202184:	b799                	j	802020ca <scheduler+0x78>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202186:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8020218a:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020218e:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202192:	10500073          	wfi
    80202196:	b7e9                	j	80202160 <scheduler+0x10e>

0000000080202198 <sched>:
{
    80202198:	7179                	addi	sp,sp,-48
    8020219a:	f406                	sd	ra,40(sp)
    8020219c:	f022                	sd	s0,32(sp)
    8020219e:	ec26                	sd	s1,24(sp)
    802021a0:	e84a                	sd	s2,16(sp)
    802021a2:	e44e                	sd	s3,8(sp)
    802021a4:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    802021a6:	00000097          	auipc	ra,0x0
    802021aa:	91a080e7          	jalr	-1766(ra) # 80201ac0 <myproc>
    802021ae:	892a                	mv	s2,a0
  if(!holding(&p->lock))
    802021b0:	ffffe097          	auipc	ra,0xffffe
    802021b4:	4fa080e7          	jalr	1274(ra) # 802006aa <holding>
    802021b8:	cd25                	beqz	a0,80202230 <sched+0x98>
  asm volatile("mv %0, tp" : "=r" (x) );
    802021ba:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    802021bc:	2781                	sext.w	a5,a5
    802021be:	079e                	slli	a5,a5,0x7
    802021c0:	00011717          	auipc	a4,0x11
    802021c4:	ea070713          	addi	a4,a4,-352 # 80213060 <pid_lock>
    802021c8:	97ba                	add	a5,a5,a4
    802021ca:	0907a703          	lw	a4,144(a5)
    802021ce:	4785                	li	a5,1
    802021d0:	06f71863          	bne	a4,a5,80202240 <sched+0xa8>
  if(p->state == RUNNING)
    802021d4:	01892703          	lw	a4,24(s2)
    802021d8:	478d                	li	a5,3
    802021da:	06f70b63          	beq	a4,a5,80202250 <sched+0xb8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802021de:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    802021e2:	8b89                	andi	a5,a5,2
  if(intr_get())
    802021e4:	efb5                	bnez	a5,80202260 <sched+0xc8>
  asm volatile("mv %0, tp" : "=r" (x) );
    802021e6:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    802021e8:	00011497          	auipc	s1,0x11
    802021ec:	e7848493          	addi	s1,s1,-392 # 80213060 <pid_lock>
    802021f0:	2781                	sext.w	a5,a5
    802021f2:	079e                	slli	a5,a5,0x7
    802021f4:	97a6                	add	a5,a5,s1
    802021f6:	0947a983          	lw	s3,148(a5)
    802021fa:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    802021fc:	2781                	sext.w	a5,a5
    802021fe:	079e                	slli	a5,a5,0x7
    80202200:	00011597          	auipc	a1,0x11
    80202204:	e8058593          	addi	a1,a1,-384 # 80213080 <cpus+0x8>
    80202208:	95be                	add	a1,a1,a5
    8020220a:	06890513          	addi	a0,s2,104
    8020220e:	00000097          	auipc	ra,0x0
    80202212:	54e080e7          	jalr	1358(ra) # 8020275c <swtch>
    80202216:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    80202218:	2781                	sext.w	a5,a5
    8020221a:	079e                	slli	a5,a5,0x7
    8020221c:	97a6                	add	a5,a5,s1
    8020221e:	0937aa23          	sw	s3,148(a5)
}
    80202222:	70a2                	ld	ra,40(sp)
    80202224:	7402                	ld	s0,32(sp)
    80202226:	64e2                	ld	s1,24(sp)
    80202228:	6942                	ld	s2,16(sp)
    8020222a:	69a2                	ld	s3,8(sp)
    8020222c:	6145                	addi	sp,sp,48
    8020222e:	8082                	ret
    panic("sched p->lock");
    80202230:	00007517          	auipc	a0,0x7
    80202234:	41850513          	addi	a0,a0,1048 # 80209648 <etext+0x648>
    80202238:	ffffe097          	auipc	ra,0xffffe
    8020223c:	f0e080e7          	jalr	-242(ra) # 80200146 <panic>
    panic("sched locks");
    80202240:	00007517          	auipc	a0,0x7
    80202244:	41850513          	addi	a0,a0,1048 # 80209658 <etext+0x658>
    80202248:	ffffe097          	auipc	ra,0xffffe
    8020224c:	efe080e7          	jalr	-258(ra) # 80200146 <panic>
    panic("sched running");
    80202250:	00007517          	auipc	a0,0x7
    80202254:	41850513          	addi	a0,a0,1048 # 80209668 <etext+0x668>
    80202258:	ffffe097          	auipc	ra,0xffffe
    8020225c:	eee080e7          	jalr	-274(ra) # 80200146 <panic>
    panic("sched interruptible");
    80202260:	00007517          	auipc	a0,0x7
    80202264:	41850513          	addi	a0,a0,1048 # 80209678 <etext+0x678>
    80202268:	ffffe097          	auipc	ra,0xffffe
    8020226c:	ede080e7          	jalr	-290(ra) # 80200146 <panic>

0000000080202270 <exit>:
{
    80202270:	7179                	addi	sp,sp,-48
    80202272:	f406                	sd	ra,40(sp)
    80202274:	f022                	sd	s0,32(sp)
    80202276:	ec26                	sd	s1,24(sp)
    80202278:	e84a                	sd	s2,16(sp)
    8020227a:	e44e                	sd	s3,8(sp)
    8020227c:	e052                	sd	s4,0(sp)
    8020227e:	1800                	addi	s0,sp,48
    80202280:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    80202282:	00000097          	auipc	ra,0x0
    80202286:	83e080e7          	jalr	-1986(ra) # 80201ac0 <myproc>
    8020228a:	89aa                	mv	s3,a0
  if(p == initproc)
    8020228c:	00011797          	auipc	a5,0x11
    80202290:	dd478793          	addi	a5,a5,-556 # 80213060 <pid_lock>
    80202294:	1187b783          	ld	a5,280(a5)
    80202298:	0d850493          	addi	s1,a0,216
    8020229c:	15850913          	addi	s2,a0,344
    802022a0:	02a79363          	bne	a5,a0,802022c6 <exit+0x56>
    panic("init exiting");
    802022a4:	00007517          	auipc	a0,0x7
    802022a8:	3ec50513          	addi	a0,a0,1004 # 80209690 <etext+0x690>
    802022ac:	ffffe097          	auipc	ra,0xffffe
    802022b0:	e9a080e7          	jalr	-358(ra) # 80200146 <panic>
      fileclose(f);
    802022b4:	00001097          	auipc	ra,0x1
    802022b8:	6ea080e7          	jalr	1770(ra) # 8020399e <fileclose>
      p->ofile[fd] = 0;
    802022bc:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    802022c0:	04a1                	addi	s1,s1,8
    802022c2:	01248563          	beq	s1,s2,802022cc <exit+0x5c>
    if(p->ofile[fd]){
    802022c6:	6088                	ld	a0,0(s1)
    802022c8:	f575                	bnez	a0,802022b4 <exit+0x44>
    802022ca:	bfdd                	j	802022c0 <exit+0x50>
  eput(p->cwd);
    802022cc:	1589b503          	ld	a0,344(s3)
    802022d0:	00004097          	auipc	ra,0x4
    802022d4:	164080e7          	jalr	356(ra) # 80206434 <eput>
  p->cwd = 0;
    802022d8:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    802022dc:	00011497          	auipc	s1,0x11
    802022e0:	d8448493          	addi	s1,s1,-636 # 80213060 <pid_lock>
    802022e4:	1184b503          	ld	a0,280(s1)
    802022e8:	ffffe097          	auipc	ra,0xffffe
    802022ec:	3f0080e7          	jalr	1008(ra) # 802006d8 <acquire>
  wakeup1(initproc);
    802022f0:	1184b503          	ld	a0,280(s1)
    802022f4:	fffff097          	auipc	ra,0xfffff
    802022f8:	5e0080e7          	jalr	1504(ra) # 802018d4 <wakeup1>
  release(&initproc->lock);
    802022fc:	1184b503          	ld	a0,280(s1)
    80202300:	ffffe097          	auipc	ra,0xffffe
    80202304:	42c080e7          	jalr	1068(ra) # 8020072c <release>
  acquire(&p->lock);
    80202308:	854e                	mv	a0,s3
    8020230a:	ffffe097          	auipc	ra,0xffffe
    8020230e:	3ce080e7          	jalr	974(ra) # 802006d8 <acquire>
  struct proc *original_parent = p->parent;
    80202312:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    80202316:	854e                	mv	a0,s3
    80202318:	ffffe097          	auipc	ra,0xffffe
    8020231c:	414080e7          	jalr	1044(ra) # 8020072c <release>
  acquire(&original_parent->lock);
    80202320:	8526                	mv	a0,s1
    80202322:	ffffe097          	auipc	ra,0xffffe
    80202326:	3b6080e7          	jalr	950(ra) # 802006d8 <acquire>
  acquire(&p->lock);
    8020232a:	854e                	mv	a0,s3
    8020232c:	ffffe097          	auipc	ra,0xffffe
    80202330:	3ac080e7          	jalr	940(ra) # 802006d8 <acquire>
  reparent(p);
    80202334:	854e                	mv	a0,s3
    80202336:	00000097          	auipc	ra,0x0
    8020233a:	cb6080e7          	jalr	-842(ra) # 80201fec <reparent>
  wakeup1(original_parent);
    8020233e:	8526                	mv	a0,s1
    80202340:	fffff097          	auipc	ra,0xfffff
    80202344:	594080e7          	jalr	1428(ra) # 802018d4 <wakeup1>
  p->xstate = status;
    80202348:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    8020234c:	4791                	li	a5,4
    8020234e:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    80202352:	8526                	mv	a0,s1
    80202354:	ffffe097          	auipc	ra,0xffffe
    80202358:	3d8080e7          	jalr	984(ra) # 8020072c <release>
  sched();
    8020235c:	00000097          	auipc	ra,0x0
    80202360:	e3c080e7          	jalr	-452(ra) # 80202198 <sched>
  panic("zombie exit");
    80202364:	00007517          	auipc	a0,0x7
    80202368:	33c50513          	addi	a0,a0,828 # 802096a0 <etext+0x6a0>
    8020236c:	ffffe097          	auipc	ra,0xffffe
    80202370:	dda080e7          	jalr	-550(ra) # 80200146 <panic>

0000000080202374 <yield>:
{
    80202374:	1101                	addi	sp,sp,-32
    80202376:	ec06                	sd	ra,24(sp)
    80202378:	e822                	sd	s0,16(sp)
    8020237a:	e426                	sd	s1,8(sp)
    8020237c:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    8020237e:	fffff097          	auipc	ra,0xfffff
    80202382:	742080e7          	jalr	1858(ra) # 80201ac0 <myproc>
    80202386:	84aa                	mv	s1,a0
  acquire(&p->lock);
    80202388:	ffffe097          	auipc	ra,0xffffe
    8020238c:	350080e7          	jalr	848(ra) # 802006d8 <acquire>
  p->state = RUNNABLE;
    80202390:	4789                	li	a5,2
    80202392:	cc9c                	sw	a5,24(s1)
  sched();
    80202394:	00000097          	auipc	ra,0x0
    80202398:	e04080e7          	jalr	-508(ra) # 80202198 <sched>
  release(&p->lock);
    8020239c:	8526                	mv	a0,s1
    8020239e:	ffffe097          	auipc	ra,0xffffe
    802023a2:	38e080e7          	jalr	910(ra) # 8020072c <release>
}
    802023a6:	60e2                	ld	ra,24(sp)
    802023a8:	6442                	ld	s0,16(sp)
    802023aa:	64a2                	ld	s1,8(sp)
    802023ac:	6105                	addi	sp,sp,32
    802023ae:	8082                	ret

00000000802023b0 <sleep>:
{
    802023b0:	7179                	addi	sp,sp,-48
    802023b2:	f406                	sd	ra,40(sp)
    802023b4:	f022                	sd	s0,32(sp)
    802023b6:	ec26                	sd	s1,24(sp)
    802023b8:	e84a                	sd	s2,16(sp)
    802023ba:	e44e                	sd	s3,8(sp)
    802023bc:	1800                	addi	s0,sp,48
    802023be:	89aa                	mv	s3,a0
    802023c0:	892e                	mv	s2,a1
  struct proc *p = myproc();
    802023c2:	fffff097          	auipc	ra,0xfffff
    802023c6:	6fe080e7          	jalr	1790(ra) # 80201ac0 <myproc>
    802023ca:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    802023cc:	05250663          	beq	a0,s2,80202418 <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    802023d0:	ffffe097          	auipc	ra,0xffffe
    802023d4:	308080e7          	jalr	776(ra) # 802006d8 <acquire>
    release(lk);
    802023d8:	854a                	mv	a0,s2
    802023da:	ffffe097          	auipc	ra,0xffffe
    802023de:	352080e7          	jalr	850(ra) # 8020072c <release>
  p->chan = chan;
    802023e2:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    802023e6:	4785                	li	a5,1
    802023e8:	cc9c                	sw	a5,24(s1)
  sched();
    802023ea:	00000097          	auipc	ra,0x0
    802023ee:	dae080e7          	jalr	-594(ra) # 80202198 <sched>
  p->chan = 0;
    802023f2:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    802023f6:	8526                	mv	a0,s1
    802023f8:	ffffe097          	auipc	ra,0xffffe
    802023fc:	334080e7          	jalr	820(ra) # 8020072c <release>
    acquire(lk);
    80202400:	854a                	mv	a0,s2
    80202402:	ffffe097          	auipc	ra,0xffffe
    80202406:	2d6080e7          	jalr	726(ra) # 802006d8 <acquire>
}
    8020240a:	70a2                	ld	ra,40(sp)
    8020240c:	7402                	ld	s0,32(sp)
    8020240e:	64e2                	ld	s1,24(sp)
    80202410:	6942                	ld	s2,16(sp)
    80202412:	69a2                	ld	s3,8(sp)
    80202414:	6145                	addi	sp,sp,48
    80202416:	8082                	ret
  p->chan = chan;
    80202418:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    8020241c:	4785                	li	a5,1
    8020241e:	cd1c                	sw	a5,24(a0)
  sched();
    80202420:	00000097          	auipc	ra,0x0
    80202424:	d78080e7          	jalr	-648(ra) # 80202198 <sched>
  p->chan = 0;
    80202428:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    8020242c:	bff9                	j	8020240a <sleep+0x5a>

000000008020242e <wait>:
{
    8020242e:	715d                	addi	sp,sp,-80
    80202430:	e486                	sd	ra,72(sp)
    80202432:	e0a2                	sd	s0,64(sp)
    80202434:	fc26                	sd	s1,56(sp)
    80202436:	f84a                	sd	s2,48(sp)
    80202438:	f44e                	sd	s3,40(sp)
    8020243a:	f052                	sd	s4,32(sp)
    8020243c:	ec56                	sd	s5,24(sp)
    8020243e:	e85a                	sd	s6,16(sp)
    80202440:	e45e                	sd	s7,8(sp)
    80202442:	e062                	sd	s8,0(sp)
    80202444:	0880                	addi	s0,sp,80
    80202446:	8baa                	mv	s7,a0
  struct proc *p = myproc();
    80202448:	fffff097          	auipc	ra,0xfffff
    8020244c:	678080e7          	jalr	1656(ra) # 80201ac0 <myproc>
    80202450:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202452:	8c2a                	mv	s8,a0
    80202454:	ffffe097          	auipc	ra,0xffffe
    80202458:	284080e7          	jalr	644(ra) # 802006d8 <acquire>
    havekids = 0;
    8020245c:	4b01                	li	s6,0
        if(np->state == ZOMBIE){
    8020245e:	4a11                	li	s4,4
    for(np = proc; np < &proc[NPROC]; np++){
    80202460:	00016997          	auipc	s3,0x16
    80202464:	82098993          	addi	s3,s3,-2016 # 80217c80 <bcache>
        havekids = 1;
    80202468:	4a85                	li	s5,1
    havekids = 0;
    8020246a:	875a                	mv	a4,s6
    for(np = proc; np < &proc[NPROC]; np++){
    8020246c:	00011497          	auipc	s1,0x11
    80202470:	d1448493          	addi	s1,s1,-748 # 80213180 <proc>
    80202474:	a8b9                	j	802024d2 <wait+0xa4>
          pid = np->pid;
    80202476:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    8020247a:	000b8c63          	beqz	s7,80202492 <wait+0x64>
    8020247e:	4611                	li	a2,4
    80202480:	03448593          	addi	a1,s1,52
    80202484:	855e                	mv	a0,s7
    80202486:	fffff097          	auipc	ra,0xfffff
    8020248a:	f3c080e7          	jalr	-196(ra) # 802013c2 <copyout2>
    8020248e:	02054263          	bltz	a0,802024b2 <wait+0x84>
          freeproc(np);
    80202492:	8526                	mv	a0,s1
    80202494:	00000097          	auipc	ra,0x0
    80202498:	800080e7          	jalr	-2048(ra) # 80201c94 <freeproc>
          release(&np->lock);
    8020249c:	8526                	mv	a0,s1
    8020249e:	ffffe097          	auipc	ra,0xffffe
    802024a2:	28e080e7          	jalr	654(ra) # 8020072c <release>
          release(&p->lock);
    802024a6:	854a                	mv	a0,s2
    802024a8:	ffffe097          	auipc	ra,0xffffe
    802024ac:	284080e7          	jalr	644(ra) # 8020072c <release>
          return pid;
    802024b0:	a8a9                	j	8020250a <wait+0xdc>
            release(&np->lock);
    802024b2:	8526                	mv	a0,s1
    802024b4:	ffffe097          	auipc	ra,0xffffe
    802024b8:	278080e7          	jalr	632(ra) # 8020072c <release>
            release(&p->lock);
    802024bc:	854a                	mv	a0,s2
    802024be:	ffffe097          	auipc	ra,0xffffe
    802024c2:	26e080e7          	jalr	622(ra) # 8020072c <release>
            return -1;
    802024c6:	59fd                	li	s3,-1
    802024c8:	a089                	j	8020250a <wait+0xdc>
    for(np = proc; np < &proc[NPROC]; np++){
    802024ca:	18048493          	addi	s1,s1,384
    802024ce:	03348463          	beq	s1,s3,802024f6 <wait+0xc8>
      if(np->parent == p){
    802024d2:	709c                	ld	a5,32(s1)
    802024d4:	ff279be3          	bne	a5,s2,802024ca <wait+0x9c>
        acquire(&np->lock);
    802024d8:	8526                	mv	a0,s1
    802024da:	ffffe097          	auipc	ra,0xffffe
    802024de:	1fe080e7          	jalr	510(ra) # 802006d8 <acquire>
        if(np->state == ZOMBIE){
    802024e2:	4c9c                	lw	a5,24(s1)
    802024e4:	f94789e3          	beq	a5,s4,80202476 <wait+0x48>
        release(&np->lock);
    802024e8:	8526                	mv	a0,s1
    802024ea:	ffffe097          	auipc	ra,0xffffe
    802024ee:	242080e7          	jalr	578(ra) # 8020072c <release>
        havekids = 1;
    802024f2:	8756                	mv	a4,s5
    802024f4:	bfd9                	j	802024ca <wait+0x9c>
    if(!havekids || p->killed){
    802024f6:	c701                	beqz	a4,802024fe <wait+0xd0>
    802024f8:	03092783          	lw	a5,48(s2)
    802024fc:	c785                	beqz	a5,80202524 <wait+0xf6>
      release(&p->lock);
    802024fe:	854a                	mv	a0,s2
    80202500:	ffffe097          	auipc	ra,0xffffe
    80202504:	22c080e7          	jalr	556(ra) # 8020072c <release>
      return -1;
    80202508:	59fd                	li	s3,-1
}
    8020250a:	854e                	mv	a0,s3
    8020250c:	60a6                	ld	ra,72(sp)
    8020250e:	6406                	ld	s0,64(sp)
    80202510:	74e2                	ld	s1,56(sp)
    80202512:	7942                	ld	s2,48(sp)
    80202514:	79a2                	ld	s3,40(sp)
    80202516:	7a02                	ld	s4,32(sp)
    80202518:	6ae2                	ld	s5,24(sp)
    8020251a:	6b42                	ld	s6,16(sp)
    8020251c:	6ba2                	ld	s7,8(sp)
    8020251e:	6c02                	ld	s8,0(sp)
    80202520:	6161                	addi	sp,sp,80
    80202522:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    80202524:	85e2                	mv	a1,s8
    80202526:	854a                	mv	a0,s2
    80202528:	00000097          	auipc	ra,0x0
    8020252c:	e88080e7          	jalr	-376(ra) # 802023b0 <sleep>
    havekids = 0;
    80202530:	bf2d                	j	8020246a <wait+0x3c>

0000000080202532 <wakeup>:
{
    80202532:	7139                	addi	sp,sp,-64
    80202534:	fc06                	sd	ra,56(sp)
    80202536:	f822                	sd	s0,48(sp)
    80202538:	f426                	sd	s1,40(sp)
    8020253a:	f04a                	sd	s2,32(sp)
    8020253c:	ec4e                	sd	s3,24(sp)
    8020253e:	e852                	sd	s4,16(sp)
    80202540:	e456                	sd	s5,8(sp)
    80202542:	0080                	addi	s0,sp,64
    80202544:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    80202546:	00011497          	auipc	s1,0x11
    8020254a:	c3a48493          	addi	s1,s1,-966 # 80213180 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    8020254e:	4985                	li	s3,1
      p->state = RUNNABLE;
    80202550:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    80202552:	00015917          	auipc	s2,0x15
    80202556:	72e90913          	addi	s2,s2,1838 # 80217c80 <bcache>
    8020255a:	a821                	j	80202572 <wakeup+0x40>
      p->state = RUNNABLE;
    8020255c:	0154ac23          	sw	s5,24(s1)
    release(&p->lock);
    80202560:	8526                	mv	a0,s1
    80202562:	ffffe097          	auipc	ra,0xffffe
    80202566:	1ca080e7          	jalr	458(ra) # 8020072c <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    8020256a:	18048493          	addi	s1,s1,384
    8020256e:	01248e63          	beq	s1,s2,8020258a <wakeup+0x58>
    acquire(&p->lock);
    80202572:	8526                	mv	a0,s1
    80202574:	ffffe097          	auipc	ra,0xffffe
    80202578:	164080e7          	jalr	356(ra) # 802006d8 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    8020257c:	4c9c                	lw	a5,24(s1)
    8020257e:	ff3791e3          	bne	a5,s3,80202560 <wakeup+0x2e>
    80202582:	749c                	ld	a5,40(s1)
    80202584:	fd479ee3          	bne	a5,s4,80202560 <wakeup+0x2e>
    80202588:	bfd1                	j	8020255c <wakeup+0x2a>
}
    8020258a:	70e2                	ld	ra,56(sp)
    8020258c:	7442                	ld	s0,48(sp)
    8020258e:	74a2                	ld	s1,40(sp)
    80202590:	7902                	ld	s2,32(sp)
    80202592:	69e2                	ld	s3,24(sp)
    80202594:	6a42                	ld	s4,16(sp)
    80202596:	6aa2                	ld	s5,8(sp)
    80202598:	6121                	addi	sp,sp,64
    8020259a:	8082                	ret

000000008020259c <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8020259c:	7179                	addi	sp,sp,-48
    8020259e:	f406                	sd	ra,40(sp)
    802025a0:	f022                	sd	s0,32(sp)
    802025a2:	ec26                	sd	s1,24(sp)
    802025a4:	e84a                	sd	s2,16(sp)
    802025a6:	e44e                	sd	s3,8(sp)
    802025a8:	1800                	addi	s0,sp,48
    802025aa:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    802025ac:	00011497          	auipc	s1,0x11
    802025b0:	bd448493          	addi	s1,s1,-1068 # 80213180 <proc>
    802025b4:	00015997          	auipc	s3,0x15
    802025b8:	6cc98993          	addi	s3,s3,1740 # 80217c80 <bcache>
    acquire(&p->lock);
    802025bc:	8526                	mv	a0,s1
    802025be:	ffffe097          	auipc	ra,0xffffe
    802025c2:	11a080e7          	jalr	282(ra) # 802006d8 <acquire>
    if(p->pid == pid){
    802025c6:	5c9c                	lw	a5,56(s1)
    802025c8:	01278d63          	beq	a5,s2,802025e2 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    802025cc:	8526                	mv	a0,s1
    802025ce:	ffffe097          	auipc	ra,0xffffe
    802025d2:	15e080e7          	jalr	350(ra) # 8020072c <release>
  for(p = proc; p < &proc[NPROC]; p++){
    802025d6:	18048493          	addi	s1,s1,384
    802025da:	ff3491e3          	bne	s1,s3,802025bc <kill+0x20>
  }
  return -1;
    802025de:	557d                	li	a0,-1
    802025e0:	a829                	j	802025fa <kill+0x5e>
      p->killed = 1;
    802025e2:	4785                	li	a5,1
    802025e4:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    802025e6:	4c98                	lw	a4,24(s1)
    802025e8:	4785                	li	a5,1
    802025ea:	00f70f63          	beq	a4,a5,80202608 <kill+0x6c>
      release(&p->lock);
    802025ee:	8526                	mv	a0,s1
    802025f0:	ffffe097          	auipc	ra,0xffffe
    802025f4:	13c080e7          	jalr	316(ra) # 8020072c <release>
      return 0;
    802025f8:	4501                	li	a0,0
}
    802025fa:	70a2                	ld	ra,40(sp)
    802025fc:	7402                	ld	s0,32(sp)
    802025fe:	64e2                	ld	s1,24(sp)
    80202600:	6942                	ld	s2,16(sp)
    80202602:	69a2                	ld	s3,8(sp)
    80202604:	6145                	addi	sp,sp,48
    80202606:	8082                	ret
        p->state = RUNNABLE;
    80202608:	4789                	li	a5,2
    8020260a:	cc9c                	sw	a5,24(s1)
    8020260c:	b7cd                	j	802025ee <kill+0x52>

000000008020260e <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    8020260e:	1101                	addi	sp,sp,-32
    80202610:	ec06                	sd	ra,24(sp)
    80202612:	e822                	sd	s0,16(sp)
    80202614:	e426                	sd	s1,8(sp)
    80202616:	1000                	addi	s0,sp,32
    80202618:	84aa                	mv	s1,a0
    8020261a:	852e                	mv	a0,a1
    8020261c:	85b2                	mv	a1,a2
  // struct proc *p = myproc();
  if(user_dst){
    8020261e:	c899                	beqz	s1,80202634 <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    80202620:	8636                	mv	a2,a3
    80202622:	fffff097          	auipc	ra,0xfffff
    80202626:	da0080e7          	jalr	-608(ra) # 802013c2 <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    8020262a:	60e2                	ld	ra,24(sp)
    8020262c:	6442                	ld	s0,16(sp)
    8020262e:	64a2                	ld	s1,8(sp)
    80202630:	6105                	addi	sp,sp,32
    80202632:	8082                	ret
    memmove((char *)dst, src, len);
    80202634:	0006861b          	sext.w	a2,a3
    80202638:	ffffe097          	auipc	ra,0xffffe
    8020263c:	1a8080e7          	jalr	424(ra) # 802007e0 <memmove>
    return 0;
    80202640:	8526                	mv	a0,s1
    80202642:	b7e5                	j	8020262a <either_copyout+0x1c>

0000000080202644 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80202644:	1101                	addi	sp,sp,-32
    80202646:	ec06                	sd	ra,24(sp)
    80202648:	e822                	sd	s0,16(sp)
    8020264a:	e426                	sd	s1,8(sp)
    8020264c:	1000                	addi	s0,sp,32
    8020264e:	84ae                	mv	s1,a1
    80202650:	85b2                	mv	a1,a2
  // struct proc *p = myproc();
  if(user_src){
    80202652:	c899                	beqz	s1,80202668 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    80202654:	8636                	mv	a2,a3
    80202656:	fffff097          	auipc	ra,0xfffff
    8020265a:	e4c080e7          	jalr	-436(ra) # 802014a2 <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    8020265e:	60e2                	ld	ra,24(sp)
    80202660:	6442                	ld	s0,16(sp)
    80202662:	64a2                	ld	s1,8(sp)
    80202664:	6105                	addi	sp,sp,32
    80202666:	8082                	ret
    memmove(dst, (char*)src, len);
    80202668:	0006861b          	sext.w	a2,a3
    8020266c:	ffffe097          	auipc	ra,0xffffe
    80202670:	174080e7          	jalr	372(ra) # 802007e0 <memmove>
    return 0;
    80202674:	8526                	mv	a0,s1
    80202676:	b7e5                	j	8020265e <either_copyin+0x1a>

0000000080202678 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80202678:	715d                	addi	sp,sp,-80
    8020267a:	e486                	sd	ra,72(sp)
    8020267c:	e0a2                	sd	s0,64(sp)
    8020267e:	fc26                	sd	s1,56(sp)
    80202680:	f84a                	sd	s2,48(sp)
    80202682:	f44e                	sd	s3,40(sp)
    80202684:	f052                	sd	s4,32(sp)
    80202686:	ec56                	sd	s5,24(sp)
    80202688:	e85a                	sd	s6,16(sp)
    8020268a:	e45e                	sd	s7,8(sp)
    8020268c:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    8020268e:	00007517          	auipc	a0,0x7
    80202692:	02a50513          	addi	a0,a0,42 # 802096b8 <etext+0x6b8>
    80202696:	ffffe097          	auipc	ra,0xffffe
    8020269a:	afa080e7          	jalr	-1286(ra) # 80200190 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8020269e:	00011497          	auipc	s1,0x11
    802026a2:	c4248493          	addi	s1,s1,-958 # 802132e0 <proc+0x160>
    802026a6:	00015917          	auipc	s2,0x15
    802026aa:	73a90913          	addi	s2,s2,1850 # 80217de0 <bcache+0x160>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026ae:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    802026b0:	00007997          	auipc	s3,0x7
    802026b4:	00098993          	mv	s3,s3
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802026b8:	00007a97          	auipc	s5,0x7
    802026bc:	018a8a93          	addi	s5,s5,24 # 802096d0 <etext+0x6d0>
    printf("\n");
    802026c0:	00007a17          	auipc	s4,0x7
    802026c4:	a30a0a13          	addi	s4,s4,-1488 # 802090f0 <etext+0xf0>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026c8:	00008b97          	auipc	s7,0x8
    802026cc:	978b8b93          	addi	s7,s7,-1672 # 8020a040 <states.1751>
    802026d0:	a025                	j	802026f8 <procdump+0x80>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    802026d2:	ee85b703          	ld	a4,-280(a1)
    802026d6:	86ae                	mv	a3,a1
    802026d8:	ed85a583          	lw	a1,-296(a1)
    802026dc:	8556                	mv	a0,s5
    802026de:	ffffe097          	auipc	ra,0xffffe
    802026e2:	ab2080e7          	jalr	-1358(ra) # 80200190 <printf>
    printf("\n");
    802026e6:	8552                	mv	a0,s4
    802026e8:	ffffe097          	auipc	ra,0xffffe
    802026ec:	aa8080e7          	jalr	-1368(ra) # 80200190 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    802026f0:	18048493          	addi	s1,s1,384
    802026f4:	03248163          	beq	s1,s2,80202716 <procdump+0x9e>
    if(p->state == UNUSED)
    802026f8:	85a6                	mv	a1,s1
    802026fa:	eb84a783          	lw	a5,-328(s1)
    802026fe:	dbed                	beqz	a5,802026f0 <procdump+0x78>
      state = "???";
    80202700:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202702:	fcfb68e3          	bltu	s6,a5,802026d2 <procdump+0x5a>
    80202706:	1782                	slli	a5,a5,0x20
    80202708:	9381                	srli	a5,a5,0x20
    8020270a:	078e                	slli	a5,a5,0x3
    8020270c:	97de                	add	a5,a5,s7
    8020270e:	6390                	ld	a2,0(a5)
    80202710:	f269                	bnez	a2,802026d2 <procdump+0x5a>
      state = "???";
    80202712:	864e                	mv	a2,s3
    80202714:	bf7d                	j	802026d2 <procdump+0x5a>
  }
}
    80202716:	60a6                	ld	ra,72(sp)
    80202718:	6406                	ld	s0,64(sp)
    8020271a:	74e2                	ld	s1,56(sp)
    8020271c:	7942                	ld	s2,48(sp)
    8020271e:	79a2                	ld	s3,40(sp)
    80202720:	7a02                	ld	s4,32(sp)
    80202722:	6ae2                	ld	s5,24(sp)
    80202724:	6b42                	ld	s6,16(sp)
    80202726:	6ba2                	ld	s7,8(sp)
    80202728:	6161                	addi	sp,sp,80
    8020272a:	8082                	ret

000000008020272c <procnum>:

uint64
procnum(void)
{
    8020272c:	1141                	addi	sp,sp,-16
    8020272e:	e422                	sd	s0,8(sp)
    80202730:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    80202732:	00011797          	auipc	a5,0x11
    80202736:	a4e78793          	addi	a5,a5,-1458 # 80213180 <proc>
  int num = 0;
    8020273a:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    8020273c:	00015697          	auipc	a3,0x15
    80202740:	54468693          	addi	a3,a3,1348 # 80217c80 <bcache>
    80202744:	a029                	j	8020274e <procnum+0x22>
    80202746:	18078793          	addi	a5,a5,384
    8020274a:	00d78663          	beq	a5,a3,80202756 <procnum+0x2a>
    if (p->state != UNUSED) {
    8020274e:	4f98                	lw	a4,24(a5)
    80202750:	db7d                	beqz	a4,80202746 <procnum+0x1a>
      num++;
    80202752:	2505                	addiw	a0,a0,1
    80202754:	bfcd                	j	80202746 <procnum+0x1a>
    }
  }

  return num;
}
    80202756:	6422                	ld	s0,8(sp)
    80202758:	0141                	addi	sp,sp,16
    8020275a:	8082                	ret

000000008020275c <swtch>:
    8020275c:	00153023          	sd	ra,0(a0)
    80202760:	00253423          	sd	sp,8(a0)
    80202764:	e900                	sd	s0,16(a0)
    80202766:	ed04                	sd	s1,24(a0)
    80202768:	03253023          	sd	s2,32(a0)
    8020276c:	03353423          	sd	s3,40(a0)
    80202770:	03453823          	sd	s4,48(a0)
    80202774:	03553c23          	sd	s5,56(a0)
    80202778:	05653023          	sd	s6,64(a0)
    8020277c:	05753423          	sd	s7,72(a0)
    80202780:	05853823          	sd	s8,80(a0)
    80202784:	05953c23          	sd	s9,88(a0)
    80202788:	07a53023          	sd	s10,96(a0)
    8020278c:	07b53423          	sd	s11,104(a0)
    80202790:	0005b083          	ld	ra,0(a1)
    80202794:	0085b103          	ld	sp,8(a1)
    80202798:	6980                	ld	s0,16(a1)
    8020279a:	6d84                	ld	s1,24(a1)
    8020279c:	0205b903          	ld	s2,32(a1)
    802027a0:	0285b983          	ld	s3,40(a1)
    802027a4:	0305ba03          	ld	s4,48(a1)
    802027a8:	0385ba83          	ld	s5,56(a1)
    802027ac:	0405bb03          	ld	s6,64(a1)
    802027b0:	0485bb83          	ld	s7,72(a1)
    802027b4:	0505bc03          	ld	s8,80(a1)
    802027b8:	0585bc83          	ld	s9,88(a1)
    802027bc:	0605bd03          	ld	s10,96(a1)
    802027c0:	0685bd83          	ld	s11,104(a1)
    802027c4:	8082                	ret

00000000802027c6 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    802027c6:	1141                	addi	sp,sp,-16
    802027c8:	e406                	sd	ra,8(sp)
    802027ca:	e022                	sd	s0,0(sp)
    802027cc:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    802027ce:	00008797          	auipc	a5,0x8
    802027d2:	a827b783          	ld	a5,-1406(a5) # 8020a250 <_GLOBAL_OFFSET_TABLE_+0x18>
    802027d6:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802027da:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802027de:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802027e2:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    802027e6:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    802027ea:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    802027ee:	10479073          	csrw	sie,a5
  set_next_timeout();
    802027f2:	00003097          	auipc	ra,0x3
    802027f6:	954080e7          	jalr	-1708(ra) # 80205146 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
  #endif
}
    802027fa:	60a2                	ld	ra,8(sp)
    802027fc:	6402                	ld	s0,0(sp)
    802027fe:	0141                	addi	sp,sp,16
    80202800:	8082                	ret

0000000080202802 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80202802:	1141                	addi	sp,sp,-16
    80202804:	e406                	sd	ra,8(sp)
    80202806:	e022                	sd	s0,0(sp)
    80202808:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    8020280a:	fffff097          	auipc	ra,0xfffff
    8020280e:	2b6080e7          	jalr	694(ra) # 80201ac0 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202812:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202816:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202818:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    8020281c:	00008617          	auipc	a2,0x8
    80202820:	a2463603          	ld	a2,-1500(a2) # 8020a240 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202824:	00008697          	auipc	a3,0x8
    80202828:	a4c6b683          	ld	a3,-1460(a3) # 8020a270 <_GLOBAL_OFFSET_TABLE_+0x38>
    8020282c:	8e91                	sub	a3,a3,a2
    8020282e:	040007b7          	lui	a5,0x4000
    80202832:	17fd                	addi	a5,a5,-1
    80202834:	07b2                	slli	a5,a5,0xc
    80202836:	96be                	add	a3,a3,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202838:	10569073          	csrw	stvec,a3

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    8020283c:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    8020283e:	180026f3          	csrr	a3,satp
    80202842:	e314                	sd	a3,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202844:	7138                	ld	a4,96(a0)
    80202846:	6134                	ld	a3,64(a0)
    80202848:	6585                	lui	a1,0x1
    8020284a:	96ae                	add	a3,a3,a1
    8020284c:	e714                	sd	a3,8(a4)
  p->trapframe->kernel_trap = (uint64)usertrap;
    8020284e:	7138                	ld	a4,96(a0)
    80202850:	00000697          	auipc	a3,0x0
    80202854:	0f468693          	addi	a3,a3,244 # 80202944 <usertrap>
    80202858:	eb14                	sd	a3,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    8020285a:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    8020285c:	8692                	mv	a3,tp
    8020285e:	f314                	sd	a3,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202860:	100026f3          	csrr	a3,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202864:	eff6f693          	andi	a3,a3,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202868:	0206e693          	ori	a3,a3,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020286c:	10069073          	csrw	sstatus,a3
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202870:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202872:	6f18                	ld	a4,24(a4)
    80202874:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    80202878:	692c                	ld	a1,80(a0)
    8020287a:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    8020287c:	00008717          	auipc	a4,0x8
    80202880:	9cc73703          	ld	a4,-1588(a4) # 8020a248 <_GLOBAL_OFFSET_TABLE_+0x10>
    80202884:	8f11                	sub	a4,a4,a2
    80202886:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202888:	577d                	li	a4,-1
    8020288a:	177e                	slli	a4,a4,0x3f
    8020288c:	8dd9                	or	a1,a1,a4
    8020288e:	02000537          	lui	a0,0x2000
    80202892:	157d                	addi	a0,a0,-1
    80202894:	0536                	slli	a0,a0,0xd
    80202896:	9782                	jalr	a5
}
    80202898:	60a2                	ld	ra,8(sp)
    8020289a:	6402                	ld	s0,0(sp)
    8020289c:	0141                	addi	sp,sp,16
    8020289e:	8082                	ret

00000000802028a0 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    802028a0:	1101                	addi	sp,sp,-32
    802028a2:	ec06                	sd	ra,24(sp)
    802028a4:	e822                	sd	s0,16(sp)
    802028a6:	e426                	sd	s1,8(sp)
    802028a8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    802028aa:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802028ae:	00074d63          	bltz	a4,802028c8 <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    802028b2:	57fd                	li	a5,-1
    802028b4:	17fe                	slli	a5,a5,0x3f
    802028b6:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    802028b8:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    802028ba:	06f70f63          	beq	a4,a5,80202938 <devintr+0x98>
}
    802028be:	60e2                	ld	ra,24(sp)
    802028c0:	6442                	ld	s0,16(sp)
    802028c2:	64a2                	ld	s1,8(sp)
    802028c4:	6105                	addi	sp,sp,32
    802028c6:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    802028c8:	0ff77793          	andi	a5,a4,255
    802028cc:	46a5                	li	a3,9
    802028ce:	fed792e3          	bne	a5,a3,802028b2 <devintr+0x12>
		int irq = plic_claim();
    802028d2:	00004097          	auipc	ra,0x4
    802028d6:	322080e7          	jalr	802(ra) # 80206bf4 <plic_claim>
    802028da:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    802028dc:	47a9                	li	a5,10
    802028de:	02f50163          	beq	a0,a5,80202900 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    802028e2:	4785                	li	a5,1
    802028e4:	04f50563          	beq	a0,a5,8020292e <devintr+0x8e>
		return 1;
    802028e8:	4505                	li	a0,1
		else if (irq) {
    802028ea:	d8f1                	beqz	s1,802028be <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    802028ec:	85a6                	mv	a1,s1
    802028ee:	00007517          	auipc	a0,0x7
    802028f2:	e1a50513          	addi	a0,a0,-486 # 80209708 <etext+0x708>
    802028f6:	ffffe097          	auipc	ra,0xffffe
    802028fa:	89a080e7          	jalr	-1894(ra) # 80200190 <printf>
    802028fe:	a821                	j	80202916 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202900:	4501                	li	a0,0
    80202902:	4581                	li	a1,0
    80202904:	4601                	li	a2,0
    80202906:	4681                	li	a3,0
    80202908:	4889                	li	a7,2
    8020290a:	00000073          	ecall
    8020290e:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202910:	57fd                	li	a5,-1
    80202912:	00f51963          	bne	a0,a5,80202924 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202916:	8526                	mv	a0,s1
    80202918:	00004097          	auipc	ra,0x4
    8020291c:	306080e7          	jalr	774(ra) # 80206c1e <plic_complete>
		return 1;
    80202920:	4505                	li	a0,1
    80202922:	bf71                	j	802028be <devintr+0x1e>
				consoleintr(c);
    80202924:	00004097          	auipc	ra,0x4
    80202928:	516080e7          	jalr	1302(ra) # 80206e3a <consoleintr>
    8020292c:	b7ed                	j	80202916 <devintr+0x76>
			disk_intr();
    8020292e:	00003097          	auipc	ra,0x3
    80202932:	8ee080e7          	jalr	-1810(ra) # 8020521c <disk_intr>
    80202936:	b7c5                	j	80202916 <devintr+0x76>
		timer_tick();
    80202938:	00003097          	auipc	ra,0x3
    8020293c:	834080e7          	jalr	-1996(ra) # 8020516c <timer_tick>
		return 2;
    80202940:	4509                	li	a0,2
    80202942:	bfb5                	j	802028be <devintr+0x1e>

0000000080202944 <usertrap>:
{
    80202944:	1101                	addi	sp,sp,-32
    80202946:	ec06                	sd	ra,24(sp)
    80202948:	e822                	sd	s0,16(sp)
    8020294a:	e426                	sd	s1,8(sp)
    8020294c:	e04a                	sd	s2,0(sp)
    8020294e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202950:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202954:	1007f793          	andi	a5,a5,256
    80202958:	e3ad                	bnez	a5,802029ba <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    8020295a:	00008797          	auipc	a5,0x8
    8020295e:	8f67b783          	ld	a5,-1802(a5) # 8020a250 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202962:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202966:	fffff097          	auipc	ra,0xfffff
    8020296a:	15a080e7          	jalr	346(ra) # 80201ac0 <myproc>
    8020296e:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202970:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202972:	14102773          	csrr	a4,sepc
    80202976:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202978:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    8020297c:	47a1                	li	a5,8
    8020297e:	04f71c63          	bne	a4,a5,802029d6 <usertrap+0x92>
    if(p->killed)
    80202982:	591c                	lw	a5,48(a0)
    80202984:	e3b9                	bnez	a5,802029ca <usertrap+0x86>
    p->trapframe->epc += 4;
    80202986:	70b8                	ld	a4,96(s1)
    80202988:	6f1c                	ld	a5,24(a4)
    8020298a:	0791                	addi	a5,a5,4
    8020298c:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020298e:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202992:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202996:	10079073          	csrw	sstatus,a5
    syscall();
    8020299a:	00000097          	auipc	ra,0x0
    8020299e:	5da080e7          	jalr	1498(ra) # 80202f74 <syscall>
  if(p->killed)
    802029a2:	589c                	lw	a5,48(s1)
    802029a4:	ebd1                	bnez	a5,80202a38 <usertrap+0xf4>
  usertrapret();
    802029a6:	00000097          	auipc	ra,0x0
    802029aa:	e5c080e7          	jalr	-420(ra) # 80202802 <usertrapret>
}
    802029ae:	60e2                	ld	ra,24(sp)
    802029b0:	6442                	ld	s0,16(sp)
    802029b2:	64a2                	ld	s1,8(sp)
    802029b4:	6902                	ld	s2,0(sp)
    802029b6:	6105                	addi	sp,sp,32
    802029b8:	8082                	ret
    panic("usertrap: not from user mode");
    802029ba:	00007517          	auipc	a0,0x7
    802029be:	d6e50513          	addi	a0,a0,-658 # 80209728 <etext+0x728>
    802029c2:	ffffd097          	auipc	ra,0xffffd
    802029c6:	784080e7          	jalr	1924(ra) # 80200146 <panic>
      exit(-1);
    802029ca:	557d                	li	a0,-1
    802029cc:	00000097          	auipc	ra,0x0
    802029d0:	8a4080e7          	jalr	-1884(ra) # 80202270 <exit>
    802029d4:	bf4d                	j	80202986 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    802029d6:	00000097          	auipc	ra,0x0
    802029da:	eca080e7          	jalr	-310(ra) # 802028a0 <devintr>
    802029de:	892a                	mv	s2,a0
    802029e0:	c501                	beqz	a0,802029e8 <usertrap+0xa4>
  if(p->killed)
    802029e2:	589c                	lw	a5,48(s1)
    802029e4:	c3b1                	beqz	a5,80202a28 <usertrap+0xe4>
    802029e6:	a825                	j	80202a1e <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    802029e8:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    802029ec:	16048693          	addi	a3,s1,352
    802029f0:	5c90                	lw	a2,56(s1)
    802029f2:	00007517          	auipc	a0,0x7
    802029f6:	d5650513          	addi	a0,a0,-682 # 80209748 <etext+0x748>
    802029fa:	ffffd097          	auipc	ra,0xffffd
    802029fe:	796080e7          	jalr	1942(ra) # 80200190 <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a02:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202a06:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202a0a:	00007517          	auipc	a0,0x7
    80202a0e:	d6e50513          	addi	a0,a0,-658 # 80209778 <etext+0x778>
    80202a12:	ffffd097          	auipc	ra,0xffffd
    80202a16:	77e080e7          	jalr	1918(ra) # 80200190 <printf>
    p->killed = 1;
    80202a1a:	4785                	li	a5,1
    80202a1c:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202a1e:	557d                	li	a0,-1
    80202a20:	00000097          	auipc	ra,0x0
    80202a24:	850080e7          	jalr	-1968(ra) # 80202270 <exit>
  if(which_dev == 2)
    80202a28:	4789                	li	a5,2
    80202a2a:	f6f91ee3          	bne	s2,a5,802029a6 <usertrap+0x62>
    yield();
    80202a2e:	00000097          	auipc	ra,0x0
    80202a32:	946080e7          	jalr	-1722(ra) # 80202374 <yield>
    80202a36:	bf85                	j	802029a6 <usertrap+0x62>
  int which_dev = 0;
    80202a38:	4901                	li	s2,0
    80202a3a:	b7d5                	j	80202a1e <usertrap+0xda>

0000000080202a3c <kerneltrap>:
kerneltrap() {
    80202a3c:	7179                	addi	sp,sp,-48
    80202a3e:	f406                	sd	ra,40(sp)
    80202a40:	f022                	sd	s0,32(sp)
    80202a42:	ec26                	sd	s1,24(sp)
    80202a44:	e84a                	sd	s2,16(sp)
    80202a46:	e44e                	sd	s3,8(sp)
    80202a48:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202a4a:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a4e:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202a52:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202a56:	1004f793          	andi	a5,s1,256
    80202a5a:	cb85                	beqz	a5,80202a8a <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a5c:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202a60:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202a62:	ef85                	bnez	a5,80202a9a <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202a64:	00000097          	auipc	ra,0x0
    80202a68:	e3c080e7          	jalr	-452(ra) # 802028a0 <devintr>
    80202a6c:	cd1d                	beqz	a0,80202aaa <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202a6e:	4789                	li	a5,2
    80202a70:	08f50b63          	beq	a0,a5,80202b06 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202a74:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a78:	10049073          	csrw	sstatus,s1
}
    80202a7c:	70a2                	ld	ra,40(sp)
    80202a7e:	7402                	ld	s0,32(sp)
    80202a80:	64e2                	ld	s1,24(sp)
    80202a82:	6942                	ld	s2,16(sp)
    80202a84:	69a2                	ld	s3,8(sp)
    80202a86:	6145                	addi	sp,sp,48
    80202a88:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202a8a:	00007517          	auipc	a0,0x7
    80202a8e:	d0e50513          	addi	a0,a0,-754 # 80209798 <etext+0x798>
    80202a92:	ffffd097          	auipc	ra,0xffffd
    80202a96:	6b4080e7          	jalr	1716(ra) # 80200146 <panic>
    panic("kerneltrap: interrupts enabled");
    80202a9a:	00007517          	auipc	a0,0x7
    80202a9e:	d2650513          	addi	a0,a0,-730 # 802097c0 <etext+0x7c0>
    80202aa2:	ffffd097          	auipc	ra,0xffffd
    80202aa6:	6a4080e7          	jalr	1700(ra) # 80200146 <panic>
    printf("\nscause %p\n", scause);
    80202aaa:	85ce                	mv	a1,s3
    80202aac:	00007517          	auipc	a0,0x7
    80202ab0:	d3450513          	addi	a0,a0,-716 # 802097e0 <etext+0x7e0>
    80202ab4:	ffffd097          	auipc	ra,0xffffd
    80202ab8:	6dc080e7          	jalr	1756(ra) # 80200190 <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202abc:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202ac0:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202ac4:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202ac6:	00007517          	auipc	a0,0x7
    80202aca:	d2a50513          	addi	a0,a0,-726 # 802097f0 <etext+0x7f0>
    80202ace:	ffffd097          	auipc	ra,0xffffd
    80202ad2:	6c2080e7          	jalr	1730(ra) # 80200190 <printf>
    struct proc *p = myproc();
    80202ad6:	fffff097          	auipc	ra,0xfffff
    80202ada:	fea080e7          	jalr	-22(ra) # 80201ac0 <myproc>
    if (p != 0) {
    80202ade:	cd01                	beqz	a0,80202af6 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202ae0:	16050613          	addi	a2,a0,352
    80202ae4:	5d0c                	lw	a1,56(a0)
    80202ae6:	00007517          	auipc	a0,0x7
    80202aea:	d2a50513          	addi	a0,a0,-726 # 80209810 <etext+0x810>
    80202aee:	ffffd097          	auipc	ra,0xffffd
    80202af2:	6a2080e7          	jalr	1698(ra) # 80200190 <printf>
    panic("kerneltrap");
    80202af6:	00007517          	auipc	a0,0x7
    80202afa:	d3250513          	addi	a0,a0,-718 # 80209828 <etext+0x828>
    80202afe:	ffffd097          	auipc	ra,0xffffd
    80202b02:	648080e7          	jalr	1608(ra) # 80200146 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202b06:	fffff097          	auipc	ra,0xfffff
    80202b0a:	fba080e7          	jalr	-70(ra) # 80201ac0 <myproc>
    80202b0e:	d13d                	beqz	a0,80202a74 <kerneltrap+0x38>
    80202b10:	fffff097          	auipc	ra,0xfffff
    80202b14:	fb0080e7          	jalr	-80(ra) # 80201ac0 <myproc>
    80202b18:	4d18                	lw	a4,24(a0)
    80202b1a:	478d                	li	a5,3
    80202b1c:	f4f71ce3          	bne	a4,a5,80202a74 <kerneltrap+0x38>
    yield();
    80202b20:	00000097          	auipc	ra,0x0
    80202b24:	854080e7          	jalr	-1964(ra) # 80202374 <yield>
    80202b28:	b7b1                	j	80202a74 <kerneltrap+0x38>

0000000080202b2a <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202b2a:	1101                	addi	sp,sp,-32
    80202b2c:	ec06                	sd	ra,24(sp)
    80202b2e:	e822                	sd	s0,16(sp)
    80202b30:	e426                	sd	s1,8(sp)
    80202b32:	1000                	addi	s0,sp,32
    80202b34:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202b36:	792c                	ld	a1,112(a0)
    80202b38:	00007517          	auipc	a0,0x7
    80202b3c:	d0050513          	addi	a0,a0,-768 # 80209838 <etext+0x838>
    80202b40:	ffffd097          	auipc	ra,0xffffd
    80202b44:	650080e7          	jalr	1616(ra) # 80200190 <printf>
  printf("a1: %p\t", tf->a1);
    80202b48:	7cac                	ld	a1,120(s1)
    80202b4a:	00007517          	auipc	a0,0x7
    80202b4e:	cf650513          	addi	a0,a0,-778 # 80209840 <etext+0x840>
    80202b52:	ffffd097          	auipc	ra,0xffffd
    80202b56:	63e080e7          	jalr	1598(ra) # 80200190 <printf>
  printf("a2: %p\t", tf->a2);
    80202b5a:	60cc                	ld	a1,128(s1)
    80202b5c:	00007517          	auipc	a0,0x7
    80202b60:	cec50513          	addi	a0,a0,-788 # 80209848 <etext+0x848>
    80202b64:	ffffd097          	auipc	ra,0xffffd
    80202b68:	62c080e7          	jalr	1580(ra) # 80200190 <printf>
  printf("a3: %p\n", tf->a3);
    80202b6c:	64cc                	ld	a1,136(s1)
    80202b6e:	00007517          	auipc	a0,0x7
    80202b72:	ce250513          	addi	a0,a0,-798 # 80209850 <etext+0x850>
    80202b76:	ffffd097          	auipc	ra,0xffffd
    80202b7a:	61a080e7          	jalr	1562(ra) # 80200190 <printf>
  printf("a4: %p\t", tf->a4);
    80202b7e:	68cc                	ld	a1,144(s1)
    80202b80:	00007517          	auipc	a0,0x7
    80202b84:	cd850513          	addi	a0,a0,-808 # 80209858 <etext+0x858>
    80202b88:	ffffd097          	auipc	ra,0xffffd
    80202b8c:	608080e7          	jalr	1544(ra) # 80200190 <printf>
  printf("a5: %p\t", tf->a5);
    80202b90:	6ccc                	ld	a1,152(s1)
    80202b92:	00007517          	auipc	a0,0x7
    80202b96:	cce50513          	addi	a0,a0,-818 # 80209860 <etext+0x860>
    80202b9a:	ffffd097          	auipc	ra,0xffffd
    80202b9e:	5f6080e7          	jalr	1526(ra) # 80200190 <printf>
  printf("a6: %p\t", tf->a6);
    80202ba2:	70cc                	ld	a1,160(s1)
    80202ba4:	00007517          	auipc	a0,0x7
    80202ba8:	cc450513          	addi	a0,a0,-828 # 80209868 <etext+0x868>
    80202bac:	ffffd097          	auipc	ra,0xffffd
    80202bb0:	5e4080e7          	jalr	1508(ra) # 80200190 <printf>
  printf("a7: %p\n", tf->a7);
    80202bb4:	74cc                	ld	a1,168(s1)
    80202bb6:	00007517          	auipc	a0,0x7
    80202bba:	cba50513          	addi	a0,a0,-838 # 80209870 <etext+0x870>
    80202bbe:	ffffd097          	auipc	ra,0xffffd
    80202bc2:	5d2080e7          	jalr	1490(ra) # 80200190 <printf>
  printf("t0: %p\t", tf->t0);
    80202bc6:	64ac                	ld	a1,72(s1)
    80202bc8:	00007517          	auipc	a0,0x7
    80202bcc:	cb050513          	addi	a0,a0,-848 # 80209878 <etext+0x878>
    80202bd0:	ffffd097          	auipc	ra,0xffffd
    80202bd4:	5c0080e7          	jalr	1472(ra) # 80200190 <printf>
  printf("t1: %p\t", tf->t1);
    80202bd8:	68ac                	ld	a1,80(s1)
    80202bda:	00007517          	auipc	a0,0x7
    80202bde:	ca650513          	addi	a0,a0,-858 # 80209880 <etext+0x880>
    80202be2:	ffffd097          	auipc	ra,0xffffd
    80202be6:	5ae080e7          	jalr	1454(ra) # 80200190 <printf>
  printf("t2: %p\t", tf->t2);
    80202bea:	6cac                	ld	a1,88(s1)
    80202bec:	00007517          	auipc	a0,0x7
    80202bf0:	c9c50513          	addi	a0,a0,-868 # 80209888 <etext+0x888>
    80202bf4:	ffffd097          	auipc	ra,0xffffd
    80202bf8:	59c080e7          	jalr	1436(ra) # 80200190 <printf>
  printf("t3: %p\n", tf->t3);
    80202bfc:	1004b583          	ld	a1,256(s1)
    80202c00:	00007517          	auipc	a0,0x7
    80202c04:	c9050513          	addi	a0,a0,-880 # 80209890 <etext+0x890>
    80202c08:	ffffd097          	auipc	ra,0xffffd
    80202c0c:	588080e7          	jalr	1416(ra) # 80200190 <printf>
  printf("t4: %p\t", tf->t4);
    80202c10:	1084b583          	ld	a1,264(s1)
    80202c14:	00007517          	auipc	a0,0x7
    80202c18:	c8450513          	addi	a0,a0,-892 # 80209898 <etext+0x898>
    80202c1c:	ffffd097          	auipc	ra,0xffffd
    80202c20:	574080e7          	jalr	1396(ra) # 80200190 <printf>
  printf("t5: %p\t", tf->t5);
    80202c24:	1104b583          	ld	a1,272(s1)
    80202c28:	00007517          	auipc	a0,0x7
    80202c2c:	c7850513          	addi	a0,a0,-904 # 802098a0 <etext+0x8a0>
    80202c30:	ffffd097          	auipc	ra,0xffffd
    80202c34:	560080e7          	jalr	1376(ra) # 80200190 <printf>
  printf("t6: %p\t", tf->t6);
    80202c38:	1184b583          	ld	a1,280(s1)
    80202c3c:	00007517          	auipc	a0,0x7
    80202c40:	c6c50513          	addi	a0,a0,-916 # 802098a8 <etext+0x8a8>
    80202c44:	ffffd097          	auipc	ra,0xffffd
    80202c48:	54c080e7          	jalr	1356(ra) # 80200190 <printf>
  printf("s0: %p\n", tf->s0);
    80202c4c:	70ac                	ld	a1,96(s1)
    80202c4e:	00007517          	auipc	a0,0x7
    80202c52:	c6250513          	addi	a0,a0,-926 # 802098b0 <etext+0x8b0>
    80202c56:	ffffd097          	auipc	ra,0xffffd
    80202c5a:	53a080e7          	jalr	1338(ra) # 80200190 <printf>
  printf("s1: %p\t", tf->s1);
    80202c5e:	74ac                	ld	a1,104(s1)
    80202c60:	00007517          	auipc	a0,0x7
    80202c64:	c5850513          	addi	a0,a0,-936 # 802098b8 <etext+0x8b8>
    80202c68:	ffffd097          	auipc	ra,0xffffd
    80202c6c:	528080e7          	jalr	1320(ra) # 80200190 <printf>
  printf("s2: %p\t", tf->s2);
    80202c70:	78cc                	ld	a1,176(s1)
    80202c72:	00007517          	auipc	a0,0x7
    80202c76:	c4e50513          	addi	a0,a0,-946 # 802098c0 <etext+0x8c0>
    80202c7a:	ffffd097          	auipc	ra,0xffffd
    80202c7e:	516080e7          	jalr	1302(ra) # 80200190 <printf>
  printf("s3: %p\t", tf->s3);
    80202c82:	7ccc                	ld	a1,184(s1)
    80202c84:	00007517          	auipc	a0,0x7
    80202c88:	c4450513          	addi	a0,a0,-956 # 802098c8 <etext+0x8c8>
    80202c8c:	ffffd097          	auipc	ra,0xffffd
    80202c90:	504080e7          	jalr	1284(ra) # 80200190 <printf>
  printf("s4: %p\n", tf->s4);
    80202c94:	60ec                	ld	a1,192(s1)
    80202c96:	00007517          	auipc	a0,0x7
    80202c9a:	c3a50513          	addi	a0,a0,-966 # 802098d0 <etext+0x8d0>
    80202c9e:	ffffd097          	auipc	ra,0xffffd
    80202ca2:	4f2080e7          	jalr	1266(ra) # 80200190 <printf>
  printf("s5: %p\t", tf->s5);
    80202ca6:	64ec                	ld	a1,200(s1)
    80202ca8:	00007517          	auipc	a0,0x7
    80202cac:	c3050513          	addi	a0,a0,-976 # 802098d8 <etext+0x8d8>
    80202cb0:	ffffd097          	auipc	ra,0xffffd
    80202cb4:	4e0080e7          	jalr	1248(ra) # 80200190 <printf>
  printf("s6: %p\t", tf->s6);
    80202cb8:	68ec                	ld	a1,208(s1)
    80202cba:	00007517          	auipc	a0,0x7
    80202cbe:	c2650513          	addi	a0,a0,-986 # 802098e0 <etext+0x8e0>
    80202cc2:	ffffd097          	auipc	ra,0xffffd
    80202cc6:	4ce080e7          	jalr	1230(ra) # 80200190 <printf>
  printf("s7: %p\t", tf->s7);
    80202cca:	6cec                	ld	a1,216(s1)
    80202ccc:	00007517          	auipc	a0,0x7
    80202cd0:	c1c50513          	addi	a0,a0,-996 # 802098e8 <etext+0x8e8>
    80202cd4:	ffffd097          	auipc	ra,0xffffd
    80202cd8:	4bc080e7          	jalr	1212(ra) # 80200190 <printf>
  printf("s8: %p\n", tf->s8);
    80202cdc:	70ec                	ld	a1,224(s1)
    80202cde:	00007517          	auipc	a0,0x7
    80202ce2:	c1250513          	addi	a0,a0,-1006 # 802098f0 <etext+0x8f0>
    80202ce6:	ffffd097          	auipc	ra,0xffffd
    80202cea:	4aa080e7          	jalr	1194(ra) # 80200190 <printf>
  printf("s9: %p\t", tf->s9);
    80202cee:	74ec                	ld	a1,232(s1)
    80202cf0:	00007517          	auipc	a0,0x7
    80202cf4:	c0850513          	addi	a0,a0,-1016 # 802098f8 <etext+0x8f8>
    80202cf8:	ffffd097          	auipc	ra,0xffffd
    80202cfc:	498080e7          	jalr	1176(ra) # 80200190 <printf>
  printf("s10: %p\t", tf->s10);
    80202d00:	78ec                	ld	a1,240(s1)
    80202d02:	00007517          	auipc	a0,0x7
    80202d06:	bfe50513          	addi	a0,a0,-1026 # 80209900 <etext+0x900>
    80202d0a:	ffffd097          	auipc	ra,0xffffd
    80202d0e:	486080e7          	jalr	1158(ra) # 80200190 <printf>
  printf("s11: %p\t", tf->s11);
    80202d12:	7cec                	ld	a1,248(s1)
    80202d14:	00007517          	auipc	a0,0x7
    80202d18:	bfc50513          	addi	a0,a0,-1028 # 80209910 <etext+0x910>
    80202d1c:	ffffd097          	auipc	ra,0xffffd
    80202d20:	474080e7          	jalr	1140(ra) # 80200190 <printf>
  printf("ra: %p\n", tf->ra);
    80202d24:	748c                	ld	a1,40(s1)
    80202d26:	00007517          	auipc	a0,0x7
    80202d2a:	8ea50513          	addi	a0,a0,-1814 # 80209610 <etext+0x610>
    80202d2e:	ffffd097          	auipc	ra,0xffffd
    80202d32:	462080e7          	jalr	1122(ra) # 80200190 <printf>
  printf("sp: %p\t", tf->sp);
    80202d36:	788c                	ld	a1,48(s1)
    80202d38:	00007517          	auipc	a0,0x7
    80202d3c:	be850513          	addi	a0,a0,-1048 # 80209920 <etext+0x920>
    80202d40:	ffffd097          	auipc	ra,0xffffd
    80202d44:	450080e7          	jalr	1104(ra) # 80200190 <printf>
  printf("gp: %p\t", tf->gp);
    80202d48:	7c8c                	ld	a1,56(s1)
    80202d4a:	00007517          	auipc	a0,0x7
    80202d4e:	bde50513          	addi	a0,a0,-1058 # 80209928 <etext+0x928>
    80202d52:	ffffd097          	auipc	ra,0xffffd
    80202d56:	43e080e7          	jalr	1086(ra) # 80200190 <printf>
  printf("tp: %p\t", tf->tp);
    80202d5a:	60ac                	ld	a1,64(s1)
    80202d5c:	00007517          	auipc	a0,0x7
    80202d60:	bd450513          	addi	a0,a0,-1068 # 80209930 <etext+0x930>
    80202d64:	ffffd097          	auipc	ra,0xffffd
    80202d68:	42c080e7          	jalr	1068(ra) # 80200190 <printf>
  printf("epc: %p\n", tf->epc);
    80202d6c:	6c8c                	ld	a1,24(s1)
    80202d6e:	00007517          	auipc	a0,0x7
    80202d72:	bca50513          	addi	a0,a0,-1078 # 80209938 <etext+0x938>
    80202d76:	ffffd097          	auipc	ra,0xffffd
    80202d7a:	41a080e7          	jalr	1050(ra) # 80200190 <printf>
}
    80202d7e:	60e2                	ld	ra,24(sp)
    80202d80:	6442                	ld	s0,16(sp)
    80202d82:	64a2                	ld	s1,8(sp)
    80202d84:	6105                	addi	sp,sp,32
    80202d86:	8082                	ret

0000000080202d88 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202d88:	1101                	addi	sp,sp,-32
    80202d8a:	ec06                	sd	ra,24(sp)
    80202d8c:	e822                	sd	s0,16(sp)
    80202d8e:	e426                	sd	s1,8(sp)
    80202d90:	1000                	addi	s0,sp,32
    80202d92:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202d94:	fffff097          	auipc	ra,0xfffff
    80202d98:	d2c080e7          	jalr	-724(ra) # 80201ac0 <myproc>
  switch (n) {
    80202d9c:	4795                	li	a5,5
    80202d9e:	0497e363          	bltu	a5,s1,80202de4 <argraw+0x5c>
    80202da2:	1482                	slli	s1,s1,0x20
    80202da4:	9081                	srli	s1,s1,0x20
    80202da6:	048a                	slli	s1,s1,0x2
    80202da8:	00007717          	auipc	a4,0x7
    80202dac:	b9c70713          	addi	a4,a4,-1124 # 80209944 <etext+0x944>
    80202db0:	94ba                	add	s1,s1,a4
    80202db2:	409c                	lw	a5,0(s1)
    80202db4:	97ba                	add	a5,a5,a4
    80202db6:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202db8:	713c                	ld	a5,96(a0)
    80202dba:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202dbc:	60e2                	ld	ra,24(sp)
    80202dbe:	6442                	ld	s0,16(sp)
    80202dc0:	64a2                	ld	s1,8(sp)
    80202dc2:	6105                	addi	sp,sp,32
    80202dc4:	8082                	ret
    return p->trapframe->a1;
    80202dc6:	713c                	ld	a5,96(a0)
    80202dc8:	7fa8                	ld	a0,120(a5)
    80202dca:	bfcd                	j	80202dbc <argraw+0x34>
    return p->trapframe->a2;
    80202dcc:	713c                	ld	a5,96(a0)
    80202dce:	63c8                	ld	a0,128(a5)
    80202dd0:	b7f5                	j	80202dbc <argraw+0x34>
    return p->trapframe->a3;
    80202dd2:	713c                	ld	a5,96(a0)
    80202dd4:	67c8                	ld	a0,136(a5)
    80202dd6:	b7dd                	j	80202dbc <argraw+0x34>
    return p->trapframe->a4;
    80202dd8:	713c                	ld	a5,96(a0)
    80202dda:	6bc8                	ld	a0,144(a5)
    80202ddc:	b7c5                	j	80202dbc <argraw+0x34>
    return p->trapframe->a5;
    80202dde:	713c                	ld	a5,96(a0)
    80202de0:	6fc8                	ld	a0,152(a5)
    80202de2:	bfe9                	j	80202dbc <argraw+0x34>
  panic("argraw");
    80202de4:	00007517          	auipc	a0,0x7
    80202de8:	b7c50513          	addi	a0,a0,-1156 # 80209960 <etext+0x960>
    80202dec:	ffffd097          	auipc	ra,0xffffd
    80202df0:	35a080e7          	jalr	858(ra) # 80200146 <panic>

0000000080202df4 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80202df4:	7179                	addi	sp,sp,-48
    80202df6:	f406                	sd	ra,40(sp)
    80202df8:	f022                	sd	s0,32(sp)
    80202dfa:	ec26                	sd	s1,24(sp)
    80202dfc:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    80202dfe:	4501                	li	a0,0
    80202e00:	00000097          	auipc	ra,0x0
    80202e04:	f88080e7          	jalr	-120(ra) # 80202d88 <argraw>
    80202e08:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80202e0a:	ffffd097          	auipc	ra,0xffffd
    80202e0e:	7c6080e7          	jalr	1990(ra) # 802005d0 <freemem_amount>
    80202e12:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80202e16:	00000097          	auipc	ra,0x0
    80202e1a:	916080e7          	jalr	-1770(ra) # 8020272c <procnum>
    80202e1e:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80202e22:	4641                	li	a2,16
    80202e24:	fd040593          	addi	a1,s0,-48
    80202e28:	8526                	mv	a0,s1
    80202e2a:	ffffe097          	auipc	ra,0xffffe
    80202e2e:	598080e7          	jalr	1432(ra) # 802013c2 <copyout2>
    return -1;
  }

  return 0;
    80202e32:	957d                	srai	a0,a0,0x3f
    80202e34:	70a2                	ld	ra,40(sp)
    80202e36:	7402                	ld	s0,32(sp)
    80202e38:	64e2                	ld	s1,24(sp)
    80202e3a:	6145                	addi	sp,sp,48
    80202e3c:	8082                	ret

0000000080202e3e <fetchaddr>:
{
    80202e3e:	1101                	addi	sp,sp,-32
    80202e40:	ec06                	sd	ra,24(sp)
    80202e42:	e822                	sd	s0,16(sp)
    80202e44:	e426                	sd	s1,8(sp)
    80202e46:	e04a                	sd	s2,0(sp)
    80202e48:	1000                	addi	s0,sp,32
    80202e4a:	84aa                	mv	s1,a0
    80202e4c:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80202e4e:	fffff097          	auipc	ra,0xfffff
    80202e52:	c72080e7          	jalr	-910(ra) # 80201ac0 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80202e56:	653c                	ld	a5,72(a0)
    80202e58:	02f4f863          	bleu	a5,s1,80202e88 <fetchaddr+0x4a>
    80202e5c:	00848713          	addi	a4,s1,8
    80202e60:	02e7e663          	bltu	a5,a4,80202e8c <fetchaddr+0x4e>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80202e64:	4621                	li	a2,8
    80202e66:	85a6                	mv	a1,s1
    80202e68:	854a                	mv	a0,s2
    80202e6a:	ffffe097          	auipc	ra,0xffffe
    80202e6e:	638080e7          	jalr	1592(ra) # 802014a2 <copyin2>
    80202e72:	00a03533          	snez	a0,a0
    80202e76:	40a0053b          	negw	a0,a0
    80202e7a:	2501                	sext.w	a0,a0
}
    80202e7c:	60e2                	ld	ra,24(sp)
    80202e7e:	6442                	ld	s0,16(sp)
    80202e80:	64a2                	ld	s1,8(sp)
    80202e82:	6902                	ld	s2,0(sp)
    80202e84:	6105                	addi	sp,sp,32
    80202e86:	8082                	ret
    return -1;
    80202e88:	557d                	li	a0,-1
    80202e8a:	bfcd                	j	80202e7c <fetchaddr+0x3e>
    80202e8c:	557d                	li	a0,-1
    80202e8e:	b7fd                	j	80202e7c <fetchaddr+0x3e>

0000000080202e90 <fetchstr>:
{
    80202e90:	1101                	addi	sp,sp,-32
    80202e92:	ec06                	sd	ra,24(sp)
    80202e94:	e822                	sd	s0,16(sp)
    80202e96:	e426                	sd	s1,8(sp)
    80202e98:	1000                	addi	s0,sp,32
    80202e9a:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    80202e9c:	85aa                	mv	a1,a0
    80202e9e:	8526                	mv	a0,s1
    80202ea0:	ffffe097          	auipc	ra,0xffffe
    80202ea4:	71e080e7          	jalr	1822(ra) # 802015be <copyinstr2>
  if(err < 0)
    80202ea8:	00054763          	bltz	a0,80202eb6 <fetchstr+0x26>
  return strlen(buf);
    80202eac:	8526                	mv	a0,s1
    80202eae:	ffffe097          	auipc	ra,0xffffe
    80202eb2:	a70080e7          	jalr	-1424(ra) # 8020091e <strlen>
}
    80202eb6:	60e2                	ld	ra,24(sp)
    80202eb8:	6442                	ld	s0,16(sp)
    80202eba:	64a2                	ld	s1,8(sp)
    80202ebc:	6105                	addi	sp,sp,32
    80202ebe:	8082                	ret

0000000080202ec0 <argint>:
{
    80202ec0:	1101                	addi	sp,sp,-32
    80202ec2:	ec06                	sd	ra,24(sp)
    80202ec4:	e822                	sd	s0,16(sp)
    80202ec6:	e426                	sd	s1,8(sp)
    80202ec8:	1000                	addi	s0,sp,32
    80202eca:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202ecc:	00000097          	auipc	ra,0x0
    80202ed0:	ebc080e7          	jalr	-324(ra) # 80202d88 <argraw>
    80202ed4:	c088                	sw	a0,0(s1)
}
    80202ed6:	4501                	li	a0,0
    80202ed8:	60e2                	ld	ra,24(sp)
    80202eda:	6442                	ld	s0,16(sp)
    80202edc:	64a2                	ld	s1,8(sp)
    80202ede:	6105                	addi	sp,sp,32
    80202ee0:	8082                	ret

0000000080202ee2 <sys_test_proc>:
sys_test_proc(void) {
    80202ee2:	1101                	addi	sp,sp,-32
    80202ee4:	ec06                	sd	ra,24(sp)
    80202ee6:	e822                	sd	s0,16(sp)
    80202ee8:	1000                	addi	s0,sp,32
    argint(0, &n);
    80202eea:	fec40593          	addi	a1,s0,-20
    80202eee:	4501                	li	a0,0
    80202ef0:	00000097          	auipc	ra,0x0
    80202ef4:	fd0080e7          	jalr	-48(ra) # 80202ec0 <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80202ef8:	fffff097          	auipc	ra,0xfffff
    80202efc:	bc8080e7          	jalr	-1080(ra) # 80201ac0 <myproc>
    80202f00:	8612                	mv	a2,tp
    80202f02:	fec42683          	lw	a3,-20(s0)
    80202f06:	5d0c                	lw	a1,56(a0)
    80202f08:	00007517          	auipc	a0,0x7
    80202f0c:	a6050513          	addi	a0,a0,-1440 # 80209968 <etext+0x968>
    80202f10:	ffffd097          	auipc	ra,0xffffd
    80202f14:	280080e7          	jalr	640(ra) # 80200190 <printf>
}
    80202f18:	4501                	li	a0,0
    80202f1a:	60e2                	ld	ra,24(sp)
    80202f1c:	6442                	ld	s0,16(sp)
    80202f1e:	6105                	addi	sp,sp,32
    80202f20:	8082                	ret

0000000080202f22 <argaddr>:
{
    80202f22:	1101                	addi	sp,sp,-32
    80202f24:	ec06                	sd	ra,24(sp)
    80202f26:	e822                	sd	s0,16(sp)
    80202f28:	e426                	sd	s1,8(sp)
    80202f2a:	1000                	addi	s0,sp,32
    80202f2c:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80202f2e:	00000097          	auipc	ra,0x0
    80202f32:	e5a080e7          	jalr	-422(ra) # 80202d88 <argraw>
    80202f36:	e088                	sd	a0,0(s1)
}
    80202f38:	4501                	li	a0,0
    80202f3a:	60e2                	ld	ra,24(sp)
    80202f3c:	6442                	ld	s0,16(sp)
    80202f3e:	64a2                	ld	s1,8(sp)
    80202f40:	6105                	addi	sp,sp,32
    80202f42:	8082                	ret

0000000080202f44 <argstr>:
{
    80202f44:	1101                	addi	sp,sp,-32
    80202f46:	ec06                	sd	ra,24(sp)
    80202f48:	e822                	sd	s0,16(sp)
    80202f4a:	e426                	sd	s1,8(sp)
    80202f4c:	e04a                	sd	s2,0(sp)
    80202f4e:	1000                	addi	s0,sp,32
    80202f50:	84ae                	mv	s1,a1
    80202f52:	8932                	mv	s2,a2
  *ip = argraw(n);
    80202f54:	00000097          	auipc	ra,0x0
    80202f58:	e34080e7          	jalr	-460(ra) # 80202d88 <argraw>
  return fetchstr(addr, buf, max);
    80202f5c:	864a                	mv	a2,s2
    80202f5e:	85a6                	mv	a1,s1
    80202f60:	00000097          	auipc	ra,0x0
    80202f64:	f30080e7          	jalr	-208(ra) # 80202e90 <fetchstr>
}
    80202f68:	60e2                	ld	ra,24(sp)
    80202f6a:	6442                	ld	s0,16(sp)
    80202f6c:	64a2                	ld	s1,8(sp)
    80202f6e:	6902                	ld	s2,0(sp)
    80202f70:	6105                	addi	sp,sp,32
    80202f72:	8082                	ret

0000000080202f74 <syscall>:
{
    80202f74:	7179                	addi	sp,sp,-48
    80202f76:	f406                	sd	ra,40(sp)
    80202f78:	f022                	sd	s0,32(sp)
    80202f7a:	ec26                	sd	s1,24(sp)
    80202f7c:	e84a                	sd	s2,16(sp)
    80202f7e:	e44e                	sd	s3,8(sp)
    80202f80:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202f82:	fffff097          	auipc	ra,0xfffff
    80202f86:	b3e080e7          	jalr	-1218(ra) # 80201ac0 <myproc>
    80202f8a:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80202f8c:	06053983          	ld	s3,96(a0)
    80202f90:	0a89b783          	ld	a5,168(s3) # 80209758 <etext+0x758>
    80202f94:	0007891b          	sext.w	s2,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80202f98:	37fd                	addiw	a5,a5,-1
    80202f9a:	4769                	li	a4,26
    80202f9c:	04f76863          	bltu	a4,a5,80202fec <syscall+0x78>
    80202fa0:	00391713          	slli	a4,s2,0x3
    80202fa4:	00007797          	auipc	a5,0x7
    80202fa8:	0c478793          	addi	a5,a5,196 # 8020a068 <syscalls>
    80202fac:	97ba                	add	a5,a5,a4
    80202fae:	639c                	ld	a5,0(a5)
    80202fb0:	cf95                	beqz	a5,80202fec <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    80202fb2:	9782                	jalr	a5
    80202fb4:	06a9b823          	sd	a0,112(s3)
    if ((p->tmask & (1 << num)) != 0) {
    80202fb8:	1704a783          	lw	a5,368(s1)
    80202fbc:	4127d7bb          	sraw	a5,a5,s2
    80202fc0:	8b85                	andi	a5,a5,1
    80202fc2:	c7a1                	beqz	a5,8020300a <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    80202fc4:	70b8                	ld	a4,96(s1)
    80202fc6:	090e                	slli	s2,s2,0x3
    80202fc8:	00007797          	auipc	a5,0x7
    80202fcc:	18078793          	addi	a5,a5,384 # 8020a148 <sysnames>
    80202fd0:	993e                	add	s2,s2,a5
    80202fd2:	7b34                	ld	a3,112(a4)
    80202fd4:	00093603          	ld	a2,0(s2)
    80202fd8:	5c8c                	lw	a1,56(s1)
    80202fda:	00007517          	auipc	a0,0x7
    80202fde:	9be50513          	addi	a0,a0,-1602 # 80209998 <etext+0x998>
    80202fe2:	ffffd097          	auipc	ra,0xffffd
    80202fe6:	1ae080e7          	jalr	430(ra) # 80200190 <printf>
    80202fea:	a005                	j	8020300a <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    80202fec:	86ca                	mv	a3,s2
    80202fee:	16048613          	addi	a2,s1,352
    80202ff2:	5c8c                	lw	a1,56(s1)
    80202ff4:	00007517          	auipc	a0,0x7
    80202ff8:	9bc50513          	addi	a0,a0,-1604 # 802099b0 <etext+0x9b0>
    80202ffc:	ffffd097          	auipc	ra,0xffffd
    80203000:	194080e7          	jalr	404(ra) # 80200190 <printf>
    p->trapframe->a0 = -1;
    80203004:	70bc                	ld	a5,96(s1)
    80203006:	577d                	li	a4,-1
    80203008:	fbb8                	sd	a4,112(a5)
}
    8020300a:	70a2                	ld	ra,40(sp)
    8020300c:	7402                	ld	s0,32(sp)
    8020300e:	64e2                	ld	s1,24(sp)
    80203010:	6942                	ld	s2,16(sp)
    80203012:	69a2                	ld	s3,8(sp)
    80203014:	6145                	addi	sp,sp,48
    80203016:	8082                	ret

0000000080203018 <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203018:	da010113          	addi	sp,sp,-608
    8020301c:	24113c23          	sd	ra,600(sp)
    80203020:	24813823          	sd	s0,592(sp)
    80203024:	24913423          	sd	s1,584(sp)
    80203028:	25213023          	sd	s2,576(sp)
    8020302c:	23313c23          	sd	s3,568(sp)
    80203030:	23413823          	sd	s4,560(sp)
    80203034:	23513423          	sd	s5,552(sp)
    80203038:	23613023          	sd	s6,544(sp)
    8020303c:	1480                	addi	s0,sp,608
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020303e:	10400613          	li	a2,260
    80203042:	eb840593          	addi	a1,s0,-328
    80203046:	4501                	li	a0,0
    80203048:	00000097          	auipc	ra,0x0
    8020304c:	efc080e7          	jalr	-260(ra) # 80202f44 <argstr>
    return -1;
    80203050:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203052:	0e054d63          	bltz	a0,8020314c <sys_exec+0x134>
    80203056:	db040593          	addi	a1,s0,-592
    8020305a:	4505                	li	a0,1
    8020305c:	00000097          	auipc	ra,0x0
    80203060:	ec6080e7          	jalr	-314(ra) # 80202f22 <argaddr>
    80203064:	0e054463          	bltz	a0,8020314c <sys_exec+0x134>
  }
  memset(argv, 0, sizeof(argv));
    80203068:	10000613          	li	a2,256
    8020306c:	4581                	li	a1,0
    8020306e:	db840913          	addi	s2,s0,-584
    80203072:	854a                	mv	a0,s2
    80203074:	ffffd097          	auipc	ra,0xffffd
    80203078:	700080e7          	jalr	1792(ra) # 80200774 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    8020307c:	89ca                	mv	s3,s2
  memset(argv, 0, sizeof(argv));
    8020307e:	4481                	li	s1,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203080:	da840a13          	addi	s4,s0,-600
    if(i >= NELEM(argv)){
    80203084:	02000b13          	li	s6,32
    80203088:	00048a9b          	sext.w	s5,s1
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020308c:	00349513          	slli	a0,s1,0x3
    80203090:	85d2                	mv	a1,s4
    80203092:	db043783          	ld	a5,-592(s0)
    80203096:	953e                	add	a0,a0,a5
    80203098:	00000097          	auipc	ra,0x0
    8020309c:	da6080e7          	jalr	-602(ra) # 80202e3e <fetchaddr>
    802030a0:	02054a63          	bltz	a0,802030d4 <sys_exec+0xbc>
      goto bad;
    }
    if(uarg == 0){
    802030a4:	da843783          	ld	a5,-600(s0)
    802030a8:	cfa9                	beqz	a5,80203102 <sys_exec+0xea>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802030aa:	ffffd097          	auipc	ra,0xffffd
    802030ae:	4c0080e7          	jalr	1216(ra) # 8020056a <kalloc>
    802030b2:	00a93023          	sd	a0,0(s2)
    if(argv[i] == 0)
    802030b6:	cd19                	beqz	a0,802030d4 <sys_exec+0xbc>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802030b8:	6605                	lui	a2,0x1
    802030ba:	85aa                	mv	a1,a0
    802030bc:	da843503          	ld	a0,-600(s0)
    802030c0:	00000097          	auipc	ra,0x0
    802030c4:	dd0080e7          	jalr	-560(ra) # 80202e90 <fetchstr>
    802030c8:	00054663          	bltz	a0,802030d4 <sys_exec+0xbc>
    if(i >= NELEM(argv)){
    802030cc:	0485                	addi	s1,s1,1
    802030ce:	0921                	addi	s2,s2,8
    802030d0:	fb649ce3          	bne	s1,s6,80203088 <sys_exec+0x70>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030d4:	db843503          	ld	a0,-584(s0)
    kfree(argv[i]);
  return -1;
    802030d8:	597d                	li	s2,-1
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030da:	c92d                	beqz	a0,8020314c <sys_exec+0x134>
    kfree(argv[i]);
    802030dc:	ffffd097          	auipc	ra,0xffffd
    802030e0:	372080e7          	jalr	882(ra) # 8020044e <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030e4:	dc040493          	addi	s1,s0,-576
    802030e8:	10098993          	addi	s3,s3,256
    802030ec:	6088                	ld	a0,0(s1)
    802030ee:	cd31                	beqz	a0,8020314a <sys_exec+0x132>
    kfree(argv[i]);
    802030f0:	ffffd097          	auipc	ra,0xffffd
    802030f4:	35e080e7          	jalr	862(ra) # 8020044e <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802030f8:	04a1                	addi	s1,s1,8
    802030fa:	ff3499e3          	bne	s1,s3,802030ec <sys_exec+0xd4>
  return -1;
    802030fe:	597d                	li	s2,-1
    80203100:	a0b1                	j	8020314c <sys_exec+0x134>
      argv[i] = 0;
    80203102:	0a8e                	slli	s5,s5,0x3
    80203104:	fc040793          	addi	a5,s0,-64
    80203108:	9abe                	add	s5,s5,a5
    8020310a:	de0abc23          	sd	zero,-520(s5)
  int ret = exec(path, argv);
    8020310e:	db840593          	addi	a1,s0,-584
    80203112:	eb840513          	addi	a0,s0,-328
    80203116:	00001097          	auipc	ra,0x1
    8020311a:	f7a080e7          	jalr	-134(ra) # 80204090 <exec>
    8020311e:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203120:	db843503          	ld	a0,-584(s0)
    80203124:	c505                	beqz	a0,8020314c <sys_exec+0x134>
    kfree(argv[i]);
    80203126:	ffffd097          	auipc	ra,0xffffd
    8020312a:	328080e7          	jalr	808(ra) # 8020044e <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8020312e:	dc040493          	addi	s1,s0,-576
    80203132:	10098993          	addi	s3,s3,256
    80203136:	6088                	ld	a0,0(s1)
    80203138:	c911                	beqz	a0,8020314c <sys_exec+0x134>
    kfree(argv[i]);
    8020313a:	ffffd097          	auipc	ra,0xffffd
    8020313e:	314080e7          	jalr	788(ra) # 8020044e <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203142:	04a1                	addi	s1,s1,8
    80203144:	ff3499e3          	bne	s1,s3,80203136 <sys_exec+0x11e>
    80203148:	a011                	j	8020314c <sys_exec+0x134>
  return -1;
    8020314a:	597d                	li	s2,-1
}
    8020314c:	854a                	mv	a0,s2
    8020314e:	25813083          	ld	ra,600(sp)
    80203152:	25013403          	ld	s0,592(sp)
    80203156:	24813483          	ld	s1,584(sp)
    8020315a:	24013903          	ld	s2,576(sp)
    8020315e:	23813983          	ld	s3,568(sp)
    80203162:	23013a03          	ld	s4,560(sp)
    80203166:	22813a83          	ld	s5,552(sp)
    8020316a:	22013b03          	ld	s6,544(sp)
    8020316e:	26010113          	addi	sp,sp,608
    80203172:	8082                	ret

0000000080203174 <sys_exit>:

uint64
sys_exit(void)
{
    80203174:	1101                	addi	sp,sp,-32
    80203176:	ec06                	sd	ra,24(sp)
    80203178:	e822                	sd	s0,16(sp)
    8020317a:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8020317c:	fec40593          	addi	a1,s0,-20
    80203180:	4501                	li	a0,0
    80203182:	00000097          	auipc	ra,0x0
    80203186:	d3e080e7          	jalr	-706(ra) # 80202ec0 <argint>
    return -1;
    8020318a:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8020318c:	00054963          	bltz	a0,8020319e <sys_exit+0x2a>
  exit(n);
    80203190:	fec42503          	lw	a0,-20(s0)
    80203194:	fffff097          	auipc	ra,0xfffff
    80203198:	0dc080e7          	jalr	220(ra) # 80202270 <exit>
  return 0;  // not reached
    8020319c:	4781                	li	a5,0
}
    8020319e:	853e                	mv	a0,a5
    802031a0:	60e2                	ld	ra,24(sp)
    802031a2:	6442                	ld	s0,16(sp)
    802031a4:	6105                	addi	sp,sp,32
    802031a6:	8082                	ret

00000000802031a8 <sys_getpid>:

uint64
sys_getpid(void)
{
    802031a8:	1141                	addi	sp,sp,-16
    802031aa:	e406                	sd	ra,8(sp)
    802031ac:	e022                	sd	s0,0(sp)
    802031ae:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802031b0:	fffff097          	auipc	ra,0xfffff
    802031b4:	910080e7          	jalr	-1776(ra) # 80201ac0 <myproc>
}
    802031b8:	5d08                	lw	a0,56(a0)
    802031ba:	60a2                	ld	ra,8(sp)
    802031bc:	6402                	ld	s0,0(sp)
    802031be:	0141                	addi	sp,sp,16
    802031c0:	8082                	ret

00000000802031c2 <sys_fork>:

uint64
sys_fork(void)
{
    802031c2:	1141                	addi	sp,sp,-16
    802031c4:	e406                	sd	ra,8(sp)
    802031c6:	e022                	sd	s0,0(sp)
    802031c8:	0800                	addi	s0,sp,16
  return fork();
    802031ca:	fffff097          	auipc	ra,0xfffff
    802031ce:	d0e080e7          	jalr	-754(ra) # 80201ed8 <fork>
}
    802031d2:	60a2                	ld	ra,8(sp)
    802031d4:	6402                	ld	s0,0(sp)
    802031d6:	0141                	addi	sp,sp,16
    802031d8:	8082                	ret

00000000802031da <sys_wait>:

uint64
sys_wait(void)
{
    802031da:	1101                	addi	sp,sp,-32
    802031dc:	ec06                	sd	ra,24(sp)
    802031de:	e822                	sd	s0,16(sp)
    802031e0:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    802031e2:	fe840593          	addi	a1,s0,-24
    802031e6:	4501                	li	a0,0
    802031e8:	00000097          	auipc	ra,0x0
    802031ec:	d3a080e7          	jalr	-710(ra) # 80202f22 <argaddr>
    return -1;
    802031f0:	57fd                	li	a5,-1
  if(argaddr(0, &p) < 0)
    802031f2:	00054963          	bltz	a0,80203204 <sys_wait+0x2a>
  return wait(p);
    802031f6:	fe843503          	ld	a0,-24(s0)
    802031fa:	fffff097          	auipc	ra,0xfffff
    802031fe:	234080e7          	jalr	564(ra) # 8020242e <wait>
    80203202:	87aa                	mv	a5,a0
}
    80203204:	853e                	mv	a0,a5
    80203206:	60e2                	ld	ra,24(sp)
    80203208:	6442                	ld	s0,16(sp)
    8020320a:	6105                	addi	sp,sp,32
    8020320c:	8082                	ret

000000008020320e <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8020320e:	7179                	addi	sp,sp,-48
    80203210:	f406                	sd	ra,40(sp)
    80203212:	f022                	sd	s0,32(sp)
    80203214:	ec26                	sd	s1,24(sp)
    80203216:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203218:	fdc40593          	addi	a1,s0,-36
    8020321c:	4501                	li	a0,0
    8020321e:	00000097          	auipc	ra,0x0
    80203222:	ca2080e7          	jalr	-862(ra) # 80202ec0 <argint>
    return -1;
    80203226:	54fd                	li	s1,-1
  if(argint(0, &n) < 0)
    80203228:	00054f63          	bltz	a0,80203246 <sys_sbrk+0x38>
  addr = myproc()->sz;
    8020322c:	fffff097          	auipc	ra,0xfffff
    80203230:	894080e7          	jalr	-1900(ra) # 80201ac0 <myproc>
    80203234:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203236:	fdc42503          	lw	a0,-36(s0)
    8020323a:	fffff097          	auipc	ra,0xfffff
    8020323e:	c1e080e7          	jalr	-994(ra) # 80201e58 <growproc>
    80203242:	00054863          	bltz	a0,80203252 <sys_sbrk+0x44>
    return -1;
  return addr;
}
    80203246:	8526                	mv	a0,s1
    80203248:	70a2                	ld	ra,40(sp)
    8020324a:	7402                	ld	s0,32(sp)
    8020324c:	64e2                	ld	s1,24(sp)
    8020324e:	6145                	addi	sp,sp,48
    80203250:	8082                	ret
    return -1;
    80203252:	54fd                	li	s1,-1
    80203254:	bfcd                	j	80203246 <sys_sbrk+0x38>

0000000080203256 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203256:	7139                	addi	sp,sp,-64
    80203258:	fc06                	sd	ra,56(sp)
    8020325a:	f822                	sd	s0,48(sp)
    8020325c:	f426                	sd	s1,40(sp)
    8020325e:	f04a                	sd	s2,32(sp)
    80203260:	ec4e                	sd	s3,24(sp)
    80203262:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80203264:	fcc40593          	addi	a1,s0,-52
    80203268:	4501                	li	a0,0
    8020326a:	00000097          	auipc	ra,0x0
    8020326e:	c56080e7          	jalr	-938(ra) # 80202ec0 <argint>
    return -1;
    80203272:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203274:	06054763          	bltz	a0,802032e2 <sys_sleep+0x8c>
  acquire(&tickslock);
    80203278:	00007517          	auipc	a0,0x7
    8020327c:	ff053503          	ld	a0,-16(a0) # 8020a268 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203280:	ffffd097          	auipc	ra,0xffffd
    80203284:	458080e7          	jalr	1112(ra) # 802006d8 <acquire>
  ticks0 = ticks;
    80203288:	00007797          	auipc	a5,0x7
    8020328c:	ff07b783          	ld	a5,-16(a5) # 8020a278 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203290:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    80203294:	fcc42783          	lw	a5,-52(s0)
    80203298:	cf85                	beqz	a5,802032d0 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    8020329a:	00007997          	auipc	s3,0x7
    8020329e:	fce9b983          	ld	s3,-50(s3) # 8020a268 <_GLOBAL_OFFSET_TABLE_+0x30>
    802032a2:	00007497          	auipc	s1,0x7
    802032a6:	fd64b483          	ld	s1,-42(s1) # 8020a278 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    802032aa:	fffff097          	auipc	ra,0xfffff
    802032ae:	816080e7          	jalr	-2026(ra) # 80201ac0 <myproc>
    802032b2:	591c                	lw	a5,48(a0)
    802032b4:	ef9d                	bnez	a5,802032f2 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802032b6:	85ce                	mv	a1,s3
    802032b8:	8526                	mv	a0,s1
    802032ba:	fffff097          	auipc	ra,0xfffff
    802032be:	0f6080e7          	jalr	246(ra) # 802023b0 <sleep>
  while(ticks - ticks0 < n){
    802032c2:	409c                	lw	a5,0(s1)
    802032c4:	412787bb          	subw	a5,a5,s2
    802032c8:	fcc42703          	lw	a4,-52(s0)
    802032cc:	fce7efe3          	bltu	a5,a4,802032aa <sys_sleep+0x54>
  }
  release(&tickslock);
    802032d0:	00007517          	auipc	a0,0x7
    802032d4:	f9853503          	ld	a0,-104(a0) # 8020a268 <_GLOBAL_OFFSET_TABLE_+0x30>
    802032d8:	ffffd097          	auipc	ra,0xffffd
    802032dc:	454080e7          	jalr	1108(ra) # 8020072c <release>
  return 0;
    802032e0:	4781                	li	a5,0
}
    802032e2:	853e                	mv	a0,a5
    802032e4:	70e2                	ld	ra,56(sp)
    802032e6:	7442                	ld	s0,48(sp)
    802032e8:	74a2                	ld	s1,40(sp)
    802032ea:	7902                	ld	s2,32(sp)
    802032ec:	69e2                	ld	s3,24(sp)
    802032ee:	6121                	addi	sp,sp,64
    802032f0:	8082                	ret
      release(&tickslock);
    802032f2:	00007517          	auipc	a0,0x7
    802032f6:	f7653503          	ld	a0,-138(a0) # 8020a268 <_GLOBAL_OFFSET_TABLE_+0x30>
    802032fa:	ffffd097          	auipc	ra,0xffffd
    802032fe:	432080e7          	jalr	1074(ra) # 8020072c <release>
      return -1;
    80203302:	57fd                	li	a5,-1
    80203304:	bff9                	j	802032e2 <sys_sleep+0x8c>

0000000080203306 <sys_kill>:

uint64
sys_kill(void)
{
    80203306:	1101                	addi	sp,sp,-32
    80203308:	ec06                	sd	ra,24(sp)
    8020330a:	e822                	sd	s0,16(sp)
    8020330c:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    8020330e:	fec40593          	addi	a1,s0,-20
    80203312:	4501                	li	a0,0
    80203314:	00000097          	auipc	ra,0x0
    80203318:	bac080e7          	jalr	-1108(ra) # 80202ec0 <argint>
    return -1;
    8020331c:	57fd                	li	a5,-1
  if(argint(0, &pid) < 0)
    8020331e:	00054963          	bltz	a0,80203330 <sys_kill+0x2a>
  return kill(pid);
    80203322:	fec42503          	lw	a0,-20(s0)
    80203326:	fffff097          	auipc	ra,0xfffff
    8020332a:	276080e7          	jalr	630(ra) # 8020259c <kill>
    8020332e:	87aa                	mv	a5,a0
}
    80203330:	853e                	mv	a0,a5
    80203332:	60e2                	ld	ra,24(sp)
    80203334:	6442                	ld	s0,16(sp)
    80203336:	6105                	addi	sp,sp,32
    80203338:	8082                	ret

000000008020333a <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8020333a:	1101                	addi	sp,sp,-32
    8020333c:	ec06                	sd	ra,24(sp)
    8020333e:	e822                	sd	s0,16(sp)
    80203340:	e426                	sd	s1,8(sp)
    80203342:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203344:	00007517          	auipc	a0,0x7
    80203348:	f2453503          	ld	a0,-220(a0) # 8020a268 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020334c:	ffffd097          	auipc	ra,0xffffd
    80203350:	38c080e7          	jalr	908(ra) # 802006d8 <acquire>
  xticks = ticks;
    80203354:	00007797          	auipc	a5,0x7
    80203358:	f247b783          	ld	a5,-220(a5) # 8020a278 <_GLOBAL_OFFSET_TABLE_+0x40>
    8020335c:	4384                	lw	s1,0(a5)
  release(&tickslock);
    8020335e:	00007517          	auipc	a0,0x7
    80203362:	f0a53503          	ld	a0,-246(a0) # 8020a268 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203366:	ffffd097          	auipc	ra,0xffffd
    8020336a:	3c6080e7          	jalr	966(ra) # 8020072c <release>
  return xticks;
}
    8020336e:	02049513          	slli	a0,s1,0x20
    80203372:	9101                	srli	a0,a0,0x20
    80203374:	60e2                	ld	ra,24(sp)
    80203376:	6442                	ld	s0,16(sp)
    80203378:	64a2                	ld	s1,8(sp)
    8020337a:	6105                	addi	sp,sp,32
    8020337c:	8082                	ret

000000008020337e <sys_trace>:

uint64
sys_trace(void)
{
    8020337e:	1101                	addi	sp,sp,-32
    80203380:	ec06                	sd	ra,24(sp)
    80203382:	e822                	sd	s0,16(sp)
    80203384:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    80203386:	fec40593          	addi	a1,s0,-20
    8020338a:	4501                	li	a0,0
    8020338c:	00000097          	auipc	ra,0x0
    80203390:	b34080e7          	jalr	-1228(ra) # 80202ec0 <argint>
    return -1;
    80203394:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    80203396:	00054b63          	bltz	a0,802033ac <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    8020339a:	ffffe097          	auipc	ra,0xffffe
    8020339e:	726080e7          	jalr	1830(ra) # 80201ac0 <myproc>
    802033a2:	fec42783          	lw	a5,-20(s0)
    802033a6:	16f52823          	sw	a5,368(a0)
  return 0;
    802033aa:	4781                	li	a5,0
}
    802033ac:	853e                	mv	a0,a5
    802033ae:	60e2                	ld	ra,24(sp)
    802033b0:	6442                	ld	s0,16(sp)
    802033b2:	6105                	addi	sp,sp,32
    802033b4:	8082                	ret

00000000802033b6 <sys_setqos>:

uint64
sys_setqos(void)
{
    802033b6:	7139                	addi	sp,sp,-64
    802033b8:	fc06                	sd	ra,56(sp)
    802033ba:	f822                	sd	s0,48(sp)
    802033bc:	f426                	sd	s1,40(sp)
    802033be:	f04a                	sd	s2,32(sp)
    802033c0:	ec4e                	sd	s3,24(sp)
    802033c2:	0080                	addi	s0,sp,64
  int qos;
  if(argint(0, &qos) < 0)
    802033c4:	fcc40593          	addi	a1,s0,-52
    802033c8:	4501                	li	a0,0
    802033ca:	00000097          	auipc	ra,0x0
    802033ce:	af6080e7          	jalr	-1290(ra) # 80202ec0 <argint>
    802033d2:	08054163          	bltz	a0,80203454 <sys_setqos+0x9e>
    return -1;
  if(qos < 0 || qos > 100)
    802033d6:	fcc42703          	lw	a4,-52(s0)
    802033da:	06400793          	li	a5,100
    return -1;
    802033de:	557d                	li	a0,-1
  if(qos < 0 || qos > 100)
    802033e0:	04e7ee63          	bltu	a5,a4,8020343c <sys_setqos+0x86>
  int last_qos = myproc()->qos;
    802033e4:	ffffe097          	auipc	ra,0xffffe
    802033e8:	6dc080e7          	jalr	1756(ra) # 80201ac0 <myproc>
    802033ec:	17452483          	lw	s1,372(a0)
  myproc()->qos = qos;
    802033f0:	ffffe097          	auipc	ra,0xffffe
    802033f4:	6d0080e7          	jalr	1744(ra) # 80201ac0 <myproc>
    802033f8:	fcc42783          	lw	a5,-52(s0)
    802033fc:	16f52a23          	sw	a5,372(a0)
  printf("pid: %d qos: %d -> %d last_tick: %d\n", myproc()->pid, last_qos, qos, myproc()->last_tick);
    80203400:	ffffe097          	auipc	ra,0xffffe
    80203404:	6c0080e7          	jalr	1728(ra) # 80201ac0 <myproc>
    80203408:	03852903          	lw	s2,56(a0)
    8020340c:	fcc42983          	lw	s3,-52(s0)
    80203410:	ffffe097          	auipc	ra,0xffffe
    80203414:	6b0080e7          	jalr	1712(ra) # 80201ac0 <myproc>
    80203418:	17852703          	lw	a4,376(a0)
    8020341c:	86ce                	mv	a3,s3
    8020341e:	8626                	mv	a2,s1
    80203420:	85ca                	mv	a1,s2
    80203422:	00006517          	auipc	a0,0x6
    80203426:	68650513          	addi	a0,a0,1670 # 80209aa8 <etext+0xaa8>
    8020342a:	ffffd097          	auipc	ra,0xffffd
    8020342e:	d66080e7          	jalr	-666(ra) # 80200190 <printf>
  if(qos < last_qos)
    80203432:	fcc42783          	lw	a5,-52(s0)
    80203436:	0097ca63          	blt	a5,s1,8020344a <sys_setqos+0x94>
    yield();
  return last_qos;
    8020343a:	8526                	mv	a0,s1
    8020343c:	70e2                	ld	ra,56(sp)
    8020343e:	7442                	ld	s0,48(sp)
    80203440:	74a2                	ld	s1,40(sp)
    80203442:	7902                	ld	s2,32(sp)
    80203444:	69e2                	ld	s3,24(sp)
    80203446:	6121                	addi	sp,sp,64
    80203448:	8082                	ret
    yield();
    8020344a:	fffff097          	auipc	ra,0xfffff
    8020344e:	f2a080e7          	jalr	-214(ra) # 80202374 <yield>
    80203452:	b7e5                	j	8020343a <sys_setqos+0x84>
    return -1;
    80203454:	557d                	li	a0,-1
    80203456:	b7dd                	j	8020343c <sys_setqos+0x86>

0000000080203458 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80203458:	7139                	addi	sp,sp,-64
    8020345a:	fc06                	sd	ra,56(sp)
    8020345c:	f822                	sd	s0,48(sp)
    8020345e:	f426                	sd	s1,40(sp)
    80203460:	f04a                	sd	s2,32(sp)
    80203462:	ec4e                	sd	s3,24(sp)
    80203464:	e852                	sd	s4,16(sp)
    80203466:	e456                	sd	s5,8(sp)
    80203468:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8020346a:	00006597          	auipc	a1,0x6
    8020346e:	66658593          	addi	a1,a1,1638 # 80209ad0 <etext+0xad0>
    80203472:	00015517          	auipc	a0,0x15
    80203476:	80e50513          	addi	a0,a0,-2034 # 80217c80 <bcache>
    8020347a:	ffffd097          	auipc	ra,0xffffd
    8020347e:	21a080e7          	jalr	538(ra) # 80200694 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203482:	00018797          	auipc	a5,0x18
    80203486:	7fe78793          	addi	a5,a5,2046 # 8021bc80 <bcache+0x4000>
    8020348a:	00019717          	auipc	a4,0x19
    8020348e:	e5e70713          	addi	a4,a4,-418 # 8021c2e8 <bcache+0x4668>
    80203492:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203496:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020349a:	00014497          	auipc	s1,0x14
    8020349e:	7fe48493          	addi	s1,s1,2046 # 80217c98 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    802034a2:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    802034a4:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    802034a6:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    802034a8:	00006a97          	auipc	s5,0x6
    802034ac:	630a8a93          	addi	s5,s5,1584 # 80209ad8 <etext+0xad8>
    b->refcnt = 0;
    802034b0:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    802034b4:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    802034b8:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    802034bc:	6b893783          	ld	a5,1720(s2)
    802034c0:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    802034c2:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    802034c6:	85d6                	mv	a1,s5
    802034c8:	01048513          	addi	a0,s1,16
    802034cc:	00000097          	auipc	ra,0x0
    802034d0:	280080e7          	jalr	640(ra) # 8020374c <initsleeplock>
    bcache.head.next->prev = b;
    802034d4:	6b893783          	ld	a5,1720(s2)
    802034d8:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    802034da:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    802034de:	25848493          	addi	s1,s1,600
    802034e2:	fd3497e3          	bne	s1,s3,802034b0 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
  #endif
}
    802034e6:	70e2                	ld	ra,56(sp)
    802034e8:	7442                	ld	s0,48(sp)
    802034ea:	74a2                	ld	s1,40(sp)
    802034ec:	7902                	ld	s2,32(sp)
    802034ee:	69e2                	ld	s3,24(sp)
    802034f0:	6a42                	ld	s4,16(sp)
    802034f2:	6aa2                	ld	s5,8(sp)
    802034f4:	6121                	addi	sp,sp,64
    802034f6:	8082                	ret

00000000802034f8 <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    802034f8:	7179                	addi	sp,sp,-48
    802034fa:	f406                	sd	ra,40(sp)
    802034fc:	f022                	sd	s0,32(sp)
    802034fe:	ec26                	sd	s1,24(sp)
    80203500:	e84a                	sd	s2,16(sp)
    80203502:	e44e                	sd	s3,8(sp)
    80203504:	1800                	addi	s0,sp,48
    80203506:	89aa                	mv	s3,a0
    80203508:	892e                	mv	s2,a1
  acquire(&bcache.lock);
    8020350a:	00014517          	auipc	a0,0x14
    8020350e:	77650513          	addi	a0,a0,1910 # 80217c80 <bcache>
    80203512:	ffffd097          	auipc	ra,0xffffd
    80203516:	1c6080e7          	jalr	454(ra) # 802006d8 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8020351a:	00018797          	auipc	a5,0x18
    8020351e:	76678793          	addi	a5,a5,1894 # 8021bc80 <bcache+0x4000>
    80203522:	6b87b483          	ld	s1,1720(a5)
    80203526:	00019797          	auipc	a5,0x19
    8020352a:	dc278793          	addi	a5,a5,-574 # 8021c2e8 <bcache+0x4668>
    8020352e:	02f48f63          	beq	s1,a5,8020356c <bread+0x74>
    80203532:	873e                	mv	a4,a5
    80203534:	a021                	j	8020353c <bread+0x44>
    80203536:	68a4                	ld	s1,80(s1)
    80203538:	02e48a63          	beq	s1,a4,8020356c <bread+0x74>
    if(b->dev == dev && b->sectorno == sectorno){
    8020353c:	449c                	lw	a5,8(s1)
    8020353e:	ff379ce3          	bne	a5,s3,80203536 <bread+0x3e>
    80203542:	44dc                	lw	a5,12(s1)
    80203544:	ff2799e3          	bne	a5,s2,80203536 <bread+0x3e>
      b->refcnt++;
    80203548:	40bc                	lw	a5,64(s1)
    8020354a:	2785                	addiw	a5,a5,1
    8020354c:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8020354e:	00014517          	auipc	a0,0x14
    80203552:	73250513          	addi	a0,a0,1842 # 80217c80 <bcache>
    80203556:	ffffd097          	auipc	ra,0xffffd
    8020355a:	1d6080e7          	jalr	470(ra) # 8020072c <release>
      acquiresleep(&b->lock);
    8020355e:	01048513          	addi	a0,s1,16
    80203562:	00000097          	auipc	ra,0x0
    80203566:	224080e7          	jalr	548(ra) # 80203786 <acquiresleep>
      return b;
    8020356a:	a8b1                	j	802035c6 <bread+0xce>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020356c:	00018797          	auipc	a5,0x18
    80203570:	71478793          	addi	a5,a5,1812 # 8021bc80 <bcache+0x4000>
    80203574:	6b07b483          	ld	s1,1712(a5)
    80203578:	00019797          	auipc	a5,0x19
    8020357c:	d7078793          	addi	a5,a5,-656 # 8021c2e8 <bcache+0x4668>
    80203580:	04f48d63          	beq	s1,a5,802035da <bread+0xe2>
    if(b->refcnt == 0) {
    80203584:	40bc                	lw	a5,64(s1)
    80203586:	cb91                	beqz	a5,8020359a <bread+0xa2>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203588:	00019717          	auipc	a4,0x19
    8020358c:	d6070713          	addi	a4,a4,-672 # 8021c2e8 <bcache+0x4668>
    80203590:	64a4                	ld	s1,72(s1)
    80203592:	04e48463          	beq	s1,a4,802035da <bread+0xe2>
    if(b->refcnt == 0) {
    80203596:	40bc                	lw	a5,64(s1)
    80203598:	ffe5                	bnez	a5,80203590 <bread+0x98>
      b->dev = dev;
    8020359a:	0134a423          	sw	s3,8(s1)
      b->sectorno = sectorno;
    8020359e:	0124a623          	sw	s2,12(s1)
      b->valid = 0;
    802035a2:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    802035a6:	4785                	li	a5,1
    802035a8:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    802035aa:	00014517          	auipc	a0,0x14
    802035ae:	6d650513          	addi	a0,a0,1750 # 80217c80 <bcache>
    802035b2:	ffffd097          	auipc	ra,0xffffd
    802035b6:	17a080e7          	jalr	378(ra) # 8020072c <release>
      acquiresleep(&b->lock);
    802035ba:	01048513          	addi	a0,s1,16
    802035be:	00000097          	auipc	ra,0x0
    802035c2:	1c8080e7          	jalr	456(ra) # 80203786 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    802035c6:	409c                	lw	a5,0(s1)
    802035c8:	c38d                	beqz	a5,802035ea <bread+0xf2>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    802035ca:	8526                	mv	a0,s1
    802035cc:	70a2                	ld	ra,40(sp)
    802035ce:	7402                	ld	s0,32(sp)
    802035d0:	64e2                	ld	s1,24(sp)
    802035d2:	6942                	ld	s2,16(sp)
    802035d4:	69a2                	ld	s3,8(sp)
    802035d6:	6145                	addi	sp,sp,48
    802035d8:	8082                	ret
  panic("bget: no buffers");
    802035da:	00006517          	auipc	a0,0x6
    802035de:	50650513          	addi	a0,a0,1286 # 80209ae0 <etext+0xae0>
    802035e2:	ffffd097          	auipc	ra,0xffffd
    802035e6:	b64080e7          	jalr	-1180(ra) # 80200146 <panic>
    disk_read(b);
    802035ea:	8526                	mv	a0,s1
    802035ec:	00002097          	auipc	ra,0x2
    802035f0:	bfc080e7          	jalr	-1028(ra) # 802051e8 <disk_read>
    b->valid = 1;
    802035f4:	4785                	li	a5,1
    802035f6:	c09c                	sw	a5,0(s1)
  return b;
    802035f8:	bfc9                	j	802035ca <bread+0xd2>

00000000802035fa <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    802035fa:	1101                	addi	sp,sp,-32
    802035fc:	ec06                	sd	ra,24(sp)
    802035fe:	e822                	sd	s0,16(sp)
    80203600:	e426                	sd	s1,8(sp)
    80203602:	1000                	addi	s0,sp,32
    80203604:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203606:	0541                	addi	a0,a0,16
    80203608:	00000097          	auipc	ra,0x0
    8020360c:	218080e7          	jalr	536(ra) # 80203820 <holdingsleep>
    80203610:	c919                	beqz	a0,80203626 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    80203612:	8526                	mv	a0,s1
    80203614:	00002097          	auipc	ra,0x2
    80203618:	bee080e7          	jalr	-1042(ra) # 80205202 <disk_write>
}
    8020361c:	60e2                	ld	ra,24(sp)
    8020361e:	6442                	ld	s0,16(sp)
    80203620:	64a2                	ld	s1,8(sp)
    80203622:	6105                	addi	sp,sp,32
    80203624:	8082                	ret
    panic("bwrite");
    80203626:	00006517          	auipc	a0,0x6
    8020362a:	4d250513          	addi	a0,a0,1234 # 80209af8 <etext+0xaf8>
    8020362e:	ffffd097          	auipc	ra,0xffffd
    80203632:	b18080e7          	jalr	-1256(ra) # 80200146 <panic>

0000000080203636 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80203636:	1101                	addi	sp,sp,-32
    80203638:	ec06                	sd	ra,24(sp)
    8020363a:	e822                	sd	s0,16(sp)
    8020363c:	e426                	sd	s1,8(sp)
    8020363e:	e04a                	sd	s2,0(sp)
    80203640:	1000                	addi	s0,sp,32
    80203642:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    80203644:	01050913          	addi	s2,a0,16
    80203648:	854a                	mv	a0,s2
    8020364a:	00000097          	auipc	ra,0x0
    8020364e:	1d6080e7          	jalr	470(ra) # 80203820 <holdingsleep>
    80203652:	c92d                	beqz	a0,802036c4 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203654:	854a                	mv	a0,s2
    80203656:	00000097          	auipc	ra,0x0
    8020365a:	186080e7          	jalr	390(ra) # 802037dc <releasesleep>

  acquire(&bcache.lock);
    8020365e:	00014517          	auipc	a0,0x14
    80203662:	62250513          	addi	a0,a0,1570 # 80217c80 <bcache>
    80203666:	ffffd097          	auipc	ra,0xffffd
    8020366a:	072080e7          	jalr	114(ra) # 802006d8 <acquire>
  b->refcnt--;
    8020366e:	40bc                	lw	a5,64(s1)
    80203670:	37fd                	addiw	a5,a5,-1
    80203672:	0007871b          	sext.w	a4,a5
    80203676:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203678:	eb05                	bnez	a4,802036a8 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8020367a:	68bc                	ld	a5,80(s1)
    8020367c:	64b8                	ld	a4,72(s1)
    8020367e:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203680:	64bc                	ld	a5,72(s1)
    80203682:	68b8                	ld	a4,80(s1)
    80203684:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203686:	00018797          	auipc	a5,0x18
    8020368a:	5fa78793          	addi	a5,a5,1530 # 8021bc80 <bcache+0x4000>
    8020368e:	6b87b703          	ld	a4,1720(a5)
    80203692:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203694:	00019717          	auipc	a4,0x19
    80203698:	c5470713          	addi	a4,a4,-940 # 8021c2e8 <bcache+0x4668>
    8020369c:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    8020369e:	6b87b703          	ld	a4,1720(a5)
    802036a2:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    802036a4:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    802036a8:	00014517          	auipc	a0,0x14
    802036ac:	5d850513          	addi	a0,a0,1496 # 80217c80 <bcache>
    802036b0:	ffffd097          	auipc	ra,0xffffd
    802036b4:	07c080e7          	jalr	124(ra) # 8020072c <release>
}
    802036b8:	60e2                	ld	ra,24(sp)
    802036ba:	6442                	ld	s0,16(sp)
    802036bc:	64a2                	ld	s1,8(sp)
    802036be:	6902                	ld	s2,0(sp)
    802036c0:	6105                	addi	sp,sp,32
    802036c2:	8082                	ret
    panic("brelse");
    802036c4:	00006517          	auipc	a0,0x6
    802036c8:	43c50513          	addi	a0,a0,1084 # 80209b00 <etext+0xb00>
    802036cc:	ffffd097          	auipc	ra,0xffffd
    802036d0:	a7a080e7          	jalr	-1414(ra) # 80200146 <panic>

00000000802036d4 <bpin>:

void
bpin(struct buf *b) {
    802036d4:	1101                	addi	sp,sp,-32
    802036d6:	ec06                	sd	ra,24(sp)
    802036d8:	e822                	sd	s0,16(sp)
    802036da:	e426                	sd	s1,8(sp)
    802036dc:	1000                	addi	s0,sp,32
    802036de:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802036e0:	00014517          	auipc	a0,0x14
    802036e4:	5a050513          	addi	a0,a0,1440 # 80217c80 <bcache>
    802036e8:	ffffd097          	auipc	ra,0xffffd
    802036ec:	ff0080e7          	jalr	-16(ra) # 802006d8 <acquire>
  b->refcnt++;
    802036f0:	40bc                	lw	a5,64(s1)
    802036f2:	2785                	addiw	a5,a5,1
    802036f4:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802036f6:	00014517          	auipc	a0,0x14
    802036fa:	58a50513          	addi	a0,a0,1418 # 80217c80 <bcache>
    802036fe:	ffffd097          	auipc	ra,0xffffd
    80203702:	02e080e7          	jalr	46(ra) # 8020072c <release>
}
    80203706:	60e2                	ld	ra,24(sp)
    80203708:	6442                	ld	s0,16(sp)
    8020370a:	64a2                	ld	s1,8(sp)
    8020370c:	6105                	addi	sp,sp,32
    8020370e:	8082                	ret

0000000080203710 <bunpin>:

void
bunpin(struct buf *b) {
    80203710:	1101                	addi	sp,sp,-32
    80203712:	ec06                	sd	ra,24(sp)
    80203714:	e822                	sd	s0,16(sp)
    80203716:	e426                	sd	s1,8(sp)
    80203718:	1000                	addi	s0,sp,32
    8020371a:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    8020371c:	00014517          	auipc	a0,0x14
    80203720:	56450513          	addi	a0,a0,1380 # 80217c80 <bcache>
    80203724:	ffffd097          	auipc	ra,0xffffd
    80203728:	fb4080e7          	jalr	-76(ra) # 802006d8 <acquire>
  b->refcnt--;
    8020372c:	40bc                	lw	a5,64(s1)
    8020372e:	37fd                	addiw	a5,a5,-1
    80203730:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    80203732:	00014517          	auipc	a0,0x14
    80203736:	54e50513          	addi	a0,a0,1358 # 80217c80 <bcache>
    8020373a:	ffffd097          	auipc	ra,0xffffd
    8020373e:	ff2080e7          	jalr	-14(ra) # 8020072c <release>
}
    80203742:	60e2                	ld	ra,24(sp)
    80203744:	6442                	ld	s0,16(sp)
    80203746:	64a2                	ld	s1,8(sp)
    80203748:	6105                	addi	sp,sp,32
    8020374a:	8082                	ret

000000008020374c <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8020374c:	1101                	addi	sp,sp,-32
    8020374e:	ec06                	sd	ra,24(sp)
    80203750:	e822                	sd	s0,16(sp)
    80203752:	e426                	sd	s1,8(sp)
    80203754:	e04a                	sd	s2,0(sp)
    80203756:	1000                	addi	s0,sp,32
    80203758:	84aa                	mv	s1,a0
    8020375a:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    8020375c:	00006597          	auipc	a1,0x6
    80203760:	3ac58593          	addi	a1,a1,940 # 80209b08 <etext+0xb08>
    80203764:	0521                	addi	a0,a0,8
    80203766:	ffffd097          	auipc	ra,0xffffd
    8020376a:	f2e080e7          	jalr	-210(ra) # 80200694 <initlock>
  lk->name = name;
    8020376e:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203772:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203776:	0204a423          	sw	zero,40(s1)
}
    8020377a:	60e2                	ld	ra,24(sp)
    8020377c:	6442                	ld	s0,16(sp)
    8020377e:	64a2                	ld	s1,8(sp)
    80203780:	6902                	ld	s2,0(sp)
    80203782:	6105                	addi	sp,sp,32
    80203784:	8082                	ret

0000000080203786 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203786:	1101                	addi	sp,sp,-32
    80203788:	ec06                	sd	ra,24(sp)
    8020378a:	e822                	sd	s0,16(sp)
    8020378c:	e426                	sd	s1,8(sp)
    8020378e:	e04a                	sd	s2,0(sp)
    80203790:	1000                	addi	s0,sp,32
    80203792:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203794:	00850913          	addi	s2,a0,8
    80203798:	854a                	mv	a0,s2
    8020379a:	ffffd097          	auipc	ra,0xffffd
    8020379e:	f3e080e7          	jalr	-194(ra) # 802006d8 <acquire>
  while (lk->locked) {
    802037a2:	409c                	lw	a5,0(s1)
    802037a4:	cb89                	beqz	a5,802037b6 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    802037a6:	85ca                	mv	a1,s2
    802037a8:	8526                	mv	a0,s1
    802037aa:	fffff097          	auipc	ra,0xfffff
    802037ae:	c06080e7          	jalr	-1018(ra) # 802023b0 <sleep>
  while (lk->locked) {
    802037b2:	409c                	lw	a5,0(s1)
    802037b4:	fbed                	bnez	a5,802037a6 <acquiresleep+0x20>
  }
  lk->locked = 1;
    802037b6:	4785                	li	a5,1
    802037b8:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    802037ba:	ffffe097          	auipc	ra,0xffffe
    802037be:	306080e7          	jalr	774(ra) # 80201ac0 <myproc>
    802037c2:	5d1c                	lw	a5,56(a0)
    802037c4:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    802037c6:	854a                	mv	a0,s2
    802037c8:	ffffd097          	auipc	ra,0xffffd
    802037cc:	f64080e7          	jalr	-156(ra) # 8020072c <release>
}
    802037d0:	60e2                	ld	ra,24(sp)
    802037d2:	6442                	ld	s0,16(sp)
    802037d4:	64a2                	ld	s1,8(sp)
    802037d6:	6902                	ld	s2,0(sp)
    802037d8:	6105                	addi	sp,sp,32
    802037da:	8082                	ret

00000000802037dc <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    802037dc:	1101                	addi	sp,sp,-32
    802037de:	ec06                	sd	ra,24(sp)
    802037e0:	e822                	sd	s0,16(sp)
    802037e2:	e426                	sd	s1,8(sp)
    802037e4:	e04a                	sd	s2,0(sp)
    802037e6:	1000                	addi	s0,sp,32
    802037e8:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    802037ea:	00850913          	addi	s2,a0,8
    802037ee:	854a                	mv	a0,s2
    802037f0:	ffffd097          	auipc	ra,0xffffd
    802037f4:	ee8080e7          	jalr	-280(ra) # 802006d8 <acquire>
  lk->locked = 0;
    802037f8:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    802037fc:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    80203800:	8526                	mv	a0,s1
    80203802:	fffff097          	auipc	ra,0xfffff
    80203806:	d30080e7          	jalr	-720(ra) # 80202532 <wakeup>
  release(&lk->lk);
    8020380a:	854a                	mv	a0,s2
    8020380c:	ffffd097          	auipc	ra,0xffffd
    80203810:	f20080e7          	jalr	-224(ra) # 8020072c <release>
}
    80203814:	60e2                	ld	ra,24(sp)
    80203816:	6442                	ld	s0,16(sp)
    80203818:	64a2                	ld	s1,8(sp)
    8020381a:	6902                	ld	s2,0(sp)
    8020381c:	6105                	addi	sp,sp,32
    8020381e:	8082                	ret

0000000080203820 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80203820:	7179                	addi	sp,sp,-48
    80203822:	f406                	sd	ra,40(sp)
    80203824:	f022                	sd	s0,32(sp)
    80203826:	ec26                	sd	s1,24(sp)
    80203828:	e84a                	sd	s2,16(sp)
    8020382a:	e44e                	sd	s3,8(sp)
    8020382c:	1800                	addi	s0,sp,48
    8020382e:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    80203830:	00850913          	addi	s2,a0,8
    80203834:	854a                	mv	a0,s2
    80203836:	ffffd097          	auipc	ra,0xffffd
    8020383a:	ea2080e7          	jalr	-350(ra) # 802006d8 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    8020383e:	409c                	lw	a5,0(s1)
    80203840:	ef99                	bnez	a5,8020385e <holdingsleep+0x3e>
    80203842:	4481                	li	s1,0
  release(&lk->lk);
    80203844:	854a                	mv	a0,s2
    80203846:	ffffd097          	auipc	ra,0xffffd
    8020384a:	ee6080e7          	jalr	-282(ra) # 8020072c <release>
  return r;
}
    8020384e:	8526                	mv	a0,s1
    80203850:	70a2                	ld	ra,40(sp)
    80203852:	7402                	ld	s0,32(sp)
    80203854:	64e2                	ld	s1,24(sp)
    80203856:	6942                	ld	s2,16(sp)
    80203858:	69a2                	ld	s3,8(sp)
    8020385a:	6145                	addi	sp,sp,48
    8020385c:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    8020385e:	0284a983          	lw	s3,40(s1)
    80203862:	ffffe097          	auipc	ra,0xffffe
    80203866:	25e080e7          	jalr	606(ra) # 80201ac0 <myproc>
    8020386a:	5d04                	lw	s1,56(a0)
    8020386c:	413484b3          	sub	s1,s1,s3
    80203870:	0014b493          	seqz	s1,s1
    80203874:	bfc1                	j	80203844 <holdingsleep+0x24>

0000000080203876 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203876:	1101                	addi	sp,sp,-32
    80203878:	ec06                	sd	ra,24(sp)
    8020387a:	e822                	sd	s0,16(sp)
    8020387c:	e426                	sd	s1,8(sp)
    8020387e:	e04a                	sd	s2,0(sp)
    80203880:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203882:	00006597          	auipc	a1,0x6
    80203886:	29658593          	addi	a1,a1,662 # 80209b18 <etext+0xb18>
    8020388a:	00019517          	auipc	a0,0x19
    8020388e:	d5650513          	addi	a0,a0,-682 # 8021c5e0 <ftable>
    80203892:	ffffd097          	auipc	ra,0xffffd
    80203896:	e02080e7          	jalr	-510(ra) # 80200694 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    8020389a:	00019497          	auipc	s1,0x19
    8020389e:	d5e48493          	addi	s1,s1,-674 # 8021c5f8 <ftable+0x18>
    802038a2:	0001a917          	auipc	s2,0x1a
    802038a6:	cf690913          	addi	s2,s2,-778 # 8021d598 <tickslock>
    memset(f, 0, sizeof(struct file));
    802038aa:	02800613          	li	a2,40
    802038ae:	4581                	li	a1,0
    802038b0:	8526                	mv	a0,s1
    802038b2:	ffffd097          	auipc	ra,0xffffd
    802038b6:	ec2080e7          	jalr	-318(ra) # 80200774 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802038ba:	02848493          	addi	s1,s1,40
    802038be:	ff2496e3          	bne	s1,s2,802038aa <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
  #endif
}
    802038c2:	60e2                	ld	ra,24(sp)
    802038c4:	6442                	ld	s0,16(sp)
    802038c6:	64a2                	ld	s1,8(sp)
    802038c8:	6902                	ld	s2,0(sp)
    802038ca:	6105                	addi	sp,sp,32
    802038cc:	8082                	ret

00000000802038ce <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    802038ce:	1101                	addi	sp,sp,-32
    802038d0:	ec06                	sd	ra,24(sp)
    802038d2:	e822                	sd	s0,16(sp)
    802038d4:	e426                	sd	s1,8(sp)
    802038d6:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    802038d8:	00019517          	auipc	a0,0x19
    802038dc:	d0850513          	addi	a0,a0,-760 # 8021c5e0 <ftable>
    802038e0:	ffffd097          	auipc	ra,0xffffd
    802038e4:	df8080e7          	jalr	-520(ra) # 802006d8 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
    802038e8:	00019797          	auipc	a5,0x19
    802038ec:	cf878793          	addi	a5,a5,-776 # 8021c5e0 <ftable>
    802038f0:	4fdc                	lw	a5,28(a5)
    802038f2:	cb8d                	beqz	a5,80203924 <filealloc+0x56>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    802038f4:	00019497          	auipc	s1,0x19
    802038f8:	d2c48493          	addi	s1,s1,-724 # 8021c620 <ftable+0x40>
    802038fc:	0001a717          	auipc	a4,0x1a
    80203900:	c9c70713          	addi	a4,a4,-868 # 8021d598 <tickslock>
    if(f->ref == 0){
    80203904:	40dc                	lw	a5,4(s1)
    80203906:	c39d                	beqz	a5,8020392c <filealloc+0x5e>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203908:	02848493          	addi	s1,s1,40
    8020390c:	fee49ce3          	bne	s1,a4,80203904 <filealloc+0x36>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203910:	00019517          	auipc	a0,0x19
    80203914:	cd050513          	addi	a0,a0,-816 # 8021c5e0 <ftable>
    80203918:	ffffd097          	auipc	ra,0xffffd
    8020391c:	e14080e7          	jalr	-492(ra) # 8020072c <release>
  return NULL;
    80203920:	4481                	li	s1,0
    80203922:	a839                	j	80203940 <filealloc+0x72>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203924:	00019497          	auipc	s1,0x19
    80203928:	cd448493          	addi	s1,s1,-812 # 8021c5f8 <ftable+0x18>
      f->ref = 1;
    8020392c:	4785                	li	a5,1
    8020392e:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203930:	00019517          	auipc	a0,0x19
    80203934:	cb050513          	addi	a0,a0,-848 # 8021c5e0 <ftable>
    80203938:	ffffd097          	auipc	ra,0xffffd
    8020393c:	df4080e7          	jalr	-524(ra) # 8020072c <release>
}
    80203940:	8526                	mv	a0,s1
    80203942:	60e2                	ld	ra,24(sp)
    80203944:	6442                	ld	s0,16(sp)
    80203946:	64a2                	ld	s1,8(sp)
    80203948:	6105                	addi	sp,sp,32
    8020394a:	8082                	ret

000000008020394c <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    8020394c:	1101                	addi	sp,sp,-32
    8020394e:	ec06                	sd	ra,24(sp)
    80203950:	e822                	sd	s0,16(sp)
    80203952:	e426                	sd	s1,8(sp)
    80203954:	1000                	addi	s0,sp,32
    80203956:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203958:	00019517          	auipc	a0,0x19
    8020395c:	c8850513          	addi	a0,a0,-888 # 8021c5e0 <ftable>
    80203960:	ffffd097          	auipc	ra,0xffffd
    80203964:	d78080e7          	jalr	-648(ra) # 802006d8 <acquire>
  if(f->ref < 1)
    80203968:	40dc                	lw	a5,4(s1)
    8020396a:	02f05263          	blez	a5,8020398e <filedup+0x42>
    panic("filedup");
  f->ref++;
    8020396e:	2785                	addiw	a5,a5,1
    80203970:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203972:	00019517          	auipc	a0,0x19
    80203976:	c6e50513          	addi	a0,a0,-914 # 8021c5e0 <ftable>
    8020397a:	ffffd097          	auipc	ra,0xffffd
    8020397e:	db2080e7          	jalr	-590(ra) # 8020072c <release>
  return f;
}
    80203982:	8526                	mv	a0,s1
    80203984:	60e2                	ld	ra,24(sp)
    80203986:	6442                	ld	s0,16(sp)
    80203988:	64a2                	ld	s1,8(sp)
    8020398a:	6105                	addi	sp,sp,32
    8020398c:	8082                	ret
    panic("filedup");
    8020398e:	00006517          	auipc	a0,0x6
    80203992:	19250513          	addi	a0,a0,402 # 80209b20 <etext+0xb20>
    80203996:	ffffc097          	auipc	ra,0xffffc
    8020399a:	7b0080e7          	jalr	1968(ra) # 80200146 <panic>

000000008020399e <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    8020399e:	7139                	addi	sp,sp,-64
    802039a0:	fc06                	sd	ra,56(sp)
    802039a2:	f822                	sd	s0,48(sp)
    802039a4:	f426                	sd	s1,40(sp)
    802039a6:	f04a                	sd	s2,32(sp)
    802039a8:	ec4e                	sd	s3,24(sp)
    802039aa:	e852                	sd	s4,16(sp)
    802039ac:	e456                	sd	s5,8(sp)
    802039ae:	0080                	addi	s0,sp,64
    802039b0:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    802039b2:	00019517          	auipc	a0,0x19
    802039b6:	c2e50513          	addi	a0,a0,-978 # 8021c5e0 <ftable>
    802039ba:	ffffd097          	auipc	ra,0xffffd
    802039be:	d1e080e7          	jalr	-738(ra) # 802006d8 <acquire>
  if(f->ref < 1)
    802039c2:	40dc                	lw	a5,4(s1)
    802039c4:	04f05863          	blez	a5,80203a14 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    802039c8:	37fd                	addiw	a5,a5,-1
    802039ca:	0007871b          	sext.w	a4,a5
    802039ce:	c0dc                	sw	a5,4(s1)
    802039d0:	04e04a63          	bgtz	a4,80203a24 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    802039d4:	0004a903          	lw	s2,0(s1)
    802039d8:	0094ca03          	lbu	s4,9(s1)
    802039dc:	0104b983          	ld	s3,16(s1)
    802039e0:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    802039e4:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    802039e8:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    802039ec:	00019517          	auipc	a0,0x19
    802039f0:	bf450513          	addi	a0,a0,-1036 # 8021c5e0 <ftable>
    802039f4:	ffffd097          	auipc	ra,0xffffd
    802039f8:	d38080e7          	jalr	-712(ra) # 8020072c <release>

  if(ff.type == FD_PIPE){
    802039fc:	4785                	li	a5,1
    802039fe:	04f90463          	beq	s2,a5,80203a46 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203a02:	4789                	li	a5,2
    80203a04:	02f91863          	bne	s2,a5,80203a34 <fileclose+0x96>
    eput(ff.ep);
    80203a08:	8556                	mv	a0,s5
    80203a0a:	00003097          	auipc	ra,0x3
    80203a0e:	a2a080e7          	jalr	-1494(ra) # 80206434 <eput>
    80203a12:	a00d                	j	80203a34 <fileclose+0x96>
    panic("fileclose");
    80203a14:	00006517          	auipc	a0,0x6
    80203a18:	11450513          	addi	a0,a0,276 # 80209b28 <etext+0xb28>
    80203a1c:	ffffc097          	auipc	ra,0xffffc
    80203a20:	72a080e7          	jalr	1834(ra) # 80200146 <panic>
    release(&ftable.lock);
    80203a24:	00019517          	auipc	a0,0x19
    80203a28:	bbc50513          	addi	a0,a0,-1092 # 8021c5e0 <ftable>
    80203a2c:	ffffd097          	auipc	ra,0xffffd
    80203a30:	d00080e7          	jalr	-768(ra) # 8020072c <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203a34:	70e2                	ld	ra,56(sp)
    80203a36:	7442                	ld	s0,48(sp)
    80203a38:	74a2                	ld	s1,40(sp)
    80203a3a:	7902                	ld	s2,32(sp)
    80203a3c:	69e2                	ld	s3,24(sp)
    80203a3e:	6a42                	ld	s4,16(sp)
    80203a40:	6aa2                	ld	s5,8(sp)
    80203a42:	6121                	addi	sp,sp,64
    80203a44:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203a46:	85d2                	mv	a1,s4
    80203a48:	854e                	mv	a0,s3
    80203a4a:	00000097          	auipc	ra,0x0
    80203a4e:	3a4080e7          	jalr	932(ra) # 80203dee <pipeclose>
    80203a52:	b7cd                	j	80203a34 <fileclose+0x96>

0000000080203a54 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203a54:	4118                	lw	a4,0(a0)
    80203a56:	4789                	li	a5,2
    80203a58:	04f71e63          	bne	a4,a5,80203ab4 <filestat+0x60>
{
    80203a5c:	7159                	addi	sp,sp,-112
    80203a5e:	f486                	sd	ra,104(sp)
    80203a60:	f0a2                	sd	s0,96(sp)
    80203a62:	eca6                	sd	s1,88(sp)
    80203a64:	e8ca                	sd	s2,80(sp)
    80203a66:	e4ce                	sd	s3,72(sp)
    80203a68:	1880                	addi	s0,sp,112
    80203a6a:	892e                	mv	s2,a1
    80203a6c:	84aa                	mv	s1,a0
    elock(f->ep);
    80203a6e:	6d08                	ld	a0,24(a0)
    80203a70:	00003097          	auipc	ra,0x3
    80203a74:	940080e7          	jalr	-1728(ra) # 802063b0 <elock>
    estat(f->ep, &st);
    80203a78:	f9840993          	addi	s3,s0,-104
    80203a7c:	85ce                	mv	a1,s3
    80203a7e:	6c88                	ld	a0,24(s1)
    80203a80:	00003097          	auipc	ra,0x3
    80203a84:	aec080e7          	jalr	-1300(ra) # 8020656c <estat>
    eunlock(f->ep);
    80203a88:	6c88                	ld	a0,24(s1)
    80203a8a:	00003097          	auipc	ra,0x3
    80203a8e:	95c080e7          	jalr	-1700(ra) # 802063e6 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203a92:	03800613          	li	a2,56
    80203a96:	85ce                	mv	a1,s3
    80203a98:	854a                	mv	a0,s2
    80203a9a:	ffffe097          	auipc	ra,0xffffe
    80203a9e:	928080e7          	jalr	-1752(ra) # 802013c2 <copyout2>
    80203aa2:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203aa6:	70a6                	ld	ra,104(sp)
    80203aa8:	7406                	ld	s0,96(sp)
    80203aaa:	64e6                	ld	s1,88(sp)
    80203aac:	6946                	ld	s2,80(sp)
    80203aae:	69a6                	ld	s3,72(sp)
    80203ab0:	6165                	addi	sp,sp,112
    80203ab2:	8082                	ret
  return -1;
    80203ab4:	557d                	li	a0,-1
}
    80203ab6:	8082                	ret

0000000080203ab8 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203ab8:	7179                	addi	sp,sp,-48
    80203aba:	f406                	sd	ra,40(sp)
    80203abc:	f022                	sd	s0,32(sp)
    80203abe:	ec26                	sd	s1,24(sp)
    80203ac0:	e84a                	sd	s2,16(sp)
    80203ac2:	e44e                	sd	s3,8(sp)
    80203ac4:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203ac6:	00854783          	lbu	a5,8(a0)
    80203aca:	c3d5                	beqz	a5,80203b6e <fileread+0xb6>
    80203acc:	89b2                	mv	s3,a2
    80203ace:	892e                	mv	s2,a1
    80203ad0:	84aa                	mv	s1,a0
    return -1;

  switch (f->type) {
    80203ad2:	411c                	lw	a5,0(a0)
    80203ad4:	4709                	li	a4,2
    80203ad6:	06e78263          	beq	a5,a4,80203b3a <fileread+0x82>
    80203ada:	470d                	li	a4,3
    80203adc:	02e78b63          	beq	a5,a4,80203b12 <fileread+0x5a>
    80203ae0:	4705                	li	a4,1
    80203ae2:	00e78a63          	beq	a5,a4,80203af6 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203ae6:	00006517          	auipc	a0,0x6
    80203aea:	05250513          	addi	a0,a0,82 # 80209b38 <etext+0xb38>
    80203aee:	ffffc097          	auipc	ra,0xffffc
    80203af2:	658080e7          	jalr	1624(ra) # 80200146 <panic>
        r = piperead(f->pipe, addr, n);
    80203af6:	6908                	ld	a0,16(a0)
    80203af8:	00000097          	auipc	ra,0x0
    80203afc:	49c080e7          	jalr	1180(ra) # 80203f94 <piperead>
    80203b00:	892a                	mv	s2,a0
  }

  return r;
}
    80203b02:	854a                	mv	a0,s2
    80203b04:	70a2                	ld	ra,40(sp)
    80203b06:	7402                	ld	s0,32(sp)
    80203b08:	64e2                	ld	s1,24(sp)
    80203b0a:	6942                	ld	s2,16(sp)
    80203b0c:	69a2                	ld	s3,8(sp)
    80203b0e:	6145                	addi	sp,sp,48
    80203b10:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203b12:	02451783          	lh	a5,36(a0)
    80203b16:	03079693          	slli	a3,a5,0x30
    80203b1a:	92c1                	srli	a3,a3,0x30
    80203b1c:	4725                	li	a4,9
    80203b1e:	04d76a63          	bltu	a4,a3,80203b72 <fileread+0xba>
    80203b22:	0792                	slli	a5,a5,0x4
    80203b24:	00019717          	auipc	a4,0x19
    80203b28:	a1c70713          	addi	a4,a4,-1508 # 8021c540 <devsw>
    80203b2c:	97ba                	add	a5,a5,a4
    80203b2e:	639c                	ld	a5,0(a5)
    80203b30:	c3b9                	beqz	a5,80203b76 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203b32:	4505                	li	a0,1
    80203b34:	9782                	jalr	a5
    80203b36:	892a                	mv	s2,a0
        break;
    80203b38:	b7e9                	j	80203b02 <fileread+0x4a>
        elock(f->ep);
    80203b3a:	6d08                	ld	a0,24(a0)
    80203b3c:	00003097          	auipc	ra,0x3
    80203b40:	874080e7          	jalr	-1932(ra) # 802063b0 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203b44:	874e                	mv	a4,s3
    80203b46:	5094                	lw	a3,32(s1)
    80203b48:	864a                	mv	a2,s2
    80203b4a:	4585                	li	a1,1
    80203b4c:	6c88                	ld	a0,24(s1)
    80203b4e:	00002097          	auipc	ra,0x2
    80203b52:	f78080e7          	jalr	-136(ra) # 80205ac6 <eread>
    80203b56:	892a                	mv	s2,a0
    80203b58:	00a05563          	blez	a0,80203b62 <fileread+0xaa>
            f->off += r;
    80203b5c:	509c                	lw	a5,32(s1)
    80203b5e:	9fa9                	addw	a5,a5,a0
    80203b60:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203b62:	6c88                	ld	a0,24(s1)
    80203b64:	00003097          	auipc	ra,0x3
    80203b68:	882080e7          	jalr	-1918(ra) # 802063e6 <eunlock>
        break;
    80203b6c:	bf59                	j	80203b02 <fileread+0x4a>
    return -1;
    80203b6e:	597d                	li	s2,-1
    80203b70:	bf49                	j	80203b02 <fileread+0x4a>
          return -1;
    80203b72:	597d                	li	s2,-1
    80203b74:	b779                	j	80203b02 <fileread+0x4a>
    80203b76:	597d                	li	s2,-1
    80203b78:	b769                	j	80203b02 <fileread+0x4a>

0000000080203b7a <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203b7a:	7179                	addi	sp,sp,-48
    80203b7c:	f406                	sd	ra,40(sp)
    80203b7e:	f022                	sd	s0,32(sp)
    80203b80:	ec26                	sd	s1,24(sp)
    80203b82:	e84a                	sd	s2,16(sp)
    80203b84:	e44e                	sd	s3,8(sp)
    80203b86:	e052                	sd	s4,0(sp)
    80203b88:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203b8a:	00954783          	lbu	a5,9(a0)
    80203b8e:	cbcd                	beqz	a5,80203c40 <filewrite+0xc6>
    80203b90:	8932                	mv	s2,a2
    80203b92:	89ae                	mv	s3,a1
    80203b94:	84aa                	mv	s1,a0
    return -1;

  if(f->type == FD_PIPE){
    80203b96:	411c                	lw	a5,0(a0)
    80203b98:	4705                	li	a4,1
    80203b9a:	04e78963          	beq	a5,a4,80203bec <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203b9e:	470d                	li	a4,3
    80203ba0:	04e78d63          	beq	a5,a4,80203bfa <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203ba4:	4709                	li	a4,2
    80203ba6:	08e79563          	bne	a5,a4,80203c30 <filewrite+0xb6>
    elock(f->ep);
    80203baa:	6d08                	ld	a0,24(a0)
    80203bac:	00003097          	auipc	ra,0x3
    80203bb0:	804080e7          	jalr	-2044(ra) # 802063b0 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203bb4:	00090a1b          	sext.w	s4,s2
    80203bb8:	8752                	mv	a4,s4
    80203bba:	5094                	lw	a3,32(s1)
    80203bbc:	864e                	mv	a2,s3
    80203bbe:	4585                	li	a1,1
    80203bc0:	6c88                	ld	a0,24(s1)
    80203bc2:	00002097          	auipc	ra,0x2
    80203bc6:	ffc080e7          	jalr	-4(ra) # 80205bbe <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203bca:	59fd                	li	s3,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203bcc:	05250b63          	beq	a0,s2,80203c22 <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203bd0:	6c88                	ld	a0,24(s1)
    80203bd2:	00003097          	auipc	ra,0x3
    80203bd6:	814080e7          	jalr	-2028(ra) # 802063e6 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203bda:	854e                	mv	a0,s3
    80203bdc:	70a2                	ld	ra,40(sp)
    80203bde:	7402                	ld	s0,32(sp)
    80203be0:	64e2                	ld	s1,24(sp)
    80203be2:	6942                	ld	s2,16(sp)
    80203be4:	69a2                	ld	s3,8(sp)
    80203be6:	6a02                	ld	s4,0(sp)
    80203be8:	6145                	addi	sp,sp,48
    80203bea:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203bec:	6908                	ld	a0,16(a0)
    80203bee:	00000097          	auipc	ra,0x0
    80203bf2:	270080e7          	jalr	624(ra) # 80203e5e <pipewrite>
    80203bf6:	89aa                	mv	s3,a0
    80203bf8:	b7cd                	j	80203bda <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203bfa:	02451783          	lh	a5,36(a0)
    80203bfe:	03079693          	slli	a3,a5,0x30
    80203c02:	92c1                	srli	a3,a3,0x30
    80203c04:	4725                	li	a4,9
    80203c06:	02d76f63          	bltu	a4,a3,80203c44 <filewrite+0xca>
    80203c0a:	0792                	slli	a5,a5,0x4
    80203c0c:	00019717          	auipc	a4,0x19
    80203c10:	93470713          	addi	a4,a4,-1740 # 8021c540 <devsw>
    80203c14:	97ba                	add	a5,a5,a4
    80203c16:	679c                	ld	a5,8(a5)
    80203c18:	cb85                	beqz	a5,80203c48 <filewrite+0xce>
    ret = devsw[f->major].write(1, addr, n);
    80203c1a:	4505                	li	a0,1
    80203c1c:	9782                	jalr	a5
    80203c1e:	89aa                	mv	s3,a0
    80203c20:	bf6d                	j	80203bda <filewrite+0x60>
      f->off += n;
    80203c22:	509c                	lw	a5,32(s1)
    80203c24:	01478a3b          	addw	s4,a5,s4
    80203c28:	0344a023          	sw	s4,32(s1)
      ret = n;
    80203c2c:	89ca                	mv	s3,s2
    80203c2e:	b74d                	j	80203bd0 <filewrite+0x56>
    panic("filewrite");
    80203c30:	00006517          	auipc	a0,0x6
    80203c34:	f1850513          	addi	a0,a0,-232 # 80209b48 <etext+0xb48>
    80203c38:	ffffc097          	auipc	ra,0xffffc
    80203c3c:	50e080e7          	jalr	1294(ra) # 80200146 <panic>
    return -1;
    80203c40:	59fd                	li	s3,-1
    80203c42:	bf61                	j	80203bda <filewrite+0x60>
      return -1;
    80203c44:	59fd                	li	s3,-1
    80203c46:	bf51                	j	80203bda <filewrite+0x60>
    80203c48:	59fd                	li	s3,-1
    80203c4a:	bf41                	j	80203bda <filewrite+0x60>

0000000080203c4c <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203c4c:	00854783          	lbu	a5,8(a0)
    80203c50:	cfdd                	beqz	a5,80203d0e <dirnext+0xc2>
    80203c52:	6d14                	ld	a3,24(a0)
    80203c54:	1006c783          	lbu	a5,256(a3)
    80203c58:	8bc1                	andi	a5,a5,16
    return -1;
    80203c5a:	577d                	li	a4,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203c5c:	cbd5                	beqz	a5,80203d10 <dirnext+0xc4>
{
    80203c5e:	7141                	addi	sp,sp,-496
    80203c60:	f786                	sd	ra,488(sp)
    80203c62:	f3a2                	sd	s0,480(sp)
    80203c64:	efa6                	sd	s1,472(sp)
    80203c66:	ebca                	sd	s2,464(sp)
    80203c68:	e7ce                	sd	s3,456(sp)
    80203c6a:	e3d2                	sd	s4,448(sp)
    80203c6c:	ff56                	sd	s5,440(sp)
    80203c6e:	1b80                	addi	s0,sp,496
    80203c70:	8aae                	mv	s5,a1
    80203c72:	84aa                	mv	s1,a0

  struct dirent de;
  struct stat st;
  int count = 0;
    80203c74:	e0042e23          	sw	zero,-484(s0)
  int ret;
  elock(f->ep);
    80203c78:	8536                	mv	a0,a3
    80203c7a:	00002097          	auipc	ra,0x2
    80203c7e:	736080e7          	jalr	1846(ra) # 802063b0 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203c82:	e1c40a13          	addi	s4,s0,-484
    80203c86:	e5840993          	addi	s3,s0,-424
    80203c8a:	86d2                	mv	a3,s4
    80203c8c:	5090                	lw	a2,32(s1)
    80203c8e:	85ce                	mv	a1,s3
    80203c90:	6c88                	ld	a0,24(s1)
    80203c92:	00003097          	auipc	ra,0x3
    80203c96:	922080e7          	jalr	-1758(ra) # 802065b4 <enext>
    80203c9a:	892a                	mv	s2,a0
    80203c9c:	e909                	bnez	a0,80203cae <dirnext+0x62>
    f->off += count * 32;
    80203c9e:	e1c42783          	lw	a5,-484(s0)
    80203ca2:	0057971b          	slliw	a4,a5,0x5
    80203ca6:	509c                	lw	a5,32(s1)
    80203ca8:	9fb9                	addw	a5,a5,a4
    80203caa:	d09c                	sw	a5,32(s1)
    80203cac:	bff9                	j	80203c8a <dirnext+0x3e>
  }
  eunlock(f->ep);
    80203cae:	6c88                	ld	a0,24(s1)
    80203cb0:	00002097          	auipc	ra,0x2
    80203cb4:	736080e7          	jalr	1846(ra) # 802063e6 <eunlock>
  if (ret == -1)
    80203cb8:	57fd                	li	a5,-1
    return 0;
    80203cba:	4701                	li	a4,0
  if (ret == -1)
    80203cbc:	02f90d63          	beq	s2,a5,80203cf6 <dirnext+0xaa>

  f->off += count * 32;
    80203cc0:	e1c42783          	lw	a5,-484(s0)
    80203cc4:	0057971b          	slliw	a4,a5,0x5
    80203cc8:	509c                	lw	a5,32(s1)
    80203cca:	9fb9                	addw	a5,a5,a4
    80203ccc:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203cce:	e2040493          	addi	s1,s0,-480
    80203cd2:	85a6                	mv	a1,s1
    80203cd4:	e5840513          	addi	a0,s0,-424
    80203cd8:	00003097          	auipc	ra,0x3
    80203cdc:	894080e7          	jalr	-1900(ra) # 8020656c <estat>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203ce0:	03800613          	li	a2,56
    80203ce4:	85a6                	mv	a1,s1
    80203ce6:	8556                	mv	a0,s5
    80203ce8:	ffffd097          	auipc	ra,0xffffd
    80203cec:	6da080e7          	jalr	1754(ra) # 802013c2 <copyout2>
    return -1;

  return 1;
    80203cf0:	4705                	li	a4,1
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203cf2:	00054c63          	bltz	a0,80203d0a <dirnext+0xbe>
    80203cf6:	853a                	mv	a0,a4
    80203cf8:	70be                	ld	ra,488(sp)
    80203cfa:	741e                	ld	s0,480(sp)
    80203cfc:	64fe                	ld	s1,472(sp)
    80203cfe:	695e                	ld	s2,464(sp)
    80203d00:	69be                	ld	s3,456(sp)
    80203d02:	6a1e                	ld	s4,448(sp)
    80203d04:	7afa                	ld	s5,440(sp)
    80203d06:	617d                	addi	sp,sp,496
    80203d08:	8082                	ret
    return -1;
    80203d0a:	577d                	li	a4,-1
    80203d0c:	b7ed                	j	80203cf6 <dirnext+0xaa>
    return -1;
    80203d0e:	577d                	li	a4,-1
    80203d10:	853a                	mv	a0,a4
    80203d12:	8082                	ret

0000000080203d14 <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203d14:	7179                	addi	sp,sp,-48
    80203d16:	f406                	sd	ra,40(sp)
    80203d18:	f022                	sd	s0,32(sp)
    80203d1a:	ec26                	sd	s1,24(sp)
    80203d1c:	e84a                	sd	s2,16(sp)
    80203d1e:	e44e                	sd	s3,8(sp)
    80203d20:	e052                	sd	s4,0(sp)
    80203d22:	1800                	addi	s0,sp,48
    80203d24:	84aa                	mv	s1,a0
    80203d26:	892e                	mv	s2,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203d28:	0005b023          	sd	zero,0(a1)
    80203d2c:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203d30:	00000097          	auipc	ra,0x0
    80203d34:	b9e080e7          	jalr	-1122(ra) # 802038ce <filealloc>
    80203d38:	e088                	sd	a0,0(s1)
    80203d3a:	c551                	beqz	a0,80203dc6 <pipealloc+0xb2>
    80203d3c:	00000097          	auipc	ra,0x0
    80203d40:	b92080e7          	jalr	-1134(ra) # 802038ce <filealloc>
    80203d44:	00a93023          	sd	a0,0(s2)
    80203d48:	c92d                	beqz	a0,80203dba <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203d4a:	ffffd097          	auipc	ra,0xffffd
    80203d4e:	820080e7          	jalr	-2016(ra) # 8020056a <kalloc>
    80203d52:	89aa                	mv	s3,a0
    80203d54:	c125                	beqz	a0,80203db4 <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203d56:	4a05                	li	s4,1
    80203d58:	23452023          	sw	s4,544(a0)
  pi->writeopen = 1;
    80203d5c:	23452223          	sw	s4,548(a0)
  pi->nwrite = 0;
    80203d60:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203d64:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203d68:	00006597          	auipc	a1,0x6
    80203d6c:	c8058593          	addi	a1,a1,-896 # 802099e8 <etext+0x9e8>
    80203d70:	ffffd097          	auipc	ra,0xffffd
    80203d74:	924080e7          	jalr	-1756(ra) # 80200694 <initlock>
  (*f0)->type = FD_PIPE;
    80203d78:	609c                	ld	a5,0(s1)
    80203d7a:	0147a023          	sw	s4,0(a5)
  (*f0)->readable = 1;
    80203d7e:	609c                	ld	a5,0(s1)
    80203d80:	01478423          	sb	s4,8(a5)
  (*f0)->writable = 0;
    80203d84:	609c                	ld	a5,0(s1)
    80203d86:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203d8a:	609c                	ld	a5,0(s1)
    80203d8c:	0137b823          	sd	s3,16(a5)
  (*f1)->type = FD_PIPE;
    80203d90:	00093783          	ld	a5,0(s2)
    80203d94:	0147a023          	sw	s4,0(a5)
  (*f1)->readable = 0;
    80203d98:	00093783          	ld	a5,0(s2)
    80203d9c:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203da0:	00093783          	ld	a5,0(s2)
    80203da4:	014784a3          	sb	s4,9(a5)
  (*f1)->pipe = pi;
    80203da8:	00093783          	ld	a5,0(s2)
    80203dac:	0137b823          	sd	s3,16(a5)
  return 0;
    80203db0:	4501                	li	a0,0
    80203db2:	a025                	j	80203dda <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80203db4:	6088                	ld	a0,0(s1)
    80203db6:	e501                	bnez	a0,80203dbe <pipealloc+0xaa>
    80203db8:	a039                	j	80203dc6 <pipealloc+0xb2>
    80203dba:	6088                	ld	a0,0(s1)
    80203dbc:	c51d                	beqz	a0,80203dea <pipealloc+0xd6>
    fileclose(*f0);
    80203dbe:	00000097          	auipc	ra,0x0
    80203dc2:	be0080e7          	jalr	-1056(ra) # 8020399e <fileclose>
  if(*f1)
    80203dc6:	00093783          	ld	a5,0(s2)
    fileclose(*f1);
  return -1;
    80203dca:	557d                	li	a0,-1
  if(*f1)
    80203dcc:	c799                	beqz	a5,80203dda <pipealloc+0xc6>
    fileclose(*f1);
    80203dce:	853e                	mv	a0,a5
    80203dd0:	00000097          	auipc	ra,0x0
    80203dd4:	bce080e7          	jalr	-1074(ra) # 8020399e <fileclose>
  return -1;
    80203dd8:	557d                	li	a0,-1
}
    80203dda:	70a2                	ld	ra,40(sp)
    80203ddc:	7402                	ld	s0,32(sp)
    80203dde:	64e2                	ld	s1,24(sp)
    80203de0:	6942                	ld	s2,16(sp)
    80203de2:	69a2                	ld	s3,8(sp)
    80203de4:	6a02                	ld	s4,0(sp)
    80203de6:	6145                	addi	sp,sp,48
    80203de8:	8082                	ret
  return -1;
    80203dea:	557d                	li	a0,-1
    80203dec:	b7fd                	j	80203dda <pipealloc+0xc6>

0000000080203dee <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80203dee:	1101                	addi	sp,sp,-32
    80203df0:	ec06                	sd	ra,24(sp)
    80203df2:	e822                	sd	s0,16(sp)
    80203df4:	e426                	sd	s1,8(sp)
    80203df6:	e04a                	sd	s2,0(sp)
    80203df8:	1000                	addi	s0,sp,32
    80203dfa:	84aa                	mv	s1,a0
    80203dfc:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80203dfe:	ffffd097          	auipc	ra,0xffffd
    80203e02:	8da080e7          	jalr	-1830(ra) # 802006d8 <acquire>
  if(writable){
    80203e06:	02090d63          	beqz	s2,80203e40 <pipeclose+0x52>
    pi->writeopen = 0;
    80203e0a:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80203e0e:	21848513          	addi	a0,s1,536
    80203e12:	ffffe097          	auipc	ra,0xffffe
    80203e16:	720080e7          	jalr	1824(ra) # 80202532 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80203e1a:	2204b783          	ld	a5,544(s1)
    80203e1e:	eb95                	bnez	a5,80203e52 <pipeclose+0x64>
    release(&pi->lock);
    80203e20:	8526                	mv	a0,s1
    80203e22:	ffffd097          	auipc	ra,0xffffd
    80203e26:	90a080e7          	jalr	-1782(ra) # 8020072c <release>
    kfree((char*)pi);
    80203e2a:	8526                	mv	a0,s1
    80203e2c:	ffffc097          	auipc	ra,0xffffc
    80203e30:	622080e7          	jalr	1570(ra) # 8020044e <kfree>
  } else
    release(&pi->lock);
}
    80203e34:	60e2                	ld	ra,24(sp)
    80203e36:	6442                	ld	s0,16(sp)
    80203e38:	64a2                	ld	s1,8(sp)
    80203e3a:	6902                	ld	s2,0(sp)
    80203e3c:	6105                	addi	sp,sp,32
    80203e3e:	8082                	ret
    pi->readopen = 0;
    80203e40:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80203e44:	21c48513          	addi	a0,s1,540
    80203e48:	ffffe097          	auipc	ra,0xffffe
    80203e4c:	6ea080e7          	jalr	1770(ra) # 80202532 <wakeup>
    80203e50:	b7e9                	j	80203e1a <pipeclose+0x2c>
    release(&pi->lock);
    80203e52:	8526                	mv	a0,s1
    80203e54:	ffffd097          	auipc	ra,0xffffd
    80203e58:	8d8080e7          	jalr	-1832(ra) # 8020072c <release>
}
    80203e5c:	bfe1                	j	80203e34 <pipeclose+0x46>

0000000080203e5e <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80203e5e:	7175                	addi	sp,sp,-144
    80203e60:	e506                	sd	ra,136(sp)
    80203e62:	e122                	sd	s0,128(sp)
    80203e64:	fca6                	sd	s1,120(sp)
    80203e66:	f8ca                	sd	s2,112(sp)
    80203e68:	f4ce                	sd	s3,104(sp)
    80203e6a:	f0d2                	sd	s4,96(sp)
    80203e6c:	ecd6                	sd	s5,88(sp)
    80203e6e:	e8da                	sd	s6,80(sp)
    80203e70:	e4de                	sd	s7,72(sp)
    80203e72:	e0e2                	sd	s8,64(sp)
    80203e74:	fc66                	sd	s9,56(sp)
    80203e76:	f86a                	sd	s10,48(sp)
    80203e78:	f46e                	sd	s11,40(sp)
    80203e7a:	0900                	addi	s0,sp,144
    80203e7c:	84aa                	mv	s1,a0
    80203e7e:	f6b43c23          	sd	a1,-136(s0)
    80203e82:	8a32                	mv	s4,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80203e84:	ffffe097          	auipc	ra,0xffffe
    80203e88:	c3c080e7          	jalr	-964(ra) # 80201ac0 <myproc>
    80203e8c:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80203e8e:	8526                	mv	a0,s1
    80203e90:	ffffd097          	auipc	ra,0xffffd
    80203e94:	848080e7          	jalr	-1976(ra) # 802006d8 <acquire>
  for(i = 0; i < n; i++){
    80203e98:	0f405163          	blez	s4,80203f7a <pipewrite+0x11c>
    80203e9c:	89a6                	mv	s3,s1
    80203e9e:	3a7d                	addiw	s4,s4,-1
    80203ea0:	020a1c93          	slli	s9,s4,0x20
    80203ea4:	020cdc93          	srli	s9,s9,0x20
    80203ea8:	4b01                	li	s6,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80203eaa:	21848a93          	addi	s5,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80203eae:	21c48a13          	addi	s4,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80203eb2:	f8f40d93          	addi	s11,s0,-113
    80203eb6:	5d7d                	li	s10,-1
    80203eb8:	000b0c1b          	sext.w	s8,s6
    80203ebc:	8be2                	mv	s7,s8
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203ebe:	2184a783          	lw	a5,536(s1)
    80203ec2:	21c4a703          	lw	a4,540(s1)
    80203ec6:	2007879b          	addiw	a5,a5,512
    80203eca:	06f71763          	bne	a4,a5,80203f38 <pipewrite+0xda>
      if(pi->readopen == 0 || pr->killed){
    80203ece:	2204a783          	lw	a5,544(s1)
    80203ed2:	cf8d                	beqz	a5,80203f0c <pipewrite+0xae>
    80203ed4:	03092783          	lw	a5,48(s2)
    80203ed8:	eb95                	bnez	a5,80203f0c <pipewrite+0xae>
      wakeup(&pi->nread);
    80203eda:	8556                	mv	a0,s5
    80203edc:	ffffe097          	auipc	ra,0xffffe
    80203ee0:	656080e7          	jalr	1622(ra) # 80202532 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80203ee4:	85ce                	mv	a1,s3
    80203ee6:	8552                	mv	a0,s4
    80203ee8:	ffffe097          	auipc	ra,0xffffe
    80203eec:	4c8080e7          	jalr	1224(ra) # 802023b0 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80203ef0:	2184a783          	lw	a5,536(s1)
    80203ef4:	21c4a703          	lw	a4,540(s1)
    80203ef8:	2007879b          	addiw	a5,a5,512
    80203efc:	02f71e63          	bne	a4,a5,80203f38 <pipewrite+0xda>
      if(pi->readopen == 0 || pr->killed){
    80203f00:	2204a783          	lw	a5,544(s1)
    80203f04:	c781                	beqz	a5,80203f0c <pipewrite+0xae>
    80203f06:	03092783          	lw	a5,48(s2)
    80203f0a:	dbe1                	beqz	a5,80203eda <pipewrite+0x7c>
        release(&pi->lock);
    80203f0c:	8526                	mv	a0,s1
    80203f0e:	ffffd097          	auipc	ra,0xffffd
    80203f12:	81e080e7          	jalr	-2018(ra) # 8020072c <release>
        return -1;
    80203f16:	5bfd                	li	s7,-1
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
  }
  wakeup(&pi->nread);
  release(&pi->lock);
  return i;
}
    80203f18:	855e                	mv	a0,s7
    80203f1a:	60aa                	ld	ra,136(sp)
    80203f1c:	640a                	ld	s0,128(sp)
    80203f1e:	74e6                	ld	s1,120(sp)
    80203f20:	7946                	ld	s2,112(sp)
    80203f22:	79a6                	ld	s3,104(sp)
    80203f24:	7a06                	ld	s4,96(sp)
    80203f26:	6ae6                	ld	s5,88(sp)
    80203f28:	6b46                	ld	s6,80(sp)
    80203f2a:	6ba6                	ld	s7,72(sp)
    80203f2c:	6c06                	ld	s8,64(sp)
    80203f2e:	7ce2                	ld	s9,56(sp)
    80203f30:	7d42                	ld	s10,48(sp)
    80203f32:	7da2                	ld	s11,40(sp)
    80203f34:	6149                	addi	sp,sp,144
    80203f36:	8082                	ret
    if(copyin2(&ch, addr + i, 1) == -1)
    80203f38:	4605                	li	a2,1
    80203f3a:	f7843783          	ld	a5,-136(s0)
    80203f3e:	00fb05b3          	add	a1,s6,a5
    80203f42:	856e                	mv	a0,s11
    80203f44:	ffffd097          	auipc	ra,0xffffd
    80203f48:	55e080e7          	jalr	1374(ra) # 802014a2 <copyin2>
    80203f4c:	03a50863          	beq	a0,s10,80203f7c <pipewrite+0x11e>
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80203f50:	21c4a783          	lw	a5,540(s1)
    80203f54:	0017871b          	addiw	a4,a5,1
    80203f58:	20e4ae23          	sw	a4,540(s1)
    80203f5c:	1ff7f793          	andi	a5,a5,511
    80203f60:	97a6                	add	a5,a5,s1
    80203f62:	f8f44703          	lbu	a4,-113(s0)
    80203f66:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    80203f6a:	001c0b9b          	addiw	s7,s8,1
    80203f6e:	001b0793          	addi	a5,s6,1 # 1001 <BASE_ADDRESS-0x801fefff>
    80203f72:	019b0563          	beq	s6,s9,80203f7c <pipewrite+0x11e>
    80203f76:	8b3e                	mv	s6,a5
    80203f78:	b781                	j	80203eb8 <pipewrite+0x5a>
    80203f7a:	4b81                	li	s7,0
  wakeup(&pi->nread);
    80203f7c:	21848513          	addi	a0,s1,536
    80203f80:	ffffe097          	auipc	ra,0xffffe
    80203f84:	5b2080e7          	jalr	1458(ra) # 80202532 <wakeup>
  release(&pi->lock);
    80203f88:	8526                	mv	a0,s1
    80203f8a:	ffffc097          	auipc	ra,0xffffc
    80203f8e:	7a2080e7          	jalr	1954(ra) # 8020072c <release>
  return i;
    80203f92:	b759                	j	80203f18 <pipewrite+0xba>

0000000080203f94 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80203f94:	715d                	addi	sp,sp,-80
    80203f96:	e486                	sd	ra,72(sp)
    80203f98:	e0a2                	sd	s0,64(sp)
    80203f9a:	fc26                	sd	s1,56(sp)
    80203f9c:	f84a                	sd	s2,48(sp)
    80203f9e:	f44e                	sd	s3,40(sp)
    80203fa0:	f052                	sd	s4,32(sp)
    80203fa2:	ec56                	sd	s5,24(sp)
    80203fa4:	e85a                	sd	s6,16(sp)
    80203fa6:	0880                	addi	s0,sp,80
    80203fa8:	84aa                	mv	s1,a0
    80203faa:	89ae                	mv	s3,a1
    80203fac:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80203fae:	ffffe097          	auipc	ra,0xffffe
    80203fb2:	b12080e7          	jalr	-1262(ra) # 80201ac0 <myproc>
    80203fb6:	892a                	mv	s2,a0
  char ch;

  acquire(&pi->lock);
    80203fb8:	8526                	mv	a0,s1
    80203fba:	ffffc097          	auipc	ra,0xffffc
    80203fbe:	71e080e7          	jalr	1822(ra) # 802006d8 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203fc2:	2184a703          	lw	a4,536(s1)
    80203fc6:	21c4a783          	lw	a5,540(s1)
    80203fca:	06f71b63          	bne	a4,a5,80204040 <piperead+0xac>
    80203fce:	8aa6                	mv	s5,s1
    80203fd0:	2244a783          	lw	a5,548(s1)
    80203fd4:	cf9d                	beqz	a5,80204012 <piperead+0x7e>
    if(pr->killed){
    80203fd6:	03092783          	lw	a5,48(s2)
    80203fda:	e78d                	bnez	a5,80204004 <piperead+0x70>
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80203fdc:	21848b13          	addi	s6,s1,536
    80203fe0:	85d6                	mv	a1,s5
    80203fe2:	855a                	mv	a0,s6
    80203fe4:	ffffe097          	auipc	ra,0xffffe
    80203fe8:	3cc080e7          	jalr	972(ra) # 802023b0 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80203fec:	2184a703          	lw	a4,536(s1)
    80203ff0:	21c4a783          	lw	a5,540(s1)
    80203ff4:	04f71663          	bne	a4,a5,80204040 <piperead+0xac>
    80203ff8:	2244a783          	lw	a5,548(s1)
    80203ffc:	cb99                	beqz	a5,80204012 <piperead+0x7e>
    if(pr->killed){
    80203ffe:	03092783          	lw	a5,48(s2)
    80204002:	dff9                	beqz	a5,80203fe0 <piperead+0x4c>
      release(&pi->lock);
    80204004:	8526                	mv	a0,s1
    80204006:	ffffc097          	auipc	ra,0xffffc
    8020400a:	726080e7          	jalr	1830(ra) # 8020072c <release>
      return -1;
    8020400e:	597d                	li	s2,-1
    80204010:	a829                	j	8020402a <piperead+0x96>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    if(pi->nread == pi->nwrite)
    80204012:	4901                	li	s2,0
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80204014:	21c48513          	addi	a0,s1,540
    80204018:	ffffe097          	auipc	ra,0xffffe
    8020401c:	51a080e7          	jalr	1306(ra) # 80202532 <wakeup>
  release(&pi->lock);
    80204020:	8526                	mv	a0,s1
    80204022:	ffffc097          	auipc	ra,0xffffc
    80204026:	70a080e7          	jalr	1802(ra) # 8020072c <release>
  return i;
}
    8020402a:	854a                	mv	a0,s2
    8020402c:	60a6                	ld	ra,72(sp)
    8020402e:	6406                	ld	s0,64(sp)
    80204030:	74e2                	ld	s1,56(sp)
    80204032:	7942                	ld	s2,48(sp)
    80204034:	79a2                	ld	s3,40(sp)
    80204036:	7a02                	ld	s4,32(sp)
    80204038:	6ae2                	ld	s5,24(sp)
    8020403a:	6b42                	ld	s6,16(sp)
    8020403c:	6161                	addi	sp,sp,80
    8020403e:	8082                	ret
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204040:	4901                	li	s2,0
    80204042:	fd4059e3          	blez	s4,80204014 <piperead+0x80>
    if(pi->nread == pi->nwrite)
    80204046:	2184a783          	lw	a5,536(s1)
    8020404a:	4901                	li	s2,0
    if(copyout2(addr + i, &ch, 1) == -1)
    8020404c:	fbf40b13          	addi	s6,s0,-65
    80204050:	5afd                	li	s5,-1
    ch = pi->data[pi->nread++ % PIPESIZE];
    80204052:	0017871b          	addiw	a4,a5,1
    80204056:	20e4ac23          	sw	a4,536(s1)
    8020405a:	1ff7f793          	andi	a5,a5,511
    8020405e:	97a6                	add	a5,a5,s1
    80204060:	0187c783          	lbu	a5,24(a5)
    80204064:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    80204068:	4605                	li	a2,1
    8020406a:	85da                	mv	a1,s6
    8020406c:	854e                	mv	a0,s3
    8020406e:	ffffd097          	auipc	ra,0xffffd
    80204072:	354080e7          	jalr	852(ra) # 802013c2 <copyout2>
    80204076:	f9550fe3          	beq	a0,s5,80204014 <piperead+0x80>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020407a:	2905                	addiw	s2,s2,1
    8020407c:	f92a0ce3          	beq	s4,s2,80204014 <piperead+0x80>
    if(pi->nread == pi->nwrite)
    80204080:	2184a783          	lw	a5,536(s1)
    80204084:	0985                	addi	s3,s3,1
    80204086:	21c4a703          	lw	a4,540(s1)
    8020408a:	fcf714e3          	bne	a4,a5,80204052 <piperead+0xbe>
    8020408e:	b759                	j	80204014 <piperead+0x80>

0000000080204090 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    80204090:	dd010113          	addi	sp,sp,-560
    80204094:	22113423          	sd	ra,552(sp)
    80204098:	22813023          	sd	s0,544(sp)
    8020409c:	20913c23          	sd	s1,536(sp)
    802040a0:	21213823          	sd	s2,528(sp)
    802040a4:	21313423          	sd	s3,520(sp)
    802040a8:	21413023          	sd	s4,512(sp)
    802040ac:	ffd6                	sd	s5,504(sp)
    802040ae:	fbda                	sd	s6,496(sp)
    802040b0:	f7de                	sd	s7,488(sp)
    802040b2:	f3e2                	sd	s8,480(sp)
    802040b4:	efe6                	sd	s9,472(sp)
    802040b6:	ebea                	sd	s10,464(sp)
    802040b8:	e7ee                	sd	s11,456(sp)
    802040ba:	1c00                	addi	s0,sp,560
    802040bc:	892a                	mv	s2,a0
    802040be:	dca43c23          	sd	a0,-552(s0)
    802040c2:	deb43423          	sd	a1,-536(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    802040c6:	ffffe097          	auipc	ra,0xffffe
    802040ca:	9fa080e7          	jalr	-1542(ra) # 80201ac0 <myproc>
    802040ce:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    802040d0:	ffffc097          	auipc	ra,0xffffc
    802040d4:	49a080e7          	jalr	1178(ra) # 8020056a <kalloc>
    802040d8:	2a050763          	beqz	a0,80204386 <exec+0x2f6>
    802040dc:	8aaa                	mv	s5,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    802040de:	6605                	lui	a2,0x1
    802040e0:	6cac                	ld	a1,88(s1)
    802040e2:	ffffc097          	auipc	ra,0xffffc
    802040e6:	6fe080e7          	jalr	1790(ra) # 802007e0 <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    802040ea:	000ab023          	sd	zero,0(s5)
    802040ee:	000ab423          	sd	zero,8(s5)
  }

  if((ep = ename(path)) == NULL) {
    802040f2:	854a                	mv	a0,s2
    802040f4:	00003097          	auipc	ra,0x3
    802040f8:	a6c080e7          	jalr	-1428(ra) # 80206b60 <ename>
    802040fc:	8a2a                	mv	s4,a0
    802040fe:	3a050d63          	beqz	a0,802044b8 <exec+0x428>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80204102:	00002097          	auipc	ra,0x2
    80204106:	2ae080e7          	jalr	686(ra) # 802063b0 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    8020410a:	04000713          	li	a4,64
    8020410e:	4681                	li	a3,0
    80204110:	e4840613          	addi	a2,s0,-440
    80204114:	4581                	li	a1,0
    80204116:	8552                	mv	a0,s4
    80204118:	00002097          	auipc	ra,0x2
    8020411c:	9ae080e7          	jalr	-1618(ra) # 80205ac6 <eread>
    80204120:	04000793          	li	a5,64
    80204124:	00f51a63          	bne	a0,a5,80204138 <exec+0xa8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    80204128:	e4842703          	lw	a4,-440(s0)
    8020412c:	464c47b7          	lui	a5,0x464c4
    80204130:	57f78793          	addi	a5,a5,1407 # 464c457f <BASE_ADDRESS-0x39d3ba81>
    80204134:	00f70963          	beq	a4,a5,80204146 <exec+0xb6>
  printf("[exec] reach bad\n");
  #endif
  if(pagetable)
    proc_freepagetable(pagetable, sz);
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204138:	4581                	li	a1,0
    8020413a:	8556                	mv	a0,s5
    8020413c:	ffffd097          	auipc	ra,0xffffd
    80204140:	5a8080e7          	jalr	1448(ra) # 802016e4 <kvmfree>
  if(ep){
    80204144:	a4b5                	j	802043b0 <exec+0x320>
  if((pagetable = proc_pagetable(p)) == NULL)
    80204146:	8526                	mv	a0,s1
    80204148:	ffffe097          	auipc	ra,0xffffe
    8020414c:	a5e080e7          	jalr	-1442(ra) # 80201ba6 <proc_pagetable>
    80204150:	e0a43423          	sd	a0,-504(s0)
    80204154:	d175                	beqz	a0,80204138 <exec+0xa8>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204156:	e6842783          	lw	a5,-408(s0)
    8020415a:	e8045703          	lhu	a4,-384(s0)
    8020415e:	cb3d                	beqz	a4,802041d4 <exec+0x144>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    80204160:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204162:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80204166:	e1040713          	addi	a4,s0,-496
    8020416a:	dee43023          	sd	a4,-544(s0)
    if(ph.vaddr % PGSIZE != 0)
    8020416e:	6b05                	lui	s6,0x1
    80204170:	fffb0713          	addi	a4,s6,-1 # fff <BASE_ADDRESS-0x801ff001>
    80204174:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204178:	6d85                	lui	s11,0x1
    8020417a:	7d7d                	lui	s10,0xfffff
    8020417c:	a4c1                	j	8020443c <exec+0x3ac>
      panic("loadseg: address should exist");
    8020417e:	00006517          	auipc	a0,0x6
    80204182:	9da50513          	addi	a0,a0,-1574 # 80209b58 <etext+0xb58>
    80204186:	ffffc097          	auipc	ra,0xffffc
    8020418a:	fc0080e7          	jalr	-64(ra) # 80200146 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    8020418e:	874e                	mv	a4,s3
    80204190:	009c86bb          	addw	a3,s9,s1
    80204194:	4581                	li	a1,0
    80204196:	8552                	mv	a0,s4
    80204198:	00002097          	auipc	ra,0x2
    8020419c:	92e080e7          	jalr	-1746(ra) # 80205ac6 <eread>
    802041a0:	2501                	sext.w	a0,a0
    802041a2:	1ea99663          	bne	s3,a0,8020438e <exec+0x2fe>
  for(i = 0; i < sz; i += PGSIZE){
    802041a6:	009d84bb          	addw	s1,s11,s1
    802041aa:	012d093b          	addw	s2,s10,s2
    802041ae:	2774f763          	bleu	s7,s1,8020441c <exec+0x38c>
    pa = walkaddr(pagetable, va + i);
    802041b2:	02049593          	slli	a1,s1,0x20
    802041b6:	9181                	srli	a1,a1,0x20
    802041b8:	95e2                	add	a1,a1,s8
    802041ba:	e0843503          	ld	a0,-504(s0)
    802041be:	ffffd097          	auipc	ra,0xffffd
    802041c2:	a40080e7          	jalr	-1472(ra) # 80200bfe <walkaddr>
    802041c6:	862a                	mv	a2,a0
    if(pa == NULL)
    802041c8:	d95d                	beqz	a0,8020417e <exec+0xee>
      n = PGSIZE;
    802041ca:	89da                	mv	s3,s6
    if(sz - i < PGSIZE)
    802041cc:	fd6971e3          	bleu	s6,s2,8020418e <exec+0xfe>
      n = sz - i;
    802041d0:	89ca                	mv	s3,s2
    802041d2:	bf75                	j	8020418e <exec+0xfe>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802041d4:	4481                	li	s1,0
  eunlock(ep);
    802041d6:	8552                	mv	a0,s4
    802041d8:	00002097          	auipc	ra,0x2
    802041dc:	20e080e7          	jalr	526(ra) # 802063e6 <eunlock>
  eput(ep);
    802041e0:	8552                	mv	a0,s4
    802041e2:	00002097          	auipc	ra,0x2
    802041e6:	252080e7          	jalr	594(ra) # 80206434 <eput>
  p = myproc();
    802041ea:	ffffe097          	auipc	ra,0xffffe
    802041ee:	8d6080e7          	jalr	-1834(ra) # 80201ac0 <myproc>
    802041f2:	8b2a                	mv	s6,a0
  uint64 oldsz = p->sz;
    802041f4:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    802041f8:	6785                	lui	a5,0x1
    802041fa:	17fd                	addi	a5,a5,-1
    802041fc:	94be                	add	s1,s1,a5
    802041fe:	77fd                	lui	a5,0xfffff
    80204200:	8fe5                	and	a5,a5,s1
    80204202:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204206:	6689                	lui	a3,0x2
    80204208:	96be                	add	a3,a3,a5
    8020420a:	863e                	mv	a2,a5
    8020420c:	85d6                	mv	a1,s5
    8020420e:	e0843483          	ld	s1,-504(s0)
    80204212:	8526                	mv	a0,s1
    80204214:	ffffd097          	auipc	ra,0xffffd
    80204218:	e4a080e7          	jalr	-438(ra) # 8020105e <uvmalloc>
    8020421c:	8caa                	mv	s9,a0
  ep = 0;
    8020421e:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204220:	16050763          	beqz	a0,8020438e <exec+0x2fe>
  uvmclear(pagetable, sz-2*PGSIZE);
    80204224:	75f9                	lui	a1,0xffffe
    80204226:	95aa                	add	a1,a1,a0
    80204228:	8526                	mv	a0,s1
    8020422a:	ffffd097          	auipc	ra,0xffffd
    8020422e:	0da080e7          	jalr	218(ra) # 80201304 <uvmclear>
  stackbase = sp - PGSIZE;
    80204232:	7bfd                	lui	s7,0xfffff
    80204234:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    80204236:	de843783          	ld	a5,-536(s0)
    8020423a:	6388                	ld	a0,0(a5)
    8020423c:	c925                	beqz	a0,802042ac <exec+0x21c>
    8020423e:	e8840993          	addi	s3,s0,-376
    80204242:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    80204246:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204248:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    8020424a:	ffffc097          	auipc	ra,0xffffc
    8020424e:	6d4080e7          	jalr	1748(ra) # 8020091e <strlen>
    80204252:	2505                	addiw	a0,a0,1
    80204254:	40a90933          	sub	s2,s2,a0
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80204258:	ff097913          	andi	s2,s2,-16
    if(sp < stackbase)
    8020425c:	1b796463          	bltu	s2,s7,80204404 <exec+0x374>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80204260:	de843d83          	ld	s11,-536(s0)
    80204264:	000dba03          	ld	s4,0(s11) # 1000 <BASE_ADDRESS-0x801ff000>
    80204268:	8552                	mv	a0,s4
    8020426a:	ffffc097          	auipc	ra,0xffffc
    8020426e:	6b4080e7          	jalr	1716(ra) # 8020091e <strlen>
    80204272:	0015069b          	addiw	a3,a0,1
    80204276:	8652                	mv	a2,s4
    80204278:	85ca                	mv	a1,s2
    8020427a:	e0843503          	ld	a0,-504(s0)
    8020427e:	ffffd097          	auipc	ra,0xffffd
    80204282:	0b8080e7          	jalr	184(ra) # 80201336 <copyout>
    80204286:	18054363          	bltz	a0,8020440c <exec+0x37c>
    ustack[argc] = sp;
    8020428a:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    8020428e:	0485                	addi	s1,s1,1
    80204290:	008d8793          	addi	a5,s11,8
    80204294:	def43423          	sd	a5,-536(s0)
    80204298:	008db503          	ld	a0,8(s11)
    8020429c:	c911                	beqz	a0,802042b0 <exec+0x220>
    if(argc >= MAXARG)
    8020429e:	09a1                	addi	s3,s3,8
    802042a0:	fb3c15e3          	bne	s8,s3,8020424a <exec+0x1ba>
  sz = sz1;
    802042a4:	df943823          	sd	s9,-528(s0)
  ep = 0;
    802042a8:	4a01                	li	s4,0
    802042aa:	a0d5                	j	8020438e <exec+0x2fe>
  sp = sz;
    802042ac:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802042ae:	4481                	li	s1,0
  ustack[argc] = 0;
    802042b0:	00349793          	slli	a5,s1,0x3
    802042b4:	f9040713          	addi	a4,s0,-112
    802042b8:	97ba                	add	a5,a5,a4
    802042ba:	ee07bc23          	sd	zero,-264(a5) # ffffffffffffeef8 <ebss_clear+0xffffffff7fdd9ef8>
  sp -= (argc+1) * sizeof(uint64);
    802042be:	00148693          	addi	a3,s1,1
    802042c2:	068e                	slli	a3,a3,0x3
    802042c4:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    802042c8:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    802042cc:	01797663          	bleu	s7,s2,802042d8 <exec+0x248>
  sz = sz1;
    802042d0:	df943823          	sd	s9,-528(s0)
  ep = 0;
    802042d4:	4a01                	li	s4,0
    802042d6:	a865                	j	8020438e <exec+0x2fe>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    802042d8:	e8840613          	addi	a2,s0,-376
    802042dc:	85ca                	mv	a1,s2
    802042de:	e0843503          	ld	a0,-504(s0)
    802042e2:	ffffd097          	auipc	ra,0xffffd
    802042e6:	054080e7          	jalr	84(ra) # 80201336 <copyout>
    802042ea:	12054563          	bltz	a0,80204414 <exec+0x384>
  p->trapframe->a1 = sp;
    802042ee:	060b3783          	ld	a5,96(s6)
    802042f2:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    802042f6:	dd843783          	ld	a5,-552(s0)
    802042fa:	0007c703          	lbu	a4,0(a5)
    802042fe:	cf11                	beqz	a4,8020431a <exec+0x28a>
    80204300:	0785                	addi	a5,a5,1
    if(*s == '/')
    80204302:	02f00693          	li	a3,47
    80204306:	a029                	j	80204310 <exec+0x280>
  for(last=s=path; *s; s++)
    80204308:	0785                	addi	a5,a5,1
    8020430a:	fff7c703          	lbu	a4,-1(a5)
    8020430e:	c711                	beqz	a4,8020431a <exec+0x28a>
    if(*s == '/')
    80204310:	fed71ce3          	bne	a4,a3,80204308 <exec+0x278>
      last = s+1;
    80204314:	dcf43c23          	sd	a5,-552(s0)
    80204318:	bfc5                	j	80204308 <exec+0x278>
  safestrcpy(p->name, last, sizeof(p->name));
    8020431a:	4641                	li	a2,16
    8020431c:	dd843583          	ld	a1,-552(s0)
    80204320:	160b0513          	addi	a0,s6,352
    80204324:	ffffc097          	auipc	ra,0xffffc
    80204328:	5c8080e7          	jalr	1480(ra) # 802008ec <safestrcpy>
  oldpagetable = p->pagetable;
    8020432c:	050b3503          	ld	a0,80(s6)
  oldkpagetable = p->kpagetable;
    80204330:	058b3983          	ld	s3,88(s6)
  p->pagetable = pagetable;
    80204334:	e0843783          	ld	a5,-504(s0)
    80204338:	04fb3823          	sd	a5,80(s6)
  p->kpagetable = kpagetable;
    8020433c:	055b3c23          	sd	s5,88(s6)
  p->sz = sz;
    80204340:	059b3423          	sd	s9,72(s6)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80204344:	060b3783          	ld	a5,96(s6)
    80204348:	e6043703          	ld	a4,-416(s0)
    8020434c:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8020434e:	060b3783          	ld	a5,96(s6)
    80204352:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80204356:	85ea                	mv	a1,s10
    80204358:	ffffe097          	auipc	ra,0xffffe
    8020435c:	8ea080e7          	jalr	-1814(ra) # 80201c42 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    80204360:	058b3783          	ld	a5,88(s6)
    80204364:	83b1                	srli	a5,a5,0xc
    80204366:	577d                	li	a4,-1
    80204368:	177e                	slli	a4,a4,0x3f
    8020436a:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    8020436c:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80204370:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    80204374:	4581                	li	a1,0
    80204376:	854e                	mv	a0,s3
    80204378:	ffffd097          	auipc	ra,0xffffd
    8020437c:	36c080e7          	jalr	876(ra) # 802016e4 <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80204380:	0004851b          	sext.w	a0,s1
    80204384:	a089                	j	802043c6 <exec+0x336>
    return -1;
    80204386:	557d                	li	a0,-1
    80204388:	a83d                	j	802043c6 <exec+0x336>
    8020438a:	de943823          	sd	s1,-528(s0)
    proc_freepagetable(pagetable, sz);
    8020438e:	df043583          	ld	a1,-528(s0)
    80204392:	e0843503          	ld	a0,-504(s0)
    80204396:	ffffe097          	auipc	ra,0xffffe
    8020439a:	8ac080e7          	jalr	-1876(ra) # 80201c42 <proc_freepagetable>
    kvmfree(kpagetable, 0);
    8020439e:	4581                	li	a1,0
    802043a0:	8556                	mv	a0,s5
    802043a2:	ffffd097          	auipc	ra,0xffffd
    802043a6:	342080e7          	jalr	834(ra) # 802016e4 <kvmfree>
    eunlock(ep);
    eput(ep);
  }
  return -1;
    802043aa:	557d                	li	a0,-1
  if(ep){
    802043ac:	000a0d63          	beqz	s4,802043c6 <exec+0x336>
    eunlock(ep);
    802043b0:	8552                	mv	a0,s4
    802043b2:	00002097          	auipc	ra,0x2
    802043b6:	034080e7          	jalr	52(ra) # 802063e6 <eunlock>
    eput(ep);
    802043ba:	8552                	mv	a0,s4
    802043bc:	00002097          	auipc	ra,0x2
    802043c0:	078080e7          	jalr	120(ra) # 80206434 <eput>
  return -1;
    802043c4:	557d                	li	a0,-1
}
    802043c6:	22813083          	ld	ra,552(sp)
    802043ca:	22013403          	ld	s0,544(sp)
    802043ce:	21813483          	ld	s1,536(sp)
    802043d2:	21013903          	ld	s2,528(sp)
    802043d6:	20813983          	ld	s3,520(sp)
    802043da:	20013a03          	ld	s4,512(sp)
    802043de:	7afe                	ld	s5,504(sp)
    802043e0:	7b5e                	ld	s6,496(sp)
    802043e2:	7bbe                	ld	s7,488(sp)
    802043e4:	7c1e                	ld	s8,480(sp)
    802043e6:	6cfe                	ld	s9,472(sp)
    802043e8:	6d5e                	ld	s10,464(sp)
    802043ea:	6dbe                	ld	s11,456(sp)
    802043ec:	23010113          	addi	sp,sp,560
    802043f0:	8082                	ret
    802043f2:	de943823          	sd	s1,-528(s0)
    802043f6:	bf61                	j	8020438e <exec+0x2fe>
    802043f8:	de943823          	sd	s1,-528(s0)
    802043fc:	bf49                	j	8020438e <exec+0x2fe>
    802043fe:	de943823          	sd	s1,-528(s0)
    80204402:	b771                	j	8020438e <exec+0x2fe>
  sz = sz1;
    80204404:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204408:	4a01                	li	s4,0
    8020440a:	b751                	j	8020438e <exec+0x2fe>
  sz = sz1;
    8020440c:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204410:	4a01                	li	s4,0
    80204412:	bfb5                	j	8020438e <exec+0x2fe>
  sz = sz1;
    80204414:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204418:	4a01                	li	s4,0
    8020441a:	bf95                	j	8020438e <exec+0x2fe>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    8020441c:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80204420:	e0043783          	ld	a5,-512(s0)
    80204424:	0017869b          	addiw	a3,a5,1
    80204428:	e0d43023          	sd	a3,-512(s0)
    8020442c:	df843783          	ld	a5,-520(s0)
    80204430:	0387879b          	addiw	a5,a5,56
    80204434:	e8045703          	lhu	a4,-384(s0)
    80204438:	d8e6dfe3          	ble	a4,a3,802041d6 <exec+0x146>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8020443c:	2781                	sext.w	a5,a5
    8020443e:	def43c23          	sd	a5,-520(s0)
    80204442:	03800713          	li	a4,56
    80204446:	86be                	mv	a3,a5
    80204448:	de043603          	ld	a2,-544(s0)
    8020444c:	4581                	li	a1,0
    8020444e:	8552                	mv	a0,s4
    80204450:	00001097          	auipc	ra,0x1
    80204454:	676080e7          	jalr	1654(ra) # 80205ac6 <eread>
    80204458:	03800793          	li	a5,56
    8020445c:	f2f517e3          	bne	a0,a5,8020438a <exec+0x2fa>
    if(ph.type != ELF_PROG_LOAD)
    80204460:	e1042783          	lw	a5,-496(s0)
    80204464:	4705                	li	a4,1
    80204466:	fae79de3          	bne	a5,a4,80204420 <exec+0x390>
    if(ph.memsz < ph.filesz)
    8020446a:	e3843683          	ld	a3,-456(s0)
    8020446e:	e3043783          	ld	a5,-464(s0)
    80204472:	f8f6e0e3          	bltu	a3,a5,802043f2 <exec+0x362>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80204476:	e2043783          	ld	a5,-480(s0)
    8020447a:	96be                	add	a3,a3,a5
    8020447c:	f6f6eee3          	bltu	a3,a5,802043f8 <exec+0x368>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204480:	8626                	mv	a2,s1
    80204482:	85d6                	mv	a1,s5
    80204484:	e0843503          	ld	a0,-504(s0)
    80204488:	ffffd097          	auipc	ra,0xffffd
    8020448c:	bd6080e7          	jalr	-1066(ra) # 8020105e <uvmalloc>
    80204490:	dea43823          	sd	a0,-528(s0)
    80204494:	d52d                	beqz	a0,802043fe <exec+0x36e>
    if(ph.vaddr % PGSIZE != 0)
    80204496:	e2043c03          	ld	s8,-480(s0)
    8020449a:	dd043783          	ld	a5,-560(s0)
    8020449e:	00fc77b3          	and	a5,s8,a5
    802044a2:	ee0796e3          	bnez	a5,8020438e <exec+0x2fe>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    802044a6:	e1842c83          	lw	s9,-488(s0)
    802044aa:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802044ae:	f60b87e3          	beqz	s7,8020441c <exec+0x38c>
    802044b2:	895e                	mv	s2,s7
    802044b4:	4481                	li	s1,0
    802044b6:	b9f5                	j	802041b2 <exec+0x122>
    kvmfree(kpagetable, 0);
    802044b8:	4581                	li	a1,0
    802044ba:	8556                	mv	a0,s5
    802044bc:	ffffd097          	auipc	ra,0xffffd
    802044c0:	228080e7          	jalr	552(ra) # 802016e4 <kvmfree>
  return -1;
    802044c4:	557d                	li	a0,-1
    802044c6:	b701                	j	802043c6 <exec+0x336>

00000000802044c8 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    802044c8:	7179                	addi	sp,sp,-48
    802044ca:	f406                	sd	ra,40(sp)
    802044cc:	f022                	sd	s0,32(sp)
    802044ce:	ec26                	sd	s1,24(sp)
    802044d0:	e84a                	sd	s2,16(sp)
    802044d2:	1800                	addi	s0,sp,48
    802044d4:	892e                	mv	s2,a1
    802044d6:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    802044d8:	fdc40593          	addi	a1,s0,-36
    802044dc:	fffff097          	auipc	ra,0xfffff
    802044e0:	9e4080e7          	jalr	-1564(ra) # 80202ec0 <argint>
    802044e4:	04054063          	bltz	a0,80204524 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    802044e8:	fdc42703          	lw	a4,-36(s0)
    802044ec:	47bd                	li	a5,15
    802044ee:	02e7ed63          	bltu	a5,a4,80204528 <argfd+0x60>
    802044f2:	ffffd097          	auipc	ra,0xffffd
    802044f6:	5ce080e7          	jalr	1486(ra) # 80201ac0 <myproc>
    802044fa:	fdc42703          	lw	a4,-36(s0)
    802044fe:	01a70793          	addi	a5,a4,26
    80204502:	078e                	slli	a5,a5,0x3
    80204504:	953e                	add	a0,a0,a5
    80204506:	651c                	ld	a5,8(a0)
    80204508:	c395                	beqz	a5,8020452c <argfd+0x64>
    return -1;
  if(pfd)
    8020450a:	00090463          	beqz	s2,80204512 <argfd+0x4a>
    *pfd = fd;
    8020450e:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204512:	4501                	li	a0,0
  if(pf)
    80204514:	c091                	beqz	s1,80204518 <argfd+0x50>
    *pf = f;
    80204516:	e09c                	sd	a5,0(s1)
}
    80204518:	70a2                	ld	ra,40(sp)
    8020451a:	7402                	ld	s0,32(sp)
    8020451c:	64e2                	ld	s1,24(sp)
    8020451e:	6942                	ld	s2,16(sp)
    80204520:	6145                	addi	sp,sp,48
    80204522:	8082                	ret
    return -1;
    80204524:	557d                	li	a0,-1
    80204526:	bfcd                	j	80204518 <argfd+0x50>
    return -1;
    80204528:	557d                	li	a0,-1
    8020452a:	b7fd                	j	80204518 <argfd+0x50>
    8020452c:	557d                	li	a0,-1
    8020452e:	b7ed                	j	80204518 <argfd+0x50>

0000000080204530 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80204530:	1101                	addi	sp,sp,-32
    80204532:	ec06                	sd	ra,24(sp)
    80204534:	e822                	sd	s0,16(sp)
    80204536:	e426                	sd	s1,8(sp)
    80204538:	1000                	addi	s0,sp,32
    8020453a:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    8020453c:	ffffd097          	auipc	ra,0xffffd
    80204540:	584080e7          	jalr	1412(ra) # 80201ac0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(p->ofile[fd] == 0){
    80204544:	6d7c                	ld	a5,216(a0)
    80204546:	c395                	beqz	a5,8020456a <fdalloc+0x3a>
    80204548:	0e050713          	addi	a4,a0,224
  for(fd = 0; fd < NOFILE; fd++){
    8020454c:	4785                	li	a5,1
    8020454e:	4641                	li	a2,16
    if(p->ofile[fd] == 0){
    80204550:	6314                	ld	a3,0(a4)
    80204552:	ce89                	beqz	a3,8020456c <fdalloc+0x3c>
  for(fd = 0; fd < NOFILE; fd++){
    80204554:	2785                	addiw	a5,a5,1
    80204556:	0721                	addi	a4,a4,8
    80204558:	fec79ce3          	bne	a5,a2,80204550 <fdalloc+0x20>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    8020455c:	57fd                	li	a5,-1
}
    8020455e:	853e                	mv	a0,a5
    80204560:	60e2                	ld	ra,24(sp)
    80204562:	6442                	ld	s0,16(sp)
    80204564:	64a2                	ld	s1,8(sp)
    80204566:	6105                	addi	sp,sp,32
    80204568:	8082                	ret
  for(fd = 0; fd < NOFILE; fd++){
    8020456a:	4781                	li	a5,0
      p->ofile[fd] = f;
    8020456c:	01a78713          	addi	a4,a5,26
    80204570:	070e                	slli	a4,a4,0x3
    80204572:	953a                	add	a0,a0,a4
    80204574:	e504                	sd	s1,8(a0)
      return fd;
    80204576:	b7e5                	j	8020455e <fdalloc+0x2e>

0000000080204578 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    80204578:	7169                	addi	sp,sp,-304
    8020457a:	f606                	sd	ra,296(sp)
    8020457c:	f222                	sd	s0,288(sp)
    8020457e:	ee26                	sd	s1,280(sp)
    80204580:	ea4a                	sd	s2,272(sp)
    80204582:	e64e                	sd	s3,264(sp)
    80204584:	1a00                	addi	s0,sp,304
    80204586:	89ae                	mv	s3,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    80204588:	ed040593          	addi	a1,s0,-304
    8020458c:	00002097          	auipc	ra,0x2
    80204590:	5f2080e7          	jalr	1522(ra) # 80206b7e <enameparent>
    80204594:	84aa                	mv	s1,a0
    80204596:	cd3d                	beqz	a0,80204614 <create+0x9c>
    return NULL;

  if (type == T_DIR) {
    80204598:	0009879b          	sext.w	a5,s3
    8020459c:	4705                	li	a4,1
    8020459e:	06e78d63          	beq	a5,a4,80204618 <create+0xa0>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    802045a2:	00002097          	auipc	ra,0x2
    802045a6:	e0e080e7          	jalr	-498(ra) # 802063b0 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    802045aa:	4601                	li	a2,0
    802045ac:	ed040593          	addi	a1,s0,-304
    802045b0:	8526                	mv	a0,s1
    802045b2:	00002097          	auipc	ra,0x2
    802045b6:	2f0080e7          	jalr	752(ra) # 802068a2 <ealloc>
    802045ba:	892a                	mv	s2,a0
    802045bc:	c121                	beqz	a0,802045fc <create+0x84>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    802045be:	2981                	sext.w	s3,s3
    802045c0:	4789                	li	a5,2
    802045c2:	00f99663          	bne	s3,a5,802045ce <create+0x56>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    802045c6:	10094783          	lbu	a5,256(s2)
    802045ca:	8bc1                	andi	a5,a5,16
    802045cc:	eba5                	bnez	a5,8020463c <create+0xc4>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    802045ce:	8526                	mv	a0,s1
    802045d0:	00002097          	auipc	ra,0x2
    802045d4:	e16080e7          	jalr	-490(ra) # 802063e6 <eunlock>
  eput(dp);
    802045d8:	8526                	mv	a0,s1
    802045da:	00002097          	auipc	ra,0x2
    802045de:	e5a080e7          	jalr	-422(ra) # 80206434 <eput>

  elock(ep);
    802045e2:	854a                	mv	a0,s2
    802045e4:	00002097          	auipc	ra,0x2
    802045e8:	dcc080e7          	jalr	-564(ra) # 802063b0 <elock>
  return ep;
}
    802045ec:	854a                	mv	a0,s2
    802045ee:	70b2                	ld	ra,296(sp)
    802045f0:	7412                	ld	s0,288(sp)
    802045f2:	64f2                	ld	s1,280(sp)
    802045f4:	6952                	ld	s2,272(sp)
    802045f6:	69b2                	ld	s3,264(sp)
    802045f8:	6155                	addi	sp,sp,304
    802045fa:	8082                	ret
    eunlock(dp);
    802045fc:	8526                	mv	a0,s1
    802045fe:	00002097          	auipc	ra,0x2
    80204602:	de8080e7          	jalr	-536(ra) # 802063e6 <eunlock>
    eput(dp);
    80204606:	8526                	mv	a0,s1
    80204608:	00002097          	auipc	ra,0x2
    8020460c:	e2c080e7          	jalr	-468(ra) # 80206434 <eput>
    return NULL;
    80204610:	4901                	li	s2,0
    80204612:	bfe9                	j	802045ec <create+0x74>
    return NULL;
    80204614:	892a                	mv	s2,a0
    80204616:	bfd9                	j	802045ec <create+0x74>
  elock(dp);
    80204618:	00002097          	auipc	ra,0x2
    8020461c:	d98080e7          	jalr	-616(ra) # 802063b0 <elock>
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204620:	4641                	li	a2,16
    80204622:	ed040593          	addi	a1,s0,-304
    80204626:	8526                	mv	a0,s1
    80204628:	00002097          	auipc	ra,0x2
    8020462c:	27a080e7          	jalr	634(ra) # 802068a2 <ealloc>
    80204630:	892a                	mv	s2,a0
    80204632:	d569                	beqz	a0,802045fc <create+0x84>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    80204634:	10094783          	lbu	a5,256(s2)
    80204638:	8bc1                	andi	a5,a5,16
    8020463a:	fbd1                	bnez	a5,802045ce <create+0x56>
    eunlock(dp);
    8020463c:	8526                	mv	a0,s1
    8020463e:	00002097          	auipc	ra,0x2
    80204642:	da8080e7          	jalr	-600(ra) # 802063e6 <eunlock>
    eput(ep);
    80204646:	854a                	mv	a0,s2
    80204648:	00002097          	auipc	ra,0x2
    8020464c:	dec080e7          	jalr	-532(ra) # 80206434 <eput>
    eput(dp);
    80204650:	8526                	mv	a0,s1
    80204652:	00002097          	auipc	ra,0x2
    80204656:	de2080e7          	jalr	-542(ra) # 80206434 <eput>
    return NULL;
    8020465a:	4901                	li	s2,0
    8020465c:	bf41                	j	802045ec <create+0x74>

000000008020465e <sys_dup>:
{
    8020465e:	7179                	addi	sp,sp,-48
    80204660:	f406                	sd	ra,40(sp)
    80204662:	f022                	sd	s0,32(sp)
    80204664:	ec26                	sd	s1,24(sp)
    80204666:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    80204668:	fd840613          	addi	a2,s0,-40
    8020466c:	4581                	li	a1,0
    8020466e:	4501                	li	a0,0
    80204670:	00000097          	auipc	ra,0x0
    80204674:	e58080e7          	jalr	-424(ra) # 802044c8 <argfd>
    return -1;
    80204678:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    8020467a:	02054363          	bltz	a0,802046a0 <sys_dup+0x42>
  if((fd=fdalloc(f)) < 0)
    8020467e:	fd843503          	ld	a0,-40(s0)
    80204682:	00000097          	auipc	ra,0x0
    80204686:	eae080e7          	jalr	-338(ra) # 80204530 <fdalloc>
    8020468a:	84aa                	mv	s1,a0
    return -1;
    8020468c:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    8020468e:	00054963          	bltz	a0,802046a0 <sys_dup+0x42>
  filedup(f);
    80204692:	fd843503          	ld	a0,-40(s0)
    80204696:	fffff097          	auipc	ra,0xfffff
    8020469a:	2b6080e7          	jalr	694(ra) # 8020394c <filedup>
  return fd;
    8020469e:	87a6                	mv	a5,s1
}
    802046a0:	853e                	mv	a0,a5
    802046a2:	70a2                	ld	ra,40(sp)
    802046a4:	7402                	ld	s0,32(sp)
    802046a6:	64e2                	ld	s1,24(sp)
    802046a8:	6145                	addi	sp,sp,48
    802046aa:	8082                	ret

00000000802046ac <sys_read>:
{
    802046ac:	7179                	addi	sp,sp,-48
    802046ae:	f406                	sd	ra,40(sp)
    802046b0:	f022                	sd	s0,32(sp)
    802046b2:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046b4:	fe840613          	addi	a2,s0,-24
    802046b8:	4581                	li	a1,0
    802046ba:	4501                	li	a0,0
    802046bc:	00000097          	auipc	ra,0x0
    802046c0:	e0c080e7          	jalr	-500(ra) # 802044c8 <argfd>
    return -1;
    802046c4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046c6:	04054163          	bltz	a0,80204708 <sys_read+0x5c>
    802046ca:	fe440593          	addi	a1,s0,-28
    802046ce:	4509                	li	a0,2
    802046d0:	ffffe097          	auipc	ra,0xffffe
    802046d4:	7f0080e7          	jalr	2032(ra) # 80202ec0 <argint>
    return -1;
    802046d8:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046da:	02054763          	bltz	a0,80204708 <sys_read+0x5c>
    802046de:	fd840593          	addi	a1,s0,-40
    802046e2:	4505                	li	a0,1
    802046e4:	fffff097          	auipc	ra,0xfffff
    802046e8:	83e080e7          	jalr	-1986(ra) # 80202f22 <argaddr>
    return -1;
    802046ec:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802046ee:	00054d63          	bltz	a0,80204708 <sys_read+0x5c>
  return fileread(f, p, n);
    802046f2:	fe442603          	lw	a2,-28(s0)
    802046f6:	fd843583          	ld	a1,-40(s0)
    802046fa:	fe843503          	ld	a0,-24(s0)
    802046fe:	fffff097          	auipc	ra,0xfffff
    80204702:	3ba080e7          	jalr	954(ra) # 80203ab8 <fileread>
    80204706:	87aa                	mv	a5,a0
}
    80204708:	853e                	mv	a0,a5
    8020470a:	70a2                	ld	ra,40(sp)
    8020470c:	7402                	ld	s0,32(sp)
    8020470e:	6145                	addi	sp,sp,48
    80204710:	8082                	ret

0000000080204712 <sys_write>:
{
    80204712:	7179                	addi	sp,sp,-48
    80204714:	f406                	sd	ra,40(sp)
    80204716:	f022                	sd	s0,32(sp)
    80204718:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020471a:	fe840613          	addi	a2,s0,-24
    8020471e:	4581                	li	a1,0
    80204720:	4501                	li	a0,0
    80204722:	00000097          	auipc	ra,0x0
    80204726:	da6080e7          	jalr	-602(ra) # 802044c8 <argfd>
    return -1;
    8020472a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020472c:	04054163          	bltz	a0,8020476e <sys_write+0x5c>
    80204730:	fe440593          	addi	a1,s0,-28
    80204734:	4509                	li	a0,2
    80204736:	ffffe097          	auipc	ra,0xffffe
    8020473a:	78a080e7          	jalr	1930(ra) # 80202ec0 <argint>
    return -1;
    8020473e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204740:	02054763          	bltz	a0,8020476e <sys_write+0x5c>
    80204744:	fd840593          	addi	a1,s0,-40
    80204748:	4505                	li	a0,1
    8020474a:	ffffe097          	auipc	ra,0xffffe
    8020474e:	7d8080e7          	jalr	2008(ra) # 80202f22 <argaddr>
    return -1;
    80204752:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204754:	00054d63          	bltz	a0,8020476e <sys_write+0x5c>
  return filewrite(f, p, n);
    80204758:	fe442603          	lw	a2,-28(s0)
    8020475c:	fd843583          	ld	a1,-40(s0)
    80204760:	fe843503          	ld	a0,-24(s0)
    80204764:	fffff097          	auipc	ra,0xfffff
    80204768:	416080e7          	jalr	1046(ra) # 80203b7a <filewrite>
    8020476c:	87aa                	mv	a5,a0
}
    8020476e:	853e                	mv	a0,a5
    80204770:	70a2                	ld	ra,40(sp)
    80204772:	7402                	ld	s0,32(sp)
    80204774:	6145                	addi	sp,sp,48
    80204776:	8082                	ret

0000000080204778 <sys_close>:
{
    80204778:	1101                	addi	sp,sp,-32
    8020477a:	ec06                	sd	ra,24(sp)
    8020477c:	e822                	sd	s0,16(sp)
    8020477e:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    80204780:	fe040613          	addi	a2,s0,-32
    80204784:	fec40593          	addi	a1,s0,-20
    80204788:	4501                	li	a0,0
    8020478a:	00000097          	auipc	ra,0x0
    8020478e:	d3e080e7          	jalr	-706(ra) # 802044c8 <argfd>
    return -1;
    80204792:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    80204794:	02054463          	bltz	a0,802047bc <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    80204798:	ffffd097          	auipc	ra,0xffffd
    8020479c:	328080e7          	jalr	808(ra) # 80201ac0 <myproc>
    802047a0:	fec42783          	lw	a5,-20(s0)
    802047a4:	07e9                	addi	a5,a5,26
    802047a6:	078e                	slli	a5,a5,0x3
    802047a8:	953e                	add	a0,a0,a5
    802047aa:	00053423          	sd	zero,8(a0)
  fileclose(f);
    802047ae:	fe043503          	ld	a0,-32(s0)
    802047b2:	fffff097          	auipc	ra,0xfffff
    802047b6:	1ec080e7          	jalr	492(ra) # 8020399e <fileclose>
  return 0;
    802047ba:	4781                	li	a5,0
}
    802047bc:	853e                	mv	a0,a5
    802047be:	60e2                	ld	ra,24(sp)
    802047c0:	6442                	ld	s0,16(sp)
    802047c2:	6105                	addi	sp,sp,32
    802047c4:	8082                	ret

00000000802047c6 <sys_fstat>:
{
    802047c6:	1101                	addi	sp,sp,-32
    802047c8:	ec06                	sd	ra,24(sp)
    802047ca:	e822                	sd	s0,16(sp)
    802047cc:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802047ce:	fe840613          	addi	a2,s0,-24
    802047d2:	4581                	li	a1,0
    802047d4:	4501                	li	a0,0
    802047d6:	00000097          	auipc	ra,0x0
    802047da:	cf2080e7          	jalr	-782(ra) # 802044c8 <argfd>
    return -1;
    802047de:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802047e0:	02054563          	bltz	a0,8020480a <sys_fstat+0x44>
    802047e4:	fe040593          	addi	a1,s0,-32
    802047e8:	4505                	li	a0,1
    802047ea:	ffffe097          	auipc	ra,0xffffe
    802047ee:	738080e7          	jalr	1848(ra) # 80202f22 <argaddr>
    return -1;
    802047f2:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    802047f4:	00054b63          	bltz	a0,8020480a <sys_fstat+0x44>
  return filestat(f, st);
    802047f8:	fe043583          	ld	a1,-32(s0)
    802047fc:	fe843503          	ld	a0,-24(s0)
    80204800:	fffff097          	auipc	ra,0xfffff
    80204804:	254080e7          	jalr	596(ra) # 80203a54 <filestat>
    80204808:	87aa                	mv	a5,a0
}
    8020480a:	853e                	mv	a0,a5
    8020480c:	60e2                	ld	ra,24(sp)
    8020480e:	6442                	ld	s0,16(sp)
    80204810:	6105                	addi	sp,sp,32
    80204812:	8082                	ret

0000000080204814 <sys_open>:

uint64
sys_open(void)
{
    80204814:	7129                	addi	sp,sp,-320
    80204816:	fe06                	sd	ra,312(sp)
    80204818:	fa22                	sd	s0,304(sp)
    8020481a:	f626                	sd	s1,296(sp)
    8020481c:	f24a                	sd	s2,288(sp)
    8020481e:	ee4e                	sd	s3,280(sp)
    80204820:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204822:	10400613          	li	a2,260
    80204826:	ec840593          	addi	a1,s0,-312
    8020482a:	4501                	li	a0,0
    8020482c:	ffffe097          	auipc	ra,0xffffe
    80204830:	718080e7          	jalr	1816(ra) # 80202f44 <argstr>
    return -1;
    80204834:	54fd                	li	s1,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204836:	08054d63          	bltz	a0,802048d0 <sys_open+0xbc>
    8020483a:	ec440593          	addi	a1,s0,-316
    8020483e:	4505                	li	a0,1
    80204840:	ffffe097          	auipc	ra,0xffffe
    80204844:	680080e7          	jalr	1664(ra) # 80202ec0 <argint>
    80204848:	0e054163          	bltz	a0,8020492a <sys_open+0x116>

  if(omode & O_CREATE){
    8020484c:	ec442603          	lw	a2,-316(s0)
    80204850:	20067793          	andi	a5,a2,512
    80204854:	c7d1                	beqz	a5,802048e0 <sys_open+0xcc>
    ep = create(path, T_FILE, omode);
    80204856:	4589                	li	a1,2
    80204858:	ec840513          	addi	a0,s0,-312
    8020485c:	00000097          	auipc	ra,0x0
    80204860:	d1c080e7          	jalr	-740(ra) # 80204578 <create>
    80204864:	892a                	mv	s2,a0
    if(ep == NULL){
    80204866:	c561                	beqz	a0,8020492e <sys_open+0x11a>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204868:	fffff097          	auipc	ra,0xfffff
    8020486c:	066080e7          	jalr	102(ra) # 802038ce <filealloc>
    80204870:	89aa                	mv	s3,a0
    80204872:	c579                	beqz	a0,80204940 <sys_open+0x12c>
    80204874:	00000097          	auipc	ra,0x0
    80204878:	cbc080e7          	jalr	-836(ra) # 80204530 <fdalloc>
    8020487c:	84aa                	mv	s1,a0
    8020487e:	0a054c63          	bltz	a0,80204936 <sys_open+0x122>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    80204882:	10094783          	lbu	a5,256(s2)
    80204886:	8bc1                	andi	a5,a5,16
    80204888:	e791                	bnez	a5,80204894 <sys_open+0x80>
    8020488a:	ec442783          	lw	a5,-316(s0)
    8020488e:	4007f793          	andi	a5,a5,1024
    80204892:	e7d1                	bnez	a5,8020491e <sys_open+0x10a>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    80204894:	4789                	li	a5,2
    80204896:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    8020489a:	ec442783          	lw	a5,-316(s0)
    8020489e:	0047f693          	andi	a3,a5,4
    802048a2:	4701                	li	a4,0
    802048a4:	c299                	beqz	a3,802048aa <sys_open+0x96>
    802048a6:	10892703          	lw	a4,264(s2)
    802048aa:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    802048ae:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    802048b2:	0017c713          	xori	a4,a5,1
    802048b6:	8b05                	andi	a4,a4,1
    802048b8:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    802048bc:	8b8d                	andi	a5,a5,3
    802048be:	00f037b3          	snez	a5,a5
    802048c2:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    802048c6:	854a                	mv	a0,s2
    802048c8:	00002097          	auipc	ra,0x2
    802048cc:	b1e080e7          	jalr	-1250(ra) # 802063e6 <eunlock>

  return fd;
}
    802048d0:	8526                	mv	a0,s1
    802048d2:	70f2                	ld	ra,312(sp)
    802048d4:	7452                	ld	s0,304(sp)
    802048d6:	74b2                	ld	s1,296(sp)
    802048d8:	7912                	ld	s2,288(sp)
    802048da:	69f2                	ld	s3,280(sp)
    802048dc:	6131                	addi	sp,sp,320
    802048de:	8082                	ret
    if((ep = ename(path)) == NULL){
    802048e0:	ec840513          	addi	a0,s0,-312
    802048e4:	00002097          	auipc	ra,0x2
    802048e8:	27c080e7          	jalr	636(ra) # 80206b60 <ename>
    802048ec:	892a                	mv	s2,a0
    802048ee:	c131                	beqz	a0,80204932 <sys_open+0x11e>
    elock(ep);
    802048f0:	00002097          	auipc	ra,0x2
    802048f4:	ac0080e7          	jalr	-1344(ra) # 802063b0 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    802048f8:	10094783          	lbu	a5,256(s2)
    802048fc:	8bc1                	andi	a5,a5,16
    802048fe:	d7ad                	beqz	a5,80204868 <sys_open+0x54>
    80204900:	ec442783          	lw	a5,-316(s0)
    80204904:	d3b5                	beqz	a5,80204868 <sys_open+0x54>
      eunlock(ep);
    80204906:	854a                	mv	a0,s2
    80204908:	00002097          	auipc	ra,0x2
    8020490c:	ade080e7          	jalr	-1314(ra) # 802063e6 <eunlock>
      eput(ep);
    80204910:	854a                	mv	a0,s2
    80204912:	00002097          	auipc	ra,0x2
    80204916:	b22080e7          	jalr	-1246(ra) # 80206434 <eput>
      return -1;
    8020491a:	54fd                	li	s1,-1
    8020491c:	bf55                	j	802048d0 <sys_open+0xbc>
    etrunc(ep);
    8020491e:	854a                	mv	a0,s2
    80204920:	00002097          	auipc	ra,0x2
    80204924:	a28080e7          	jalr	-1496(ra) # 80206348 <etrunc>
    80204928:	b7b5                	j	80204894 <sys_open+0x80>
    return -1;
    8020492a:	54fd                	li	s1,-1
    8020492c:	b755                	j	802048d0 <sys_open+0xbc>
      return -1;
    8020492e:	54fd                	li	s1,-1
    80204930:	b745                	j	802048d0 <sys_open+0xbc>
      return -1;
    80204932:	54fd                	li	s1,-1
    80204934:	bf71                	j	802048d0 <sys_open+0xbc>
      fileclose(f);
    80204936:	854e                	mv	a0,s3
    80204938:	fffff097          	auipc	ra,0xfffff
    8020493c:	066080e7          	jalr	102(ra) # 8020399e <fileclose>
    eunlock(ep);
    80204940:	854a                	mv	a0,s2
    80204942:	00002097          	auipc	ra,0x2
    80204946:	aa4080e7          	jalr	-1372(ra) # 802063e6 <eunlock>
    eput(ep);
    8020494a:	854a                	mv	a0,s2
    8020494c:	00002097          	auipc	ra,0x2
    80204950:	ae8080e7          	jalr	-1304(ra) # 80206434 <eput>
    return -1;
    80204954:	54fd                	li	s1,-1
    80204956:	bfad                	j	802048d0 <sys_open+0xbc>

0000000080204958 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204958:	7169                	addi	sp,sp,-304
    8020495a:	f606                	sd	ra,296(sp)
    8020495c:	f222                	sd	s0,288(sp)
    8020495e:	ee26                	sd	s1,280(sp)
    80204960:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204962:	10400613          	li	a2,260
    80204966:	ed840593          	addi	a1,s0,-296
    8020496a:	4501                	li	a0,0
    8020496c:	ffffe097          	auipc	ra,0xffffe
    80204970:	5d8080e7          	jalr	1496(ra) # 80202f44 <argstr>
    return -1;
    80204974:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204976:	02054663          	bltz	a0,802049a2 <sys_mkdir+0x4a>
    8020497a:	4601                	li	a2,0
    8020497c:	4585                	li	a1,1
    8020497e:	ed840513          	addi	a0,s0,-296
    80204982:	00000097          	auipc	ra,0x0
    80204986:	bf6080e7          	jalr	-1034(ra) # 80204578 <create>
    8020498a:	84aa                	mv	s1,a0
    8020498c:	c10d                	beqz	a0,802049ae <sys_mkdir+0x56>
  }
  eunlock(ep);
    8020498e:	00002097          	auipc	ra,0x2
    80204992:	a58080e7          	jalr	-1448(ra) # 802063e6 <eunlock>
  eput(ep);
    80204996:	8526                	mv	a0,s1
    80204998:	00002097          	auipc	ra,0x2
    8020499c:	a9c080e7          	jalr	-1380(ra) # 80206434 <eput>
  return 0;
    802049a0:	4781                	li	a5,0
}
    802049a2:	853e                	mv	a0,a5
    802049a4:	70b2                	ld	ra,296(sp)
    802049a6:	7412                	ld	s0,288(sp)
    802049a8:	64f2                	ld	s1,280(sp)
    802049aa:	6155                	addi	sp,sp,304
    802049ac:	8082                	ret
    return -1;
    802049ae:	57fd                	li	a5,-1
    802049b0:	bfcd                	j	802049a2 <sys_mkdir+0x4a>

00000000802049b2 <sys_chdir>:

uint64
sys_chdir(void)
{
    802049b2:	7169                	addi	sp,sp,-304
    802049b4:	f606                	sd	ra,296(sp)
    802049b6:	f222                	sd	s0,288(sp)
    802049b8:	ee26                	sd	s1,280(sp)
    802049ba:	ea4a                	sd	s2,272(sp)
    802049bc:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    802049be:	ffffd097          	auipc	ra,0xffffd
    802049c2:	102080e7          	jalr	258(ra) # 80201ac0 <myproc>
    802049c6:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    802049c8:	10400613          	li	a2,260
    802049cc:	ed840593          	addi	a1,s0,-296
    802049d0:	4501                	li	a0,0
    802049d2:	ffffe097          	auipc	ra,0xffffe
    802049d6:	572080e7          	jalr	1394(ra) # 80202f44 <argstr>
    return -1;
    802049da:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    802049dc:	04054063          	bltz	a0,80204a1c <sys_chdir+0x6a>
    802049e0:	ed840513          	addi	a0,s0,-296
    802049e4:	00002097          	auipc	ra,0x2
    802049e8:	17c080e7          	jalr	380(ra) # 80206b60 <ename>
    802049ec:	84aa                	mv	s1,a0
    802049ee:	c931                	beqz	a0,80204a42 <sys_chdir+0x90>
  }
  elock(ep);
    802049f0:	00002097          	auipc	ra,0x2
    802049f4:	9c0080e7          	jalr	-1600(ra) # 802063b0 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    802049f8:	1004c783          	lbu	a5,256(s1)
    802049fc:	8bc1                	andi	a5,a5,16
    802049fe:	c795                	beqz	a5,80204a2a <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204a00:	8526                	mv	a0,s1
    80204a02:	00002097          	auipc	ra,0x2
    80204a06:	9e4080e7          	jalr	-1564(ra) # 802063e6 <eunlock>
  eput(p->cwd);
    80204a0a:	15893503          	ld	a0,344(s2)
    80204a0e:	00002097          	auipc	ra,0x2
    80204a12:	a26080e7          	jalr	-1498(ra) # 80206434 <eput>
  p->cwd = ep;
    80204a16:	14993c23          	sd	s1,344(s2)
  return 0;
    80204a1a:	4781                	li	a5,0
}
    80204a1c:	853e                	mv	a0,a5
    80204a1e:	70b2                	ld	ra,296(sp)
    80204a20:	7412                	ld	s0,288(sp)
    80204a22:	64f2                	ld	s1,280(sp)
    80204a24:	6952                	ld	s2,272(sp)
    80204a26:	6155                	addi	sp,sp,304
    80204a28:	8082                	ret
    eunlock(ep);
    80204a2a:	8526                	mv	a0,s1
    80204a2c:	00002097          	auipc	ra,0x2
    80204a30:	9ba080e7          	jalr	-1606(ra) # 802063e6 <eunlock>
    eput(ep);
    80204a34:	8526                	mv	a0,s1
    80204a36:	00002097          	auipc	ra,0x2
    80204a3a:	9fe080e7          	jalr	-1538(ra) # 80206434 <eput>
    return -1;
    80204a3e:	57fd                	li	a5,-1
    80204a40:	bff1                	j	80204a1c <sys_chdir+0x6a>
    return -1;
    80204a42:	57fd                	li	a5,-1
    80204a44:	bfe1                	j	80204a1c <sys_chdir+0x6a>

0000000080204a46 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204a46:	7139                	addi	sp,sp,-64
    80204a48:	fc06                	sd	ra,56(sp)
    80204a4a:	f822                	sd	s0,48(sp)
    80204a4c:	f426                	sd	s1,40(sp)
    80204a4e:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204a50:	ffffd097          	auipc	ra,0xffffd
    80204a54:	070080e7          	jalr	112(ra) # 80201ac0 <myproc>
    80204a58:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204a5a:	fd840593          	addi	a1,s0,-40
    80204a5e:	4501                	li	a0,0
    80204a60:	ffffe097          	auipc	ra,0xffffe
    80204a64:	4c2080e7          	jalr	1218(ra) # 80202f22 <argaddr>
    return -1;
    80204a68:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204a6a:	0c054d63          	bltz	a0,80204b44 <sys_pipe+0xfe>
  if(pipealloc(&rf, &wf) < 0)
    80204a6e:	fc840593          	addi	a1,s0,-56
    80204a72:	fd040513          	addi	a0,s0,-48
    80204a76:	fffff097          	auipc	ra,0xfffff
    80204a7a:	29e080e7          	jalr	670(ra) # 80203d14 <pipealloc>
    return -1;
    80204a7e:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204a80:	0c054263          	bltz	a0,80204b44 <sys_pipe+0xfe>
  fd0 = -1;
    80204a84:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204a88:	fd043503          	ld	a0,-48(s0)
    80204a8c:	00000097          	auipc	ra,0x0
    80204a90:	aa4080e7          	jalr	-1372(ra) # 80204530 <fdalloc>
    80204a94:	fca42223          	sw	a0,-60(s0)
    80204a98:	08054963          	bltz	a0,80204b2a <sys_pipe+0xe4>
    80204a9c:	fc843503          	ld	a0,-56(s0)
    80204aa0:	00000097          	auipc	ra,0x0
    80204aa4:	a90080e7          	jalr	-1392(ra) # 80204530 <fdalloc>
    80204aa8:	fca42023          	sw	a0,-64(s0)
    80204aac:	06054663          	bltz	a0,80204b18 <sys_pipe+0xd2>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204ab0:	4611                	li	a2,4
    80204ab2:	fc440593          	addi	a1,s0,-60
    80204ab6:	fd843503          	ld	a0,-40(s0)
    80204aba:	ffffd097          	auipc	ra,0xffffd
    80204abe:	908080e7          	jalr	-1784(ra) # 802013c2 <copyout2>
    80204ac2:	00054f63          	bltz	a0,80204ae0 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204ac6:	4611                	li	a2,4
    80204ac8:	fc040593          	addi	a1,s0,-64
    80204acc:	fd843503          	ld	a0,-40(s0)
    80204ad0:	0511                	addi	a0,a0,4
    80204ad2:	ffffd097          	auipc	ra,0xffffd
    80204ad6:	8f0080e7          	jalr	-1808(ra) # 802013c2 <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204ada:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204adc:	06055463          	bgez	a0,80204b44 <sys_pipe+0xfe>
    p->ofile[fd0] = 0;
    80204ae0:	fc442783          	lw	a5,-60(s0)
    80204ae4:	07e9                	addi	a5,a5,26
    80204ae6:	078e                	slli	a5,a5,0x3
    80204ae8:	97a6                	add	a5,a5,s1
    80204aea:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204aee:	fc042783          	lw	a5,-64(s0)
    80204af2:	07e9                	addi	a5,a5,26
    80204af4:	078e                	slli	a5,a5,0x3
    80204af6:	94be                	add	s1,s1,a5
    80204af8:	0004b423          	sd	zero,8(s1)
    fileclose(rf);
    80204afc:	fd043503          	ld	a0,-48(s0)
    80204b00:	fffff097          	auipc	ra,0xfffff
    80204b04:	e9e080e7          	jalr	-354(ra) # 8020399e <fileclose>
    fileclose(wf);
    80204b08:	fc843503          	ld	a0,-56(s0)
    80204b0c:	fffff097          	auipc	ra,0xfffff
    80204b10:	e92080e7          	jalr	-366(ra) # 8020399e <fileclose>
    return -1;
    80204b14:	57fd                	li	a5,-1
    80204b16:	a03d                	j	80204b44 <sys_pipe+0xfe>
    if(fd0 >= 0)
    80204b18:	fc442783          	lw	a5,-60(s0)
    80204b1c:	0007c763          	bltz	a5,80204b2a <sys_pipe+0xe4>
      p->ofile[fd0] = 0;
    80204b20:	07e9                	addi	a5,a5,26
    80204b22:	078e                	slli	a5,a5,0x3
    80204b24:	94be                	add	s1,s1,a5
    80204b26:	0004b423          	sd	zero,8(s1)
    fileclose(rf);
    80204b2a:	fd043503          	ld	a0,-48(s0)
    80204b2e:	fffff097          	auipc	ra,0xfffff
    80204b32:	e70080e7          	jalr	-400(ra) # 8020399e <fileclose>
    fileclose(wf);
    80204b36:	fc843503          	ld	a0,-56(s0)
    80204b3a:	fffff097          	auipc	ra,0xfffff
    80204b3e:	e64080e7          	jalr	-412(ra) # 8020399e <fileclose>
    return -1;
    80204b42:	57fd                	li	a5,-1
}
    80204b44:	853e                	mv	a0,a5
    80204b46:	70e2                	ld	ra,56(sp)
    80204b48:	7442                	ld	s0,48(sp)
    80204b4a:	74a2                	ld	s1,40(sp)
    80204b4c:	6121                	addi	sp,sp,64
    80204b4e:	8082                	ret

0000000080204b50 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204b50:	7179                	addi	sp,sp,-48
    80204b52:	f406                	sd	ra,40(sp)
    80204b54:	f022                	sd	s0,32(sp)
    80204b56:	ec26                	sd	s1,24(sp)
    80204b58:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204b5a:	fdc40593          	addi	a1,s0,-36
    80204b5e:	4501                	li	a0,0
    80204b60:	ffffe097          	auipc	ra,0xffffe
    80204b64:	360080e7          	jalr	864(ra) # 80202ec0 <argint>
    80204b68:	08054a63          	bltz	a0,80204bfc <sys_dev+0xac>
    80204b6c:	fd840593          	addi	a1,s0,-40
    80204b70:	4505                	li	a0,1
    80204b72:	ffffe097          	auipc	ra,0xffffe
    80204b76:	34e080e7          	jalr	846(ra) # 80202ec0 <argint>
    80204b7a:	08054763          	bltz	a0,80204c08 <sys_dev+0xb8>
    80204b7e:	fd440593          	addi	a1,s0,-44
    80204b82:	4509                	li	a0,2
    80204b84:	ffffe097          	auipc	ra,0xffffe
    80204b88:	33c080e7          	jalr	828(ra) # 80202ec0 <argint>
    80204b8c:	08054063          	bltz	a0,80204c0c <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204b90:	fdc42783          	lw	a5,-36(s0)
    80204b94:	2007f793          	andi	a5,a5,512
    80204b98:	ebb1                	bnez	a5,80204bec <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204b9a:	fd842703          	lw	a4,-40(s0)
    80204b9e:	47a5                	li	a5,9
    return -1;
    80204ba0:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204ba2:	04e7ee63          	bltu	a5,a4,80204bfe <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204ba6:	fffff097          	auipc	ra,0xfffff
    80204baa:	d28080e7          	jalr	-728(ra) # 802038ce <filealloc>
    80204bae:	84aa                	mv	s1,a0
    80204bb0:	c125                	beqz	a0,80204c10 <sys_dev+0xc0>
    80204bb2:	00000097          	auipc	ra,0x0
    80204bb6:	97e080e7          	jalr	-1666(ra) # 80204530 <fdalloc>
    80204bba:	04054d63          	bltz	a0,80204c14 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204bbe:	478d                	li	a5,3
    80204bc0:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204bc2:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204bc6:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204bca:	fd842783          	lw	a5,-40(s0)
    80204bce:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204bd2:	fdc42783          	lw	a5,-36(s0)
    80204bd6:	0017c713          	xori	a4,a5,1
    80204bda:	8b05                	andi	a4,a4,1
    80204bdc:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204be0:	8b8d                	andi	a5,a5,3
    80204be2:	00f037b3          	snez	a5,a5
    80204be6:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204bea:	a811                	j	80204bfe <sys_dev+0xae>
    panic("dev file on FAT");
    80204bec:	00005517          	auipc	a0,0x5
    80204bf0:	f8c50513          	addi	a0,a0,-116 # 80209b78 <etext+0xb78>
    80204bf4:	ffffb097          	auipc	ra,0xffffb
    80204bf8:	552080e7          	jalr	1362(ra) # 80200146 <panic>
    return -1;
    80204bfc:	557d                	li	a0,-1
}
    80204bfe:	70a2                	ld	ra,40(sp)
    80204c00:	7402                	ld	s0,32(sp)
    80204c02:	64e2                	ld	s1,24(sp)
    80204c04:	6145                	addi	sp,sp,48
    80204c06:	8082                	ret
    return -1;
    80204c08:	557d                	li	a0,-1
    80204c0a:	bfd5                	j	80204bfe <sys_dev+0xae>
    80204c0c:	557d                	li	a0,-1
    80204c0e:	bfc5                	j	80204bfe <sys_dev+0xae>
    return -1;
    80204c10:	557d                	li	a0,-1
    80204c12:	b7f5                	j	80204bfe <sys_dev+0xae>
      fileclose(f);
    80204c14:	8526                	mv	a0,s1
    80204c16:	fffff097          	auipc	ra,0xfffff
    80204c1a:	d88080e7          	jalr	-632(ra) # 8020399e <fileclose>
    return -1;
    80204c1e:	557d                	li	a0,-1
    80204c20:	bff9                	j	80204bfe <sys_dev+0xae>

0000000080204c22 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204c22:	1101                	addi	sp,sp,-32
    80204c24:	ec06                	sd	ra,24(sp)
    80204c26:	e822                	sd	s0,16(sp)
    80204c28:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204c2a:	fe840613          	addi	a2,s0,-24
    80204c2e:	4581                	li	a1,0
    80204c30:	4501                	li	a0,0
    80204c32:	00000097          	auipc	ra,0x0
    80204c36:	896080e7          	jalr	-1898(ra) # 802044c8 <argfd>
    return -1;
    80204c3a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204c3c:	02054563          	bltz	a0,80204c66 <sys_readdir+0x44>
    80204c40:	fe040593          	addi	a1,s0,-32
    80204c44:	4505                	li	a0,1
    80204c46:	ffffe097          	auipc	ra,0xffffe
    80204c4a:	2dc080e7          	jalr	732(ra) # 80202f22 <argaddr>
    return -1;
    80204c4e:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204c50:	00054b63          	bltz	a0,80204c66 <sys_readdir+0x44>
  return dirnext(f, p);
    80204c54:	fe043583          	ld	a1,-32(s0)
    80204c58:	fe843503          	ld	a0,-24(s0)
    80204c5c:	fffff097          	auipc	ra,0xfffff
    80204c60:	ff0080e7          	jalr	-16(ra) # 80203c4c <dirnext>
    80204c64:	87aa                	mv	a5,a0
}
    80204c66:	853e                	mv	a0,a5
    80204c68:	60e2                	ld	ra,24(sp)
    80204c6a:	6442                	ld	s0,16(sp)
    80204c6c:	6105                	addi	sp,sp,32
    80204c6e:	8082                	ret

0000000080204c70 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204c70:	714d                	addi	sp,sp,-336
    80204c72:	e686                	sd	ra,328(sp)
    80204c74:	e2a2                	sd	s0,320(sp)
    80204c76:	fe26                	sd	s1,312(sp)
    80204c78:	fa4a                	sd	s2,304(sp)
    80204c7a:	f64e                	sd	s3,296(sp)
    80204c7c:	f252                	sd	s4,288(sp)
    80204c7e:	ee56                	sd	s5,280(sp)
    80204c80:	0a80                	addi	s0,sp,336
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    80204c82:	fb840593          	addi	a1,s0,-72
    80204c86:	4501                	li	a0,0
    80204c88:	ffffe097          	auipc	ra,0xffffe
    80204c8c:	29a080e7          	jalr	666(ra) # 80202f22 <argaddr>
    return -1;
    80204c90:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0)
    80204c92:	06054d63          	bltz	a0,80204d0c <sys_getcwd+0x9c>

  struct dirent *de = myproc()->cwd;
    80204c96:	ffffd097          	auipc	ra,0xffffd
    80204c9a:	e2a080e7          	jalr	-470(ra) # 80201ac0 <myproc>
    80204c9e:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204ca2:	1204b783          	ld	a5,288(s1)
    80204ca6:	cfad                	beqz	a5,80204d20 <sys_getcwd+0xb0>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204ca8:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204cac:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204cb0:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204cb4:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204cb8:	8526                	mv	a0,s1
    80204cba:	ffffc097          	auipc	ra,0xffffc
    80204cbe:	c64080e7          	jalr	-924(ra) # 8020091e <strlen>
      s -= len;
    80204cc2:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204cc6:	072a7263          	bleu	s2,s4,80204d2a <sys_getcwd+0xba>
      strncpy(s, de->filename, len);
    80204cca:	862a                	mv	a2,a0
    80204ccc:	85a6                	mv	a1,s1
    80204cce:	854a                	mv	a0,s2
    80204cd0:	ffffc097          	auipc	ra,0xffffc
    80204cd4:	bdc080e7          	jalr	-1060(ra) # 802008ac <strncpy>
      *--s = '/';
    80204cd8:	fff90993          	addi	s3,s2,-1
    80204cdc:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204ce0:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204ce4:	1204b783          	ld	a5,288(s1)
    80204ce8:	fbe1                	bnez	a5,80204cb8 <sys_getcwd+0x48>
    }
  }

  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204cea:	fb843483          	ld	s1,-72(s0)
    80204cee:	854e                	mv	a0,s3
    80204cf0:	ffffc097          	auipc	ra,0xffffc
    80204cf4:	c2e080e7          	jalr	-978(ra) # 8020091e <strlen>
    80204cf8:	0015061b          	addiw	a2,a0,1
    80204cfc:	85ce                	mv	a1,s3
    80204cfe:	8526                	mv	a0,s1
    80204d00:	ffffc097          	auipc	ra,0xffffc
    80204d04:	6c2080e7          	jalr	1730(ra) # 802013c2 <copyout2>
    80204d08:	43f55793          	srai	a5,a0,0x3f
    return -1;
  
  return 0;

}
    80204d0c:	853e                	mv	a0,a5
    80204d0e:	60b6                	ld	ra,328(sp)
    80204d10:	6416                	ld	s0,320(sp)
    80204d12:	74f2                	ld	s1,312(sp)
    80204d14:	7952                	ld	s2,304(sp)
    80204d16:	79b2                	ld	s3,296(sp)
    80204d18:	7a12                	ld	s4,288(sp)
    80204d1a:	6af2                	ld	s5,280(sp)
    80204d1c:	6171                	addi	sp,sp,336
    80204d1e:	8082                	ret
    s = "/";
    80204d20:	00005997          	auipc	s3,0x5
    80204d24:	91098993          	addi	s3,s3,-1776 # 80209630 <etext+0x630>
    80204d28:	b7c9                	j	80204cea <sys_getcwd+0x7a>
        return -1;
    80204d2a:	57fd                	li	a5,-1
    80204d2c:	b7c5                	j	80204d0c <sys_getcwd+0x9c>

0000000080204d2e <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204d2e:	d6010113          	addi	sp,sp,-672
    80204d32:	28113c23          	sd	ra,664(sp)
    80204d36:	28813823          	sd	s0,656(sp)
    80204d3a:	28913423          	sd	s1,648(sp)
    80204d3e:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204d40:	10400613          	li	a2,260
    80204d44:	ed840593          	addi	a1,s0,-296
    80204d48:	4501                	li	a0,0
    80204d4a:	ffffe097          	auipc	ra,0xffffe
    80204d4e:	1fa080e7          	jalr	506(ra) # 80202f44 <argstr>
    80204d52:	0ea05f63          	blez	a0,80204e50 <sys_remove+0x122>
    return -1;

  char *s = path + len - 1;
    80204d56:	157d                	addi	a0,a0,-1
    80204d58:	ed840793          	addi	a5,s0,-296
    80204d5c:	953e                	add	a0,a0,a5
  while (s >= path && *s == '/') {
    80204d5e:	02f56c63          	bltu	a0,a5,80204d96 <sys_remove+0x68>
    80204d62:	00054703          	lbu	a4,0(a0)
    80204d66:	02f00793          	li	a5,47
    80204d6a:	02f71063          	bne	a4,a5,80204d8a <sys_remove+0x5c>
    80204d6e:	fff50793          	addi	a5,a0,-1
    80204d72:	ed740693          	addi	a3,s0,-297
    80204d76:	02f00613          	li	a2,47
    s--;
    80204d7a:	853e                	mv	a0,a5
  while (s >= path && *s == '/') {
    80204d7c:	00d78d63          	beq	a5,a3,80204d96 <sys_remove+0x68>
    80204d80:	17fd                	addi	a5,a5,-1
    80204d82:	0017c703          	lbu	a4,1(a5)
    80204d86:	fec70ae3          	beq	a4,a2,80204d7a <sys_remove+0x4c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204d8a:	00054703          	lbu	a4,0(a0)
    80204d8e:	02e00793          	li	a5,46
    80204d92:	08f70763          	beq	a4,a5,80204e20 <sys_remove+0xf2>
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204d96:	ed840513          	addi	a0,s0,-296
    80204d9a:	00002097          	auipc	ra,0x2
    80204d9e:	dc6080e7          	jalr	-570(ra) # 80206b60 <ename>
    80204da2:	84aa                	mv	s1,a0
    80204da4:	c955                	beqz	a0,80204e58 <sys_remove+0x12a>
    return -1;
  }
  elock(ep);
    80204da6:	00001097          	auipc	ra,0x1
    80204daa:	60a080e7          	jalr	1546(ra) # 802063b0 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204dae:	1004c783          	lbu	a5,256(s1)
    80204db2:	8bc1                	andi	a5,a5,16
    80204db4:	c38d                	beqz	a5,80204dd6 <sys_remove+0xa8>
  ep.valid = 0;
    80204db6:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204dba:	d6c40693          	addi	a3,s0,-660
    80204dbe:	04000613          	li	a2,64
    80204dc2:	d7040593          	addi	a1,s0,-656
    80204dc6:	8526                	mv	a0,s1
    80204dc8:	00001097          	auipc	ra,0x1
    80204dcc:	7ec080e7          	jalr	2028(ra) # 802065b4 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204dd0:	57fd                	li	a5,-1
    80204dd2:	06f51363          	bne	a0,a5,80204e38 <sys_remove+0x10a>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204dd6:	1204b503          	ld	a0,288(s1)
    80204dda:	00001097          	auipc	ra,0x1
    80204dde:	5d6080e7          	jalr	1494(ra) # 802063b0 <elock>
  eremove(ep);
    80204de2:	8526                	mv	a0,s1
    80204de4:	00001097          	auipc	ra,0x1
    80204de8:	49a080e7          	jalr	1178(ra) # 8020627e <eremove>
  eunlock(ep->parent);
    80204dec:	1204b503          	ld	a0,288(s1)
    80204df0:	00001097          	auipc	ra,0x1
    80204df4:	5f6080e7          	jalr	1526(ra) # 802063e6 <eunlock>
  eunlock(ep);
    80204df8:	8526                	mv	a0,s1
    80204dfa:	00001097          	auipc	ra,0x1
    80204dfe:	5ec080e7          	jalr	1516(ra) # 802063e6 <eunlock>
  eput(ep);
    80204e02:	8526                	mv	a0,s1
    80204e04:	00001097          	auipc	ra,0x1
    80204e08:	630080e7          	jalr	1584(ra) # 80206434 <eput>

  return 0;
    80204e0c:	4501                	li	a0,0
}
    80204e0e:	29813083          	ld	ra,664(sp)
    80204e12:	29013403          	ld	s0,656(sp)
    80204e16:	28813483          	ld	s1,648(sp)
    80204e1a:	2a010113          	addi	sp,sp,672
    80204e1e:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204e20:	ed840793          	addi	a5,s0,-296
    80204e24:	02f50863          	beq	a0,a5,80204e54 <sys_remove+0x126>
    80204e28:	fff54703          	lbu	a4,-1(a0)
    80204e2c:	02f00793          	li	a5,47
    80204e30:	f6f713e3          	bne	a4,a5,80204d96 <sys_remove+0x68>
    return -1;
    80204e34:	557d                	li	a0,-1
    80204e36:	bfe1                	j	80204e0e <sys_remove+0xe0>
      eunlock(ep);
    80204e38:	8526                	mv	a0,s1
    80204e3a:	00001097          	auipc	ra,0x1
    80204e3e:	5ac080e7          	jalr	1452(ra) # 802063e6 <eunlock>
      eput(ep);
    80204e42:	8526                	mv	a0,s1
    80204e44:	00001097          	auipc	ra,0x1
    80204e48:	5f0080e7          	jalr	1520(ra) # 80206434 <eput>
      return -1;
    80204e4c:	557d                	li	a0,-1
    80204e4e:	b7c1                	j	80204e0e <sys_remove+0xe0>
    return -1;
    80204e50:	557d                	li	a0,-1
    80204e52:	bf75                	j	80204e0e <sys_remove+0xe0>
    return -1;
    80204e54:	557d                	li	a0,-1
    80204e56:	bf65                	j	80204e0e <sys_remove+0xe0>
    return -1;
    80204e58:	557d                	li	a0,-1
    80204e5a:	bf55                	j	80204e0e <sys_remove+0xe0>

0000000080204e5c <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80204e5c:	c4010113          	addi	sp,sp,-960
    80204e60:	3a113c23          	sd	ra,952(sp)
    80204e64:	3a813823          	sd	s0,944(sp)
    80204e68:	3a913423          	sd	s1,936(sp)
    80204e6c:	3b213023          	sd	s2,928(sp)
    80204e70:	39313c23          	sd	s3,920(sp)
    80204e74:	39413823          	sd	s4,912(sp)
    80204e78:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204e7a:	10400613          	li	a2,260
    80204e7e:	ec840593          	addi	a1,s0,-312
    80204e82:	4501                	li	a0,0
    80204e84:	ffffe097          	auipc	ra,0xffffe
    80204e88:	0c0080e7          	jalr	192(ra) # 80202f44 <argstr>
      return -1;
    80204e8c:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204e8e:	0c054d63          	bltz	a0,80204f68 <sys_rename+0x10c>
    80204e92:	10400613          	li	a2,260
    80204e96:	dc040593          	addi	a1,s0,-576
    80204e9a:	4505                	li	a0,1
    80204e9c:	ffffe097          	auipc	ra,0xffffe
    80204ea0:	0a8080e7          	jalr	168(ra) # 80202f44 <argstr>
      return -1;
    80204ea4:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80204ea6:	0c054163          	bltz	a0,80204f68 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80204eaa:	ec840513          	addi	a0,s0,-312
    80204eae:	00002097          	auipc	ra,0x2
    80204eb2:	cb2080e7          	jalr	-846(ra) # 80206b60 <ename>
    80204eb6:	84aa                	mv	s1,a0
    80204eb8:	1c050963          	beqz	a0,8020508a <sys_rename+0x22e>
    80204ebc:	ec840593          	addi	a1,s0,-312
    80204ec0:	dc040513          	addi	a0,s0,-576
    80204ec4:	00002097          	auipc	ra,0x2
    80204ec8:	cba080e7          	jalr	-838(ra) # 80206b7e <enameparent>
    80204ecc:	892a                	mv	s2,a0
    80204ece:	cd35                	beqz	a0,80204f4a <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    80204ed0:	ec840513          	addi	a0,s0,-312
    80204ed4:	00001097          	auipc	ra,0x1
    80204ed8:	e14080e7          	jalr	-492(ra) # 80205ce8 <formatname>
    80204edc:	8a2a                	mv	s4,a0
    80204ede:	c535                	beqz	a0,80204f4a <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204ee0:	07248563          	beq	s1,s2,80204f4a <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    80204ee4:	87ca                	mv	a5,s2
    80204ee6:	1207b783          	ld	a5,288(a5)
    80204eea:	c781                	beqz	a5,80204ef2 <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    80204eec:	fef49de3          	bne	s1,a5,80204ee6 <sys_rename+0x8a>
    80204ef0:	a8a9                	j	80204f4a <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    80204ef2:	8526                	mv	a0,s1
    80204ef4:	00001097          	auipc	ra,0x1
    80204ef8:	4bc080e7          	jalr	1212(ra) # 802063b0 <elock>
  srclock = 1;
  elock(pdst);
    80204efc:	854a                	mv	a0,s2
    80204efe:	00001097          	auipc	ra,0x1
    80204f02:	4b2080e7          	jalr	1202(ra) # 802063b0 <elock>
  dst = dirlookup(pdst, name, &off);
    80204f06:	dbc40613          	addi	a2,s0,-580
    80204f0a:	85d2                	mv	a1,s4
    80204f0c:	854a                	mv	a0,s2
    80204f0e:	00002097          	auipc	ra,0x2
    80204f12:	836080e7          	jalr	-1994(ra) # 80206744 <dirlookup>
    80204f16:	89aa                	mv	s3,a0
  if (dst != NULL) {
    80204f18:	cd45                	beqz	a0,80204fd0 <sys_rename+0x174>
    eunlock(pdst);
    80204f1a:	854a                	mv	a0,s2
    80204f1c:	00001097          	auipc	ra,0x1
    80204f20:	4ca080e7          	jalr	1226(ra) # 802063e6 <eunlock>
    if (src == dst) {
    80204f24:	01348963          	beq	s1,s3,80204f36 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    80204f28:	1004c783          	lbu	a5,256(s1)
    80204f2c:	1009c703          	lbu	a4,256(s3)
    80204f30:	8ff9                	and	a5,a5,a4
    80204f32:	8bc1                	andi	a5,a5,16
    80204f34:	ebb1                	bnez	a5,80204f88 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80204f36:	8526                	mv	a0,s1
    80204f38:	00001097          	auipc	ra,0x1
    80204f3c:	4ae080e7          	jalr	1198(ra) # 802063e6 <eunlock>
  if (dst)
    eput(dst);
    80204f40:	854e                	mv	a0,s3
    80204f42:	00001097          	auipc	ra,0x1
    80204f46:	4f2080e7          	jalr	1266(ra) # 80206434 <eput>
  if (pdst)
    80204f4a:	00090763          	beqz	s2,80204f58 <sys_rename+0xfc>
    eput(pdst);
    80204f4e:	854a                	mv	a0,s2
    80204f50:	00001097          	auipc	ra,0x1
    80204f54:	4e4080e7          	jalr	1252(ra) # 80206434 <eput>
  if (src)
    eput(src);
  return -1;
    80204f58:	57fd                	li	a5,-1
  if (src)
    80204f5a:	c499                	beqz	s1,80204f68 <sys_rename+0x10c>
    eput(src);
    80204f5c:	8526                	mv	a0,s1
    80204f5e:	00001097          	auipc	ra,0x1
    80204f62:	4d6080e7          	jalr	1238(ra) # 80206434 <eput>
  return -1;
    80204f66:	57fd                	li	a5,-1
}
    80204f68:	853e                	mv	a0,a5
    80204f6a:	3b813083          	ld	ra,952(sp)
    80204f6e:	3b013403          	ld	s0,944(sp)
    80204f72:	3a813483          	ld	s1,936(sp)
    80204f76:	3a013903          	ld	s2,928(sp)
    80204f7a:	39813983          	ld	s3,920(sp)
    80204f7e:	39013a03          	ld	s4,912(sp)
    80204f82:	3c010113          	addi	sp,sp,960
    80204f86:	8082                	ret
      elock(dst);
    80204f88:	854e                	mv	a0,s3
    80204f8a:	00001097          	auipc	ra,0x1
    80204f8e:	426080e7          	jalr	1062(ra) # 802063b0 <elock>
  ep.valid = 0;
    80204f92:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204f96:	c4c40693          	addi	a3,s0,-948
    80204f9a:	04000613          	li	a2,64
    80204f9e:	c5040593          	addi	a1,s0,-944
    80204fa2:	854e                	mv	a0,s3
    80204fa4:	00001097          	auipc	ra,0x1
    80204fa8:	610080e7          	jalr	1552(ra) # 802065b4 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80204fac:	57fd                	li	a5,-1
    80204fae:	0cf51863          	bne	a0,a5,8020507e <sys_rename+0x222>
      elock(pdst);
    80204fb2:	854a                	mv	a0,s2
    80204fb4:	00001097          	auipc	ra,0x1
    80204fb8:	3fc080e7          	jalr	1020(ra) # 802063b0 <elock>
    eremove(dst);
    80204fbc:	854e                	mv	a0,s3
    80204fbe:	00001097          	auipc	ra,0x1
    80204fc2:	2c0080e7          	jalr	704(ra) # 8020627e <eremove>
    eunlock(dst);
    80204fc6:	854e                	mv	a0,s3
    80204fc8:	00001097          	auipc	ra,0x1
    80204fcc:	41e080e7          	jalr	1054(ra) # 802063e6 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    80204fd0:	0ff00613          	li	a2,255
    80204fd4:	85d2                	mv	a1,s4
    80204fd6:	8526                	mv	a0,s1
    80204fd8:	ffffc097          	auipc	ra,0xffffc
    80204fdc:	808080e7          	jalr	-2040(ra) # 802007e0 <memmove>
  emake(pdst, src, off);
    80204fe0:	dbc42603          	lw	a2,-580(s0)
    80204fe4:	85a6                	mv	a1,s1
    80204fe6:	854a                	mv	a0,s2
    80204fe8:	00001097          	auipc	ra,0x1
    80204fec:	dc0080e7          	jalr	-576(ra) # 80205da8 <emake>
  if (src->parent != pdst) {
    80204ff0:	1204b783          	ld	a5,288(s1)
    80204ff4:	01278d63          	beq	a5,s2,8020500e <sys_rename+0x1b2>
    eunlock(pdst);
    80204ff8:	854a                	mv	a0,s2
    80204ffa:	00001097          	auipc	ra,0x1
    80204ffe:	3ec080e7          	jalr	1004(ra) # 802063e6 <eunlock>
    elock(src->parent);
    80205002:	1204b503          	ld	a0,288(s1)
    80205006:	00001097          	auipc	ra,0x1
    8020500a:	3aa080e7          	jalr	938(ra) # 802063b0 <elock>
  eremove(src);
    8020500e:	8526                	mv	a0,s1
    80205010:	00001097          	auipc	ra,0x1
    80205014:	26e080e7          	jalr	622(ra) # 8020627e <eremove>
  eunlock(src->parent);
    80205018:	1204b503          	ld	a0,288(s1)
    8020501c:	00001097          	auipc	ra,0x1
    80205020:	3ca080e7          	jalr	970(ra) # 802063e6 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    80205024:	1204ba03          	ld	s4,288(s1)
  src->parent = edup(pdst);
    80205028:	854a                	mv	a0,s2
    8020502a:	00001097          	auipc	ra,0x1
    8020502e:	12c080e7          	jalr	300(ra) # 80206156 <edup>
    80205032:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80205036:	dbc42783          	lw	a5,-580(s0)
    8020503a:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    8020503e:	4785                	li	a5,1
    80205040:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205044:	8526                	mv	a0,s1
    80205046:	00001097          	auipc	ra,0x1
    8020504a:	3a0080e7          	jalr	928(ra) # 802063e6 <eunlock>
  eput(psrc);
    8020504e:	8552                	mv	a0,s4
    80205050:	00001097          	auipc	ra,0x1
    80205054:	3e4080e7          	jalr	996(ra) # 80206434 <eput>
  if (dst) {
    80205058:	00098763          	beqz	s3,80205066 <sys_rename+0x20a>
    eput(dst);
    8020505c:	854e                	mv	a0,s3
    8020505e:	00001097          	auipc	ra,0x1
    80205062:	3d6080e7          	jalr	982(ra) # 80206434 <eput>
  eput(pdst);
    80205066:	854a                	mv	a0,s2
    80205068:	00001097          	auipc	ra,0x1
    8020506c:	3cc080e7          	jalr	972(ra) # 80206434 <eput>
  eput(src);
    80205070:	8526                	mv	a0,s1
    80205072:	00001097          	auipc	ra,0x1
    80205076:	3c2080e7          	jalr	962(ra) # 80206434 <eput>
  return 0;
    8020507a:	4781                	li	a5,0
    8020507c:	b5f5                	j	80204f68 <sys_rename+0x10c>
        eunlock(dst);
    8020507e:	854e                	mv	a0,s3
    80205080:	00001097          	auipc	ra,0x1
    80205084:	366080e7          	jalr	870(ra) # 802063e6 <eunlock>
        goto fail;
    80205088:	b57d                	j	80204f36 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    8020508a:	892a                	mv	s2,a0
  if (dst)
    8020508c:	bd7d                	j	80204f4a <sys_rename+0xee>
	...

0000000080205090 <kernelvec>:
    80205090:	7111                	addi	sp,sp,-256
    80205092:	e006                	sd	ra,0(sp)
    80205094:	e40a                	sd	sp,8(sp)
    80205096:	e80e                	sd	gp,16(sp)
    80205098:	ec12                	sd	tp,24(sp)
    8020509a:	f016                	sd	t0,32(sp)
    8020509c:	f41a                	sd	t1,40(sp)
    8020509e:	f81e                	sd	t2,48(sp)
    802050a0:	fc22                	sd	s0,56(sp)
    802050a2:	e0a6                	sd	s1,64(sp)
    802050a4:	e4aa                	sd	a0,72(sp)
    802050a6:	e8ae                	sd	a1,80(sp)
    802050a8:	ecb2                	sd	a2,88(sp)
    802050aa:	f0b6                	sd	a3,96(sp)
    802050ac:	f4ba                	sd	a4,104(sp)
    802050ae:	f8be                	sd	a5,112(sp)
    802050b0:	fcc2                	sd	a6,120(sp)
    802050b2:	e146                	sd	a7,128(sp)
    802050b4:	e54a                	sd	s2,136(sp)
    802050b6:	e94e                	sd	s3,144(sp)
    802050b8:	ed52                	sd	s4,152(sp)
    802050ba:	f156                	sd	s5,160(sp)
    802050bc:	f55a                	sd	s6,168(sp)
    802050be:	f95e                	sd	s7,176(sp)
    802050c0:	fd62                	sd	s8,184(sp)
    802050c2:	e1e6                	sd	s9,192(sp)
    802050c4:	e5ea                	sd	s10,200(sp)
    802050c6:	e9ee                	sd	s11,208(sp)
    802050c8:	edf2                	sd	t3,216(sp)
    802050ca:	f1f6                	sd	t4,224(sp)
    802050cc:	f5fa                	sd	t5,232(sp)
    802050ce:	f9fe                	sd	t6,240(sp)
    802050d0:	96dfd0ef          	jal	ra,80202a3c <kerneltrap>
    802050d4:	6082                	ld	ra,0(sp)
    802050d6:	6122                	ld	sp,8(sp)
    802050d8:	61c2                	ld	gp,16(sp)
    802050da:	7282                	ld	t0,32(sp)
    802050dc:	7322                	ld	t1,40(sp)
    802050de:	73c2                	ld	t2,48(sp)
    802050e0:	7462                	ld	s0,56(sp)
    802050e2:	6486                	ld	s1,64(sp)
    802050e4:	6526                	ld	a0,72(sp)
    802050e6:	65c6                	ld	a1,80(sp)
    802050e8:	6666                	ld	a2,88(sp)
    802050ea:	7686                	ld	a3,96(sp)
    802050ec:	7726                	ld	a4,104(sp)
    802050ee:	77c6                	ld	a5,112(sp)
    802050f0:	7866                	ld	a6,120(sp)
    802050f2:	688a                	ld	a7,128(sp)
    802050f4:	692a                	ld	s2,136(sp)
    802050f6:	69ca                	ld	s3,144(sp)
    802050f8:	6a6a                	ld	s4,152(sp)
    802050fa:	7a8a                	ld	s5,160(sp)
    802050fc:	7b2a                	ld	s6,168(sp)
    802050fe:	7bca                	ld	s7,176(sp)
    80205100:	7c6a                	ld	s8,184(sp)
    80205102:	6c8e                	ld	s9,192(sp)
    80205104:	6d2e                	ld	s10,200(sp)
    80205106:	6dce                	ld	s11,208(sp)
    80205108:	6e6e                	ld	t3,216(sp)
    8020510a:	7e8e                	ld	t4,224(sp)
    8020510c:	7f2e                	ld	t5,232(sp)
    8020510e:	7fce                	ld	t6,240(sp)
    80205110:	6111                	addi	sp,sp,256
    80205112:	10200073          	sret
	...

000000008020511e <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    8020511e:	1141                	addi	sp,sp,-16
    80205120:	e406                	sd	ra,8(sp)
    80205122:	e022                	sd	s0,0(sp)
    80205124:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    80205126:	00005597          	auipc	a1,0x5
    8020512a:	a6258593          	addi	a1,a1,-1438 # 80209b88 <etext+0xb88>
    8020512e:	00018517          	auipc	a0,0x18
    80205132:	46a50513          	addi	a0,a0,1130 # 8021d598 <tickslock>
    80205136:	ffffb097          	auipc	ra,0xffffb
    8020513a:	55e080e7          	jalr	1374(ra) # 80200694 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    #endif
}
    8020513e:	60a2                	ld	ra,8(sp)
    80205140:	6402                	ld	s0,0(sp)
    80205142:	0141                	addi	sp,sp,16
    80205144:	8082                	ret

0000000080205146 <set_next_timeout>:

void
set_next_timeout() {
    80205146:	1141                	addi	sp,sp,-16
    80205148:	e422                	sd	s0,8(sp)
    8020514a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020514c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205150:	001dc7b7          	lui	a5,0x1dc
    80205154:	13078793          	addi	a5,a5,304 # 1dc130 <BASE_ADDRESS-0x80023ed0>
    80205158:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020515a:	4581                	li	a1,0
    8020515c:	4601                	li	a2,0
    8020515e:	4681                	li	a3,0
    80205160:	4881                	li	a7,0
    80205162:	00000073          	ecall
}
    80205166:	6422                	ld	s0,8(sp)
    80205168:	0141                	addi	sp,sp,16
    8020516a:	8082                	ret

000000008020516c <timer_tick>:

void timer_tick() {
    8020516c:	1101                	addi	sp,sp,-32
    8020516e:	ec06                	sd	ra,24(sp)
    80205170:	e822                	sd	s0,16(sp)
    80205172:	e426                	sd	s1,8(sp)
    80205174:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205176:	00018497          	auipc	s1,0x18
    8020517a:	42248493          	addi	s1,s1,1058 # 8021d598 <tickslock>
    8020517e:	8526                	mv	a0,s1
    80205180:	ffffb097          	auipc	ra,0xffffb
    80205184:	558080e7          	jalr	1368(ra) # 802006d8 <acquire>
    ticks++;
    80205188:	4c9c                	lw	a5,24(s1)
    8020518a:	2785                	addiw	a5,a5,1
    8020518c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    8020518e:	00018517          	auipc	a0,0x18
    80205192:	42250513          	addi	a0,a0,1058 # 8021d5b0 <ticks>
    80205196:	ffffd097          	auipc	ra,0xffffd
    8020519a:	39c080e7          	jalr	924(ra) # 80202532 <wakeup>
    release(&tickslock);
    8020519e:	8526                	mv	a0,s1
    802051a0:	ffffb097          	auipc	ra,0xffffb
    802051a4:	58c080e7          	jalr	1420(ra) # 8020072c <release>
    set_next_timeout();
    802051a8:	00000097          	auipc	ra,0x0
    802051ac:	f9e080e7          	jalr	-98(ra) # 80205146 <set_next_timeout>
}
    802051b0:	60e2                	ld	ra,24(sp)
    802051b2:	6442                	ld	s0,16(sp)
    802051b4:	64a2                	ld	s1,8(sp)
    802051b6:	6105                	addi	sp,sp,32
    802051b8:	8082                	ret

00000000802051ba <get_tick>:

int get_tick() {
    802051ba:	1141                	addi	sp,sp,-16
    802051bc:	e422                	sd	s0,8(sp)
    802051be:	0800                	addi	s0,sp,16
  return ticks;
    802051c0:	00018797          	auipc	a5,0x18
    802051c4:	3d878793          	addi	a5,a5,984 # 8021d598 <tickslock>
    802051c8:	4f88                	lw	a0,24(a5)
    802051ca:	6422                	ld	s0,8(sp)
    802051cc:	0141                	addi	sp,sp,16
    802051ce:	8082                	ret

00000000802051d0 <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    802051d0:	1141                	addi	sp,sp,-16
    802051d2:	e406                	sd	ra,8(sp)
    802051d4:	e022                	sd	s0,0(sp)
    802051d6:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    802051d8:	00002097          	auipc	ra,0x2
    802051dc:	ef0080e7          	jalr	-272(ra) # 802070c8 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    802051e0:	60a2                	ld	ra,8(sp)
    802051e2:	6402                	ld	s0,0(sp)
    802051e4:	0141                	addi	sp,sp,16
    802051e6:	8082                	ret

00000000802051e8 <disk_read>:

void disk_read(struct buf *b)
{
    802051e8:	1141                	addi	sp,sp,-16
    802051ea:	e406                	sd	ra,8(sp)
    802051ec:	e022                	sd	s0,0(sp)
    802051ee:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    802051f0:	4581                	li	a1,0
    802051f2:	00002097          	auipc	ra,0x2
    802051f6:	074080e7          	jalr	116(ra) # 80207266 <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    802051fa:	60a2                	ld	ra,8(sp)
    802051fc:	6402                	ld	s0,0(sp)
    802051fe:	0141                	addi	sp,sp,16
    80205200:	8082                	ret

0000000080205202 <disk_write>:

void disk_write(struct buf *b)
{
    80205202:	1141                	addi	sp,sp,-16
    80205204:	e406                	sd	ra,8(sp)
    80205206:	e022                	sd	s0,0(sp)
    80205208:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    8020520a:	4585                	li	a1,1
    8020520c:	00002097          	auipc	ra,0x2
    80205210:	05a080e7          	jalr	90(ra) # 80207266 <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    80205214:	60a2                	ld	ra,8(sp)
    80205216:	6402                	ld	s0,0(sp)
    80205218:	0141                	addi	sp,sp,16
    8020521a:	8082                	ret

000000008020521c <disk_intr>:

void disk_intr(void)
{
    8020521c:	1141                	addi	sp,sp,-16
    8020521e:	e406                	sd	ra,8(sp)
    80205220:	e022                	sd	s0,0(sp)
    80205222:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    80205224:	00002097          	auipc	ra,0x2
    80205228:	302080e7          	jalr	770(ra) # 80207526 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    8020522c:	60a2                	ld	ra,8(sp)
    8020522e:	6402                	ld	s0,0(sp)
    80205230:	0141                	addi	sp,sp,16
    80205232:	8082                	ret

0000000080205234 <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    80205234:	1101                	addi	sp,sp,-32
    80205236:	ec06                	sd	ra,24(sp)
    80205238:	e822                	sd	s0,16(sp)
    8020523a:	e426                	sd	s1,8(sp)
    8020523c:	e04a                	sd	s2,0(sp)
    8020523e:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    80205240:	100007b7          	lui	a5,0x10000
    80205244:	17dd                	addi	a5,a5,-9
        return cluster;
    80205246:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205248:	00a7eb63          	bltu	a5,a0,8020525e <read_fat+0x2a>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    8020524c:	00018797          	auipc	a5,0x18
    80205250:	36c78793          	addi	a5,a5,876 # 8021d5b8 <fat>
    80205254:	479c                	lw	a5,8(a5)
    80205256:	2785                	addiw	a5,a5,1
        return 0;
    80205258:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    8020525a:	00a7f963          	bleu	a0,a5,8020526c <read_fat+0x38>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    8020525e:	8526                	mv	a0,s1
    80205260:	60e2                	ld	ra,24(sp)
    80205262:	6442                	ld	s0,16(sp)
    80205264:	64a2                	ld	s1,8(sp)
    80205266:	6902                	ld	s2,0(sp)
    80205268:	6105                	addi	sp,sp,32
    8020526a:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    8020526c:	0025149b          	slliw	s1,a0,0x2
    80205270:	00018917          	auipc	s2,0x18
    80205274:	34890913          	addi	s2,s2,840 # 8021d5b8 <fat>
    80205278:	01095783          	lhu	a5,16(s2)
    8020527c:	02f4d7bb          	divuw	a5,s1,a5
    80205280:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    80205284:	9dbd                	addw	a1,a1,a5
    80205286:	4501                	li	a0,0
    80205288:	ffffe097          	auipc	ra,0xffffe
    8020528c:	270080e7          	jalr	624(ra) # 802034f8 <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205290:	01095783          	lhu	a5,16(s2)
    80205294:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205298:	1482                	slli	s1,s1,0x20
    8020529a:	9081                	srli	s1,s1,0x20
    8020529c:	94aa                	add	s1,s1,a0
    8020529e:	4ca4                	lw	s1,88(s1)
    brelse(b);
    802052a0:	ffffe097          	auipc	ra,0xffffe
    802052a4:	396080e7          	jalr	918(ra) # 80203636 <brelse>
    return next_clus;
    802052a8:	bf5d                	j	8020525e <read_fat+0x2a>

00000000802052aa <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    802052aa:	711d                	addi	sp,sp,-96
    802052ac:	ec86                	sd	ra,88(sp)
    802052ae:	e8a2                	sd	s0,80(sp)
    802052b0:	e4a6                	sd	s1,72(sp)
    802052b2:	e0ca                	sd	s2,64(sp)
    802052b4:	fc4e                	sd	s3,56(sp)
    802052b6:	f852                	sd	s4,48(sp)
    802052b8:	f456                	sd	s5,40(sp)
    802052ba:	f05a                	sd	s6,32(sp)
    802052bc:	ec5e                	sd	s7,24(sp)
    802052be:	e862                	sd	s8,16(sp)
    802052c0:	e466                	sd	s9,8(sp)
    802052c2:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    802052c4:	00018797          	auipc	a5,0x18
    802052c8:	2f478793          	addi	a5,a5,756 # 8021d5b8 <fat>
    802052cc:	0147db03          	lhu	s6,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    802052d0:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802052d4:	539c                	lw	a5,32(a5)
    802052d6:	10078663          	beqz	a5,802053e2 <alloc_clus+0x138>
    802052da:	0029591b          	srliw	s2,s2,0x2
    802052de:	0009099b          	sext.w	s3,s2
    802052e2:	4a81                	li	s5,0
        b = bread(dev, sec);
    802052e4:	00050b9b          	sext.w	s7,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802052e8:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802052ea:	00018c97          	auipc	s9,0x18
    802052ee:	2cec8c93          	addi	s9,s9,718 # 8021d5b8 <fat>
    802052f2:	a821                	j	8020530a <alloc_clus+0x60>
                uint32 clus = i * ent_per_sec + j;
                zero_clus(clus);
                return clus;
            }
        }
        brelse(b);
    802052f4:	8552                	mv	a0,s4
    802052f6:	ffffe097          	auipc	ra,0xffffe
    802052fa:	340080e7          	jalr	832(ra) # 80203636 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802052fe:	2a85                	addiw	s5,s5,1
    80205300:	2b05                	addiw	s6,s6,1
    80205302:	020ca783          	lw	a5,32(s9)
    80205306:	0cfafe63          	bleu	a5,s5,802053e2 <alloc_clus+0x138>
        b = bread(dev, sec);
    8020530a:	85da                	mv	a1,s6
    8020530c:	855e                	mv	a0,s7
    8020530e:	ffffe097          	auipc	ra,0xffffe
    80205312:	1ea080e7          	jalr	490(ra) # 802034f8 <bread>
    80205316:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205318:	fc098ee3          	beqz	s3,802052f4 <alloc_clus+0x4a>
            if (((uint32 *)(b->data))[j] == 0) {
    8020531c:	05850693          	addi	a3,a0,88
    80205320:	4d24                	lw	s1,88(a0)
    80205322:	cc81                	beqz	s1,8020533a <alloc_clus+0x90>
    80205324:	05c50793          	addi	a5,a0,92
        for (uint32 j = 0; j < ent_per_sec; j++) {
    80205328:	84e2                	mv	s1,s8
    8020532a:	2485                	addiw	s1,s1,1
    8020532c:	fc9984e3          	beq	s3,s1,802052f4 <alloc_clus+0x4a>
            if (((uint32 *)(b->data))[j] == 0) {
    80205330:	86be                	mv	a3,a5
    80205332:	0791                	addi	a5,a5,4
    80205334:	ffc7a703          	lw	a4,-4(a5)
    80205338:	fb6d                	bnez	a4,8020532a <alloc_clus+0x80>
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    8020533a:	100007b7          	lui	a5,0x10000
    8020533e:	37fd                	addiw	a5,a5,-1
    80205340:	c29c                	sw	a5,0(a3)
                bwrite(b);
    80205342:	8552                	mv	a0,s4
    80205344:	ffffe097          	auipc	ra,0xffffe
    80205348:	2b6080e7          	jalr	694(ra) # 802035fa <bwrite>
                brelse(b);
    8020534c:	8552                	mv	a0,s4
    8020534e:	ffffe097          	auipc	ra,0xffffe
    80205352:	2e8080e7          	jalr	744(ra) # 80203636 <brelse>
                uint32 clus = i * ent_per_sec + j;
    80205356:	0359093b          	mulw	s2,s2,s5
    8020535a:	009904bb          	addw	s1,s2,s1
    8020535e:	00048a9b          	sext.w	s5,s1
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205362:	00018717          	auipc	a4,0x18
    80205366:	25670713          	addi	a4,a4,598 # 8021d5b8 <fat>
    8020536a:	01274783          	lbu	a5,18(a4)
    8020536e:	34f9                	addiw	s1,s1,-2
    80205370:	02f489bb          	mulw	s3,s1,a5
    80205374:	4318                	lw	a4,0(a4)
    80205376:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    8020537a:	c7b1                	beqz	a5,802053c6 <alloc_clus+0x11c>
    8020537c:	4481                	li	s1,0
    8020537e:	00018a17          	auipc	s4,0x18
    80205382:	23aa0a13          	addi	s4,s4,570 # 8021d5b8 <fat>
        b = bread(0, sec++);
    80205386:	013485bb          	addw	a1,s1,s3
    8020538a:	4501                	li	a0,0
    8020538c:	ffffe097          	auipc	ra,0xffffe
    80205390:	16c080e7          	jalr	364(ra) # 802034f8 <bread>
    80205394:	892a                	mv	s2,a0
        memset(b->data, 0, BSIZE);
    80205396:	20000613          	li	a2,512
    8020539a:	4581                	li	a1,0
    8020539c:	05850513          	addi	a0,a0,88
    802053a0:	ffffb097          	auipc	ra,0xffffb
    802053a4:	3d4080e7          	jalr	980(ra) # 80200774 <memset>
        bwrite(b);
    802053a8:	854a                	mv	a0,s2
    802053aa:	ffffe097          	auipc	ra,0xffffe
    802053ae:	250080e7          	jalr	592(ra) # 802035fa <bwrite>
        brelse(b);
    802053b2:	854a                	mv	a0,s2
    802053b4:	ffffe097          	auipc	ra,0xffffe
    802053b8:	282080e7          	jalr	642(ra) # 80203636 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    802053bc:	2485                	addiw	s1,s1,1
    802053be:	012a4783          	lbu	a5,18(s4)
    802053c2:	fcf4c2e3          	blt	s1,a5,80205386 <alloc_clus+0xdc>
    }
    panic("no clusters");
}
    802053c6:	8556                	mv	a0,s5
    802053c8:	60e6                	ld	ra,88(sp)
    802053ca:	6446                	ld	s0,80(sp)
    802053cc:	64a6                	ld	s1,72(sp)
    802053ce:	6906                	ld	s2,64(sp)
    802053d0:	79e2                	ld	s3,56(sp)
    802053d2:	7a42                	ld	s4,48(sp)
    802053d4:	7aa2                	ld	s5,40(sp)
    802053d6:	7b02                	ld	s6,32(sp)
    802053d8:	6be2                	ld	s7,24(sp)
    802053da:	6c42                	ld	s8,16(sp)
    802053dc:	6ca2                	ld	s9,8(sp)
    802053de:	6125                	addi	sp,sp,96
    802053e0:	8082                	ret
    panic("no clusters");
    802053e2:	00004517          	auipc	a0,0x4
    802053e6:	7ae50513          	addi	a0,a0,1966 # 80209b90 <etext+0xb90>
    802053ea:	ffffb097          	auipc	ra,0xffffb
    802053ee:	d5c080e7          	jalr	-676(ra) # 80200146 <panic>

00000000802053f2 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802053f2:	00018797          	auipc	a5,0x18
    802053f6:	1c678793          	addi	a5,a5,454 # 8021d5b8 <fat>
    802053fa:	479c                	lw	a5,8(a5)
    802053fc:	2785                	addiw	a5,a5,1
    802053fe:	06a7e963          	bltu	a5,a0,80205470 <write_fat+0x7e>
{
    80205402:	7179                	addi	sp,sp,-48
    80205404:	f406                	sd	ra,40(sp)
    80205406:	f022                	sd	s0,32(sp)
    80205408:	ec26                	sd	s1,24(sp)
    8020540a:	e84a                	sd	s2,16(sp)
    8020540c:	e44e                	sd	s3,8(sp)
    8020540e:	e052                	sd	s4,0(sp)
    80205410:	1800                	addi	s0,sp,48
    80205412:	8a2e                	mv	s4,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205414:	0025149b          	slliw	s1,a0,0x2
    80205418:	00018917          	auipc	s2,0x18
    8020541c:	1a090913          	addi	s2,s2,416 # 8021d5b8 <fat>
    80205420:	01095783          	lhu	a5,16(s2)
    80205424:	02f4d7bb          	divuw	a5,s1,a5
    80205428:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    8020542c:	9dbd                	addw	a1,a1,a5
    8020542e:	4501                	li	a0,0
    80205430:	ffffe097          	auipc	ra,0xffffe
    80205434:	0c8080e7          	jalr	200(ra) # 802034f8 <bread>
    80205438:	89aa                	mv	s3,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    8020543a:	01095783          	lhu	a5,16(s2)
    8020543e:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205442:	1482                	slli	s1,s1,0x20
    80205444:	9081                	srli	s1,s1,0x20
    80205446:	94aa                	add	s1,s1,a0
    80205448:	0544ac23          	sw	s4,88(s1)
    bwrite(b);
    8020544c:	ffffe097          	auipc	ra,0xffffe
    80205450:	1ae080e7          	jalr	430(ra) # 802035fa <bwrite>
    brelse(b);
    80205454:	854e                	mv	a0,s3
    80205456:	ffffe097          	auipc	ra,0xffffe
    8020545a:	1e0080e7          	jalr	480(ra) # 80203636 <brelse>
    return 0;
    8020545e:	4501                	li	a0,0
}
    80205460:	70a2                	ld	ra,40(sp)
    80205462:	7402                	ld	s0,32(sp)
    80205464:	64e2                	ld	s1,24(sp)
    80205466:	6942                	ld	s2,16(sp)
    80205468:	69a2                	ld	s3,8(sp)
    8020546a:	6a02                	ld	s4,0(sp)
    8020546c:	6145                	addi	sp,sp,48
    8020546e:	8082                	ret
        return -1;
    80205470:	557d                	li	a0,-1
}
    80205472:	8082                	ret

0000000080205474 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205474:	715d                	addi	sp,sp,-80
    80205476:	e486                	sd	ra,72(sp)
    80205478:	e0a2                	sd	s0,64(sp)
    8020547a:	fc26                	sd	s1,56(sp)
    8020547c:	f84a                	sd	s2,48(sp)
    8020547e:	f44e                	sd	s3,40(sp)
    80205480:	f052                	sd	s4,32(sp)
    80205482:	ec56                	sd	s5,24(sp)
    80205484:	e85a                	sd	s6,16(sp)
    80205486:	e45e                	sd	s7,8(sp)
    80205488:	0880                	addi	s0,sp,80
    8020548a:	84aa                	mv	s1,a0
    8020548c:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    8020548e:	00018797          	auipc	a5,0x18
    80205492:	12a78793          	addi	a5,a5,298 # 8021d5b8 <fat>
    80205496:	00c7ab83          	lw	s7,12(a5)
    8020549a:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    8020549e:	11052703          	lw	a4,272(a0)
    802054a2:	07377763          	bleu	s3,a4,80205510 <reloc_clus+0x9c>
    802054a6:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    802054a8:	10000ab7          	lui	s5,0x10000
    802054ac:	1add                	addi	s5,s5,-9
    802054ae:	a025                	j	802054d6 <reloc_clus+0x62>
            if (alloc) {
                clus = alloc_clus(entry->dev);
                write_fat(entry->cur_clus, clus);
            } else {
                entry->cur_clus = entry->first_clus;
    802054b0:	1044a783          	lw	a5,260(s1)
    802054b4:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    802054b8:	1004a823          	sw	zero,272(s1)
                return -1;
    802054bc:	557d                	li	a0,-1
    802054be:	a04d                	j	80205560 <reloc_clus+0xec>
            }
        }
        entry->cur_clus = clus;
    802054c0:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    802054c4:	1104a783          	lw	a5,272(s1)
    802054c8:	2785                	addiw	a5,a5,1
    802054ca:	0007871b          	sext.w	a4,a5
    802054ce:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    802054d2:	03377f63          	bleu	s3,a4,80205510 <reloc_clus+0x9c>
        int clus = read_fat(entry->cur_clus);
    802054d6:	10c4a503          	lw	a0,268(s1)
    802054da:	00000097          	auipc	ra,0x0
    802054de:	d5a080e7          	jalr	-678(ra) # 80205234 <read_fat>
    802054e2:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802054e6:	fd2adde3          	ble	s2,s5,802054c0 <reloc_clus+0x4c>
            if (alloc) {
    802054ea:	fc0b03e3          	beqz	s6,802054b0 <reloc_clus+0x3c>
                clus = alloc_clus(entry->dev);
    802054ee:	1144c503          	lbu	a0,276(s1)
    802054f2:	00000097          	auipc	ra,0x0
    802054f6:	db8080e7          	jalr	-584(ra) # 802052aa <alloc_clus>
    802054fa:	0005059b          	sext.w	a1,a0
    802054fe:	0005891b          	sext.w	s2,a1
                write_fat(entry->cur_clus, clus);
    80205502:	10c4a503          	lw	a0,268(s1)
    80205506:	00000097          	auipc	ra,0x0
    8020550a:	eec080e7          	jalr	-276(ra) # 802053f2 <write_fat>
    8020550e:	bf4d                	j	802054c0 <reloc_clus+0x4c>
    }
    if (clus_num < entry->clus_cnt) {
    80205510:	04e9f163          	bleu	a4,s3,80205552 <reloc_clus+0xde>
        entry->cur_clus = entry->first_clus;
    80205514:	1044a783          	lw	a5,260(s1)
    80205518:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    8020551c:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205520:	037a6963          	bltu	s4,s7,80205552 <reloc_clus+0xde>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    80205524:	10000937          	lui	s2,0x10000
    80205528:	195d                	addi	s2,s2,-9
            entry->cur_clus = read_fat(entry->cur_clus);
    8020552a:	10c4a503          	lw	a0,268(s1)
    8020552e:	00000097          	auipc	ra,0x0
    80205532:	d06080e7          	jalr	-762(ra) # 80205234 <read_fat>
    80205536:	2501                	sext.w	a0,a0
    80205538:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    8020553c:	02a96d63          	bltu	s2,a0,80205576 <reloc_clus+0x102>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    80205540:	1104a783          	lw	a5,272(s1)
    80205544:	2785                	addiw	a5,a5,1
    80205546:	0007871b          	sext.w	a4,a5
    8020554a:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    8020554e:	fd376ee3          	bltu	a4,s3,8020552a <reloc_clus+0xb6>
        }
    }
    return off % fat.byts_per_clus;
    80205552:	00018797          	auipc	a5,0x18
    80205556:	06678793          	addi	a5,a5,102 # 8021d5b8 <fat>
    8020555a:	47c8                	lw	a0,12(a5)
    8020555c:	02aa753b          	remuw	a0,s4,a0
}
    80205560:	60a6                	ld	ra,72(sp)
    80205562:	6406                	ld	s0,64(sp)
    80205564:	74e2                	ld	s1,56(sp)
    80205566:	7942                	ld	s2,48(sp)
    80205568:	79a2                	ld	s3,40(sp)
    8020556a:	7a02                	ld	s4,32(sp)
    8020556c:	6ae2                	ld	s5,24(sp)
    8020556e:	6b42                	ld	s6,16(sp)
    80205570:	6ba2                	ld	s7,8(sp)
    80205572:	6161                	addi	sp,sp,80
    80205574:	8082                	ret
                panic("reloc_clus");
    80205576:	00004517          	auipc	a0,0x4
    8020557a:	62a50513          	addi	a0,a0,1578 # 80209ba0 <etext+0xba0>
    8020557e:	ffffb097          	auipc	ra,0xffffb
    80205582:	bc8080e7          	jalr	-1080(ra) # 80200146 <panic>

0000000080205586 <rw_clus>:
{
    80205586:	7119                	addi	sp,sp,-128
    80205588:	fc86                	sd	ra,120(sp)
    8020558a:	f8a2                	sd	s0,112(sp)
    8020558c:	f4a6                	sd	s1,104(sp)
    8020558e:	f0ca                	sd	s2,96(sp)
    80205590:	ecce                	sd	s3,88(sp)
    80205592:	e8d2                	sd	s4,80(sp)
    80205594:	e4d6                	sd	s5,72(sp)
    80205596:	e0da                	sd	s6,64(sp)
    80205598:	fc5e                	sd	s7,56(sp)
    8020559a:	f862                	sd	s8,48(sp)
    8020559c:	f466                	sd	s9,40(sp)
    8020559e:	f06a                	sd	s10,32(sp)
    802055a0:	ec6e                	sd	s11,24(sp)
    802055a2:	0100                	addi	s0,sp,128
    802055a4:	f8c43423          	sd	a2,-120(s0)
    802055a8:	8b36                	mv	s6,a3
    802055aa:	8bbe                	mv	s7,a5
    if (off + n > fat.byts_per_clus)
    802055ac:	00f706bb          	addw	a3,a4,a5
    802055b0:	00018797          	auipc	a5,0x18
    802055b4:	00878793          	addi	a5,a5,8 # 8021d5b8 <fat>
    802055b8:	47dc                	lw	a5,12(a5)
    802055ba:	02d7ef63          	bltu	a5,a3,802055f8 <rw_clus+0x72>
    802055be:	8d2e                	mv	s10,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802055c0:	00018797          	auipc	a5,0x18
    802055c4:	ff878793          	addi	a5,a5,-8 # 8021d5b8 <fat>
    802055c8:	0107da03          	lhu	s4,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802055cc:	ffe5099b          	addiw	s3,a0,-2
    802055d0:	0127c503          	lbu	a0,18(a5)
    802055d4:	02a989bb          	mulw	s3,s3,a0
    802055d8:	4388                	lw	a0,0(a5)
    802055da:	00a989bb          	addw	s3,s3,a0
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    802055de:	034757bb          	divuw	a5,a4,s4
    802055e2:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    802055e6:	03477a3b          	remuw	s4,a4,s4
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802055ea:	0e0b8363          	beqz	s7,802056d0 <rw_clus+0x14a>
    802055ee:	4901                	li	s2,0
        m = BSIZE - off % BSIZE;
    802055f0:	20000d93          	li	s11,512
        if (bad == -1) {
    802055f4:	5cfd                	li	s9,-1
    802055f6:	a095                	j	8020565a <rw_clus+0xd4>
        panic("offset out of range");
    802055f8:	00004517          	auipc	a0,0x4
    802055fc:	5b850513          	addi	a0,a0,1464 # 80209bb0 <etext+0xbb0>
    80205600:	ffffb097          	auipc	ra,0xffffb
    80205604:	b46080e7          	jalr	-1210(ra) # 80200146 <panic>
                bwrite(bp);
    80205608:	8556                	mv	a0,s5
    8020560a:	ffffe097          	auipc	ra,0xffffe
    8020560e:	ff0080e7          	jalr	-16(ra) # 802035fa <bwrite>
        brelse(bp);
    80205612:	8556                	mv	a0,s5
    80205614:	ffffe097          	auipc	ra,0xffffe
    80205618:	022080e7          	jalr	34(ra) # 80203636 <brelse>
        if (bad == -1) {
    8020561c:	a02d                	j	80205646 <rw_clus+0xc0>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    8020561e:	058a8613          	addi	a2,s5,88 # 10000058 <BASE_ADDRESS-0x701fffa8>
    80205622:	1682                	slli	a3,a3,0x20
    80205624:	9281                	srli	a3,a3,0x20
    80205626:	963a                	add	a2,a2,a4
    80205628:	85da                	mv	a1,s6
    8020562a:	f8843503          	ld	a0,-120(s0)
    8020562e:	ffffd097          	auipc	ra,0xffffd
    80205632:	fe0080e7          	jalr	-32(ra) # 8020260e <either_copyout>
    80205636:	8c2a                	mv	s8,a0
        brelse(bp);
    80205638:	8556                	mv	a0,s5
    8020563a:	ffffe097          	auipc	ra,0xffffe
    8020563e:	ffc080e7          	jalr	-4(ra) # 80203636 <brelse>
        if (bad == -1) {
    80205642:	079c0763          	beq	s8,s9,802056b0 <rw_clus+0x12a>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205646:	0124893b          	addw	s2,s1,s2
    8020564a:	01448a3b          	addw	s4,s1,s4
    8020564e:	1482                	slli	s1,s1,0x20
    80205650:	9081                	srli	s1,s1,0x20
    80205652:	9b26                	add	s6,s6,s1
    80205654:	2985                	addiw	s3,s3,1
    80205656:	05797d63          	bleu	s7,s2,802056b0 <rw_clus+0x12a>
        bp = bread(0, sec);
    8020565a:	85ce                	mv	a1,s3
    8020565c:	4501                	li	a0,0
    8020565e:	ffffe097          	auipc	ra,0xffffe
    80205662:	e9a080e7          	jalr	-358(ra) # 802034f8 <bread>
    80205666:	8aaa                	mv	s5,a0
        m = BSIZE - off % BSIZE;
    80205668:	1ffa7713          	andi	a4,s4,511
    8020566c:	40ed863b          	subw	a2,s11,a4
        if (n - tot < m) {
    80205670:	412b87bb          	subw	a5,s7,s2
    80205674:	86be                	mv	a3,a5
    80205676:	2781                	sext.w	a5,a5
    80205678:	0006059b          	sext.w	a1,a2
    8020567c:	00f5f363          	bleu	a5,a1,80205682 <rw_clus+0xfc>
    80205680:	86b2                	mv	a3,a2
    80205682:	0006849b          	sext.w	s1,a3
        if (write) {
    80205686:	f80d0ce3          	beqz	s10,8020561e <rw_clus+0x98>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    8020568a:	058a8513          	addi	a0,s5,88
    8020568e:	1682                	slli	a3,a3,0x20
    80205690:	9281                	srli	a3,a3,0x20
    80205692:	865a                	mv	a2,s6
    80205694:	f8843583          	ld	a1,-120(s0)
    80205698:	953a                	add	a0,a0,a4
    8020569a:	ffffd097          	auipc	ra,0xffffd
    8020569e:	faa080e7          	jalr	-86(ra) # 80202644 <either_copyin>
    802056a2:	f79513e3          	bne	a0,s9,80205608 <rw_clus+0x82>
        brelse(bp);
    802056a6:	8556                	mv	a0,s5
    802056a8:	ffffe097          	auipc	ra,0xffffe
    802056ac:	f8e080e7          	jalr	-114(ra) # 80203636 <brelse>
}
    802056b0:	854a                	mv	a0,s2
    802056b2:	70e6                	ld	ra,120(sp)
    802056b4:	7446                	ld	s0,112(sp)
    802056b6:	74a6                	ld	s1,104(sp)
    802056b8:	7906                	ld	s2,96(sp)
    802056ba:	69e6                	ld	s3,88(sp)
    802056bc:	6a46                	ld	s4,80(sp)
    802056be:	6aa6                	ld	s5,72(sp)
    802056c0:	6b06                	ld	s6,64(sp)
    802056c2:	7be2                	ld	s7,56(sp)
    802056c4:	7c42                	ld	s8,48(sp)
    802056c6:	7ca2                	ld	s9,40(sp)
    802056c8:	7d02                	ld	s10,32(sp)
    802056ca:	6de2                	ld	s11,24(sp)
    802056cc:	6109                	addi	sp,sp,128
    802056ce:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802056d0:	895e                	mv	s2,s7
    802056d2:	bff9                	j	802056b0 <rw_clus+0x12a>

00000000802056d4 <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    802056d4:	7139                	addi	sp,sp,-64
    802056d6:	fc06                	sd	ra,56(sp)
    802056d8:	f822                	sd	s0,48(sp)
    802056da:	f426                	sd	s1,40(sp)
    802056dc:	f04a                	sd	s2,32(sp)
    802056de:	ec4e                	sd	s3,24(sp)
    802056e0:	e852                	sd	s4,16(sp)
    802056e2:	e456                	sd	s5,8(sp)
    802056e4:	0080                	addi	s0,sp,64
    802056e6:	8a2a                	mv	s4,a0
    802056e8:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    802056ea:	00018517          	auipc	a0,0x18
    802056ee:	05e50513          	addi	a0,a0,94 # 8021d748 <ecache>
    802056f2:	ffffb097          	auipc	ra,0xffffb
    802056f6:	fe6080e7          	jalr	-26(ra) # 802006d8 <acquire>
    if (name) {
    802056fa:	060a8d63          	beqz	s5,80205774 <eget+0xa0>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802056fe:	00018797          	auipc	a5,0x18
    80205702:	eba78793          	addi	a5,a5,-326 # 8021d5b8 <fat>
    80205706:	1507b483          	ld	s1,336(a5)
    8020570a:	00018797          	auipc	a5,0x18
    8020570e:	ed678793          	addi	a5,a5,-298 # 8021d5e0 <root>
    80205712:	06f48163          	beq	s1,a5,80205774 <eget+0xa0>
            if (ep->valid == 1 && ep->parent == parent
    80205716:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    80205718:	89be                	mv	s3,a5
    8020571a:	a029                	j	80205724 <eget+0x50>
    8020571c:	1284b483          	ld	s1,296(s1)
    80205720:	05348a63          	beq	s1,s3,80205774 <eget+0xa0>
            if (ep->valid == 1 && ep->parent == parent
    80205724:	11649783          	lh	a5,278(s1)
    80205728:	ff279ae3          	bne	a5,s2,8020571c <eget+0x48>
    8020572c:	1204b783          	ld	a5,288(s1)
    80205730:	ff4796e3          	bne	a5,s4,8020571c <eget+0x48>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    80205734:	0ff00613          	li	a2,255
    80205738:	85d6                	mv	a1,s5
    8020573a:	8526                	mv	a0,s1
    8020573c:	ffffb097          	auipc	ra,0xffffb
    80205740:	120080e7          	jalr	288(ra) # 8020085c <strncmp>
    80205744:	fd61                	bnez	a0,8020571c <eget+0x48>
                if (ep->ref++ == 0) {
    80205746:	1184a783          	lw	a5,280(s1)
    8020574a:	0017871b          	addiw	a4,a5,1
    8020574e:	10e4ac23          	sw	a4,280(s1)
    80205752:	eb81                	bnez	a5,80205762 <eget+0x8e>
                    ep->parent->ref++;
    80205754:	1204b703          	ld	a4,288(s1)
    80205758:	11872783          	lw	a5,280(a4)
    8020575c:	2785                	addiw	a5,a5,1
    8020575e:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80205762:	00018517          	auipc	a0,0x18
    80205766:	fe650513          	addi	a0,a0,-26 # 8021d748 <ecache>
    8020576a:	ffffb097          	auipc	ra,0xffffb
    8020576e:	fc2080e7          	jalr	-62(ra) # 8020072c <release>
                // edup(ep->parent);
                return ep;
    80205772:	a085                	j	802057d2 <eget+0xfe>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205774:	00018797          	auipc	a5,0x18
    80205778:	e4478793          	addi	a5,a5,-444 # 8021d5b8 <fat>
    8020577c:	1587b483          	ld	s1,344(a5)
    80205780:	00018797          	auipc	a5,0x18
    80205784:	e6078793          	addi	a5,a5,-416 # 8021d5e0 <root>
    80205788:	04f48f63          	beq	s1,a5,802057e6 <eget+0x112>
        if (ep->ref == 0) {
    8020578c:	1184a783          	lw	a5,280(s1)
    80205790:	cf81                	beqz	a5,802057a8 <eget+0xd4>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205792:	00018717          	auipc	a4,0x18
    80205796:	e4e70713          	addi	a4,a4,-434 # 8021d5e0 <root>
    8020579a:	1304b483          	ld	s1,304(s1)
    8020579e:	04e48463          	beq	s1,a4,802057e6 <eget+0x112>
        if (ep->ref == 0) {
    802057a2:	1184a783          	lw	a5,280(s1)
    802057a6:	fbf5                	bnez	a5,8020579a <eget+0xc6>
            ep->ref = 1;
    802057a8:	4785                	li	a5,1
    802057aa:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    802057ae:	114a4783          	lbu	a5,276(s4)
    802057b2:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    802057b6:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    802057ba:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    802057be:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    802057c2:	00018517          	auipc	a0,0x18
    802057c6:	f8650513          	addi	a0,a0,-122 # 8021d748 <ecache>
    802057ca:	ffffb097          	auipc	ra,0xffffb
    802057ce:	f62080e7          	jalr	-158(ra) # 8020072c <release>
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    return 0;
}
    802057d2:	8526                	mv	a0,s1
    802057d4:	70e2                	ld	ra,56(sp)
    802057d6:	7442                	ld	s0,48(sp)
    802057d8:	74a2                	ld	s1,40(sp)
    802057da:	7902                	ld	s2,32(sp)
    802057dc:	69e2                	ld	s3,24(sp)
    802057de:	6a42                	ld	s4,16(sp)
    802057e0:	6aa2                	ld	s5,8(sp)
    802057e2:	6121                	addi	sp,sp,64
    802057e4:	8082                	ret
    panic("eget: insufficient ecache");
    802057e6:	00004517          	auipc	a0,0x4
    802057ea:	3e250513          	addi	a0,a0,994 # 80209bc8 <etext+0xbc8>
    802057ee:	ffffb097          	auipc	ra,0xffffb
    802057f2:	958080e7          	jalr	-1704(ra) # 80200146 <panic>

00000000802057f6 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    802057f6:	7139                	addi	sp,sp,-64
    802057f8:	fc06                	sd	ra,56(sp)
    802057fa:	f822                	sd	s0,48(sp)
    802057fc:	f426                	sd	s1,40(sp)
    802057fe:	f04a                	sd	s2,32(sp)
    80205800:	ec4e                	sd	s3,24(sp)
    80205802:	0080                	addi	s0,sp,64
    80205804:	892a                	mv	s2,a0
    80205806:	84ae                	mv	s1,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    80205808:	00b5c703          	lbu	a4,11(a1)
    8020580c:	47bd                	li	a5,15
    8020580e:	0af70463          	beq	a4,a5,802058b6 <read_entry_name+0xc0>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    80205812:	4635                	li	a2,13
    80205814:	4581                	li	a1,0
    80205816:	ffffb097          	auipc	ra,0xffffb
    8020581a:	f5e080e7          	jalr	-162(ra) # 80200774 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020581e:	0004c703          	lbu	a4,0(s1)
    80205822:	02000793          	li	a5,32
    80205826:	0cf70b63          	beq	a4,a5,802058fc <read_entry_name+0x106>
    8020582a:	4785                	li	a5,1
    8020582c:	02000613          	li	a2,32
    80205830:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    80205832:	00f906b3          	add	a3,s2,a5
    80205836:	fee68fa3          	sb	a4,-1(a3) # 1fff <BASE_ADDRESS-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    8020583a:	0007869b          	sext.w	a3,a5
    8020583e:	00f48733          	add	a4,s1,a5
    80205842:	00074703          	lbu	a4,0(a4)
    80205846:	00c70563          	beq	a4,a2,80205850 <read_entry_name+0x5a>
    8020584a:	0785                	addi	a5,a5,1
    8020584c:	feb793e3          	bne	a5,a1,80205832 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    80205850:	0084c703          	lbu	a4,8(s1)
    80205854:	02000793          	li	a5,32
    80205858:	04f70863          	beq	a4,a5,802058a8 <read_entry_name+0xb2>
            buffer[i++] = '.';
    8020585c:	0016871b          	addiw	a4,a3,1
    80205860:	00d907b3          	add	a5,s2,a3
    80205864:	02e00613          	li	a2,46
    80205868:	00c78023          	sb	a2,0(a5)
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
            if (d->sne.name[j] == ' ') { break; }
    8020586c:	0084c783          	lbu	a5,8(s1)
    80205870:	02000613          	li	a2,32
    80205874:	02c78a63          	beq	a5,a2,802058a8 <read_entry_name+0xb2>
            buffer[i] = d->sne.name[j];
    80205878:	974a                	add	a4,a4,s2
    8020587a:	00f70023          	sb	a5,0(a4)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    8020587e:	0026879b          	addiw	a5,a3,2
            if (d->sne.name[j] == ' ') { break; }
    80205882:	0094c703          	lbu	a4,9(s1)
    80205886:	02000613          	li	a2,32
    8020588a:	00c70f63          	beq	a4,a2,802058a8 <read_entry_name+0xb2>
            buffer[i] = d->sne.name[j];
    8020588e:	97ca                	add	a5,a5,s2
    80205890:	00e78023          	sb	a4,0(a5)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205894:	268d                	addiw	a3,a3,3
            if (d->sne.name[j] == ' ') { break; }
    80205896:	00a4c783          	lbu	a5,10(s1)
    8020589a:	02000713          	li	a4,32
    8020589e:	00e78563          	beq	a5,a4,802058a8 <read_entry_name+0xb2>
            buffer[i] = d->sne.name[j];
    802058a2:	96ca                	add	a3,a3,s2
    802058a4:	00f68023          	sb	a5,0(a3)
        }
    }
}
    802058a8:	70e2                	ld	ra,56(sp)
    802058aa:	7442                	ld	s0,48(sp)
    802058ac:	74a2                	ld	s1,40(sp)
    802058ae:	7902                	ld	s2,32(sp)
    802058b0:	69e2                	ld	s3,24(sp)
    802058b2:	6121                	addi	sp,sp,64
    802058b4:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    802058b6:	4629                	li	a2,10
    802058b8:	0585                	addi	a1,a1,1
    802058ba:	fc040993          	addi	s3,s0,-64
    802058be:	854e                	mv	a0,s3
    802058c0:	ffffb097          	auipc	ra,0xffffb
    802058c4:	f20080e7          	jalr	-224(ra) # 802007e0 <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    802058c8:	4615                	li	a2,5
    802058ca:	85ce                	mv	a1,s3
    802058cc:	854a                	mv	a0,s2
    802058ce:	ffffb097          	auipc	ra,0xffffb
    802058d2:	0bc080e7          	jalr	188(ra) # 8020098a <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    802058d6:	4619                	li	a2,6
    802058d8:	00e48593          	addi	a1,s1,14
    802058dc:	00590513          	addi	a0,s2,5 # 10000005 <BASE_ADDRESS-0x701ffffb>
    802058e0:	ffffb097          	auipc	ra,0xffffb
    802058e4:	0aa080e7          	jalr	170(ra) # 8020098a <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    802058e8:	4609                	li	a2,2
    802058ea:	01c48593          	addi	a1,s1,28
    802058ee:	00b90513          	addi	a0,s2,11
    802058f2:	ffffb097          	auipc	ra,0xffffb
    802058f6:	098080e7          	jalr	152(ra) # 8020098a <snstr>
    802058fa:	b77d                	j	802058a8 <read_entry_name+0xb2>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802058fc:	4681                	li	a3,0
    802058fe:	bf89                	j	80205850 <read_entry_name+0x5a>

0000000080205900 <fat32_init>:
{
    80205900:	7139                	addi	sp,sp,-64
    80205902:	fc06                	sd	ra,56(sp)
    80205904:	f822                	sd	s0,48(sp)
    80205906:	f426                	sd	s1,40(sp)
    80205908:	f04a                	sd	s2,32(sp)
    8020590a:	ec4e                	sd	s3,24(sp)
    8020590c:	e852                	sd	s4,16(sp)
    8020590e:	e456                	sd	s5,8(sp)
    80205910:	0080                	addi	s0,sp,64
    struct buf *b = bread(0, 0);
    80205912:	4581                	li	a1,0
    80205914:	4501                	li	a0,0
    80205916:	ffffe097          	auipc	ra,0xffffe
    8020591a:	be2080e7          	jalr	-1054(ra) # 802034f8 <bread>
    8020591e:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80205920:	4615                	li	a2,5
    80205922:	00004597          	auipc	a1,0x4
    80205926:	2c658593          	addi	a1,a1,710 # 80209be8 <etext+0xbe8>
    8020592a:	0aa50513          	addi	a0,a0,170
    8020592e:	ffffb097          	auipc	ra,0xffffb
    80205932:	f2e080e7          	jalr	-210(ra) # 8020085c <strncmp>
    80205936:	16051863          	bnez	a0,80205aa6 <fat32_init+0x1a6>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    8020593a:	00018497          	auipc	s1,0x18
    8020593e:	c7e48493          	addi	s1,s1,-898 # 8021d5b8 <fat>
    80205942:	4609                	li	a2,2
    80205944:	06390593          	addi	a1,s2,99
    80205948:	00018517          	auipc	a0,0x18
    8020594c:	c8050513          	addi	a0,a0,-896 # 8021d5c8 <fat+0x10>
    80205950:	ffffb097          	auipc	ra,0xffffb
    80205954:	e90080e7          	jalr	-368(ra) # 802007e0 <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    80205958:	06594683          	lbu	a3,101(s2)
    8020595c:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80205960:	06695603          	lhu	a2,102(s2)
    80205964:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    80205968:	06894703          	lbu	a4,104(s2)
    8020596c:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80205970:	07492783          	lw	a5,116(s2)
    80205974:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80205976:	07892783          	lw	a5,120(s2)
    8020597a:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    8020597c:	07c92583          	lw	a1,124(s2)
    80205980:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80205982:	08492503          	lw	a0,132(s2)
    80205986:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80205988:	02b7073b          	mulw	a4,a4,a1
    8020598c:	9f31                	addw	a4,a4,a2
    8020598e:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80205990:	9f99                	subw	a5,a5,a4
    80205992:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80205994:	02d7d7bb          	divuw	a5,a5,a3
    80205998:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    8020599a:	0104d783          	lhu	a5,16(s1)
    8020599e:	02d787bb          	mulw	a5,a5,a3
    802059a2:	c4dc                	sw	a5,12(s1)
    brelse(b);
    802059a4:	854a                	mv	a0,s2
    802059a6:	ffffe097          	auipc	ra,0xffffe
    802059aa:	c90080e7          	jalr	-880(ra) # 80203636 <brelse>
    if (BSIZE != fat.bpb.byts_per_sec) 
    802059ae:	0104d703          	lhu	a4,16(s1)
    802059b2:	20000793          	li	a5,512
    802059b6:	10f71063          	bne	a4,a5,80205ab6 <fat32_init+0x1b6>
    initlock(&ecache.lock, "ecache");
    802059ba:	00004597          	auipc	a1,0x4
    802059be:	26658593          	addi	a1,a1,614 # 80209c20 <etext+0xc20>
    802059c2:	00018517          	auipc	a0,0x18
    802059c6:	d8650513          	addi	a0,a0,-634 # 8021d748 <ecache>
    802059ca:	ffffb097          	auipc	ra,0xffffb
    802059ce:	cca080e7          	jalr	-822(ra) # 80200694 <initlock>
    memset(&root, 0, sizeof(root));
    802059d2:	00018497          	auipc	s1,0x18
    802059d6:	be648493          	addi	s1,s1,-1050 # 8021d5b8 <fat>
    802059da:	00018917          	auipc	s2,0x18
    802059de:	c0690913          	addi	s2,s2,-1018 # 8021d5e0 <root>
    802059e2:	16800613          	li	a2,360
    802059e6:	4581                	li	a1,0
    802059e8:	854a                	mv	a0,s2
    802059ea:	ffffb097          	auipc	ra,0xffffb
    802059ee:	d8a080e7          	jalr	-630(ra) # 80200774 <memset>
    initsleeplock(&root.lock, "entry");
    802059f2:	00004597          	auipc	a1,0x4
    802059f6:	23658593          	addi	a1,a1,566 # 80209c28 <etext+0xc28>
    802059fa:	00018517          	auipc	a0,0x18
    802059fe:	d1e50513          	addi	a0,a0,-738 # 8021d718 <root+0x138>
    80205a02:	ffffe097          	auipc	ra,0xffffe
    80205a06:	d4a080e7          	jalr	-694(ra) # 8020374c <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    80205a0a:	47d1                	li	a5,20
    80205a0c:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80205a10:	50dc                	lw	a5,36(s1)
    80205a12:	12f4aa23          	sw	a5,308(s1)
    80205a16:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    80205a1a:	4785                	li	a5,1
    80205a1c:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80205a20:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80205a24:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205a28:	00018497          	auipc	s1,0x18
    80205a2c:	d3848493          	addi	s1,s1,-712 # 8021d760 <ecache+0x18>
        de->next = root.next;
    80205a30:	00018917          	auipc	s2,0x18
    80205a34:	b8890913          	addi	s2,s2,-1144 # 8021d5b8 <fat>
        de->prev = &root;
    80205a38:	00018a97          	auipc	s5,0x18
    80205a3c:	ba8a8a93          	addi	s5,s5,-1112 # 8021d5e0 <root>
        initsleeplock(&de->lock, "entry");
    80205a40:	00004a17          	auipc	s4,0x4
    80205a44:	1e8a0a13          	addi	s4,s4,488 # 80209c28 <etext+0xc28>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205a48:	0001c997          	auipc	s3,0x1c
    80205a4c:	36898993          	addi	s3,s3,872 # 80221db0 <cons>
        de->dev = 0;
    80205a50:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80205a54:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    80205a58:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80205a5c:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80205a60:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80205a64:	15093783          	ld	a5,336(s2)
    80205a68:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80205a6c:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80205a70:	85d2                	mv	a1,s4
    80205a72:	13848513          	addi	a0,s1,312
    80205a76:	ffffe097          	auipc	ra,0xffffe
    80205a7a:	cd6080e7          	jalr	-810(ra) # 8020374c <initsleeplock>
        root.next->prev = de;
    80205a7e:	15093783          	ld	a5,336(s2)
    80205a82:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80205a86:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205a8a:	16848493          	addi	s1,s1,360
    80205a8e:	fd3491e3          	bne	s1,s3,80205a50 <fat32_init+0x150>
}
    80205a92:	4501                	li	a0,0
    80205a94:	70e2                	ld	ra,56(sp)
    80205a96:	7442                	ld	s0,48(sp)
    80205a98:	74a2                	ld	s1,40(sp)
    80205a9a:	7902                	ld	s2,32(sp)
    80205a9c:	69e2                	ld	s3,24(sp)
    80205a9e:	6a42                	ld	s4,16(sp)
    80205aa0:	6aa2                	ld	s5,8(sp)
    80205aa2:	6121                	addi	sp,sp,64
    80205aa4:	8082                	ret
        panic("not FAT32 volume");
    80205aa6:	00004517          	auipc	a0,0x4
    80205aaa:	14a50513          	addi	a0,a0,330 # 80209bf0 <etext+0xbf0>
    80205aae:	ffffa097          	auipc	ra,0xffffa
    80205ab2:	698080e7          	jalr	1688(ra) # 80200146 <panic>
        panic("byts_per_sec != BSIZE");
    80205ab6:	00004517          	auipc	a0,0x4
    80205aba:	15250513          	addi	a0,a0,338 # 80209c08 <etext+0xc08>
    80205abe:	ffffa097          	auipc	ra,0xffffa
    80205ac2:	688080e7          	jalr	1672(ra) # 80200146 <panic>

0000000080205ac6 <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205ac6:	10852783          	lw	a5,264(a0)
    80205aca:	0ed7e863          	bltu	a5,a3,80205bba <eread+0xf4>
{
    80205ace:	711d                	addi	sp,sp,-96
    80205ad0:	ec86                	sd	ra,88(sp)
    80205ad2:	e8a2                	sd	s0,80(sp)
    80205ad4:	e4a6                	sd	s1,72(sp)
    80205ad6:	e0ca                	sd	s2,64(sp)
    80205ad8:	fc4e                	sd	s3,56(sp)
    80205ada:	f852                	sd	s4,48(sp)
    80205adc:	f456                	sd	s5,40(sp)
    80205ade:	f05a                	sd	s6,32(sp)
    80205ae0:	ec5e                	sd	s7,24(sp)
    80205ae2:	e862                	sd	s8,16(sp)
    80205ae4:	e466                	sd	s9,8(sp)
    80205ae6:	e06a                	sd	s10,0(sp)
    80205ae8:	1080                	addi	s0,sp,96
    80205aea:	8a2a                	mv	s4,a0
    80205aec:	8bae                	mv	s7,a1
    80205aee:	8ab2                	mv	s5,a2
    80205af0:	8936                	mv	s2,a3
    80205af2:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205af4:	9eb9                	addw	a3,a3,a4
        return 0;
    80205af6:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205af8:	0b26e163          	bltu	a3,s2,80205b9a <eread+0xd4>
    80205afc:	100a4703          	lbu	a4,256(s4)
    80205b00:	8b41                	andi	a4,a4,16
    80205b02:	ef41                	bnez	a4,80205b9a <eread+0xd4>
    if (off + n > entry->file_size) {
    80205b04:	00d7f463          	bleu	a3,a5,80205b0c <eread+0x46>
        n = entry->file_size - off;
    80205b08:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205b0c:	10ca2703          	lw	a4,268(s4)
    80205b10:	100007b7          	lui	a5,0x10000
    80205b14:	17dd                	addi	a5,a5,-9
    80205b16:	06e7ef63          	bltu	a5,a4,80205b94 <eread+0xce>
    80205b1a:	080b0e63          	beqz	s6,80205bb6 <eread+0xf0>
    80205b1e:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205b20:	00018c97          	auipc	s9,0x18
    80205b24:	a98c8c93          	addi	s9,s9,-1384 # 8021d5b8 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205b28:	8c3e                	mv	s8,a5
    80205b2a:	a82d                	j	80205b64 <eread+0x9e>
    80205b2c:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80205b30:	87ea                	mv	a5,s10
    80205b32:	86d6                	mv	a3,s5
    80205b34:	865e                	mv	a2,s7
    80205b36:	4581                	li	a1,0
    80205b38:	10ca2503          	lw	a0,268(s4)
    80205b3c:	00000097          	auipc	ra,0x0
    80205b40:	a4a080e7          	jalr	-1462(ra) # 80205586 <rw_clus>
    80205b44:	2501                	sext.w	a0,a0
    80205b46:	05a51863          	bne	a0,s10,80205b96 <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205b4a:	013489bb          	addw	s3,s1,s3
    80205b4e:	0124893b          	addw	s2,s1,s2
    80205b52:	1482                	slli	s1,s1,0x20
    80205b54:	9081                	srli	s1,s1,0x20
    80205b56:	9aa6                	add	s5,s5,s1
    80205b58:	10ca2783          	lw	a5,268(s4)
    80205b5c:	02fc6d63          	bltu	s8,a5,80205b96 <eread+0xd0>
    80205b60:	0369fb63          	bleu	s6,s3,80205b96 <eread+0xd0>
        reloc_clus(entry, off, 0);
    80205b64:	4601                	li	a2,0
    80205b66:	85ca                	mv	a1,s2
    80205b68:	8552                	mv	a0,s4
    80205b6a:	00000097          	auipc	ra,0x0
    80205b6e:	90a080e7          	jalr	-1782(ra) # 80205474 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205b72:	00cca783          	lw	a5,12(s9)
    80205b76:	02f976bb          	remuw	a3,s2,a5
    80205b7a:	0006871b          	sext.w	a4,a3
    80205b7e:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80205b80:	413b06bb          	subw	a3,s6,s3
    80205b84:	84b6                	mv	s1,a3
    80205b86:	2681                	sext.w	a3,a3
    80205b88:	0007861b          	sext.w	a2,a5
    80205b8c:	fad670e3          	bleu	a3,a2,80205b2c <eread+0x66>
    80205b90:	84be                	mv	s1,a5
    80205b92:	bf69                	j	80205b2c <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205b94:	4981                	li	s3,0
    return tot;
    80205b96:	0009851b          	sext.w	a0,s3
}
    80205b9a:	60e6                	ld	ra,88(sp)
    80205b9c:	6446                	ld	s0,80(sp)
    80205b9e:	64a6                	ld	s1,72(sp)
    80205ba0:	6906                	ld	s2,64(sp)
    80205ba2:	79e2                	ld	s3,56(sp)
    80205ba4:	7a42                	ld	s4,48(sp)
    80205ba6:	7aa2                	ld	s5,40(sp)
    80205ba8:	7b02                	ld	s6,32(sp)
    80205baa:	6be2                	ld	s7,24(sp)
    80205bac:	6c42                	ld	s8,16(sp)
    80205bae:	6ca2                	ld	s9,8(sp)
    80205bb0:	6d02                	ld	s10,0(sp)
    80205bb2:	6125                	addi	sp,sp,96
    80205bb4:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205bb6:	89da                	mv	s3,s6
    80205bb8:	bff9                	j	80205b96 <eread+0xd0>
        return 0;
    80205bba:	4501                	li	a0,0
}
    80205bbc:	8082                	ret

0000000080205bbe <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80205bbe:	10852783          	lw	a5,264(a0)
    80205bc2:	0ed7e363          	bltu	a5,a3,80205ca8 <ewrite+0xea>
{
    80205bc6:	711d                	addi	sp,sp,-96
    80205bc8:	ec86                	sd	ra,88(sp)
    80205bca:	e8a2                	sd	s0,80(sp)
    80205bcc:	e4a6                	sd	s1,72(sp)
    80205bce:	e0ca                	sd	s2,64(sp)
    80205bd0:	fc4e                	sd	s3,56(sp)
    80205bd2:	f852                	sd	s4,48(sp)
    80205bd4:	f456                	sd	s5,40(sp)
    80205bd6:	f05a                	sd	s6,32(sp)
    80205bd8:	ec5e                	sd	s7,24(sp)
    80205bda:	e862                	sd	s8,16(sp)
    80205bdc:	e466                	sd	s9,8(sp)
    80205bde:	1080                	addi	s0,sp,96
    80205be0:	8aaa                	mv	s5,a0
    80205be2:	8bae                	mv	s7,a1
    80205be4:	8a32                	mv	s4,a2
    80205be6:	8936                	mv	s2,a3
    80205be8:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80205bea:	00e687bb          	addw	a5,a3,a4
    80205bee:	0ad7ef63          	bltu	a5,a3,80205cac <ewrite+0xee>
    80205bf2:	02069793          	slli	a5,a3,0x20
    80205bf6:	9381                	srli	a5,a5,0x20
    80205bf8:	1702                	slli	a4,a4,0x20
    80205bfa:	9301                	srli	a4,a4,0x20
    80205bfc:	97ba                	add	a5,a5,a4
    80205bfe:	577d                	li	a4,-1
    80205c00:	9301                	srli	a4,a4,0x20
    80205c02:	0af76763          	bltu	a4,a5,80205cb0 <ewrite+0xf2>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80205c06:	10054783          	lbu	a5,256(a0)
    80205c0a:	8b85                	andi	a5,a5,1
    80205c0c:	e7c5                	bnez	a5,80205cb4 <ewrite+0xf6>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80205c0e:	10452783          	lw	a5,260(a0)
    80205c12:	cb91                	beqz	a5,80205c26 <ewrite+0x68>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205c14:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205c16:	00018c17          	auipc	s8,0x18
    80205c1a:	9a2c0c13          	addi	s8,s8,-1630 # 8021d5b8 <fat>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205c1e:	040b1d63          	bnez	s6,80205c78 <ewrite+0xba>
    80205c22:	89da                	mv	s3,s6
    80205c24:	a05d                	j	80205cca <ewrite+0x10c>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80205c26:	11454503          	lbu	a0,276(a0)
    80205c2a:	fffff097          	auipc	ra,0xfffff
    80205c2e:	680080e7          	jalr	1664(ra) # 802052aa <alloc_clus>
    80205c32:	2501                	sext.w	a0,a0
    80205c34:	10aaa223          	sw	a0,260(s5)
    80205c38:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80205c3c:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80205c40:	4785                	li	a5,1
    80205c42:	10fa8aa3          	sb	a5,277(s5)
    80205c46:	b7f9                	j	80205c14 <ewrite+0x56>
    80205c48:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80205c4c:	87e6                	mv	a5,s9
    80205c4e:	86d2                	mv	a3,s4
    80205c50:	865e                	mv	a2,s7
    80205c52:	4585                	li	a1,1
    80205c54:	10caa503          	lw	a0,268(s5)
    80205c58:	00000097          	auipc	ra,0x0
    80205c5c:	92e080e7          	jalr	-1746(ra) # 80205586 <rw_clus>
    80205c60:	2501                	sext.w	a0,a0
    80205c62:	05951b63          	bne	a0,s9,80205cb8 <ewrite+0xfa>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205c66:	013489bb          	addw	s3,s1,s3
    80205c6a:	0124893b          	addw	s2,s1,s2
    80205c6e:	1482                	slli	s1,s1,0x20
    80205c70:	9081                	srli	s1,s1,0x20
    80205c72:	9a26                	add	s4,s4,s1
    80205c74:	0569f263          	bleu	s6,s3,80205cb8 <ewrite+0xfa>
        reloc_clus(entry, off, 1);
    80205c78:	4605                	li	a2,1
    80205c7a:	85ca                	mv	a1,s2
    80205c7c:	8556                	mv	a0,s5
    80205c7e:	fffff097          	auipc	ra,0xfffff
    80205c82:	7f6080e7          	jalr	2038(ra) # 80205474 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205c86:	00cc2783          	lw	a5,12(s8)
    80205c8a:	02f976bb          	remuw	a3,s2,a5
    80205c8e:	0006871b          	sext.w	a4,a3
    80205c92:	9f95                	subw	a5,a5,a3
        if (n - tot < m) {
    80205c94:	413b06bb          	subw	a3,s6,s3
    80205c98:	84b6                	mv	s1,a3
    80205c9a:	2681                	sext.w	a3,a3
    80205c9c:	0007861b          	sext.w	a2,a5
    80205ca0:	fad674e3          	bleu	a3,a2,80205c48 <ewrite+0x8a>
    80205ca4:	84be                	mv	s1,a5
    80205ca6:	b74d                	j	80205c48 <ewrite+0x8a>
        return -1;
    80205ca8:	557d                	li	a0,-1
}
    80205caa:	8082                	ret
        return -1;
    80205cac:	557d                	li	a0,-1
    80205cae:	a005                	j	80205cce <ewrite+0x110>
    80205cb0:	557d                	li	a0,-1
    80205cb2:	a831                	j	80205cce <ewrite+0x110>
    80205cb4:	557d                	li	a0,-1
    80205cb6:	a821                	j	80205cce <ewrite+0x110>
        if(off > entry->file_size) {
    80205cb8:	108aa783          	lw	a5,264(s5)
    80205cbc:	0127f763          	bleu	s2,a5,80205cca <ewrite+0x10c>
            entry->file_size = off;
    80205cc0:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80205cc4:	4785                	li	a5,1
    80205cc6:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80205cca:	0009851b          	sext.w	a0,s3
}
    80205cce:	60e6                	ld	ra,88(sp)
    80205cd0:	6446                	ld	s0,80(sp)
    80205cd2:	64a6                	ld	s1,72(sp)
    80205cd4:	6906                	ld	s2,64(sp)
    80205cd6:	79e2                	ld	s3,56(sp)
    80205cd8:	7a42                	ld	s4,48(sp)
    80205cda:	7aa2                	ld	s5,40(sp)
    80205cdc:	7b02                	ld	s6,32(sp)
    80205cde:	6be2                	ld	s7,24(sp)
    80205ce0:	6c42                	ld	s8,16(sp)
    80205ce2:	6ca2                	ld	s9,8(sp)
    80205ce4:	6125                	addi	sp,sp,96
    80205ce6:	8082                	ret

0000000080205ce8 <formatname>:
{
    80205ce8:	7179                	addi	sp,sp,-48
    80205cea:	f406                	sd	ra,40(sp)
    80205cec:	f022                	sd	s0,32(sp)
    80205cee:	ec26                	sd	s1,24(sp)
    80205cf0:	e84a                	sd	s2,16(sp)
    80205cf2:	e44e                	sd	s3,8(sp)
    80205cf4:	e052                	sd	s4,0(sp)
    80205cf6:	1800                	addi	s0,sp,48
    80205cf8:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80205cfa:	02000793          	li	a5,32
    80205cfe:	02e00713          	li	a4,46
    80205d02:	a011                	j	80205d06 <formatname+0x1e>
    80205d04:	0485                	addi	s1,s1,1
    80205d06:	0004c583          	lbu	a1,0(s1)
    80205d0a:	fef58de3          	beq	a1,a5,80205d04 <formatname+0x1c>
    80205d0e:	fee58be3          	beq	a1,a4,80205d04 <formatname+0x1c>
    for (p = name; *p; p++) {
    80205d12:	c5b9                	beqz	a1,80205d60 <formatname+0x78>
        if (c < 0x20 || strchr(illegal, c)) {
    80205d14:	47fd                	li	a5,31
    80205d16:	04b7f763          	bleu	a1,a5,80205d64 <formatname+0x7c>
    80205d1a:	8926                	mv	s2,s1
    80205d1c:	00004997          	auipc	s3,0x4
    80205d20:	50498993          	addi	s3,s3,1284 # 8020a220 <illegal.1659>
    80205d24:	4a7d                	li	s4,31
    80205d26:	854e                	mv	a0,s3
    80205d28:	ffffb097          	auipc	ra,0xffffb
    80205d2c:	ce0080e7          	jalr	-800(ra) # 80200a08 <strchr>
    80205d30:	ed05                	bnez	a0,80205d68 <formatname+0x80>
    for (p = name; *p; p++) {
    80205d32:	0905                	addi	s2,s2,1
    80205d34:	00094583          	lbu	a1,0(s2)
    80205d38:	c581                	beqz	a1,80205d40 <formatname+0x58>
        if (c < 0x20 || strchr(illegal, c)) {
    80205d3a:	feba66e3          	bltu	s4,a1,80205d26 <formatname+0x3e>
    80205d3e:	a035                	j	80205d6a <formatname+0x82>
        if (*p != ' ') {
    80205d40:	02000693          	li	a3,32
    80205d44:	874a                	mv	a4,s2
    while (p-- > name) {
    80205d46:	0124fb63          	bleu	s2,s1,80205d5c <formatname+0x74>
        if (*p != ' ') {
    80205d4a:	197d                	addi	s2,s2,-1
    80205d4c:	00094783          	lbu	a5,0(s2)
    80205d50:	fed78ae3          	beq	a5,a3,80205d44 <formatname+0x5c>
            p[1] = '\0';
    80205d54:	00070023          	sb	zero,0(a4)
            break;
    80205d58:	8526                	mv	a0,s1
    80205d5a:	a801                	j	80205d6a <formatname+0x82>
    80205d5c:	8526                	mv	a0,s1
    80205d5e:	a031                	j	80205d6a <formatname+0x82>
    for (p = name; *p; p++) {
    80205d60:	8526                	mv	a0,s1
    80205d62:	a021                	j	80205d6a <formatname+0x82>
            return 0;
    80205d64:	4501                	li	a0,0
    80205d66:	a011                	j	80205d6a <formatname+0x82>
    80205d68:	4501                	li	a0,0
}
    80205d6a:	70a2                	ld	ra,40(sp)
    80205d6c:	7402                	ld	s0,32(sp)
    80205d6e:	64e2                	ld	s1,24(sp)
    80205d70:	6942                	ld	s2,16(sp)
    80205d72:	69a2                	ld	s3,8(sp)
    80205d74:	6a02                	ld	s4,0(sp)
    80205d76:	6145                	addi	sp,sp,48
    80205d78:	8082                	ret

0000000080205d7a <cal_checksum>:
{
    80205d7a:	1141                	addi	sp,sp,-16
    80205d7c:	e422                	sd	s0,8(sp)
    80205d7e:	0800                	addi	s0,sp,16
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205d80:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80205d84:	4781                	li	a5,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80205d86:	0077971b          	slliw	a4,a5,0x7
    80205d8a:	0505                	addi	a0,a0,1
    80205d8c:	0017d79b          	srliw	a5,a5,0x1
    80205d90:	fff54683          	lbu	a3,-1(a0)
    80205d94:	9fb5                	addw	a5,a5,a3
    80205d96:	97ba                	add	a5,a5,a4
    80205d98:	0ff7f793          	andi	a5,a5,255
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205d9c:	fea615e3          	bne	a2,a0,80205d86 <cal_checksum+0xc>
}
    80205da0:	853e                	mv	a0,a5
    80205da2:	6422                	ld	s0,8(sp)
    80205da4:	0141                	addi	sp,sp,16
    80205da6:	8082                	ret

0000000080205da8 <emake>:
{
    80205da8:	7131                	addi	sp,sp,-192
    80205daa:	fd06                	sd	ra,184(sp)
    80205dac:	f922                	sd	s0,176(sp)
    80205dae:	f526                	sd	s1,168(sp)
    80205db0:	f14a                	sd	s2,160(sp)
    80205db2:	ed4e                	sd	s3,152(sp)
    80205db4:	e952                	sd	s4,144(sp)
    80205db6:	e556                	sd	s5,136(sp)
    80205db8:	e15a                	sd	s6,128(sp)
    80205dba:	fcde                	sd	s7,120(sp)
    80205dbc:	f8e2                	sd	s8,112(sp)
    80205dbe:	f4e6                	sd	s9,104(sp)
    80205dc0:	f0ea                	sd	s10,96(sp)
    80205dc2:	ecee                	sd	s11,88(sp)
    80205dc4:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80205dc6:	10054783          	lbu	a5,256(a0)
    80205dca:	8bc1                	andi	a5,a5,16
    80205dcc:	c3d5                	beqz	a5,80205e70 <emake+0xc8>
    80205dce:	89aa                	mv	s3,a0
    80205dd0:	8aae                	mv	s5,a1
    80205dd2:	8932                	mv	s2,a2
    if (off % sizeof(union dentry))
    80205dd4:	01f67793          	andi	a5,a2,31
    80205dd8:	e7c5                	bnez	a5,80205e80 <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80205dda:	02000613          	li	a2,32
    80205dde:	4581                	li	a1,0
    80205de0:	f7040513          	addi	a0,s0,-144
    80205de4:	ffffb097          	auipc	ra,0xffffb
    80205de8:	990080e7          	jalr	-1648(ra) # 80200774 <memset>
    if (off <= 32) {
    80205dec:	02000793          	li	a5,32
    80205df0:	0b27ec63          	bltu	a5,s2,80205ea8 <emake+0x100>
        if (off == 0) {
    80205df4:	08091e63          	bnez	s2,80205e90 <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80205df8:	462d                	li	a2,11
    80205dfa:	00004597          	auipc	a1,0x4
    80205dfe:	e5e58593          	addi	a1,a1,-418 # 80209c58 <etext+0xc58>
    80205e02:	f7040513          	addi	a0,s0,-144
    80205e06:	ffffb097          	auipc	ra,0xffffb
    80205e0a:	aa6080e7          	jalr	-1370(ra) # 802008ac <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    80205e0e:	47c1                	li	a5,16
    80205e10:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80205e14:	104aa783          	lw	a5,260(s5)
    80205e18:	0107d71b          	srliw	a4,a5,0x10
    80205e1c:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80205e20:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80205e24:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80205e28:	4605                	li	a2,1
    80205e2a:	85ca                	mv	a1,s2
    80205e2c:	854e                	mv	a0,s3
    80205e2e:	fffff097          	auipc	ra,0xfffff
    80205e32:	646080e7          	jalr	1606(ra) # 80205474 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80205e36:	02000793          	li	a5,32
    80205e3a:	0005071b          	sext.w	a4,a0
    80205e3e:	f7040693          	addi	a3,s0,-144
    80205e42:	4601                	li	a2,0
    80205e44:	4585                	li	a1,1
    80205e46:	10c9a503          	lw	a0,268(s3)
    80205e4a:	fffff097          	auipc	ra,0xfffff
    80205e4e:	73c080e7          	jalr	1852(ra) # 80205586 <rw_clus>
}
    80205e52:	70ea                	ld	ra,184(sp)
    80205e54:	744a                	ld	s0,176(sp)
    80205e56:	74aa                	ld	s1,168(sp)
    80205e58:	790a                	ld	s2,160(sp)
    80205e5a:	69ea                	ld	s3,152(sp)
    80205e5c:	6a4a                	ld	s4,144(sp)
    80205e5e:	6aaa                	ld	s5,136(sp)
    80205e60:	6b0a                	ld	s6,128(sp)
    80205e62:	7be6                	ld	s7,120(sp)
    80205e64:	7c46                	ld	s8,112(sp)
    80205e66:	7ca6                	ld	s9,104(sp)
    80205e68:	7d06                	ld	s10,96(sp)
    80205e6a:	6de6                	ld	s11,88(sp)
    80205e6c:	6129                	addi	sp,sp,192
    80205e6e:	8082                	ret
        panic("emake: not dir");
    80205e70:	00004517          	auipc	a0,0x4
    80205e74:	dc050513          	addi	a0,a0,-576 # 80209c30 <etext+0xc30>
    80205e78:	ffffa097          	auipc	ra,0xffffa
    80205e7c:	2ce080e7          	jalr	718(ra) # 80200146 <panic>
        panic("emake: not aligned");
    80205e80:	00004517          	auipc	a0,0x4
    80205e84:	dc050513          	addi	a0,a0,-576 # 80209c40 <etext+0xc40>
    80205e88:	ffffa097          	auipc	ra,0xffffa
    80205e8c:	2be080e7          	jalr	702(ra) # 80200146 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80205e90:	462d                	li	a2,11
    80205e92:	00004597          	auipc	a1,0x4
    80205e96:	dd658593          	addi	a1,a1,-554 # 80209c68 <etext+0xc68>
    80205e9a:	f7040513          	addi	a0,s0,-144
    80205e9e:	ffffb097          	auipc	ra,0xffffb
    80205ea2:	a0e080e7          	jalr	-1522(ra) # 802008ac <strncpy>
    80205ea6:	b7a5                	j	80205e0e <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    80205ea8:	8cd6                	mv	s9,s5
    80205eaa:	8556                	mv	a0,s5
    80205eac:	ffffb097          	auipc	ra,0xffffb
    80205eb0:	a72080e7          	jalr	-1422(ra) # 8020091e <strlen>
    80205eb4:	f4a43c23          	sd	a0,-168(s0)
    80205eb8:	00c5071b          	addiw	a4,a0,12
    80205ebc:	47b5                	li	a5,13
    80205ebe:	02f747bb          	divw	a5,a4,a5
    80205ec2:	f4f42a23          	sw	a5,-172(s0)
    80205ec6:	00078b1b          	sext.w	s6,a5
        memset(shortname, 0, sizeof(shortname));
    80205eca:	4631                	li	a2,12
    80205ecc:	4581                	li	a1,0
    80205ece:	f6040513          	addi	a0,s0,-160
    80205ed2:	ffffb097          	auipc	ra,0xffffb
    80205ed6:	8a2080e7          	jalr	-1886(ra) # 80200774 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80205eda:	8556                	mv	a0,s5
    80205edc:	ffffb097          	auipc	ra,0xffffb
    80205ee0:	a42080e7          	jalr	-1470(ra) # 8020091e <strlen>
    80205ee4:	fff5079b          	addiw	a5,a0,-1
    80205ee8:	0207cf63          	bltz	a5,80205f26 <emake+0x17e>
        if (name[j] == '.') {
    80205eec:	00fa8733          	add	a4,s5,a5
    80205ef0:	00074603          	lbu	a2,0(a4)
    80205ef4:	02e00693          	li	a3,46
    80205ef8:	04d60763          	beq	a2,a3,80205f46 <emake+0x19e>
    80205efc:	17fd                	addi	a5,a5,-1
    80205efe:	97d6                	add	a5,a5,s5
    80205f00:	ffea8693          	addi	a3,s5,-2
    80205f04:	96aa                	add	a3,a3,a0
    80205f06:	fff5071b          	addiw	a4,a0,-1
    80205f0a:	1702                	slli	a4,a4,0x20
    80205f0c:	9301                	srli	a4,a4,0x20
    80205f0e:	8e99                	sub	a3,a3,a4
    80205f10:	02e00613          	li	a2,46
    for (int j = strlen(name) - 1; j >= 0; j--) {
    80205f14:	00d78963          	beq	a5,a3,80205f26 <emake+0x17e>
        if (name[j] == '.') {
    80205f18:	85be                	mv	a1,a5
    80205f1a:	17fd                	addi	a5,a5,-1
    80205f1c:	0017c703          	lbu	a4,1(a5) # 10000001 <BASE_ADDRESS-0x701fffff>
    80205f20:	fec71ae3          	bne	a4,a2,80205f14 <emake+0x16c>
    80205f24:	8cae                	mv	s9,a1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205f26:	001a8b93          	addi	s7,s5,1
    80205f2a:	000aca03          	lbu	s4,0(s5)
    80205f2e:	4481                	li	s1,0
    80205f30:	000a0d63          	beqz	s4,80205f4a <emake+0x1a2>
        if (i == 8 && p) {
    80205f34:	4c21                	li	s8,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205f36:	4d29                	li	s10,10
        if (c == '.') {
    80205f38:	02e00d93          	li	s11,46
                memset(shortname + i, ' ', 8 - i);
    80205f3c:	f6040793          	addi	a5,s0,-160
    80205f40:	f4f43423          	sd	a5,-184(s0)
    80205f44:	a8e1                	j	8020601c <emake+0x274>
        if (name[j] == '.') {
    80205f46:	8cba                	mv	s9,a4
    80205f48:	bff9                	j	80205f26 <emake+0x17e>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205f4a:	4481                	li	s1,0
    80205f4c:	a039                	j	80205f5a <emake+0x1b2>
        if (i == 8 && p) {
    80205f4e:	1e0c8e63          	beqz	s9,8020614a <emake+0x3a2>
            if (p + 1 < name) { break; }            // no '.'
    80205f52:	001c8793          	addi	a5,s9,1
    80205f56:	0977f563          	bleu	s7,a5,80205fe0 <emake+0x238>
    while (i < CHAR_SHORT_NAME) {
    80205f5a:	f6040793          	addi	a5,s0,-160
    80205f5e:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    80205f60:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    80205f64:	4729                	li	a4,10
        shortname[i++] = ' ';
    80205f66:	2485                	addiw	s1,s1,1
    80205f68:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80205f6c:	0785                	addi	a5,a5,1
    80205f6e:	fe975ce3          	ble	s1,a4,80205f66 <emake+0x1be>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    80205f72:	f6040513          	addi	a0,s0,-160
    80205f76:	00000097          	auipc	ra,0x0
    80205f7a:	e04080e7          	jalr	-508(ra) # 80205d7a <cal_checksum>
    80205f7e:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    80205f82:	47bd                	li	a5,15
    80205f84:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80205f88:	f5843783          	ld	a5,-168(s0)
    80205f8c:	0cf05b63          	blez	a5,80206062 <emake+0x2ba>
    80205f90:	f5442783          	lw	a5,-172(s0)
    80205f94:	37fd                	addiw	a5,a5,-1
    80205f96:	00179d1b          	slliw	s10,a5,0x1
    80205f9a:	00fd0d3b          	addw	s10,s10,a5
    80205f9e:	002d1d1b          	slliw	s10,s10,0x2
    80205fa2:	00fd0d3b          	addw	s10,s10,a5
    80205fa6:	9d56                	add	s10,s10,s5
    80205fa8:	8c5a                	mv	s8,s6
            int end = 0;
    80205faa:	4d81                	li	s11,0
            uint8 *w = (uint8 *)de.lne.name1;
    80205fac:	f7140793          	addi	a5,s0,-143
    80205fb0:	f4f43c23          	sd	a5,-168(s0)
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80205fb4:	5a7d                	li	s4,-1
                switch (j) {
    80205fb6:	44ad                	li	s1,11
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80205fb8:	f7e40c93          	addi	s9,s0,-130
                    case 11:    w = (uint8 *)de.lne.name3; break;
    80205fbc:	f8c40b93          	addi	s7,s0,-116
    80205fc0:	a2b5                	j	8020612c <emake+0x384>
            if (name > p) {                    // last '.'
    80205fc2:	057cf463          	bleu	s7,s9,8020600a <emake+0x262>
                memset(shortname + i, ' ', 8 - i);
    80205fc6:	4621                	li	a2,8
    80205fc8:	9e05                	subw	a2,a2,s1
    80205fca:	02000593          	li	a1,32
    80205fce:	f4843783          	ld	a5,-184(s0)
    80205fd2:	00978533          	add	a0,a5,s1
    80205fd6:	ffffa097          	auipc	ra,0xffffa
    80205fda:	79e080e7          	jalr	1950(ra) # 80200774 <memset>
    80205fde:	87de                	mv	a5,s7
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80205fe0:	84e2                	mv	s1,s8
    80205fe2:	4c81                	li	s9,0
    80205fe4:	a035                	j	80206010 <emake+0x268>
            if (strchr(illegal, c) != NULL) {
    80205fe6:	85d2                	mv	a1,s4
    80205fe8:	00004517          	auipc	a0,0x4
    80205fec:	24850513          	addi	a0,a0,584 # 8020a230 <illegal.1675>
    80205ff0:	ffffb097          	auipc	ra,0xffffb
    80205ff4:	a18080e7          	jalr	-1512(ra) # 80200a08 <strchr>
    80205ff8:	c119                	beqz	a0,80205ffe <emake+0x256>
                c = '_';
    80205ffa:	05f00a13          	li	s4,95
        shortname[i++] = c;
    80205ffe:	f9040793          	addi	a5,s0,-112
    80206002:	97a6                	add	a5,a5,s1
    80206004:	fd478823          	sb	s4,-48(a5)
    80206008:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    8020600a:	f69d44e3          	blt	s10,s1,80205f72 <emake+0x1ca>
    8020600e:	87de                	mv	a5,s7
    80206010:	00178b93          	addi	s7,a5,1
    80206014:	0007ca03          	lbu	s4,0(a5)
    80206018:	f40a01e3          	beqz	s4,80205f5a <emake+0x1b2>
        if (i == 8 && p) {
    8020601c:	f38489e3          	beq	s1,s8,80205f4e <emake+0x1a6>
        if (c == ' ') { continue; }
    80206020:	02000793          	li	a5,32
    80206024:	fefa03e3          	beq	s4,a5,8020600a <emake+0x262>
        if (c == '.') {
    80206028:	f9ba0de3          	beq	s4,s11,80205fc2 <emake+0x21a>
        if (c >= 'a' && c <= 'z') {
    8020602c:	f9fa079b          	addiw	a5,s4,-97
    80206030:	0ff7f793          	andi	a5,a5,255
    80206034:	4765                	li	a4,25
    80206036:	faf768e3          	bltu	a4,a5,80205fe6 <emake+0x23e>
            c += 'A' - 'a';
    8020603a:	3a01                	addiw	s4,s4,-32
    8020603c:	0ffa7a13          	andi	s4,s4,255
    80206040:	bf7d                	j	80205ffe <emake+0x256>
                de.lne.order |= LAST_LONG_ENTRY;
    80206042:	0407e793          	ori	a5,a5,64
    80206046:	f6f40823          	sb	a5,-144(s0)
    8020604a:	a0fd                	j	80206138 <emake+0x390>
                    if ((*w++ = *p++) == 0) {
    8020604c:	0005c683          	lbu	a3,0(a1)
    80206050:	00d78023          	sb	a3,0(a5)
                        end = 1;
    80206054:	0016b693          	seqz	a3,a3
                    *w++ = 0;
    80206058:	000780a3          	sb	zero,1(a5)
    8020605c:	0789                	addi	a5,a5,2
                    if ((*w++ = *p++) == 0) {
    8020605e:	0585                	addi	a1,a1,1
    80206060:	a061                	j	802060e8 <emake+0x340>
        memset(&de, 0, sizeof(de));
    80206062:	02000613          	li	a2,32
    80206066:	4581                	li	a1,0
    80206068:	f7040493          	addi	s1,s0,-144
    8020606c:	8526                	mv	a0,s1
    8020606e:	ffffa097          	auipc	ra,0xffffa
    80206072:	706080e7          	jalr	1798(ra) # 80200774 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    80206076:	462d                	li	a2,11
    80206078:	f6040593          	addi	a1,s0,-160
    8020607c:	8526                	mv	a0,s1
    8020607e:	ffffb097          	auipc	ra,0xffffb
    80206082:	82e080e7          	jalr	-2002(ra) # 802008ac <strncpy>
        de.sne.attr = ep->attribute;
    80206086:	100ac783          	lbu	a5,256(s5)
    8020608a:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    8020608e:	104aa783          	lw	a5,260(s5)
    80206092:	0107d71b          	srliw	a4,a5,0x10
    80206096:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    8020609a:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    8020609e:	108aa783          	lw	a5,264(s5)
    802060a2:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    802060a6:	4605                	li	a2,1
    802060a8:	85ca                	mv	a1,s2
    802060aa:	854e                	mv	a0,s3
    802060ac:	fffff097          	auipc	ra,0xfffff
    802060b0:	3c8080e7          	jalr	968(ra) # 80205474 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    802060b4:	02000793          	li	a5,32
    802060b8:	0005071b          	sext.w	a4,a0
    802060bc:	86a6                	mv	a3,s1
    802060be:	4601                	li	a2,0
    802060c0:	4585                	li	a1,1
    802060c2:	10c9a503          	lw	a0,268(s3)
    802060c6:	fffff097          	auipc	ra,0xfffff
    802060ca:	4c0080e7          	jalr	1216(ra) # 80205586 <rw_clus>
}
    802060ce:	b351                	j	80205e52 <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    802060d0:	87e6                	mv	a5,s9
    802060d2:	a011                	j	802060d6 <emake+0x32e>
                    case 11:    w = (uint8 *)de.lne.name3; break;
    802060d4:	87de                	mv	a5,s7
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802060d6:	2705                	addiw	a4,a4,1
    802060d8:	fff7061b          	addiw	a2,a4,-1
                if (end) {
    802060dc:	daa5                	beqz	a3,8020604c <emake+0x2a4>
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    802060de:	01478023          	sb	s4,0(a5)
                    *w++ = 0xff;
    802060e2:	014780a3          	sb	s4,1(a5)
    802060e6:	0789                	addi	a5,a5,2
                switch (j) {
    802060e8:	fea604e3          	beq	a2,a0,802060d0 <emake+0x328>
    802060ec:	fe9604e3          	beq	a2,s1,802060d4 <emake+0x32c>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802060f0:	0007061b          	sext.w	a2,a4
    802060f4:	fec851e3          	ble	a2,a6,802060d6 <emake+0x32e>
            uint off2 = reloc_clus(dp, off, 1);
    802060f8:	4605                	li	a2,1
    802060fa:	85ca                	mv	a1,s2
    802060fc:	854e                	mv	a0,s3
    802060fe:	fffff097          	auipc	ra,0xfffff
    80206102:	376080e7          	jalr	886(ra) # 80205474 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206106:	02000793          	li	a5,32
    8020610a:	0005071b          	sext.w	a4,a0
    8020610e:	f7040693          	addi	a3,s0,-144
    80206112:	866e                	mv	a2,s11
    80206114:	4585                	li	a1,1
    80206116:	10c9a503          	lw	a0,268(s3)
    8020611a:	fffff097          	auipc	ra,0xfffff
    8020611e:	46c080e7          	jalr	1132(ra) # 80205586 <rw_clus>
            off += sizeof(de);
    80206122:	0209091b          	addiw	s2,s2,32
        for (int i = entcnt; i > 0; i--) {
    80206126:	1d4d                	addi	s10,s10,-13
    80206128:	f3805de3          	blez	s8,80206062 <emake+0x2ba>
            if ((de.lne.order = i) == entcnt) {
    8020612c:	0ffc7793          	andi	a5,s8,255
    80206130:	f0fb09e3          	beq	s6,a5,80206042 <emake+0x29a>
    80206134:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206138:	3c7d                	addiw	s8,s8,-1
    8020613a:	85ea                	mv	a1,s10
    8020613c:	4709                	li	a4,2
            int end = 0;
    8020613e:	86ee                	mv	a3,s11
            uint8 *w = (uint8 *)de.lne.name1;
    80206140:	f5843783          	ld	a5,-168(s0)
                switch (j) {
    80206144:	4515                	li	a0,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206146:	4835                	li	a6,13
    80206148:	bf41                	j	802060d8 <emake+0x330>
        if (c == ' ') { continue; }
    8020614a:	02000793          	li	a5,32
    8020614e:	ecfa1de3          	bne	s4,a5,80206028 <emake+0x280>
    80206152:	87de                	mv	a5,s7
    80206154:	bd75                	j	80206010 <emake+0x268>

0000000080206156 <edup>:
{
    80206156:	1101                	addi	sp,sp,-32
    80206158:	ec06                	sd	ra,24(sp)
    8020615a:	e822                	sd	s0,16(sp)
    8020615c:	e426                	sd	s1,8(sp)
    8020615e:	1000                	addi	s0,sp,32
    80206160:	84aa                	mv	s1,a0
    if (entry != 0) {
    80206162:	c515                	beqz	a0,8020618e <edup+0x38>
        acquire(&ecache.lock);
    80206164:	00017517          	auipc	a0,0x17
    80206168:	5e450513          	addi	a0,a0,1508 # 8021d748 <ecache>
    8020616c:	ffffa097          	auipc	ra,0xffffa
    80206170:	56c080e7          	jalr	1388(ra) # 802006d8 <acquire>
        entry->ref++;
    80206174:	1184a783          	lw	a5,280(s1)
    80206178:	2785                	addiw	a5,a5,1
    8020617a:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020617e:	00017517          	auipc	a0,0x17
    80206182:	5ca50513          	addi	a0,a0,1482 # 8021d748 <ecache>
    80206186:	ffffa097          	auipc	ra,0xffffa
    8020618a:	5a6080e7          	jalr	1446(ra) # 8020072c <release>
}
    8020618e:	8526                	mv	a0,s1
    80206190:	60e2                	ld	ra,24(sp)
    80206192:	6442                	ld	s0,16(sp)
    80206194:	64a2                	ld	s1,8(sp)
    80206196:	6105                	addi	sp,sp,32
    80206198:	8082                	ret

000000008020619a <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    8020619a:	11554783          	lbu	a5,277(a0)
    8020619e:	c791                	beqz	a5,802061aa <eupdate+0x10>
    802061a0:	11651703          	lh	a4,278(a0)
    802061a4:	4785                	li	a5,1
    802061a6:	00f70363          	beq	a4,a5,802061ac <eupdate+0x12>
    802061aa:	8082                	ret
{
    802061ac:	711d                	addi	sp,sp,-96
    802061ae:	ec86                	sd	ra,88(sp)
    802061b0:	e8a2                	sd	s0,80(sp)
    802061b2:	e4a6                	sd	s1,72(sp)
    802061b4:	e0ca                	sd	s2,64(sp)
    802061b6:	fc4e                	sd	s3,56(sp)
    802061b8:	1080                	addi	s0,sp,96
    802061ba:	84aa                	mv	s1,a0
    uint entcnt = 0;
    802061bc:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    802061c0:	4601                	li	a2,0
    802061c2:	11c52583          	lw	a1,284(a0)
    802061c6:	12053503          	ld	a0,288(a0)
    802061ca:	fffff097          	auipc	ra,0xfffff
    802061ce:	2aa080e7          	jalr	682(ra) # 80205474 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    802061d2:	1204b803          	ld	a6,288(s1)
    802061d6:	4785                	li	a5,1
    802061d8:	0005071b          	sext.w	a4,a0
    802061dc:	fcc40693          	addi	a3,s0,-52
    802061e0:	4601                	li	a2,0
    802061e2:	4581                	li	a1,0
    802061e4:	10c82503          	lw	a0,268(a6)
    802061e8:	fffff097          	auipc	ra,0xfffff
    802061ec:	39e080e7          	jalr	926(ra) # 80205586 <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802061f0:	fcc42583          	lw	a1,-52(s0)
    802061f4:	fbf5f593          	andi	a1,a1,-65
    802061f8:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    802061fc:	0055959b          	slliw	a1,a1,0x5
    80206200:	11c4a783          	lw	a5,284(s1)
    80206204:	4601                	li	a2,0
    80206206:	9dbd                	addw	a1,a1,a5
    80206208:	1204b503          	ld	a0,288(s1)
    8020620c:	fffff097          	auipc	ra,0xfffff
    80206210:	268080e7          	jalr	616(ra) # 80205474 <reloc_clus>
    80206214:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206218:	1204b503          	ld	a0,288(s1)
    8020621c:	02000793          	li	a5,32
    80206220:	874e                	mv	a4,s3
    80206222:	fa840913          	addi	s2,s0,-88
    80206226:	86ca                	mv	a3,s2
    80206228:	4601                	li	a2,0
    8020622a:	4581                	li	a1,0
    8020622c:	10c52503          	lw	a0,268(a0)
    80206230:	fffff097          	auipc	ra,0xfffff
    80206234:	356080e7          	jalr	854(ra) # 80205586 <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206238:	1044a783          	lw	a5,260(s1)
    8020623c:	0107d71b          	srliw	a4,a5,0x10
    80206240:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    80206244:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206248:	1084a783          	lw	a5,264(s1)
    8020624c:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206250:	1204b503          	ld	a0,288(s1)
    80206254:	02000793          	li	a5,32
    80206258:	874e                	mv	a4,s3
    8020625a:	86ca                	mv	a3,s2
    8020625c:	4601                	li	a2,0
    8020625e:	4585                	li	a1,1
    80206260:	10c52503          	lw	a0,268(a0)
    80206264:	fffff097          	auipc	ra,0xfffff
    80206268:	322080e7          	jalr	802(ra) # 80205586 <rw_clus>
    entry->dirty = 0;
    8020626c:	10048aa3          	sb	zero,277(s1)
}
    80206270:	60e6                	ld	ra,88(sp)
    80206272:	6446                	ld	s0,80(sp)
    80206274:	64a6                	ld	s1,72(sp)
    80206276:	6906                	ld	s2,64(sp)
    80206278:	79e2                	ld	s3,56(sp)
    8020627a:	6125                	addi	sp,sp,96
    8020627c:	8082                	ret

000000008020627e <eremove>:
    if (entry->valid != 1) { return; }
    8020627e:	11651703          	lh	a4,278(a0)
    80206282:	4785                	li	a5,1
    80206284:	00f70363          	beq	a4,a5,8020628a <eremove+0xc>
    80206288:	8082                	ret
{
    8020628a:	715d                	addi	sp,sp,-80
    8020628c:	e486                	sd	ra,72(sp)
    8020628e:	e0a2                	sd	s0,64(sp)
    80206290:	fc26                	sd	s1,56(sp)
    80206292:	f84a                	sd	s2,48(sp)
    80206294:	f44e                	sd	s3,40(sp)
    80206296:	f052                	sd	s4,32(sp)
    80206298:	ec56                	sd	s5,24(sp)
    8020629a:	0880                	addi	s0,sp,80
    8020629c:	84aa                	mv	s1,a0
    uint entcnt = 0;
    8020629e:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    802062a2:	11c52903          	lw	s2,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    802062a6:	4601                	li	a2,0
    802062a8:	85ca                	mv	a1,s2
    802062aa:	12053503          	ld	a0,288(a0)
    802062ae:	fffff097          	auipc	ra,0xfffff
    802062b2:	1c6080e7          	jalr	454(ra) # 80205474 <reloc_clus>
    802062b6:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    802062ba:	1204b503          	ld	a0,288(s1)
    802062be:	4785                	li	a5,1
    802062c0:	874e                	mv	a4,s3
    802062c2:	fbc40693          	addi	a3,s0,-68
    802062c6:	4601                	li	a2,0
    802062c8:	4581                	li	a1,0
    802062ca:	10c52503          	lw	a0,268(a0)
    802062ce:	fffff097          	auipc	ra,0xfffff
    802062d2:	2b8080e7          	jalr	696(ra) # 80205586 <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802062d6:	fbc42783          	lw	a5,-68(s0)
    802062da:	fbf7f793          	andi	a5,a5,-65
    802062de:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    802062e2:	5795                	li	a5,-27
    802062e4:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    802062e8:	4a01                	li	s4,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    802062ea:	fbb40a93          	addi	s5,s0,-69
    802062ee:	1204b503          	ld	a0,288(s1)
    802062f2:	4785                	li	a5,1
    802062f4:	874e                	mv	a4,s3
    802062f6:	86d6                	mv	a3,s5
    802062f8:	4601                	li	a2,0
    802062fa:	4585                	li	a1,1
    802062fc:	10c52503          	lw	a0,268(a0)
    80206300:	fffff097          	auipc	ra,0xfffff
    80206304:	286080e7          	jalr	646(ra) # 80205586 <rw_clus>
        off += 32;
    80206308:	0209091b          	addiw	s2,s2,32
        off2 = reloc_clus(entry->parent, off, 0);
    8020630c:	4601                	li	a2,0
    8020630e:	85ca                	mv	a1,s2
    80206310:	1204b503          	ld	a0,288(s1)
    80206314:	fffff097          	auipc	ra,0xfffff
    80206318:	160080e7          	jalr	352(ra) # 80205474 <reloc_clus>
    8020631c:	0005099b          	sext.w	s3,a0
    for (int i = 0; i <= entcnt; i++) {
    80206320:	001a079b          	addiw	a5,s4,1
    80206324:	00078a1b          	sext.w	s4,a5
    80206328:	fbc42703          	lw	a4,-68(s0)
    8020632c:	fd4771e3          	bleu	s4,a4,802062ee <eremove+0x70>
    entry->valid = -1;
    80206330:	57fd                	li	a5,-1
    80206332:	10f49b23          	sh	a5,278(s1)
}
    80206336:	60a6                	ld	ra,72(sp)
    80206338:	6406                	ld	s0,64(sp)
    8020633a:	74e2                	ld	s1,56(sp)
    8020633c:	7942                	ld	s2,48(sp)
    8020633e:	79a2                	ld	s3,40(sp)
    80206340:	7a02                	ld	s4,32(sp)
    80206342:	6ae2                	ld	s5,24(sp)
    80206344:	6161                	addi	sp,sp,80
    80206346:	8082                	ret

0000000080206348 <etrunc>:
{
    80206348:	7179                	addi	sp,sp,-48
    8020634a:	f406                	sd	ra,40(sp)
    8020634c:	f022                	sd	s0,32(sp)
    8020634e:	ec26                	sd	s1,24(sp)
    80206350:	e84a                	sd	s2,16(sp)
    80206352:	e44e                	sd	s3,8(sp)
    80206354:	e052                	sd	s4,0(sp)
    80206356:	1800                	addi	s0,sp,48
    80206358:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    8020635a:	10452903          	lw	s2,260(a0)
    8020635e:	ffe9071b          	addiw	a4,s2,-2
    80206362:	100007b7          	lui	a5,0x10000
    80206366:	17d5                	addi	a5,a5,-11
    80206368:	02e7e563          	bltu	a5,a4,80206392 <etrunc+0x4a>
    8020636c:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    8020636e:	854a                	mv	a0,s2
    80206370:	fffff097          	auipc	ra,0xfffff
    80206374:	ec4080e7          	jalr	-316(ra) # 80205234 <read_fat>
    80206378:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    8020637c:	4581                	li	a1,0
    8020637e:	854a                	mv	a0,s2
    80206380:	fffff097          	auipc	ra,0xfffff
    80206384:	072080e7          	jalr	114(ra) # 802053f2 <write_fat>
        clus = next;
    80206388:	0004891b          	sext.w	s2,s1
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    8020638c:	34f9                	addiw	s1,s1,-2
    8020638e:	fe99f0e3          	bleu	s1,s3,8020636e <etrunc+0x26>
    entry->file_size = 0;
    80206392:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    80206396:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    8020639a:	4785                	li	a5,1
    8020639c:	10fa0aa3          	sb	a5,277(s4)
}
    802063a0:	70a2                	ld	ra,40(sp)
    802063a2:	7402                	ld	s0,32(sp)
    802063a4:	64e2                	ld	s1,24(sp)
    802063a6:	6942                	ld	s2,16(sp)
    802063a8:	69a2                	ld	s3,8(sp)
    802063aa:	6a02                	ld	s4,0(sp)
    802063ac:	6145                	addi	sp,sp,48
    802063ae:	8082                	ret

00000000802063b0 <elock>:
{
    802063b0:	1141                	addi	sp,sp,-16
    802063b2:	e406                	sd	ra,8(sp)
    802063b4:	e022                	sd	s0,0(sp)
    802063b6:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    802063b8:	cd19                	beqz	a0,802063d6 <elock+0x26>
    802063ba:	11852783          	lw	a5,280(a0)
    802063be:	00f05c63          	blez	a5,802063d6 <elock+0x26>
    acquiresleep(&entry->lock);
    802063c2:	13850513          	addi	a0,a0,312
    802063c6:	ffffd097          	auipc	ra,0xffffd
    802063ca:	3c0080e7          	jalr	960(ra) # 80203786 <acquiresleep>
}
    802063ce:	60a2                	ld	ra,8(sp)
    802063d0:	6402                	ld	s0,0(sp)
    802063d2:	0141                	addi	sp,sp,16
    802063d4:	8082                	ret
        panic("elock");
    802063d6:	00004517          	auipc	a0,0x4
    802063da:	8a250513          	addi	a0,a0,-1886 # 80209c78 <etext+0xc78>
    802063de:	ffffa097          	auipc	ra,0xffffa
    802063e2:	d68080e7          	jalr	-664(ra) # 80200146 <panic>

00000000802063e6 <eunlock>:
{
    802063e6:	1101                	addi	sp,sp,-32
    802063e8:	ec06                	sd	ra,24(sp)
    802063ea:	e822                	sd	s0,16(sp)
    802063ec:	e426                	sd	s1,8(sp)
    802063ee:	e04a                	sd	s2,0(sp)
    802063f0:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    802063f2:	c90d                	beqz	a0,80206424 <eunlock+0x3e>
    802063f4:	84aa                	mv	s1,a0
    802063f6:	13850913          	addi	s2,a0,312
    802063fa:	854a                	mv	a0,s2
    802063fc:	ffffd097          	auipc	ra,0xffffd
    80206400:	424080e7          	jalr	1060(ra) # 80203820 <holdingsleep>
    80206404:	c105                	beqz	a0,80206424 <eunlock+0x3e>
    80206406:	1184a783          	lw	a5,280(s1)
    8020640a:	00f05d63          	blez	a5,80206424 <eunlock+0x3e>
    releasesleep(&entry->lock);
    8020640e:	854a                	mv	a0,s2
    80206410:	ffffd097          	auipc	ra,0xffffd
    80206414:	3cc080e7          	jalr	972(ra) # 802037dc <releasesleep>
}
    80206418:	60e2                	ld	ra,24(sp)
    8020641a:	6442                	ld	s0,16(sp)
    8020641c:	64a2                	ld	s1,8(sp)
    8020641e:	6902                	ld	s2,0(sp)
    80206420:	6105                	addi	sp,sp,32
    80206422:	8082                	ret
        panic("eunlock");
    80206424:	00004517          	auipc	a0,0x4
    80206428:	85c50513          	addi	a0,a0,-1956 # 80209c80 <etext+0xc80>
    8020642c:	ffffa097          	auipc	ra,0xffffa
    80206430:	d1a080e7          	jalr	-742(ra) # 80200146 <panic>

0000000080206434 <eput>:
{
    80206434:	1101                	addi	sp,sp,-32
    80206436:	ec06                	sd	ra,24(sp)
    80206438:	e822                	sd	s0,16(sp)
    8020643a:	e426                	sd	s1,8(sp)
    8020643c:	e04a                	sd	s2,0(sp)
    8020643e:	1000                	addi	s0,sp,32
    80206440:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206442:	00017517          	auipc	a0,0x17
    80206446:	30650513          	addi	a0,a0,774 # 8021d748 <ecache>
    8020644a:	ffffa097          	auipc	ra,0xffffa
    8020644e:	28e080e7          	jalr	654(ra) # 802006d8 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206452:	00017797          	auipc	a5,0x17
    80206456:	18e78793          	addi	a5,a5,398 # 8021d5e0 <root>
    8020645a:	00f48a63          	beq	s1,a5,8020646e <eput+0x3a>
    8020645e:	11649783          	lh	a5,278(s1)
    80206462:	c791                	beqz	a5,8020646e <eput+0x3a>
    80206464:	1184a703          	lw	a4,280(s1)
    80206468:	4785                	li	a5,1
    8020646a:	02f70563          	beq	a4,a5,80206494 <eput+0x60>
    entry->ref--;
    8020646e:	1184a783          	lw	a5,280(s1)
    80206472:	37fd                	addiw	a5,a5,-1
    80206474:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206478:	00017517          	auipc	a0,0x17
    8020647c:	2d050513          	addi	a0,a0,720 # 8021d748 <ecache>
    80206480:	ffffa097          	auipc	ra,0xffffa
    80206484:	2ac080e7          	jalr	684(ra) # 8020072c <release>
}
    80206488:	60e2                	ld	ra,24(sp)
    8020648a:	6442                	ld	s0,16(sp)
    8020648c:	64a2                	ld	s1,8(sp)
    8020648e:	6902                	ld	s2,0(sp)
    80206490:	6105                	addi	sp,sp,32
    80206492:	8082                	ret
        acquiresleep(&entry->lock);
    80206494:	13848913          	addi	s2,s1,312
    80206498:	854a                	mv	a0,s2
    8020649a:	ffffd097          	auipc	ra,0xffffd
    8020649e:	2ec080e7          	jalr	748(ra) # 80203786 <acquiresleep>
        entry->next->prev = entry->prev;
    802064a2:	1284b703          	ld	a4,296(s1)
    802064a6:	1304b783          	ld	a5,304(s1)
    802064aa:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    802064ae:	1284b703          	ld	a4,296(s1)
    802064b2:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    802064b6:	00017797          	auipc	a5,0x17
    802064ba:	10278793          	addi	a5,a5,258 # 8021d5b8 <fat>
    802064be:	1507b703          	ld	a4,336(a5)
    802064c2:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    802064c6:	00017697          	auipc	a3,0x17
    802064ca:	11a68693          	addi	a3,a3,282 # 8021d5e0 <root>
    802064ce:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    802064d2:	12973823          	sd	s1,304(a4)
        root.next = entry;
    802064d6:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    802064da:	00017517          	auipc	a0,0x17
    802064de:	26e50513          	addi	a0,a0,622 # 8021d748 <ecache>
    802064e2:	ffffa097          	auipc	ra,0xffffa
    802064e6:	24a080e7          	jalr	586(ra) # 8020072c <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    802064ea:	11649703          	lh	a4,278(s1)
    802064ee:	57fd                	li	a5,-1
    802064f0:	06f70863          	beq	a4,a5,80206560 <eput+0x12c>
            elock(entry->parent);
    802064f4:	1204b503          	ld	a0,288(s1)
    802064f8:	00000097          	auipc	ra,0x0
    802064fc:	eb8080e7          	jalr	-328(ra) # 802063b0 <elock>
            eupdate(entry);
    80206500:	8526                	mv	a0,s1
    80206502:	00000097          	auipc	ra,0x0
    80206506:	c98080e7          	jalr	-872(ra) # 8020619a <eupdate>
            eunlock(entry->parent);
    8020650a:	1204b503          	ld	a0,288(s1)
    8020650e:	00000097          	auipc	ra,0x0
    80206512:	ed8080e7          	jalr	-296(ra) # 802063e6 <eunlock>
        releasesleep(&entry->lock);
    80206516:	854a                	mv	a0,s2
    80206518:	ffffd097          	auipc	ra,0xffffd
    8020651c:	2c4080e7          	jalr	708(ra) # 802037dc <releasesleep>
        struct dirent *eparent = entry->parent;
    80206520:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206524:	00017517          	auipc	a0,0x17
    80206528:	22450513          	addi	a0,a0,548 # 8021d748 <ecache>
    8020652c:	ffffa097          	auipc	ra,0xffffa
    80206530:	1ac080e7          	jalr	428(ra) # 802006d8 <acquire>
        entry->ref--;
    80206534:	1184a783          	lw	a5,280(s1)
    80206538:	37fd                	addiw	a5,a5,-1
    8020653a:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020653e:	00017517          	auipc	a0,0x17
    80206542:	20a50513          	addi	a0,a0,522 # 8021d748 <ecache>
    80206546:	ffffa097          	auipc	ra,0xffffa
    8020654a:	1e6080e7          	jalr	486(ra) # 8020072c <release>
        if (entry->ref == 0) {
    8020654e:	1184a783          	lw	a5,280(s1)
    80206552:	fb9d                	bnez	a5,80206488 <eput+0x54>
            eput(eparent);
    80206554:	854a                	mv	a0,s2
    80206556:	00000097          	auipc	ra,0x0
    8020655a:	ede080e7          	jalr	-290(ra) # 80206434 <eput>
    8020655e:	b72d                	j	80206488 <eput+0x54>
            etrunc(entry);
    80206560:	8526                	mv	a0,s1
    80206562:	00000097          	auipc	ra,0x0
    80206566:	de6080e7          	jalr	-538(ra) # 80206348 <etrunc>
    8020656a:	b775                	j	80206516 <eput+0xe2>

000000008020656c <estat>:
{
    8020656c:	1101                	addi	sp,sp,-32
    8020656e:	ec06                	sd	ra,24(sp)
    80206570:	e822                	sd	s0,16(sp)
    80206572:	e426                	sd	s1,8(sp)
    80206574:	e04a                	sd	s2,0(sp)
    80206576:	1000                	addi	s0,sp,32
    80206578:	892a                	mv	s2,a0
    8020657a:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    8020657c:	02000613          	li	a2,32
    80206580:	85aa                	mv	a1,a0
    80206582:	8526                	mv	a0,s1
    80206584:	ffffa097          	auipc	ra,0xffffa
    80206588:	328080e7          	jalr	808(ra) # 802008ac <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    8020658c:	10094783          	lbu	a5,256(s2)
    80206590:	8bc1                	andi	a5,a5,16
    80206592:	0017b793          	seqz	a5,a5
    80206596:	0785                	addi	a5,a5,1
    80206598:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    8020659c:	11494783          	lbu	a5,276(s2)
    802065a0:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    802065a2:	10896783          	lwu	a5,264(s2)
    802065a6:	f89c                	sd	a5,48(s1)
}
    802065a8:	60e2                	ld	ra,24(sp)
    802065aa:	6442                	ld	s0,16(sp)
    802065ac:	64a2                	ld	s1,8(sp)
    802065ae:	6902                	ld	s2,0(sp)
    802065b0:	6105                	addi	sp,sp,32
    802065b2:	8082                	ret

00000000802065b4 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    802065b4:	7119                	addi	sp,sp,-128
    802065b6:	fc86                	sd	ra,120(sp)
    802065b8:	f8a2                	sd	s0,112(sp)
    802065ba:	f4a6                	sd	s1,104(sp)
    802065bc:	f0ca                	sd	s2,96(sp)
    802065be:	ecce                	sd	s3,88(sp)
    802065c0:	e8d2                	sd	s4,80(sp)
    802065c2:	e4d6                	sd	s5,72(sp)
    802065c4:	e0da                	sd	s6,64(sp)
    802065c6:	fc5e                	sd	s7,56(sp)
    802065c8:	f862                	sd	s8,48(sp)
    802065ca:	f466                	sd	s9,40(sp)
    802065cc:	f06a                	sd	s10,32(sp)
    802065ce:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    802065d0:	10054783          	lbu	a5,256(a0)
    802065d4:	8bc1                	andi	a5,a5,16
    802065d6:	cf9d                	beqz	a5,80206614 <enext+0x60>
    802065d8:	892a                	mv	s2,a0
    802065da:	8c2e                	mv	s8,a1
    802065dc:	84b2                	mv	s1,a2
    802065de:	8b36                	mv	s6,a3
        panic("enext not dir");
    if (ep->valid)
    802065e0:	11659783          	lh	a5,278(a1)
    802065e4:	e3a1                	bnez	a5,80206624 <enext+0x70>
        panic("enext ep valid");
    if (off % 32)
    802065e6:	01f67793          	andi	a5,a2,31
    802065ea:	e7a9                	bnez	a5,80206634 <enext+0x80>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    802065ec:	11651703          	lh	a4,278(a0)
    802065f0:	4785                	li	a5,1
    802065f2:	557d                	li	a0,-1
    802065f4:	04f70863          	beq	a4,a5,80206644 <enext+0x90>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    802065f8:	70e6                	ld	ra,120(sp)
    802065fa:	7446                	ld	s0,112(sp)
    802065fc:	74a6                	ld	s1,104(sp)
    802065fe:	7906                	ld	s2,96(sp)
    80206600:	69e6                	ld	s3,88(sp)
    80206602:	6a46                	ld	s4,80(sp)
    80206604:	6aa6                	ld	s5,72(sp)
    80206606:	6b06                	ld	s6,64(sp)
    80206608:	7be2                	ld	s7,56(sp)
    8020660a:	7c42                	ld	s8,48(sp)
    8020660c:	7ca2                	ld	s9,40(sp)
    8020660e:	7d02                	ld	s10,32(sp)
    80206610:	6109                	addi	sp,sp,128
    80206612:	8082                	ret
        panic("enext not dir");
    80206614:	00003517          	auipc	a0,0x3
    80206618:	67450513          	addi	a0,a0,1652 # 80209c88 <etext+0xc88>
    8020661c:	ffffa097          	auipc	ra,0xffffa
    80206620:	b2a080e7          	jalr	-1238(ra) # 80200146 <panic>
        panic("enext ep valid");
    80206624:	00003517          	auipc	a0,0x3
    80206628:	67450513          	addi	a0,a0,1652 # 80209c98 <etext+0xc98>
    8020662c:	ffffa097          	auipc	ra,0xffffa
    80206630:	b1a080e7          	jalr	-1254(ra) # 80200146 <panic>
        panic("enext not align");
    80206634:	00003517          	auipc	a0,0x3
    80206638:	67450513          	addi	a0,a0,1652 # 80209ca8 <etext+0xca8>
    8020663c:	ffffa097          	auipc	ra,0xffffa
    80206640:	b0a080e7          	jalr	-1270(ra) # 80200146 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206644:	8d2e                	mv	s10,a1
    80206646:	10000613          	li	a2,256
    8020664a:	4581                	li	a1,0
    8020664c:	8562                	mv	a0,s8
    8020664e:	ffffa097          	auipc	ra,0xffffa
    80206652:	126080e7          	jalr	294(ra) # 80200774 <memset>
    int cnt = 0;
    80206656:	4a01                	li	s4,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206658:	5afd                	li	s5,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    8020665a:	f8040993          	addi	s3,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    8020665e:	0e500b93          	li	s7,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    80206662:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206664:	a03d                	j	80206692 <enext+0xde>
            cnt++;
    80206666:	2a05                	addiw	s4,s4,1
            continue;
    80206668:	a01d                	j	8020668e <enext+0xda>
            *count = cnt;
    8020666a:	014b2023          	sw	s4,0(s6)
            return 0;
    8020666e:	4501                	li	a0,0
    80206670:	b761                	j	802065f8 <enext+0x44>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    80206672:	fff5079b          	addiw	a5,a0,-1
    80206676:	0017951b          	slliw	a0,a5,0x1
    8020667a:	9d3d                	addw	a0,a0,a5
    8020667c:	0025151b          	slliw	a0,a0,0x2
    80206680:	9d3d                	addw	a0,a0,a5
    80206682:	85ce                	mv	a1,s3
    80206684:	956a                	add	a0,a0,s10
    80206686:	fffff097          	auipc	ra,0xfffff
    8020668a:	170080e7          	jalr	368(ra) # 802057f6 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020668e:	0204849b          	addiw	s1,s1,32
    80206692:	4601                	li	a2,0
    80206694:	85a6                	mv	a1,s1
    80206696:	854a                	mv	a0,s2
    80206698:	fffff097          	auipc	ra,0xfffff
    8020669c:	ddc080e7          	jalr	-548(ra) # 80205474 <reloc_clus>
    802066a0:	f5550ce3          	beq	a0,s5,802065f8 <enext+0x44>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802066a4:	02000793          	li	a5,32
    802066a8:	0005071b          	sext.w	a4,a0
    802066ac:	86ce                	mv	a3,s3
    802066ae:	4601                	li	a2,0
    802066b0:	4581                	li	a1,0
    802066b2:	10c92503          	lw	a0,268(s2)
    802066b6:	fffff097          	auipc	ra,0xfffff
    802066ba:	ed0080e7          	jalr	-304(ra) # 80205586 <rw_clus>
    802066be:	2501                	sext.w	a0,a0
    802066c0:	02000793          	li	a5,32
    802066c4:	06f51c63          	bne	a0,a5,8020673c <enext+0x188>
    802066c8:	f8044783          	lbu	a5,-128(s0)
    802066cc:	cbb5                	beqz	a5,80206740 <enext+0x18c>
        if (de.lne.order == EMPTY_ENTRY) {
    802066ce:	f9778ce3          	beq	a5,s7,80206666 <enext+0xb2>
        } else if (cnt) {
    802066d2:	f80a1ce3          	bnez	s4,8020666a <enext+0xb6>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802066d6:	f8b44703          	lbu	a4,-117(s0)
    802066da:	01971d63          	bne	a4,s9,802066f4 <enext+0x140>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    802066de:	0bf7f513          	andi	a0,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    802066e2:	0407f793          	andi	a5,a5,64
    802066e6:	d7d1                	beqz	a5,80206672 <enext+0xbe>
                *count = lcnt + 1;                              // plus the s-n-e;
    802066e8:	0015079b          	addiw	a5,a0,1
    802066ec:	00fb2023          	sw	a5,0(s6)
                count = 0;
    802066f0:	4b01                	li	s6,0
    802066f2:	b741                	j	80206672 <enext+0xbe>
            if (count) {
    802066f4:	000b0c63          	beqz	s6,8020670c <enext+0x158>
                *count = 1;
    802066f8:	4785                	li	a5,1
    802066fa:	00fb2023          	sw	a5,0(s6)
                read_entry_name(ep->filename, &de);
    802066fe:	f8040593          	addi	a1,s0,-128
    80206702:	8562                	mv	a0,s8
    80206704:	fffff097          	auipc	ra,0xfffff
    80206708:	0f2080e7          	jalr	242(ra) # 802057f6 <read_entry_name>
    entry->attribute = d->sne.attr;
    8020670c:	f8b44783          	lbu	a5,-117(s0)
    80206710:	10fc0023          	sb	a5,256(s8)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    80206714:	f9445783          	lhu	a5,-108(s0)
    80206718:	0107979b          	slliw	a5,a5,0x10
    8020671c:	f9a45703          	lhu	a4,-102(s0)
    80206720:	8fd9                	or	a5,a5,a4
    80206722:	2781                	sext.w	a5,a5
    80206724:	10fc2223          	sw	a5,260(s8)
    entry->file_size = d->sne.file_size;
    80206728:	f9c42703          	lw	a4,-100(s0)
    8020672c:	10ec2423          	sw	a4,264(s8)
    entry->cur_clus = entry->first_clus;
    80206730:	10fc2623          	sw	a5,268(s8)
    entry->clus_cnt = 0;
    80206734:	100c2823          	sw	zero,272(s8)
            return 1;
    80206738:	4505                	li	a0,1
    8020673a:	bd7d                	j	802065f8 <enext+0x44>
            return -1;
    8020673c:	557d                	li	a0,-1
    8020673e:	bd6d                	j	802065f8 <enext+0x44>
    80206740:	557d                	li	a0,-1
    80206742:	bd5d                	j	802065f8 <enext+0x44>

0000000080206744 <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    80206744:	711d                	addi	sp,sp,-96
    80206746:	ec86                	sd	ra,88(sp)
    80206748:	e8a2                	sd	s0,80(sp)
    8020674a:	e4a6                	sd	s1,72(sp)
    8020674c:	e0ca                	sd	s2,64(sp)
    8020674e:	fc4e                	sd	s3,56(sp)
    80206750:	f852                	sd	s4,48(sp)
    80206752:	f456                	sd	s5,40(sp)
    80206754:	f05a                	sd	s6,32(sp)
    80206756:	ec5e                	sd	s7,24(sp)
    80206758:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    8020675a:	10054783          	lbu	a5,256(a0)
    8020675e:	8bc1                	andi	a5,a5,16
    80206760:	cbb1                	beqz	a5,802067b4 <dirlookup+0x70>
    80206762:	892a                	mv	s2,a0
    80206764:	89ae                	mv	s3,a1
    80206766:	8bb2                	mv	s7,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206768:	0ff00613          	li	a2,255
    8020676c:	00003597          	auipc	a1,0x3
    80206770:	56458593          	addi	a1,a1,1380 # 80209cd0 <etext+0xcd0>
    80206774:	854e                	mv	a0,s3
    80206776:	ffffa097          	auipc	ra,0xffffa
    8020677a:	0e6080e7          	jalr	230(ra) # 8020085c <strncmp>
    8020677e:	c139                	beqz	a0,802067c4 <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    80206780:	0ff00613          	li	a2,255
    80206784:	00003597          	auipc	a1,0x3
    80206788:	55458593          	addi	a1,a1,1364 # 80209cd8 <etext+0xcd8>
    8020678c:	854e                	mv	a0,s3
    8020678e:	ffffa097          	auipc	ra,0xffffa
    80206792:	0ce080e7          	jalr	206(ra) # 8020085c <strncmp>
    80206796:	e125                	bnez	a0,802067f6 <dirlookup+0xb2>
        if (dp == &root) {
    80206798:	00017797          	auipc	a5,0x17
    8020679c:	e4878793          	addi	a5,a5,-440 # 8021d5e0 <root>
    802067a0:	04f90463          	beq	s2,a5,802067e8 <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    802067a4:	12093503          	ld	a0,288(s2)
    802067a8:	00000097          	auipc	ra,0x0
    802067ac:	9ae080e7          	jalr	-1618(ra) # 80206156 <edup>
    802067b0:	84aa                	mv	s1,a0
    802067b2:	a839                	j	802067d0 <dirlookup+0x8c>
        panic("dirlookup not DIR");
    802067b4:	00003517          	auipc	a0,0x3
    802067b8:	50450513          	addi	a0,a0,1284 # 80209cb8 <etext+0xcb8>
    802067bc:	ffffa097          	auipc	ra,0xffffa
    802067c0:	98a080e7          	jalr	-1654(ra) # 80200146 <panic>
        return edup(dp);
    802067c4:	854a                	mv	a0,s2
    802067c6:	00000097          	auipc	ra,0x0
    802067ca:	990080e7          	jalr	-1648(ra) # 80206156 <edup>
    802067ce:	84aa                	mv	s1,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    802067d0:	8526                	mv	a0,s1
    802067d2:	60e6                	ld	ra,88(sp)
    802067d4:	6446                	ld	s0,80(sp)
    802067d6:	64a6                	ld	s1,72(sp)
    802067d8:	6906                	ld	s2,64(sp)
    802067da:	79e2                	ld	s3,56(sp)
    802067dc:	7a42                	ld	s4,48(sp)
    802067de:	7aa2                	ld	s5,40(sp)
    802067e0:	7b02                	ld	s6,32(sp)
    802067e2:	6be2                	ld	s7,24(sp)
    802067e4:	6125                	addi	sp,sp,96
    802067e6:	8082                	ret
            return edup(&root);
    802067e8:	853e                	mv	a0,a5
    802067ea:	00000097          	auipc	ra,0x0
    802067ee:	96c080e7          	jalr	-1684(ra) # 80206156 <edup>
    802067f2:	84aa                	mv	s1,a0
    802067f4:	bff1                	j	802067d0 <dirlookup+0x8c>
    if (dp->valid != 1) {
    802067f6:	11691703          	lh	a4,278(s2)
    802067fa:	4785                	li	a5,1
        return NULL;
    802067fc:	4481                	li	s1,0
    if (dp->valid != 1) {
    802067fe:	fcf719e3          	bne	a4,a5,802067d0 <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80206802:	85ce                	mv	a1,s3
    80206804:	854a                	mv	a0,s2
    80206806:	fffff097          	auipc	ra,0xfffff
    8020680a:	ece080e7          	jalr	-306(ra) # 802056d4 <eget>
    8020680e:	84aa                	mv	s1,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80206810:	11651703          	lh	a4,278(a0)
    80206814:	4785                	li	a5,1
    80206816:	faf70de3          	beq	a4,a5,802067d0 <dirlookup+0x8c>
    int len = strlen(filename);
    8020681a:	854e                	mv	a0,s3
    8020681c:	ffffa097          	auipc	ra,0xffffa
    80206820:	102080e7          	jalr	258(ra) # 8020091e <strlen>
    int count = 0;
    80206824:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    80206828:	4601                	li	a2,0
    8020682a:	4581                	li	a1,0
    8020682c:	854a                	mv	a0,s2
    8020682e:	fffff097          	auipc	ra,0xfffff
    80206832:	c46080e7          	jalr	-954(ra) # 80205474 <reloc_clus>
    uint off = 0;
    80206836:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206838:	fac40b13          	addi	s6,s0,-84
    8020683c:	5afd                	li	s5,-1
    8020683e:	86da                	mv	a3,s6
    80206840:	8652                	mv	a2,s4
    80206842:	85a6                	mv	a1,s1
    80206844:	854a                	mv	a0,s2
    80206846:	00000097          	auipc	ra,0x0
    8020684a:	d6e080e7          	jalr	-658(ra) # 802065b4 <enext>
    8020684e:	03550f63          	beq	a0,s5,8020688c <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80206852:	0ff00613          	li	a2,255
    80206856:	85a6                	mv	a1,s1
    80206858:	854e                	mv	a0,s3
    8020685a:	ffffa097          	auipc	ra,0xffffa
    8020685e:	002080e7          	jalr	2(ra) # 8020085c <strncmp>
    80206862:	c901                	beqz	a0,80206872 <dirlookup+0x12e>
        off += count << 5;
    80206864:	fac42783          	lw	a5,-84(s0)
    80206868:	0057979b          	slliw	a5,a5,0x5
    8020686c:	01478a3b          	addw	s4,a5,s4
    80206870:	b7f9                	j	8020683e <dirlookup+0xfa>
            ep->parent = edup(dp);
    80206872:	854a                	mv	a0,s2
    80206874:	00000097          	auipc	ra,0x0
    80206878:	8e2080e7          	jalr	-1822(ra) # 80206156 <edup>
    8020687c:	12a4b023          	sd	a0,288(s1)
            ep->off = off;
    80206880:	1144ae23          	sw	s4,284(s1)
            ep->valid = 1;
    80206884:	4785                	li	a5,1
    80206886:	10f49b23          	sh	a5,278(s1)
            return ep;
    8020688a:	b799                	j	802067d0 <dirlookup+0x8c>
    if (poff) {
    8020688c:	000b8463          	beqz	s7,80206894 <dirlookup+0x150>
        *poff = off;
    80206890:	014ba023          	sw	s4,0(s7) # fffffffffffff000 <ebss_clear+0xffffffff7fdda000>
    eput(ep);
    80206894:	8526                	mv	a0,s1
    80206896:	00000097          	auipc	ra,0x0
    8020689a:	b9e080e7          	jalr	-1122(ra) # 80206434 <eput>
    return NULL;
    8020689e:	4481                	li	s1,0
    802068a0:	bf05                	j	802067d0 <dirlookup+0x8c>

00000000802068a2 <ealloc>:
{
    802068a2:	7139                	addi	sp,sp,-64
    802068a4:	fc06                	sd	ra,56(sp)
    802068a6:	f822                	sd	s0,48(sp)
    802068a8:	f426                	sd	s1,40(sp)
    802068aa:	f04a                	sd	s2,32(sp)
    802068ac:	ec4e                	sd	s3,24(sp)
    802068ae:	e852                	sd	s4,16(sp)
    802068b0:	0080                	addi	s0,sp,64
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    802068b2:	10054783          	lbu	a5,256(a0)
    802068b6:	8bc1                	andi	a5,a5,16
    802068b8:	c7b1                	beqz	a5,80206904 <ealloc+0x62>
    802068ba:	892a                	mv	s2,a0
    802068bc:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802068be:	11651703          	lh	a4,278(a0)
    802068c2:	4785                	li	a5,1
        return NULL;
    802068c4:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    802068c6:	02f71663          	bne	a4,a5,802068f2 <ealloc+0x50>
    802068ca:	852e                	mv	a0,a1
    802068cc:	fffff097          	auipc	ra,0xfffff
    802068d0:	41c080e7          	jalr	1052(ra) # 80205ce8 <formatname>
    802068d4:	89aa                	mv	s3,a0
    802068d6:	10050663          	beqz	a0,802069e2 <ealloc+0x140>
    uint off = 0;
    802068da:	fc042623          	sw	zero,-52(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    802068de:	fcc40613          	addi	a2,s0,-52
    802068e2:	85aa                	mv	a1,a0
    802068e4:	854a                	mv	a0,s2
    802068e6:	00000097          	auipc	ra,0x0
    802068ea:	e5e080e7          	jalr	-418(ra) # 80206744 <dirlookup>
    802068ee:	84aa                	mv	s1,a0
    802068f0:	c115                	beqz	a0,80206914 <ealloc+0x72>
}
    802068f2:	8526                	mv	a0,s1
    802068f4:	70e2                	ld	ra,56(sp)
    802068f6:	7442                	ld	s0,48(sp)
    802068f8:	74a2                	ld	s1,40(sp)
    802068fa:	7902                	ld	s2,32(sp)
    802068fc:	69e2                	ld	s3,24(sp)
    802068fe:	6a42                	ld	s4,16(sp)
    80206900:	6121                	addi	sp,sp,64
    80206902:	8082                	ret
        panic("ealloc not dir");
    80206904:	00003517          	auipc	a0,0x3
    80206908:	3dc50513          	addi	a0,a0,988 # 80209ce0 <etext+0xce0>
    8020690c:	ffffa097          	auipc	ra,0xffffa
    80206910:	83a080e7          	jalr	-1990(ra) # 80200146 <panic>
    ep = eget(dp, name);
    80206914:	85ce                	mv	a1,s3
    80206916:	854a                	mv	a0,s2
    80206918:	fffff097          	auipc	ra,0xfffff
    8020691c:	dbc080e7          	jalr	-580(ra) # 802056d4 <eget>
    80206920:	84aa                	mv	s1,a0
    elock(ep);
    80206922:	00000097          	auipc	ra,0x0
    80206926:	a8e080e7          	jalr	-1394(ra) # 802063b0 <elock>
    ep->attribute = attr;
    8020692a:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    8020692e:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80206932:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206936:	854a                	mv	a0,s2
    80206938:	00000097          	auipc	ra,0x0
    8020693c:	81e080e7          	jalr	-2018(ra) # 80206156 <edup>
    80206940:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206944:	fcc42783          	lw	a5,-52(s0)
    80206948:	10f4ae23          	sw	a5,284(s1)
    ep->clus_cnt = 0;
    8020694c:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80206950:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80206954:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80206958:	0ff00613          	li	a2,255
    8020695c:	85ce                	mv	a1,s3
    8020695e:	8526                	mv	a0,s1
    80206960:	ffffa097          	auipc	ra,0xffffa
    80206964:	f4c080e7          	jalr	-180(ra) # 802008ac <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80206968:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    8020696c:	47c1                	li	a5,16
    8020696e:	02fa0963          	beq	s4,a5,802069a0 <ealloc+0xfe>
        ep->attribute |= ATTR_ARCHIVE;
    80206972:	1004c783          	lbu	a5,256(s1)
    80206976:	0207e793          	ori	a5,a5,32
    8020697a:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    8020697e:	fcc42603          	lw	a2,-52(s0)
    80206982:	85a6                	mv	a1,s1
    80206984:	854a                	mv	a0,s2
    80206986:	fffff097          	auipc	ra,0xfffff
    8020698a:	422080e7          	jalr	1058(ra) # 80205da8 <emake>
    ep->valid = 1;
    8020698e:	4785                	li	a5,1
    80206990:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80206994:	8526                	mv	a0,s1
    80206996:	00000097          	auipc	ra,0x0
    8020699a:	a50080e7          	jalr	-1456(ra) # 802063e6 <eunlock>
    return ep;
    8020699e:	bf91                	j	802068f2 <ealloc+0x50>
        ep->attribute |= ATTR_DIRECTORY;
    802069a0:	1004c783          	lbu	a5,256(s1)
    802069a4:	0107e793          	ori	a5,a5,16
    802069a8:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    802069ac:	11494503          	lbu	a0,276(s2)
    802069b0:	fffff097          	auipc	ra,0xfffff
    802069b4:	8fa080e7          	jalr	-1798(ra) # 802052aa <alloc_clus>
    802069b8:	2501                	sext.w	a0,a0
    802069ba:	10a4a223          	sw	a0,260(s1)
    802069be:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    802069c2:	4601                	li	a2,0
    802069c4:	85a6                	mv	a1,s1
    802069c6:	8526                	mv	a0,s1
    802069c8:	fffff097          	auipc	ra,0xfffff
    802069cc:	3e0080e7          	jalr	992(ra) # 80205da8 <emake>
        emake(ep, dp, 32);
    802069d0:	02000613          	li	a2,32
    802069d4:	85ca                	mv	a1,s2
    802069d6:	8526                	mv	a0,s1
    802069d8:	fffff097          	auipc	ra,0xfffff
    802069dc:	3d0080e7          	jalr	976(ra) # 80205da8 <emake>
    802069e0:	bf79                	j	8020697e <ealloc+0xdc>
        return NULL;
    802069e2:	84aa                	mv	s1,a0
    802069e4:	b739                	j	802068f2 <ealloc+0x50>

00000000802069e6 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    802069e6:	715d                	addi	sp,sp,-80
    802069e8:	e486                	sd	ra,72(sp)
    802069ea:	e0a2                	sd	s0,64(sp)
    802069ec:	fc26                	sd	s1,56(sp)
    802069ee:	f84a                	sd	s2,48(sp)
    802069f0:	f44e                	sd	s3,40(sp)
    802069f2:	f052                	sd	s4,32(sp)
    802069f4:	ec56                	sd	s5,24(sp)
    802069f6:	e85a                	sd	s6,16(sp)
    802069f8:	e45e                	sd	s7,8(sp)
    802069fa:	e062                	sd	s8,0(sp)
    802069fc:	0880                	addi	s0,sp,80
    802069fe:	84aa                	mv	s1,a0
    80206a00:	8aae                	mv	s5,a1
    80206a02:	8a32                	mv	s4,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80206a04:	00054783          	lbu	a5,0(a0)
    80206a08:	02f00713          	li	a4,47
    80206a0c:	02e78663          	beq	a5,a4,80206a38 <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80206a10:	4901                	li	s2,0
    } else if (*path != '\0') {
    80206a12:	cba1                	beqz	a5,80206a62 <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80206a14:	ffffb097          	auipc	ra,0xffffb
    80206a18:	0ac080e7          	jalr	172(ra) # 80201ac0 <myproc>
    80206a1c:	15853503          	ld	a0,344(a0)
    80206a20:	fffff097          	auipc	ra,0xfffff
    80206a24:	736080e7          	jalr	1846(ra) # 80206156 <edup>
    80206a28:	892a                	mv	s2,a0
    while (*path == '/') {
    80206a2a:	02f00993          	li	s3,47
    80206a2e:	0ff00b13          	li	s6,255
    80206a32:	0ff00b93          	li	s7,255
    80206a36:	a0d5                	j	80206b1a <lookup_path+0x134>
        entry = edup(&root);
    80206a38:	00017517          	auipc	a0,0x17
    80206a3c:	ba850513          	addi	a0,a0,-1112 # 8021d5e0 <root>
    80206a40:	fffff097          	auipc	ra,0xfffff
    80206a44:	716080e7          	jalr	1814(ra) # 80206156 <edup>
    80206a48:	892a                	mv	s2,a0
    80206a4a:	b7c5                	j	80206a2a <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80206a4c:	854a                	mv	a0,s2
    80206a4e:	00000097          	auipc	ra,0x0
    80206a52:	998080e7          	jalr	-1640(ra) # 802063e6 <eunlock>
            eput(entry);
    80206a56:	854a                	mv	a0,s2
    80206a58:	00000097          	auipc	ra,0x0
    80206a5c:	9dc080e7          	jalr	-1572(ra) # 80206434 <eput>
            return NULL;
    80206a60:	4901                	li	s2,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80206a62:	854a                	mv	a0,s2
    80206a64:	60a6                	ld	ra,72(sp)
    80206a66:	6406                	ld	s0,64(sp)
    80206a68:	74e2                	ld	s1,56(sp)
    80206a6a:	7942                	ld	s2,48(sp)
    80206a6c:	79a2                	ld	s3,40(sp)
    80206a6e:	7a02                	ld	s4,32(sp)
    80206a70:	6ae2                	ld	s5,24(sp)
    80206a72:	6b42                	ld	s6,16(sp)
    80206a74:	6ba2                	ld	s7,8(sp)
    80206a76:	6c02                	ld	s8,0(sp)
    80206a78:	6161                	addi	sp,sp,80
    80206a7a:	8082                	ret
            eunlock(entry);
    80206a7c:	854a                	mv	a0,s2
    80206a7e:	00000097          	auipc	ra,0x0
    80206a82:	968080e7          	jalr	-1688(ra) # 802063e6 <eunlock>
            return entry;
    80206a86:	bff1                	j	80206a62 <lookup_path+0x7c>
            eunlock(entry);
    80206a88:	854a                	mv	a0,s2
    80206a8a:	00000097          	auipc	ra,0x0
    80206a8e:	95c080e7          	jalr	-1700(ra) # 802063e6 <eunlock>
            eput(entry);
    80206a92:	854a                	mv	a0,s2
    80206a94:	00000097          	auipc	ra,0x0
    80206a98:	9a0080e7          	jalr	-1632(ra) # 80206434 <eput>
            return NULL;
    80206a9c:	8962                	mv	s2,s8
    80206a9e:	b7d1                	j	80206a62 <lookup_path+0x7c>
        path++;
    80206aa0:	85a6                	mv	a1,s1
    int len = path - s;
    80206aa2:	40b487bb          	subw	a5,s1,a1
    if (len > FAT32_MAX_FILENAME) {
    80206aa6:	863e                	mv	a2,a5
    80206aa8:	00fb5363          	ble	a5,s6,80206aae <lookup_path+0xc8>
    80206aac:	865e                	mv	a2,s7
    80206aae:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80206ab2:	97d2                	add	a5,a5,s4
    80206ab4:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80206ab8:	2601                	sext.w	a2,a2
    80206aba:	8552                	mv	a0,s4
    80206abc:	ffffa097          	auipc	ra,0xffffa
    80206ac0:	d24080e7          	jalr	-732(ra) # 802007e0 <memmove>
    while (*path == '/') {
    80206ac4:	0004c783          	lbu	a5,0(s1)
    80206ac8:	01379763          	bne	a5,s3,80206ad6 <lookup_path+0xf0>
        path++;
    80206acc:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80206ace:	0004c783          	lbu	a5,0(s1)
    80206ad2:	ff378de3          	beq	a5,s3,80206acc <lookup_path+0xe6>
        elock(entry);
    80206ad6:	854a                	mv	a0,s2
    80206ad8:	00000097          	auipc	ra,0x0
    80206adc:	8d8080e7          	jalr	-1832(ra) # 802063b0 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80206ae0:	10094783          	lbu	a5,256(s2)
    80206ae4:	8bc1                	andi	a5,a5,16
    80206ae6:	d3bd                	beqz	a5,80206a4c <lookup_path+0x66>
        if (parent && *path == '\0') {
    80206ae8:	000a8563          	beqz	s5,80206af2 <lookup_path+0x10c>
    80206aec:	0004c783          	lbu	a5,0(s1)
    80206af0:	d7d1                	beqz	a5,80206a7c <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80206af2:	4601                	li	a2,0
    80206af4:	85d2                	mv	a1,s4
    80206af6:	854a                	mv	a0,s2
    80206af8:	00000097          	auipc	ra,0x0
    80206afc:	c4c080e7          	jalr	-948(ra) # 80206744 <dirlookup>
    80206b00:	8c2a                	mv	s8,a0
    80206b02:	d159                	beqz	a0,80206a88 <lookup_path+0xa2>
        eunlock(entry);
    80206b04:	854a                	mv	a0,s2
    80206b06:	00000097          	auipc	ra,0x0
    80206b0a:	8e0080e7          	jalr	-1824(ra) # 802063e6 <eunlock>
        eput(entry);
    80206b0e:	854a                	mv	a0,s2
    80206b10:	00000097          	auipc	ra,0x0
    80206b14:	924080e7          	jalr	-1756(ra) # 80206434 <eput>
        entry = next;
    80206b18:	8962                	mv	s2,s8
    while (*path == '/') {
    80206b1a:	0004c783          	lbu	a5,0(s1)
    80206b1e:	03379e63          	bne	a5,s3,80206b5a <lookup_path+0x174>
        path++;
    80206b22:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80206b24:	0004c783          	lbu	a5,0(s1)
    80206b28:	ff378de3          	beq	a5,s3,80206b22 <lookup_path+0x13c>
    if (*path == 0) { return NULL; }
    80206b2c:	cf91                	beqz	a5,80206b48 <lookup_path+0x162>
    while (*path != '/' && *path != 0) {
    80206b2e:	f73789e3          	beq	a5,s3,80206aa0 <lookup_path+0xba>
    80206b32:	cb89                	beqz	a5,80206b44 <lookup_path+0x15e>
        path++;
    80206b34:	85a6                	mv	a1,s1
        path++;
    80206b36:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80206b38:	0004c783          	lbu	a5,0(s1)
    80206b3c:	f73783e3          	beq	a5,s3,80206aa2 <lookup_path+0xbc>
    80206b40:	fbfd                	bnez	a5,80206b36 <lookup_path+0x150>
    80206b42:	b785                	j	80206aa2 <lookup_path+0xbc>
        path++;
    80206b44:	85a6                	mv	a1,s1
    80206b46:	bfb1                	j	80206aa2 <lookup_path+0xbc>
    if (parent) {
    80206b48:	f00a8de3          	beqz	s5,80206a62 <lookup_path+0x7c>
        eput(entry);
    80206b4c:	854a                	mv	a0,s2
    80206b4e:	00000097          	auipc	ra,0x0
    80206b52:	8e6080e7          	jalr	-1818(ra) # 80206434 <eput>
        return NULL;
    80206b56:	4901                	li	s2,0
    80206b58:	b729                	j	80206a62 <lookup_path+0x7c>
    if (*path == 0) { return NULL; }
    80206b5a:	d7fd                	beqz	a5,80206b48 <lookup_path+0x162>
    80206b5c:	85a6                	mv	a1,s1
    80206b5e:	bfe1                	j	80206b36 <lookup_path+0x150>

0000000080206b60 <ename>:

struct dirent *ename(char *path)
{
    80206b60:	716d                	addi	sp,sp,-272
    80206b62:	e606                	sd	ra,264(sp)
    80206b64:	e222                	sd	s0,256(sp)
    80206b66:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80206b68:	ef040613          	addi	a2,s0,-272
    80206b6c:	4581                	li	a1,0
    80206b6e:	00000097          	auipc	ra,0x0
    80206b72:	e78080e7          	jalr	-392(ra) # 802069e6 <lookup_path>
}
    80206b76:	60b2                	ld	ra,264(sp)
    80206b78:	6412                	ld	s0,256(sp)
    80206b7a:	6151                	addi	sp,sp,272
    80206b7c:	8082                	ret

0000000080206b7e <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80206b7e:	1141                	addi	sp,sp,-16
    80206b80:	e406                	sd	ra,8(sp)
    80206b82:	e022                	sd	s0,0(sp)
    80206b84:	0800                	addi	s0,sp,16
    return lookup_path(path, 1, name);
    80206b86:	862e                	mv	a2,a1
    80206b88:	4585                	li	a1,1
    80206b8a:	00000097          	auipc	ra,0x0
    80206b8e:	e5c080e7          	jalr	-420(ra) # 802069e6 <lookup_path>
}
    80206b92:	60a2                	ld	ra,8(sp)
    80206b94:	6402                	ld	s0,0(sp)
    80206b96:	0141                	addi	sp,sp,16
    80206b98:	8082                	ret

0000000080206b9a <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80206b9a:	1141                	addi	sp,sp,-16
    80206b9c:	e422                	sd	s0,8(sp)
    80206b9e:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80206ba0:	00fc37b7          	lui	a5,0xfc3
    80206ba4:	07ba                	slli	a5,a5,0xe
    80206ba6:	4705                	li	a4,1
    80206ba8:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80206baa:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
	#endif 
}
    80206bac:	6422                	ld	s0,8(sp)
    80206bae:	0141                	addi	sp,sp,16
    80206bb0:	8082                	ret

0000000080206bb2 <plicinithart>:

void
plicinithart(void)
{
    80206bb2:	1141                	addi	sp,sp,-16
    80206bb4:	e406                	sd	ra,8(sp)
    80206bb6:	e022                	sd	s0,0(sp)
    80206bb8:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206bba:	ffffb097          	auipc	ra,0xffffb
    80206bbe:	eda080e7          	jalr	-294(ra) # 80201a94 <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80206bc2:	0085171b          	slliw	a4,a0,0x8
    80206bc6:	01f867b7          	lui	a5,0x1f86
    80206bca:	0785                	addi	a5,a5,1
    80206bcc:	07b6                	slli	a5,a5,0xd
    80206bce:	97ba                	add	a5,a5,a4
    80206bd0:	40200713          	li	a4,1026
    80206bd4:	08e7a023          	sw	a4,128(a5) # 1f86080 <BASE_ADDRESS-0x7e279f80>
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80206bd8:	00d5179b          	slliw	a5,a0,0xd
    80206bdc:	03f0c537          	lui	a0,0x3f0c
    80206be0:	20150513          	addi	a0,a0,513 # 3f0c201 <BASE_ADDRESS-0x7c2f3dff>
    80206be4:	0532                	slli	a0,a0,0xc
    80206be6:	953e                	add	a0,a0,a5
    80206be8:	00052023          	sw	zero,0(a0)
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
  #endif
}
    80206bec:	60a2                	ld	ra,8(sp)
    80206bee:	6402                	ld	s0,0(sp)
    80206bf0:	0141                	addi	sp,sp,16
    80206bf2:	8082                	ret

0000000080206bf4 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80206bf4:	1141                	addi	sp,sp,-16
    80206bf6:	e406                	sd	ra,8(sp)
    80206bf8:	e022                	sd	s0,0(sp)
    80206bfa:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206bfc:	ffffb097          	auipc	ra,0xffffb
    80206c00:	e98080e7          	jalr	-360(ra) # 80201a94 <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80206c04:	00d5151b          	slliw	a0,a0,0xd
    80206c08:	03f0c7b7          	lui	a5,0x3f0c
    80206c0c:	20178793          	addi	a5,a5,513 # 3f0c201 <BASE_ADDRESS-0x7c2f3dff>
    80206c10:	07b2                	slli	a5,a5,0xc
    80206c12:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80206c14:	43c8                	lw	a0,4(a5)
    80206c16:	60a2                	ld	ra,8(sp)
    80206c18:	6402                	ld	s0,0(sp)
    80206c1a:	0141                	addi	sp,sp,16
    80206c1c:	8082                	ret

0000000080206c1e <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80206c1e:	1101                	addi	sp,sp,-32
    80206c20:	ec06                	sd	ra,24(sp)
    80206c22:	e822                	sd	s0,16(sp)
    80206c24:	e426                	sd	s1,8(sp)
    80206c26:	1000                	addi	s0,sp,32
    80206c28:	84aa                	mv	s1,a0
  int hart = cpuid();
    80206c2a:	ffffb097          	auipc	ra,0xffffb
    80206c2e:	e6a080e7          	jalr	-406(ra) # 80201a94 <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80206c32:	00d5151b          	slliw	a0,a0,0xd
    80206c36:	03f0c7b7          	lui	a5,0x3f0c
    80206c3a:	20178793          	addi	a5,a5,513 # 3f0c201 <BASE_ADDRESS-0x7c2f3dff>
    80206c3e:	07b2                	slli	a5,a5,0xc
    80206c40:	97aa                	add	a5,a5,a0
    80206c42:	c3c4                	sw	s1,4(a5)
  #endif
}
    80206c44:	60e2                	ld	ra,24(sp)
    80206c46:	6442                	ld	s0,16(sp)
    80206c48:	64a2                	ld	s1,8(sp)
    80206c4a:	6105                	addi	sp,sp,32
    80206c4c:	8082                	ret

0000000080206c4e <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80206c4e:	715d                	addi	sp,sp,-80
    80206c50:	e486                	sd	ra,72(sp)
    80206c52:	e0a2                	sd	s0,64(sp)
    80206c54:	fc26                	sd	s1,56(sp)
    80206c56:	f84a                	sd	s2,48(sp)
    80206c58:	f44e                	sd	s3,40(sp)
    80206c5a:	f052                	sd	s4,32(sp)
    80206c5c:	ec56                	sd	s5,24(sp)
    80206c5e:	e85a                	sd	s6,16(sp)
    80206c60:	0880                	addi	s0,sp,80
    80206c62:	8a2a                	mv	s4,a0
    80206c64:	892e                	mv	s2,a1
    80206c66:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80206c68:	0001b517          	auipc	a0,0x1b
    80206c6c:	14850513          	addi	a0,a0,328 # 80221db0 <cons>
    80206c70:	ffffa097          	auipc	ra,0xffffa
    80206c74:	a68080e7          	jalr	-1432(ra) # 802006d8 <acquire>
  for(i = 0; i < n; i++){
    80206c78:	05305f63          	blez	s3,80206cd6 <consolewrite+0x88>
    80206c7c:	4481                	li	s1,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80206c7e:	fbf40b13          	addi	s6,s0,-65
    80206c82:	5afd                	li	s5,-1
    80206c84:	4685                	li	a3,1
    80206c86:	864a                	mv	a2,s2
    80206c88:	85d2                	mv	a1,s4
    80206c8a:	855a                	mv	a0,s6
    80206c8c:	ffffc097          	auipc	ra,0xffffc
    80206c90:	9b8080e7          	jalr	-1608(ra) # 80202644 <either_copyin>
    80206c94:	01550e63          	beq	a0,s5,80206cb0 <consolewrite+0x62>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80206c98:	fbf44503          	lbu	a0,-65(s0)
    80206c9c:	4581                	li	a1,0
    80206c9e:	4601                	li	a2,0
    80206ca0:	4681                	li	a3,0
    80206ca2:	4885                	li	a7,1
    80206ca4:	00000073          	ecall
  for(i = 0; i < n; i++){
    80206ca8:	2485                	addiw	s1,s1,1
    80206caa:	0905                	addi	s2,s2,1
    80206cac:	fc999ce3          	bne	s3,s1,80206c84 <consolewrite+0x36>
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80206cb0:	0001b517          	auipc	a0,0x1b
    80206cb4:	10050513          	addi	a0,a0,256 # 80221db0 <cons>
    80206cb8:	ffffa097          	auipc	ra,0xffffa
    80206cbc:	a74080e7          	jalr	-1420(ra) # 8020072c <release>

  return i;
}
    80206cc0:	8526                	mv	a0,s1
    80206cc2:	60a6                	ld	ra,72(sp)
    80206cc4:	6406                	ld	s0,64(sp)
    80206cc6:	74e2                	ld	s1,56(sp)
    80206cc8:	7942                	ld	s2,48(sp)
    80206cca:	79a2                	ld	s3,40(sp)
    80206ccc:	7a02                	ld	s4,32(sp)
    80206cce:	6ae2                	ld	s5,24(sp)
    80206cd0:	6b42                	ld	s6,16(sp)
    80206cd2:	6161                	addi	sp,sp,80
    80206cd4:	8082                	ret
  for(i = 0; i < n; i++){
    80206cd6:	4481                	li	s1,0
    80206cd8:	bfe1                	j	80206cb0 <consolewrite+0x62>

0000000080206cda <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80206cda:	7175                	addi	sp,sp,-144
    80206cdc:	e506                	sd	ra,136(sp)
    80206cde:	e122                	sd	s0,128(sp)
    80206ce0:	fca6                	sd	s1,120(sp)
    80206ce2:	f8ca                	sd	s2,112(sp)
    80206ce4:	f4ce                	sd	s3,104(sp)
    80206ce6:	f0d2                	sd	s4,96(sp)
    80206ce8:	ecd6                	sd	s5,88(sp)
    80206cea:	e8da                	sd	s6,80(sp)
    80206cec:	e4de                	sd	s7,72(sp)
    80206cee:	e0e2                	sd	s8,64(sp)
    80206cf0:	fc66                	sd	s9,56(sp)
    80206cf2:	f86a                	sd	s10,48(sp)
    80206cf4:	f46e                	sd	s11,40(sp)
    80206cf6:	0900                	addi	s0,sp,144
    80206cf8:	f6a43c23          	sd	a0,-136(s0)
    80206cfc:	8aae                	mv	s5,a1
    80206cfe:	8a32                	mv	s4,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80206d00:	00060c1b          	sext.w	s8,a2
  acquire(&cons.lock);
    80206d04:	0001b517          	auipc	a0,0x1b
    80206d08:	0ac50513          	addi	a0,a0,172 # 80221db0 <cons>
    80206d0c:	ffffa097          	auipc	ra,0xffffa
    80206d10:	9cc080e7          	jalr	-1588(ra) # 802006d8 <acquire>
  while(n > 0){
    80206d14:	09405863          	blez	s4,80206da4 <consoleread+0xca>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80206d18:	0001b497          	auipc	s1,0x1b
    80206d1c:	09848493          	addi	s1,s1,152 # 80221db0 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80206d20:	89a6                	mv	s3,s1
    80206d22:	0001b917          	auipc	s2,0x1b
    80206d26:	12690913          	addi	s2,s2,294 # 80221e48 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80206d2a:	4b91                	li	s7,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206d2c:	f8f40d13          	addi	s10,s0,-113
    80206d30:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80206d32:	4da9                	li	s11,10
    while(cons.r == cons.w){
    80206d34:	0984a783          	lw	a5,152(s1)
    80206d38:	09c4a703          	lw	a4,156(s1)
    80206d3c:	02f71463          	bne	a4,a5,80206d64 <consoleread+0x8a>
      if(myproc()->killed){
    80206d40:	ffffb097          	auipc	ra,0xffffb
    80206d44:	d80080e7          	jalr	-640(ra) # 80201ac0 <myproc>
    80206d48:	591c                	lw	a5,48(a0)
    80206d4a:	eba5                	bnez	a5,80206dba <consoleread+0xe0>
      sleep(&cons.r, &cons.lock);
    80206d4c:	85ce                	mv	a1,s3
    80206d4e:	854a                	mv	a0,s2
    80206d50:	ffffb097          	auipc	ra,0xffffb
    80206d54:	660080e7          	jalr	1632(ra) # 802023b0 <sleep>
    while(cons.r == cons.w){
    80206d58:	0984a783          	lw	a5,152(s1)
    80206d5c:	09c4a703          	lw	a4,156(s1)
    80206d60:	fef700e3          	beq	a4,a5,80206d40 <consoleread+0x66>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80206d64:	0017871b          	addiw	a4,a5,1
    80206d68:	08e4ac23          	sw	a4,152(s1)
    80206d6c:	07f7f713          	andi	a4,a5,127
    80206d70:	9726                	add	a4,a4,s1
    80206d72:	01874703          	lbu	a4,24(a4)
    80206d76:	00070b1b          	sext.w	s6,a4
    if(c == C('D')){  // end-of-file
    80206d7a:	077b0863          	beq	s6,s7,80206dea <consoleread+0x110>
    cbuf = c;
    80206d7e:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206d82:	4685                	li	a3,1
    80206d84:	866a                	mv	a2,s10
    80206d86:	85d6                	mv	a1,s5
    80206d88:	f7843503          	ld	a0,-136(s0)
    80206d8c:	ffffc097          	auipc	ra,0xffffc
    80206d90:	882080e7          	jalr	-1918(ra) # 8020260e <either_copyout>
    80206d94:	01950863          	beq	a0,s9,80206da4 <consoleread+0xca>
    dst++;
    80206d98:	0a85                	addi	s5,s5,1
    --n;
    80206d9a:	3a7d                	addiw	s4,s4,-1
    if(c == '\n'){
    80206d9c:	01bb0463          	beq	s6,s11,80206da4 <consoleread+0xca>
  while(n > 0){
    80206da0:	f80a1ae3          	bnez	s4,80206d34 <consoleread+0x5a>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80206da4:	0001b517          	auipc	a0,0x1b
    80206da8:	00c50513          	addi	a0,a0,12 # 80221db0 <cons>
    80206dac:	ffffa097          	auipc	ra,0xffffa
    80206db0:	980080e7          	jalr	-1664(ra) # 8020072c <release>

  return target - n;
    80206db4:	414c053b          	subw	a0,s8,s4
    80206db8:	a811                	j	80206dcc <consoleread+0xf2>
        release(&cons.lock);
    80206dba:	0001b517          	auipc	a0,0x1b
    80206dbe:	ff650513          	addi	a0,a0,-10 # 80221db0 <cons>
    80206dc2:	ffffa097          	auipc	ra,0xffffa
    80206dc6:	96a080e7          	jalr	-1686(ra) # 8020072c <release>
        return -1;
    80206dca:	557d                	li	a0,-1
}
    80206dcc:	60aa                	ld	ra,136(sp)
    80206dce:	640a                	ld	s0,128(sp)
    80206dd0:	74e6                	ld	s1,120(sp)
    80206dd2:	7946                	ld	s2,112(sp)
    80206dd4:	79a6                	ld	s3,104(sp)
    80206dd6:	7a06                	ld	s4,96(sp)
    80206dd8:	6ae6                	ld	s5,88(sp)
    80206dda:	6b46                	ld	s6,80(sp)
    80206ddc:	6ba6                	ld	s7,72(sp)
    80206dde:	6c06                	ld	s8,64(sp)
    80206de0:	7ce2                	ld	s9,56(sp)
    80206de2:	7d42                	ld	s10,48(sp)
    80206de4:	7da2                	ld	s11,40(sp)
    80206de6:	6149                	addi	sp,sp,144
    80206de8:	8082                	ret
      if(n < target){
    80206dea:	000a071b          	sext.w	a4,s4
    80206dee:	fb877be3          	bleu	s8,a4,80206da4 <consoleread+0xca>
        cons.r--;
    80206df2:	0001b717          	auipc	a4,0x1b
    80206df6:	04f72b23          	sw	a5,86(a4) # 80221e48 <cons+0x98>
    80206dfa:	b76d                	j	80206da4 <consoleread+0xca>

0000000080206dfc <consputc>:
void consputc(int c) {
    80206dfc:	1141                	addi	sp,sp,-16
    80206dfe:	e422                	sd	s0,8(sp)
    80206e00:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80206e02:	10000793          	li	a5,256
    80206e06:	00f50b63          	beq	a0,a5,80206e1c <consputc+0x20>
    80206e0a:	4581                	li	a1,0
    80206e0c:	4601                	li	a2,0
    80206e0e:	4681                	li	a3,0
    80206e10:	4885                	li	a7,1
    80206e12:	00000073          	ecall
}
    80206e16:	6422                	ld	s0,8(sp)
    80206e18:	0141                	addi	sp,sp,16
    80206e1a:	8082                	ret
    80206e1c:	4521                	li	a0,8
    80206e1e:	4581                	li	a1,0
    80206e20:	4601                	li	a2,0
    80206e22:	4681                	li	a3,0
    80206e24:	4885                	li	a7,1
    80206e26:	00000073          	ecall
    80206e2a:	02000513          	li	a0,32
    80206e2e:	00000073          	ecall
    80206e32:	4521                	li	a0,8
    80206e34:	00000073          	ecall
    80206e38:	bff9                	j	80206e16 <consputc+0x1a>

0000000080206e3a <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    80206e3a:	1101                	addi	sp,sp,-32
    80206e3c:	ec06                	sd	ra,24(sp)
    80206e3e:	e822                	sd	s0,16(sp)
    80206e40:	e426                	sd	s1,8(sp)
    80206e42:	e04a                	sd	s2,0(sp)
    80206e44:	1000                	addi	s0,sp,32
    80206e46:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    80206e48:	0001b517          	auipc	a0,0x1b
    80206e4c:	f6850513          	addi	a0,a0,-152 # 80221db0 <cons>
    80206e50:	ffffa097          	auipc	ra,0xffffa
    80206e54:	888080e7          	jalr	-1912(ra) # 802006d8 <acquire>

  switch(c){
    80206e58:	47c1                	li	a5,16
    80206e5a:	12f48463          	beq	s1,a5,80206f82 <consoleintr+0x148>
    80206e5e:	0297df63          	ble	s1,a5,80206e9c <consoleintr+0x62>
    80206e62:	47d5                	li	a5,21
    80206e64:	0af48863          	beq	s1,a5,80206f14 <consoleintr+0xda>
    80206e68:	07f00793          	li	a5,127
    80206e6c:	02f49b63          	bne	s1,a5,80206ea2 <consoleintr+0x68>
      consputc(BACKSPACE);
    }
    break;
  case C('H'): // Backspace
  case '\x7f':
    if(cons.e != cons.w){
    80206e70:	0001b717          	auipc	a4,0x1b
    80206e74:	f4070713          	addi	a4,a4,-192 # 80221db0 <cons>
    80206e78:	0a072783          	lw	a5,160(a4)
    80206e7c:	09c72703          	lw	a4,156(a4)
    80206e80:	10f70563          	beq	a4,a5,80206f8a <consoleintr+0x150>
      cons.e--;
    80206e84:	37fd                	addiw	a5,a5,-1
    80206e86:	0001b717          	auipc	a4,0x1b
    80206e8a:	fcf72523          	sw	a5,-54(a4) # 80221e50 <cons+0xa0>
      consputc(BACKSPACE);
    80206e8e:	10000513          	li	a0,256
    80206e92:	00000097          	auipc	ra,0x0
    80206e96:	f6a080e7          	jalr	-150(ra) # 80206dfc <consputc>
    80206e9a:	a8c5                	j	80206f8a <consoleintr+0x150>
  switch(c){
    80206e9c:	47a1                	li	a5,8
    80206e9e:	fcf489e3          	beq	s1,a5,80206e70 <consoleintr+0x36>
    }
    break;
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    80206ea2:	c4e5                	beqz	s1,80206f8a <consoleintr+0x150>
    80206ea4:	0001b717          	auipc	a4,0x1b
    80206ea8:	f0c70713          	addi	a4,a4,-244 # 80221db0 <cons>
    80206eac:	0a072783          	lw	a5,160(a4)
    80206eb0:	09872703          	lw	a4,152(a4)
    80206eb4:	9f99                	subw	a5,a5,a4
    80206eb6:	07f00713          	li	a4,127
    80206eba:	0cf76863          	bltu	a4,a5,80206f8a <consoleintr+0x150>
      #ifndef QEMU
      if (c == '\r') break;     // on k210, "enter" will input \n and \r
      #else
      c = (c == '\r') ? '\n' : c;
    80206ebe:	47b5                	li	a5,13
    80206ec0:	0ef48363          	beq	s1,a5,80206fa6 <consoleintr+0x16c>
      #endif
      // echo back to the user.
      consputc(c);
    80206ec4:	8526                	mv	a0,s1
    80206ec6:	00000097          	auipc	ra,0x0
    80206eca:	f36080e7          	jalr	-202(ra) # 80206dfc <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206ece:	0001b797          	auipc	a5,0x1b
    80206ed2:	ee278793          	addi	a5,a5,-286 # 80221db0 <cons>
    80206ed6:	0a07a703          	lw	a4,160(a5)
    80206eda:	0017069b          	addiw	a3,a4,1
    80206ede:	0006861b          	sext.w	a2,a3
    80206ee2:	0ad7a023          	sw	a3,160(a5)
    80206ee6:	07f77713          	andi	a4,a4,127
    80206eea:	97ba                	add	a5,a5,a4
    80206eec:	00978c23          	sb	s1,24(a5)

      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    80206ef0:	47a9                	li	a5,10
    80206ef2:	0ef48163          	beq	s1,a5,80206fd4 <consoleintr+0x19a>
    80206ef6:	4791                	li	a5,4
    80206ef8:	0cf48e63          	beq	s1,a5,80206fd4 <consoleintr+0x19a>
    80206efc:	0001b797          	auipc	a5,0x1b
    80206f00:	eb478793          	addi	a5,a5,-332 # 80221db0 <cons>
    80206f04:	0987a783          	lw	a5,152(a5)
    80206f08:	0807879b          	addiw	a5,a5,128
    80206f0c:	06f61f63          	bne	a2,a5,80206f8a <consoleintr+0x150>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206f10:	863e                	mv	a2,a5
    80206f12:	a0c9                	j	80206fd4 <consoleintr+0x19a>
    while(cons.e != cons.w &&
    80206f14:	0001b717          	auipc	a4,0x1b
    80206f18:	e9c70713          	addi	a4,a4,-356 # 80221db0 <cons>
    80206f1c:	0a072783          	lw	a5,160(a4)
    80206f20:	09c72703          	lw	a4,156(a4)
    80206f24:	06f70363          	beq	a4,a5,80206f8a <consoleintr+0x150>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80206f28:	37fd                	addiw	a5,a5,-1
    80206f2a:	0007871b          	sext.w	a4,a5
    80206f2e:	07f7f793          	andi	a5,a5,127
    80206f32:	0001b697          	auipc	a3,0x1b
    80206f36:	e7e68693          	addi	a3,a3,-386 # 80221db0 <cons>
    80206f3a:	97b6                	add	a5,a5,a3
    while(cons.e != cons.w &&
    80206f3c:	0187c683          	lbu	a3,24(a5)
    80206f40:	47a9                	li	a5,10
      cons.e--;
    80206f42:	0001b497          	auipc	s1,0x1b
    80206f46:	e6e48493          	addi	s1,s1,-402 # 80221db0 <cons>
    while(cons.e != cons.w &&
    80206f4a:	4929                	li	s2,10
    80206f4c:	02f68f63          	beq	a3,a5,80206f8a <consoleintr+0x150>
      cons.e--;
    80206f50:	0ae4a023          	sw	a4,160(s1)
      consputc(BACKSPACE);
    80206f54:	10000513          	li	a0,256
    80206f58:	00000097          	auipc	ra,0x0
    80206f5c:	ea4080e7          	jalr	-348(ra) # 80206dfc <consputc>
    while(cons.e != cons.w &&
    80206f60:	0a04a783          	lw	a5,160(s1)
    80206f64:	09c4a703          	lw	a4,156(s1)
    80206f68:	02f70163          	beq	a4,a5,80206f8a <consoleintr+0x150>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80206f6c:	37fd                	addiw	a5,a5,-1
    80206f6e:	0007871b          	sext.w	a4,a5
    80206f72:	07f7f793          	andi	a5,a5,127
    80206f76:	97a6                	add	a5,a5,s1
    while(cons.e != cons.w &&
    80206f78:	0187c783          	lbu	a5,24(a5)
    80206f7c:	fd279ae3          	bne	a5,s2,80206f50 <consoleintr+0x116>
    80206f80:	a029                	j	80206f8a <consoleintr+0x150>
    procdump();
    80206f82:	ffffb097          	auipc	ra,0xffffb
    80206f86:	6f6080e7          	jalr	1782(ra) # 80202678 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    80206f8a:	0001b517          	auipc	a0,0x1b
    80206f8e:	e2650513          	addi	a0,a0,-474 # 80221db0 <cons>
    80206f92:	ffff9097          	auipc	ra,0xffff9
    80206f96:	79a080e7          	jalr	1946(ra) # 8020072c <release>
}
    80206f9a:	60e2                	ld	ra,24(sp)
    80206f9c:	6442                	ld	s0,16(sp)
    80206f9e:	64a2                	ld	s1,8(sp)
    80206fa0:	6902                	ld	s2,0(sp)
    80206fa2:	6105                	addi	sp,sp,32
    80206fa4:	8082                	ret
      consputc(c);
    80206fa6:	4529                	li	a0,10
    80206fa8:	00000097          	auipc	ra,0x0
    80206fac:	e54080e7          	jalr	-428(ra) # 80206dfc <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80206fb0:	0001b797          	auipc	a5,0x1b
    80206fb4:	e0078793          	addi	a5,a5,-512 # 80221db0 <cons>
    80206fb8:	0a07a703          	lw	a4,160(a5)
    80206fbc:	0017069b          	addiw	a3,a4,1
    80206fc0:	0006861b          	sext.w	a2,a3
    80206fc4:	0ad7a023          	sw	a3,160(a5)
    80206fc8:	07f77713          	andi	a4,a4,127
    80206fcc:	97ba                	add	a5,a5,a4
    80206fce:	4729                	li	a4,10
    80206fd0:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    80206fd4:	0001b797          	auipc	a5,0x1b
    80206fd8:	e6c7ac23          	sw	a2,-392(a5) # 80221e4c <cons+0x9c>
        wakeup(&cons.r);
    80206fdc:	0001b517          	auipc	a0,0x1b
    80206fe0:	e6c50513          	addi	a0,a0,-404 # 80221e48 <cons+0x98>
    80206fe4:	ffffb097          	auipc	ra,0xffffb
    80206fe8:	54e080e7          	jalr	1358(ra) # 80202532 <wakeup>
    80206fec:	bf79                	j	80206f8a <consoleintr+0x150>

0000000080206fee <consoleinit>:

void
consoleinit(void)
{
    80206fee:	1101                	addi	sp,sp,-32
    80206ff0:	ec06                	sd	ra,24(sp)
    80206ff2:	e822                	sd	s0,16(sp)
    80206ff4:	e426                	sd	s1,8(sp)
    80206ff6:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    80206ff8:	0001b497          	auipc	s1,0x1b
    80206ffc:	db848493          	addi	s1,s1,-584 # 80221db0 <cons>
    80207000:	00003597          	auipc	a1,0x3
    80207004:	cf058593          	addi	a1,a1,-784 # 80209cf0 <etext+0xcf0>
    80207008:	8526                	mv	a0,s1
    8020700a:	ffff9097          	auipc	ra,0xffff9
    8020700e:	68a080e7          	jalr	1674(ra) # 80200694 <initlock>

  cons.e = cons.w = cons.r = 0;
    80207012:	0804ac23          	sw	zero,152(s1)
    80207016:	0804ae23          	sw	zero,156(s1)
    8020701a:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    8020701e:	00003797          	auipc	a5,0x3
    80207022:	2727b783          	ld	a5,626(a5) # 8020a290 <_GLOBAL_OFFSET_TABLE_+0x58>
    80207026:	00000717          	auipc	a4,0x0
    8020702a:	cb470713          	addi	a4,a4,-844 # 80206cda <consoleread>
    8020702e:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207030:	00000717          	auipc	a4,0x0
    80207034:	c1e70713          	addi	a4,a4,-994 # 80206c4e <consolewrite>
    80207038:	ef98                	sd	a4,24(a5)
}
    8020703a:	60e2                	ld	ra,24(sp)
    8020703c:	6442                	ld	s0,16(sp)
    8020703e:	64a2                	ld	s1,8(sp)
    80207040:	6105                	addi	sp,sp,32
    80207042:	8082                	ret

0000000080207044 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80207044:	1141                	addi	sp,sp,-16
    80207046:	e406                	sd	ra,8(sp)
    80207048:	e022                	sd	s0,0(sp)
    8020704a:	0800                	addi	s0,sp,16
  if(i >= NUM)
    8020704c:	479d                	li	a5,7
    8020704e:	04a7cd63          	blt	a5,a0,802070a8 <free_desc+0x64>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80207052:	0001b797          	auipc	a5,0x1b
    80207056:	fae78793          	addi	a5,a5,-82 # 80222000 <disk>
    8020705a:	00a78733          	add	a4,a5,a0
    8020705e:	6789                	lui	a5,0x2
    80207060:	97ba                	add	a5,a5,a4
    80207062:	0187c783          	lbu	a5,24(a5) # 2018 <BASE_ADDRESS-0x801fdfe8>
    80207066:	eba9                	bnez	a5,802070b8 <free_desc+0x74>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80207068:	0001d797          	auipc	a5,0x1d
    8020706c:	f9878793          	addi	a5,a5,-104 # 80224000 <disk+0x2000>
    80207070:	639c                	ld	a5,0(a5)
    80207072:	00451713          	slli	a4,a0,0x4
    80207076:	97ba                	add	a5,a5,a4
    80207078:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    8020707c:	0001b797          	auipc	a5,0x1b
    80207080:	f8478793          	addi	a5,a5,-124 # 80222000 <disk>
    80207084:	97aa                	add	a5,a5,a0
    80207086:	6509                	lui	a0,0x2
    80207088:	953e                	add	a0,a0,a5
    8020708a:	4785                	li	a5,1
    8020708c:	00f50c23          	sb	a5,24(a0) # 2018 <BASE_ADDRESS-0x801fdfe8>
  wakeup(&disk.free[0]);
    80207090:	0001d517          	auipc	a0,0x1d
    80207094:	f8850513          	addi	a0,a0,-120 # 80224018 <disk+0x2018>
    80207098:	ffffb097          	auipc	ra,0xffffb
    8020709c:	49a080e7          	jalr	1178(ra) # 80202532 <wakeup>
}
    802070a0:	60a2                	ld	ra,8(sp)
    802070a2:	6402                	ld	s0,0(sp)
    802070a4:	0141                	addi	sp,sp,16
    802070a6:	8082                	ret
    panic("virtio_disk_intr 1");
    802070a8:	00003517          	auipc	a0,0x3
    802070ac:	cc050513          	addi	a0,a0,-832 # 80209d68 <etext+0xd68>
    802070b0:	ffff9097          	auipc	ra,0xffff9
    802070b4:	096080e7          	jalr	150(ra) # 80200146 <panic>
    panic("virtio_disk_intr 2");
    802070b8:	00003517          	auipc	a0,0x3
    802070bc:	cc850513          	addi	a0,a0,-824 # 80209d80 <etext+0xd80>
    802070c0:	ffff9097          	auipc	ra,0xffff9
    802070c4:	086080e7          	jalr	134(ra) # 80200146 <panic>

00000000802070c8 <virtio_disk_init>:
{
    802070c8:	1141                	addi	sp,sp,-16
    802070ca:	e406                	sd	ra,8(sp)
    802070cc:	e022                	sd	s0,0(sp)
    802070ce:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    802070d0:	00003597          	auipc	a1,0x3
    802070d4:	cc858593          	addi	a1,a1,-824 # 80209d98 <etext+0xd98>
    802070d8:	0001d517          	auipc	a0,0x1d
    802070dc:	fd050513          	addi	a0,a0,-48 # 802240a8 <disk+0x20a8>
    802070e0:	ffff9097          	auipc	ra,0xffff9
    802070e4:	5b4080e7          	jalr	1460(ra) # 80200694 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802070e8:	03f107b7          	lui	a5,0x3f10
    802070ec:	0785                	addi	a5,a5,1
    802070ee:	07b2                	slli	a5,a5,0xc
    802070f0:	4398                	lw	a4,0(a5)
    802070f2:	2701                	sext.w	a4,a4
    802070f4:	747277b7          	lui	a5,0x74727
    802070f8:	97678793          	addi	a5,a5,-1674 # 74726976 <BASE_ADDRESS-0xbad968a>
    802070fc:	12f71d63          	bne	a4,a5,80207236 <virtio_disk_init+0x16e>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207100:	00003797          	auipc	a5,0x3
    80207104:	bf878793          	addi	a5,a5,-1032 # 80209cf8 <etext+0xcf8>
    80207108:	639c                	ld	a5,0(a5)
    8020710a:	439c                	lw	a5,0(a5)
    8020710c:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    8020710e:	4705                	li	a4,1
    80207110:	12e79363          	bne	a5,a4,80207236 <virtio_disk_init+0x16e>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207114:	00003797          	auipc	a5,0x3
    80207118:	bec78793          	addi	a5,a5,-1044 # 80209d00 <etext+0xd00>
    8020711c:	639c                	ld	a5,0(a5)
    8020711e:	439c                	lw	a5,0(a5)
    80207120:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    80207122:	4709                	li	a4,2
    80207124:	10e79963          	bne	a5,a4,80207236 <virtio_disk_init+0x16e>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207128:	00003797          	auipc	a5,0x3
    8020712c:	be078793          	addi	a5,a5,-1056 # 80209d08 <etext+0xd08>
    80207130:	639c                	ld	a5,0(a5)
    80207132:	4398                	lw	a4,0(a5)
    80207134:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207136:	554d47b7          	lui	a5,0x554d4
    8020713a:	55178793          	addi	a5,a5,1361 # 554d4551 <BASE_ADDRESS-0x2ad2baaf>
    8020713e:	0ef71c63          	bne	a4,a5,80207236 <virtio_disk_init+0x16e>
  *R(VIRTIO_MMIO_STATUS) = status;
    80207142:	00003797          	auipc	a5,0x3
    80207146:	bce78793          	addi	a5,a5,-1074 # 80209d10 <etext+0xd10>
    8020714a:	6398                	ld	a4,0(a5)
    8020714c:	4785                	li	a5,1
    8020714e:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207150:	478d                	li	a5,3
    80207152:	c31c                	sw	a5,0(a4)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    80207154:	00003797          	auipc	a5,0x3
    80207158:	bc478793          	addi	a5,a5,-1084 # 80209d18 <etext+0xd18>
    8020715c:	639c                	ld	a5,0(a5)
    8020715e:	4394                	lw	a3,0(a5)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80207160:	c7ffe7b7          	lui	a5,0xc7ffe
    80207164:	75f78793          	addi	a5,a5,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd975f>
    80207168:	8ff5                	and	a5,a5,a3
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    8020716a:	2781                	sext.w	a5,a5
    8020716c:	00003697          	auipc	a3,0x3
    80207170:	bb468693          	addi	a3,a3,-1100 # 80209d20 <etext+0xd20>
    80207174:	6294                	ld	a3,0(a3)
    80207176:	c29c                	sw	a5,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207178:	47ad                	li	a5,11
    8020717a:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020717c:	47bd                	li	a5,15
    8020717e:	c31c                	sw	a5,0(a4)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207180:	00003797          	auipc	a5,0x3
    80207184:	ba878793          	addi	a5,a5,-1112 # 80209d28 <etext+0xd28>
    80207188:	639c                	ld	a5,0(a5)
    8020718a:	6705                	lui	a4,0x1
    8020718c:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    8020718e:	00003797          	auipc	a5,0x3
    80207192:	ba278793          	addi	a5,a5,-1118 # 80209d30 <etext+0xd30>
    80207196:	639c                	ld	a5,0(a5)
    80207198:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    8020719c:	00003797          	auipc	a5,0x3
    802071a0:	b9c78793          	addi	a5,a5,-1124 # 80209d38 <etext+0xd38>
    802071a4:	639c                	ld	a5,0(a5)
    802071a6:	439c                	lw	a5,0(a5)
    802071a8:	2781                	sext.w	a5,a5
  if(max == 0)
    802071aa:	cfd1                	beqz	a5,80207246 <virtio_disk_init+0x17e>
  if(max < NUM)
    802071ac:	471d                	li	a4,7
    802071ae:	0af77463          	bleu	a5,a4,80207256 <virtio_disk_init+0x18e>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    802071b2:	00003797          	auipc	a5,0x3
    802071b6:	b8e78793          	addi	a5,a5,-1138 # 80209d40 <etext+0xd40>
    802071ba:	639c                	ld	a5,0(a5)
    802071bc:	4721                	li	a4,8
    802071be:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    802071c0:	6609                	lui	a2,0x2
    802071c2:	4581                	li	a1,0
    802071c4:	0001b517          	auipc	a0,0x1b
    802071c8:	e3c50513          	addi	a0,a0,-452 # 80222000 <disk>
    802071cc:	ffff9097          	auipc	ra,0xffff9
    802071d0:	5a8080e7          	jalr	1448(ra) # 80200774 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    802071d4:	0001b717          	auipc	a4,0x1b
    802071d8:	e2c70713          	addi	a4,a4,-468 # 80222000 <disk>
    802071dc:	00c75793          	srli	a5,a4,0xc
    802071e0:	2781                	sext.w	a5,a5
    802071e2:	00003697          	auipc	a3,0x3
    802071e6:	b6668693          	addi	a3,a3,-1178 # 80209d48 <etext+0xd48>
    802071ea:	6294                	ld	a3,0(a3)
    802071ec:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    802071ee:	0001d797          	auipc	a5,0x1d
    802071f2:	e1278793          	addi	a5,a5,-494 # 80224000 <disk+0x2000>
    802071f6:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    802071f8:	0001b717          	auipc	a4,0x1b
    802071fc:	e8870713          	addi	a4,a4,-376 # 80222080 <disk+0x80>
    80207200:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    80207202:	0001c717          	auipc	a4,0x1c
    80207206:	dfe70713          	addi	a4,a4,-514 # 80223000 <disk+0x1000>
    8020720a:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    8020720c:	4705                	li	a4,1
    8020720e:	00e78c23          	sb	a4,24(a5)
    80207212:	00e78ca3          	sb	a4,25(a5)
    80207216:	00e78d23          	sb	a4,26(a5)
    8020721a:	00e78da3          	sb	a4,27(a5)
    8020721e:	00e78e23          	sb	a4,28(a5)
    80207222:	00e78ea3          	sb	a4,29(a5)
    80207226:	00e78f23          	sb	a4,30(a5)
    8020722a:	00e78fa3          	sb	a4,31(a5)
}
    8020722e:	60a2                	ld	ra,8(sp)
    80207230:	6402                	ld	s0,0(sp)
    80207232:	0141                	addi	sp,sp,16
    80207234:	8082                	ret
    panic("could not find virtio disk");
    80207236:	00003517          	auipc	a0,0x3
    8020723a:	b7250513          	addi	a0,a0,-1166 # 80209da8 <etext+0xda8>
    8020723e:	ffff9097          	auipc	ra,0xffff9
    80207242:	f08080e7          	jalr	-248(ra) # 80200146 <panic>
    panic("virtio disk has no queue 0");
    80207246:	00003517          	auipc	a0,0x3
    8020724a:	b8250513          	addi	a0,a0,-1150 # 80209dc8 <etext+0xdc8>
    8020724e:	ffff9097          	auipc	ra,0xffff9
    80207252:	ef8080e7          	jalr	-264(ra) # 80200146 <panic>
    panic("virtio disk max queue too short");
    80207256:	00003517          	auipc	a0,0x3
    8020725a:	b9250513          	addi	a0,a0,-1134 # 80209de8 <etext+0xde8>
    8020725e:	ffff9097          	auipc	ra,0xffff9
    80207262:	ee8080e7          	jalr	-280(ra) # 80200146 <panic>

0000000080207266 <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    80207266:	7159                	addi	sp,sp,-112
    80207268:	f486                	sd	ra,104(sp)
    8020726a:	f0a2                	sd	s0,96(sp)
    8020726c:	eca6                	sd	s1,88(sp)
    8020726e:	e8ca                	sd	s2,80(sp)
    80207270:	e4ce                	sd	s3,72(sp)
    80207272:	e0d2                	sd	s4,64(sp)
    80207274:	fc56                	sd	s5,56(sp)
    80207276:	f85a                	sd	s6,48(sp)
    80207278:	f45e                	sd	s7,40(sp)
    8020727a:	f062                	sd	s8,32(sp)
    8020727c:	1880                	addi	s0,sp,112
    8020727e:	892a                	mv	s2,a0
    80207280:	8bae                	mv	s7,a1
  uint64 sector = b->sectorno;
    80207282:	00c56c03          	lwu	s8,12(a0)

  acquire(&disk.vdisk_lock);
    80207286:	0001d517          	auipc	a0,0x1d
    8020728a:	e2250513          	addi	a0,a0,-478 # 802240a8 <disk+0x20a8>
    8020728e:	ffff9097          	auipc	ra,0xffff9
    80207292:	44a080e7          	jalr	1098(ra) # 802006d8 <acquire>
    if(disk.free[i]){
    80207296:	0001d997          	auipc	s3,0x1d
    8020729a:	d6a98993          	addi	s3,s3,-662 # 80224000 <disk+0x2000>
  for(int i = 0; i < NUM; i++){
    8020729e:	4b21                	li	s6,8
      disk.free[i] = 0;
    802072a0:	0001ba97          	auipc	s5,0x1b
    802072a4:	d60a8a93          	addi	s5,s5,-672 # 80222000 <disk>
  for(int i = 0; i < 3; i++){
    802072a8:	4a0d                	li	s4,3
    802072aa:	a079                	j	80207338 <virtio_disk_rw+0xd2>
      disk.free[i] = 0;
    802072ac:	00fa86b3          	add	a3,s5,a5
    802072b0:	96ae                	add	a3,a3,a1
    802072b2:	00068c23          	sb	zero,24(a3)
    idx[i] = alloc_desc();
    802072b6:	c21c                	sw	a5,0(a2)
    if(idx[i] < 0){
    802072b8:	0207ca63          	bltz	a5,802072ec <virtio_disk_rw+0x86>
  for(int i = 0; i < 3; i++){
    802072bc:	2485                	addiw	s1,s1,1
    802072be:	0711                	addi	a4,a4,4
    802072c0:	25448963          	beq	s1,s4,80207512 <virtio_disk_rw+0x2ac>
    idx[i] = alloc_desc();
    802072c4:	863a                	mv	a2,a4
    if(disk.free[i]){
    802072c6:	0189c783          	lbu	a5,24(s3)
    802072ca:	24079963          	bnez	a5,8020751c <virtio_disk_rw+0x2b6>
    802072ce:	0001d697          	auipc	a3,0x1d
    802072d2:	d4b68693          	addi	a3,a3,-693 # 80224019 <disk+0x2019>
  for(int i = 0; i < NUM; i++){
    802072d6:	87aa                	mv	a5,a0
    if(disk.free[i]){
    802072d8:	0006c803          	lbu	a6,0(a3)
    802072dc:	fc0818e3          	bnez	a6,802072ac <virtio_disk_rw+0x46>
  for(int i = 0; i < NUM; i++){
    802072e0:	2785                	addiw	a5,a5,1
    802072e2:	0685                	addi	a3,a3,1
    802072e4:	ff679ae3          	bne	a5,s6,802072d8 <virtio_disk_rw+0x72>
    idx[i] = alloc_desc();
    802072e8:	57fd                	li	a5,-1
    802072ea:	c21c                	sw	a5,0(a2)
      for(int j = 0; j < i; j++)
    802072ec:	02905a63          	blez	s1,80207320 <virtio_disk_rw+0xba>
        free_desc(idx[j]);
    802072f0:	fa042503          	lw	a0,-96(s0)
    802072f4:	00000097          	auipc	ra,0x0
    802072f8:	d50080e7          	jalr	-688(ra) # 80207044 <free_desc>
      for(int j = 0; j < i; j++)
    802072fc:	4785                	li	a5,1
    802072fe:	0297d163          	ble	s1,a5,80207320 <virtio_disk_rw+0xba>
        free_desc(idx[j]);
    80207302:	fa442503          	lw	a0,-92(s0)
    80207306:	00000097          	auipc	ra,0x0
    8020730a:	d3e080e7          	jalr	-706(ra) # 80207044 <free_desc>
      for(int j = 0; j < i; j++)
    8020730e:	4789                	li	a5,2
    80207310:	0097d863          	ble	s1,a5,80207320 <virtio_disk_rw+0xba>
        free_desc(idx[j]);
    80207314:	fa842503          	lw	a0,-88(s0)
    80207318:	00000097          	auipc	ra,0x0
    8020731c:	d2c080e7          	jalr	-724(ra) # 80207044 <free_desc>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207320:	0001d597          	auipc	a1,0x1d
    80207324:	d8858593          	addi	a1,a1,-632 # 802240a8 <disk+0x20a8>
    80207328:	0001d517          	auipc	a0,0x1d
    8020732c:	cf050513          	addi	a0,a0,-784 # 80224018 <disk+0x2018>
    80207330:	ffffb097          	auipc	ra,0xffffb
    80207334:	080080e7          	jalr	128(ra) # 802023b0 <sleep>
  for(int i = 0; i < 3; i++){
    80207338:	fa040713          	addi	a4,s0,-96
    8020733c:	4481                	li	s1,0
  for(int i = 0; i < NUM; i++){
    8020733e:	4505                	li	a0,1
      disk.free[i] = 0;
    80207340:	6589                	lui	a1,0x2
    80207342:	b749                	j	802072c4 <virtio_disk_rw+0x5e>
    uint32 reserved;
    uint64 sector;
  } buf0;

  if(write)
    buf0.type = VIRTIO_BLK_T_OUT; // write the disk
    80207344:	4785                	li	a5,1
    80207346:	f8f42823          	sw	a5,-112(s0)
  else
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
  buf0.reserved = 0;
    8020734a:	f8042a23          	sw	zero,-108(s0)
  buf0.sector = sector;
    8020734e:	f9843c23          	sd	s8,-104(s0)

  // buf0 is on a kernel stack, which is not direct mapped,
  // thus the call to kvmpa().
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207352:	ffffa097          	auipc	ra,0xffffa
    80207356:	76e080e7          	jalr	1902(ra) # 80201ac0 <myproc>
    8020735a:	fa042983          	lw	s3,-96(s0)
    8020735e:	00499493          	slli	s1,s3,0x4
    80207362:	0001da17          	auipc	s4,0x1d
    80207366:	c9ea0a13          	addi	s4,s4,-866 # 80224000 <disk+0x2000>
    8020736a:	000a3a83          	ld	s5,0(s4)
    8020736e:	9aa6                	add	s5,s5,s1
    80207370:	f9040593          	addi	a1,s0,-112
    80207374:	6d28                	ld	a0,88(a0)
    80207376:	ffffa097          	auipc	ra,0xffffa
    8020737a:	8ca080e7          	jalr	-1846(ra) # 80200c40 <kwalkaddr>
    8020737e:	00aab023          	sd	a0,0(s5)
  disk.desc[idx[0]].len = sizeof(buf0);
    80207382:	000a3783          	ld	a5,0(s4)
    80207386:	97a6                	add	a5,a5,s1
    80207388:	4741                	li	a4,16
    8020738a:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    8020738c:	000a3783          	ld	a5,0(s4)
    80207390:	97a6                	add	a5,a5,s1
    80207392:	4705                	li	a4,1
    80207394:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    80207398:	fa442703          	lw	a4,-92(s0)
    8020739c:	000a3783          	ld	a5,0(s4)
    802073a0:	97a6                	add	a5,a5,s1
    802073a2:	00e79723          	sh	a4,14(a5)

  disk.desc[idx[1]].addr = (uint64) b->data;
    802073a6:	0712                	slli	a4,a4,0x4
    802073a8:	000a3783          	ld	a5,0(s4)
    802073ac:	97ba                	add	a5,a5,a4
    802073ae:	05890693          	addi	a3,s2,88
    802073b2:	e394                	sd	a3,0(a5)
  disk.desc[idx[1]].len = BSIZE;
    802073b4:	000a3783          	ld	a5,0(s4)
    802073b8:	97ba                	add	a5,a5,a4
    802073ba:	20000693          	li	a3,512
    802073be:	c794                	sw	a3,8(a5)
  if(write)
    802073c0:	100b8b63          	beqz	s7,802074d6 <virtio_disk_rw+0x270>
    disk.desc[idx[1]].flags = 0; // device reads b->data
    802073c4:	000a3783          	ld	a5,0(s4)
    802073c8:	97ba                	add	a5,a5,a4
    802073ca:	00079623          	sh	zero,12(a5)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    802073ce:	0001b517          	auipc	a0,0x1b
    802073d2:	c3250513          	addi	a0,a0,-974 # 80222000 <disk>
    802073d6:	0001d797          	auipc	a5,0x1d
    802073da:	c2a78793          	addi	a5,a5,-982 # 80224000 <disk+0x2000>
    802073de:	6394                	ld	a3,0(a5)
    802073e0:	96ba                	add	a3,a3,a4
    802073e2:	00c6d603          	lhu	a2,12(a3)
    802073e6:	00166613          	ori	a2,a2,1
    802073ea:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    802073ee:	fa842683          	lw	a3,-88(s0)
    802073f2:	6390                	ld	a2,0(a5)
    802073f4:	9732                	add	a4,a4,a2
    802073f6:	00d71723          	sh	a3,14(a4)

  disk.info[idx[0]].status = 0;
    802073fa:	20098613          	addi	a2,s3,512
    802073fe:	0612                	slli	a2,a2,0x4
    80207400:	962a                	add	a2,a2,a0
    80207402:	02060823          	sb	zero,48(a2) # 2030 <BASE_ADDRESS-0x801fdfd0>
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    80207406:	00469713          	slli	a4,a3,0x4
    8020740a:	6394                	ld	a3,0(a5)
    8020740c:	96ba                	add	a3,a3,a4
    8020740e:	6589                	lui	a1,0x2
    80207410:	03058593          	addi	a1,a1,48 # 2030 <BASE_ADDRESS-0x801fdfd0>
    80207414:	94ae                	add	s1,s1,a1
    80207416:	94aa                	add	s1,s1,a0
    80207418:	e284                	sd	s1,0(a3)
  disk.desc[idx[2]].len = 1;
    8020741a:	6394                	ld	a3,0(a5)
    8020741c:	96ba                	add	a3,a3,a4
    8020741e:	4585                	li	a1,1
    80207420:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207422:	6394                	ld	a3,0(a5)
    80207424:	96ba                	add	a3,a3,a4
    80207426:	4509                	li	a0,2
    80207428:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    8020742c:	6394                	ld	a3,0(a5)
    8020742e:	9736                	add	a4,a4,a3
    80207430:	00071723          	sh	zero,14(a4)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80207434:	00b92223          	sw	a1,4(s2)
  disk.info[idx[0]].b = b;
    80207438:	03263423          	sd	s2,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    8020743c:	6794                	ld	a3,8(a5)
    8020743e:	0026d703          	lhu	a4,2(a3)
    80207442:	8b1d                	andi	a4,a4,7
    80207444:	2709                	addiw	a4,a4,2
    80207446:	0706                	slli	a4,a4,0x1
    80207448:	9736                	add	a4,a4,a3
    8020744a:	01371023          	sh	s3,0(a4)
  __sync_synchronize();
    8020744e:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    80207452:	6798                	ld	a4,8(a5)
    80207454:	00275783          	lhu	a5,2(a4)
    80207458:	2785                	addiw	a5,a5,1
    8020745a:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8020745e:	00003797          	auipc	a5,0x3
    80207462:	8f278793          	addi	a5,a5,-1806 # 80209d50 <etext+0xd50>
    80207466:	639c                	ld	a5,0(a5)
    80207468:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8020746c:	00492703          	lw	a4,4(s2)
    80207470:	4785                	li	a5,1
    80207472:	02f71163          	bne	a4,a5,80207494 <virtio_disk_rw+0x22e>
    sleep(b, &disk.vdisk_lock);
    80207476:	0001d997          	auipc	s3,0x1d
    8020747a:	c3298993          	addi	s3,s3,-974 # 802240a8 <disk+0x20a8>
  while(b->disk == 1) {
    8020747e:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    80207480:	85ce                	mv	a1,s3
    80207482:	854a                	mv	a0,s2
    80207484:	ffffb097          	auipc	ra,0xffffb
    80207488:	f2c080e7          	jalr	-212(ra) # 802023b0 <sleep>
  while(b->disk == 1) {
    8020748c:	00492783          	lw	a5,4(s2)
    80207490:	fe9788e3          	beq	a5,s1,80207480 <virtio_disk_rw+0x21a>
  }

  disk.info[idx[0]].b = 0;
    80207494:	fa042483          	lw	s1,-96(s0)
    80207498:	20048793          	addi	a5,s1,512
    8020749c:	00479713          	slli	a4,a5,0x4
    802074a0:	0001b797          	auipc	a5,0x1b
    802074a4:	b6078793          	addi	a5,a5,-1184 # 80222000 <disk>
    802074a8:	97ba                	add	a5,a5,a4
    802074aa:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802074ae:	0001d917          	auipc	s2,0x1d
    802074b2:	b5290913          	addi	s2,s2,-1198 # 80224000 <disk+0x2000>
    free_desc(i);
    802074b6:	8526                	mv	a0,s1
    802074b8:	00000097          	auipc	ra,0x0
    802074bc:	b8c080e7          	jalr	-1140(ra) # 80207044 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    802074c0:	0492                	slli	s1,s1,0x4
    802074c2:	00093783          	ld	a5,0(s2)
    802074c6:	94be                	add	s1,s1,a5
    802074c8:	00c4d783          	lhu	a5,12(s1)
    802074cc:	8b85                	andi	a5,a5,1
    802074ce:	cf91                	beqz	a5,802074ea <virtio_disk_rw+0x284>
      i = disk.desc[i].next;
    802074d0:	00e4d483          	lhu	s1,14(s1)
  while(1){
    802074d4:	b7cd                	j	802074b6 <virtio_disk_rw+0x250>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    802074d6:	0001d797          	auipc	a5,0x1d
    802074da:	b2a78793          	addi	a5,a5,-1238 # 80224000 <disk+0x2000>
    802074de:	639c                	ld	a5,0(a5)
    802074e0:	97ba                	add	a5,a5,a4
    802074e2:	4689                	li	a3,2
    802074e4:	00d79623          	sh	a3,12(a5)
    802074e8:	b5dd                	j	802073ce <virtio_disk_rw+0x168>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    802074ea:	0001d517          	auipc	a0,0x1d
    802074ee:	bbe50513          	addi	a0,a0,-1090 # 802240a8 <disk+0x20a8>
    802074f2:	ffff9097          	auipc	ra,0xffff9
    802074f6:	23a080e7          	jalr	570(ra) # 8020072c <release>
}
    802074fa:	70a6                	ld	ra,104(sp)
    802074fc:	7406                	ld	s0,96(sp)
    802074fe:	64e6                	ld	s1,88(sp)
    80207500:	6946                	ld	s2,80(sp)
    80207502:	69a6                	ld	s3,72(sp)
    80207504:	6a06                	ld	s4,64(sp)
    80207506:	7ae2                	ld	s5,56(sp)
    80207508:	7b42                	ld	s6,48(sp)
    8020750a:	7ba2                	ld	s7,40(sp)
    8020750c:	7c02                	ld	s8,32(sp)
    8020750e:	6165                	addi	sp,sp,112
    80207510:	8082                	ret
  if(write)
    80207512:	e20b99e3          	bnez	s7,80207344 <virtio_disk_rw+0xde>
    buf0.type = VIRTIO_BLK_T_IN; // read the disk
    80207516:	f8042823          	sw	zero,-112(s0)
    8020751a:	bd05                	j	8020734a <virtio_disk_rw+0xe4>
      disk.free[i] = 0;
    8020751c:	00098c23          	sb	zero,24(s3)
    idx[i] = alloc_desc();
    80207520:	00072023          	sw	zero,0(a4)
    if(idx[i] < 0){
    80207524:	bb61                	j	802072bc <virtio_disk_rw+0x56>

0000000080207526 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    80207526:	1101                	addi	sp,sp,-32
    80207528:	ec06                	sd	ra,24(sp)
    8020752a:	e822                	sd	s0,16(sp)
    8020752c:	e426                	sd	s1,8(sp)
    8020752e:	e04a                	sd	s2,0(sp)
    80207530:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207532:	0001d517          	auipc	a0,0x1d
    80207536:	b7650513          	addi	a0,a0,-1162 # 802240a8 <disk+0x20a8>
    8020753a:	ffff9097          	auipc	ra,0xffff9
    8020753e:	19e080e7          	jalr	414(ra) # 802006d8 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207542:	0001d797          	auipc	a5,0x1d
    80207546:	abe78793          	addi	a5,a5,-1346 # 80224000 <disk+0x2000>
    8020754a:	0207d683          	lhu	a3,32(a5)
    8020754e:	6b98                	ld	a4,16(a5)
    80207550:	00275783          	lhu	a5,2(a4)
    80207554:	8fb5                	xor	a5,a5,a3
    80207556:	8b9d                	andi	a5,a5,7
    80207558:	c7c9                	beqz	a5,802075e2 <virtio_disk_intr+0xbc>
    int id = disk.used->elems[disk.used_idx].id;
    8020755a:	068e                	slli	a3,a3,0x3
    8020755c:	9736                	add	a4,a4,a3
    8020755e:	435c                	lw	a5,4(a4)

    if(disk.info[id].status != 0)
    80207560:	20078713          	addi	a4,a5,512
    80207564:	00471693          	slli	a3,a4,0x4
    80207568:	0001b717          	auipc	a4,0x1b
    8020756c:	a9870713          	addi	a4,a4,-1384 # 80222000 <disk>
    80207570:	9736                	add	a4,a4,a3
    80207572:	03074703          	lbu	a4,48(a4)
    80207576:	ef31                	bnez	a4,802075d2 <virtio_disk_intr+0xac>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207578:	0001b917          	auipc	s2,0x1b
    8020757c:	a8890913          	addi	s2,s2,-1400 # 80222000 <disk>
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207580:	0001d497          	auipc	s1,0x1d
    80207584:	a8048493          	addi	s1,s1,-1408 # 80224000 <disk+0x2000>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207588:	20078793          	addi	a5,a5,512
    8020758c:	0792                	slli	a5,a5,0x4
    8020758e:	97ca                	add	a5,a5,s2
    80207590:	7798                	ld	a4,40(a5)
    80207592:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    80207596:	7788                	ld	a0,40(a5)
    80207598:	ffffb097          	auipc	ra,0xffffb
    8020759c:	f9a080e7          	jalr	-102(ra) # 80202532 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    802075a0:	0204d783          	lhu	a5,32(s1)
    802075a4:	2785                	addiw	a5,a5,1
    802075a6:	8b9d                	andi	a5,a5,7
    802075a8:	03079613          	slli	a2,a5,0x30
    802075ac:	9241                	srli	a2,a2,0x30
    802075ae:	02c49023          	sh	a2,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    802075b2:	6898                	ld	a4,16(s1)
    802075b4:	00275683          	lhu	a3,2(a4)
    802075b8:	8a9d                	andi	a3,a3,7
    802075ba:	02c68463          	beq	a3,a2,802075e2 <virtio_disk_intr+0xbc>
    int id = disk.used->elems[disk.used_idx].id;
    802075be:	078e                	slli	a5,a5,0x3
    802075c0:	97ba                	add	a5,a5,a4
    802075c2:	43dc                	lw	a5,4(a5)
    if(disk.info[id].status != 0)
    802075c4:	20078713          	addi	a4,a5,512
    802075c8:	0712                	slli	a4,a4,0x4
    802075ca:	974a                	add	a4,a4,s2
    802075cc:	03074703          	lbu	a4,48(a4)
    802075d0:	df45                	beqz	a4,80207588 <virtio_disk_intr+0x62>
      panic("virtio_disk_intr status");
    802075d2:	00003517          	auipc	a0,0x3
    802075d6:	83650513          	addi	a0,a0,-1994 # 80209e08 <etext+0xe08>
    802075da:	ffff9097          	auipc	ra,0xffff9
    802075de:	b6c080e7          	jalr	-1172(ra) # 80200146 <panic>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    802075e2:	00002797          	auipc	a5,0x2
    802075e6:	77678793          	addi	a5,a5,1910 # 80209d58 <etext+0xd58>
    802075ea:	639c                	ld	a5,0(a5)
    802075ec:	439c                	lw	a5,0(a5)
    802075ee:	8b8d                	andi	a5,a5,3
    802075f0:	00002717          	auipc	a4,0x2
    802075f4:	77070713          	addi	a4,a4,1904 # 80209d60 <etext+0xd60>
    802075f8:	6318                	ld	a4,0(a4)
    802075fa:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    802075fc:	0001d517          	auipc	a0,0x1d
    80207600:	aac50513          	addi	a0,a0,-1364 # 802240a8 <disk+0x20a8>
    80207604:	ffff9097          	auipc	ra,0xffff9
    80207608:	128080e7          	jalr	296(ra) # 8020072c <release>
}
    8020760c:	60e2                	ld	ra,24(sp)
    8020760e:	6442                	ld	s0,16(sp)
    80207610:	64a2                	ld	s1,8(sp)
    80207612:	6902                	ld	s2,0(sp)
    80207614:	6105                	addi	sp,sp,32
    80207616:	8082                	ret
	...

0000000080208000 <_trampoline>:
    80208000:	14051573          	csrrw	a0,sscratch,a0
    80208004:	02153423          	sd	ra,40(a0)
    80208008:	02253823          	sd	sp,48(a0)
    8020800c:	02353c23          	sd	gp,56(a0)
    80208010:	04453023          	sd	tp,64(a0)
    80208014:	04553423          	sd	t0,72(a0)
    80208018:	04653823          	sd	t1,80(a0)
    8020801c:	04753c23          	sd	t2,88(a0)
    80208020:	f120                	sd	s0,96(a0)
    80208022:	f524                	sd	s1,104(a0)
    80208024:	fd2c                	sd	a1,120(a0)
    80208026:	e150                	sd	a2,128(a0)
    80208028:	e554                	sd	a3,136(a0)
    8020802a:	e958                	sd	a4,144(a0)
    8020802c:	ed5c                	sd	a5,152(a0)
    8020802e:	0b053023          	sd	a6,160(a0)
    80208032:	0b153423          	sd	a7,168(a0)
    80208036:	0b253823          	sd	s2,176(a0)
    8020803a:	0b353c23          	sd	s3,184(a0)
    8020803e:	0d453023          	sd	s4,192(a0)
    80208042:	0d553423          	sd	s5,200(a0)
    80208046:	0d653823          	sd	s6,208(a0)
    8020804a:	0d753c23          	sd	s7,216(a0)
    8020804e:	0f853023          	sd	s8,224(a0)
    80208052:	0f953423          	sd	s9,232(a0)
    80208056:	0fa53823          	sd	s10,240(a0)
    8020805a:	0fb53c23          	sd	s11,248(a0)
    8020805e:	11c53023          	sd	t3,256(a0)
    80208062:	11d53423          	sd	t4,264(a0)
    80208066:	11e53823          	sd	t5,272(a0)
    8020806a:	11f53c23          	sd	t6,280(a0)
    8020806e:	140022f3          	csrr	t0,sscratch
    80208072:	06553823          	sd	t0,112(a0)
    80208076:	00853103          	ld	sp,8(a0)
    8020807a:	02053203          	ld	tp,32(a0)
    8020807e:	01053283          	ld	t0,16(a0)
    80208082:	00053303          	ld	t1,0(a0)
    80208086:	18031073          	csrw	satp,t1
    8020808a:	12000073          	sfence.vma
    8020808e:	8282                	jr	t0

0000000080208090 <userret>:
    80208090:	18059073          	csrw	satp,a1
    80208094:	12000073          	sfence.vma
    80208098:	07053283          	ld	t0,112(a0)
    8020809c:	14029073          	csrw	sscratch,t0
    802080a0:	02853083          	ld	ra,40(a0)
    802080a4:	03053103          	ld	sp,48(a0)
    802080a8:	03853183          	ld	gp,56(a0)
    802080ac:	04053203          	ld	tp,64(a0)
    802080b0:	04853283          	ld	t0,72(a0)
    802080b4:	05053303          	ld	t1,80(a0)
    802080b8:	05853383          	ld	t2,88(a0)
    802080bc:	7120                	ld	s0,96(a0)
    802080be:	7524                	ld	s1,104(a0)
    802080c0:	7d2c                	ld	a1,120(a0)
    802080c2:	6150                	ld	a2,128(a0)
    802080c4:	6554                	ld	a3,136(a0)
    802080c6:	6958                	ld	a4,144(a0)
    802080c8:	6d5c                	ld	a5,152(a0)
    802080ca:	0a053803          	ld	a6,160(a0)
    802080ce:	0a853883          	ld	a7,168(a0)
    802080d2:	0b053903          	ld	s2,176(a0)
    802080d6:	0b853983          	ld	s3,184(a0)
    802080da:	0c053a03          	ld	s4,192(a0)
    802080de:	0c853a83          	ld	s5,200(a0)
    802080e2:	0d053b03          	ld	s6,208(a0)
    802080e6:	0d853b83          	ld	s7,216(a0)
    802080ea:	0e053c03          	ld	s8,224(a0)
    802080ee:	0e853c83          	ld	s9,232(a0)
    802080f2:	0f053d03          	ld	s10,240(a0)
    802080f6:	0f853d83          	ld	s11,248(a0)
    802080fa:	10053e03          	ld	t3,256(a0)
    802080fe:	10853e83          	ld	t4,264(a0)
    80208102:	11053f03          	ld	t5,272(a0)
    80208106:	11853f83          	ld	t6,280(a0)
    8020810a:	14051573          	csrrw	a0,sscratch,a0
    8020810e:	10200073          	sret
	...
