Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1963.1592342392601645872
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 14:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05GLJVCk019502
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2020 14:19:41 -0700
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.21) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 14:19:20 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] New source files and Makefile update for Test Manual
Date: Tue, 16 Jun 2020 14:14:50 -0700
Message-ID: <20200616211450.8079-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05GLJVCk019502
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Mark Morton <mark.morton@windriver.com>
---
 documentation/Makefile                        |   2 +-
 .../test-manual/figures/ab-test-cluster.png   | Bin 0 -> 18684 bytes
 .../test-manual/figures/test-manual-title.png | Bin 0 -> 15382 bytes
 .../test-manual/test-manual-customization.xsl |  27 +
 .../test-manual/test-manual-intro.xml         | 634 +++++++++++
 .../test-manual/test-manual-style.css         | 989 ++++++++++++++++++
 .../test-manual/test-manual-test-process.xml  | 109 ++
 .../test-manual-understand-autobuilder.xml    | 312 ++++++
 documentation/test-manual/test-manual.xml     | 103 ++
 9 files changed, 2175 insertions(+), 1 deletion(-)
 create mode 100644 documentation/test-manual/figures/ab-test-cluster.png
 create mode 100644 documentation/test-manual/figures/test-manual-title.p=
ng
 create mode 100644 documentation/test-manual/test-manual-customization.x=
sl
 create mode 100644 documentation/test-manual/test-manual-intro.xml
 create mode 100644 documentation/test-manual/test-manual-style.css
 create mode 100644 documentation/test-manual/test-manual-test-process.xm=
l
 create mode 100644 documentation/test-manual/test-manual-understand-auto=
builder.xml
 create mode 100755 documentation/test-manual/test-manual.xml

diff --git a/documentation/Makefile b/documentation/Makefile
index 3bdf32b89..ff0494b95 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -361,7 +361,7 @@ ifeq ($(DOC),test-manual)
 XSLTOPTS =3D --xinclude
 ALLPREQ =3D html tarball
 TARFILES =3D test-manual.html test-manual-style.css \
-	   figures/test-manual-title.png figures/ab-test-stack.png
+	   figures/test-manual-title.png figures/ab-test-cluster.png
 MANUALS =3D $(DOC)/$(DOC).html
 FIGURES =3D figures
 STYLESHEET =3D $(DOC)/*.css
diff --git a/documentation/test-manual/figures/ab-test-cluster.png b/docu=
mentation/test-manual/figures/ab-test-cluster.png
new file mode 100644
index 0000000000000000000000000000000000000000..6a6a7882b43895cd3e81e18b8=
829c88af5b2ca8c
GIT binary patch
literal 18684
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
M
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
KpUXO@geCxLdSVy=3D

literal 0
HcmV?d00001

diff --git a/documentation/test-manual/figures/test-manual-title.png b/do=
cumentation/test-manual/figures/test-manual-title.png
new file mode 100644
index 0000000000000000000000000000000000000000..c709cb9d09cfa38b0909cdf70=
b459946e3b4615b
GIT binary patch
literal 15382
zcmch;Ra9J0^e#vYPtZW{;O-VYcyM=3DV2sG}l4GA7BxVyW%h9JS+rEzcEq3PSn@4x0@
z*35mGb?2cePWL%gyLN5)>f3d~loh4lq7tGaARxSz`68i;fba?f{{JuJm+-%c^+XHs
z=3D9ROUj5;zh^74k#I{cErMN->E&ECw#-Pj3;U~Xq`3uJaSaRLJEoGt8KPG5BiBOrW4
zkdY8o_eh7Vy6fW(fRWBx`X^%y3x3c^zQAJg|9VR3&Be|h#?HQT-*=3DVyAulY9o`$_}
z0h`;+#AX2#t^fPWA6#f3J8qqz_pgN9s+f@UDM4$ju;z@k<%|}Cl+)3Xv076Of){XU
z5V#kDS^l>ED&qC8;cfTpN$kJZI1+My8+lCTzqhf8{(t;Y_hZZ#bc5Fh|Mjz~s-f|o
zU66*sEk6e>mr-9F|L<5{)u9{g!7Sg$a_mvym;NZZ)PKLG2~GUlB!AR}E0ql)=3D8L+a
zVWshI#d70OJzF<=3DT{~RBE8G5+`yfflz@OXsmn3GLZqNq|5&OH1y|;RPkJNN*%D~M2
z{{C@IKTm#kl}v0Rp{I_fHJ9q9Q(ctHiwkG?=3Di*Y}x@1%jmTedOju;b<u$1L;(RmNF
zd?Bsr=3DC)i|P_WZmlLrQEMY6<e&TDg|j7$LGLU{x#+fzJV-U1$PPpdqii?X!uF2Y%r
z!9ocRyBQcFU+?bph5=3D~;)`c{07+G1ft`?XSoUHcm&9gk8Q~HJu@@N!GtL%;LjCyJ)
z=3DjP^gnPhm4soo(Ve6H$`CSdl1Zaa^2npc*W=3DGrj?$_C__q=3D-|C{Yka&gq+d9ayK{O
z>RNi6pf0PV6#aqpH!%a2n3O`gpvj4k0lt*;KdoIIUMh*?*gbbz;)w5}Oq=3D}yjHldx
zxUPUdnTmlai5`s=3D-p2s;dW2#Wji(fCfLga^4yKh@eN}#sz_r<57mFjc37_T_WE>*U
z34qo4sI49sq#YcD({H@tPIIC<pKh|wqoCYLn^#lK^t;yx5*$L(y&P?7yM+`L-rXM5
zxn1ws+1Zh3iI-5JPgm>e>E%gB7ZhsiY7+~1bdQY4XI}h%xYlceNsewEZaP_jN#Dxl
z3he8_S9+p}7M~^C4%Bucov>J(Get2Zo#|^#z^w;>2@lHbmE>TPQwcIL@g1}`CDC%L
z7<<Su;i-vJ^Q2{@yF6D_q;X>;a1~)PkgU`(o=3DXUFt5XEF*V?3rwQH#A>S}5hUiY}*
z{j;xEcg|b(7xT;R5Y@44OzQU5av>+#Hcz$ZrO{c}fyB|ns9N^{H+R{6HEneX-y7TG
zh4Yyat+A}x;{A-K)9x3CyY?c`^-AH7YRJhn<LMQ7s+RBmx{&{itJC@D))tQgG*p6O
zm7WC^$BTKTN!nmoojdR4w|6HwL0^Z#An9jaI@}?^>FTpN67@;&EWnS_&(_LnsJi@f
znja2MaoP;>_{V=3Dv_@V!~YiT~cJp~m0py{Ug&ei$aoN>F#9%wcM2ziZU>6HC(h~kY5
z%+Sg^#$gwoJG!Z<iKgwab6Oh1Jvn4xONCeD?oKV^y)@-N(?I_{Jsme}3!w2D$)~@V
zN5dCk^n>25@EzV%o9&pV5?dUdb}`UCH<)KVH53#S&^%6}3TIWxG?K?#YSSKk%aDDU
z<8YD{X$xyL{KWmAfFlKU5XaB91_sOFJ`bo%Rj{nh3R|bBs3-$r7g^oZr-ryZ@ub`7
zl2?{2ZVMBNJAO`DkHwqL-l?q)5{Ul^6}B{w&1;NJZaVj!cAGu`DTpXrUe|TY%nM%_
zXlXgQLpj%E<>^ZGFE|CeoNPPZ9|Z>^1`)`KR6S;H)GehxudJ-(CP0h1j8_(-IO$uQ
zS*z6U^8}X%xSGZ`*td^g{`Y9_hC^}Fw3<27D99$bRH?qr>AI9AL^-s3Nj`&1=3DDAfp
z$(oQ)fX{V9&F^@D+z)cJwQBr4FP&_cEET+rcM6)C8d1+HQAzz5G>wc<dGCiiF8hy$
z!U_uuFXpS-p9^Uoi=3D>R4F8B7IN*ov}3@<gzMJ}c;Ndy(DA~Pa)U<wDz_t>uJ|14!g
zfl$PdoLX!&q5vo4ohq+A(3I_zkD5E7mB8=3DpmsrdTU(0WOXDTLK^yc#(%}wr^5P>_T
zko)(UM;sJ$-53%73E{yg{P39^7?4UJx4XMLGg_3$1WfLr!V6Doze45i`;`N|;XQO#
zdHwR2H<@3qqo;s5OmS%%ocmRp!}Qtr67SHA3;-aBFLwTKG2d8QGu|KRa29fI%ZG}{
zu15SIA@JJ_bZRsih{hnml2+i80Ni<>MnPsqaf%eB(W5PG)H@6(7ccQCf(N*`xY%&z
zsjvqD`1tt4fV#!wUjc}Nywun-y=3DTd(OS(Hk@@YcuzfXxu=3DmlUaLk<#9qd`;M&S7}$
zL*W1G$dp7u<^}Z24||PdJWshl_jeWrxTpd#V-rD)(VZ4J<lBR9qG4dUVO(rES=3Dqv|
z%(8YrIW#mPBBC$}RXx3B225qJDqUJnaY}f2oi<ZRc{x>}!>9D&J?z;Xs=3D#V(CO;8y
z%5;&r88AbkRl5vVgql>Oa6Ex?_FsN7@|gKT;qv*<sYuo786{DZ&Ha5-B#D_dr}6QA
zLY7bNMa5KYEq#Wk6Xe&b!0PJiP8wPki01Le)-?sDAfGMVPvv%ex4Uch7Q^M>nBY)%
z4>8aJp3%C`iYHY=3DNaUPmXJ@wxIU*Mu`0Cx8%E}nU5mV&xc#UIQ*+0D@0^JEyr1QKo
zXqo;pHq}G%H+BJGU?eTyYu6Cz$tSsqS0jJJBO9AlJ-g@k%~416<KyGlxH0>s>de-1
zf8wlh*uioGJVO3W7Rcd!vVtIZkbIg6!%;U|zr0tYRs5pJpOx-nNDdE)RJ0jce72=3Dx
zo9kz1@XUz{52~iS5eM+6_eynShkma@!M(5ZP!o_J{^nrxqu)we!~%}0ot8G=3DUSeMT
zg$5rccFMF$a;B0PwLVm{Wk;#VXTqiPcy0S=3Dz2`3SOa<oR<|ZM*ANWaz{)W;K-pRw<
z!onx3P16!}2Bi(BmZY&vcB2^o7yn{0H08E8x2>gR=3Dpeb$bcF3M4EXF9FHVhwgcK+%
z_3rYY5N4-0A{`waZw*lQ5&p|gMa|6~OX;2}0hFDOR&QNntl7-|2QwJ`&8FE%d6lm~
z=3DOdOlI5>xGk&%&<14{AsrRg6vbanZGbHw+%=3D42o?m07P%tluUNw`lN$a5~fb^z>MV
z#}scL6%l#wb<GfjA=3DMv|y#_5hOXk}tDiplj?g6s4XX_)p68j5{Ch8!oHKVhAz`J7h
z-<wip5h2eC@|ei4;Y0aADw?_sE~&38Qd5`c>vpRbkDY0woj;|&Q4+b_FlW>Y`aV#o
zFx`#-qoJwqFsji;wQqPM9ySoIqpQoq%^jJ^6-3A|DAKku4`@1BSiDL7y<q{efOZT0
z)us?p((jGSdvpR1!OVgJYV!P&5}l2T8nr@fvC4E2Yj`5rI=3D``jP4_Q7T(Wi@s=3Dx5S
zaBQhJOn%#CPZg-&;ZO<L$HT)LvX*V|{n_{Rucu1kr)U3Fe71QS`{{WjzLKyo0El>R
zG0!SesRnZAfXcKAz!o?h`$rVtf9~`P%B%qM+LM>^r+X3q3#~%SA*by-`|E5r`^v5a
zH_!&(xh=3DG?)b5>&S<^!^Pftm6w6jtCGJ(gK%)Wj8HuxN})ewV%*aKw)F<F(yML@6w
zOt=3De|ooSK*z(Yf_RzqsztPq<QUrlnCpXu`f9S%{L7w6`T0&U_Z0iAG!=3Dnw1ceunBW
z%_R@2y+<5&dv0<46WR<%IQlH}V{?t|x!;RhT`O(NZB6UH3QG7U(XHYPe68t^B6X#D
zzKglry6C+NKq4k4u2-Rjih|*pyPGnnqG(UktWfNspw9f=3D$s#je_%I_wr|xx2>p*n`
z8Rza|pAsWgYU%}2P{<%mM_ZfDRJ&ty8ty<i1JRU$f$xxI6#1(-)ScX&iEv5h3ak!Z
zX%_tj*GAuCK21~<mcKG2D^PEs)$Y3KgZXZS_dUNr$R6naLJYqJA&%vSIc&J9x83Ou
z+ZA)1{b8wTt4Co56o@Gn%4WHBJ2^l^M}NFfP?bSy8z9U=3DU0dti)%K*FEu&ePl28?L
zboSHVlM*q)b%*jbBHS)>S$N9z2fmeU?sK*<RQe<?QE9|=3DMds67ZcV?fr&<ox_#Mfp
zj;*Cnz;#PGw-T-GEP}eAMb72o$wh8w`KKkL&J&h{0=3Dt!5cgJVtV#`8O&Y{h8hxZ#@
z=3D_X!%HyIrnnqT2a{p77QM1u0$y!YVTTru2IIyw`F1h~{ku^(K{!6-C35wwpebJKU1
zywk>;7%DJUhR;-)QuYQsbi5(L$Ve20#d5ebJuZNNu&+Gd=3DIWuCQzk_fC6h1cNF!pY
zFt-j4P!}ncT5>R#^x<YMna|ev?M<LDfF09d*rDBvdvT5IN-$pWX~}zZ#!)jkT5jY~
zzPZIyY~UXKsLOHf1;S_ER`$LiAfW)K8zys!<x!^In^Ng-RPNX~H%$}oglrT?l<O+V
z0JOSt?!Yi~17zD`S&)}GNJukeV#05?{S|`$JC`!^kUio~hMSc;XUMADW<;IHPKeJ&
zo`+v^`Ob4{KtVlKTD8VxKetI3=3D9FrD%!KK_STR1E*-Gu&%&9yL7D`zu152T4I=3Du$5
z7bBmq*Xc;#_=3D3rp`#{9g-~NqVS@n%m`bU4D2)PS32$h&YJKOBr*T%o`yryDqPp)pr
zycr~~GYLr}0Hud2`rIx-u*LDkgev{E*R{ko-ns}gH#;77H-kBbio>R!0BS^8gtnuT
zYUf@olp?2avol(StZcLdRuO{iR8=3D28=3D>1LzWG;BNZ&qEhFdl4$-q%-Rz{RgAHD?Mt
z{DDDLc--oC>IBkI36IAV^VnTGVG$2_wL1``cxYRw6Gjbm=3Dj5STd7|xDH<MB0Bo9n(
zZf@%jL}Vt#7hanUTmw_Iw%)h>F?l=3DWJ-B%N%5OekenZZ%i(^iT?_xsrTU$sU8JpRz
zNCCA<h*j~R<zPW%UWF|(xrAm+{p7*pBjog&G^vheDT}gfT*=3DdVIz@!zNEf*aT<j?$
z_qb4k`n64ebgV*=3D9%p-{xdoy+S96tHK2#`$LaxtAR<*X3+XEn6X6+S=3D196Nh`8JKg
zjY^Qebv3?jL~1;Y^ry>(l(*`E77Ulk;L!HkNKF$Y<mmeb!WmO1CBf*<6m}F15otC(
zg-`^!s5l$0b+os8`;kQ5h7&ef4o+xW7iy~MC$;VFK~Diyd9-M9;TN~KJEwe3{8pP0
z5VTiN`PS9Cf`XUUNW)Y<J=3DGK9(sWRt{D%B|iIw?aIb`E=3D`A<w@OSBv)x@iRx$`7a8
zx0|ej$u*RJTEQQc*XlA$>8%-Ly&;d{T|1L|7-4!&r@K#1yn9I<c2%7mu(D!9bUCks
z)0tNY-FXsd70qEs*&5=3DO!wB)TnTvYY4z*3q7q>!-qccqv;#vbYs{49BdGJ9sPODTq
zG$~SUw-@JF!|qVcayPNcY^I%aULMAVq<W^LXb537!-1D|Q{iXpvTohp1~;Om@XQ%?
zt;;hhR-Pp3$1zE<Z_UqDk+iIAcnW~o_*t_og8P0@pK_S2cDo%U_}<)lrXn!ENexbY
zL=3D)Oxc~*}MjFFH^D8y`63L37-B9qrH>Fv!;&F4iW^HKDtKW`bT)*ZAlpPE@TQW*K}
zUNS}zTPshl52jv%p-<h0!MhhZyAe2BeuE5<3yLURhU&zc`zX|Kt+2j}{eZrWsa$Gf
zIRnR`RG0p?-D?d6$Jt29GVC~k&Va7_ZY95pK`ktm|Iw1PK%ABQ3St$Zlkr2rjd8m7
z08X@02JdRS+rSA?y<}p!m{xRkfjg7TNybtalSYY5qZ0wy@unTcNSiZlPUy4U^>xuR
z@|bQR+ixikSMam_0q+`C4+i=3DH&Ovtt^O#7wfn0`wMvBWBBxX$yF|`JHKuGYx<kBpx
z`D9{ahD$chc9C^+=3DOY>md7wl4W3n(hbAyJFZCseud&DUZnx_zH(;B||LEfJJ8MHSk
z@@>;v+`vdAUNT_`J%jIe@1lI|<NZP#>d(e18rrJ#ZMuvrT>1*@X+?gV<!Tkm6=3Di}4
zFX8wmnvPjP)GQ@Bi?bbE5Xj^yE7wmOHd_N_scKa?vO)H<=3D|x7<)nl-3zx|~cbn?=3D0
zB%StV?8?!~8Vk7DhK~{b`1~Lw8}*~^ylc$koaFX~M@`lD2$EONH`ZG|-unI$aATEL
zK*8MQ_;q_IJpL~GK01R}7$xdrqk0wb9n|zA`S+f~x)RF<2;U0)+9ffsM}oliz4lSQ
z!u!E1R)6hfzCRd$zE0};s@$KT+2W+PfJA-s3`X+b&brIrT^xIr6=3Dt*DLmBJos>Zj?
zE151DfmmW+^1H@okZ*PDiGPNu<&M;etYJWhil9@Fhmz9~Pb36?>BKn@&!rH2Y318m
zgsxBT+#9K;ciXhz>64gCpK8bA0fd^;I%gt}_TTu8gBGZ8#I*IhHq@e6F0zvve0;^0
zjQ~V4c2j*4OUhA$@q1)?yVO||!)}CZW_vc?OTs6Ht6FP|Z_?q*RS}0r1?Z4asy%mc
zEtHVE;w6ebLf-JK)W6pp8@Oy@%6J|i3TN#k+`symv{p*r>d4QRmTH7`v1P-mCu{5(
z^=3Dh8^EPK0nIZ;_G1*PaeFQJ3H<)~(&86{duN}c)%J+fVDeUTF#8IkACgk`xE7Wi1N
z84kHWU?MBXA+`gn<l*a1#iFu+hhp4)zZ^zq6fyHilz(4CZpw9cba*8#^)|mCp6rk1
z$qG6iT=3DC1Vsp(nm)U>5DaQGGm#S}nd$mBF}fb?5MfCi-kT;0W1FpVWy{f-{WV0wM3
zKnMY!2Qskj%4^ORn&kxt@9LJ$>>oj=3D#p6f@>COtH`9|R{%A^<RS?Z=3D$Yhk3mhSh*O
z34!;cyu&NL#y<zMlIR6kyS!UKGYH;1<PvlGPNBj{EA{php9=3D;`9Uu>#!WB$4zBC-m
zv+4{7>LbPQ@E9qts$~Fro+^lTE6k^p*X20(7XFiNi5Rn*9gV10Ldpqu1nTRcB8xJ)
zpPl6IhOkJNr(6RmTd2l$98aw}T(UEjgy3<#w7%7aV)*OOQ;u(CMn~S^=3DnGD%DAi-m
zj}-~G(+5yY;a?|FrFv{}+27u6JF!z2@R#Vf_pSwEQWP`&DU2?=3DyJ^yztmtX*z6d)|
za#P1ZTw-uY3dN{;(7(K&&NPu$tT!7v`GAL8{($o5q0G!$Qj~@Ho3%Yng|(H+2<^^Q
zBUQdoWoe5xIY_aqh!g>VR7cm)Vrhoc3b@dBPcKW!jz?Z5U1lNjMx&tb3Kv63j(e18
zxqopk7MHiNsD4`=3D71$dn8JgXi{=3DAKv7#`k|x|7=3D`srP2C#n8BG#KoLAnDWK1n?q8o
z@+K?PLo3TBdF=3DC=3D25Siav%a%i(3d%-s{aOEA`LatQA`u*)uQL~&|Uc;w=3D<`<q&zK8
z*2L*pyIX1vY}wVEyNYkM`qpeK(lC03Fxoq)kMEvkS=3DP<pe|~oik=3Dd$9{{7zB&pR`f
z7;YW)HI?CvlA2nLp~#b4C4XHl>88jw*;BIfKwRmoXP1ENPIpAPMos~x{&ggWv9kg$
z9ssxg$1=3D?!sxI!$Z}$1Yt;KpxBN8X{=3Dlk#?@a>lSOvCTGJvicrcP>x2zZq#6d5s}l
zQuQxiu#j*uF=3Db}-*nEfzt0>G<;@HhZEO6Js5H7e2mM<*|(Q~Qj<~QD4hi>ODU<^EZ
zmK<^BZfF-{_{Z;;rv4Zvw2-H>5%`TLc#VK?R?K!h?vPlriH;)^@Wob-_B{&j$pZ)X
zUM&iFprnq*`7aP*U#kUYgT^`wYAV-`D{CJgpAF0S(o$=3D5h+KAujCpXjwoOCKkG0Z4
z4t9;^m!tT8tv+ggqqIFokbg;cxOx(Md1!7W5OWBZz}T`wTS`5eA}sCD`hec;#x|09
zxipC&4RdHey1HDHVj83r)rh*nt)DgVEnIwdrN0pFdo;^K{So5GKrTh~B4H-A4kV$B
zzaHm8;L$>$=3D8ezmC2I@{`0Q$E2~=3D_AWbWhmbN(wC2R!#HEVHe?Sq7g`)T*poO3{9n
z>i~HAMGo`5CYk_ugPi?;mVlUvIqZIh%FdT1ebD<yiIpy?)q_FWv34##URD=3D%n0)R)
z^j?9)`!SYrW}tL!n6502kDq~SDRwDq?Qs`4geua$?nzCCxM)q>WAQ)3xSpNmWHqlG
zr_RM_?h@i_{Le_ihC>T0u7wyK9j!@T^|F$C-|L0l)$pLt^yAMe7+TaudaaS}1s!nu
z?b0c3>h*f!lu1y1{Mw6m44OP1Ultftn0_Rp+8keLC^Qx<Yvb$6_Kl`54;hHZK5Us+
zLOuCt&)pU?QWNoHMO_>ZHPYc54v#<re%-G+5hM`Fv_eM4yW`V#!k~Udns&FV8LS6o
zWo`Y>_V=3D_cjnjEvlWTUP&rd#YI~EhxV7v#Pm<O%Ce%e74##2eY(|77>)XAY*VyKRp
z*5mecn?{_}vSv_v<~KM;u^VlX8Hf5fOfK0vp2D`fTpI4bM-uJi=3D-n!H(Cm@G9o#rL
zDiL|v)?q~OA$7Ws)}7^(u0E}OrRn#0oJSh6;#}Y+QoF!PqSF>0FB^*!0&~dK6q&cC
z=3D};Sa{;ZDqp6yssMe06w=3DS*5H2Htooh%tFxYHExl=3D*_o!4I|2;CM%}^>9@H;5h+~u
zj~nZSn>T}NQ-$sCMPPD}4;*j9(pR1*TJ5sDBL9KfR&<fbVBp5%qED3&(ItJ?lipU7
zokQ4d3iiGcqh)(SigS%v&cWB9aZ=3DvV;5qVcXM!u>NKn`wJx&z0B%{c)mAONgwiZZD
z<^+5&d!>l^d^M2wvSgHMeq}uMr<3dtDp<je$T5n09sX?6LbUL6dvw7Ks?GM5rb6fA
z`ul*`T{W`)mE@M~23LWv0n*JEZ)T~b$IS~TNr}xbH`@{LheTVw54i>4+mEw996t3D
z$OG;pBiHkOy0K#33sTlPCu_C(31n<<)0<6V^ENZCnCfc6&6wJ2OuR|BHGF7=3Dpo*<O
zG8WJ?A58M8ZU2M<@$hECS8~AbSSuCVRTYpog2G5|G%QNG`xODRrg~#OW}C@rNJ=3DWv
zlw|_WJO>e_$0sIcKI_tepCxHUhSUGyq=3D4vNEHUJb1>wi8zOq-`x^WXTA}8BvDlbYA
zy+851AX+0MGcVm_?#p-`A$;x>8nSssXlG>O;irI_Q}B{Vz*i$~??dM$#8{N@N=3D7G0
zKEiKkUXkAXR<Wc1pLxjiV=3D-g(a5($z1!%n+zj8Jn0%Gy{itf@nPU0OdX(Sfho|#ya
z0Z6+iY%VBi$2#tfZSqroWSj{F+hy*Q4iW>I-!Cj2l%+B~{ydi{D`Ij0Hh)wIQA)|W
z8JjSgwKjD-nz07KH?-?mrs$N87>>3y<A8YHP6vCj!;_<1menc-d`vOq<(VPyw6Cf5
znOfe<kOj9V8_rG>SOepep{&v)^|_{xnWGf2EE!WwUVmlv>+hHN(QnC4OP@<znLslu
z=3DBg`WAP2f@2}2V`@<7|o&11n&6MkcK7-&Hwa2#GUt;Vgx(;2heh2qJ0|Im-7Lt7_T
zYZVlT*~8)J>K=3D}Q2C~y%_^|g5uj3dF)MowxHFUZAl6(Z+nRwUkqdeT9NawjK-*Z3k
z-A(T|8Mt3d5Db4IeljN~g=3DZR4c;#e2QJqTNt6M*sEd4b+_n_udPtaQ`SSsK!2bmbl
z$L+u=3D5`H+H>heY3{q#tj`iiSFoS>2)P94acagw=3D+dbs@_uVdv^=3DRtW7u5m!E{m0G;
zp)4^^yh$mR(I}P(wFGysXEqk|!2!f3Ci6GpMW&R+ffsS`GGewgoc{It9hS~%4+KPJ
z=3DD~?fBSAO|>GI8X$H;t~u>!ln_QLn&gOGs9%!PxV#&{Z>0A;h%9wved<&W}@jQpQE
zC7kN{OZomk7cu|;`tfgFHA2^<zjG}sf3}f!p%Zq^$SCBvi0}d7S>)vh)PJNdLb3})
zI&6Q+9{f&dabeUXO^S)ZyDZw3_x3BUDR2+ueqWP)B*6BT|9ZH6(rk$l%l}<T+xns-
z>~^<g1200PM?#Co7ymstJAUn`g1ZWI5NU^vz$SIKEP+hE`GZk~m84S<nLPirUCVCF
ziHqGK48i4#Iez=3Dq;ZAJ-Muf;WDpwTV1aUZzmltdihDlL2BCEvdLLPyWX1#0nE9ncF
z-DSDWCnj+`<oeGc_&z4^(p|O^F2EMi()X8$WGf#Jg8$e@T?&aguj{Wdy%Pm&io3qF
zt4o4|69otrQwMJV-nSk>R6_xIC(wtL5p@z0LWIxeY{O|k=3DcWvFD8%t!eg?RB|I#8E
zvQa1d5ynx8SHFJ@uiEoZHFQ!(*&hdH3F#FKoqi#DUi7{3z@ZL0z24m-Un>P!rMB@C
z{I1_k%#8>vjH+|h>~h30Jg7LBALek~k1kQo#^-Nc-<e{;pNpt*ROT~cEah{QOBz5#
zn24;Dl(Q-Ff5G~?*h^a75EMbmtkXP7f<s{3p5uRa(y&au1ZHkh>do#P)DK5MAj<fA
z766!YSY(gzAy|>cgVWnkZZ_bVVKO74e(qxeuZQg6MRfd7Q?s3*BfFRDi)>o9R8Kh$
z(Xq(1WfmZb9P3c2ja58m5BKHyp%4qhQ$Y<>EZJU$CJ<BRAS0q;k0T0*yGB=3D1h6N9e
zN%jXv2Rt^P*W)Myr1{e(+{yprau`lV|8HCl1Q*>PMuW=3DM<>49R{r#v|&srMM35C2i
zICsR=3D53rV~`cs3ICh%x`gU_|M+MV|9@tnSE2N)@!>C<tBS8y7=3D=3DeM3jYo=3DYAnay0=
%
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
!
z)75w$`dz~ID$npkh&~Xl0bHM9*o}G)KM$?EUPn*&g+}ueFPp=3DfJY2J-a{NpDRt9<V
zUV2@8OxM3<ab=3Dzwe>09od@R#t-|cAzC<r+#8K}W{HVdW{M{HDDSsUnBY5y*LU~!cS
z;u=3Dq;&$?s71)KKNO_RB=3D>rGZ_q$Jm7C&$1c2miqOFlF7bct34LW^H#u4prgrq7fx;
za|<@WJ%QowR;HnorDL_9^!0ihhW71!ZKQa4f?vk@zhdZ;^B$&k=3D-$4F!YtSd{HN3K
zp+azY1e$?i$R{{G9z>rcxpMU;C978w<}O9n>Rw_U4OcrOI2+kYGUJuh&EX7y$Z(;Y
zwh4X;@;*}o7K1_-L2T3iRp-I?A-PPL1q)}d39NG#8!{xG5@p!zp{37CnpReQQ5br2
zO!&_ogV|jmwKhJKO@25RnitoR__c~=3DNv5-?@RKCK&BGHs9K5HM=3D4$q_LoFK96iJ2j
zG(HNJXP?8&BhREuMyE18vK8gNjkcCgLATc#Jc2Hu(2j&wgX%jK=3DPVgVfyZAtGdP}+
z6@i$IVc~U`>z`qKdGLDx9cyRDMIpK%Pt^@P;897yd;7Ubq{`9l`|yi?{1b&QtG>{+
zf=3D7*=3Dmtud*3isZv(dcL(EA@3uJq5B)^Uf}(s`I+^SB}5xn7zl36~=3D^peuSuncG;Uh
zBDZwlwO=3D_&%<NPtu6#<@Fl6|N6_w&g*2QNM!W!-7=3DTY~O*W)2q;-rQ*+El*;52pwI
zN@ONB$$4P#^q_zS@v=3DWzr;n}d)1p0g-8ep1BX&<sH4!%9#b&+nrSHfm_&#Ja(!QeN
zD?K?xlD!rVg?F`U-(}kVeJ%Fv3+LUxgYEx^UoibY^xo?KzT0is3mBi8tUvCVFMO&9
NGLniCm10KU{}-TQ7is_i

literal 0
HcmV?d00001

diff --git a/documentation/test-manual/test-manual-customization.xsl b/do=
cumentation/test-manual/test-manual-customization.xsl
new file mode 100644
index 000000000..6e437d482
--- /dev/null
+++ b/documentation/test-manual/test-manual-customization.xsl
@@ -0,0 +1,27 @@
+<?xml version=3D'1.0'?>
+<xsl:stylesheet xmlns:xsl=3D"http://www.w3.org/1999/XSL/Transform" xmlns=
=3D"http://www.w3.org/1999/xhtml" xmlns:fo=3D"http://www.w3.org/1999/XSL/=
Format" version=3D"1.0">
+
+  <xsl:import href=3D"http://downloads.yoctoproject.org/mirror/docbook-m=
irror/docbook-xsl-1.76.1/xhtml/docbook.xsl" />
+
+<!--
+
+  <xsl:import href=3D"../template/1.76.1/docbook-xsl-1.76.1/xhtml/docboo=
k.xsl" />
+
+  <xsl:import href=3D"http://docbook.sourceforge.net/release/xsl/1.76.1/=
xhtml/docbook.xsl" />
+
+-->
+
+  <xsl:include href=3D"../template/permalinks.xsl"/>
+  <xsl:include href=3D"../template/section.title.xsl"/>
+  <xsl:include href=3D"../template/component.title.xsl"/>
+  <xsl:include href=3D"../template/division.title.xsl"/>
+  <xsl:include href=3D"../template/formal.object.heading.xsl"/>
+
+  <xsl:param name=3D"html.stylesheet" select=3D"'test-manual-style.css'"=
 />
+  <xsl:param name=3D"chapter.autolabel" select=3D"1" />
+  <xsl:param name=3D"appendix.autolabel" select=3D"A" />
+  <xsl:param name=3D"section.autolabel" select=3D"1" />
+  <xsl:param name=3D"section.label.includes.component.label" select=3D"1=
" />
+  <xsl:param name=3D"generate.id.attributes" select=3D"1" />
+
+</xsl:stylesheet>
diff --git a/documentation/test-manual/test-manual-intro.xml b/documentat=
ion/test-manual/test-manual-intro.xml
new file mode 100644
index 000000000..5e9def894
--- /dev/null
+++ b/documentation/test-manual/test-manual-intro.xml
@@ -0,0 +1,634 @@
+<!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
+"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
+[<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+
+<chapter id=3D'test-manual-intro'>
+
+<title>The Yocto Project Test Environment Manual</title>
+    <section id=3D'test-welcome'>
+        <title>Welcome</title>
+
+        <para> Welcome to the Yocto Project Test Environment Manual! Thi=
s manual is a work in
+            progress. The manual contains information about the testing =
environment used by the
+            Yocto Project to make sure each major and minor release work=
s as intended. All the
+            project=E2=80=99s testing infrastructure and processes are p=
ublicly visible and available so
+            that the community can see what testing is being performed, =
how it=E2=80=99s being done and the
+            current status of the tests and the project at any given tim=
e. It is intended that Other
+            organizations can leverage off the process and testing envir=
onment used by the Yocto
+            Project to create their own automated, production test envir=
onment, building upon the
+            foundations from the project core. </para>
+
+        <para> Currently, the Yocto Project Test Environment Manual has =
no projected release date.
+            This manual is a work-in-progress and is being initially loa=
ded with information from
+            the <ulink url=3D"">README</ulink> files and notes from key =
engineers: <itemizedlist>
+                <listitem>
+                    <para>
+                        <emphasis><filename>yocto-autobuilder2</filename=
>:</emphasis> This <ulink
+                            url=3D"http://git.yoctoproject.org/clean/cgi=
t.cgi/yocto-autobuilder2/tree/README.md"
+                                ><filename>README.md</filename></ulink> =
is the main README which
+                        detials how to set up the Yocto Project Autobuil=
der. The
+                            <filename>yocto-autobuilder2</filename> repo=
sitory represents the Yocto
+                        Project's console UI plugin to Buildbot and the =
configuration necessary to
+                        configure Buildbot to perform the testing the pr=
oject requires. </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis><filename>yocto-autobuilder-helper</fi=
lename>:</emphasis> This
+                            <ulink
+                            url=3D"http://git.yoctoproject.org/clean/cgi=
t.cgi/yocto-autobuilder-helper/tree/README"
+                                ><filename>README</filename></ulink> and=
 repository contains Yocto
+                        Project Autobuilder Helper scripts and configura=
tion. The
+                            <filename>yocto-autobuilder-helper</filename=
> repository contains the
+                        "glue" logic that defines which tests to run and=
 how to run them. As a
+                        result, it can be used by any Continuous Improve=
ment (CI) system to run
+                        builds, support getting the correct code revisio=
ns, configure builds and
+                        layers, run builds, and collect results. The cod=
e is independent of any CI
+                        system, which means the code can work Buildbot, =
Jenkins, or others. This
+                        repository has a branch per release of the proje=
ct defining the tests to run
+                        on a per release basis.</para>
+                </listitem>
+            </itemizedlist>
+        </para>
+    </section>
+
+    <section id=3D'test-yocto-project-autobuilder-overview'>
+        <title>Yocto Project Autobuilder Overview</title>
+
+        <para>The Yocto Project Autobuilder collectively refers to the s=
oftware, tools, scripts, and
+            procedures used by the Yocto Project to test released softwa=
re across supported hardware
+            in an automated and regular fashion. Basically, during the d=
evelopment of a Yocto
+            Project release, the Autobuilder tests if things work. The A=
utobuilder builds all test
+            targets and runs all the tests. </para>
+
+        <para>The Yocto Project uses now uses standard upstream  <ulink
+                url=3D"https://docs.buildbot.net/0.9.15.post1/">Buildbot=
</ulink> (version 9) to drive
+            its integration and testing. Buildbot Nine has a plug-in int=
erface that the Yocto
+            Project customizes using code from the <filename>yocto-autob=
uilder2</filename>
+            repository, adding its own console UI plugin. The resulting =
UI plug-in allows you to
+            visualize builds in a way suited to the project's needs.</pa=
ra>
+
+        <para>A <filename>helper</filename> layer provides configuration=
 and job management through
+            scripts found in the <filename>yocto-autobuilder-helper</fil=
ename> repository. The
+                <filename>helper</filename> layer contains the bulk of t=
he build configuration
+            information and is release-specific, which makes it highly c=
ustomizable on a per-project
+            basis. The layer is CI system-agnostic and contains a number=
 of Helper scripts that can
+            generate build configurations from simple JSON files. <note>
+                <para>The project uses Buildbot for historical reasons b=
ut also because many of the
+                    project developers have knowledge of python. It is p=
ossible to use the outer
+                    layers from another Continuous Integration (CI) syst=
em such as <ulink
+                        url=3D"https://en.wikipedia.org/wiki/Jenkins_(so=
ftware)">Jenkins</ulink>
+                    instead of Buildbot. </para>
+            </note>
+        </para>
+
+        <para> The following figure shows the Yocto Project Autobuilder =
stack with a topology that
+            includes a controller and a cluster of workers: <imagedata
+                fileref=3D"figures/ab-test-cluster.png" width=3D"4.6in" =
depth=3D"4.35in" align=3D"center"
+                scalefit=3D"1"/>
+        </para>
+    </section>
+
+    <section id=3D'test-project-tests'>
+        <title>Yocto Project Tests - Types of Testing Overview</title>
+
+        <para>The Autobuilder tests different elements of the project by=
 using thefollowing types of
+            tests: <itemizedlist>
+                <listitem>
+                    <para>
+                        <emphasis>Build Testing:</emphasis> Tests whethe=
r specific configurations
+                        build by varying <ulink url=3D"&YOCTO_DOCS_REF_U=
RL;#var-MACHINE"
+                                ><filename>MACHINE</filename></ulink>, <=
ulink
+                            url=3D"&YOCTO_DOCS_REF_URL;#var-DISTRO"
+                            ><filename>DISTRO</filename></ulink>, other =
configuration options, and
+                        the specific target images being built (or world=
). Used to trigger builds of
+                        all the different test configurations on the Aut=
obuilder. Builds usually
+                        cover many different targets for different archi=
tectures, machines, and
+                        distributions, as well as different configuratio=
ns, such as different init
+                        systems. The Autobuilder tests literally hundred=
s of configurations and
+                        targets. <itemizedlist>
+                            <listitem>
+                                <para>
+                                    <emphasis>Sanity Checks During the B=
uild Process:</emphasis>
+                                    Tests initiated through the <ulink
+                                        url=3D"&YOCTO_DOCS_REF_URL;#ref-=
classes-insane"
+                                            ><filename>insane</filename>=
</ulink> class. These checks
+                                    ensure the output of the builds are =
correct. For example, does
+                                    the ELF architecture in the generate=
d binaries match the target
+                                    system? ARM binaries would not work =
in a MIPS system! </para>
+                            </listitem>
+                        </itemizedlist></para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Build Performance Testing:</emphasis> =
Tests whether or not
+                        commonly used steps during builds work efficient=
ly and avoid regressions.
+                        Tests to time commonly used usage scenarios are =
run through
+                            <filename>oe-build-perf-test</filename>. The=
se tests are run on isolated
+                        machines so that the time measurements of the te=
sts are accurate and no
+                        other processes interfere with the timing result=
s. The project currently
+                        tests performance on two different distributions=
, Fedora and Ubuntu, to
+                        ensure we have no single point of failure and ca=
n ensure the different
+                        distros work effectively. </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>eSDK Testing:</emphasis> Image tests i=
nitiated through the
+                        following command:
+                        <literallayout class=3D"monospaced">
+     $ bitbake <replaceable>image</replaceable> -c testsdkext
+                    </literallayout>
+                        The tests utilize the <filename>testsdkext</file=
name> class and the
+                            <filename>do_testsdkext</filename> task. </p=
ara>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Feature Testing:</emphasis> Various sc=
enario-based tests are run
+                        through the <ulink url=3D"&YOCTO_DOCS_REF_URL;#t=
esting-and-quality-assurance"
+                            >OpenEmbedded Self-Test</ulink> (oe-selftest=
). We test oe-selftest on
+                        each of the main distrubutions we support. </par=
a>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Image Testing:</emphasis> Image tests =
initiated through the
+                        following command:
+                        <literallayout class=3D"monospaced">
+     $ bitbake <replaceable>image</replaceable> -c testimage
+                    </literallayout>
+                        The tests utilize the <ulink
+                            url=3D"&YOCTO_DOCS_REF_URL;#ref-classes-test=
image*"
+                                ><filename>testimage*</filename></ulink>=
 classes and the <ulink
+                            url=3D"&YOCTO_DOCS_REF_URL;#ref-tasks-testim=
age"
+                                ><filename>do_testimage</filename></ulin=
k> task. </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Layer Testing:</emphasis> The Autobuil=
der has the possibility to
+                        test whether specific layers work with the test =
of the system. The layers
+                        tested may be selected by members of the project=
. Some key community layers
+                        are also tested periodically.</para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Package Testing:</emphasis> A Package =
Test (ptest) runs tests
+                        against packages built by the OpenEmbedded build=
 system on the target
+                        machine. See the "<ulink
+                            url=3D"&YOCTO_DOCS_DEV_URL;#testing-packages=
-with-ptest">Testing Packages
+                            With ptest</ulink>" section in the Yocto Pro=
ject Development Tasks
+                        Manual and the "<ulink url=3D"&YOCTO_WIKI_URL;/w=
iki/Ptest">Ptest</ulink>" Wiki
+                        page for more information on Ptest. </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>SDK Testing:</emphasis> Image tests in=
itiated through the
+                        following command:
+                        <literallayout class=3D"monospaced">
+     $ bitbake <replaceable>image</replaceable> -c testsdk
+                    </literallayout>
+                        The tests utilize the <ulink url=3D"&YOCTO_DOCS_=
REF_URL;#ref-classes-testsdk"
+                                ><filename>testsdk</filename></ulink> cl=
ass and the
+                            <filename>do_testsdk</filename> task. </para=
>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Unit Testing:</emphasis> Unit tests on=
 various components of the
+                        system run through <filename>oe-selftest</filena=
me> and <ulink
+                            url=3D"&YOCTO_DOCS_REF_URL;#testing-and-qual=
ity-assurance"
+                                ><filename>bitbake-selftest</filename></=
ulink>. </para>
+                </listitem>
+                <listitem>
+                    <para>
+                        <emphasis>Automatic Upgrade Helper:</emphasis> T=
his target tests whether new
+                        versions of software are available and whether w=
e can automatically upgrade
+                        to those new versions. If so, this target emails=
 the maintainers with a
+                        patch to let them know this is possible.</para>
+                </listitem>
+            </itemizedlist>
+        </para>
+    </section>
+
+    <section id=3D'test-test-mapping'>
+        <title>How Tests Map to Areas of Code</title>
+
+        <para>
+            Tests map into the codebase as follows:
+            <itemizedlist>
+                <listitem><para>
+                        <emphasis>bitbake-selftest</emphasis>: <itemized=
list>
+                            <listitem>
+                                <para>These tests are self-contained and=
 test BitBake as well as its
+                                    APIs, which include the fetchers. Th=
e tests are located in
+                                        <filename>bitbake/lib/*/tests</f=
ilename>. </para>
+                            </listitem>
+                            <listitem>
+                                <para>From within the BitBake repository=
, run the following:
+                                    <literallayout class=3D"monospaced">
+     $ bitbake-selftest
+                            </literallayout>
+                                </para>
+                            </listitem>
+                            <listitem>
+                                <para>To skip tests that access the Inte=
rnet, use the
+                                        <filename>BB_SKIP_NETTEST</filen=
ame> variable when running
+                                    "bitbake-selftest" as follows:
+                                    <literallayout class=3D"monospaced">
+     $ BB_SKIP_NETTEST=3Dyes bitbake-selftest
+                            </literallayout>The
+                                    default output is quiet and just pri=
nts a summary of what was
+                                    run. To see more information, there =
is a verbose
+                                    option:<literallayout>
+     $ bitbake-selftest -v
+                             </literallayout></para>
+                                <para>Use this option when you wish to s=
kip tests that access the
+                                    network, which are mostly necessary =
to test the fetcher modules.
+                                    To specify individual test modules t=
o run, append the test
+                                    module name to the "bitbake-selftest=
" command. For example, to
+                                    specify the tests for the bb.data.mo=
dule, run:
+                                    <literallayout class=3D"monospaced">
+     $ bitbake-selftest bb.test.data.module
+                            </literallayout>You
+                                    can also specify individual tests by=
 defining the full name and
+                                    module plus the class path of the te=
st, for example:
+                                    <literallayout>
+     $ bitbake-selftest bb.tests.data.TestOverrides.test_one_override
+                             </literallayout></para>
+                            </listitem>
+                            <listitem>
+                                <para>The tests are based on <ulink
+                                        url=3D"https://docs.python.org/3=
/library/unittest.html">Python
+                                        unittest</ulink>. </para>
+                            </listitem>
+                        </itemizedlist>
+                    </para></listitem>
+                <listitem><para>
+                        <emphasis>oe-selftest</emphasis>: <itemizedlist>
+                            <listitem>
+                                <para>These tests use OE to test the wor=
kflows, which include
+                                    testing specific features, behaviors=
 of tasks, and API unit
+                                    tests. </para>
+                            </listitem>
+                            <listitem>
+                                <para>The tests can take advantage of pa=
rallelism through the "-j"
+                                    option, which can specify a number o=
f threads to spread the
+                                    tests across. Note that all tests fr=
om a given class of tests
+                                    will run in the same thread. To para=
llelize large numbers of
+                                    tests you can split the class into m=
ultiple units.</para>
+                            </listitem>
+                            <listitem>
+                                <para>The tests are based on Python unit=
test. </para>
+                            </listitem>
+                            <listitem>
+                                <para>The code for the tests resides in
+                                        <filename>meta/lib/oeqa/selftest=
/cases/</filename>. </para>
+                            </listitem>
+                            <listitem>
+                                <para>To run all the tests, enter the fo=
llowing command:
+                                    <literallayout class=3D"monospaced">
+     $ oe-selftest -a
+                            </literallayout>
+                                </para>
+                            </listitem>
+                            <listitem>
+                                <para>To run a specific test, use the fo=
llowing command form where
+                                        <replaceable>testname</replaceab=
le> is the name of the
+                                    specific test:
+                                    <literallayout class=3D"monospaced">
+     $ oe-selftest -r <replaceable>testname</replaceable>
+                            </literallayout>
+                                    For example, the following command w=
ould run the tinfoil getVar
+                                    API
+                                    test:<literallayout>
+     $ oe-selftest -r tinfoil.TinfoilTests.test_getvar
+                            </literallayout>It
+                                    is also possible to run a set of tes=
ts. For example the
+                                    following command will run all of th=
e tinfoil
+                                    tests:<literallayout>
+     $ oe-selftest -r  tinfoil
+                            </literallayout></para>
+                            </listitem>
+                        </itemizedlist>
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>testimage:</emphasis>
+                    <itemizedlist>
+                        <listitem><para>
+                            These tests build an image, boot it, and run=
 tests
+                            against the image's content.
+                            </para></listitem>
+                        <listitem><para> The code for these tests reside=
s in <filename>meta/lib/oeqa/runtime/cases/</filename>. </para></listitem=
>
+                        <listitem><para>
+                            You need to set the
+                            <ulink url=3D'&YOCTO_DOCS_REF_URL;#var-IMAGE=
_CLASSES'><filename>IMAGE_CLASSES</filename></ulink>
+                            variable as follows:
+                            <literallayout class=3D'monospaced'>
+     IMAGE_CLASSES +=3D "testimage"
+                            </literallayout>
+                            </para></listitem>
+                        <listitem><para>
+                            Run the tests using the following command fo=
rm:
+                            <literallayout class=3D'monospaced'>
+     $ bitbake <replaceable>image</replaceable> -c testimage
+                            </literallayout>
+                            </para></listitem>
+                    </itemizedlist>
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>testsdk:</emphasis>
+                    <itemizedlist>
+                        <listitem><para>These tests build an SDK, instal=
l it, and then run tests against that SDK. </para></listitem>
+                        <listitem><para>The code for these tests resides=
 in <filename>meta/lib/oeqa/sdk/cases/</filename>. </para></listitem>
+                        <listitem><para>Run the test using the following=
 command form:
+                                    <literallayout class=3D"monospaced">
+     $ bitbake <replaceable>image</replaceable> -c testsdk
+                            </literallayout>
+                                </para></listitem>
+                    </itemizedlist>
+                    </para></listitem>
+                <listitem><para>
+                    <emphasis>testsdk_ext:</emphasis>
+                    <itemizedlist>
+                        <listitem><para>These tests build an extended SD=
K (eSDK), install that eSDK, and run tests against the eSDK. </para></lis=
titem>
+                        <listitem><para>The code for these tests resides=
 in <filename>meta/lib/oeqa/esdk</filename>. </para></listitem>
+                        <listitem><para>To run the tests, use the follow=
ing command form:
+                                    <literallayout class=3D"monospaced">
+     $ bitbake <replaceable>image</replaceable> -c testsdkext
+                            </literallayout>
+                                </para></listitem>
+                    </itemizedlist>
+                    </para></listitem>
+
+
+                <listitem><para>
+                    <emphasis>oe-build-perf-test:</emphasis>
+                    <itemizedlist>
+                        <listitem><para>These tests run through commonly=
 used usage scenarios and measure the performance times. </para></listite=
m>
+                        <listitem><para>The code for these tests resides=
 in <filename>meta/lib/oeqa/buildperf</filename>. </para></listitem>
+                        <listitem><para>To run the tests, use the follow=
ing command form:
+                                    <literallayout class=3D"monospaced">
+    $ oe-build-perf-test <replaceable>options</replaceable>
+                            </literallayout>The
+                                    command takes a number of options, s=
uch as where to place the
+                                    test results. The Autobuilder Helper=
 Scripts include the
+                                        <filename>build-perf-test-wrappe=
r</filename> script with
+                                    examples of how to use the oe-build-=
perf-test from the command
+                                    line.</para>
+                                <para>Use the <filename>oe-git-archive</=
filename> command to store
+                                    test results into a Git repository. =
</para>
+                                <para>Use the <filename>oe-build-perf-re=
port</filename> command to
+                                    generate text reports and HTML repor=
ts with graphs of the
+                                    performance data. For examples, see =
<link linkend=3D""
+                                        >http://downloads.yoctoproject.o=
rg/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yo=
ctoproject.org_warrior_20190414204758_0e39202.html</link>
+                                    and <link linkend=3D""
+                                        >http://downloads.yoctoproject.o=
rg/releases/yocto/yocto-2.7/testresults/buildperf-centos7/perf-centos7.yo=
ctoproject.org_warrior_20190414204758_0e39202.txt</link>.</para></listite=
m>
+                            <listitem>
+                                <para>The tests are contained in
+                                        <filename>lib/oeqa/buildperf/tes=
t_basic.py</filename>.</para>
+                            </listitem>
+                    </itemizedlist>
+                    </para></listitem>
+
+
+
+
+            </itemizedlist>
+        </para>
+    </section>
+
+    <section id=3D'test-examples'>
+        <title>Test Examples</title>
+
+        <para>This section provides example tests for each of the tests =
listed in the <link
+                linkend=3D"test-test-mapping">How Tests Map to Areas of =
Code</link> section. </para>
+        <para>For oeqa tests, testcases for each area reside in the main=
 test directory at
+                <filename>meta/lib/oeqa/selftest/cases</filename> direct=
ory.</para>
+        <para>For oe-selftest. bitbake testcases reside in the <filename=
>lib/bb/tests/</filename>
+            directory. </para>
+
+        <section id=3D'bitbake-selftest-example'>
+            <title><filename>bitbake-selftest</filename></title>
+
+            <para>A simple test example from <filename>lib/bb/tests/data=
.py</filename> is:
+                <literallayout>
+     class DataExpansions(unittest.TestCase):
+         def setUp(self):
+             self.d =3D bb.data.init()
+             self.d["foo"] =3D "value_of_foo"
+             self.d["bar"] =3D "value_of_bar"      =20
+             self.d["value_of_foo"] =3D "value_of_'value_of_foo'"
+          =20
+          def test_one_var(self):
+             val =3D  self.d.expand("${foo}")
+             self.assertEqual(str(val), "value_of_foo")
+                     </literallayout>
+            </para>
+            <para>In this example, a <ulink url=3D""><filename>DataExpan=
sions</filename></ulink> class
+                of tests is created, derived from standard python unitte=
st. The class has a common
+                    <filename>setUp</filename> function which is shared =
by all the tests in the
+                class. A simple test is then added to test that when a v=
ariable is expanded, the
+                correct value is found.</para>
+            <para>Bitbake selftests are straightforward python unittest.=
 Refer to the Python
+                unittest documentation for additional information on wri=
ting these tests at: <link
+                    linkend=3D"">https://docs.python.org/3/library/unitt=
est.html</link>.</para>
+        </section>
+
+        <section id=3D'oe-selftest-example'>
+            <title><filename>oe-selftest</filename></title>
+
+            <para>These tests are more complex due to the setup required=
 behind the scenes for full
+                builds. Rather than directly using Python's unittest, th=
e code wraps most of the
+                standard objects. The tests can be simple, such as testi=
ng a command from within the
+                OE build environment using the following
+                example:<literallayout>
+     class BitbakeLayers(OESelftestTestCase):
+          def test_bitbakelayers_showcrossdepends(self):
+             result =3D runCmd('bitbake-layers show-cross-depends')     =
 =20
+             self.assertTrue('aspell' in result.output, msg =3D "No depe=
ndencies=20
+     were shown. bitbake-layers show-cross-depends output:
+           %s"% result.output)
+                   </literallayout></para>
+            <para>This example, taken from
+                    <filename>meta/lib/oeqa/selftest/cases/bblayers.py</=
filename>, creates a
+                testcase from the <ulink url=3D""><filename>OESelftestTe=
stCase</filename></ulink>
+                class, derived from <filename>unittest.TestCase</filenam=
e>, which runs the
+                    <filename>bitbake-layers</filename> command and chec=
ks the output to ensure it
+                contains something we know should be here.</para>
+            <para>The <filename>oeqa.utils.commands</filename> module co=
ntains Helpers which can
+                assist with common tasks, including:<itemizedlist>
+                    <listitem>
+                        <para><emphasis>Obtaining the value of a bitbake=
 variable:</emphasis> Use
+                                <filename>oeqa.utils.commands.get_bb_var=
()</filename> or use
+                                <filename>oeqa.utils.commands.get_bb_var=
s()</filename> for more than
+                            one variable</para>
+                    </listitem>
+                    <listitem>
+                        <para><emphasis>Running a bitbake invocation for=
 a build:</emphasis> Use
+                                <filename>oeqa.utils.commands.bitbake()<=
/filename></para>
+                    </listitem>
+                    <listitem>
+                        <para><emphasis>Running a command:</emphasis> Us=
e
+                                <filename>oeqa.utils.commandsrunCmd()</f=
ilename></para>
+                    </listitem>
+                </itemizedlist></para>
+            <para>There is also a <filename>oeqa.utils.commands.runqemu(=
)</filename> function for
+                launching the <filename>runqemu</filename> command for t=
esting things within a
+                running, virtualized image.</para>
+            <para>You can run these tests in parallel. Parallelism works=
 per test class, so tests
+                within a given test class should always run in the same =
build, while  tests in
+                different classes or modules may be split into different=
 builds. There is no data
+                store available for these tests since the tests launch t=
he
+                    <filename>bitbake</filename> command and exist outsi=
de of its context. As a
+                result, common bitbake library functions (bb.*) are also=
 unavailable.</para>
+        </section>
+
+        <section id=3D'testimage-example'>
+            <title><filename>testimage</filename></title>
+
+            <para>These tests are run once an image is up and running, e=
ither on target hardware or
+                under QEMU. As a result, they are assumed to be running =
in a target image
+                environment, as opposed to a host build environment. A s=
imple example from
+                    <filename>meta/lib/oeqa/runtime/cases/python.py</fil=
ename> contains the
+                following:<literallayout>
+     class PythonTest(OERuntimeTestCase):
+         @OETestDepends(['ssh.SSHTest.test_ssh'])
+         @OEHasPackage(['python3-core'])
+         def test_python3(self):
+             cmd =3D "python3 -c \"import codecs; print(codecs.encode('U=
ryyb,
+     jbeyq', 'rot13'))\""
+             status, output =3D self.target.run(cmd)
+             msg =3D 'Exit status was not 0. Output: %s' % output
+             self.assertEqual(status, 0, msg=3Dmsg)
+                    </literallayout></para>
+            <para>In this example, the <ulink url=3D""><filename>OERunti=
meTestCase</filename></ulink>
+                class wraps <filename>unittest.TestCase</filename>. With=
in the test,
+                    <filename>self.target</filename> represents the targ=
et system, where commands
+                can be run on it using the <filename>run()</filename> me=
thod. </para>
+            <para>To ensure certain test or package dependencies are met=
, you can use the
+                    <filename>OETestDepends</filename> and <filename>OEH=
asPackage</filename>
+                decorators. For example, the test in this example would =
only make sense if
+                python3-core is installed in the image.</para>
+        </section>
+
+        <section id=3D'testsdk_ext-example'>
+            <title><filename>testsdk_ext</filename></title>
+
+            <para>These tests are run against built extensible SDKs (eSD=
Ks). The tests can assume
+                that the eSDK environment has already been setup. An exa=
mple from
+                    <filename>meta/lib/oeqa/sdk/cases/devtool.py</filena=
me> contains the
+                following:<literallayout>
+     class DevtoolTest(OESDKExtTestCase):
+          @classmethod
+          def setUpClass(cls):
+          myapp_src =3D os.path.join(cls.tc.esdk_files_dir, "myapp")
+          cls.myapp_dst =3D os.path.join(cls.tc.sdk_dir, "myapp")
+          shutil.copytree(myapp_src, cls.myapp_dst)
+          subprocess.check_output(['git', 'init', '.'], cwd=3Dcls.myapp_=
dst)
+          subprocess.check_output(['git', 'add', '.'], cwd=3Dcls.myapp_d=
st)
+          subprocess.check_output(['git', 'commit', '-m', "'test commit'=
"], cwd=3Dcls.myapp_dst)
+
+         @classmethod
+         def tearDownClass(cls):
+         shutil.rmtree(cls.myapp_dst)
+         def _test_devtool_build(self, directory):
+         self._run('devtool add myapp %s' % directory)
+         try:
+         self._run('devtool build myapp')
+         finally:
+         self._run('devtool reset myapp')
+         def test_devtool_build_make(self):
+         self._test_devtool_build(self.myapp_dst)
+                    </literallayout>In
+                this example, the <filename>devtool</filename> command i=
s tested to see whether a
+                sample application can be built with the <filename>devto=
ol build</filename> command
+                within the eSDK.</para>
+        </section>
+
+        <section id=3D'testsdk-example'>
+            <title><filename>testsdk</filename></title>
+
+            <para>These tests are run against built SDKs. The tests can =
assume that an SDK has
+                already been extracted and its environment file has been=
 sourced. A simple example
+                from <filename>meta/lib/oeqa/sdk/cases/python2.py</filen=
ame> contains the
+                following:<literallayout>
+     class Python3Test(OESDKTestCase):
+         def setUp(self):
+             if not (self.tc.hasHostPackage("nativesdk-python3-core") or
+                     self.tc.hasHostPackage("python3-core-native")):
+                 raise unittest.SkipTest("No python3 package in the SDK"=
)
+
+         def test_python3(self):
+             cmd =3D "python3 -c \"import codecs; print(codecs.encode('U=
ryyb, jbeyq', 'rot13'))\""
+             output =3D self._run(cmd)
+             self.assertEqual(output, "Hello, world\n")
+                    </literallayout>In
+                this example, if nativesdk-python3-core has been install=
ed into the SDK, the code
+                runs the python3 interpreter with a basic command to che=
ck it is working correctly.
+                The test would only run if python3 is installed in the S=
DK.</para>
+        </section>
+
+        <section id=3D'oe-build-perf-test-example'>
+            <title><filename>oe-build-perf-test</filename></title>
+
+            <para>The performance tests usually measure how long operati=
ons take and the resource
+                utilisation as that happens. An example from
+                    <filename>meta/lib/oeqa/buildperf/test_basic.py</fil=
ename> contains the
+                following:<literallayout>
+     class Test3(BuildPerfTestCase):
+
+       def test3(self):
+           """Bitbake parsing (bitbake -p)"""
+           # Drop all caches and parse
+           self.rm_cache()
+           oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'),=
 True)
+           self.measure_cmd_resources(['bitbake', '-p'], 'parse_1',
+                                      'bitbake -p (no caches)')
+           # Drop tmp/cache
+           oe.path.remove(os.path.join(self.bb_vars['TMPDIR'], 'cache'),=
 True)
+           self.measure_cmd_resources(['bitbake', '-p'], 'parse_2',
+                                      'bitbake -p (no tmp/cache)')
+           # Parse with fully cached data
+           self.measure_cmd_resources(['bitbake', '-p'], 'parse_3',
+                                      'bitbake -p (cached)')
+                    </literallayout>This
+                example shows how three specific parsing timings are mea=
sured, with and without
+                various caches, to show how BitBake=E2=80=99s parsing pe=
rformance trends over time.</para>
+        </section>
+    </section>
+    <section id=3D'test-writing-considerations'>
+        <title>Considerations When Writing Tests</title>
+        <para>When writing good tests, there are several things to keep =
in mind. Since things
+            running on the Autobuilder are accessed concurrently by mult=
iple workers, consider the
+            following:</para>
+        <formalpara>
+            <title>Running "cleanall" is not permitted</title>
+            <para>This can delete files from DL_DIR which would potentia=
lly break other builds
+                running in parallel. If this is required, DL_DIR must be=
 set to an isolated
+                directory.</para>
+        </formalpara>
+        <formalpara>
+            <title>Running "cleansstate" is not permitted</title>
+            <para>This can delete files from SSTATE_DIR which would pote=
ntially break other builds
+                running in parallel. If this is required, SSTATE_DIR mus=
t be set to an isolated
+                directory. Alternatively, you can use the "-f" option wi=
th the
+                    <filename>bitbake</filename> command to "taint" task=
s by changing the sstate
+                checksums to ensure sstate cache items will not be reuse=
d.</para>
+        </formalpara>
+        <formalpara>
+            <title>Tests should not change the metadata</title>
+            <para>This is particularly true for oe-selftests since these=
 can run in parallel and
+                changing metadata leads to changing checksums, which con=
fuses BitBake while running
+                in parallel. If this is necessary, copy layers to a temp=
orary location and modify
+                them. Some tests need to change metadata, such as the de=
vtool tests. To prevent the
+                metadate from changes, set up temporary copies of that d=
ata first.</para>
+        </formalpara>
+    </section>
+
+
+
+
+
+
+
+
+</chapter>
+<!--
+vim: expandtab tw=3D80 ts=3D4
+-->
diff --git a/documentation/test-manual/test-manual-style.css b/documentat=
ion/test-manual/test-manual-style.css
new file mode 100644
index 000000000..15ff718b1
--- /dev/null
+++ b/documentation/test-manual/test-manual-style.css
@@ -0,0 +1,989 @@
+/*
+   Generic XHTML / DocBook XHTML CSS Stylesheet.
+
+   Browser wrangling and typographic design by
+      Oyvind Kolas / pippin@gimp.org
+
+   Customised for Poky by
+      Matthew Allum / mallum@o-hand.com
+
+   Thanks to:
+     Liam R. E. Quin
+     William Skaggs
+     Jakub Steiner
+
+   Structure
+   ---------
+
+   The stylesheet is divided into the following sections:
+
+       Positioning
+          Margins, paddings, width, font-size, clearing.
+       Decorations
+          Borders, style
+       Colors
+          Colors
+       Graphics
+          Graphical backgrounds
+       Nasty IE tweaks
+          Workarounds needed to make it work in internet explorer,
+          currently makes the stylesheet non validating, but up until
+          this point it is validating.
+       Mozilla extensions
+          Transparency for footer
+	  Rounded corners on boxes
+
+*/
+
+
+  /*************** /
+ /  Positioning   /
+/ ***************/
+
+body {
+  font-family: Verdana, Sans, sans-serif;
+
+  min-width: 640px;
+  width: 80%;
+  margin:  0em auto;
+  padding: 2em 5em 5em 5em;
+  color: #333;
+}
+
+h1,h2,h3,h4,h5,h6,h7 {
+  font-family: Arial, Sans;
+  color: #00557D;
+  clear: both;
+}
+
+h1 {
+  font-size: 2em;
+  text-align: left;
+  padding: 0em 0em 0em 0em;
+  margin: 2em 0em 0em 0em;
+}
+
+h2.subtitle {
+  margin: 0.10em 0em 3.0em 0em;
+  padding: 0em 0em 0em 0em;
+  font-size: 1.8em;
+  padding-left: 20%;
+  font-weight: normal;
+  font-style: italic;
+}
+
+h2 {
+  margin: 2em 0em 0.66em 0em;
+  padding: 0.5em 0em 0em 0em;
+  font-size: 1.5em;
+  font-weight: bold;
+}
+
+h3.subtitle {
+  margin: 0em 0em 1em 0em;
+  padding: 0em 0em 0em 0em;
+  font-size: 142.14%;
+  text-align: right;
+}
+
+h3 {
+  margin: 1em 0em 0.5em 0em;
+  padding: 1em 0em 0em 0em;
+  font-size: 140%;
+  font-weight: bold;
+}
+
+h4 {
+  margin: 1em 0em 0.5em 0em;
+  padding: 1em 0em 0em 0em;
+  font-size: 120%;
+  font-weight: bold;
+}
+
+h5 {
+  margin: 1em 0em 0.5em 0em;
+  padding: 1em 0em 0em 0em;
+  font-size: 110%;
+  font-weight: bold;
+}
+
+h6 {
+  margin: 1em 0em 0em 0em;
+  padding: 1em 0em 0em 0em;
+  font-size: 110%;
+  font-weight: bold;
+}
+
+.authorgroup {
+  background-color: transparent;
+  background-repeat: no-repeat;
+  padding-top: 256px;
+  background-image: url("figures/test-manual-title.png");
+  background-position: left top;
+  margin-top: -256px;
+  padding-right: 50px;
+  margin-left: 0px;
+  text-align: right;
+  width: 740px;
+}
+
+h3.author {
+  margin: 0em 0me 0em 0em;
+  padding: 0em 0em 0em 0em;
+  font-weight: normal;
+  font-size: 100%;
+  color: #333;
+  clear: both;
+}
+
+.author tt.email {
+  font-size: 66%;
+}
+
+.titlepage hr {
+  width: 0em;
+  clear: both;
+}
+
+.revhistory {
+  padding-top: 2em;
+  clear: both;
+}
+
+.toc,
+.list-of-tables,
+.list-of-examples,
+.list-of-figures {
+  padding: 1.33em 0em 2.5em 0em;
+  color: #00557D;
+}
+
+.toc p,
+.list-of-tables p,
+.list-of-figures p,
+.list-of-examples p {
+  padding: 0em 0em 0em 0em;
+  padding: 0em 0em 0.3em;
+  margin: 1.5em 0em 0em 0em;
+}
+
+.toc p b,
+.list-of-tables p b,
+.list-of-figures p b,
+.list-of-examples p b{
+  font-size: 100.0%;
+  font-weight: bold;
+}
+
+.toc dl,
+.list-of-tables dl,
+.list-of-figures dl,
+.list-of-examples dl {
+  margin: 0em 0em 0.5em 0em;
+  padding: 0em 0em 0em 0em;
+}
+
+.toc dt {
+  margin: 0em 0em 0em 0em;
+  padding: 0em 0em 0em 0em;
+}
+
+.toc dd {
+  margin: 0em 0em 0em 2.6em;
+  padding: 0em 0em 0em 0em;
+}
+
+div.glossary dl,
+div.variablelist dl {
+}
+
+.glossary dl dt,
+.variablelist dl dt,
+.variablelist dl dt span.term {
+  font-weight: normal;
+  width: 20em;
+  text-align: right;
+}
+
+.variablelist dl dt {
+  margin-top: 0.5em;
+}
+
+.glossary dl dd,
+.variablelist dl dd {
+  margin-top: 0em;
+  margin-left: 25.5em;
+}
+
+.glossary dd p,
+.variablelist dd p {
+  margin-top: 0em;
+  margin-bottom: 1em;
+}
+
+
+div.calloutlist table td {
+  padding: 0em 0em 0em 0em;
+  margin: 0em 0em 0em 0em;
+}
+
+div.calloutlist table td p {
+  margin-top: 0em;
+  margin-bottom: 1em;
+}
+
+div p.copyright {
+  text-align: left;
+}
+
+div.legalnotice p.legalnotice-title {
+  margin-bottom: 0em;
+}
+
+p {
+  line-height: 1.5em;
+  margin-top: 0em;
+
+}
+
+dl {
+  padding-top: 0em;
+}
+
+hr {
+  border: solid 1px;
+}
+
+
+.mediaobject,
+.mediaobjectco {
+  text-align: center;
+}
+
+img {
+  border: none;
+}
+
+ul {
+  padding: 0em 0em 0em 1.5em;
+}
+
+ul li {
+  padding: 0em 0em 0em 0em;
+}
+
+ul li p {
+  text-align: left;
+}
+
+table {
+  width :100%;
+}
+
+th {
+  padding: 0.25em;
+  text-align: left;
+  font-weight: normal;
+  vertical-align: top;
+}
+
+td {
+  padding: 0.25em;
+  vertical-align: top;
+}
+
+p a[id] {
+  margin: 0px;
+  padding: 0px;
+  display: inline;
+  background-image: none;
+}
+
+a {
+  text-decoration: underline;
+  color: #444;
+}
+
+pre {
+    overflow: auto;
+}
+
+a:hover {
+  text-decoration: underline;
+  /*font-weight: bold;*/
+}
+
+/* This style defines how the permalink character
+   appears by itself and when hovered over with
+   the mouse. */
+
+[alt=3D'Permalink'] { color: #eee; }
+[alt=3D'Permalink']:hover { color: black; }
+
+
+div.informalfigure,
+div.informalexample,
+div.informaltable,
+div.figure,
+div.table,
+div.example {
+  margin: 1em 0em;
+  padding: 1em;
+  page-break-inside: avoid;
+}
+
+
+div.informalfigure p.title b,
+div.informalexample p.title b,
+div.informaltable p.title b,
+div.figure p.title b,
+div.example p.title b,
+div.table p.title b{
+    padding-top: 0em;
+    margin-top: 0em;
+    font-size: 100%;
+    font-weight: normal;
+}
+
+.mediaobject .caption,
+.mediaobject .caption p  {
+  text-align: center;
+  font-size: 80%;
+  padding-top: 0.5em;
+  padding-bottom: 0.5em;
+}
+
+.epigraph {
+  padding-left: 55%;
+  margin-bottom: 1em;
+}
+
+.epigraph p {
+  text-align: left;
+}
+
+.epigraph .quote {
+  font-style: italic;
+}
+.epigraph .attribution {
+  font-style: normal;
+  text-align: right;
+}
+
+span.application {
+  font-style: italic;
+}
+
+.programlisting {
+  font-family: monospace;
+  font-size: 80%;
+  white-space: pre;
+  margin: 1.33em 0em;
+  padding: 1.33em;
+}
+
+.tip,
+.warning,
+.caution,
+.note {
+  margin-top: 1em;
+  margin-bottom: 1em;
+
+}
+
+/* force full width of table within div */
+.tip table,
+.warning table,
+.caution table,
+.note table {
+  border: none;
+  width: 100%;
+}
+
+
+.tip table th,
+.warning table th,
+.caution table th,
+.note table th {
+  padding: 0.8em 0.0em 0.0em 0.0em;
+  margin : 0em 0em 0em 0em;
+}
+
+.tip p,
+.warning p,
+.caution p,
+.note p {
+  margin-top: 0.5em;
+  margin-bottom: 0.5em;
+  padding-right: 1em;
+  text-align: left;
+}
+
+.acronym {
+  text-transform: uppercase;
+}
+
+b.keycap,
+.keycap {
+  padding: 0.09em 0.3em;
+  margin: 0em;
+}
+
+.itemizedlist li {
+  clear: none;
+}
+
+.filename {
+  font-size: medium;
+  font-family: Courier, monospace;
+}
+
+
+div.navheader, div.heading{
+  position: absolute;
+  left: 0em;
+  top: 0em;
+  width: 100%;
+  background-color: #cdf;
+  width: 100%;
+}
+
+div.navfooter, div.footing{
+  position: fixed;
+  left: 0em;
+  bottom: 0em;
+  background-color: #eee;
+  width: 100%;
+}
+
+
+div.navheader td,
+div.navfooter td {
+  font-size: 66%;
+}
+
+div.navheader table th {
+  /*font-family: Georgia, Times, serif;*/
+  /*font-size: x-large;*/
+  font-size: 80%;
+}
+
+div.navheader table {
+  border-left: 0em;
+  border-right: 0em;
+  border-top: 0em;
+  width: 100%;
+}
+
+div.navfooter table {
+  border-left: 0em;
+  border-right: 0em;
+  border-bottom: 0em;
+  width: 100%;
+}
+
+div.navheader table td a,
+div.navfooter table td a {
+  color: #777;
+  text-decoration: none;
+}
+
+/* normal text in the footer */
+div.navfooter table td {
+  color: black;
+}
+
+div.navheader table td a:visited,
+div.navfooter table td a:visited {
+  color: #444;
+}
+
+
+/* links in header and footer */
+div.navheader table td a:hover,
+div.navfooter table td a:hover {
+  text-decoration: underline;
+  background-color: transparent;
+  color: #33a;
+}
+
+div.navheader hr,
+div.navfooter hr {
+  display: none;
+}
+
+
+.qandaset tr.question td p {
+  margin: 0em 0em 1em 0em;
+  padding: 0em 0em 0em 0em;
+}
+
+.qandaset tr.answer td p {
+  margin: 0em 0em 1em 0em;
+  padding: 0em 0em 0em 0em;
+}
+.answer td {
+  padding-bottom: 1.5em;
+}
+
+.emphasis {
+  font-weight: bold;
+}
+
+
+  /************* /
+ / decorations  /
+/ *************/
+
+.titlepage {
+}
+
+.part .title {
+}
+
+.subtitle {
+    border: none;
+}
+
+/*
+h1 {
+  border: none;
+}
+
+h2 {
+  border-top: solid 0.2em;
+  border-bottom: solid 0.06em;
+}
+
+h3 {
+  border-top: 0em;
+  border-bottom: solid 0.06em;
+}
+
+h4 {
+  border: 0em;
+  border-bottom: solid 0.06em;
+}
+
+h5 {
+  border: 0em;
+}
+*/
+
+.programlisting {
+  border: solid 1px;
+}
+
+div.figure,
+div.table,
+div.informalfigure,
+div.informaltable,
+div.informalexample,
+div.example {
+  border: 1px solid;
+}
+
+
+
+.tip,
+.warning,
+.caution,
+.note {
+  border: 1px solid;
+}
+
+.tip table th,
+.warning table th,
+.caution table th,
+.note table th {
+  border-bottom: 1px solid;
+}
+
+.question td {
+  border-top: 1px solid black;
+}
+
+.answer {
+}
+
+
+b.keycap,
+.keycap {
+  border: 1px solid;
+}
+
+
+div.navheader, div.heading{
+  border-bottom: 1px solid;
+}
+
+
+div.navfooter, div.footing{
+  border-top: 1px solid;
+}
+
+  /********* /
+ /  colors  /
+/ *********/
+
+body {
+  color: #333;
+  background: white;
+}
+
+a {
+  background: transparent;
+}
+
+a:hover {
+  background-color: #dedede;
+}
+
+
+h1,
+h2,
+h3,
+h4,
+h5,
+h6,
+h7,
+h8 {
+  background-color: transparent;
+}
+
+hr {
+  border-color: #aaa;
+}
+
+
+.tip, .warning, .caution, .note {
+  border-color: #fff;
+}
+
+
+.tip table th,
+.warning table th,
+.caution table th,
+.note table th {
+  border-bottom-color: #fff;
+}
+
+
+.warning {
+  background-color: #f0f0f2;
+}
+
+.caution {
+  background-color: #f0f0f2;
+}
+
+.tip {
+  background-color: #f0f0f2;
+}
+
+.note {
+  background-color: #f0f0f2;
+}
+
+.glossary dl dt,
+.variablelist dl dt,
+.variablelist dl dt span.term {
+  color: #044;
+}
+
+div.figure,
+div.table,
+div.example,
+div.informalfigure,
+div.informaltable,
+div.informalexample {
+  border-color: #aaa;
+}
+
+pre.programlisting {
+  color: black;
+  background-color: #fff;
+  border-color: #aaa;
+  border-width: 2px;
+}
+
+.guimenu,
+.guilabel,
+.guimenuitem {
+  background-color: #eee;
+}
+
+
+b.keycap,
+.keycap {
+  background-color: #eee;
+  border-color: #999;
+}
+
+
+div.navheader {
+  border-color: black;
+}
+
+
+div.navfooter {
+  border-color: black;
+}
+
+.writernotes {
+  color: red;
+}
+
+
+  /*********** /
+ /  graphics  /
+/ ***********/
+
+/*
+body {
+  background-image: url("images/body_bg.jpg");
+  background-attachment: fixed;
+}
+
+.navheader,
+.note,
+.tip {
+  background-image: url("images/note_bg.jpg");
+  background-attachment: fixed;
+}
+
+.warning,
+.caution {
+  background-image: url("images/warning_bg.jpg");
+  background-attachment: fixed;
+}
+
+.figure,
+.informalfigure,
+.example,
+.informalexample,
+.table,
+.informaltable {
+  background-image: url("images/figure_bg.jpg");
+  background-attachment: fixed;
+}
+
+*/
+h1,
+h2,
+h3,
+h4,
+h5,
+h6,
+h7{
+}
+
+/*
+Example of how to stick an image as part of the title.
+
+div.article .titlepage .title
+{
+  background-image: url("figures/white-on-black.png");
+  background-position: center;
+  background-repeat: repeat-x;
+}
+*/
+
+div.preface .titlepage .title,
+div.colophon .title,
+div.chapter .titlepage .title,
+div.article .titlepage .title
+{
+}
+
+div.section div.section .titlepage .title,
+div.sect2 .titlepage .title {
+    background: none;
+}
+
+
+h1.title {
+  background-color: transparent;
+  background-image: url("figures/test-title.png");
+  background-repeat: no-repeat;
+  height: 256px;
+  text-indent: -9000px;
+  overflow:hidden;
+}
+
+h2.subtitle {
+  background-color: transparent;
+  text-indent: -9000px;
+  overflow:hidden;
+  width: 0px;
+  display: none;
+}
+
+  /*************************************** /
+ /  pippin.gimp.org specific alterations  /
+/ ***************************************/
+
+/*
+div.heading, div.navheader {
+  color: #777;
+  font-size: 80%;
+  padding: 0;
+  margin: 0;
+  text-align: left;
+  position: absolute;
+  top: 0px;
+  left: 0px;
+  width: 100%;
+  height: 50px;
+  background: url('/gfx/heading_bg.png') transparent;
+  background-repeat: repeat-x;
+  background-attachment: fixed;
+  border: none;
+}
+
+div.heading a {
+  color: #444;
+}
+
+div.footing, div.navfooter {
+  border: none;
+  color: #ddd;
+  font-size: 80%;
+  text-align:right;
+
+  width: 100%;
+  padding-top: 10px;
+  position: absolute;
+  bottom: 0px;
+  left: 0px;
+
+  background: url('/gfx/footing_bg.png') transparent;
+}
+*/
+
+
+
+  /****************** /
+ /  nasty ie tweaks  /
+/ ******************/
+
+/*
+div.heading, div.navheader {
+  width:expression(document.body.clientWidth + "px");
+}
+
+div.footing, div.navfooter {
+  width:expression(document.body.clientWidth + "px");
+  margin-left:expression("-5em");
+}
+body {
+  padding:expression("4em 5em 0em 5em");
+}
+*/
+
+  /**************************************** /
+ / mozilla vendor specific css extensions  /
+/ ****************************************/
+/*
+div.navfooter, div.footing{
+  -moz-opacity: 0.8em;
+}
+
+div.figure,
+div.table,
+div.informalfigure,
+div.informaltable,
+div.informalexample,
+div.example,
+.tip,
+.warning,
+.caution,
+.note {
+  -moz-border-radius: 0.5em;
+}
+
+b.keycap,
+.keycap {
+  -moz-border-radius: 0.3em;
+}
+*/
+
+table tr td table tr td {
+  display: none;
+}
+
+
+hr {
+  display: none;
+}
+
+table {
+  border: 0em;
+}
+
+ .photo {
+  float: right;
+  margin-left:   1.5em;
+  margin-bottom: 1.5em;
+  margin-top: 0em;
+  max-width:      17em;
+  border:     1px solid gray;
+  padding:    3px;
+  background: white;
+}
+ .seperator {
+   padding-top: 2em;
+   clear: both;
+  }
+
+  #validators {
+      margin-top: 5em;
+      text-align: right;
+      color: #777;
+  }
+  @media print {
+      body {
+          font-size: 8pt;
+      }
+      .noprint {
+          display: none;
+      }
+  }
+
+
+.tip,
+.note {
+   background: #f0f0f2;
+   color: #333;
+   padding: 20px;
+   margin: 20px;
+}
+
+.tip h3,
+.note h3 {
+   padding: 0em;
+   margin: 0em;
+   font-size: 2em;
+   font-weight: bold;
+   color: #333;
+}
+
+.tip a,
+.note a {
+   color: #333;
+   text-decoration: underline;
+}
+
+.footnote {
+   font-size: small;
+   color: #333;
+}
+
+/* Changes the announcement text */
+.tip h3,
+.warning h3,
+.caution h3,
+.note h3 {
+   font-size:large;
+   color: #00557D;
+}
diff --git a/documentation/test-manual/test-manual-test-process.xml b/doc=
umentation/test-manual/test-manual-test-process.xml
new file mode 100644
index 000000000..0b5036cd2
--- /dev/null
+++ b/documentation/test-manual/test-manual-test-process.xml
@@ -0,0 +1,109 @@
+<!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
+"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
+[<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+
+<chapter id=3D'test-manual-test-process'>
+
+<title>Project Testing and Release Process</title>
+    <section id=3D'test-daily-devel'>
+        <title>Day to Day Development</title>
+
+        <para>This section details how the project tests changes, throug=
h automation on the
+            Autobuilder or with the assistance of QA teams, through to m=
aking releases.</para>
+
+        <para>The project aims to test changes against our test matrix b=
efore those changes are
+            merged into the master branch. As such, changes are queued u=
p in batches either in the
+                <filename>master-next</filename> branch in the main tree=
s, or in user trees such as
+                <filename>ross/mut</filename> in <filename>poky-contrib<=
/filename> (Ross Burton
+            helps review and test patches and this is his testing tree).=
</para>
+        <para>We have two broad categories of test builds, including "fu=
ll" and "quick". On the
+            Autobuilder, these can be seen as "a-quick" and "a-full", si=
mply for ease of sorting in
+            the UI. Use our Autobuilder console view to see where me man=
age most test-related items,
+            available at: <link linkend=3D""
+                >https://autobuilder.yoctoproject.org/typhoon/#/console<=
/link>.</para>
+        <para>Builds are triggered manually when the test branches are r=
eady. The builds are
+            monitored by the SWAT team. For additional information, see =
<link linkend=3D""
+                >https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_=
Swat_Team</link>. If
+            successful, the changes would usually be merged to the <file=
name>master</filename>
+            branch. If not successful, someone would respond to the chan=
ges on the mailing list
+            explaining that there was a failure in testing. The choice o=
f quick or full would depend
+            on the type of changes and the speed with which the result w=
as required.</para>
+        <para>The Autobuilder does build the <filename>master</filename>=
 branch once daily for
+            several reasons, in particular, to ensure the current <filen=
ame>master</filename> branch
+            does build, but also to keep <filename>yocto-testresults</fi=
lename> (<link linkend=3D""
+                >http://git.yoctoproject.org/cgit.cgi/yocto-testresults/=
</link>), buildhistory
+                (<link linkend=3D"">http://git.yoctoproject.org/cgit.cgi=
/poky-buildhistory/</link>),
+            and our sstate up to date. On the weekend, there is a master=
-next build instead to
+            ensure the test results are updated for the less frequently =
run targets.</para>
+        <para>Performance builds (buildperf-* targets in the console) ar=
e triggered separately every
+            six hours and automatically push their results to the builds=
tats repository at: <link
+                linkend=3D"">http://git.yoctoproject.org/cgit.cgi/yocto-=
buildstats/</link>. </para>
+        <para>The 'quick' targets have been selected to be the ones whic=
h catch the most failures or
+            give the most valuable data. We run 'fast' ptests in this ca=
se for example but not the
+            ones which take a long time. The quick target doesn't includ=
e *-lsb builds for all
+            architectures, some world builds and doesn't trigger perform=
ance tests or ltp testing.
+            The full build includes all these things and is slower but m=
ore comprehensive.</para>
+    </section>
+
+    <section id=3D'test-yocto-project-autobuilder-overview'>
+        <title>Release Builds</title>
+
+        <para>The project typically has two major releases a year with a=
 six month cadence in April
+            and October. Between these there would be a number of milest=
one releases (usually four)
+            with the final one being stablization only along with point =
releases of our stable
+            branches.</para>
+        <para>The build and release process for these project releases i=
s similar to that in <link
+                linkend=3D"test-daily-devel">Day to Day Development</lin=
k>, in that the a-full target
+            of the Autobuilder is used but in addition the form is confi=
gured to generate and
+            publish artefacts and the milestone number, version, release=
 candidate number and other
+            information is entered. The box to "generate an email to QA"=
is also checked.</para>
+        <para>When the build completes, an email is sent out using the s=
end-qa-email script in the
+                <filename>yocto-autobuilder-helper</filename> repository=
 to the list of people
+            configured for that release. Release builds are placed into =
a directory in <link
+                linkend=3D"">https://autobuilder.yocto.io/pub/releases</=
link> on the Autobuilder which
+            is included in the email. The process from here is more manu=
al and control is
+            effectively passed to release engineering. The next steps in=
clude:<itemizedlist>
+                <listitem>
+                    <para>QA teams respond to the email saying which tes=
ts they plan to run and when
+                        the results will be available.</para>
+                </listitem>
+                <listitem>
+                    <para>QA teams run their tests and share their resul=
ts in the yocto-
+                        testresults-contrib repository, along with a sum=
mary of their findings.
+                    </para>
+                </listitem>
+                <listitem>
+                    <para>Release engineering prepare the release as per=
 their process. </para>
+                </listitem>
+                <listitem>
+                    <para>Test results from the QA teams are included in=
to the release in separate
+                        directories and also uploaded to the yocto-testr=
esults repository alongside
+                        the other test results for the given revision.</=
para>
+                </listitem>
+                <listitem>
+                    <para>The QA report in the final release is regenera=
ted using resulttool to
+                        include the new test results and the test summar=
ies from the teams (as
+                        headers to the generated report).</para>
+                </listitem>
+                <listitem>
+                    <para>The release is checked against the release che=
cklist and release readiness
+                        criteria.</para>
+                </listitem>
+                <listitem>
+                    <para>A final decision on whether to release is made=
 by the YP TSC who have
+                        final oversight on release readiness.</para>
+                </listitem>
+            </itemizedlist></para>
+    </section>
+
+
+
+
+
+
+
+
+</chapter>
+<!--
+vim: expandtab tw=3D80 ts=3D4
+-->
diff --git a/documentation/test-manual/test-manual-understand-autobuilder=
.xml b/documentation/test-manual/test-manual-understand-autobuilder.xml
new file mode 100644
index 000000000..754130535
--- /dev/null
+++ b/documentation/test-manual/test-manual-understand-autobuilder.xml
@@ -0,0 +1,312 @@
+<!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
+"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
+[<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+
+<chapter id=3D'test-manual-understand-autobuilder'>
+
+<title>Understanding the Yocto Project Autobuilder</title>
+    <section>
+        <title>Execution Flow within the Autobuilder</title>
+        <para>The =E2=80=9Ca-full=E2=80=9D and =E2=80=9Ca-quick=E2=80=9D=
 targets are the usual entry points into the Autobuilder and
+            it makes sense to follow the process through the system star=
ting there. This is best
+            visualised from the Autobuilder Console view (<link linkend=3D=
""
+                >https://autobuilder.yoctoproject.org/typhoon/#/console<=
/link>). </para>
+        <para>Each item along the top of that view represents some =E2=80=
=9Ctarget build=E2=80=9D and these targets
+            are all run in parallel. The =E2=80=98full=E2=80=99 build wi=
ll trigger the majority of them, the =E2=80=9Cquick=E2=80=9D
+            build will trigger some subset of them. The Autobuilder effe=
ctively runs whichever
+            configuration is defined for each of those targets on a sepe=
rate buildbot worker. To
+            understand the configuration, you need to look at the entry =
on
+                <filename>config.json</filename> file within the
+                <filename>yocto-autobuilder-helper</filename> repository=
. The targets are defined in
+            the =E2=80=98overrides=E2=80=99 section, a quick example cou=
ld be qemux86-64 which looks
+            like:<literallayout>
+     "qemux86-64" : {
+         "MACHINE" : "qemux86-64",
+         "TEMPLATE" : "arch-qemu",
+         "step1" : {
+             "extravars" : [
+                  "IMAGE_FSTYPES_append =3D ' wic wic.bmap'"
+             ]
+         }
+     },
+                    </literallayout>And
+            to expand that, you need the =E2=80=9Carch-qemu=E2=80=9D ent=
ry from the =E2=80=9Ctemplates=E2=80=9D section, which looks
+            like:<literallayout>
+     "arch-qemu" : {
+         "BUILDINFO" : true,
+         "BUILDHISTORY" : true,
+         "step1" : {
+             "BBTARGETS" : "core-image-sato core-image-sato-dev core-ima=
ge-sato-sdk core-image-minimal core-image-minimal-dev core-image-sato:do_=
populate_sdk",
+             "SANITYTARGETS" : "core-image-minimal:do_testimage core-ima=
ge-sato:do_testimage core-image-sato-sdk:do_testimage core-image-sato:do_=
testsdk"
+         },
+         "step2" : {
+             "SDKMACHINE" : "x86_64",
+             "BBTARGETS" : "core-image-sato:do_populate_sdk core-image-m=
inimal:do_populate_sdk_ext core-image-sato:do_populate_sdk_ext",
+             "SANITYTARGETS" : "core-image-sato:do_testsdk core-image-mi=
nimal:do_testsdkext core-image-sato:do_testsdkext"
+         },
+         "step3" : {
+             "BUILDHISTORY" : false,
+             "EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc; DISPLAY=3D:1 oe-sel=
ftest ${HELPERSTMACHTARGS} -j 15"],
+             "ADDLAYER" : ["${BUILDDIR}/../meta-selftest"]
+         }
+     },
+                    </literallayout>Combining
+            these two entries you can see that =E2=80=9Cqemux86-64=E2=80=
=9D is a three step build where the =E2=80=9Cbitbake
+            BBTARGETS=E2=80=9D would be run, then =E2=80=9Cbitbake SANIT=
YTARGETS=E2=80=9D for each step; all for
+            MACHINE=3D=E2=80=9Dqemx86-64=E2=80=9D but with differing SDK=
MACHINE settings. In step 1 an extra variable
+            is added to the <filename>auto.conf</filename> file to enabl=
e wic image
+            generation.</para>
+        <para>While not every detail of this is covered here, you can se=
e how the templating
+            mechanism allows quite complex configurations to be built up=
 yet allows duplication and
+            repetition to be kept to a minimum.</para>
+        <para>The different build targets are designed to allow for para=
llelisation, so different
+            machines are usually built in parallel, operations using the=
 same machine and metadata
+            are built sequentially, with the aim of trying to optimise b=
uild efficiency as much as
+            possible.</para>
+        <para>The <filename>config.json</filename> file is processed by =
the scripts in the Helper
+            repository in the <filename>scripts</filename> directory. Th=
e following  section details
+            how this works.</para>
+    </section>
+
+    <section id=3D'test-autobuilder-target-exec-overview'>
+        <title>Autobuilder Target Execution Overview</title>
+
+        <para>For each given target in a build, the Autobuilder executes=
 several steps. These are
+            configured in <filename>yocto-autobuilder2/builders.py</file=
name> and roughly consist
+            of: <orderedlist>
+                <listitem id=3D'test-list-tgt-exec-clobberdir'>
+                    <para><emphasis>Run <filename>clobberdir</filename><=
/emphasis></para>
+                    <para>This cleans out any previous build. Old builds=
 are left around to allow
+                        easier debugging of failed builds. For additiona=
l information, see <link
+                            linkend=3D"test-clobberdir"><filename>clobbe=
rdir</filename></link>.</para>
+                </listitem>
+                <listitem>
+                    <para><emphasis>Obtain yocto-autobuilder-helper</emp=
hasis></para>
+                    <para>This step clones the <filename>yocto-autobuild=
er-helper</filename> git
+                        repository. This is necessary to prevent the req=
uirement to maintain all the
+                        release or project-specific code within Buildbot=
. The branch chosen matches
+                        the release being built so we can support older =
releases and still make
+                        changes in newer ones.</para>
+                </listitem>
+                <listitem>
+                    <para><emphasis>Write layerinfo.json</emphasis></par=
a>
+                    <para>This transfers data in the Buildbot UI when th=
e build was configured to
+                        the Helper.</para>
+                </listitem>
+                <listitem>
+                    <para><emphasis>Call scripts/shared-repo-unpack</emp=
hasis></para>
+                    <para>This is a call into the Helper scripts to set =
up a checkout of all the
+                        pieces this build might need. It might clone the=
 BitBake repository and the
+                        OpenEmbedded-Core repository. It may clone the P=
oky repository, as well as
+                        additional layers. It will use the data from the
+                            <filename>layerinfo.json</filename> file to =
help understand the
+                        configuration. It will also use a local cache of=
 repositories to speed up
+                        the clone checkouts. For additional information,=
 see <link
+                            linkend=3D"test-autobuilder-clone-cache">Aut=
obuilder Clone
+                        Cache</link>.</para>
+                    <para>This step has two possible modes of operation.=
 If the build is part of a
+                        parent build, its possible that all the reposito=
ries needed may already be
+                        available, ready in a pre-prepared directory. An=
 "a-quick" or "a-full" build
+                        would prepare this before starting the other sub=
-target builds. This is done
+                        for two reasons:<itemizedlist>
+                            <listitem>
+                                <para>the upstream may change during a b=
uild, for example, from a
+                                    forced push and this ensures we have=
 matching content for the
+                                    whole build</para>
+                            </listitem>
+                            <listitem>
+                                <para>if 15 Workers all tried to pull th=
e same data from the same
+                                    repos, we can hit resource limits on=
 upstream servers as they
+                                    can think they are under some kind o=
f network attack</para>
+                            </listitem>
+                        </itemizedlist>This pre-prepared directory is sh=
ared among the Workers over
+                        NFS. If the build is an individual build and the=
re is no "shared" directory
+                        available, it would clone from the cache and the=
 upstreams as necessary.
+                        This is considered the fallback mode.</para>
+                </listitem>
+                <listitem>
+                    <para><emphasis>Call scripts/run-config</emphasis></=
para>
+                    <para>This is another call into the Helper scripts w=
here its expected that the
+                        main functionality of this target will be execut=
ed.</para>
+                </listitem>
+            </orderedlist></para>
+    </section>
+    <section id=3D'test-autobuilder-tech'>
+        <title>Autobuilder Technology</title>
+        <para>The Autobuilder has Yocto Project-specific functionality t=
o allow builds to operate
+            with increased efficiency and speed.</para>
+        <section id=3D'test-clobberdir'>
+            <title>clobberdir</title>
+            <para>When deleting files, the Autobuilder uses <filename>cl=
obberdir</filename>, which
+                is a special script that moves files to a special locati=
on, rather than deleting
+                them. Files in this location are deleted by an <filename=
>rm</filename> command,
+                which is run under <filename>ionice -c 3</filename>. For=
 example, the deletion only
+                happens when there is idle IO capacity on the Worker. Th=
e Autobuilder Worker Janitor
+                runs this deletion. See <link linkend=3D"test-autobuilde=
r-worker-janitor">Autobuilder
+                    Worker Janitor</link>.</para>
+        </section>
+        <section id=3D'test-autobuilder-clone-cache'>
+            <title>Autobuilder Clone Cache</title>
+            <para>Cloning repositories from scratch each time they are r=
equired was slow on the
+                Autobuilder. We therefore have a stash of commonly used =
repositories pre-cloned on
+                the Workers. Data is fetched from these during clones fi=
rst, then "topped up" with
+                later revisions from any upstream when necesary. The cac=
he is maintained by the
+                Autobuilder Worker Janitor. See <link linkend=3D"test-au=
tobuilder-worker-janitor"
+                    >Autobuilder Worker Janitor</link>.</para>
+        </section>
+        <section id=3D'test-autobuilder-worker-janitor'>
+            <title>Autobuilder Worker Janitor</title>
+            <para>This is a process running on each Worker that performs=
 two basic operations,
+                including background file deletion at IO idle (see <link
+                    linkend=3D"test-list-tgt-exec-clobberdir">Target Exe=
cution: clobberdir</link>) and
+                maintainenance of a cache of cloned repositories to impr=
ove the speed the system can
+                checkout repositories.</para>
+        </section>
+        <section id=3D'test-shared-dl-dir'>
+            <title>Shared DL_DIR</title>
+            <para>The Workers are all connected over NFS which allows DL=
_DIR to be shared between
+                them. This reduces network accesses from the system and =
allows the build to be sped
+                up. Usage of the directory within the build system is de=
signed to be able to be
+                shared over NFS.</para>
+        </section>
+        <section id=3D'test-shared-sstate-cache'>
+            <title>Shared SSTATE_DIR</title>
+            <para>The Workers are all connected over NFS which allows th=
e
+                    <filename>sstate</filename> directory to be shared b=
etween them. This means once
+                a Worker has built an artefact, all the others can benef=
it from it. Usage of the
+                directory within the directory is designed for sharing o=
ver NFS.</para>
+        </section>
+        <section id=3D'test-resulttool'>
+            <title>Resulttool</title>
+            <para>All of the different tests run as part of the build ge=
nerate output into
+                    <filename>testresults.json</filename> files. This al=
lows us to determine which
+                tests ran in a given build and their status. Additional =
information, such as failure
+                logs or the time taken to run the tests, may also be inc=
luded.</para>
+            <para>Resulttool is part of OpenEmbedded-Core and is used to=
 manipulate these json
+                results files. It has the ability to merge files togethe=
r, display reports of the
+                test results and compare different result files.</para>
+            <para>For details, see <link linkend=3D""
+                    >https://wiki.yoctoproject.org/wiki/Resulttool</link=
>.</para>
+        </section>
+    </section>
+    <section id=3D'test-run-config-tgt-execution'>
+        <title>run-config Target Execution</title>
+        <para>The <filename>scripts/run-config</filename> execution is w=
here most of the work within
+            the Autobuilder happens. It runs through a number of steps; =
the first are general setup
+            steps that are run once and include:<orderedlist>
+                <listitem>
+                    <para>Set up any <filename>buildtools-tarball</filen=
ame> if configured.</para>
+                </listitem>
+                <listitem>
+                    <para>Call "buildhistory-init" if buildhistory is co=
nfigured.</para>
+                </listitem>
+            </orderedlist></para>
+        <para>For each step that is configured in <filename>config.json<=
/filename>, it will perform
+            the following:</para>
+        <para>
+            <remark>## WRITER's question: What does "logging in as stepX=
a" and others refer to
+                below? ##</remark>
+            <orderedlist>
+                <listitem id=3D"test-run-config-add-layers-step">
+                    <para dir=3D"ltr">Add any layers that are specified =
using the
+                            <filename>bitbake-layers add-layer</filename=
> command (logging as
+                        stepXa)</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Call the <filename>scripts/setup-c=
onfig</filename> script to
+                        generate the necessary <filename>auto.conf</file=
name> configuration file for
+                        the build</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Run the <filename>bitbake BBTARGET=
S</filename> command (logging
+                        as stepXb)</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Run the <filename>bitbake SANITYTA=
RGETS</filename> command
+                        (logging as stepXc)</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Run the <filename>EXTRACMDS</filen=
ame> command, which are run
+                        within the BitBake build environment (logging as=
 stepXd)</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Run the <filename>EXTRAPLAINCMDS</=
filename> command(s), which
+                        are run outside the BitBake build environment (l=
ogging as stepXd)</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Remove any layers added in <link
+                            linkend=3D"test-run-config-add-layers-step">=
step 1</link> using the
+                            <filename>bitbake-layers remove-layer</filen=
ame> command (logging as
+                        stepXa)</para>
+                </listitem>
+            </orderedlist>
+        </para>
+        <para>Once the execution steps above complete, <filename>run-con=
fig</filename> executes a
+            set of post-build steps, including:<orderedlist>
+                <listitem>
+                    <para dir=3D"ltr">Call <filename>scripts/publish-art=
ifacts</filename> to collect
+                        any output which is to be saved from the build.<=
/para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Call <filename>scripts/collect-res=
ults</filename> to collect any
+                        test results to be saved from the build.</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Call <filename>scripts/upload-erro=
r-reports</filename> to send
+                        any error reports generated to the remote server=
.</para>
+                </listitem>
+                <listitem>
+                    <para dir=3D"ltr">Cleanup the build directory using =
<link
+                            linkend=3D"test-clobberdir"><filename>clobbe=
rdir</filename></link> if the
+                        build was successful, else rename it to =E2=80=9C=
build-renamed=E2=80=9D for potential future
+                        debugging.</para>
+                </listitem>
+            </orderedlist></para>
+    </section>
+    <section id=3D'test-deploying-yp-autobuilder'>
+        <title>Deploying Yocto Autobuilder</title>
+        <para>The most up to date information about how to setup and dep=
loy your own Autbuilder can
+            be found in README.md in the <filename>yocto-autobuilder2</f=
ilename> repository.</para>
+        <para>We hope that people can use the <filename>yocto-autobuilde=
r2</filename> code directly
+            but it is inevitable that users will end up needing to heavi=
ly customise the
+                <filename>yocto-autobuilder-helper</filename> repository=
, particularly the
+                <filename>config.json</filename> file as they will want =
to define their own test
+            matrix.</para>
+        <para>The Autobuilder supports wo customization options: <itemiz=
edlist>
+                <listitem>
+                    <para>variable substitution</para>
+                </listitem>
+                <listitem>
+                    <para>overlaying configuration files</para>
+                </listitem>
+            </itemizedlist>The standard <filename>config.json</filename>=
 minimally attempts to allow
+            substitution of the paths. The Helper script repository incl=
udes a
+                <filename>local-example.json</filename> file to show how=
 you could override these
+            from a separate configuration file. Pass the following into =
the environment of the
+            Autobuilder:<literallayout>
+     $ ABHELPER_JSON=3D"config.json local-example.json"
+                    </literallayout>As
+            another example, you could also pass the following into the
+            environment:<literallayout>
+     $ ABHELPER_JSON=3D"config.json <replaceable>/some/location/</replac=
eable>local.json"
+                    </literallayout>One
+            issue users often run into is validation of the <filename>co=
nfig.json</filename> files.
+            A tip for minimizing issues from invalid json files is to us=
e a Git
+                <filename>pre-commit-hook.sh</filename> script to verify=
 the JSON file before
+            committing it. Create a symbolic link as
+            follows:<literallayout>
+     $ ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
+                    </literallayout></para>
+    </section>
+
+
+
+
+
+
+
+
+</chapter>
+<!--
+vim: expandtab tw=3D80 ts=3D4
+-->
diff --git a/documentation/test-manual/test-manual.xml b/documentation/te=
st-manual/test-manual.xml
new file mode 100755
index 000000000..9d3c0354d
--- /dev/null
+++ b/documentation/test-manual/test-manual.xml
@@ -0,0 +1,103 @@
+<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
+"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
+[<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
+
+<book id=3D'test-manual' lang=3D'en'
+      xmlns:xi=3D"http://www.w3.org/2003/XInclude"
+      xmlns=3D"http://docbook.org/ns/docbook"
+      >
+    <bookinfo>
+
+        <mediaobject>
+            <imageobject>
+                <imagedata fileref=3D'figures/test-manual-title.png'
+                    format=3D'SVG'
+                    align=3D'left' scalefit=3D'1' width=3D'100%'/>
+            </imageobject>
+        </mediaobject>
+
+        <title>
+            Yocto Project Test Environment Manual
+        </title>
+
+        <authorgroup>
+            <author>
+                <affiliation>
+                    <orgname>&ORGNAME;</orgname>
+                </affiliation>
+                <email>&ORGEMAIL;</email>
+            </author>
+        </authorgroup>
+
+        <revhistory>
+            <revision>
+                <revnumber>3.1.1</revnumber>
+                <date>TBD</date>
+                <revremark>DRAFT - Work-in-Progress - posted June 16, 20=
20</revremark>
+            </revision>
+        </revhistory>
+
+    <copyright>
+     <year>&COPYRIGHT_YEAR;</year>
+      <holder>Linux Foundation</holder>
+    </copyright>
+
+    <legalnotice>
+      <para>
+          Permission is granted to copy, distribute and/or modify this d=
ocument under
+          the terms of the <ulink type=3D"http" url=3D"http://creativeco=
mmons.org/licenses/by-sa/2.0/uk/">
+          Creative Commons Attribution-Share Alike 2.0 UK: England &amp;=
 Wales</ulink> as published by
+          Creative Commons.
+      </para>
+           <note><title>Manual Notes</title>
+               <itemizedlist>
+                   <listitem><para>
+                       This version of the
+                       <emphasis>Yocto Project Test Environment Manual</=
emphasis>
+                       is for the &YOCTO_DOC_VERSION; release of the
+                       Yocto Project.
+                       To be sure you have the latest version of the man=
ual
+                       for this release, go to the
+                       <ulink url=3D'&YOCTO_HOME_URL;/documentation'>Yoc=
to Project documentation page</ulink>
+                       and select the manual from that site.
+                       Manuals from the site are more up-to-date than ma=
nuals
+                       derived from the Yocto Project released TAR files.
+                       </para></listitem>
+                   <listitem><para>
+                       If you located this manual through a web search, =
the
+                       version of the manual might not be the one you wa=
nt
+                       (e.g. the search might have returned a manual muc=
h
+                       older than the Yocto Project version with which y=
ou
+                       are working).
+                       You can see all Yocto Project major releases by
+                       visiting the
+                       <ulink url=3D'&YOCTO_WIKI_URL;/wiki/Releases'>Rel=
eases</ulink>
+                       page.
+                       If you need a version of this manual for a differ=
ent
+                       Yocto Project release, visit the
+                       <ulink url=3D'&YOCTO_HOME_URL;/documentation'>Yoc=
to Project documentation page</ulink>
+                       and select the manual set by using the
+                       "ACTIVE RELEASES DOCUMENTATION" or "DOCUMENTS ARC=
HIVE"
+                       pull-down menus.
+                       </para></listitem>
+                   <listitem><para>
+                       To report any inaccuracies or problems with this
+                       manual, send an email to the Yocto Project
+                       discussion group at
+                       <filename>yocto@yoctoproject.com</filename> or lo=
g into
+                       the freenode <filename>#yocto</filename> channel.
+                       </para></listitem>
+               </itemizedlist>
+           </note>
+    </legalnotice>
+
+    </bookinfo>
+
+    <xi:include href=3D"test-manual-intro.xml"/>
+    <xi:include href=3D"test-manual-test-process.xml"/>
+    <xi:include href=3D"test-manual-understand-autobuilder.xml"/>
+  =20
+</book>
+<!--
+vim: expandtab tw=3D80 ts=3D4
+-->
--=20
2.17.1

