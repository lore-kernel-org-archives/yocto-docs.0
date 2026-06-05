Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBEECD8C83
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8179.1780665984263440315
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vKBGP4na;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73061C58478
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEB6F5FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE0CC106A1058;
	Fri,  5 Jun 2026 15:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+c/jO2eVleiAEdMfeEzMnFdqvHZfvBHWKRWZ5FrZ778=;
	b=vKBGP4nacDMy7BqiPYX9Lxurct4v1k3eBqjxIReVV6eB4BXVYSnQ0g71Z49r2nSTh3Y8/u
	ma/n8WA579tLnXRs9j04AGr1Yq5A0+BeqlMVwnvVkUVZ3bAZRvZilviPgwCu6qswuGoQ7Z
	GHI0oMmGOUA0DIumxWieurbY/2NzmtOP+DTvth+nD5beKVe5ZGvueCaj4y0lCToL8//ZOp
	7Uxea9BoDNY1ouneQNd5RLNC+ZMnsDHarcMSBhbf7FSOb2YpAViB2SEfqFGsXbyFjBalyL
	teOGpoj2NMkvVPyg9F9Sx8R11Bmi3+cGdePR5Lig2dj8YrdMNjZ9aUZTrqS6nA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:08 +0200
Subject: [PATCH 04/10] overview-manual/concepts: sdk.png: convert to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260605-udpate-outdated-graphics-v1-4-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=143786;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=45CUlFZix7YHjhmd3r8nKE7IjkqbrFdR7016U2t7KWI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs54vaIZTaWzrgg6TsZGzZ+54jXLUVcvlnOzZ
 yGI4NsLLFWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeAAKCRDRgEFAKaOo
 Nni1EACh2tqi+eNGIektQDFSZE7qQHNFGPBCPS7jBWg0lMd/2oYkQUW8zREoF6btyHcWWwlrXH9
 nQIk30s0I4evb29NVqR4Aa9hTAkx4Q5+ty0lKd+1lc65fOyknAVAv6mzthvc4kpuFsKcWaeB/3O
 xrwXGdd7cKI74P3f0Wl6ihaMQAR4JSnAPK5SGvCN92bK8SSyup+RNW9wA+nQCvxcrU5u4fjLDyT
 9OD7EahFq3EfdsKFsOnIAvVimtbeVhpGX190QIsD6f4S2wbgQX3cTSogfJAal4bstZd8XBedrZU
 48BEN6aWTytz8QrZJTmNsdW+NmmQv+/S8M5LkvjbFK1OfdM6Xg3XizaXp2ZxNvbWBzibBr5JWNx
 sJKThxnXxbPwjJuffK5Im+2TFiUh4vltTNr4La10w2RXNX+gzX49iYUPN5ZEcx2fjtGApgMRjP8
 Sg+d0LzMGJbYVLRfSSASJAf7IcLT43E8LvlDM/ujPYWUdoPRcxZAa5uUVsOeqlTTvyMuizbTavF
 UOjuLktVKUIEsxZXVblyYps0kRHVJOcwUKmU8swiQa5DdOSmzdDsofteR0iLUWeXm3+bdDptEFV
 HqdD092eDzqjsvdPYWGqI/ArH1SIHmrnNAPNaDUyQQ7dfpzm7KMN/usLdzEwHy+H/294CvOaElo
 BG+/qZFILW+pYBA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9594

Rename variables that were renamed:

ESDK_CLASS_INHERIT_DISABLE
ESDK_LOCALCONF_ALLOW
ESDK_LOCALCONF_REMOVE

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst    |    2 +-
 documentation/overview-manual/figures/sdk.png |  Bin 49804 -> 0 bytes
 documentation/overview-manual/svg/sdk.svg     | 1461 +++++++++++++++++++=
++++++
 3 files changed, 1462 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
index b462c104d..4e3c9c23f 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1310,7 +1310,7 @@ SDK (e.g. ``bitbake -c populate_sdk_ext`` imagename=
) or a standard SDK
 (e.g. ``bitbake -c populate_sdk`` imagename). This section takes a
 closer look at this output:
=20
-.. image:: figures/sdk.png
+.. image:: svg/sdk.*
    :width: 100%
=20
 The specific form of this output is a set of files that includes a
diff --git a/documentation/overview-manual/figures/sdk.png b/documentatio=
n/overview-manual/figures/sdk.png
deleted file mode 100644
index a376872638ad471bde7d5f3b0fe2df2893623cae..0000000000000000000000000=
000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 49804
zcmeAS@N?(olHy`uVBq!ia0y~yU>0UzU`pg*Vqjp{y0og2fq{X!*vT`5gM;JtL;nX1
z3=3DEPbt`Q}{`DrEPiAAXl>3R9Nsk+6<MX9NI#Toe}@0s`8F)%1Fc)B=3D-RLpsEw>(C;
zT%P^I`&0v_ME^jM395^H#NUO6U)?2|u9^4t@tRvv?zyY4W!>$nes8;~^r762fWW}E
zE`@4m4$1F-CN40t6?A#>x$bNK>8EwZS86`(KHZuaIgNpVfuVsp&b1uGSa8Xq2;|xa
zTqij};@T?eAmMcr=3D76XjPB6)r#X&A>Kc<B6)G!;b4tdSMz!1-@vfOAwW#I(H;0}lN
zv%I_iT{dS|)%McU>yL?wk3Cj%<m(%wHIfVr45!2<1@8<@*;84Q`Tb8K@1A3GeZzzV
z1s5m2dh_nZix)2<j-Pcqqkni7BLl;OVu6qn_I+kyw*Sm8#7#cyTleSvv&a6aE-n*S
zr@xtfEvv<Je#JA}?f2hC%9%1VFdTT^V7h#h>Wbfg-~9aiTt7ml;K`p|ZI#vW_j;!Z
zi54!M_~)rtxm(8X{p_!pA2ZK-v0~o!7bQl2m9v)J>9}j$R`dFC(BX)1=3DTPSO^=3D;9|
zCwiZA^Xz`FH~VjaXLf0KkKgIma^nc4pk?hcKXMDQ#ft?G8}Ka7d~~JgguMIw^vC5@
z3=3D9iSITvY(uhIGX@@DYEO8&2_UrxRHD6Y`d`|x+YyH$T~J-&W2(&%dNsh;ZxmtXVC
z3EzIa%_DMRspny{FWH74oy-I$t~h$=3D^zmgC9g>+xt~Hjv{`RZ%cI)wvLP|=3Dfe7W}S
z`1(B0kN01>mYjGPBZI@$w#}uf-gUdW8G{q%uXsB}kx$B1?wt9TnHvi7KK!f~oA0Hj
zB(&@I`4^GF9!EOn%-z~iwDbCz%UeIcxwRy@*k3(cShmjZ&*Wn1e|HMByEXnknKDzn
zIyZmy{Ph~z-M4J_%>2JmL`f;|^!{}+v!ARx9q?}QQQNjRT}nzyuh(5({`I?&7xyir
z>VNw;F5!v1mhSTTIeXPC<veBvhpR^qsh{SM$q0DE63uTbp&Kl(QNQ(;^WNzC1Fbw?
z<06mPf4x$Dwk`g&R_Ixs)gc<6x20G{&Xkl~=3D|64P%KkNG-_pwVT`P_Dmq}QBPi*U-
z*LiKba;}Be8-LB~U;40eYI=3D-Z-nx6Y6W(f9?mVl^z;HmEKie;LP1N>{f3veEDH*@I
zHgWIuq|Uh9cNZNB6*7YPPy6rb`^{{sEu^=3D8rgi<_hX)=3D=3DcphBTDd=3Dgm=3D=3D-$2=
M(6eK
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
)
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
XoI
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
d
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
G&;$SyIQ5YL

diff --git a/documentation/overview-manual/svg/sdk.svg b/documentation/ov=
erview-manual/svg/sdk.svg
new file mode 100644
index 000000000..7089a7bed
--- /dev/null
+++ b/documentation/overview-manual/svg/sdk.svg
@@ -0,0 +1,1461 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"695.36932"
+   height=3D"499.50766"
+   viewBox=3D"0 0 695.36933 499.50758"
+   sodipodi:docname=3D"sdk.svg"
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
+     inkscape:zoom=3D"2"
+     inkscape:cx=3D"376.75"
+     inkscape:cy=3D"345.5"
+     inkscape:window-x=3D"0"
+     inkscape:window-y=3D"0"
+     inkscape:window-maximized=3D"0"
+     inkscape:current-layer=3D"g10"
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
+     inkscape:connector-spacing=3D"4"
+     showguides=3D"false">
+    <inkscape:grid
+       type=3D"xygrid"
+       id=3D"grid1257"
+       originx=3D"158.74913"
+       originy=3D"-134.42217"
+       spacingy=3D"1"
+       spacingx=3D"1"
+       units=3D"px"
+       visible=3D"false" />
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
+       x=3D"264.33359"
+       y=3D"250.16414"
+       width=3D"500.81689"
+       height=3D"466.12616"
+       id=3D"rect19" />
+    <rect
+       x=3D"695.28046"
+       y=3D"296.58133"
+       width=3D"394.3017"
+       height=3D"334.69226"
+       id=3D"rect37" />
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
+       inkscape:isstock=3D"true"
+       viewBox=3D"0 0 6.9304588 5.1962256"
+       markerWidth=3D"6.9304585"
+       markerHeight=3D"5.1962256"
+       preserveAspectRatio=3D"xMidYMid">
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
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4"
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
+         id=3D"path5283-2-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-4"
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
+         id=3D"path5283-2-7-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-4-3"
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
+         id=3D"path5283-2-7-3-8" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-7"
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
+         id=3D"path5283-2-7-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-7-6"
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
+         id=3D"path5283-2-7-7-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-7-0"
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
+         id=3D"path5283-2-7-7-3" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-7-0-9"
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
+         id=3D"path5283-2-7-7-3-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-4-7-0-9-4"
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
+         id=3D"path5283-2-7-7-3-2-0" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-5-4"
+       refX=3D"0"
+       refY=3D"0"
+       orient=3D"auto"
+       inkscape:stockid=3D"Arrow2Mstart"
+       inkscape:isstock=3D"true"
+       viewBox=3D"0 0 6.9304588 5.1962256"
+       markerWidth=3D"6.9304585"
+       markerHeight=3D"5.1962256"
+       preserveAspectRatio=3D"xMidYMid">
+      <path
+         transform=3D"scale(0.6)"
+         d=3D"M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0=
017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style=3D"fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#=
000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id=3D"path5283-2-4-93-6-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8"
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
+         id=3D"path5283-2-4-93-1" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-5"
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
+         id=3D"path5283-2-4-93-1-6" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-5-2"
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
+         id=3D"path5283-2-4-93-1-6-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-5-2-6"
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
+         id=3D"path5283-2-4-93-1-6-7-0" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-1"
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
+         id=3D"path5283-2-4-87" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-9"
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
+         id=3D"path5283-2-4-93-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-0"
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
+         id=3D"path5283-2-4-93-1-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-5-3"
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
+         id=3D"path5283-2-4-93-1-6-75" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-5-2-9"
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
+         id=3D"path5283-2-4-93-1-6-7-2" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-9-2-8-5-2-6-2"
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
+         id=3D"path5283-2-4-93-1-6-7-0-8" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-6-9"
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
+         id=3D"path5283-2-1-7" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5285-17-7"
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
+         id=3D"path5283-2-45" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-8"
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
+         id=3D"path5781-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-8-1"
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
+         id=3D"path5781-4-4" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-8-1-2"
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
+         id=3D"path5781-4-4-0" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-8-9"
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
+         id=3D"path5781-4-5" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-8-9-7"
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
+         id=3D"path5781-4-5-1" />
+    </marker>
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-8-9-7-2"
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
+         id=3D"path5781-4-5-1-7" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode=3D"layer"
+     inkscape:label=3D"Image"
+     id=3D"g10"
+     transform=3D"translate(158.74912,-134.4222)">
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:b=
utt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"142.22464"
+       y=3D"565.10297"
+       id=3D"text907"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan905"
+         x=3D"142.22464"
+         y=3D"565.10297" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:b=
utt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"98.363503"
+       y=3D"637.8432"
+       id=3D"text911"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan909"
+         x=3D"98.363503"
+         y=3D"637.8432" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:b=
utt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"-59.575905"
+       y=3D"580.05695"
+       id=3D"text915"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan913"
+         x=3D"-59.575905"
+         y=3D"580.05695" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:b=
utt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"313.46567"
+       y=3D"412.9321"
+       id=3D"text3781"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan3779"
+         x=3D"313.46567"
+         y=3D"412.9321" /></text>
+    <g
+       id=3D"g72820-3"
+       transform=3D"matrix(3.2001899,0,0,3.9047369,-282.17456,-311.83028=
)">
+      <rect
+         style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-2-4-5-6"
+         width=3D"175.0743"
+         height=3D"36.906219"
+         x=3D"79.029411"
+         y=3D"133.47046"
+         ry=3D"2.293716" />
+      <rect
+         style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-2-4-5-6-5"
+         width=3D"76.451591"
+         height=3D"64.398911"
+         x=3D"77.354088"
+         y=3D"120.6852"
+         ry=3D"2.7951903" />
+    </g>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-lig=
atures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode=
:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"3.5130002"
+       y=3D"153.87576"
+       id=3D"text1185-3-5-5-9-7"
+       transform=3D"scale(1.0155894,0.98464989)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"3.5130002"
+         y=3D"153.87576"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inksca=
pe-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asi=
an:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:1=
.31058px"
+         id=3D"tspan60047-3">BitBake</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:b=
utt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"-16.290483"
+       y=3D"345.7359"
+       id=3D"text3116"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan3114"
+         x=3D"-16.290483"
+         y=3D"345.7359" /></text>
+    <g
+       id=3D"g3-3-4-0"
+       transform=3D"matrix(0.81749427,0,0,0.84489073,262.18714,253.88753=
)"
+       style=3D"fill:#e6e6e6">
+      <rect
+         style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-7-3"
+         width=3D"133.41695"
+         height=3D"103.01788"
+         x=3D"-57.536053"
+         y=3D"-15.779959"
+         ry=3D"14.795182" />
+    </g>
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-6-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"1077.8076"
+       y=3D"435.03784"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-9"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"351.00748"
+       y=3D"-20.043648"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-9-8"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"411.01468"
+       y=3D"40.854897"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-2"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"223.0507"
+       y=3D"97.172928"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#d35f5f;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-4"
+       width=3D"269.17505"
+       height=3D"178.6955"
+       x=3D"39.137543"
+       y=3D"447.96783" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Ni=
mbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-va=
riant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norm=
al;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;wri=
ting-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0=
.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"275.40765"
+       y=3D"280.79486"
+       id=3D"text1185-3-5-5-9-7-4-3-65-9"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"275.40765"
+         y=3D"280.79486"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-i=
nkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures=
:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant=
-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;strok=
e-width:0.84771px"
+         id=3D"tspan60047-3-7-0-6-69">SDK Generation</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"144.11365"
+       y=3D"429.23459"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"144.11365"
+         y=3D"429.23459"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inks=
cape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:norm=
al;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east=
-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wid=
th:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6">Application Development SDK</tspan>=
</text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"96.266571"
+       y=3D"452.78152"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0-4"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"96.266571"
+         y=3D"452.78152"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-ink=
scape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wi=
dth:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6-9">Build Directory</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"-68.057693"
+       y=3D"476.10501"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0-4-6"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"-68.057693"
+         y=3D"476.10501"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-ink=
scape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wi=
dth:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6-9-7">Extensible SDK</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"429.66141"
+       y=3D"476.10501"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0-4-6-3"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"429.66141"
+         y=3D"476.10501"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-ink=
scape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wi=
dth:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6-9-7-5">Standard SDK</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-82.778014,-165.84268)"
+       id=3D"text2"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:119%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;dire=
ction:ltr;white-space:pre;shape-inside:url(#rect2);display:inline;fill:#f=
fffff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;st=
roke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none" />
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-82.778014,-165.84268)"
+       id=3D"text28"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:119%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;dire=
ction:ltr;white-space:pre;shape-inside:url(#rect28);display:inline;fill:#=
808080;fill-opacity:1;stroke:#deddda;stroke-width:1.893;stroke-linecap:bu=
tt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke=
-opacity:1" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-size:10.6667px;line-height:119%;font-family:'Nimbus=
 Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-alig=
n:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:#ffffff;s=
troke:#000000;stroke-width:0.59;stroke-linejoin:bevel;stroke-miterlimit:0=
;stroke-opacity:0"
+       x=3D"317.23001"
+       y=3D"281.7269"
+       id=3D"text24"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan24"
+         x=3D"317.23001"
+         y=3D"281.7269" /></text>
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-47.755547,5.6668655)"
+       id=3D"text37"
+       style=3D"font-size:10.6667px;line-height:119%;font-family:'Nimbus=
 Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-alig=
n:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url=
(#rect37);display:inline;fill:#ffffff;stroke:#000000;stroke-width:0.59;st=
roke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0" />
+    <g
+       id=3D"g3-3-4-0-4"
+       transform=3D"matrix(0.81749427,0,0,0.84489073,138.28627,496.75455=
)"
+       style=3D"fill:#e6e6e6">
+      <rect
+         style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-7-3-3"
+         width=3D"279.59534"
+         height=3D"161.60541"
+         x=3D"-98.514931"
+         y=3D"-32.350147"
+         ry=3D"0" />
+    </g>
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
+       x=3D"284.22244"
+       y=3D"398.05438"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-9"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"284.22244"
+         y=3D"398.05438"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan14-4">bitbake -c populate_sdk &lt;image&gt;</tspan><=
tspan
+         sodipodi:role=3D"line"
+         x=3D"284.22244"
+         y=3D"411.38776"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan1">bitbake -c populate_sdk_ext &lt;image&gt;</tspan>=
</text>
+    <text
+       xml:space=3D"preserve"
+       transform=3D"translate(-45.24912,7.4222032)"
+       id=3D"text19"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:9.33333px;line-height:119%;font-family:'Nimb=
us Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Bold';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-sp=
ace:pre;shape-inside:url(#rect19);display:inline;fill:none;fill-opacity:1=
;stroke:#000000;stroke-width:0.5;stroke-linejoin:bevel;stroke-miterlimit:=
0" />
+    <path
+       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#00000=
0;stroke-width:2.3;stroke-linecap:butt;stroke-linejoin:miter;stroke-dasha=
rray:none;stroke-opacity:1;marker-end:url(#marker5783)"
+       d=3D"m 273.20629,353.30208 0.54459,92.62012"
+       id=3D"path15"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:0;font-family:'Nimbu=
s Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word=
-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opaci=
ty:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke-opacity:1"
+       x=3D"-55.363312"
+       y=3D"485.52353"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"-55.363312"
+         y=3D"485.52353"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan14">                   build/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-55.363312"
+         y=3D"498.8569"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan35">                     tmp/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-55.363312"
+         y=3D"512.19031"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan36">DEPLOY_DIR =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80&gt; deploy/ &lt;=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 DEPLOY_DIR</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-55.363312"
+         y=3D"525.52368"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan37">                         images/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-55.363312"
+         y=3D"538.85706"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan38">                         sdk/</tspan><tspan
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:108%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         sodipodi:role=3D"line"
+         id=3D"tspan210"
+         x=3D"-55.363312"
+         y=3D"551.28375">                          | <tspan
+   style=3D"font-style:italic"
+   id=3D"tspan214">installer files       |</tspan></tspan><tspan
+         style=3D"font-style:italic;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:108%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         sodipodi:role=3D"line"
+         id=3D"tspan211"
+         x=3D"-55.363312"
+         y=3D"562.80377">                          | host manifest files=
   |</tspan><tspan
+         style=3D"font-style:italic;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:108%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         sodipodi:role=3D"line"
+         id=3D"tspan212"
+         x=3D"-55.363312"
+         y=3D"574.32379">                          | target manifest fil=
es |</tspan><tspan
+         style=3D"font-style:italic;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:108%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         sodipodi:role=3D"line"
+         id=3D"tspan213"
+         x=3D"-55.363312"
+         y=3D"585.84387">                          | sdk test files     =
   |</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-55.363312"
+         y=3D"591.60388"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan43" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'Ni=
mbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-=
variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;w=
ord-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-=
linejoin:miter;stroke-opacity:1"
+       x=3D"-150.58905"
+       y=3D"550.78351"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-0"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"-150.58905"
+         y=3D"550.78351"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan43-6">              SDK_EXT_TYPE |</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-150.58905"
+         y=3D"561.4502"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan218">       SDK_INCLUDE_PKGDATA |</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-150.58905"
+         y=3D"572.11688"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan220">      ESDK_LOCALCONF_ALLOW =E2=94=9C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-150.58905"
+         y=3D"582.78363"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan221">     ESDK_LOCALCONF_REMOVE |</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"-150.58905"
+         y=3D"593.45032"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan222">ESDK_CLASS_INHERIT_DISABLE |</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'Ni=
mbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-=
variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;w=
ord-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-op=
acity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-=
linejoin:miter;stroke-opacity:1"
+       x=3D"264.96967"
+       y=3D"550.79779"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-0-4"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"550.79779"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan39">             | SDKIMAGE_FEATURES</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"561.46448"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan45">             | SDKMACHINE</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"572.13116"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan46">&lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4 =
TOOLCHAIN_HOST_TASK</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"582.79791"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan47">             | TOOLCHAIN_TARGET_TASK</tspan><tsp=
an
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"593.4646"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan48">             | SDKPATH</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"604.13129"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan49">             | SDK_HOST_MANIFEST</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"614.79797"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan50">             | SDK_TARGET_MANIFEST</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"264.96967"
+         y=3D"625.46472"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'=
Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;=
stroke:none;stroke-width:1.42682px"
+         id=3D"tspan51" /></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-size:10.6667px;line-height:100%;font-family:'Nimbus=
 Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';writing-m=
ode:lr-tb;direction:ltr;fill:#e6e6e6;stroke:#000000;stroke-width:2.3;stro=
ke-linejoin:bevel;stroke-miterlimit:0"
+       x=3D"401.75089"
+       y=3D"562.92218"
+       id=3D"text22"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan22"
+         x=3D"401.75089"
+         y=3D"562.92218" /></text>
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

--=20
2.54.0


