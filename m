Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD31ECD8C8A
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8182.1780665989674968118
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=bPvB6HdO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E0172C58478
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 360825FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E40A106A2451;
	Fri,  5 Jun 2026 15:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BeagnOFVDC7E6uO9AlwCWGj6JpO8ymdQjRdAwzh/rOU=;
	b=bPvB6HdOk/dO48GY9KJxSqAINFzD5oTr3OKNA7ihUZQS8tRPkWOb6mw5GCDwPKAl5AJX2L
	xiP3a4pocTF6pz7pSq9w3KjalfliyckTIRKcQUfARbYR8gAmEeOXlQX5/mH5xd8UbWqxKN
	+MvaD4a7GihJP3gPcLxOMMA9WoHgjUDPp/jiNAapJOaRLoAU4Eq+g0WbGRaXZXURjuoSZN
	PADADNBO5Rnu8Gq8psNvbqsShjkeQpbI6IXaW4cVneGDz85D3QS6YOKfnufelDRuQRWdO8
	q31/rcfXxd8bGM8/hk5+CdYa/55rRoW7LJJt1C/zoIB/cZrcjBASklK0Vv7hdw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:13 +0200
Subject: [PATCH 09/10] overview-manual/concepts: package-feeds.png: convert
 to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260605-udpate-outdated-graphics-v1-9-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=118461;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c+vSNSI5J60S9fZqrci4xIzV2BMWMI/sdoEOwsegpCI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs56p3Mryqsl2djmHxhXWhSExqyssNPrSBSfY
 zQ+cDMA2YeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOegAKCRDRgEFAKaOo
 Nt0+EACHUnSnrceFHesfZzuy48FlC9q3cAoLS6Wq+9z9vapNXSdavDa6jDS1RplkBUIit7fvEQ0
 vPJnLkb2ClPuG6kvRJ+jmpsuGTGBmxKGM7RF9phDnPqEJw1C/x0PVhW8eX0o3D/GMTDM7BaNCki
 xAWL4CJYjSZgLI0+oNsWNXUd3TMxhakLJ7wwqBUf911n5Dd5JFVbmjl3JiHkizL/4PAaZx5fUG6
 tgoZq9QAqvYwzlOaHVMvfrW688Fgr8q2OTDx9IC5O9eg3mwUhnWDDZEvD7XHVH5ChbHrw5fA8VY
 S5OwuSh+D5tz9YRN1jdjeVVAcuh8/qq1PYwBD2v3MJz4PS1ywKKTexA2472PA9ya4CWcBCWeFGi
 Eim459uxswl6bUF1KMFBZF0CSBp6XBKevqn0C2ypfxkyYzb8dilIwfmeeio7EWml7Db/uX+DBGo
 Bta1S9w0gMbZIaC7qWZbekkwyiNhgbKOp0M5P2vJymHO65gayu7EHmWJJq2eB0u/xBLUPEFHx4w
 IlBBpKSeGn8xVXNpsroZsZldXGw1wU+n5Szzxipw/d2G8gPxtXWy7pYqHGII/HEW4cTHBO9d3v2
 Ky1XETTKi7s7kfvi2hhd4N8mvKShJG8ZCxUOsXg0BHAJ2yEHc5Rzh3mGaUqCziWxQB8Szan6tJ0
 IYdrTtMMUVQEGzg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9599

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/package-feeds.png      |  Bin 42239 -> 0 byt=
es
 .../overview-manual/svg/package-feeds.svg          | 1257 ++++++++++++++=
++++++
 3 files changed, 1258 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
index 16d220ff7..daf683d18 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -581,7 +581,7 @@ shows this package feeds area in the upper-right corn=
er.
 This section looks a little closer into the package feeds area used by
 the build system. Here is a more detailed look at the area:
=20
-.. image:: figures/package-feeds.png
+.. image:: svg/package-feeds.*
    :width: 100%
=20
 Package feeds are an intermediary step in the build process. The
diff --git a/documentation/overview-manual/figures/package-feeds.png b/do=
cumentation/overview-manual/figures/package-feeds.png
deleted file mode 100755
index 2668d3ddaffbe80919a0ccba4f9134593fff3ebb..0000000000000000000000000=
000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 42239
zcmeAS@N?(olHy`uVBq!ia0y~yU|P<=3Dz!b#6#K6E%c;oj^1_lP^VkgfK4i1jn5B(o7
zFfd4#xJHx&=3DckpFCl;kLr03=3D5rs@_a7p11=3D6=3D&p^yl38T$H1V#;OXKRQZeVv-O>n=
=3D
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
g
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
o
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
e
z#c|J+jwzL%A8&doExL2UdS##8;_0kgcNwRDyQragvir`p13vcFk1D(7+_<y6eHxp4
zcy>(a0nsR~$$2r=3D(+&$wH2VGZaL1WN$3nVuCKM_E_uiTxv-ZJnC&8^x-R^m=3D{8egd
ztEBYt^=3D-~=3DzOtWp*POZ%Exr89*LOyS7IUuWyg7DRad)%Yx4efbU%thrq^Fx#eR<*5
zD`gl}mAUZFok{t}S9#pKcPmKa%5%<a-u;)~EN|wX&GB@idsytlI`f5-=3DUyoNAn|?5
z;nn);n?HRqe;Km0YU-n^wO$|Vm*+h<l`z<{^=3D|e3V_lhAYRzY4xo0H>`;}}I<Z5+V
zcwyV|pJ&QLx0(p=3DNxf(G!}sFk((au9i(`!o<SN$Q-1NA6HkbG9ZvOe<8nZsG;Q9VX
zgZax>#sx72z1b$OE%!y9FT8Yw-F!ZWMCO;d5!LeRH@w`-mv-`N?5;DBb_=3DZLE5H4>
zH>0ZIzJ$AWFgJ7ShP207OphY!&5N(xFaB%wPVmKNo*4GEJg>5kOgz@M&nz?I?u84P
zM_#?`cJqnK+L~K+@wVTa$}+e6e7jeNl@~vjvff@|sM5Fb`<u>kCbi!(!ZRdZNrq%w
z=3DXwTi?-I5Uy|~~@=3Dnd)3>*w%r7yW#EYge~({Or1?DIo@PJ_hZ-_g#&3=3DQ)X8U!(rq
zHWI&_WM8p%?OJv|nH&3Re|L-Px3#uTt@6JjWt!#U>N@r5wUtuo>FM7O^V?6^!F7Dk
z{rv6Wrlvv?Gs6wV3|v%p%J2DRzd6q_S66b;ti9@6X4n-yT{+{uRJift)qyLERz*J1
zKDkw9PknE}yM*<8UEYetvt}1|bg1-qXRWGDt`6SyZPx<LWnRbUKGau@tndA^s(#jz
z2d+<Ne6=3Dmgt`tuE_g`YKR+;O()zKxt_Z|L}e{}Bt>|V`xWglAP&Eo4PS+1P9HWIQf
zNXe{fyKTU&?iewTS_X~qo&&q;va^HKWa>3arLD6*Hfg@s7rpXg>zji0+y8TG{0M(>
zOaFz(e*Rg4JN#^_4E`V2TKh~k+ttNIKL51VkJ96Bc9_h&ap!q^+PMk*8QG^*m6)f;
zb@P2$6eJSalW}RI^ZWPbj&Jp~`BlbR*ZYwDe|>UVU*+Fxa!YO1FD_51Ki(%B8xwQt
z(lhnK(o)^LiB|8ooG#$i&3*fZ=3Df3TP;`GDUrce2H>G(T~_Kt|kc`<&gzwiIK+S`5i
z{Qft4jQ0ng{@#8(avIma<J;fw`gg2yaoOCc?Po2&|9-S>+MT3XT|3|1KA84$;@$se
z^PeQ15m+34^jcq!PK(U5yMa7y=3D_$cy4?g@KD!OvUw|Kr;akGEtU0)@6D>S;m;B)+T
z&c}U~^FQcT>f6=3DC&Aj2``hCg)233ZPrXOG5y4+T~de!!NoY=3D<vn)3VWY<HDQ@A&Y~
zoSW%(bl5EZy?@@!x2vt<O#W9`m}T?U`|^z|*{k_gcAVQO_x07&)6@0i_w{sC6+UBs
z%`Uxd-x~Q3uLa6#)8|W8|L^lSdG>TyeMRPJm-&tRRsa0=3D;Jv;o_QKZHo4;JEs`lgQ
z^wwFolH+@&G~21`Wp8Y9zsKuO+NAnu%@6nM|10KwzNaW3rYE@HJ?hBC1&_S<##iKV
zY>&F1D!lf*Uwm16ZqTo|6^y@rF)ZLbq~?9jEb#wjj;#J0Raq`CUuz22|IfVkPJB{1
zf5DmPb5Vw;d>@w=3DYwf%*FDm-<<;#^TZ(Z@0tS`GN8Tnf_*;eN5z1q;<dCTgXV^3fE
zC%vIK`o`Dw%+K_{mC8<0QeWpf_dT2MtlOuWoIU^NHzwax`tW^!&#rCnKAqib#kuL*
z!J{TyKfjwln@OClbiJ`kq+3eD^Lx8~ui`e|<NN9Ss^BGWeqAfN{y#c*oAtkA3bXn5
z*-Q(0b)V7NMgHB4x@Jzt*lWBqcBMbs8kl;6J2d%Jkpp<Sl=3Dku~S3i9<Kh3-4sP54&
zG4;pWDl?Z(TIP4vXWiQHU#)gmPT603<Ficach+6qC(?749y@l-&F!fFgufoM&2m50
zuZZ9O@7C7r(CABNci1lMJnj|YIB(_u?^dn_1qGb1Q_|A1O2v7vs2Un>4EQE3C8Za!
z!QpB8|ICaQ`BTnICEqYHTqu<9|M~pMlNHJP>@p0O*fBVy25J0uc6K(6otQUq@1L*H
zzqRBym3;lZxaIYiFb#`!{0sp<_gLSne|(I0XH1{<`>E3VKF>I9m~0Yz^!Z_FR)z(e
zHf`JX?%v+r%T_m>Vp0CXuprP&H8AeSshjCSQ;%rbzb!JZJn#Q*uY|I8tt-Qc_ABfR
zypxX4i8n0&dGYtko9ox-#v0Tg-}@%0D1P4LS)ae1S~98Q@xk<D(fB$hYwfc>;;Tz1
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

diff --git a/documentation/overview-manual/svg/package-feeds.svg b/docume=
ntation/overview-manual/svg/package-feeds.svg
new file mode 100644
index 000000000..952e0555c
--- /dev/null
+++ b/documentation/overview-manual/svg/package-feeds.svg
@@ -0,0 +1,1257 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"753.64697"
+   height=3D"531.72498"
+   viewBox=3D"0 0 753.64698 531.72487"
+   sodipodi:docname=3D"package-feeds.svg"
+   inkscape:version=3D"1.4.4 (dcaf3e7d9e, 2026-05-05)"
+   xmlns:inkscape=3D"http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi=3D"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns=3D"http://www.w3.org/2000/svg"
+   xmlns:svg=3D"http://www.w3.org/2000/svg"
+   xmlns:rdf=3D"http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc=3D"http://creativecommons.org/ns#"
+   xmlns:dc=3D"http://purl.org/dc/elements/1.1/">
+  <sodipodi:namedview
+     pagecolor=3D"#ffffff"
+     bordercolor=3D"#666666"
+     borderopacity=3D"1"
+     objecttolerance=3D"10"
+     gridtolerance=3D"10"
+     guidetolerance=3D"10"
+     inkscape:pageopacity=3D"0"
+     inkscape:pageshadow=3D"2"
+     inkscape:window-width=3D"3826"
+     inkscape:window-height=3D"1718"
+     id=3D"namedview4"
+     showgrid=3D"false"
+     inkscape:zoom=3D"1.4472045"
+     inkscape:cx=3D"362.42286"
+     inkscape:cy=3D"361.38638"
+     inkscape:window-x=3D"0"
+     inkscape:window-y=3D"0"
+     inkscape:window-maximized=3D"0"
+     inkscape:current-layer=3D"svg2"
+     inkscape:document-rotation=3D"0"
+     inkscape:snap-perpendicular=3D"true"
+     fit-margin-top=3D"30"
+     lock-margins=3D"true"
+     fit-margin-left=3D"30"
+     fit-margin-right=3D"30"
+     fit-margin-bottom=3D"30"
+     inkscape:pagecheckerboard=3D"0"
+     inkscape:showpageshadow=3D"2"
+     inkscape:deskcolor=3D"#d1d1d1"
+     inkscape:connector-spacing=3D"3">
+    <inkscape:grid
+       type=3D"xygrid"
+       id=3D"grid1257"
+       originx=3D"68.985123"
+       originy=3D"13.653309"
+       spacingy=3D"1"
+       spacingx=3D"1"
+       units=3D"px" />
+  </sodipodi:namedview>
+  <metadata
+     id=3D"metadata8">
+    <rdf:RDF>
+      <cc:Work
+         rdf:about=3D"">
+        <dc:format>image/svg+xml</dc:format>
+        <dc:type
+           rdf:resource=3D"http://purl.org/dc/dcmitype/StillImage" />
+      </cc:Work>
+    </rdf:RDF>
+  </metadata>
+  <defs
+     id=3D"defs6">
+    <rect
+       x=3D"74.756081"
+       y=3D"433.87842"
+       width=3D"154.39818"
+       height=3D"75.244682"
+       id=3D"rect4" />
+    <rect
+       x=3D"46.641647"
+       y=3D"201.07732"
+       width=3D"77.04509"
+       height=3D"29.712456"
+       id=3D"rect3" />
+    <rect
+       x=3D"-345.93011"
+       y=3D"-568.73254"
+       width=3D"776.87695"
+       height=3D"667.43011"
+       id=3D"rect28" />
+    <rect
+       x=3D"23.839064"
+       y=3D"148.04404"
+       width=3D"87.237152"
+       height=3D"79.809036"
+       id=3D"rect2" />
+    <inkscape:path-effect
+       effect=3D"powerstroke"
+       id=3D"path-effect6121"
+       is_visible=3D"true"
+       lpeversion=3D"1"
+       offset_points=3D"0,0.5"
+       sort_points=3D"true"
+       interpolator_type=3D"CubicBezierJohan"
+       interpolator_beta=3D"0.2"
+       start_linecap_type=3D"zerowidth"
+       linejoin_type=3D"extrp_arc"
+       miter_limit=3D"4"
+       scale_width=3D"1"
+       end_linecap_type=3D"zerowidth"
+       not_jump=3D"false"
+       message=3D"" />
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true"
+       viewBox=3D"0 0 6.9304588 5.1962256"
+       markerWidth=3D"6.9304585"
+       markerHeight=3D"5.1962256"
+       preserveAspectRatio=3D"xMidYMid">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5781" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5623"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5621" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5487"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5485" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4860"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4858" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4504"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4502" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow1Mend"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow1Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(-0.4,0,0,-0.4,-4,0)"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:1pt;stroke-opacity:1"
+         d=3D"M 0,0 5,-5 -12.5,0 5,5 Z"
+         id=3D"path3318" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4174"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4172" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mend"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3336" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow1Mstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow1Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(0.4,0,0,0.4,4,0)"
+         style=3D"fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:1pt;stroke-opacity:1"
+         d=3D"M 0,0 5,-5 -12.5,0 5,5 Z"
+         id=3D"path3315" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Lstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Lstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(1.1,0,0,1.1,1.1,0)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3327" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow1Lstart"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow1Lstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"matrix(0.8,0,0,0.8,10,0)"
+         style=3D"fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:1pt;stroke-opacity:1"
+         d=3D"M 0,0 5,-5 -12.5,0 5,5 Z"
+         id=3D"path3309" />
+    </marker>
+    <linearGradient
+       id=3D"linearGradient921"
+       inkscape:swatch=3D"solid">
+      <stop
+         style=3D"stop-color:#deddda;stop-opacity:1;"
+         offset=3D"0"
+         id=3D"stop919" />
+    </linearGradient>
+    <linearGradient
+       id=3D"linearGradient6035-4">
+      <stop
+         id=3D"stop6037-2"
+         style=3D"stop-color:#ffffff"
+         offset=3D"0" />
+      <stop
+         id=3D"stop6039-9"
+         style=3D"stop-color:#ffffff;stop-opacity:0"
+         offset=3D"1" />
+    </linearGradient>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mstart-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3333-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mend-2"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3336-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5623-2"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5621-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"Arrow2Mend-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#=
ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path3336-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-1"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-1-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-7-6" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-4-9"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-3-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker4174-8"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path4172-8" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-9"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-5" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-0"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"marker5161-0"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#=
deddda;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-7"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mend"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-6"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-1" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-6-6"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-1-1" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-0"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4-9" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4-93" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-0"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4-93-9" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-3"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4-8" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-5"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4-93-6" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-6-1"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-1-15" />
+    </marker>
+    <rect
+       x=3D"46.641647"
+       y=3D"201.07732"
+       width=3D"77.04509"
+       height=3D"29.712456"
+       id=3D"rect3-2" />
+    <rect
+       x=3D"46.641647"
+       y=3D"201.07732"
+       width=3D"77.04509"
+       height=3D"29.712456"
+       id=3D"rect3-2-6" />
+    <rect
+       x=3D"46.641647"
+       y=3D"201.07732"
+       width=3D"77.04509"
+       height=3D"29.712456"
+       id=3D"rect3-2-6-0" />
+    <rect
+       x=3D"46.641647"
+       y=3D"201.07732"
+       width=3D"77.04509"
+       height=3D"29.712456"
+       id=3D"rect3-2-6-5" />
+    <rect
+       x=3D"46.641647"
+       y=3D"201.07732"
+       width=3D"77.04509"
+       height=3D"29.712456"
+       id=3D"rect3-2-6-5-8" />
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5161-0-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"marker5161-0"
+       inkscape:isstock=3D"true"
+       viewBox=3D"0 0 6.9304588 5.1962256"
+       markerWidth=3D"6.9304585"
+       markerHeight=3D"5.1962256"
+       preserveAspectRatio=3D"xMidYMid">
+      <path
+         transform=3D"scale(-0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#=
deddda;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5159-4-1" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode=3D"layer"
+     inkscape:label=3D"Image"
+     id=3D"g10"
+     transform=3D"translate(68.98512,13.653292)">
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;fo=
nt-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#00=
0000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"142.22464"
+       y=3D"565.10297"
+       id=3D"text907"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan905"
+         x=3D"142.22464"
+         y=3D"565.10297" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;fo=
nt-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#00=
0000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"98.363503"
+       y=3D"637.8432"
+       id=3D"text911"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan909"
+         x=3D"98.363503"
+         y=3D"637.8432" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;fo=
nt-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#00=
0000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"-59.575905"
+       y=3D"580.05695"
+       id=3D"text915"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan913"
+         x=3D"-59.575905"
+         y=3D"580.05695" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;fo=
nt-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#00=
0000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"313.46567"
+       y=3D"412.9321"
+       id=3D"text3781"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan3779"
+         x=3D"313.46567"
+         y=3D"412.9321" /></text>
+    <g
+       id=3D"g72820-3"
+       transform=3D"matrix(3.2001899,0,0,4.5594279,-282.17456,-390.84179=
)">
+      <rect
+         style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-2-4-5-6"
+         width=3D"191.4337"
+         height=3D"25.709726"
+         x=3D"80.696175"
+         y=3D"163.48425"
+         ry=3D"3.4538503"
+         rx=3D"3.9696543" />
+      <rect
+         style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-2-4-5-6-5"
+         width=3D"80.023773"
+         height=3D"106.22665"
+         x=3D"69.09671"
+         y=3D"91.84182"
+         ry=3D"2.1395094" />
+    </g>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:17.7829px;line-height:125%;font-family:'Nimb=
us Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-varian=
t-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing=
-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.310=
58px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"-15.468077"
+       y=3D"56.923828"
+       id=3D"text1185-3-5-5-9-7"
+       transform=3D"scale(1.0155894,0.98464991)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"-15.468077"
+         y=3D"56.923828"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:17.7829px;font-family:'Nimbus Sans L';-ink=
scape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wi=
dth:1.31058px"
+         id=3D"tspan60047-3">BitBake</tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5-7-9"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"435.58142"
+       y=3D"16.075991"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5-7-9-2"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"566.10345"
+       y=3D"-106.87062"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-3"
+       width=3D"343.71005"
+       height=3D"310.02469"
+       x=3D"236.8728"
+       y=3D"16.224358" />
+    <path
+       style=3D"display:inline;fill:#808080;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:2.469;stroke-linecap:butt;stroke-linejoin:miter;stroke-=
miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marke=
r5161-0)"
+       d=3D"m 195.41878,114.63337 36.57483,-0.27298"
+       id=3D"path5151-8"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-weight:bold;font-size:42.5884px;line-height:125%;fo=
nt-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L';le=
tter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#00=
0000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"-16.290483"
+       y=3D"345.7359"
+       id=3D"text3116"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan3114"
+         x=3D"-16.290483"
+         y=3D"345.7359" /></text>
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:2.61112;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6"
+       width=3D"312.02957"
+       height=3D"283.15833"
+       x=3D"252.00497"
+       y=3D"28.927071"
+       ry=3D"14.195031" />
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2"
+       width=3D"270.26929"
+       height=3D"236.56111"
+       x=3D"272.46954"
+       y=3D"54.043633"
+       ry=3D"11.859063" />
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5"
+       width=3D"113.06967"
+       height=3D"87.998833"
+       x=3D"-41.971336"
+       y=3D"79.842484"
+       ry=3D"7.3676519" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"42.687691"
+       y=3D"108.85728"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;line-height:119%;font-family:'Nimb=
us Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-varian=
t-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing=
-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.426=
82px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"321.32388"
+       y=3D"46.206017"
+       id=3D"text1185-3-5-5-9-7-9"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"321.32388"
+         y=3D"46.206017"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;line-height:119%;font-family:'Ni=
mbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stro=
ke:none;stroke-width:1.42682px"
+         id=3D"tspan60047-3-1">Build Directory</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:13.3333px;line-height:119%;font-family:'Nimb=
us Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-varian=
t-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing=
-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.426=
82px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"284.92331"
+       y=3D"7.9538651"
+       id=3D"text1185-3-5-5-9-7-9-4"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"284.92331"
+         y=3D"7.9538651"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:13.3333px;line-height:119%;font-family:'Ni=
mbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stro=
ke:none;stroke-width:1.42682px"
+         id=3D"tspan60047-3-1-4">Package Feeds</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Ni=
mbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-=
variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;w=
ord-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-=
linejoin:miter;stroke-opacity:1"
+       x=3D"285.42163"
+       y=3D"75.820732"
+       id=3D"text1185-3-5-5-9-7-4-3-6"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"75.820732"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan44">build/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"89.154106"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan19">  tmp/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"102.48748"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan20">    deploy/ &lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 DEPLOY_DIR</tsp=
an><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"115.82086"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan21">      &lt;package_type&gt;/ &lt;=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 DEPLOY_DIR_*</t=
span><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"129.15424"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan22">        &lt;package_arch&gt;/ &lt;=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 PACKAGE_ARCH</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"142.48761"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan23">          *.&lt;type&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"155.82098"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan24">          *.&lt;type&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"169.15436"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan25">             .</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"182.48773"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan26">             .</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"195.82111"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan27">             .</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"209.15448"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan28">        &lt;package_arch&gt;/ &lt;=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 PACKAGE_ARCH</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"222.48787"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan29">          *.&lt;type&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"235.82124"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan30">          *.&lt;type&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"249.15462"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan31">             .</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"262.48798"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan32">             .</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"285.42163"
+         y=3D"275.82135"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan34">             .</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-82.778014,-165.84268)"
+       id=3D"text2"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:119%;font-family:'Ni=
mbus Sans L';-inkscape-font-specification:'Nimbus Sans L';text-align:star=
t;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect=
2);display:inline;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width=
:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-d=
asharray:none" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-82.778014,-165.84268)"
+       id=3D"text28"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:119%;font-family:'Ni=
mbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS';text-align:st=
art;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#re=
ct28);display:inline;fill:#808080;fill-opacity:1;stroke:#deddda;stroke-wi=
dth:1.893;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;s=
troke-dasharray:none;stroke-opacity:1" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-70.451541,-90.679517)"
+       id=3D"text3"
+       style=3D"font-size:13.3333px;line-height:100%;font-family:'Nimbus=
 Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:cent=
er;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rec=
t3);display:inline;fill:#000000;stroke-width:4;stroke-linejoin:bevel;stro=
ke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+       x=3D"38.522545"
+       y=3D"0"><tspan
+         x=3D"70.415619"
+         y=3D"210.7981"
+         id=3D"tspan2"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan1">.rpm
+</tspan></tspan><tspan
+         x=3D"55.603039"
+         y=3D"224.43673"
+         id=3D"tspan4"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan3">Generation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-9"
+       width=3D"113.06967"
+       height=3D"87.998833"
+       x=3D"-40.551945"
+       y=3D"175.06328"
+       ry=3D"7.3676519" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"109.10242"
+       y=3D"177.10753"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-69.032149,4.541268)"
+       id=3D"text3-6"
+       style=3D"font-size:13.3333px;line-height:100%;font-family:'Nimbus=
 Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:cent=
er;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rec=
t3-2);display:inline;fill:#000000;stroke-width:4;stroke-linejoin:bevel;st=
roke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+       x=3D"38.522545"
+       y=3D"0"><tspan
+         x=3D"70.769619"
+         y=3D"210.7981"
+         id=3D"tspan6"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan5">.deb
+</tspan></tspan><tspan
+         x=3D"55.603039"
+         y=3D"224.43673"
+         id=3D"tspan8"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan7">Generation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-9-7-0"
+       width=3D"58.834869"
+       height=3D"277.0878"
+       x=3D"90.422226"
+       y=3D"81.368736"
+       ry=3D"7.3676519" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-8"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"139.35333"
+       y=3D"16.967686"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-8-1"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"204.74409"
+       y=3D"86.391281"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-8-1-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"267.45444"
+       y=3D"155.467"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-9-7"
+       width=3D"113.06967"
+       height=3D"87.998833"
+       x=3D"-41.115772"
+       y=3D"269.18106"
+       ry=3D"7.3676519" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"173.31798"
+       y=3D"245.91766"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"255.20996"
+       y=3D"168.57066"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"190.9944"
+       y=3D"99.760529"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"124.57967"
+       y=3D"31.510288"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-69.595978,98.659048)"
+       id=3D"text3-6-4"
+       style=3D"font-size:13.3333px;line-height:100%;font-family:'Nimbus=
 Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:cent=
er;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rec=
t3-2-6);display:inline;fill:#000000;stroke-width:4;stroke-linejoin:bevel;=
stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+       x=3D"38.522545"
+       y=3D"0"><tspan
+         x=3D"73.12162"
+         y=3D"210.7981"
+         id=3D"tspan10"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan9">.ipk
+</tspan></tspan><tspan
+         x=3D"55.603039"
+         y=3D"224.43673"
+         id=3D"tspan12"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan11">Generation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-9-7-9"
+       width=3D"91.57119"
+       height=3D"77.249603"
+       x=3D"263.64801"
+       y=3D"370.16815"
+       ry=3D"7.3676519" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-0"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"467.81784"
+       y=3D"48.398746"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-0-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"456.13223"
+       y=3D"37.216801"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5-7-2"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"519.73956"
+       y=3D"103.11992"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(224.41856,195.41154)"
+       id=3D"text3-6-4-4"
+       style=3D"font-size:13.3333px;line-height:100%;font-family:'Nimbus=
 Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:cent=
er;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rec=
t3-2-6-5);display:inline;fill:#000000;stroke-width:4;stroke-linejoin:beve=
l;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+       x=3D"38.522545"
+       y=3D"0"><tspan
+         x=3D"65.855618"
+         y=3D"210.7981"
+         id=3D"tspan14"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan13">Image
+</tspan></tspan><tspan
+         x=3D"55.603039"
+         y=3D"224.43673"
+         id=3D"tspan16"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan15">Generation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#de=
ddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-9-7-9-6"
+       width=3D"91.57119"
+       height=3D"77.249603"
+       x=3D"442.61826"
+       y=3D"369.58972"
+       ry=3D"7.3676519" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-0-3"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"597.89362"
+       y=3D"-74.778145"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5-7-2-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"649.45258"
+       y=3D"-20.189531"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(403.38878,194.83312)"
+       id=3D"text3-6-4-4-0"
+       style=3D"font-size:13.3333px;line-height:100%;font-family:'Nimbus=
 Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:cent=
er;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rec=
t3-2-6-5-8);display:inline;fill:#000000;stroke-width:4;stroke-linejoin:be=
vel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+       x=3D"38.522545"
+       y=3D"0"><tspan
+         x=3D"70.12162"
+         y=3D"210.7981"
+         id=3D"tspan18"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan17">SDK
+</tspan></tspan><tspan
+         x=3D"55.603039"
+         y=3D"224.43673"
+         id=3D"tspan35"><tspan
+           style=3D"font-size:12px"
+           id=3D"tspan33">Generation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-5-5-7-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"181.10655"
+       y=3D"-22.468292"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2-7-9-0-5-3"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"586.47833"
+       y=3D"-86.161659"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(38.489136,6.1240883)"
+       id=3D"text3-6-4-3"
+       style=3D"font-size:13.3333px;line-height:100%;font-family:'Nimbus=
 Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:cent=
er;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rec=
t3-2-6-0);display:inline;fill:#000000;stroke-width:4;stroke-linejoin:beve=
l;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+       x=3D"38.522545"
+       y=3D"0"><tspan
+         x=3D"72.523495"
+         y=3D"210.7981"
+         id=3D"tspan36">QA
+</tspan><tspan
+         x=3D"69.53175"
+         y=3D"224.1314"
+         id=3D"tspan37">Tests</tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4"
+       width=3D"133.12267"
+       height=3D"39.339275"
+       x=3D"-3.2290411"
+       y=3D"409.29199" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-68.496518,-10.721681)"
+       id=3D"text4"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:12px;line-height:100%;font-family:'Nimbus =
Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-lig=
atures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre=
;shape-inside:url(#rect4);display:inline;fill:#000000;stroke-width:2.469;=
stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"><tspan
+         x=3D"74.755859"
+         y=3D"442.62691"
+         id=3D"tspan39"><tspan
+           style=3D"font-size:10.6667px;font-family:'Nimbus Mono PS';-in=
kscape-font-specification:'Nimbus Mono PS, Normal'"
+           id=3D"tspan38">do_package_write_*</tspan></tspan></text>
+    <path
+       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#00000=
0;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opaci=
ty:1"
+       d=3D"m 129.32825,429.61509 h 76.3541 V 178.0957"
+       id=3D"path35"
+       inkscape:connector-type=3D"orthogonal"
+       inkscape:connector-curvature=3D"0" />
+    <path
+       style=3D"fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end=
:url(#marker5783)"
+       d=3D"m 205.68235,178.78669 h 66.68028"
+       id=3D"path36"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

--=20
2.54.0


