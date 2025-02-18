Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF46BC021AE
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15635.1739869926213937929
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 01:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AvmxyeIG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6110543289;
	Tue, 18 Feb 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739869924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oajVMQ0dfR8gQTGIWzXA5N/raiup0mQO3GI8g3t0FIg=;
	b=AvmxyeIGEdmHUmu9Um0PqALP5yUqbppp9s1L9gp0TAAvCdLz9qDHccdd5FNCkOg95GOaOk
	y+Wk8VJIQsBhOwohoWjazqFCS7e9Bu5VXO4C9Kvirx8NmSWhG2yme9FvJzeTzk39NnkeKb
	LAcoWuwCDPff3U5uVv8nvUpbPzKAxe413I6lvV1+3t02oEB4CmbWY6hm03AaWUv09OS7YL
	PfoEMQKgwfVpu3gCHDjDTA9QPGAl8LdvHatvrXhhhaG7qB+g7qPd0AJ0h2I2G5d1J1NkpF
	WBMVyB0FqVE7DCOfRQSjoSkOE7mHyOnsvD9kqLZKmUnRjZdoeNuoH7XzaZHBXA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Feb 2025 10:11:56 +0100
Subject: [PATCH 1/6] overview-manual: convert source-fetching.png to svg
 and fix UNPACKDIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-overview-figures-v1-1-75d23b5e7a88@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
In-Reply-To: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=131061;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tIFgP0xtWAFAYo20uA/6DTMuJbxt7eRhwT2nxetNQcg=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntE7jxhDDHwFx5mDhz+j0S286rZiHWQT5vrdxN
 bMUeq5EeY+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7RO4wAKCRDRgEFAKaOo
 NvXtD/9SXaGcQCa4xReadMDQGn29OPClXw6b9DTaIPQlv1eon//tM/+/9GlMD2CK33u/KZgNivb
 NqN3cbO5cATh2aoGzDYBIjrm04SoXiP9iE05fYZxmOKqFzDI3ZSau4MYYizGWTuORtPKAS/HYci
 nQqJ9cjTYeKQgxF4osGlxcKi4JY9wFstD7hXhDoFKXb6qmEoFozV2Mj8b7tOuOtQZVJCAJmFG3R
 fJPTp6qzFiTwaxRykImNWtpEhmq3lnsFos2Ue5SMivedcnMpfitfDeJzok6K/yfs7og2jAIWh9O
 U9UMLGpKloXj+nCPC2M5/nOzxytLrJ9Hi0grBfBhpR+lWraPSOiBk2znvFC+xll0WrsNy7Bv6Go
 ClwwrVAZMbkscrG8JR1ZdjmtHCl0Ov+Vkr/ZEDVzWW2kz8RmrVCQtumR8vwA1w2zYcuhUCYMW2N
 bFpKjkvLzyEULhqX2ogwJikczCUP86LqJ5Qc9GvdqjskDr/jlH0D9QbYBCx3mp6EG60yaiH/Zi/
 5zd4mvBlmKnSFzDKSPm37OsCcmUBwHezmhbFUw3IZbve2VsoQ7pIn/WucheNGVrLyCZB8ek7Xfa
 AnD/gGz4mB8UGqnwooUec66a39UzYQALpAazH3cNJA3S0DFdwMENryLiUSRQPBqzT73t5yNmKJ/
 Tif1ocNKRAzvgpQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfevheffvdekleejhfdvtdfgtedutefftedvjeethfdthefhkeefgeefuedvgfelnecuffhomhgrihhnpehinhhkshgtrghpvgdrohhrghdpshhouhhrtggvfhhorhhgvgdrnhgvthdpfiefrdhorhhgpdgtrhgvrghtihhvvggtohhmmhhonhhsrdhorhhgpdhpuhhrlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtp
 hhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 09:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6411

Convert the png file to an SVG file. This will be easier to maintain and
also weighs a little less in the repository. Also, add the new UNPACKDIR
directory to the image.

This fixes [YOCTO #15730].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/source-fetching.png    |  Bin 46896 -> 0 bytes
 .../overview-manual/svg/source-fetching.svg        | 1220 ++++++++++++++++++++
 3 files changed, 1221 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index d1fd6befc81f27f6cddd3827bff5f02ff1fa81c2..55669cd3f61449043de9fa6de79b39ae7596bcfe 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -683,7 +683,7 @@ Source Fetching
 The first stages of building a recipe are to fetch and unpack the source
 code:
 
-.. image:: figures/source-fetching.png
+.. image:: svg/source-fetching.*
    :width: 100%
 
 The :ref:`ref-tasks-fetch` and :ref:`ref-tasks-unpack` tasks fetch
diff --git a/documentation/overview-manual/figures/source-fetching.png b/documentation/overview-manual/figures/source-fetching.png
deleted file mode 100644
index bf5e187b2b76b28dbba72eedf8b9d8d1ba1854d0..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 46896
zcmafbc{r3|-?mB_vP=?VUlL<q5@pTUB72Q}iLtNQcS@Epl074YkUjfOSw=#V7_x<s
zbujj2d{@u&y??xae8)G((J_r>=Dx1`x17K8JTEc2+G<o3OcW#}Bvk4Tl=VqSE@pv$
zWRQ#CEBYEwHNn#*FNFGI2m~@Yr}G=UWb{@s@_yuQ=j~_ZX-i`7=I&}M<c0FIwRQ7y
zaQDVv>X0WP;UH00R($OLc759MsabCp$KinADAnU!-9|j~?-2Gp?xZ9ilX}~PpYnl)
z`IQ?P8*e85uEb|e(=bnpwNzD2GN0u7<@q&C%Z&J1uDY4JO(eOh*DCAFUbx1g2<6!1
zH@o~Z#IQ}^_JI=ZEy()^x;zl*;dy5+iDg@0YU<u8QG{SiynY)C1y@T_PimEa_1}M<
zsa=_u2G1XT?wgVQ`v&#PHSqLl?1Bd?cpjJLsJH~4P06}_z|)hpXN}b0*@gATnPs~q
zqf8iTbDQq+vkgt!Eh(MapN5T+%^W1pc$wS7+MCXaBEo-=HD8_8AQ^=*(4_ZdQxs35
z+`h!NrpaBsj7%%2V@cCfg(UvDbL0Mqw@O;oGxkQ_f)qU-jd>I5%%SBC-xHI4?g;A$
zQV%LQE=os?U6sk0r_qRnilSNn0T<7(&$L}b`Qk_Lmepvs;K$0EoiNjd%8&aa_i;XY
zP~47yXw*x`iYk)k!hUBNDwu7`k2~2{GQ6?K>OvAthzcae`7RYjNkEV!apC;%mkBl4
z5X(Oo7}T_Q-Lp6ER+Z9orVK4#LpY<IGBmM^CL@s|EYvbt-@s)<^GZs(=8XESuE!{=
ztH;3Q55-+!S2(+!>M9mL#>K^rj*dD{JQ|TeSLMNJrjo_d9&msC`gP26JXqen%4lq-
z?J-h|CmD%EI^T2QN%oM=f+^f3-k`XwvBDG<=`C%puV0-e_oz4}4=y?R0*`<fL?W!>
zFF)W(7EX5-8nwj~TEU$8NDyD}2U1c}m9{!sBTxi={|onDY4c69=OeeB@9~h3Op(c2
z{^ypyBCEymp&~@P-a|N}ND&V#M!z!|#13mEi8wg(U9d8`tyvqD#fWNF-1<fBOk3!5
z1-ta(>U~H-N;Mga0hCma?$$)7^8yiGP~!Fkt+n&}tM$u_i1Mmt?-#m-S36(0f1&Jp
zPg%MBF-rYvNqeCj6@ssAsFDK`&O!0!U<I{J994lAL~uk<A`%s0f!#$H&Mlmag%RYO
z&io_@$kiWA0%;0uTn8mDhLCiKLUIAo3nXmMLA+s=WKa-J!Iz1;{=U9rqG+;xoOsmO
z_oDs-8wa7Yj{ZgCwQOhMPbSon(30X}M<*xGw3OFm<<HbKX(@y*U%b#I5qamv#oMYl
zBQod83%j}<7ZEV4+9*@WDClu`mpGPG@k2#LvAcsV9V6#^qq2iyVU54@KYnO_a(}~P
zLAdt}YWGr(IP&C{#zgm@Kk1<|3X7$s&P+_JH~O=9@6gCrf^-mKgW^=sw(1|hav>hr
zbJLpqJ>S)k&k1`Ow`Jh*`_t#Kr7NXnvRf_AKOxcKIQce{FUz<e`cvXCR33bDHtbz)
z#V>vZ|JLy54{RKXBkclCxgR(9HInu>CUHiVuBmw0;f61hAFhy)tl4Y5h`on}adu0P
zbK02p_+Vk!H~Q7sx>ZIc@20}~(VhL%e)-2L*ANY^D%VEd?|vTgCL#HqE30g_EUF4q
z&@5W<jZAm-R%FW&VaN=);o1=U%We4z$?vM?6$<}JY@_tX_L6CAT1b<UYbl!v_}Xt=
z6`RLdzuI;S&F&gIDfr5`Je!AEQ3`*oJ`(9#XTnz?`$-_SXKil>?di;>*8@e!UdZ5p
zK!0BVb*0X~+an9Aucx<%Wp@8LI?5RJ9Ex~}G%$E88&F+Um55hTsD#xpqDm#le*WB?
zs8LILKQGid?cRD~UMe}$7BXrYdmbSl20m4%Ihu_oEDSBCo@7=*tDY1qrk}(e-IWWc
z7&7IG<>FMPyQTPPX?giBUu@^HSY~02SjC5}y4qSTZEf=KCm5cB$52v@Vs3R9DjUa&
za;Y*B#YX6kNW|WZzokyAk|>5%xX2kHMo+2;B}Kdx><{PIx(Q;pp8`?le{)B)*b-dA
zGp#?@dVOkT2SaST8pbtvA|5|}ygpH5@5uM(>D{;5hT@DlZ{C3P4CnZX!`+dP__aZe
zcp%#NTD!>Ec`dko2i5zEF-l%mb^zw=>>Ss-aO+k<i3yCAb#T#BOKY&aygZ4Uo+7fZ
zudk;^1@XYq(b3ej1-E94R^>`;YHCvEQsgTyDRBe8+LLDsT1tZq9R*ljplmi4tBQR+
zi?=kRq_svkfNbB22rMH^!BE;oUd!LIPWCr$c54>U4h{}ZPs=579|gDHRC_hCvES44
zgeRF^MSY}JlP7Cvd3kB6u;{GM=Es`QY@M@?y}f;|E+o3E(6PRuAxGNht6M|Ch+{&p
z*ZO$X*RL9i&@zKkj^DcQ+S=Mb1SE^hehO~wR>a+`R}~c%XD0^&u?4!ie)t)$`R<YO
za#z?@wuF;U&o8+(*sC<if!*AS2-w}&BcmntaB~ZN`t&vLWJ!5>jY+v%LrY1?>i$OJ
z+?*BSC3g($YM+gG=AgEgmYq1`h{P>*8#MSo71i`liRl$@w!2R`*b>hF@VY<JXtTgS
z6lt6K^@}M+xpVHRe2!nsw6I}}BNJFSsIqfU-}v<m4GkUa?KxuhJFklPdV9aU=Vcch
zT-M$`ceuU4mcUC(u0WIqflI;`;}f$c`+Qu^(wb5%D*W@2nJ{m^z66u2qoa_Bh^2`M
zCM!!WaM$0<tN-WElvxFHIGw>OzXkl@;!a$gA`*G6Q!;aKWB<upX^(kEby^!^J^{jN
z^Q$Udef_}0EzamJzW!=%^(5|lEZTZ>j7pe7aE+k!Baz8{%JP;kd-5=ax01=tak6X)
z-0G(Rvi`K&pA!llF`$KBCsj<c(W49Sl+q}6WGW1>Z;ce}4~9lntflB1r`Z}W^>Rjh
zD2WxTHz}Xw_md;}t$y%wK^kj>yE7soL~ncK^wQQ?6;fIf3+;q$*Y%5HgOLJ?P;PY%
zo@Dmmt<a#Lpob6phx2<&N=t)+D)UAO^KUAgF?L&-S3;q2J@b2M<l!%&VEN$j8MZNA
zm0w@KWY}?x6m9(L+hQ58IJ$T(K(?o?Z&sUcaG6l3emI*VF3*)f(;ifNhfq*n_FT=P
zWd5_%(7~C{);qU`NstWAPEJDf55+UyW{^j8S;^x+TUU8|dxMeyk4@^cxp*N=6jp0e
z4&vCWWqM&@;p)|^t^BfVL(eaf!EMjZaN-%13IYb9V`Cr00A?Y)TxjNifS_TDudlBM
zv9d@AC>=F<^yr0{Hcv8IF9M2ftg0HuA6!QSw^NwouE#`ht4CQ;Qc|MP==GU4``%Zq
z7Vh^rA186k`)2w5s?;n2cUQmov2glXk4UKAskcV4;6t_qkoPQ<!cG_ibMu95|BKH_
zX30>kc_J6Cb}s+$cCS}kJEeZ1Bm6u68oSk9WBJCHP)RMXN7IAB_t0WFmGdCp3JMBV
zyqP!+EG*or;KL3-MbWXbu^=-a8yJ8@>-ygR^{a`g=}?wTrY28IOVH}tnu;E}$2t;m
z0W~!-5%A}Wp2o_?<jocDX8&MfZ?c6R$upt#;odz>p4)f*7rrFsi*%f7!0Gsfg!Ybt
zuU}s%eoVnRp!7gXYvYlQ9B7y2<(b*p-|T9rsHj+3vvR-Fq6U@;D*3}U;-5vbgZ9_S
zBM}4wA?1hl19}y)^nNNzN*0CC^;AO(V-t#uLaVx8X=!O7Ge8w_b~ZIMltR^(mU^k!
zF`phSiI^O<KDlmD#)y*4JlmS<YOV-7c4Wsp!rN<|mQSYMP1Q8@!IEtQX4}ssGxs_p
zuV!v!FFkyhA}J+>!{N*upIW)NP@-IFCZL@u`lX}IVdu}kek~C&tQZ&^q(zh&IJ>&C
zc34Vi-A?asGP?y5H@*KJ%d6vKtS;Q9X2QQ568@xS!bLI@9vfw4C+^rKDmh0E5Ntv_
zy9G2NH<wdugo!zG%1w%MX>aXPa&j`JkTXJ5wb1bu8vP*Y&vqj(FR!Ya+8r$cy2osI
ztr1P0>$h*$6hGELj+!<^m6SSTGEJ)|Tm<Pev$BSLP)*D^@$vCan6a@j10+)AWrijX
zvhE4SCOG)5z5$3kC^I{If-+Z(a=2L9pxyG4-PK50!~?n>e_44cDQB2;4tvMPkFPa(
zBu#6ObUiyeo=Bl7bN+0acZYsee`FDa^w>UM1C_IR)r8)Kr{nDXh5?$7k>JwIapas6
zE@=uj#Q>9l9bsW%VPssok=nnQ)W?nZGWV1#f-4ciX=iIYIzMmi;}f6v<@x=0`S~x{
zYf4H=YHCL2p2p_ghiq)LeT}wq`*T1_@+>G|cVWpN-5PST59%5`7To=djKpSm?8Ap~
zw{PDzD6Kox=caA<7ZZ-99ir)CF2odq@BynQ5C5bl8HwQR67}z%$E~fb6dxVk)1$kF
zC{%}t!B9<Rn`7miDtd>Cho$H$2Z^Ky-2p$CjnghY|1>Zl$XUn%DJh|*+$9w6XKn<#
zVtCkB>tctNogDx!dnlZqnUk|{AdD8v92}dPGBYvx3XAK#P9S)dlpF`QV=zpagV}?2
zh}@^LY$HCboXU_1@deV$if=MAogF?XJpFy&+}s@8tDGDip6ii_+}hg5X^XlJG0;vO
z%G$Ti7eL?FE*i<utk3H-)Sq{9aCq4ZawX|t_d(Lnv9YCXf4Ax8)IOWH+UbRknH$`o
zJ-C@;y9lMZg^oSz?mZ7QUuFy~lXIRTYh_R4^-CO?P^%@j{p6gW&yI^OayA|EyVq69
zrf@)lZ-y=GMAH(5<sDw(yArSlWfA3T$H~?Fk_A7P30cxUCTRtlJR?7T=$o2OP6pj!
zOE4`TyUv?kQC_aaJ>O)eotA1O=md+xt?l{CMp>n#2CS{F+S%Eus;buCpFPnyy|Vo^
zRRG)%FnR3l`G8e7xKWvRgqqXc!oIP3BM>$_KQ!1I6orVBlau-N>(|%*{$4Eh@age9
zHGN!<Qyl;r54byrx~NXFL4WQUb0!|kU3$;0{_x?$j>Ddzh3&gK#K7}2{7mS9{6R2k
z+oW~X+>hOLQ6VQ~MYB~e^zZlF9Z!4^zAgO$H^?t)mb>4_#ys{`Q(wLM1`t8m;T&0V
z@*`RC;t~x=Mpjn5avpu$yk}E$b8|~`^Tp?%JXfd6yCepmh{EDk*L_<iH|}}=-2z1(
zq~g*0J8?bLI|fmeS3jNGp;hwr%yIkc6Pbf{O1TBGv0vxK+-KY4p<q8YS68X8FjQD}
zfRM;ZxqgM@W4Y{Ds{{<CB|!S(h_}GF)sZ}0*U*riQuxXX(5b~#r>D*3Et|OKz;(Dt
z%G|pL()ZR%%`9%i*U#I#*-SgSYsK>(66tl9<@5p}?Q@G0WtS-B&GddXE<JhKnT>sJ
zS`Q?WnVA_B4gX$Bl%^gX5q)KvaVO)Iavm!yYv{SAct%-SnIM~&qaz<}Oru%F@p05b
zZ-OIc42Nr&h_VKF<JZezFWAE1-JMhN&fcnrNh$rd0S;nXd23N{4Om=k-XG7VRMwsd
zXv1X4`nX5ecM<dE4<#l5qUj91O4SQ<ewR{TTia|_5g8evHDV@gsHP^vsXX#ilgEp&
zG^i9!?S%0?*?(EF26_$vV>LCmgMDQXUqrwB`9sRNG;jU1=c!*IJQlZhM=PoCJp%&+
zRafoA`cvvlB$7qFezwc$-{zA<4+&$Tq%$5S!B0B&r7BqHiQE<`d<8vo(ajaMHOASn
zXHe^!2{U1PINeeWd2>q(E47+**3u<bcmaT`)X`_1k;IG)<D!uj!jXY+V}q@(1_&%_
zHd!0Y31dEe+@M7KRfcbbM0zQA>e#&RAcn`r05QPLmopTPro0)UtVgG!2Yt$w_);~$
zQyc&w>w+v9Kk!34-%h=yeb&abG#snSX-G&idl%vW7E15;0mD~ywK(EI?rT#sGYrW8
zq7h4p8z-BOo$2EWN=xIQ($ayM4IkR!$S)<RuhnLHdR7=aZrZuHemTWlR@Az0IzSLR
zju%sYfPHhu$%kw<E$d`Svr-7%xpU`g_+2@<K^PNb)AaN-;gm2$*xR%*&d$v2x2plE
zUr`~?6n{rb>W-x3jiOHXg3arCbRb4qsiWoC67t}fLbd$Fr+3k5*V)XPJZ(KaOIlma
z(iVf|I~rk{1^V=HdpnE$%@tPYfM?5Upv{DwpIH`;@M(=)AtM9#M~MDb=3r!3?qmMT
zimW6b@5znrH|N1+eAmBAxCRFg*wx^tTPmBH7Qd$U4?CpbUl{&*D)g;N*ljt?wA=t8
z&%EY6w4UwfZb(<q(gK>NYW}tMS0{m?I5j}gXcsXvG410OJ~g~4^jP_^2!J>!yfZVK
zgrmpEHs6h3>+5JZ#oW`sZ3i<l{#*BTbP_6<haGG{bh9N`c7(RIwVidxT>sZiDbv%M
z17_7FGZzULCHI}>X<;ZN5=8B#=OmUc>Gpg}_Lp@ogB8C81zsjD53Zi%$n@w@GHd}!
z!!y6_f0rfAmJ!7Q2Kg6Pd;Ao2$w*vG686XiP-y7t!HI}P>ytW@gN?}!_gP|0OpJ{<
z(%9G$!^8Q$Y#>>?=w{+ec&tTb!~6FU|EL%1Dj4FWesyDG_js1ofI;c#GQqf9azp~u
zJaBp2>S?x>xHa!)QpGQJHNl_vN=o>V$d=|GO=h8?p_?&pN+QI@B<d<F{T%)-eWjE5
zho!t1u<^yke8y>awE7o4dom6{T2&eSbn|<HM%H~Y{GO4WO&#4OnOUw2r=z$GASj#;
z!ujIG3!TlHn3ioKK_oDh43FGqMwyvy+7_g4pKSVFAo;XZdm)`4@zM%bs7@QhU7$$^
ze$(^scQ7(EHNxmfWu>HYw2Lw^7~l2r=VJ6KG0-14oQ#~DYt6*3UnZ1YlviF*M=$*T
z`~pO1WVllmJVtrvSDg;3>dmOr#>&L-#Do<_dE_y2G%6|z)YwrcBwbTQg>Z)Ec0Fz>
zTFeezII@y@33ntBl1+$S&g0Xb5^2ZuF9Ni)odZK@IErUza?=Lie^KZdEHg{R^bU}Q
zcVvl;-@q`~`)COi?O!HTN<%i{XwH^t3yaOB(6e8sr{NWAi;Igv2b&LhlDoRP^586T
zf$QBdMft-Y95Du^T2M;$B(NT^0_^R;X0uyr32YlHD=Qltt_}|4Eq;}=_#6yIe>8m5
zY0&OArcgCM(M<SYr6|V<v#)&XfY|xUa)!4RyJ1;-TNw}@;~H#!W>Q);`T1Q7+gof)
z&bSI8p-4IvER5{M!~A@dEc@HZ4KN)6-1q$1tb|rVFJa1SC_O!$?1iERUqQEZm4u`u
zxMRdt*<^JFibxE`1gr&#9E7p5vAt66bhvkv)iozU`DkQUlgAatLt4YDEw;RtzDBeB
zh}@qc#KTU}!+hV8U4bWzVrwnsItfXrR>H}Tn-GL3tTi;`o$eQVaYp2*w|RpRU4#*T
z>epq0WF{3#us^oK`6xJB&2}cp1%T_C7gl;H0Jh*v_vhn8tk8@~^l`UXsIAcD24EXU
zB~rz((Hb{;=dIAOXQRK#JHr$kCWX}XW!cVYyV%MN1aypFK=tVgK=>!z_UFER^YG30
zq$FA-vSy+Tx3-Al_^o+~L^d=*p(3uz$i>MiJmD$7n?2?B=)^SyTFe|*W{}yF_qW*%
zqw45b43EVan2n$_3X9i%O-)Um;LmA=Dleb_t@2YMX43p?rdIHNJpee8h8{NvgOWq>
z_Dv!cVne--3Xcus+uNzJjg24rekouYMA)qs_7d|`q_e&;Som|YQ0K@6?dQ%*TfW}|
z1IxC*%hRnZScIeF%2kopyONT>W@pbKaR)yhiU6j=qS?C`)RuyRy&{E>B3-zw;%yN?
zN_Q>1TI=s>JUlljbUL4M+xE}Xg|Gjr%dBj#19c%IBcq@|6tB<=TWgk-lk@reeJ(pY
zdt$=4OO%D0w}6|4dg$A?+PXSc8Q)-k|GSxkDJd!43m#pf-sU0#1cS$qd6N6)F%k(!
zYqQr;=%IcQ5s_ZlG9gmefscjS5%X$HQZq}x1g>FkUsSOc+7Y%<72)UT-)4b$Aj>xU
zHi7rBL;(OY?V`0V8U?}q&t-3~7{8tU!h4yHSCu0CllwXo6O)axIHi)F;Dk$kWo7yh
z-+h7V?#h8AWj+*oXEQIA{keRmN?$Dg_au34D+vmPGB=+V5)uMwl({T%iNxi4LQr;Q
z#aihY)10B4)<}R?vSs4U#H~8#oXy#e^FMvbd2rjB48pPkn22xP5+?E>zI^}wIu8yY
zptQ6!l@iVe6&NT@8$){Wd8uLL`eXzCXL0gTum$o?=(U5BB2Zq#cK-A|;11lLzueAt
zYWK;|V7lY{S?>b*6$WL!)y+*~qc`}C4Um{Q9VbnX6#VSh6S<2)UCa?VJPY;4t)I__
z8MdW|?E)aDU;OikupAe+T_#PuqRM0Oq-A<$bW~1C3IIlb9aR7moSidARs`uNKof|I
zdsyh0lAeCByZe5`QAJOdO-DBS%^TRzqGwi?xkV+;t|oND*)pLQ%w`u_rgKa9J5UZz
zPEL-FiQE9gX=-ctEQm$u0*s-gq{Q*NveF$&DyyIXMy+>_m{BKJCnrD{19(9jGcY95
zy-;OMuVP`Ip$YJGVSc_>V4w+dG`>Wd<kSA{;XD|Cj)I8;88lu^>tC^eUWi1@{U~@C
zl}nJf$!7Mkw&r4r50quoaO9>{FVL?B_fk?tPdq~q@j(~9yT5;Y7MkAQv+R6}mK*^o
z@b>rj_wX3r@Quq$(Jne%2<Vv2(Y6O*=qL}Lun||8SiuZP4h9hmsLJ+u)dDD+gp;C2
z#Wu#q#$v{0g)2>F^qhck1XvYSru&7!T^wbFe)Vcc(6jZ%rnmGB6-lk6{zVYJSJ=|~
zZR>uCss@j>^e>i_mDNtN0#ud6y&dBP8k2PuN5o^K`Mukr`5@*~($ZeNnpvXy3+C*i
z9C@oclZ9>NkdP1%ZB1Uw{<SkLemN!d*xuedT5Id;wV;MnnD^U=H&-ls9zDIAG-yYs
zGSTGKJ3c-RCbXcSlbRv<OwB_7!-FG!|Gf7=_W<l?)AZ&8Zb9|5vlE&JNwV_t0CA42
zh->AQVE!}eu`o5?6BE-DEa89@ItmM4F*Pv(_goYfu`f;X+aoa81Ms#mRgT}5+AU`j
zzKAcUr&C`yT9Higs$FxU2u-N6A`~EBKfeaS{<)_wq5oK6o6ykq@kjizT<ot0U{|BN
zKrlc!Lybb~%#GgU0L;;+E;&1zmQmP8<~2A#3ZRW`oyldzyZ&3RCpTUxb4g~phK9O%
zdRFJ<dCs=C$yV5luYCTT`T2J^w>lu~fF2VXYC)%xec3#TTVv()^z_S@2g2!HFewQM
zKxUij(RGQ=Z+9Oaz8PBfk~Rla$d|;MQC7PLG%4vpV0AXeiQHmz6f~5(Yt8M?_rk@5
zg?!@j01<E$Gdw&zx1ADlx~&GL?$lJINZam@3iB2_dwW=Z#A{u+xad>4oFUe`Pe0bx
z`S|<WxVcGYXbKAn?eAM8ayRAWg+r||%4v&$O@c)o5l`^Wm|tUKp@&;@OG|0~vf2<a
zt=rHo8k*T^6IWiHY(Vv8W{`s!qqtZ-x(hHn&>avcQg`kgoe`1bCx?Ru>gs)+oym!O
z7f3$Z%5M6Y;4{Y8vL_91t^d(c2g45=n=p1qL_^ruPy72x@G;Nlj>=IdpC&U<`U)MF
z2m$ht*7kOJI*RyLGq3&;-?wz+_UN$w4u1=KtT$FyW&O8)Pt-7KsDluf%)A*<+t9!c
z>M^KGFtaUxSy$JMD66SPkNnoD1Aw!O^!v8AJ>+rsk)yhBkU_UIG%YQ2I3Rid%Dzmp
zdIFj<F0UIly+v08Lq&JJg7VYtKse>80CXXJp_siOM;il}`>iak5y~qJ`o-MXyD+oA
zo11_q6QbJ*{{3fJ%||qIaA_~?;NXDJeh?XXgs@8QU7%OFhI$OAD=aL0j6_iu=@<X_
zK|2#Y3~;e$s;&mNx*d9A;}sHhLrgWwN>^jUS0*g!<B=QJ1rpP->$iK-6zW-6T0g7Z
zbM3oo`|x4Ss8b^M1mNDNXCToxgGcKC7bGq|z?=wpx8e_5XRC(nfa0z-5=2+MAfqvO
zd`QpmA_A&GUf_MODF>;_&CLWH_o650Pm&T6)YR1Vb#-a!K?;YzUu0yE;JY{g53dbI
z)~5B&&hQ@V?ZEzWgVGXuZ}SAz7qarME_H%K*7uXT-TOB!elL6FUx;l8Y|V`BFnOz9
zwc1w7qxJ+H+aOlxxZ^?*{_H5(U&9ep0(*NLAj@iMY9uq;-gn<pFRi&E=4<cy+>usZ
zelBtJG6{+7mt;Cz+=_DjYNU9M$QIeBJ{$hTmkbmE#%V{Ie;@PLy?xS~I8+*=Ov!13
zvE#aSGh%$hH<Xm^Uug#c)|XrazZK2_1PuoXeu%YWu?(OiXg%2aV%L6c*9+!M<n+BK
zBdY{Md6s;LbgBjw4ULYDj=M{8+Z&qMMNhy9V1fEl@xehvK%js5DnOhT?nm?1uknHq
zgqBua@4`1bFA&zvZtq7JHTXDxT312B8|Ni2J7X{!1sDtlz+p$G8#iu9X38b^(J|0B
zw{Wv1ka5<3grb$XKyX-8O3_hFn=4e8z07;l_a0ZQ4dk)7GL)G;db_~vP$6LU@NA@W
zD;iTR7^a6mHi-WV;lz&r_%RQ*t=WyEJJz!H?lK#vGT*3A*T{8Gng8(u*ww&eZSVEO
zs-!KZ##QKlrBqs;*zqxEAbqZ1SW;409F^N*b}J9QZRg<O66|58z<x<gLPAz<13(d=
z)8K~l)j$To>3)5{EFZAPDC^^>DseIZ{fn_NGnbZ^2hBx-fsr9Z9;C>N7g9%lR%oyb
za)bfC2&0gYuERqk;q*I{H(97bC6V3x8KdjaCrYW8qOAARXJK_zK%{kRUaI4$++SAD
z(h~G(9$sE@&OCVEj{Q0QHMibBDMBe%7X-(*tQLNLegNa=JX5=^#X{{glDhHChvlgy
zPOmXnNVX2k4b7I%(o$1X*%G1?X1?0hfXQ@7xMjKLmDrNEv>cm`ApK-0x!mSJMq$d6
z0a1GBv7nw#A_rvHAwmpjhph3ctkgjOXB8G#8BuZ$(1eR&-n_XRxcep#{`twraSQ_~
zC-lv|;KMI7Z9(o+jTLLnJ=T156hJlM;S&<_xy$m8Km;AKW<paG=G`)lM2-eOn?Y5+
z9(sZXnX<mF34{-@p-==6?>ml1qd_k21@@z=#=#Bz{N(klxDzIDZHyF)08O#nR0(XR
ze?|Bjt`bOHrKSBF!eBhe22CY?B{A_D5_y21#qXtQ0j-L91~7`@&#uS#bBK239ExJW
zESjS#CMD&!@}p<E<>2Sf#~_eF19FjMw)_f*nLXgS4nxKD{P^*Mh4LFA2F7gUL-Nek
zfpr0_=$_{v2OS-nj%L1CTN|6h9|dtepGQl1j4}(24GsN{cfIiKCp7@|rd}_OyZteJ
zwiC8c>>@99J7|<BaJ6QK<6tVFtFohCsd=kpxmO^FPg&2*%&ax|Xr~I*3s~X9`FX<%
zGxF#zS$=|w_3_Dxc|}rDPN>~bwp>XGMK}~f3I@l*LY|@Qv%}w?mB8{=yiG=aGE2Gr
ztF3d(%(MP-i4Oox4;o;4kr~+a&<+Kd+4%U^xi-kc0%~wj3n-mn^nwBXLs#^$e{mV&
zmt9OyII<=LPkXbiUseQ3uW)`8<Pxya0@gAAaAafz{JcZYFF)AAWP>{m4NZUbK#}=W
zYe4c4n=(WT?46cY?hW4e@Yv>xoO@nTG@)f+q~+sl@?N23UvGMjBqJG*8ap_W=8UMU
zcY|TG<$`=Sr|!wf+?JLufm2|O^yuX2`$W;!?}U~DfFlI(5aR6S11*^C9om9$4t))S
z_G^_7Iy4|+l*tW#mlc1f`xABF`QQF*_|sx$V*Hb0KWqWP8Fm(^;BH(orOn66)NCBg
zJ<u@KdJmTHZ&S&|{$(J;3$z&9b8mAc$VzkQ{(5hGyq1MKBNoA*3MlP)vZla2CsA10
zhYxfrVqnrsR>zM2{rjP$WN}fxOVqk*Jf0cXW+8%rvn7ZK2{A@hReg>j`(-33DJsg*
zui?=j``OKp_%6i>qsk{BoZjxqE)Tg@-iVw(UsQq^vO0}o=R+=qIW7|7QYVjQWAn^9
zLT@s~cUl9^zt?@bcW|XSTcdzBCIU_&<F^U6kCBn_no1RT6cmiw)i_}!@7-gBkjl?S
zsRDtvt*vWWfI&r!ErEt=T7&0$wIJ^2PYJ1pyDYDQ<=LsDmzI`*CWjqg@Mx&54V1O5
z7PJ+g06lBlf6A@lV0Rs?ik9@PCJ$hrfk1)yP+eUO-g55gR@&5;FQV)jb)1G)=&C|T
z6e_>9u1%ay4D0_bdA?ST?blhTg1hxj3ro?+#Mqc!l~LX>oCX1yrug^@%)}7Q7sHQ>
zG#ZDR2qZE(IyxYyhFcvBw?Io0(z!WBDWpw|cbjb&iv2My_U5{ZSmFb-#w~U6jMKbR
zQomV>DMF5)`)S@8zG-NEU9jUt#5-yd|5LVJe}6^jp)wf84+(o%EH+;)!B#xONN{y8
zkcM48Z|!(@S7J5?l(1&t*swG<Zfb0Fz}T6ZX7(d@wtLyPFIa+UAVbqcP{YqpC!h&G
z)s%2c9kA5J6&3SM^EXti(0s9;f4&TljnQ|^Ryqc{y2f|SH3lD5J7S`#S(9u7oSZc1
zRM09!*`Q06Ae$G}%}S@exI(MszTRx;n)AN<c4Xuc5bAnD0FU`;n#}A*tCSK)2Q%Jy
zj`x$CAC#0cXUJYWBUNjID%bJX7~29l$@svSpR6q6Ltdxf-|tpv4*;+R1_pL_Q@GUu
zh4_ThygitYDITB>3;(%-{e55JKoa4IAB?I%2?53iBlw4-;LQyCY*t3b3=D=cx+}`6
zaoR1q3l!If8XCvPfk>o)0O5%s>5I=#?+(C5B+BdSeb0$!;K3jq94@xHzApdtNtlX?
z%3T&=kpmU3Ibd+`mhLJNbN}{a|GupMd;PxW&qLem2d^KijLkp)>`B-acJaPOLNbYK
zZot_Z``%>%QWW6SS*XEGrJ@Iv3?ce8Fkv2+)h8t-1<UKK*x#Oit8K3yQ(9cyx8eIp
zW6CX|$J(RmEo=eUC9*|FMbW|Xh8CNE)dw&>I5@AUXc-J!09D}+Ksk}l0+Nt15*e`b
zM_m!B0Ui&hsiT#US3%JSV{=Z>=8=Ph^qo6>z3~c7=_t10Ysz$hdD<Tns~{92@3L&J
zt&RGW7uolMUIa8QAk!AAYu;vv#~!|20ppS;kMed+r>H7b*MowjDkD116iuEp;!0#>
zB&hlO`>)J|Wkf~am8>S-RQuW=61+9t-R;j!TTxa9Vp%qD_k-16z{P>cMJwl33-&H-
z1F|eK^0K)UAcvQi8Tk2wfg;zNz}^wK#~=3TJYqi!Q3<FL61VBeHQAv6>8$q9vp^r8
zz3qiw2KuG+G<slA3I7}k=x8y0y8f>}Kc-Y`@|eRvG?}@%xM(7gdUUqN!xEz#zLPFv
z;2M>=j7?1REoVQOehB9<Djx&#XhJV&lW`*LW=JF}gtU5s1>5=eFT8*Uo0s>cHTsiv
zl`<D#yXg{mv%`qqK#!c7V(I8J!c+Y7T8s@HV}11Kj!5j(ld31yfB*iS>D~^8&P^iG
zS>Ccopt7|Y%<OB;({4E#87ue>?DG2<F6t{UKy?7M3dq=T%3QH|U#fxYCSAJ-I6nY+
z01%a}t?UXFcHF5>{$yQUMUOT{84%Q*OJGU^kgS(I>~y_m2%wQj#KYkGhu^<LId=hB
z5~GYjUbVHIK`4TOXv+RRJ-EKD_ePbC-_%3^QKXUd<#x74l7x&*5b-o1LRUKL=xAtm
zZF6%!ur1FaUK#QE_r;td30c{<{fksx>v(*EYCb6QVBje+d4s`d7L8yEX(%ZH-*gh(
zZX_su?;ZeEl_mU^`Zc+^Rqx+(C%&}okcU!7lPbbkS`#%2fJ(<gT~tC3oK264=}-<}
z7A-0H>Qonn$i4pwfW0RrV!)Ur^aMbIiZu|M(B_)@8$*;{+w&^&S<)GrfHQLp2oVyD
z%@gd;)rG?-HIlgdtF2&wU;tDSM2tw9k>IOcppUBvF?pLICohj>A4ou>DQRd3IwFO%
zDD>rvfYb_HRD>dc(IS@dNh}|Bte79{%Cla(klw*<O3PBu(Cv=&^p4h=wnh(I;g6{?
zZL!gd&jWg_@PdhbH6i7{a@hZDZXC#p|7R~v4?MgMsNNp<dkDpRV(asL`4@b-o(;wa
z3~s<u3dQ~Njg?>e-+t6r(M(dk@Pa}|rl_il7vEw_{mK>}9a?WhyxtR_VZWyXF+Y)s
zy-`=u<i=K?2QTO;n8IBuK<nFKXtqtaB0d*7Rycq5S1I3qA3}L!52kHG@~M6g>R}G;
z2E+saV1JvVz6bXBXs8R)(?q5nM(z=D)}bD|{$E#DR}X{h_dY`rdwY8V3~C)TdMW(;
zn~&)%FZgCDbIk!+sP28;a@E(hJs|#<FUv7@896w7=vbz$^1Du&o0n&epJ{8ZsI*t9
z(uD&ZBlpe}i5M1YEuT|aU9F$=evySNq5Z)>!<ZC2wpyDVl#qHhu8RKZso~*?;o+vx
z0!7F*gq_{RoZy{4P@>P2g2W8uPS*RT0V{5A7IwE<5R60MQFcHEa8QnnpPR35lzw2&
zs|yx-@;P`=qo><~4wf>0^Q!+q-OYz09zA*lLVp-!!5PD!#X&&#d@ahB9v&H~!L|UV
zdi=5EGyx<dP=Iva`ZohUfG%<|!n<_a2x(yv3Wz}S7GKxwcf`9u){-X-+y=(AV3n4j
zO(nj?s#U<qgF-YRt9a%CSh#y3$4#KrqPH24KRtCTr9)3a#}kIE0%!2g=H-GTT5feG
z7Z+uS75a=wQc!BBDuU&oso-DwIO(RW2MB2d_|B#0L56hy@WCqZ%K({eQqsT*4a5(q
zbO4|uJ7&ZD4zQjoNH&GgR)D~*t6Ve{F96G8z4}cM@2x&PFv5vKgSa$%kAboA-p@xm
zK0ZFK1m2WWwwDSws7Wsh+@!ArSfm8i%VDq``YsCW#B(SnJG;Fl4~#Ma52u~#+-&~y
zjy38F(k9d!t<e+s1BQ{-+t}dtSfI?Wu17o+ML_zh0VysB;VOVbw+KNT7J6Wclr?ZA
zy!!^e^RwHXUXNqTxHOAK-v4-|XioAP$;ZnsGmWpHN!-P`xpO~@m%Y!@!C+l2_(%ho
zeqOOF09KSL{Wq6-5->Mh3&cP}?CcBx#Z=t85U^T&eX{A~%q@vqN>Wl>m0S$SX^f~s
z$L8tHWL_N~KR@?LGHH-Oe>jD0N-!PXEBOfup;GDn6(hASGdEZF4BCmu?)$szJw{NK
zs^a2p;O7a!xA_6{9|(o)(Bl;lTIxTtjBdn5o)hsM3etfi))N+1+0fO!;~D=2zm^ui
ze_E`IqvJKwxwC^X0HfEoQ-FCP5LgX+jOrTi9xSk*KXF-4%X6s|b;sBR1oRxVA4Hdz
zXF)i@f-+6Tu=d~HW@Kgx@bLv~_b~XakL$@6EH9lZoJ`E>Xi`?ruC}G<t0yI}+&elY
zSRVL)9b32wI{%nbw~vM~*ELr5j?}*QW56X3kDYKiZkav9$;kyN>vh6_b*STb)o>_B
zVRm@9D(HZX?I&MBuI^TO192WW)c6X#TjF<@9@SS*40N2PhZ&W906;a}BJc<hyEH6!
zjo$Ly=gY{+IT}tN5}Ld^jPP#}nNXC2iwit+koXOMsuvX00N2QaZ(Z8~GtxwZ`z)a3
zj<O?OH{Cm*bU**y8A*e@(-C^32bOAEP*oKVMP<ofB>CtnXV#k!*PxHn!tMEJ<zs>6
zll3$@?66;I<}iy@X8&t-r_#w<Wk&^^0*~bBew%sq^sn0a;*SE$zUu0V#fe&Y0SYAr
zZpQiipj4P&@2im0&&pn21ou;H1E85`Rtp`kTueSc9SRHCTkVBimCOvuf7o^bhU)6N
zq;U8-C*+_d?E7?^TG|bC<o^CXP&SK3`VRgvfNu_$!-$!shC})qV|AczR+l|UY7IRC
z#~dcd>?osQSJ738iO<>34=dfKnM5hG5-xj5XUTeJ6s{cTw4d!;?(JvWu7~m&*Gm$6
zfVNEpH-7Z{_d8mTj`o3xCG-FV!|v{m%ivF4EoTEpBpQ|l!+`tFD6IgDai<Fk#4shL
zv(`LOEa;D|)LJ9EC%v-)%kDuzLyS@Ft^ySQ(&Wc;L@?~M-1H0>_r7mVlf}{e)Eaq{
z%@&4lYdAjsR_S+fe=x!D=hhZ*k#p8N;}lhzZtqS@Xmy0G+baZ>R^nSLoF~C&&_k_n
z-o%N~!vJPr`)IVOS@<sH%EjyWR)SPp+p>@Oi+^B0&-F*+D+6Ugjbe`9(=9aQ;SQL>
zS%vMHp!4sOCov@@ld=XL{WnI3MruHoBOY*w5=U~{_g0FQ?@;kma7Or7H_gq35-YQ0
zXtq|uo`32FLGiH?e|_XXlf=9$NO^;Z{f?tdh4YyM;+k9#(4Mr<c8kJrI6n*I)u-gb
zCYv)bjtEHjM?XC9{H`?264!JT+Md8lIPR-Vb3!hnWNRPk(fMsoDM&4ct(D^s4lKF4
zBVsR-xLnATuDBUNs`v>8IM(CIjx)jo8xQ}(<Iz%kAJ*(=6+95XE4NOkXU{rTymwYd
zy}+U&VjKqLooeosR8$<@opU|y?F2yTx1I-z0?b1?vF^dj8BxX2?{96*O=t3BFWl<B
z{Ysk^`m!PmbIUb~%U(@%q<bRaVyZ8vn|(s;uz;Q8{BVh+K8cqDT!|<)4{j$;&ekm1
zd>0~A^xfDNRTM?wA`ef|R3%mXbEB^Mt!#(OHh%ALS44W}IAk-uD=tx^hg9+3UX5#H
zqZ?nPDV?aMU(CJ18N2*M4KxF2Co?mfzdGDjfR`xb{@$S}KU=KZ&!{QoTmG>(*58+7
z0M>jmjut~-LuKBo1x0E*=HB@Qk|*)MoA+-`xcF8!RF{>RrQJXZMRdgtJ2>3?=t_cp
z(_;->W_$jvBO|Eczg#-nzrE8WC2Apn>Ck*X(zmly(%f7a6JvT5OuwM!mDByAInN0A
zlONw<kBNZh^`He#k(q;f#>UCoyw_v?=C>696!Vd`doLOb^J;11)eZ&_;b9WDUJ5{T
zj7{5f(F(&psbb1}1u52OQD8U!-8P#-8?m)h;++EJhZsSX5fJzLgvX8H96KvUDYP@I
zi|RW^E%1UA@rc)OiqdQ~T@Ap<REC|kL{rP1>74K8{7V_l5vWR2kv-n8oj?YZ`SX)7
zrUW$%=9fk2QGCZ~|M|@<ZHkMgU}QUWNTHQ4qvYg<Tof7gR2QA?4C3>54Dh`$vszwJ
z5w=p`PDN=3KyWY_7LIxV6~&I*)vzlNgSoB&omLJx=w4y~cuSXCP#ilGr>fsU_DGTC
z+L{b*GAJ8rVz6{8LN~BT>X)0}-K<;aDi_J}lFR?>wzairC}zkWib#6jXy)4mDumBn
zFw=fp_9`e~!x~9v{ggoJ*%Z}GSy#~_swZkomI9b@i=LAk)EbWbH#(NzlNcM&#{8`?
zClj`iy{&-vlYVGwA}vH;T2Ts%3+Dj3hgs7Oz&mwDWz^CAqLgtx)^)#rtk7{5PHzq@
z1F=gf>5sRxG5n9Mu`u6uUv*iDlXTV}=S&kp1C^@3&8tsSzEr<`&`mA|dQk$Df)q<G
zc3JV`B$xpoLY1`yY{XY=#N`$6vrS&-TTiFg*AG$W!{FdY%d<w}cbJl}VKJOyVc{k)
zRzd(vz^y({^&NwWvd<1EZf?%5toPiWkB*D;lFVGF!?j<JQwcrlXBWeklsM&t?5D=W
zBoc{nWHj014fwwslfbsIH@7vPDqw$0T|RL4vCa@1T1D%Tn(7r{OCkg{HC(l@HJ4ma
zU>p97mnTYrc(@#ia6>vUsLYL(KVMxve)WnKe3ZOp-H_ou1w4a_Iuu$ku(9v!v(e;{
zKeWg%7jk?DDfBXryML!A&R&qdzh9(7?B2b3&j5+?r+cdt%3Q#ne!InwotE@D^v7gS
z=#$^HoVEEV-1AF1kzEe~7iEt7mVFkG`+9A2#_ME%&`2;`%+0|8_<)M5#dGrD8JfrW
z2{XVO{x+L!x&iNCYHBD76V)=pgQFv3mqA|eK;{PqY-HJjK&%1zVsJq7^2O^DF0oQy
z0p*JSIeG^e7S+>)P7c`XOv)9G`e+yd$;e6{mwI4jD!7lu?t@Q+mVWpk?fHihF#z_C
zK)9WP8InKQ*<L6*`{x5PO|s#Pc!FkPmaz!gn?&a(CIWeQd&<iaMH#mBc`_nccufXt
zEy487MjtGc4b}+kmI+WyW+qsN3Pem*j?Eoxd+DfCl~GXOK34>Yx$6*3Wv<WWEz}#+
zK|kl7nm2pf`T9!d46)qX88B?$IqvS>I&JMJvY!P^xoHWe#mD(wZLP~}`^~sGf?>s5
zb0dh2c;E3ceR`?4hle(9?}z?D@uSMSSrzT=S0Q={y}dHb)>S|{EUk2}H!3SE?n>eX
zWrU5RLP0{0?vxngHyg6HHCF@z#x|};`i{@ZLc%Oy8G-e@BkX+m-*-W?1Naw;pk@y(
zY&e)27@*^fNO-6Q;p~RrI-Qe18R7P>GRU*Atlv}yO1PZopNWi&zOd6?{Ici0>@+e?
ztL1NJ!iFm}p<7|w5+Ahf`-&flShk;*DswegyTERuCnB%169EKi*w~PxqS~0-0!9;8
z7ncsgXY@4$428BDk>KTx7BM^INLF8wrm1y#@_PsTiUS59P8R81Z~hx609FAnFBsr=
z*@;~_Z1TaL*7K66$GAOboUmE*Zmty!J&eJqqCI5Uc)E4z3Q9`A8H#~#+CxJpV%S)&
zxI70~pk!u6NePnfp=40P1p+9wp&|b&5jNcF!`WHRRI?8#V#WEWWx`O{2Ea;To;$vd
zj*Ogk9HO6L0(2C>^4yz{<JmOT-_;#^{m&uXBMM4S`c|8_uuzrp_O;Gix7=pfUk}<{
zp8E!oDIMM1PQm?@Xy3-V16Y}vQk|Bz9~C88I;z2Eymyl#{I0xwiY8V&D-fBsSYsb%
zRVTg4_MQjw05{rnFN`M{;pYbVSV9lp8hJ+~HfegZ)?@>PYIuAn8XDWf1)|oXQYTFa
zmaoaPc%TD|dR29wk6&m{SEFV^5CPB94%z98F4F1P$Df~tQIZyd^xqmQXO8%g_vP^&
z`?_DZ93KrB0`gXfeEwJoh31U7M*Fx<R9f19ZR}Y|$t-anKRR0XrjQd1{-*w>W@)w&
z%JSk<5_c3|!}8I3>a?zsGFUE}tr8PaEmqD8oCv;D?qTaH;3Xn_28LiW;hK*?11(h6
z114&N(VX`q#Vz(vP-v}@#sI=Ecj8h<dq7QCV4%zLw@ZE@<Y*{xu#Eh)uD^q>s&H<u
z*fHe01>ubA>4dT0PAE6HT7WiuR<Rb9D-y=_bx}P0*@kZ>cVCp18Au~f&&C?BA>x_Z
z`Dn+npL^Th+02X=gj1zzwb==?Td@P~vA@K>Jir>MsKifizU;kO=op*#*boQKhFJX_
z{+m?d1mHim*WI|hzM^7!!bLjqB~#SWL4u#}rbkP^kGZSk%I*<=z?UULum33)#!EZw
zEj=;Qo?lofmiXIo0h|*8Qv4U2r0dtaq})R__!4bZprq!OZMu^?9uc6vP*J%yxLfLQ
z=YgYR!cll#mli^T#kK{Je>NN_NwRE?POD&s)Z)(b@fieTTS&<A9j!&Y=`a}w>5CeO
zRYI@S?b`+L>gi1lo&_+*_a`PYgS<PhDlfNx^1B)yD{KgQoD`*NTNs#f#_RvB74ZOI
zU{D~Uy5f$4zb$N!;iL}sv*VQ0AY$LLL-6BOBNpxjaE;W|J0NSVJv_4Y0~b`?{SMmG
zEr|?GW`#9g48S6ptix`pZ5pkt7u(ax9<n>rFA}!a5O&g$fnidCfNi*KPdqx_6R4}B
z0tZFP0chn;7K`pm)#m;7Hh?$heCqY#BHsdnyZW$;oj9@c(MyxhRGYjvjr~G!nuz;R
z8ztvV5&(IB2ou0uba;&GI56$lbAR#qsJ?#F!Fy%C=XP^N#TT`H{0-oL99Z-OR~ydJ
zI6cE)c}kChC#yG_f#WZ$OM~*}h64N;R_f)$L!r=!UIGf3AboEV`*KeELM({yM81#w
zas42u2w{v81BGvYgSolFb$Lx3`v7@05@C_VZEWD#q#1U;=(QZ0*k3@-dG+e;KATSK
zDm(GwQbPse?noR4oL?2o(vCu0b!%YYl#ulG@*Pu<k+~74Lf3=Q=H=mu;=3hF10+;4
z6O0lBpbm3GUS75Q;Q~Oz%B+ddc}iviw@kqZupQ(&NJJRem@$C!umxc1o1cHn0Rb)`
z6cAM4f9&jdJez6-O}))onVH2Yv&6u0mMo2)qna?|dIyZ8q~v4xpQAQ}AU(wu(B9Ly
zC-CfH=VuKJ^cTZ9G?Ly9ErT~e-szn@_~&~%DJf+>C2j}Hm%<IwOS|3txM{Zq4CS-m
zvM53}W<owRH@7z&1WPn`%TP<M^G-RS#q{U^C;|w^zCq>?>+;$E;K#0C4*u78^#zh_
zZ-3jk4Y#n}oNpm(HYYLWb&%X(`Ge173IQh@>^9=XuI-Ppo~n{nZyr`0reO5H-mc+{
zFmPLrM-lJ7UCuTQ4gco6<F#RjHS&<7CBDscH_Q0+N};pEer5AcWZ7LOn##kwtvg=$
znNHJvSX@uHmq7EjA@wC2NN#;SE2v_DM>}fZEW*2?AEVba_)s7kIu7U8z^S0!;h~+Q
zft`k#!hh4J?7<Z7AII>uU*Hg1;J<lrzB|xzJ}D(x?*dpO*4?f!#{RjfKT;|J?2ieW
zr4esR>j}>u6dR+<f?vy`yho*T`%#M@9FrEMX7o<KFZOQd#LWtfX_}fp!NS9?o;NN^
ziPz>e4dHJX$UU>C6jRkq7E}o7{afRo5IeNah`M_9d4IZsM$seKP2dkmd7Zjwv#`*$
z?cb>T<?{eI`EH~D#dUDY({5yk^a&^}OjnlKF3*cL*M<F+JLotm5D}gX(Wnk2$oUD-
zc><l%I+(ZNw1jo%2#8u#GY22Dg20*BCvA#mWC>TW{wnU>PQl@`C}G+=dEVfl_J98_
z0KnEtlgDDb{y*Pwf;0Bal>eIt{r{ZH_y2ITHXyniET7qLTkqs_O+877zW-OvTUzVY
z=5ICq7e1<@#Z>gX%}p)-of2ish<>@2#9deG9l9t`S?XjJ7v)p?QB+1=z8iKuf-FpF
zMB?qYA7>|iX=#BCPLa>{KEY^JJeI$O(8syv_g^F#cLG$UK&;O>v1orork?Bik->G!
zZ^Ti{Gh=tWaa>Q}xg5Dzxj}E7NGPGy@~po1Q9V+Cw2Um2;bqmwL0rcLlCtRN{+j|2
z80Yrq6S*oTCX>(uzjFvDAjue1^qTEUvqZ}6YVH9MDzma}-?g$~emfm-lq8M3UuZf^
z%*{veXEW>%lY%#Xsc5X2m*!59uMR1k?^T9u$UuJr8rg;aJC#38U7gnK$xO#R-}PE<
zzTl&$?O9@~kSdc6%cHNjj_r8-aWInE6j(V(p4@P#oHbQa>i-Ag^5FaX*^iK^BC;Bg
zs)@J2e^rjNIPnb#SX501IuwZ!)%<ZAc{p&p5q~+)7NqR$W#MWsq6X%kwjItlv=jI6
z!06!aec>OQ9R%itNM$`I$Cblhxb_#&HqXT}K_F}Fi2MVn|GiWbC=Rcd^k;0W0$je7
z?SzSi#nF6RWl&ptyf9FfNVXzDV|d2hx3MvuntHCSCn%Z8%K6|vIMnup5ct$AhsNG*
zsGD6$Pf|$lQwkUMaYS9b@YV5Z>y=Jb24LE{@%yCcRf{;wY1j;7uuH*2ghp1{`CL#m
z1J}g)NfvVi!r<P=SM7nVi-V7{n9V6jJ|%Db_isOt=s>?b1fTN%q~`xWA^AUlD&pW9
z%{en}2bc6mjKTJj9Fm9F!<MOaD(>7IA+g^^Y*o-<4=AojGnGD_i$LW+1lu;**|rd<
zYdg~9O824A%Uj(R&r&tXE?z70VRyG+%HNlHbTs`5Vh{Y8iiL}3TYhh2-c%keUj4&a
zy{H5Z3Xpu9xNmko5N$=+Yj16?7o`HnBuGB-kb0bX$wM+L50+}lE;|D<nuJ7>_vKn?
z8@r?>zJJA%rTQO-K{8&;Q8C*kqGSpC_21V6;Ps@)=8gaR^3Rx11#{P5nyJ6cZo3_!
zyUJ|rxt0+F?jgs<4$*+X05_%O;B=1+_3&@U8sfS@{g=fLYd3bM6%?m!4+52_&vMNF
zBCZ?}g^mg5jC_`x90`*_50{v8mcqQhunqs`BmFN1Pc#x4F9bNhW>hJLGaWncDhR#n
zIOP3vEph4vF_>I0LV2;D-RAn?MACM-j@N=Q#ebH#bl`l@HQ5nKJf%OjB59ilha!$i
zD4ZaiHt2T>We9hJ-19R*an<3DVig8)2q)c<&R;F5<0$5=s|tr4g3m(_g?26L-r=VI
zt;~+>*pjGLt9y7p(X#doj*%q!J+yhlL*fDXMS8B6keB+j^s(jR)6+5LmB%a29e8Iy
zE58Qo=O5lZxyaA;BcSc%%;Q=2^z&!WdI=|SEty#vlZ*Qk;N(}LUVNoYZjPk)XjD^}
z5;YYG#}RdrTGxkP-;vDC8C`i3&}3wNrT<(D?1eM}lB<BYJZ;HPaNkpsgyhW&;Zh?`
z{wI!Co7}x}>+igg3Ad}V>A9U701ai}#(sZKCE-E3N*3V~bwu#I=_kxYOWoDV`1;a!
ze{#XM6i%eNF&_(Vtjk<cfPdU4Ib-o}qO#kKxNFrDY#9MXd@$knQwaX%@z+ZhAIVQS
zdj;EbQL^izo%vu(hddoo_-UBA2haNp1LveBPOpzHReSv&`9IWsRa6{N*Ja}nTtjdo
z5In)%-3jjQ791M4kl+&BgF|q4_ux*`bZ~d~seJR#npv}E-e(@GD60Eb-M)99bN1fn
z<*)xB)fHpk?|^%+;RMCr6|q>jNwW`sNYUvLL0t>buY7RANQK`-8BB3Hf_`Mho)QO9
z^r}sq`<egyyq40Ohl8%*O*0V1Aq5=gLQaKFznQ3IZ|3mVOU6@l8pTlgsR_+&EI80?
z)*V|hLRWGtFpI;kqKte46@)?q`|wNqqrCs!X+4pzqU<W5oKF~u>X?#P2zwWm`;NfE
zOI@CZQln?J76f9h%`x|t=EL@$fSVL1)Xm&FpzvhH(Mf&nr%Bj`93&a&jS0S1PO8_!
z{rAYl?jQ$VyKQmi{2jkz(2RiE9palDqv1Ny)XCE$fa}K|l*`ur9j=?!+-}+qznCTX
z;YU@+yJ9Hf4&WMLkp=1o`Bag?>5~A<AI_>i=m*nyUoeiS^pC`s=X)9Amyea`<RG=K
zQ3DNLPOa4LBle+1l#L(}2#LipvRHpAj?p~)UpnFUc3E&qbYHi^e>)nz!k-XJdmZ8*
zn3!pNM`-mMvp!6uO#dqv?sZd_0Jid2NE25qeSiq{q;zMS;T!4@oYIOB7`TAyj^RBm
z!q=`pC<FS)N~YSwDSvB;$e2K&cv$b?*N=5pX&Lg2mfgi!ImoAA%C;P%KCLBnBi-JN
z86zxVsqSB(+Y}@-rW8+X<SRHaW}h|`+{(bZAPv>r)Z9Zd93bahAUs(Y>EINDvV<Mq
zpJ+&$|MQRf@L~grx;{Ga9dJ(_*no@j`9A?UQ5?|`gbiRq|37<}qOK2@{}><Q+EtrT
zT7e|Gi(Naf(XU5Hn%#-9!Fzw?{QmOH@z;O-C5IYCt*iylpQ?=j7*fbjlmRzjgwkF{
zdO+6U|I@?TQicGW6q#w#4qn5#dSO)c{2PqSiH0NVc$GQA5~oiUd8L-G@n$3A9867B
z=Lkhm)l<f3S<J18X>@tj-6U+tA`gmnzB)Va1L6Sn1$b&T<L8dMw$d_Xv9+iF+tcBY
zybo=V52CVL@WUazZ^c=yl_^9N*~RKe)^Etb6)l!E)|2wj$@r^M|2;c}_o{8+@YTdG
zLdX7DhfNd6V)c(7uT;kIczB5v^$U-D;u-1u$0bnnG_-*7^Yosqq*tvd>YOw;1;tZ$
zogM<OF6ys}3}1H-$alf*3gZis>a8LT57_M|{+p9a)+Fh)W%g|g@y;krfkwa0W>b%#
ztfM3I9>x?G+@C3LQxl!;^sJGnLrS^$v2%n{j{3?UurfQUmIy&q$8JG5@16KE(SoRS
z4j&ZZ%!J5{g>gdm@-6w5Cv}-++UkoldD5xW7@v|>W#T`6tlnB~Wy$NvFA&t-DZ@HF
znoL>pn6}myc*GoFp`2O?pt4Z{r-|*f@p0z0*JH`xAVTW4zS|qW0ie*>gQtzb4o$rl
z;MKBkk#!MFIrbZ7^{flR(L0@ai~4J=Mw)t($1z6U9wM9$7!Z{>E|_=UP4r|N(st&=
zl`R9*vnkgnDO}Jb-40(FKBDmp*D9%Su|;=N^s^Ce`XDyN<e0z7ClIj*sZ~+Z3z|q$
zi&TazH%Hs(w5_4|zPq4;SJ)1j%tt5uZw)gcW3{9p;gPwV1%7Rr)tB18k@;SYiWF|#
z*2#lSH`*Ro<%)x6Y~NZp`Bym#=elw{(Gq>kBW+_k$HQnzye>&_{#KB_&}a{uN*kgO
zf<SrhVv<p5pB5#OrCYeC%VFORPD%<h;g{z|Be@&fY8MWrwEJJ#?D7D%R9&OwB9x(^
zH`FL6+aPw*rLiFOWr0APFUX77G0#SO-6AMK1^#JGoR#{2k2z)V3NQ{`N80^a%;9E9
zoc7kRl<F&6`NyOXlfM>GfEEYbX%O4;W;*i2&3(sRVb71((k?X0XkorsAK<nAEZ)Ev
zZ8e;GJsRGfWb3-n&#QV|byI?PeOWrV7e!(aV^Kd~xVMI`4MvBwZ*eOuHI=v1fD*sn
z`b#CiMGhMJRuvTJjNDPU@n%P_-reLC@I??H#y%BiPfhv1^Pu$NvbUJdC4B>8&f`np
za3sr3LxLRaVsE>@kNbsqwos(i)tImWb_6pp#s~b8jhu|XWch&y`sC<PfZR1{Z|A6$
z_A3--&_4yru`hhb_I2L=#JCR;gi|E$Uj(AED7QS)smCCVYGZ*5aKv>&%kEGGDR(NU
zlJ8B#b|-y~YvBIC8wd|_u|!t~1?g6%(t*r;?~)`4=}?8+mr~X=K$O=<{@0g7i3C(o
zDG&Dk;bz=Y<5L}qr!~}uTwio_Jd@(Z$x8U?=w3w7knErM0E6@Nh2anO6O*iLMj&ZC
zq4(iAoWl=9nK~w^@v}wgG!<Uhpq3*9lClxmp3P4M<jC^+=wf)QUo75vyg;B@B<9wi
zt(O-+_IwX%oDEB_oc@-wi`RT~wZey5_nymc$Nu>Pdy>$i7RSL%gd?bngKaH7s0RrS
zR5TTPcFj=Oxx(Wj_y{Uo*u5Sgp2sb<29_)#t-kHEV3z5#iE(Hy==;E`n>yN<B$G|=
zMrEZ&Br$ox)7PCDybCH<0m(+qPT$Y&_AqL3%3w>~3RHr8tgQWcPZ5j5uv;<^DB&5R
z;bo2cN@^hi+1~PUzSU!MG>d~z9n7gB7vqcX^OShB_8od;amCf-O?9S>64qp3FtFs<
zqn0GdGo=Vw2?+SOR?ZU~mR)ut=(hCNoekdgg#4+YIaBI)_SyqmG8^1JM&@)7x<|z8
zff|gI!_T&hPlGX_Mf-s|jy^1&5F4_`C15z<uakkngN|*9#EbV60=_=^AMn-4w~tfS
zO0i`cvGvC7xFAYpee%+IS*=Pa_wzI`iU*kg1XGy%v}$b1^E30gSerDYO}nTBLfN^z
zFq7XWXFA>GzZ2X$vpgrq-RgBWJqH<=sM34zs9ui+`#~r&Q;uL-HwT$HPf`y3q*|n(
z0@-(~_^T3e=}?7gy&>}#*`fIzFXImnwD+?G+1Y&VJhEej8!Iy&&pU<G-nXFMx*0Vg
z4iIRL)6^I9^d?GqObh@Gq_Gs(HI(m1$uL8d`wvdd20td>H)ZLD=HLhWM1o-|N8slR
zI)AA1L_)B#Hcw2-8+%9x|3O{H`S!B)dU?L#x2IE7I&}K0r9g68X1h+Yz^Sf11L9fS
z(l`KY<TLi6Ej*{SZ!-~lB2wtDjg;^2Q-zcw0-N+tBna=PaID|^I=~5{0k=z(Sn2ny
zC_z*q^ppud0`qiwdxM`rXlQ5v`}#j91|-}Lz9PmT8`tn%bNK{p?y={^k=MKl0rPr(
z9|+Ve2)bM-_+<13%E*{yxHR!=e%L@&9^Z#$(sz$?hv0m1PQ+bMM*|02>-@Xe>8&J8
zOQJUJBMmZfVfs<NhO6_rO@aS!hmT6#>zn_O103gH5J+A--glc0S-unlQW|^NSy(d1
zUko6qQtD3?J2hqzH>pLtFD6#W$X7}Gz>q~z)zOI;{A)}iZeC=q26LkSVe9TDgYSg8
zZ4>+wl?1uu|A{1QP&dFTZcFRF7Ia_?3E(8S|BERIH2F&1jT~3Bnczk3;`7(QAo?ID
z{cm8hGr<c2eV%_;g__0zpK@>dleNNBtCF60!93yh^5_42q47@@qw3l3R#my{OqBuT
zqc&!&r<qSJ)yBv2Unic7^;iNqq}m|-{V5;1bE5swumEE{bu_(+a<h4|Gs3d>idR|B
z<m!|>JUopKP}a|%t>=Ght1lo?t8EzRu@GYH7qjQ%K5dVs6G)V6*A|wR1>=<d0N(M3
z9&Fu32NK(hEhGgs`sU5Y??A2?)YaV`*t@3YOb(#a(`R1Mt)B@AE^9rZU0q%1ubHKT
zc|m|kPtCp@NA!#9x-pk1@(scbJm8pP)wXZH+C>K#2q~ZieM%=9K>*>jy{a2gs(@DY
zK8~KP_c)f4aGq1N+&lkvC3o&F6J{X1$&+!Nvact(MKTC~t+}i@&=mbsaz2;`KNxQv
z8}r(3b;Wiz^#spgh)fCA+^T_XZEk6QwBoxIRau>!gxJK{(BLrT_%!4C%9GlKzrE;@
z<?GiQX1~>}%tDIrk-Jb*X4ZEtY5=`};T}RAG7|J@*99<lIP+}lV`z7)_coCI+0inm
zN(y3U#K$HBGXTN-T3DX<#{O<B67B3-6Gi0f@LTJX8;|eLWj9Tubgs|oLBI34UMD@g
zw?ABDH-cHdQQ_m#249|Ko!Q<;cc$rRH@bYTcvsNvW?0YDHQDsi;jNUty0kj?9S+pf
zWb5Htn1Si-<d$^YZ2d&LYFGETTsAq=i-?j$7EJ^fK=rJsHe)_GZqVWGX?4B*gS7Xq
z;G>L)I0`8KJs^Z*cz*ad2D370Ct~4G+|4YD??J`Om`4(nkef7YP|y$p${kdaU7dwp
zg`(StHI=L!?6>hv`@$g1_w`oiu*O2I>v8qp+qr(p*E<zhOkj#3r9$g9fja-*jPJ3I
zzea8w0&W)K;!St&70D*m($RFvz1g)o8kW8@V>V$}O|EucM~4~SiZyjjo>Q!LXCQ&<
zA=n;<Tsw~sB?^a|uuK+bN_`sUWCpw+UsP572VaX8kCc>_vJyw)CE&h=<Kt835Xk+5
z^ud23a)P;;iYCF@$Vj>2t=eytOU*Y`Y<7D>3h&%0EiacAxHpR<&D1RVmS!lmG&qre
zoA9vjQW(`A_O)03DrA+*@iaU+5qeBAH#b$*J|o)T{bGX=r9*-N0tJ=ySXh(T$i8f7
zm&(gh{ela~HO^0bU@)>GDKnR{l-{(s-kr+J$)Q5R)enC^>~*odwYjM_#3j6o-4AC)
zOlputmUKvGKjO48aJ4^I#%TU^|Ayih#NuJ*HaBeC7Ncca_(T5WU{KhTO&K<Vpi);o
zWy6s$EyB9}6j{o0p^mtQXkoq;KOz62t?)Gxh{}Ed+5Y59S<U@mH6;bzYxuv(4kkZT
z^ZZfsby5Aqi^@o?M;s}dnwk(15q~bS=6rkwtTBmnG&F_3(`y)8u(_I>!AJXL_1~^)
zOkUspJgVc^>@8Z%msh!u&__5J0S`%J5G5<RU~+_K@^Cvy;nB$`u4HaG49E1~g(P0r
zu{SKl;ZZju(`&PISg2mp7qpuc)Kc0llTW*vu&wv6Vq!Oy-^?Yz(3IlMMw6KI_4Km%
zy`1-^3;O!RQ-?kIS7WKg);BgrPcd;yp8>`(+ON&IWh{gCgi^=;8CH51k>33(%*79{
z^MC!C22@Y1$vwZJUO%_`s5SN79oQ^I)z+}lqNC%g<2r(5Q3W%2o`<_2wVddyqqiw)
z9M&8zgLU}hrq868o|3^P(A!Rge;Wy45Lb|vl&D@biW(DvzG7ck#>?DXRf!LpWS7<i
z7r4CqvL@MG;S|8^;yhYpb`jGYtU~N*gVv2D9I46D|DgI##H7RSxcWGpK%2~B$V>s1
zcpFz=Uk^yZmpT|l=Q0WkK18TH2P~7GueC-g)fA|vqVFG$)vHbhYN!wo2;8ielRM7#
z{Dey_SPn}1-fxoo@txrLaqbrW>j94yHi!!0=4y}W0%b$fRjJCTL(C#fqZKcyvL8VH
zpaO%?OzqZ(WjW}=c00R{*Uqa=#kujT<)>MO8zk$+hrZfXP@6L7TgOghrz8>)V;Q^p
zNX)TPwjdJ))YQZzjotc7>B+arY{|WOL8@6MeP1TIYy%wrt`xxRPz}Rgk594X(b<{L
zg=Q$`KzP3qlPvdG(DCH$3Eh>Se*!s>7BC0QFaPXP5E6zuk>~D*9=Ltv+1im)Od!k-
zj|!f;Y)!${r4p&$G2l_q@cE@V^rzG4{uiW_x8hE%Cjb&2ys?c#&tmOrSZ6hrBNCjS
zx8Kv-n^>U`jC0Rs<V`+jR2n@Ueg8@&|L7TD{e!Re)z!9v%}SPd0k>58Zi;*dU>d8V
z9fnmhrh0ti0BmorVfsE4#z>U8LijTAU@-U}5>Qr9t9QyA_wu(n6NXs;jOY2NLw%pt
z7(J%~yw~k<5tI#+b1k1L)hoB;$(Zjiv$Fw7VZ!H|+7T@>)jWrU`zsQz-|FGC94dqx
zq2m`eoy@Yzb63Ks)Jvsxlvy{<M^#=@_<@tQMvmhn_Y@b~&rz@GW+0@=tr|Z=-oDxD
zw4la3;FvT9D3yO~%7A*pM|E<9n2Z<w)PKN0rnIJ=SrOGM4Ylj+e&@W|R7%mH?dh;T
zQy+mb|KfJ)aW}#r({{(s-rgSCBvIr<>NpqydXF~f4S4M7-Uud$!<}YLI9dZzm}dTr
zY)B&1VXyPTyS}c$p`JfO=|afRP^h8S))X)+JSa3k;1oZFv-0~>F!$~;jjINDTvvwz
zFIr|qA3DD&Sdw%5ZvRPTvm7Ub@pr}3nd*vcrZtdriX#M^j!V-5H@JTBAqf2QtKj_)
zk9kb%xy9w>imThF=CUB7!?1~`)~g_ez;>wJtM>`{f>7Qb$o%s1xMg39{tWat;Mq6f
zrD2V&NCg7@(CYR_2apen`kRF}I&Shjpdh}8feD@Vqun{n>`-Kl`Z*a;&X<$%6Fy(V
zuZ(j;kO?UN!&ABcAeP?4`cCaPXPVEE0&QpC@?}UJY4P0$p89=h9a^85`@2efErq1Y
z`(lPo=#N%^`ORGOf1kIT^Vd@Hejde-K>pK`@zH}bu&VRk?HmwE-<-_)UtM@=Lkewp
z+)k`|;XsofCqy`to$2kI`NJQ1Sw?pS7$(e9<`&?m7Sb7BXTC5O9aawBbd*6`^u;tB
zSXIuW?o2s_zP~QxaIVESynirpPIdRflzQTZcJ>Fj$Pj>pOcG<Fpr^Ja>>we#I3<WW
zt`CTJ$9{5!!oi)B)4c+^Ll!ksSU`T#!N$q-X1<`@qey~U=mn+Za&pWU`jotKPwmh9
z3YaE#>Py&4yPixsP{;G2-nEJGBQJL>P)?G^-|;I1k}6fo<CdSuMw9*vYe)*}(~e5#
z6y8q<X96q(6A2Eo@l<S8Y-Gt<tCU86K=gO(e_e(_Y2=NWcZLl1c*1YvaY~XsvXtOH
zkvG^3qcT{enadX;Q8&8lKdg3imi$q4=cT(B!vjha^6Qk6LyOlIf6qQ|!1P;gY0~WZ
zxWAU5ybh4<Xv))?!WfD|v1_ciY<MUO8$Ty;Wq!xI8IjXiofa8C2PucuHxTkgf~QYB
zWnG7M#LIg<oI#iH4U~HO`SD+EVsF}%?RcN*zYMO<7(vU65678iM8)pD*-$$8|E;&b
ze;Rf%-e@MGk0o!h_*054&;S#dCopgzWpn=XvTvYehEDaplYDBouR1h|9@MsD2?|Jh
z57p%|aYz|#K~UA%1=vW;Kvt@*)P03)H2<k*BPJUr*ls&^2*>0G=eJ@|d+*1~B=e9a
z4j1qvlMW?7nXU0NVnD`;kn^iS)^K{(tFY#<1VIFlaQyX$AMhabM#;44lOdze=QU9f
zft<v$GTksFYCMp%XZCx?`Ui^x3JFO-Cng~g>R7KxztzARG5#|9r=S`OftaMe2}FhW
zed~|DiJh)g6i8HEmk=ZluVUd7jtGjhw=DyGs@vzBOzhN*(_>87jy_!QF!kE2JSpOf
zIV^kGUVH7gKk6;S=u1)z$Fe_*nR{}XtJor6Sg{eiXWz%AD0vRxj}5*R*q2by-rRep
zM|Urg7cUjRm*cE(5pn?MtC@Rej)T3As4Gj7+nwGujz^_I%wRV#JO)|0EfoxVRbRYc
zCAZ%ldn%AKGFak-K*D3iM9G;$AkdJ^aIP@l(MDKZk2dR~yft4|uD)(|h!y?y6y%RX
zeI2TG9uJr9MnGc3GO_f;U|k4%9b*f7HpZ(41sXI^4jny9!S7!eg@`mM({o+Jc;7nY
zq@K2*4pdDv_ZXfmchB4Dph#}(6IkKL<y)oRw*dfSCLV&2`!~-p?@ME%+x0-v)apq`
zO2gUZE50fk#`$OC-zp4z_IRFeV4i7;_suVub_jCi8H0N!lW;T(Re#s<<3n`4S!_LE
zOArl&Y<vlh*mXl&L1aOgszfPkh3ZnJySxDo9Lc~HW2D;j+jkuxVRCG50pwv<%I%`7
z!}XZp-Ur`{*_d`G7SgW#2P1E{tKCA$)AI+&%Qnkn{@r6AgO^tV@9{g{Jwd*7XFs)t
zkZWe-Hte`V84=QzZ+F&0t;GJ$J815$-%3-RD0_ln^M)SX<(nh%yyp$(RwM^_r!tqG
z(2Oo!H?lDKWBRgP1+1+l^^ihUL&qyAuJ~xIlc)O7fd{^cYWxnnS^KuJ^%%ppp_xl!
zTP@8pk@aJ_*Ft5yQS2u0pEwlM*h~^am1B@VJ$<{b9PgNb+Punc1NO}CiEXqu3`Nn;
z9+2^Bh0hJ|LP`@$`Dx>H#*m|qSAKQqXvlkN^}Wt53_ZxHhYYYAA;j_;jAEBlO!j2>
zxg1QlE74!INjma;Dof?fowk~-F~;JJz27`+x4Xg3B5`J0xYl!am69Y2{U2O_8R<%}
z4w@26cJnQ_%7SdN%s#lByUn54J2O8W<ptWZu~>d1AEww*FE^!!65GmDGGlX2Z0Y;u
z_IO~}G|XWz!i-3N)wf`$^)MUFVE|+Gf!1-3SLtE~2_%WcKcYGF$u+IzK;oD$9Xh)d
zTd+Dgdb)Kiw>MwTs16dIYbj$n*oHl17s<T0Hhx%u8F_j*zIWkpFEmd7@Ia)SLBeL?
z?MbAF5Q9^yh?-ia>d8Ok7prG{(Q6fZS&NKDn5e5DaW;KxXU~BQl3vHUxz;CvyRtA4
zU~5yPV|jBwxc}{3)(uJZ4mtE_*T%3>wMg+C&*%A3o2odc#K<!@umhoz+rG1QSYPbY
zT37QWDvjZoY+oY+5yZ=PJ{0ej&eEw+R8QibQe|Q+M9M7Wnq`=?>Tg-3>yn?o(@D^u
znayS-Ve$ff!D>_)WR_Ah)zZ@XY4PM%>Ex1Ux14PGbfuYC``j|!eYf^PuoPo?UyiJF
zGJxE+uoEK*DsI9$D~lRDNiN~7K=n&#{quIz=CYqF&)-k7m}|dr+qIJ;bmp}VX<?UK
zl68?=<CZ}LRfuw8SJP>c(OiwA@R3mKP6s0D7%$U(R0>CZE1JRZ+YlUj#EtuG(SoxO
z=mL$J8xs(nt2=U^0<r;|FBAX@18OK+f&VD?|MO6#ePHZ^bdN-UT+DOYa^$wUKGN1e
z%wpB1DQrt0BZA*o*isP2Z#>Y=g_l13;DPn=h##IK_H?GgIQYeT(1F#iw{XgR%YQms
z(^E3g@ZE*ge2AF#loXu0>D+<PZQiW~(NlY=?O9j}np6AF3ze6`9=fz7^}xeqZ>+)k
zB`1%D%vYfPnB~QihiL9SDLwQUzuM&Jn^@-eR6qD;8=;0%9l8#7r_&>R+0$*i3@^W-
zew??y;izhnN4hr@T=rEi%R-s=A@a@5Fr_e%%z7rFSP{&&%?#%3ubR{*U-5i%6U~MV
zqd}Ls(n*SfwnV3V>Y9u7)64;ijYggOt0MmTUbGkMsp#n2UF93A9@jN!S<{uO&SP*O
z)(Y%19aHb!o=8cu!v4u84{ssEeIYOZzJR&$nt7JT4+IhjlLYF8{%EOEwUfC&-)B?q
zetwXsW+H#~@b`yg^cKKWPHj<kk1b4UiZYxpu5AKO;x3+71~?!Sg5hKE(Z&f4!9^1!
ze~ZQ7mFZ$U7`1)>UO%vht5vGQN+21D8=3Xe#Y1_@ZbFi3^m7aq@6<At_lzHsD|ydv
z#oBgfXULN}*cQgFXGc5TfS<vKWrusD?Nd`OeK-5cY#O2CwfVCIOGZa$``~0ExL+*E
z!K)w?3JSlB{Uya@Aa^}LMgp<b2N!i+?dU*u@##(|G8R3KtxHXV+kW@KDw*E!-)LW`
zhY{6(HVZnG|AifObmh_Vl2Koz!^LT`<Kyl7VmG<;S3KF_9uPVjdU<*99j!b{6G{1@
zD`;%r8A?UGJS|nom|8M<G&OVsV%h3#=dT!yb^X|0>crRtWMiUX@sno|{N*(GfQ(q-
zmp8Mea{e5e2%z|WTz^6BeR8Bup8zeY$`z9^MPe6EJ=oQwAj5T~gL$_shQRg0Z`@$K
z8?w}SaZl6dO?{qsoQ8WlIkd8mr;o;J-Ck>@&mVI}fK&x;yx8e>_EIY%0^rH8DRi=%
zdNc!>Wu84@z@1^o3H1{J)Z<1~&D#{dExPAI;xs?tgo%Bx#qFM)&|96vuwin)K%m{a
zu!BZ%cKt_KP*$|Xa%rhf;Wat!OM8oH`N|)0r`PZg6PPZB9!5^2Vl+deo89+JxL9%x
zOc-AqCe>Bf_H~<G(_0+e8rzn_rHRtVhI_x9$|c8n1y=U1r*WR_I}ShKoQdg~j1f}3
zK~#|0^ch0OytEeZg$5bJL7#LVT+^Ly?W0}&Z2uwAHUkO;JNxven+$J8`qs(11vT()
z(lbS7@@lwuXP)gSZgRW}LpFX*7sS$7TCuw>JlY~oOs2;9h9n&had;dS+F6yC!-yhn
z&@6F7lzIL2X&W_6BE7KQHm9s-{*x__&sYm{DvGAz?ZC_PetWSB%z&9@-!8hr+B7?W
zLZSYZS<dN4D)WCU2#>h6(;J&@je9$gQSloHkG7Nlvq5nk7j|cry!>p$OGxqIO{1fa
z#e7BCC?ZZ9pWCr_aF)Ig!m@QcuQQtgJm^uWF$>+U)tlhQw`q;kTgaXE)9X&##yjC0
zO#}amLwScVG`rST(w{e6j0_h+Fv(aP@UaPdt-HSdxAimzapx#ZY8q}<F#}zd)2Cxd
zp&V9b%h$WEoI`&a$LPNZ!q*q|rVBo&I{r8P5v`=Yf=`Ys%ad(x?p89>?Q>#<D=v?)
zjyu6Z4Zrq31}M;EWXSJi5s%bz?`5KW+a!N>Lb4IolaIw+2x^g+A6;D@QrWue4>r4f
zJ)WYv@|)Xb7h!VGJT5}~oa$PxXEAs&@Lyg5%WJ$C)K6OJ>Rm8+T;MhMsjpxMhU8@_
zvo@&zq_-lK$weX9{X^FX!FZ9;kap1Gnz{XX>wzWfq(Dqq(Q~q3Q&PY;vKh0*butE{
z<z51VYFPHq+U{QI5Js3<PjD>z==HNg{e^$VE7qyF>#1;4Y%Euof3n>3)Vq&-jjU|C
zJnV_i$1T)fR%>`z*(OH2d&e7o<ei+7|H>*Odf1H*w>7BhE2K~r3qcZkU#CZlHIGKJ
zzwA8Ot)*=%8>eF+21&05X%!xQYuQ?9Iu!x670+;q3(kDw-uslw8y#HKNCf46(~knu
zxjh=`2@G_6YB<iC77ar*N~t?mJ%OI_p%F~(<w^z5J+^Q$wh?3>=Fy!fCwWMT^poeT
zn~@`ZE2P$pkNY!ospanJ%QY7Z4GiW5vtJx`u1_b!ze)Bai2c&l6dg+z@@*y(-$RM{
zXf+`7+-@i3T3|lJY#IbQYys>IJL<;|E&`t_(FHrYZTMdnx5^eM`F-zhH)|9v>~h$8
zqYWnP@cx=h!xtG?`X|KDGE1Tdc5^7>zb|@aR&hGgkbQGwWCN)h4ih@H2F0fTXbDWC
z;!#LLoB2IhSgSd1zdJNGgd<aHzVrvZ#YbZQF&g*EymE_{*2P+Z?Ab%;QGK_(J%Mc6
zK$0fHN?GqB=!1b^^<>3qkfFA5EB4E7)z)#|6T<!{xZ)ELxP~tRF+K^PPtD(SntOeT
z(<E({U~GL<!{2wTbv7}LjSh5e&N_-B;Dj^2dcz1s4yNE5yrLYYyJ{Ub7V#T9eoSXk
z_!iDA89v#qJ(^Pj72%pTzE?RxSh0*X(LwLuQAf<qs=ot@60pw<9@(uo{Fn1U%C**|
z5XJZTO?LztQhvt28VzW;{;QpX{et&guD);R>*z=R8#as#-GyO4%5?QpP6l07n6ROe
zTokpv%+#Jz%*rr<fZ^fJ;qLBY%}GV&?9Pm(AgbDLpERepiclrS71A{CG@AMh+LM)K
zCgY>O)`O;quUOA)M*MvDbJ_8~s7nEN<Ek_RQE~Hrlk~!9l228z^Gbca2$!LwD3*-z
zO-wG>q(7%>8%d6xbC!;OIb!5{6t2!a=P0R%Gzk)-gmmVvZ4Xdc?SCAKQtP4o{KiHy
zP5xhU)}oJQ=bMu87uS~3I3j$ImPI>Pxw|*J{h>b#n@gGKe)F~4cOkF4EvP9=WQ#`?
zD?@zeV;<eXzZnQ897;x&s`k5$oEx`@;*tNAt4815gZ7m#sqN#R(7&_J`)v7d4lYJ-
zAF~pENx{+4^0%Q5Q{TFt=}89#6aqOIpUp5vH`DTLB>{X!LK<pZI^tmQ4?_Hp-!Jvt
zj=>IPhs$wvnD{JNp1lk1>Abm4i}BSAiedfcr+06hSXk`S1b5bB+Ai2jW}LUPqK-^7
zurl2C`|WvBcbk;nKt8!nEpE|@2^O6rK3+DR#>S)ync{!IdxhjB{_{6Y!wLzJLrcw{
z)+pOEw;O*Yw%q)*Q3=(zXx$d0LTi&t*o}vn3W?IwStpRofCET1Gm2Vy>wT4jJvUAg
zO<aCEchwrrOlxa>op+{o+10Q1i2V!-K6k06%Ot*BXq#iirmx(5C;Q3L{BJE&weBg#
z!Q7vXc~+ob@K~{SAq@{dKhIAj%illjx2gqxIylIK))r=}obZ*^qFrr0eq$=i@{t}Q
z2(Rf7<gMfTS$gp35@PfNc!EfW;Udx$yiA@?Idhb%thKkTjwy9yH9q3KLGRYl@T`73
z21q_Nxp2$R_$SAxm$$*`fuWKOiyiBWqt<0QmoF^RmIuq^3A~KbiB+zQY4_LU3!2ID
zW3aT@3yhUk#aYMmu5=I-YiQi;^qMNz|7De@{NfkE=h!qN#f}ZmC>IrgoVhmY)e(Jh
zUc*M|vHhnBEYSicoc+396@(^3-Z&+ohT_1@R&ggB5pTn6Y4`;%O|7ot6QoY8_4k;7
zUXLHnwtbO(idoSs(0(*qqoOXSf6z{n>!i&tm)ij&Epzt-G{}0^Z^__nB`}ZnlZOMj
zMV{i<^lJwR3?As$lFI7HcmndV8cNwazLAXK65Vlx_x_gJnD-}D^8*~D$YA*i<fK6R
z)-^sX4A)J(pTdS)7eW!pjQ4302qmf$E`MPct?An*QUBRk5EVw7<S#vApQxI9B-Q_W
z=u;r`hH)|AV*0VPfxb*O;rGANX60q$Dg9hd6}kS=f&2cfj6u-iqLyGb%gGE(9;e!A
zxTs^4@3n7I#EnlNjD2{-g+Y(Q>AWIdxx~ZLO}nstYyFX?hUUjcD6+d=&dtQ0wRx)O
zF|E^|iY(tCDZRzDN|s6)dH~-46w~fe`N#qEN5LxEBx@TOi>k5Cw%b$N4l?j^IbuKK
z-ApzP!w@ykTlO4k+CJHSxWf<#5sM(i^;;Gg8uZ_@ym3Mpecd1@Y}vt0_VbW)aU=PJ
zVgU#mw1J=jfuoet0Izm^z`)|7Yl-)FJpK+|e;-*2@$)%D%EW2vv|&4Aa&+5faAvlx
z!`a>n4h#Q_I2mM^!QR|YnagPGN5DvhqV|tYGI9Y=RkLmb>_o|gYx@J$M-5jbQ(a7m
zzopjj-bk=)2m6SlMzP{Uf2)2yL4C71<(Q54M~35K^#K*(Iq|6Q19PgoHirG$vV$}p
zuyfJcW)a!ZW8|I3K~@8CgUVGu`$6r2Ms{gMC|PMVgM&W35^}ylSf&!6nwnc_jE(QC
zvRmlWX}ApQMxUOoTf-Na8v`~<L)E4@P<p11m~LFKHs~7+c6rykAw0M=t&o8Hw1SOz
zViL{bgOB$C(Vl70X$&50O=usd8dPQ7h|T{xqSx^cv~;T#I;P99*0X+!qU0PxRxc?=
zh8)Q`N!1^Ro`wAKw|9tvnz687ej*pEBsr-a%P*eEs45b&9HnDXfdUe?3~hVz7#SS$
z)R|~K8%lIjP-E~CdSo_j*7mNMqeMH6CjVFA9-&yMO_-4XF|vQs0j^5gJv&gqzl~q@
zI#EK6IoWP`%)x2{-@uxriVhl%kF-2(P~$hMR#Cp`w=NZ2T~^SCP(Ar%PkvO|=~Ael
z_4ncXe7{63m#uQ7PQqk+e9u}*nUxJL)ZDez9MmR_ypri|T!1IE4*ULb=Z?eqPhfQ3
zQ2q=;7FnwaYjb+3vuk23Xroyh6p#yqtfdHBsLal2Fu&-W$S3cE;`n@vQDi@?$hI3(
zL$s(?jOh(l8HZZ1zR#X!(Tw;9Gr}kKxvGPYV&queoNQ;Lr9>_?^+S1@J;f=p7<m-<
z3K(i=L3t+2@(dnyXz@@p(RT3tdoj(4{^W%7w^FIdP+2i=ImNx5Mh%mo?@<@y!zl%!
z<31f;-yP9kpVUM(5dqV=I8iQw^Ic=8WwPHh9#FW*-*nQC@5Z;Wwvr9&#Fx+HWt3cf
zfLExHJl<HzFGP~N)t_=z1yRWikIP5E7Pdx$I5mmtnp+%fX{5z_dT77O=wKPjiM4w6
zCU#Gc`+iC?DvkdsJf9EeU*r7E9T}uB^V5gbQu{V<GvtKty!<G-74SK$>_r61R7Z9f
zb*GfAdw##(-;7zjyI?^FqF1ML7zGpjp3!z|<ICACV1G&)I+OD5@`3KQgh+h7Dxdz>
z=F=&Lg1RDB3@w}y94PTgOg?q1Jv%Ou4$+hdr2OXd+Xh^@v#;*o8q&T6E>F5(Y4kfr
z;ZsHNVc2sdM*eXPWQU{`40sHw{-46q$2%&Hez|0;*1gv$#NVN=bM@_hX^%}|x`Rqt
z)osJ|96-*iua>E`M|YxLlfeLfuuD|;F*Z!j?rjKx%K0^KS+18U@3X_FY<QeOzvd@#
zM*Ev;(lki*`UIuyc+%t&i%?dp#G>1r23f??eA4(nOwr*X>rY-_yjj}|?z5~g9B6n}
z4VQM{hc&37J~UzAM)k!{X?vzl_>_rJpp_;w#MU*e?eCaStp^&i9rV+X|LPPQq^Pk(
zfA?JSZJ{;QtEUxIWFR_p856j7ZQS(#E{}%*D%vX+q_<qq|DLeqCC-YP_GP6U$oHT9
zY-?96K5*05z3B?#8+}$^+qcnfF3y)0QeHS|Xg;eBRf2!Poz~HbPSACAVYC+bKzJ1W
z!h<*ZZoWxidkO=S!8e%>D+(@P%<YZMt<T=puuF;ty3gSAOr*}avpIU!_hC*4Q@#;J
zxu-_|QJehjhGmI=;TMs{{h<;FgTu5{)W!0PwIhX}acWBO>(1!H8W^nOELFR;f*Bta
zpjru2TX-IA2y@q3X|wtgZ)=D8xjXJnc?L(~V-Oj&n!7B;0vzfb&6QMUdG<?-?kXjj
zZJCIOMzHK++ELXYjQWJIcc^%VD9<DzB>}9Tx$Q9~6qD`_vtDlhyCdHYw*c9s<)l~u
z1C6V~gyaC>?*6qHxHN`h_9B|IH{Pwp{e}}uavFs;l+pupul6}{(Qny_)*%ox#JJWc
zb30g>O3ilB{*0c5{4FvlVAd_0TdQcIMYR{(o#_i=?iR08m11^o#ZKB7+H%x^<+~8G
zo>4!wGaHjI{@gY8jXr3CTq~DR5kG{d&^LyII+Yy+YCS&fjd3i$xc4!7IS3M4)r#7o
zZ1uUi4=!S%%+{M9KHSOlNRsGcKRMxR6qIEE<I^(O-K<fPH>~*9Q3CaKX$pS6&3K<5
z&mN2El}PV!rCK+RlPD}a_f&~EYUUK3naI+0A$vDybt@42mAD1`OdaX4&d>h=)q=$7
z5*(x1jR8is`=q-ELro82RxOdF#?!XGvF2;kX=;*ok(17@wT1@sh}3EcMtT$dpK3F{
zLTgHGfj%3Yb(%L)P{eFzeFY~wOF1~@Hb=)*%MxANcp-+d%};36%JOosxDJJx&<?dg
zt~d3qiuRqBv(Yzr8yZ5YDtNgeMzv;@<&gmEhInDhQB5T`lNk@bj5<x$x6W@eO{pYR
z`w_||uY+O0`y1}TvcNhBQRnS&%)#_cM4uZ;0J1gSmBl+L4xV=Y-$s{3?@iL)=PsYT
z%0E06s!Ho^iuS8ao2H&9fjDk;`%!&gtYdGPs8OsBzf5GSS5QmnF|7foTj7BYkrSB1
z2*v`TM$=oCca_96a1RCqIy^r|!u=9{TYTxcNI}g_!#bJGg;mgC<uS<4S)3B@+@SL{
zQ26b-q;AJS*_zynwz8oE7<R?8$x^7f&b`-Q1!H+xJMHkIE|!Qd6+DKjI!9gAnRPuH
z+bC`b8YoCZ_xbFL8e%t45}j)s>JS^O$O8@uT~0&80(#5Nvd_8X>hA@!vl9~wDk}}0
zzl7j`jD+}0<rk@AWMd|F41v}t!|@*w0}sNeF3|xlqikp{d7?DQ6yT2Tvp4+#@Guh)
zXfLh6{Q}>^B}ZCXzjC3lY&(peX(5S&WSCa=K=vSl0Lmn+cKni#tOF2+OD&j?%R94y
zCQkpjO>fVwI8M=lc$iB=@|1p3w*Scr4-lh73kfykrg^=zC+|GUSK2HNdGGFzRzI5T
z5t`|05HF~h_fAG{(h*O&I6H&71_laC8A5*|v_@BkS!^~Zr-DH1w<tGAMD@Q|Hapwy
zdPiU~VW4iv7`gs{K!c%^5OsPsNp-93xna4$HnOEO<<Z7}h)RfiQ-j_Em3w^8Ha1hV
z&*FxPk<JIcV^6}Ts~v@rZI{|Ij?9cVGRuqA)?I?y2$phxt``8Ry*fw?Fyuge%ZZfr
zqT(}&kol&;T#Ixesl%L-{{%W+4=p~zT?$viW@S*eE_nTg|CgM$uI>w%94B6+JgyUg
z(D{xDJ3!If?@lTr6@TpAxq-p0)!zf-o?i)-<Jvgu_psEt_O#hA8&(VUY!9c^-PWW<
z6p@L~#Hh##!)CTRp4dmQPqc40b#tqSf_BBk^iYr*g|3ZsW0rrz@6BB?W_mMn`?*z5
z^*5J^dG#L@eu5Z&b0SyA#5g+N3ONzFFCV*xaCuyDSq7a#X*y}V^!TD6k5tsho5DNS
z{!)aC9<IwrG8I`DS!RK*r;kVJx=<l<-do9mH=7HxD6uMm;xchuPlFCE*&p>qu9M}G
zUr)gWbQ`6lq&(hh3QHr4j^?U9<wI`P#bYnFd-yIY>>=RT?q(LlnzRQF<<N{FHtbu)
z-sLxJehza!IoaD~3AuYhEUI*?3l9(2o#xt0#E)cP=5T>Yn46ksCEE>`2Wt|~Tm1r&
z8&Fvv-%ZEJk7d?cCUk)HKQjAwQn4WHD08lHv<cz$%RaPYv}*1q9-T9d&Y(qnRP<!$
z%cm}f`-SoyW9shL8sNU8w7Z1|3*SRkmQ0_~3E11Mv#Fv|doaha;pgZ)$6O}GjbU$i
zQ4yr@WP{)E3>5h@caGnX4YeVh))R+`*lg!YJ|BK&$%%+3PtVPLkl~lgebw{H)z+5G
z_w)P2*S_!6pheB8Zn}^@2I`WwT~h2?J6^6SP;CC7WeM^87Y1&%gc4O<x%jkL3Alj2
z#)b&-M#ZUj6$H`zRqb+tXvM{qn#VL;7{q@|S#I_W3mZy^;u2%&=<Wl9>_&fq1$O2m
z1%7@rF?>VEVr_*zQ?3rkBlLo}UdEyCh&#Q-E{~fGTr%VHJVPm-5~M$-eI%OzCd|JL
z8~Wf{%kTVFmbKIHBBNliw}{<I0|i9C*FE)#sdJbUi71>}Ca7=|Nkf7#Rs~%B3ds9L
zU96fpDWrKESyk`!9f(&K(UcJsAe`Pk0`8A1%`Q?F+!I9=6@E|mSDTw=NY=_*Gn11>
zpJcOIg5<w*5E@KBT-N<TB9AiDH%)wGM+CZgL0cOG14U%e)b|_gOKLVAM;8xuwWArB
zc=VvrZh{&9Z_<64#@kd~1n>fK&Hrrq%WqC~jj?EE+;e2kmh^vs3)pbqJa__K-9Gr=
z?D@WB6j_93WF|+?IA4gw93l9$*b4HqRad9|wuzWopSG^ZMMemBHK!YDU@X<t)1<B|
zZFyB((~eg?JsqFJ*|?c6EB2EjIoHOxU@#i_U&5A`@G(}_8~-uX+~k+RV|?bw^VfrI
zON*lxaLc$av}8$yg*9`99d-DIZ_r?2pS9B<unZyI_6xd6@H;mCOpXZ4_nq*sWLdP}
zpxKsKvazR+D+R>BfAiiIf%^*(_<ir|`T&WdkKoJW-9`9Jj!gt;QbCDP39EapKp_=S
z=>zU;cnKw3$7X}s-sfr~JNLbIvjJv24>lEoUi5UbqZcQ<b|7Wj*?xrrSOvpbJ93)z
zOXgmrB?`0UA`-6+ZfbLLY$;8-#c_&zkJlgnV2TN=Sgu;Ol7ss70k7PmPD>W|(;uHP
zBc689|5sXBaYlySDCnU{SshGmQa&-8Lr{14Gaj5kEzm3#hWLl?<?()4&KStrk}vke
zv_3RmlDVv!EqV?Hz2@zyS}ITH<KwBrSRA-9Bwmyao3&bogx#I)*1D4PIdKK8reEz^
zsZ<?gOxo}`#g3n?9XkY@WB4cN!+8~qmVy9wXO(u=wL%(i<C|*L*^Nqx)t0*=eBfz$
zg2BuNZB73=sM*-Oy2e+S3CE{G1ihC5y60tVSAP^89EP!44DO@c`;FD1ff_;^P4`#l
zxIT<Ml9m8_4EX3pXYq0^rJ^>bQ+5+=S_rB&!(~)CaNCKZL*Rf|dw{LG!h7#O>QF>T
zMm{p>SbKe465x@*e}8iK5d_NlU{bA>l7L4F2AgNQqi^s%b3m$3??(%Ut~J#wuX#&V
z@<sH;7uvL?P%#IsMH;>N1v|i3W3l?C9(E@k8<X-<nDC2kVdSr_J2`82_7NQK8Qq6o
zo@z-@D4?5py&5y~YNpaR$!Ycz*DJVE6dzhS+MHP%3}Ei{=r1X?28V)=dA-|^QJuZG
z*_)hI`(!D2kk&-2bAAk(m^;$uPv$asQIHYe@8;^pa+~RkCpJri7<r;QlAW7WB1Zjd
zL1h&cYoKce&{!!5>kepuw>6rK9@<lLY;~!dlA2mlT>LZT_rdQiN7DPkS!<o`Ad03k
zh}F-PwF%(I>-{vydUeTBz&TBEOd}5haim8##J6)D@$y-17ye~W1K-6Rw^_SDZIR62
zA&bomziqJ#J*{w+J*jX?V4Pn=S{~ZkBif2)8MNN?MyH=p;I~{|6F1lKF`-fz{h<JX
z=)ZARkkjh>@ib@h;1jIaGyk;LPCo?p_POF_5rNmk<r}+p_GK{dtgQ};jp(-2zq@Y*
z*Z>%*qiaSPIrfW8?ZV`3_dMV@yTDvm%Z=G`cYw(azWDK!dcv9K6ZtCpxj1r>IBx4B
ziU2@m$qO*83|CZSX@#$mO;!zDvExQo6eGfJS@qCX-Vqbq{}hp2@qK+aD>HL!<BXl1
zU3LgbotZgVP<$>L^k2RJx@k>V7~et)-fsVVB1$JoE>j6_dS+0|<nk%t+U$IP>Ai|W
zXibukb}iPpLe^5STbMz^Ab5t}rs1Y{L3bkPl^c^n19g{>W0Bk;7%kA!2(Mv!cNiw6
zo>Pe8)?FmGBZh~_4w?))aTElW+B(0ic2uG;8R?J@SXAb^?#CAQ&d^`)=&+vnuOc3Q
zTFZ*#GB#vTHU+)<*>D-8wGAC;_zr13vZm2bn~sQ+^hg!B$QJayPfVi<scMg=*H^#>
zbk?rRd6>ZqKC)wf)=!$Pr%g_$jWJ(Ef2WmEW>4eC9{p39d{wAECFrZWOMscn{-IFj
z+lue+V)z2acB(HBH#3j9?)33!Yr(DzZIiv4VY^l-Ny%jh<V8mkb<PfWZv{QTn%4Ed
z0bmJA4Rf3HVw%uFvn$T2_n<{g8hxy|Ozhq|*p%jznXjn1M5l}f+f<TEu%Zgmt7I%^
zdgV)n=&`!d30dtHQHfvPK&zfggLc^qH9}G8R~ujj+;_%)j3+kmtlZV11wtDp$}HsS
z>D{IoJIsfRE#oNy5NBH72c#Y)Z^`Jzr}CtoMGnl-s`n0aNm*q^t}#D;l;}1(q}GZS
z7gAg4415LuM>Wd8i26TB6QuO%&($rt{O-ehep8B20*+s5N@gEX_r-eMZ@H=gu3d5?
zV7kPZJ&}AvCtA!pSE5?PzOlV5kKqF?_66v$Kj^l+w#Mpb`YO^4za6=$y^*ymQ6=~g
zH$-0c;bI@3y8mN1z`%VtWytu)-#JV!qyMK2bYFamrhg-$0(ksGYRu6^{`!-bIstFa
zj|Gq(0G$>INk{;~=p3bx-|g+~-<r?G$UQ*Bkr)1IpIu?0so7$RC0_Cp=!5WbdnR@t
zU0%-g40*)zKlJ@P9Fy)Jm0GiAC(bHild@b-(qat5W6|Ggy;SXR3@MFxWmhuueOt;d
z%U@9B%b_p*#@+nd(aMTW3^y4==_DRf_BF<pn~SXw7@(S59k?-A_RAXbGQ~*)2L25;
zbEUwlyoKUMNSMg$w*LrjE>;_P$*b_0jhPW^Emzzly`&4yzSx*c{qXEY@AuxRKER3m
ziD>c3K->8(7RAH-eJAOH$0Y}VJfDdC!+grYW4t(7GH?Wbu)Kqia_ofnu`eB?Dd<AZ
zkoq@VVU33kY?6o|yHV;^M?J_Ph41E9vp3uIjC!9_-EMI`Y`#WBlm2@3=S8symb$(s
z@M7&=B3ty4{{4G1;K?DqYx$X)`o_H{FDS&2QVNxPAm+LxuUloV_Uk??IHU}Zb3V7_
zs<#t2bA5_VT|Yu7@}0N1x@PW2jD5mzS%0U~$`^8PfbzU6Kg5iFVqIqG`IzCExn3Yw
zr@Q~!%CqW7Q*U`mF@5Cj-ss{swbq?GGjo1-=YizWG3Gg)-Tqn@5^<ojRUSchKaqu+
zy`*5qnA!cgIPZgBU&4Z*s&eBxA%jMkdKC6$gA&y9{wSr{eR{C4_~+nYR!QBeO_71<
z9)W~_|8tvBr8jQ9&0M^yrJ9%%W1DVic{T^w>G~AQVf^~)l4k_`t<=CtAnHCt!oPA~
zC&#%v$DkWA?qv+ZK-_5xEoz5>$DCxt*9pPSDe;r+1Qb^apNN5mg(WJ3<#G&9wT}3R
zliw3w1k-J|i6-aPcS{<FO|12H7GrkfsvUa^0{Osc1pe<Mjc|U3#N#gz&M8RthtI8%
zb5tr_WNgvCrCH)BK>#IQe%cK!gyl<?-VH}28kmSD11)Cb;^N=~g+)lzID!6@=CyKD
zp_!?rS4{B)$xk>T)#~x;at<nGrKNx$cjB$^yIhFz!Un#7<zkz~kYSuq2r|>4BY#zc
zBlHWS(M3^-0WgpDJ{4>713jq<OPdP>`A7oPIBMJ&Z>bZXX>QR+`%-itH>J)tvh~5S
z#!F+ONIAl0`87f-%~zq?5ZN#^DtOS}*(0{*tsFwW><6Z=%xUPu92F9Mg5e{lU#A%j
zzCE_k6>D|#?(Xv<HOXv~`={>hmWoK@9V53_%y~IL+kWhaCo&Vf@;F+)I)=95c|gLj
zDJu-xbxc?<A8<h1XOyD}y;%_j3QLuSoq&aWlGeK`WGK<$K?BIjZ>1d*;RywK*2Pcn
zdP}*Csi3VnpcEPT3MM+{pzLv#W9&<$huZ42@4V<CVh{<WQrU)}wkr}F)TWuU=yp^-
zp9fo0gM&>+vG8MRT9o!|#z(yU9a@u^^fFc+9CkePJ}s!yz6gJI)f>c~Zf;n+)Kr<8
zMk^=UK-teAUK(*(T$||M&iSd&<wcmFj`AhXI)IDqR!f=}bKQ|Ex|8c*zWZ$_oz`zx
zpa~Dq6oEnjY-MZ9uxekB%8f*anX9bj{3{!ka7M$lsI^v5@cDNnIq#x@6d^+J{fVd*
zdph`1@`jf7xp7-#Hw&%R-5t{44`u^E5RiX>op}1XpKzcU-WY7gF1TSH7M4{UI}~BA
zM=t6f3@T*Xfn7C)#6U(%e+25frNYWf%S$v|%Q-YMDH7VTm~L-m7*5{yTXwE^Z%RF2
zawRoPzbiSRy}v8}jtH{i-kHu_9l%&}OHlp1<fd%9QcLbJJ2gmGfmxYxuUDxAS(aZa
z*y-puV+A~{b?dCo05|J&F2}-xf?+@-QCJ9cB;<ZNJ<0j!VV$@#1SN1iPFLBm^NnDA
zT~|dtSV!=53c%0f<KquB_<sCVR@qewC+=hWb8pv=9SmHuZ7zivJ{*1<Y>K9b2VP|4
z=DhXxKlEZ7-5+RxA0ruUJFmw(5M}&#SC@9@bjNNaclR#F$VSK0-9?q$kLhh*B{c}g
zPQlk#z<vqk$E2MgxY!96HOQon-mYZcHxSM!#l0H`5+=FgC!4QT`!`5!x4*L|%PJm|
z)#*w{6CV~MPdVwoCf6zNh5jUlCd9{suNieT)u@3sFzV{+a`Fv(`*{Qr7F(&5tM#Hg
zVU}N`W(67F>~Wr}@?v5<4UiX-!FX3h-<VQe_vW4V<UD($<*^u|D&S1BgP3k9uBg*(
zf8Sl`iC1yUi@v3w6;qUZ54ia=N<Vzv*=#o}N3Nffb+JnUGHwp(ex911xkSuNxH71m
zy5m1YMWANt@>mU_{#*%~2gzhI*2{xpokl9*auX59f&Z<yvkq$O{r5aArMMI=UP^%i
z#oa<1tT+@al2F`=yHkq0Q=nKWUZBNYi%W2K3lKEH^`7tD``g*Mv$MN%=g$6>Niyd-
z{+##u$ouu>OSkuSo6l8X;&@Kr^AKBd8oy(n=pR<;<Seq^^_S<AMCd>1^w^MThC^}Y
z9?VKj)E+W-PJ5|C%kGlW(}q{P2mhLlt^+bAEBZaLrF_S;jn33BWtr%Y(4Kom&np>9
z{`rHG#N150H!K@fDb}<uliO*99rtrlcbaUf>|^()aas*x$^o_a{Aig|G}zb!J0G4f
z=LYNVzd~*)0*=}W8jpgKuzOrJIUh_N9X-a6x@-5UeEjK&nwKlZML&i6m%WVEDM$%d
zFqT%*4*0|TsJ&cr4LtjVGHo*3VJ-aE5JI*7Sondg>nA*G6zn^rsePJZDnP;^!h$2?
z%5K1e0eD)4SY>w^`9`!rz`Ma@v4_u|Jp;rPe$d@<kpVEp320@!Gx@&4b-3uZ8Na?U
zH7N7E#r@+#IlE+2%;8F$h7%H}{3E3z*DN1E_we42kP{$ca4s<XAF^hjCimSqjOtYq
zv)S)Y=p%|Kp!fb4n{wqp3a8oHi_gk(Hin><93XEdrM?gpB*zrYGh`x<d=$|C7ut`b
zJ>cl<r$H{uZ*7?6=v=|(vS={;<>3UVk_>uAJEa74xdRoHtc3Zoh=gxsIusQu9D>o>
zH64ne+3o9wI*)8Bh9ETzwd?vAH4$v6y>47vl+_~_^I1v8`KG42;^Rj)ZOPnTK+gB@
z(9gt8+EnK++k7(|cfoD>@;uf2B<VvXt-cqTFBTCS;Cul#V{~3a(RmvquS5PC5}vy`
zI9RrER<`3!Ce-KM(a;zaE-7<4fD1i&bcB=$j%^PChQ;W({qe0thop4ph5juh1gbo!
zn(F9WAGvb<I@g84IW<>j!V;sjkOCUE)X~vlbevC0HPBMx#dO(Va${*gzy3n%(2lj0
z57*b`f^(xz{QUp|JMW+Im3NosyMZOfT5Mz0BQGQrh{#q3fbSi-4~FQZN%~JRQERt*
zJdj0N8eqfb3Df<LJ@xLpagvcPy{AxU3;>IZIXv)Ey=Qrqd5uo+=(>t^tDZQW;^bs?
zvF})T)UnoO;^#Zb3-perZyUHPLDJao^amXcssf;TyyUCH*Y~P7?=wuG(1Ircn-d8L
zOn$wgjDq2HCi;Dvm%HXkzCx@#@^9ybXj*@iW54?6$2~Q6gq5{dN!-}aj+|})(u$U}
zI@}YNXpulN!I~1^+DlV70%dy@u!E?>9fV>^_LFme?6EzN<=~rPS3CF)SAS4`(Dshk
zSLGsWUM+d*=ep*sCZycrz*_K750to#rLx2Qp4%h@KmM{aShEq|9wOJ9_0y|*Dw$KA
z+}RYof=@{czdcH_XOwvFN$+#r9vnAmex?Xf^(-x{%6KDI*J8Vj<b0Bt`LF`*EZJ+*
zw{m}zJ7L#LVn~JN1SWUOWYl%E3$CKt^d-|3BSEHk%#gkc+RqYo95Fmko%XUM?)=6`
za&0%X&+V)g7aPqGO7U>raYX{BXAw9uenV>qF*S^TA_0Lm1Y?`TsL<5QkJ{{JCDXZn
zl!vMQ$`UfS9FO^$crb;{wl)33%G*<F#&BmsQ|J3B&znoz`(JxnK3H+Q8a>DHnLg$U
zn%eFcQw+3)gaz5ln~KPlY$Cdq0kf-zg{Gqb=8*@&RhU^qkc262QCL_+pq|>hxOMP5
zH3vmVk?Z|_opq*`ei^Nu;}l!D_8)6nSIzG5ycjS>UDyv{w7Iyr#k>1YOmRUBWa29o
z{`{$f67-xKncj!}5;N#+x^`FAS6k>pTLRuX{W!$*&j}aT>Q+^`Vw0M@V<|?1h;-j|
z`fhYAG!0AaA7uDnz+LSly<Y{#5Ukxi)?VI6wPD>)H9Rbiy!v^3ForEeybm!qAkZU2
z2)&%l5pSVnzF9w*nlKc&8Ntn6RwGsA1eu<xc6q_(8|?4+B{SHVK@@_xNDCD@zgLVw
zeF-r%$*#C=AFc%A_WR@SRB3x*2P_SL;Ko$SSPV+jTT}7jw%cWywCm<3FNi5W*6j-H
zhBCFVLH%SIa}nRTGrQOyd~(gho`!OfCatmCt0R8xVF<z9j|5D%I>Q)@I$9b-M{W=N
zKvGzV{{Ab?9j%84^9?t6>D0azA1HV;UHP1(>sEE0Z#-kgvY<|V>Hf~S{ujYQsAQdA
z9Wh(Sii2>Xh(VoujmiC?@wVu}EhLjRZJ^fz1xU$<kwr;+zobuk=E??+XK8QoW;*_x
zunS%~@-AUqt)jWYBYi=u!xRE-;T&^4jIg?o=@ES_K^+TA;Y4Iq-Sp-a<A66S*6GP>
zo(t#X<x9Wd|82d?_hNP`KtsDAr4VhE_BZ!C(~GR-0*)Izequ-A>#Sk#nvE1r)tFS>
zr_tPFTaGSE=@?f$Cz!l8f>|+z8={>9(r?4m_7~;j?p0gA6LmhT_c6B}U<u-~qga0L
zCc2fML=^MeioUc5IANg{l%vfpe%k9A!TX1ah&l2*7X7sF*9t`@2j(wWm+$a09oMG^
zJk#uKL@(~7Q8mBUBoZz1x5GZuDq(2$Z>|$0AX(%NZr8y#0n35k(A{yvPwzY0>Lng$
zlo+VXT(7Rir^Yb&HlAGw-MXs|DPl1EJa!!7&>dVIA#-YeI<rM4NXtLPXEgy6vT-P{
z{S0+h*0GImX?AEEzAb9OB(SATsauQe3+imvXJ>vm?E{#({tv#^4XWeFe)c44)6HE9
zf0~<anTw-ZPCCiaZI#pf^`FDhu^<=<*Q$6tRSiX38q%0q9F)@9=(#ydlBG<-$jR#C
zb50Lzf{MB8{WhE5^|fb;;Z)YRE!n7y)5B?|LCA5LX#L)8mD5RxRH~iia8j|jq!tM1
zt?uq5Qa7dO!#h2VylHx!6;GS3-)K-$QK~a;J1|xUAB2(vVGGgFQhnr=v?B&7huL#5
zR;opjT(X_!t3DVkl>|(|^x)-ewqn93MxS}Mn~&n!3=WQZ$=5de7WNxiQ$>pLaOeS@
z94@ZHrBBthe`_s%BEk^ZBk}l*>&{P%!|1_NK6}}XP1Vh>vvp&a1MKsLX&Bu*eR0X1
zS4IUZ^M={*lku;-^R(1EzQGEUP~xR~ca6JM{^+VgcFE?6fGPJu`f^`wS1?v@yI6A*
zel}5SjlW0X?Swz`{Y@`r8m#)6ove6P{KB!7ACeFAFvWl^j8#FRVW;ZqqOoF`zafud
zr9}VZMCi>(TLE^WE8lfxy@e#pR0Fro9}{-<CO*XnpzXu$kWQl4mKEp9Ei0C%(3FLm
zEZa3va!F#m7vNiWRrUTV_0&3IFPoI`HMo;)baC?nNxlBciCg<Hs_NpraI5~VHTyEy
z-(5W4rRzVAx&eGIGUy5egDG4Y-jXt5Hdy8Ctgx)@a-R6|3x?rve$?xTUNcfAlot2+
zuM+d}xWVOS)?MYqwtfzx$iLzrPFFk5&#vqweHu?cw7VBJUVc;$A}Y`Q$Rfs~sAq*M
zE}u$vkXdoxVx%GasI^&$rkezS?9fj}WjmT6eztz~1KjI~z!5AU$&;3g35Xa8Ta@>@
z?iEG`WTDX)VYczYpL&b6B<;KZdDe)PM0?Y-P^|QG?B8C^4=@(q&M^U!!SNM^sn&tZ
z5k7Z%&NIY!?ev1??S-@KJ(M-#x>UEiAoOU3yCiMAOA#(0`7jvQ^F8$@Bnc0Xx|*ft
zGP-L@fa}Uy$>W-Q{WdjijtlqnKv|)c99QW84+m<N{5O7GYbb`K(#}K*;vy166q7dd
z7G8K`0wpzru6QpMsb(`j*2~9kBp1_84$0It&|f$*wp*@uLc+sstJaSSD0qS#UYQ%~
z%J!>l&poNQyz4uXJWDWzC((m#=5*$Zyst^;Dx5{GdyFH9z~TFi(U4}Vhuu;g)mw1`
z508<k9Sh`u>Ld1Ek#{XdM&+nXswVDYxG}C3c(Wg7T%Ph>nnGB>Zdg^KnO#D)W3yXA
z)Fs4v38psOr1RR!8XD)&qV_KAR#!pkv$|GG22w1ZklupVMcZpAeMWTYGe=NR{6IvI
zv9k>*lv_lHe#PS*3HS-e{sN+9vF+Z>ivd8baoL$|CHvtxQ|l7kHrVEUO%?j=sUOB?
zhyNa!o{UzcZE0RhT<c#QZ>?W-(}RXfkCmfrmTTGo_UIpShSrpU6{@s-gg0!9bV+Zq
zE)gIMUi>a&J*|=orIU9}zpN#BMOS|+>nhgG^;p3YKr*X$E*2qk%06^g6=oZf-AP}?
zLAKTk8k>=!6fm2^QvOn}KPyjDNI76ieh?(!W#O5?At*FiM`XrQm}*-1hC@Wr6e>!O
z3uFF#MGPzDW44We<zh3?n84oI8qx_<`Wx9dd$wh{`3NXadi0j;)8dO&`QXQl4oUbd
zb0ZOTH(3MWDv9Ogfqx}ADYB_o!|;@ql%xNOZ!Hyj8d~K~{4Fedaq{-_)s-(Z*V;~Z
zvw7=CBU?t!ljudM(7G*&8zC+2D^|23#W%NE@8y-Q?`B<ko2w#c5Ia=V{8!Q}d6xv?
zR>xGS5~zxi@Fbq6PY*RD0+*&*ygd_Csxp>t_V#DgMXv=5IOcIzEbU{t+%C98iQP6&
zY>c;8oKB?~A2IwiL-|2x+@3t-TX0SSCQw6x0G(S@_EEguX=gnX9fpkfmwf-yu<55}
zEzt(J2!^&%F;L{vUxfG}pOgUl*<2KB!LD6;0mA4pq3-xeBIQA2(<ojpF7y>>D3O0=
zBWb3C>^RIoPqQ+hfD-&Xy&&ANu0kjyKdn}f$ptjb9h7U8o>FLdea2fjxbEvLMxI@x
z-Ym*%yLq@m(mQ-_ihKfRh-Bg7NEhgw=?^j$50j`z{pg}_&Pe_oS5Tag`4-Cv7!(`g
zrZeX+to=pfHV?FdR5MzWncyED#bc<h&iSoY_*q;$8^(Io2IkaI^8u;1=~#srA&qD3
z+s3@Uv!5NE*Zd*QR#qwd3AxhHIclsiH)VJ7p4sDDEH6#R1?V%BAw=cHNBhc?o$84!
z&eP?T2QSB*aS`7@HyK*I3p~zc!esizV=)|D#h0;#*tr6SLl5D}Zd5bO+&?y^?S&w?
zdYfw^tUs=P2PdYG`-u$o&KVT$D6gN%iQuU8A5Jz`XwGZN!Aw2`O^n*#+hh1ITR`1z
ztMzYEhDBasFN`h({;;wd7{d>Z6mRsd{Vh<iym)K7z|murPL^G;TapzRqI}atwnvNW
zoJpiG*~7CQi_FHxNWGVv{m~!RqAaU<bzG~GP4CRsGFM=K()KdZ$p0#pbMvF${cc@Q
zT%Zg1wJ%qyk;#0~=dUbo8Alu1ehc}R^sQyCeXwZ;Hk%at6dSXfIr)W>2T+Q&M>eU_
z_LP8$pVzIRPzCp1)D%k>MU;!?y%x31Guh!#UZzU71Ix0;C_iUE)$e{s_#guFe8#>g
zbUC-h%Fiop8Wip{)#im`J;`lKgwUkoRqFYg6MSk4^C3_DDq~jprZE#eT0JVA*7xLX
zIqroR`E{Qe&kt#5sxJvYSz_e5LY=>8!Bm|YF}-_R3O-9_A~&Qd;=d^w3YhiJOn@NS
z%BLCb+0E9C8PZoL;;2KE&>%cEi$A)~Ps<}x5WQK%<iQdI>-{j?P(FV!`$5lb8_s5L
z7n2L$@%y1}Lnv2GKW@4+pIMNhW1lJV$uZ=+!|B1I4`Yg)%NuG~p{JqNyH#$}VZpna
z!I`LQ7jw{BMxzfEU4z+sF-QbaCs{_s2SHA{vtg7$hyz}R8)fBZ?KrIyf?_1AWqU~)
zf_|I6_vts-!4m1uBfRF~wp#rhjTU9mzY$l9f@e;Dj)0ta0ok4_NXV+Qkx4!mmrdCR
zdJOB#p*;QJYv{e>Z<%fAvK=gvtB9{n^KD9DiL?l#j{FH1ziy3tgvNm(H*(WfO4fj~
zL9#NnC&rxoaCWbBoz-%-L?l~3o2&J{4rAN76!Vujw1Ts{>gQP=u|^VRB{n{~-^poZ
zH!D|BLZ7FHbZ7(aSFib)1sai^uawuX6eH5P?ewh~kHWBrAF8B{oYv28v(|X3svJ3%
z73g<j%33dwr0sH1zDH?PtMj5t*Mn=Bg1O@&guh<7q}7kg9MCF1^=a~Mzu|;KuxUE$
zzT-U*Qs?l+sN$tN4;I}lp3M{1Oa7*1R}IhNXGUfX7zIqgB`ff2igycl{O^I05A#M`
z(bS|S?bc4d*7))F*2AxHB@n;AKMk}XX<YNL^woK!Cg36r_yzyQbOP*!10>=QfCth3
z7X!>9sqr9J+yQebozBhMD$tL*I-S_C6>Dc62i*^omi}Bv0Wg1+K6}eHBxXPeMgzey
z9qFt6#hXt1J3|&heCr{`N=(G#B}G^KG-6LyW%bHY6socUW3I5*jbIM>GmJDg=N|EQ
zZ$!TBpf&HTa~JJ+OsX7x5?fTvu6KV8y<q<qb(8CREqCj{BXv~-QIF#g`pu`_I1<@@
zmXWAa0Rg!?sKep<791@}5GNWx6RAnt<hg-CEad~dO<fFOC?=XMuq&?byeu}pzuwJB
zmLxckFp)cLEMEGhRW1x>w*)(C`VSAUIW;_nER5v7J0I`87$*%P%0=v`Wp<U``{cSk
zHi}RjbJ0TKK5myIXdqCd*wp26k`^Q=cpO0#)7RO(^zOs`_K&JV1C=#hy*+Kewy~?&
zk#6w~U9snm*bLI6E~}<67D@YtWF3)K5ifFcO=Pn79R0F11KROD|1ZS&b0;cX%BAb_
z$2r@7%R(^~nWHIvI^rx~Vs;ZS*i^HJ3TSS_)<o`C1BX4IS!$E??xV_jkrq*|SG>ha
zlj4>m#`cVCX+&UQ*-U0UA*$BBRg1RMve75`M?8+-#*VR87;PWwY&JfTLqCzB?Y-@~
zwzTXgEcRjwcp5hDoKbsYdR(*Of6cJnQ`_HmyJ+t_=^`W%ftBt<?pl6PT=Debw;0c7
z=tAWj?<I%Dfx)58D^kjx@CH%_X>G4iNFQl71SMpEIxicQg&IuSS9q6SB5aQ44cuta
zKm?Z_XhrNakS4c-Og;RM&9+kC_F)oRj57`9c1!z6dhub6y?2F|Ud#o|J=fj2<x%5D
zL_Fij+Y(<@Q?|j~{X$jKbCB(`J+vGQ5Chs?;G5mcc<KsMJcgk68b{&-i65zwE<)6O
z7-C<WTFZ46cT{1gk4xOl7}}K%DG!dy@XNhu_a;ZHw)%K?j7I;48MT+rBPrpRk)iY4
zwP!DJ4Odo_4F*+F56Uf-SdC7orj{s}%FTCV;~2#W>B^lIV-Z1{#Ml&l3nAjCtoB%V
z@lyF?-78j?ciFOJF(sZM+CQp;HVt|{WWSVN6+Ri=QqXt!?(w>IpM1u;oy)&;NJ{|@
zk{=?{rCgQ3MVrr2C0vyt5+RJ;IsRm%2AemOtF<^Dx5#`M!cU>yB8uko_jrjuhX5Ne
zu5wZL2J9wR4(W0Zv-XIDgX~2pp*NLis~cZ7fG{W8`P*{zw_Qw${k*)qdrde2gxJ?>
zYv}FVcwMWFJM<K3O61hk-at8#d?NGO9A*)SrlJco;7e?{CR=oPxNfCsKafXJQdS1I
zx`?KiMMbTW#MbXp>igvP8_r}-DwJ{Ul<M+dZ)HR?EuA-;196DMgCf@ZVSFIpDqTy*
zsBQ3Gg9seP@25gilJpJ*b-q{Pphaho&YqAi9JIFr&P|^Np{fJ15MATJ>@Vb*%=Snt
zV=Ap8=dbG4l;LS|C#LgqT{JWxCola@lQyUIJqcqQ=(+$II}f}|2u9%^@6OxY+QX~`
zJp68E=^(z>DvJqm6?Z5d+eb%buC9bB{UcctO)k6R0K6Jt9ukAUXJ*<!(chXq7L(+<
z6AN8;!eWrl@;V8eY*inRugoYk6xy9w4tqK7ZSxp(bsK@GqkwLawYJ<Tww>l@d-;;-
z^Tt;Go*2>8jpt`)^?JK^@s%aZL;pkodivQ=8vcc)X+La9a5i1P(a%nAJ>I@CzYNEc
znmqpylSj+0)*P5y@Ri?nmhWh`xw6FAJ~tf%=DYZJv<g?}*^Qv{v&gS`jZey33tiH5
znGuT=t@o&h5yl`a8rjbv$IoVkKPB3d4F_s#%Se6{1n>v%fwSXS<5MGIt*jTkwxqeX
zcXmFaBp<!S|KptPc6w%VfrDklYftBWaI&@8Q>SQ8=V`hPH|w?-R~<@sZ<z@BItX6i
zC&tCkxP~pZu!uWPJsc=;#+XD5Zk#;1K5u0V72N{ZhCkjnU|5Zp!$hOQ4jSO=J@<k>
z`DaYb1hm(%NYF`5_gF>Bk{YUYv~i9Kn2MYIUECH&L>R$^hoa|QzuQM0B_Ts<AWLmh
z^FjQ5r6f)r7R##3%Psa)<8!Y4TjK>CN%7Cr)6A&L4sWy6wEPulWNZ0EnSW^|<wj6}
zTL|*kV`ame8d9}}GX;z{>>w{z=yUJ$QFlM91^An$?~rLdva-_Aq@5rl&Qu#KE8Wa!
zG|g~c%b6J-j_q62%Y<x?O}`Dlr6zAjV@1236R~q^&X-s21kg91B}+n?>TcC(Lodc-
zAMRweuLjdN-#7gBy^!!rOflb*nv6(r$2%ZBvES*ywYk<Sp=~Ib5P$WnKcfn+!T+;%
zet7z+6D`$~>CB-C1uyrB=7aHf>}~Yph`}NWn}SQdQiIPSDSSceMa@F21gV2$JM(Th
z_|=J^M%6k(8$$<kf3ROa`nXBn#;NzI4FjA1lTay3j54DcEB3d_h-94l)biK*eW@R7
z3HQx(E_YP)JTdd8rxmT_PmN_|Weqs%kWNL0^m`&6<(}}v6nVLdHjekAu2SP=dA5;<
zWy>^e_q8u}C-WD9j;>QIb<_Oqy>CLq?1p7&7N#aS9ye^M%t7zD@C7&24E~g@5YNrh
zW&|d2zL77akxV@#75tT0+>`nSHaZ_L;G3*r^#h9|qYOVPH1uhJ5f%gf$=6lMmoTq*
zfH(E&r3V;G$8>GIz=tK%6|R5->jZzeDpQ6_ic%zYRylI>x)Gjf4lPlnZfqCJu|hK=
zRrnEnRmJ0V=rQGHjC;GlvkkI%#%}-K`H`NU4rlxC+q}q>)>hY3kIDh?K^c3rs}42X
z?62`jFfN6YlT-CC^rP&oEV^u1g;$FZEBPtqS9o}h-OeaqhuOO+l9$IG&45iF2}xp!
z_N3MPl7<Cpt$wqaui;RUCaAIJksBdlFB3e|XSv>9j)Z{009|nj;6UO$|Diu!eru~h
z-dhyU8A|kW|JG(8m|K1?c<bxa!=^I@^6~m#pj>!*CNv|&6?d%7#i26tBV-Oa1lNr!
zZ=g%n+=-Z}oSO$`+Gh84?XH_$6*{rgz(+GN?wz7V8Kn(zfC~m7f9j8G>bA;Qj$Be-
zOS~l)5^A@37B6r1vbTLMvN=ll@r)Y%^63t>E*+?mYh>Twa>D*k=72cgb+*!TYf{ki
zk>vuHTRE4A22|!zx}J^>TC!5u8@m|)ULc^+>G=G&i`xtm+q9-mr4KN*Q^^!%N>->j
zVkri?@kev_4m2#ohIpZ^gI%hSio<j(D=R+pp&}=NaK)ABV8gps$&KQTq7>uKHTUBQ
z!}FW_>ZYg5g9lH7i2gXMS!6Qk#}tMT)Un;C512l*Y<zS>h#WrE+`UkY=_^5`W)vPF
zxc$1q*dJ`5*Z83(`>2EBF5V;1a&F+P??xt@Z(cG;{Q2GN(9A-JDqRt)N|(9KBj6c(
zM4LZjw>PrU1b-?>(%jNuYu%R1Znwo9MD)@DYlR90|4?DkcBrCxFAH<e`g7M#AF7(!
z<m7hIye#+_99D1k-n~D%MThSvOoh&8zPhcg#@b^Wps}JFdyynO8JKfU&^u7GY1qQ(
zj%IMdWB!`*Ry6RF@|AnngS~D^Ar*(=h_+PqzeV<t;SQ-(PKY@y>i`aCA=P$lxM9;l
z%XvM}-(Rd}LsfIMacqjJj4Wtb#A5|NId46*uj3Fab3kmoVGbf1_z54svgL|C65<oR
zSN_6}I4M5D47HuesQ0OF*+YC>72ZRrCi;D(Ni1F*?h`nB;4$}~y<>$+)qxU-!B}~5
zgIkriQJd75DR_H4k^-N0mE50=y}vWJ!RbYyodxDC)I+>kC=ws>?Yk4C*Ipc6y3zgx
z+~(^G>{_Ey{@y8ab!5qYM+Hx=0aX;j2665*|I!jIC)0bow0+DD9|LWdu$=Ae7xwes
zjFtD$071>>hnTh-ol-Q{GMm>qrhH(&x;5vJEV@4~{_WF7(VofrI;wBTFZSmq78Y)R
zI$5CKK+}6aD<k8dn&akX@o4=o*PqPH^7HaEwyZZ=^_}a&-3x3p^n^|eLuchH_8yUg
zb4O=q>-F?E^}TO&CrY1JaB7Q#v7Xi8S?15WHM)KhyBm)dd06=~*i%*LKb5ckk>J@!
zH>^xY<T^hWdPGqxSfpSH9u@DB)?)kRsM=g%uwna=&B#H#E8UKOn>rR_G_5)7b6Ko0
z9{V}gPXmAIizTQ~Sj8@Z5a6JB_r(}sdK{U`_da+5E<OniLGi84H?LL44FJ&B`x93W
zX@-g0X)cD}gjkhPdNr2>y{<+Ui8$B;|H!}gnYdCtoFY2};3)d#8Esz5t&fCdZYZ6W
z8A74D&>ITP0_PU>cxrf5PzhMSB9APE#&RXeN8#WN*(}9{2bbsjEfIVtb^Vyu`Rh%S
zd>VnUmgd^%x4a`!r-R*i8+MT9?Dj%$utJ^8;ff^Z!OVw-NDH!Nrs7MTqAE7q{PBWn
z+u9UBAe_BG?9KBG(pzkAli9`o*%$tNZxO@B0^H`g?1mKuFI$x_?o|+eKI<gYV@1Y6
zyw!ng4zHuX+E<gR4NoUK;z`J2>_&x)^VZ&d(uYo!>Etl|Q<$JvW382Ej0SS*a}Bsq
zS><*Z<3bPT=W(+7uyc!6g_AqP_nS1I=@p#d_hcc~Ghx5`UZ%5!H9h>r`-``(7o!cT
z#C*~zPpOty=W*0*Gc8}|tb=n=Nyr7Q>hdr1E&z-X<V2ez%WX%Hllx4BkbdF5<Hsrx
zK}@hYx?jonh@l;CCjUCJS9g}+!bPp+esgZy7?O#JMlYgp5F66MxeZbBpHYORj%{%J
z3;Ap5=zpE3O#keY_g3x9>&$3#I9dX-?|rtHZxy_`x!KtXR=#+wzXgY9O9BmYV}GnB
z3eF(7NmVs9Wg}N-Ib0OobvtQ?qpj2U-8Xx+<r^pjJ;rGl`df4@pMB_x7MjneQ9?qr
z{lDCJ*T-v&K?ay;wMNgGK_EZW_AvceclaZPTzbG8{;Sb9fKqlbS*%f9T)e!z{7vvF
z2n@U;UcUGb73x&Mn}~viI6eYFyr=9g8_6qw9+-H$ob8G^DuP?j^Pn{~Eha`&_AS*C
zA>pyHhJTE^V`#+ylUZzr%P%xVADTgT%I|G7IAzogd^2i&;hDpqwmhjeMcXmUUKr`P
zl&mz8^a|otZatg(+LuFMcKg(~2IWSe9Jc4Qa<4JdTfq8$4mm<H_(9}GDQG6ZFpKmV
z_z3}{V772=rN(&H%HibtwN6QJaoO6xbR`SBKWU=tA+F)Wl|Otc=L`swVvUWBSuNH(
z4i7$^{$WV}oU-|i$?<aUT<}%J1|jFZ$;?}ShSTz8Imzb0xS&q=ZyDQdEI+>$fUlZ{
zA}@Z0Wt3Tt8YUpq+^=qO=*H$8n^NzpFXr=fWc&?Q%#XxecOP6?+m0K5aO>Nx8vQtZ
z!~}@HQCWW}(Ff1Zo11BdwvG?J>CRV9Eu9oPg31rbQnNAw|069g<^2rmJYt`R8NFfE
z)PL83>=@}W-)bhc8-6PY+^!OnO*1>6b$CDH)2A@B`|jt>aowm=H&ym($_kP{)6xk6
zEIN0BFwH8H*z3#={Agx|Rbq*ZS3s5q2mW7Xez(LLzzU1+RjIDYvbv&Ct=5`@R#|y`
zGAKi;Pd)^<EI-|ah8H+#+tzM=9&laz?`HW`yxnr*s{YPEDz_!Z)D67<8)QLEV6Dr{
zp@(fL#1=+#PG8Dx3rF8JwO}6R4@NpeX3aGnMq;LVL+p0!bw#j5Xn^1WeubTFO)=}Q
z5BL|mX+{UQDTk`x7Uv;KSh*AbE(C!9zvxDC&veZzuRpTURK*pPAZ@U>q3THl<wolW
z^-_~F=8Sm(xRws_Y0)6O2oGDP?^n8<7?}26ANh+yMAVIdIglmDL57^uZoqw9*S-Ab
z@tZfVlEor-IwujmoLjRORWl6IyBG@pQ=V-;`vCNRcNQ3}(dD(?Y-z*hk_kQuH>N}v
z73v(CxjW8OEQV~)SCbYPe2xF(T~ug%*ji5`q$;6svS;A(LpM83S+R|_$fjjLnya9&
zFf}RZRqD*aH}n@laYI8xdqZ$pWR>g6tFgs-_vz(GlK#J17hjQAx6@_%8d}40Zz(U9
zoy=B{_A@>YbK_zaX69KWItQ1I4inb54D?i+UJbUC#2>mW<%+ueRTiy1B$ohtHz@b&
z{E5m(Ojl<CF3?CElT0+Op|}3B7gEJNd>q}>(fL+v1n?5;wBogN&Ed!<qGXW%&r)ju
z^i)JPYa^5@q~hM>ZwiP^ukchdjeGL7PxH!Ht>M0bp(C&BS&bE&5(J;-i%k)sz1L~<
z8$$Xe3X5~e>fO5f+g}#>(~%JowRTI_s~un2+!r=_V^y=nbu(%49%w@?E>^bI5a&AX
z!?{wSF_e4-B{i?*QLCQn9Vje~%iG(5HQ$g>0fa;T`9!YZNBrxg<C{7TsmlEtsDO@a
zQJc_dZ&ZA}%JMyYM8r1(o7e7h#<=|sl3Euhy}&AK>6oK1_RTJGe+Gi>X=cMGy?Q+y
z&aP7dZE&%Mt!rDfeQ$*qM*;Ek<IJ|j+J|;}7FbW#oJe6IS%r&lCpZ6$pvQ+9odrSY
zuqF}sdH%NZefT`8@g}xc#U8JUx%eg|Im(;5@j@oPV1ANZ)~4iLp-kIh0>ZoECz-f}
z<FVBQk)&eG^|T1TvU9`Y@$qp$02%}WIjEpaQ!4Pq_>>qJNQHm!)8$u_%H<E-hq2_s
z@sgSQ)m4v{A7zxp1Pq4Su9Gopp%-C*vMKXMr7+*MRWAs5c%3et9Eg%;f7woNyb>H)
zK)s1|Bh$J}P&ql>Z+hYt(UYyvhixN`l?w<R09&~y#?IPuZqmsSTCrqbIL{#u7x!hW
zqMn=nCWW>3E%b96)rYcqe$s;Sr$$w+ElRRSkqyh&eWm1ijp^)}8#-1kPqJYb=jZ3A
zr_DZB$OdP)le6>G{X1=KZJ;6%@Z7XM3U)U#HhxK@DUl@Zv=UE>n<}nxqbJ0_B5w&f
zaV-mZ`(kIl#wNM6pYGrz5fh4jwyR8+aqp@@V8t*e)8DeQ)6QeFQB<Gz6-|VXQ322V
zv%TZ{zO3)U$zz8TDR>M~r&}$(p2Twb#oVv6;^g|xaJJ;Qae~3QFOc6iQJ7rj&pq@b
zOZY%x7EA644<r5Rv83eCfrSKi;m2P>@GXm#Ax2bK`(BuOc7~{7+LGbG5#|B<jdcAA
z-X%U>-oUS4OUFbfzh!1ZT(^D0#a#uumJcA?zPp-*s8$D8j=zKyF$d!3j^tAH1)ME~
zG8NReupT_qjTKD_!9vB?;DXXfw;<7GL#62&*Jtbryv`^b_rD+AXau<y)vrE=OFjF+
zYi#gOssIi^&N~I%kQwJ)K`Ej?Me}-J%P+*|>Cr;T3&(}?KE00Vc_u$^U8?y_)`$8b
zZaZF*$sPZ|vdGCrTLv*des_g}<8^6@q~L()44fZ4o9^IK?vzK5oFIA1yTk-W1!=`J
zm@g*Rd`X0Zd|Q~J-jmGuUzoNxFPoD!GI>5t`6r^*d{6F0$`EKyLST@YW6n6tOjDm@
zw*h<z8@ff>P*(0%DoBcD-fXIb%nrQm!VIpR*TkLpfX)zPLq_f@@N0aXO^+*Ia0!J(
ze)#YK@JOzaBoFZAwo}Q#-)&@HNg{;3E0XGBwC4F7b<@?&;LE&Uj6n2(=AMnQxXkgv
zc)rpEYgIsdgQx1x)?Km%Y_#W!8Udv|*$fFFq|0|}Wvqzwq?kBqf)QtDY^(4L%M?Ah
z%Pud@PIR{dw`{uhdj$oyH*b8hnL04bii&oSTZ4{{j)~05U>%>#((QkVnJZ5C%m(80
z_PQ7S?pP~QX`)4=PcnmDx(MBeXuxZm3<o1NR8{1%ewECSgQuZpC-h0c^<Q|^VIU*g
zRDeO~buUpTchtNF7;SWPb!onxVJ0`Xodu&E^HIZcyOFp!5GC|}F$0hXXVDt~gkL*d
z-@gKf|C<0mU{Of8Df)k2WZU^GVZhrLIj>7vOVQB4Sis}*4D#6Wt3fDX0Dy4!O$D%y
zMsFqm8&}-k%%%1~yqRDTdOz>9yK>F>1Z@wv$@pa0jeK=Zc);aScTKzG)}J@k0R8tC
z!e+h9H&N^QufH^ogY0R<X57gD+G7CfU#X1$mp%PY*^mF?B2ZrnwEaR@9<wkO5TZr9
zZ2yMsxT#Cs=XwdFL>3?E?M?o(Y4jLA)Q|s*YxuvNvHza^`2W9_ug1>{kmEEWj5<}%
za|DHho*x$jnGv+ryd2O!7xb!Bke|nY1i}A{*Yf{*WKJFyaJRpoWB-f;#zd2sQIReO
He+v9J^$U01

diff --git a/documentation/overview-manual/svg/source-fetching.svg b/documentation/overview-manual/svg/source-fetching.svg
new file mode 100644
index 0000000000000000000000000000000000000000..90078ec06d3137439444057765b1431b4cb9a6f9
--- /dev/null
+++ b/documentation/overview-manual/svg/source-fetching.svg
@@ -0,0 +1,1220 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="722.07703"
+   height="533.2287"
+   viewBox="0 0 722.07703 533.2286"
+   sodipodi:docname="source-fetching.svg"
+   inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:dc="http://purl.org/dc/elements/1.1/">
+  <sodipodi:namedview
+     pagecolor="#ffffff"
+     bordercolor="#666666"
+     borderopacity="1"
+     objecttolerance="10"
+     gridtolerance="10"
+     guidetolerance="10"
+     inkscape:pageopacity="0"
+     inkscape:pageshadow="2"
+     inkscape:window-width="1884"
+     inkscape:window-height="1939"
+     id="namedview4"
+     showgrid="false"
+     inkscape:zoom="1.4472045"
+     inkscape:cx="358.62244"
+     inkscape:cy="327.52801"
+     inkscape:window-x="2271"
+     inkscape:window-y="175"
+     inkscape:window-maximized="1"
+     inkscape:current-layer="svg2"
+     inkscape:document-rotation="0"
+     inkscape:snap-perpendicular="true"
+     fit-margin-top="30"
+     lock-margins="true"
+     fit-margin-left="30"
+     fit-margin-right="30"
+     fit-margin-bottom="30"
+     inkscape:pagecheckerboard="0"
+     inkscape:showpageshadow="2"
+     inkscape:deskcolor="#d1d1d1">
+    <inkscape:grid
+       type="xygrid"
+       id="grid1257"
+       originx="69.846748"
+       originy="14.267609"
+       spacingy="1"
+       spacingx="1"
+       units="px" />
+  </sodipodi:namedview>
+  <metadata
+     id="metadata8">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about="">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <defs
+     id="defs6">
+    <rect
+       x="-345.93011"
+       y="-568.73254"
+       width="776.87695"
+       height="667.43011"
+       id="rect28" />
+    <rect
+       x="23.839064"
+       y="148.04404"
+       width="87.237152"
+       height="79.809036"
+       id="rect2" />
+    <inkscape:path-effect
+       effect="powerstroke"
+       id="path-effect6121"
+       is_visible="true"
+       lpeversion="1"
+       offset_points="0,0.5"
+       sort_points="true"
+       interpolator_type="CubicBezierJohan"
+       interpolator_beta="0.2"
+       start_linecap_type="zerowidth"
+       linejoin_type="extrp_arc"
+       miter_limit="4"
+       scale_width="1"
+       end_linecap_type="zerowidth"
+       not_jump="false"
+       message="" />
+    <marker
+       style="overflow:visible"
+       id="marker5783"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5623"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5621" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5487"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5485" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5161"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker4860"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4858" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker4504"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4502" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow1Mend"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Mend"
+       inkscape:isstock="true">
+      <path
+         transform="matrix(-0.4,0,0,-0.4,-4,0)"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:1pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path3318" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker4174"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4172" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow2Mend"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3336" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow1Mstart"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="matrix(0.4,0,0,0.4,4,0)"
+         style="fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:1pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path3315" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow2Lstart"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Lstart"
+       inkscape:isstock="true">
+      <path
+         transform="matrix(1.1,0,0,1.1,1.1,0)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3327" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow1Lstart"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Lstart"
+       inkscape:isstock="true">
+      <path
+         transform="matrix(0.8,0,0,0.8,10,0)"
+         style="fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:1pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path3309" />
+    </marker>
+    <linearGradient
+       id="linearGradient921"
+       inkscape:swatch="solid">
+      <stop
+         style="stop-color:#deddda;stop-opacity:1;"
+         offset="0"
+         id="stop919" />
+    </linearGradient>
+    <linearGradient
+       id="linearGradient6035-4">
+      <stop
+         id="stop6037-2"
+         style="stop-color:#ffffff"
+         offset="0" />
+      <stop
+         id="stop6039-9"
+         style="stop-color:#ffffff;stop-opacity:0"
+         offset="1" />
+    </linearGradient>
+    <marker
+       style="overflow:visible"
+       id="Arrow2Mstart-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3333-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow2Mend-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3336-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5623-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5621-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Arrow2Mend-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3336-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5161-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-1-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-7-6" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5161-4-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-3-4" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker4174-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4172-8" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-5" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5161-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="marker5161-0"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-4" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5161-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-6-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1-1" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-9" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-9" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-8" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-5"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-6" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-6-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1-15" />
+    </marker>
+  </defs>
+  <rect
+     style="opacity:1;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.09567;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
+     id="rect1"
+     width="717.95386"
+     height="529.80896"
+     x="2.4094629"
+     y="2.1621358" />
+  <g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(69.846747,14.267592)">
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="142.22464"
+       y="565.10297"
+       id="text907"><tspan
+         sodipodi:role="line"
+         id="tspan905"
+         x="142.22464"
+         y="565.10297" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="98.363503"
+       y="637.8432"
+       id="text911"><tspan
+         sodipodi:role="line"
+         id="tspan909"
+         x="98.363503"
+         y="637.8432" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-59.575905"
+       y="580.05695"
+       id="text915"><tspan
+         sodipodi:role="line"
+         id="tspan913"
+         x="-59.575905"
+         y="580.05695" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="313.46567"
+       y="412.9321"
+       id="text3781"><tspan
+         sodipodi:role="line"
+         id="tspan3779"
+         x="313.46567"
+         y="412.9321" /></text>
+    <g
+       id="g72820-3"
+       transform="matrix(3.2001899,0,0,4.5594279,-282.17456,-390.84179)">
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6"
+         width="196.16678"
+         height="68.896393"
+         x="71.68811"
+         y="122.33367"
+         ry="3.4538503" />
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6-5"
+         width="79.107689"
+         height="83.29377"
+         x="70.012787"
+         y="114.7747"
+         ry="4.1756063" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:4.65542px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Bold&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.3431px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="69.821327"
+       y="145.57741"
+       id="text1185-3-5-5-9-7"
+       transform="matrix(3.87937,0,0,3.7611867,-282.17456,-390.84179)"><tspan
+         sodipodi:role="line"
+         x="69.821327"
+         y="145.57741"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.65541967px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Bold&quot;;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.3431px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3">BitBake</tspan></text>
+    <path
+       style="fill:#808080;fill-rule:evenodd;stroke:#deddda;stroke-width:5.169;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5161-0)"
+       d="M 114.79948,320.82334 H 224.47382"
+       id="path5151-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-16.290483"
+       y="345.7359"
+       id="text3116"><tspan
+         sodipodi:role="line"
+         id="tspan3114"
+         x="-16.290483"
+         y="345.7359" /></text>
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:2.61112;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6"
+       width="312.02957"
+       height="283.15833"
+       x="245.26863"
+       y="182.6216"
+       ry="14.195031" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:1.55846;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27"
+       width="252.62085"
+       height="124.59291"
+       x="-51.109352"
+       y="-3.2277274"
+       ry="6.245976" />
+    <g
+       id="g3"
+       transform="translate(11.726444,18.55249)">
+      <rect
+         style="fill:#a0a0a0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0"
+         width="77.51136"
+         height="60.565445"
+         x="-57.536053"
+         y="-15.779959"
+         ry="3.0362105" />
+    </g>
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2"
+       width="270.26929"
+       height="236.56111"
+       x="265.73325"
+       y="207.73816"
+       ry="11.859063" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5"
+       width="209.80789"
+       height="236.56111"
+       x="-31.285583"
+       y="204.8772"
+       ry="11.859063" />
+    <g
+       id="g3-3"
+       transform="translate(93.245235,19.273036)">
+      <rect
+         style="fill:#a0a0a0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61"
+         width="77.51136"
+         height="60.565445"
+         x="-57.536053"
+         y="-15.779959"
+         ry="3.0362105" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:11.55550008px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="73.865288"
+       y="29.948204"
+       id="text1185-3-5-5-9-7-93-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="73.865288"
+         y="29.948204"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2-9">Local</tspan><tspan
+         sodipodi:role="line"
+         x="73.865288"
+         y="44.345493"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan5">Projects</tspan></text>
+    <g
+       id="g3-3-4"
+       transform="translate(173.42759,19.774109)">
+      <rect
+         style="fill:#a0a0a0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7"
+         width="77.51136"
+         height="60.565445"
+         x="-57.536053"
+         y="-15.779959"
+         ry="3.0362105" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:11.55550008px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="155.51562"
+       y="30.276878"
+       id="text1185-3-5-5-9-7-93-9-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="155.51562"
+         y="30.276878"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2-9-3">SCMs</tspan><tspan
+         sodipodi:role="line"
+         x="155.51562"
+         y="44.674168"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan7">(optional)</tspan></text>
+    <g
+       id="g3-3-0"
+       transform="matrix(3.0548289,0,0,0.817457,131.29913,79.564217)">
+      <rect
+         style="fill:#656565;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-6"
+         width="77.51136"
+         height="60.565445"
+         x="-57.536053"
+         y="-15.779959"
+         ry="2.4245923"
+         rx="0.72017127" />
+    </g>
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3"
+       width="19.926487"
+       height="18.934353"
+       x="31.653898"
+       y="42.728382"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2"
+       width="19.926487"
+       height="18.934353"
+       x="29.538702"
+       y="40.496868"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5"
+       width="19.926487"
+       height="18.934353"
+       x="89.532135"
+       y="-11.778489"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4"
+       width="19.926487"
+       height="18.934353"
+       x="135.56271"
+       y="34.25806"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2"
+       width="19.926487"
+       height="18.934353"
+       x="183.02675"
+       y="88.416168"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2-5"
+       width="19.926487"
+       height="18.934353"
+       x="348.36118"
+       y="259.42044"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4"
+       width="19.926487"
+       height="18.934353"
+       x="87.416931"
+       y="-14.010006"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-7"
+       width="19.926487"
+       height="18.934353"
+       x="148.05835"
+       y="-67.066444"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4-6"
+       width="19.926487"
+       height="18.934353"
+       x="145.94316"
+       y="-69.297958"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#666666;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4-6-7"
+       width="19.926487"
+       height="18.934353"
+       x="124.58775"
+       y="22.903889"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3332997px;line-height:119%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Bold&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="314.59457"
+       y="200.0639"
+       id="text1185-3-5-5-9-7-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="314.59457"
+         y="200.0639"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3332997px;line-height:119%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Bold&quot;;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-1">Build Directory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:11.55550008px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="-6.3590012"
+       y="22.655539"
+       id="text1185-3-5-5-9-7-93"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="-6.3590002"
+         y="22.655539"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-6">Upstream</tspan><tspan
+         sodipodi:role="line"
+         x="-6.3590002"
+         y="37.05283"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan1">Project</tspan><tspan
+         sodipodi:role="line"
+         x="-6.3590021"
+         y="51.450119"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2">Releases</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4"
+       width="124.81644"
+       height="54.485943"
+       x="11.963439"
+       y="273.53632" />
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-4"
+       width="124.81644"
+       height="54.485943"
+       x="12.600782"
+       y="339.24234" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3332997px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Bold&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="71.431915"
+       y="260.24667"
+       id="text1185-3-5-5-9-7-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="71.431915"
+         y="260.24667"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3332997px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Bold&quot;;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7">Source Fetching</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:11.55550008px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="73.987274"
+       y="306.36258"
+       id="text1185-3-5-5-9-7-4-3"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="73.987274"
+         y="306.36258"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0">do_fetch</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="281.13275"
+       y="250.71086"
+       id="text1185-3-5-5-9-7-4-3-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="250.71086"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan9">tmp</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="264.04425"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan10">  work</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="277.37762"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan11">    ${PACKAGE_ARCH}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="290.711"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan13">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="304.04437"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan14">        ${PV}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="317.37775"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan15">          sources-unpack</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="330.71112"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan29">          ${BP}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="344.04449"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan16">    ${MACHINE}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="357.37787"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan17">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="370.71124"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan18">        ${PV}</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="384.04462"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19">          sources-unpack</tspan><tspan
+         sodipodi:role="line"
+         x="281.13275"
+         y="397.37799"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan30">          ${BP}</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="581.10162"
+       y="251.27928"
+       id="text1185-3-5-5-9-7-4-3-6-7"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="581.10162"
+         y="251.27928"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3">TMPDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="582.48212"
+       y="304.12454"
+       id="text1185-3-5-5-9-7-4-3-6-7-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="582.48212"
+         y="304.12454"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5">WORKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="582.48212"
+       y="318.41223"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="582.48212"
+         y="318.41223"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3">UNPACKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="581.68451"
+       y="332.7298"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="581.68451"
+         y="332.7298"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8">S</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:11.55550008px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="74.144165"
+       y="368.55737"
+       id="text1185-3-5-5-9-7-4-3-7"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="74.144165"
+         y="368.55737"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0-8">do_unpack</tspan><tspan
+         sodipodi:role="line"
+         x="74.144165"
+         y="385.224"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan8" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:11.55550008px;line-height:125%;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="73.394455"
+       y="97.290146"
+       id="text1185-3-5-5-9-7-93-9-5"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="73.394455"
+         y="97.290146"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:11.55550008px;font-family:&quot;Nimbus Sans&quot;;-inkscape-font-specification:&quot;Nimbus Sans, Normal&quot;;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan5-9">Source Mirror(s)</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17)"
+       d="M 310.33967,249.08366 580.2025,248.31935"
+       id="path5151-2"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9)"
+       d="m 442.1545,314.90299 139.43107,0.44213"
+       id="path5151-2-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2)"
+       d="m 385.14804,330.10471 196.24041,-0.3455"
+       id="path5151-2-9-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-6)"
+       d="m 370.9828,300.04676 210.60303,0.44213"
+       id="path5151-2-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="581.21222"
+       y="370.40884"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="581.21222"
+         y="370.40884"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-8">WORKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="581.21222"
+       y="384.69653"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="581.21222"
+         y="384.69653"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-81">UNPACKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="580.41461"
+       y="399.0141"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-0"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="580.41461"
+         y="399.0141"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:&quot;Nimbus Mono PS&quot;;-inkscape-font-specification:&quot;Nimbus Mono PS, Normal&quot;;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-3">S</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-3)"
+       d="m 440.88326,381.11692 139.43107,0.44213"
+       id="path5151-2-9-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-5)"
+       d="m 383.8768,396.31864 196.24041,-0.3455"
+       id="path5151-2-9-9-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-6-1)"
+       d="m 369.71156,366.26069 210.60303,0.44213"
+       id="path5151-2-0-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text2"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans';text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect2);display:inline;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none" />
+    <text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text28"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:119%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS';text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect28);display:inline;fill:#808080;fill-opacity:1;stroke:#deddda;stroke-width:1.893;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1" />
+  </g>
+  <style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

-- 
2.47.0


