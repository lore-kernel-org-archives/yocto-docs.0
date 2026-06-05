Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9B4CD8C84
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8178.1780665983395699960
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Ua9pnZ2r;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92711C5847B
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DED645FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0273A106A244E;
	Fri,  5 Jun 2026 15:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OB+/KQRG6O9HVIaoElO9Tn0gz/ff3lIkgcCLQmw8RMA=;
	b=Ua9pnZ2rXOsPReCRNNe4k4dxYCr1mFaTMJ6Hq+D/WJ361prjW4RTPEfIgHrtJEQsQ0Po+q
	4zT8iXbxELOlKOLD8mDi8jtpp5TFL6i8uGXnIawWnnMu01XLUs7SnoGsF/47NcPKh42I8E
	AmW5C8sqQ7w52uCIvxrmXCxq3BvitpbltBPvT4WtWRXLVj7RUaTnKdZurOwQzRgjPRRGiI
	LWkQYRkVQ2DMxVHL6d6iUjvBrMTIEZsauAbiem9pwezpvJpOQ2AdcoleErAuUOsWUasv/h
	nba6+wy3d892qLY8uYbrSb+VTtReXjK/OCBYZhJi5l0zuHTvf3c4PY+FQ8kRgw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:07 +0200
Subject: [PATCH 03/10] overview-manual/concepts: images.png: convert to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260605-udpate-outdated-graphics-v1-3-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=110109;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BI6UF94ktfxU3J/1zi4NNBHUVZntVVh4xBTvWuEH//0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs54t+jWK1KJoI5bjIoNuCGbb1IzN8+Gu4hcJ
 B1h982wW0uJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeAAKCRDRgEFAKaOo
 Np2AD/wK0DbxaBcS3LVoqRCixsLy2KNxLvRaOOo2KIpC0wsOFGMTS9+Fp0u6gm699Dl+jvJd2Hf
 7aXh3l/ZRLLgR/X0vxGA1LiMilGiY3HuATq4dknTCsxxHLGAwydzbp9O3FG/ieuQkTEP3LymAvj
 9smw3H0fOPFxcvqFo1brEhohwyuzPdI8oe2VHuX2rATKTrJv/BjYE+Dan8qljMZTIlkAUoukKuG
 6MMBGF3k/I1iepWWPfN5DOja7rpTfCvnkwyrtT8hYtRGogN1xgL8mz2GSUAZL+pjJd+uzaX8en1
 17kCNfgpuoQmxSVRurGBiQs6t9u4drFKmvJikdd3eBOskoZ5uVdi74WfaeXD7dwovoekP37IfeV
 z/eDMBgQ4TVwFZjPYzA3bN0p5kX2wZskyp8E2x8OWQNRULo8sFW0BWBG/2hdk7wyWgaCyRWI0f/
 NVaWvyiA40++vtzFCrbGs5PBVGPwEHZoojUyOPVwZV1SySc1AJy/fvzjWh8f+MYSo8vVY/FvLMA
 7GWjnyqVPbArsQdzNjEYNLouAZLXFmX3gI26R6YtP0qiOYwlXBn8N4hP5thrrwW+kd+dBDPPbKp
 FPdSbFf2X12QiRTaa5G3cK+kigFgqcxtWFhuhB/ZfvEp+tdLTdYa1Mh5xcUE5YSEvBl2iRJpryd
 d1W+WjataLtFj2g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9593

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst       |    4 +-
 documentation/overview-manual/figures/images.png |  Bin 32674 -> 0 bytes
 documentation/overview-manual/svg/images.svg     | 1346 ++++++++++++++++=
++++++
 3 files changed, 1348 insertions(+), 2 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
index b75851ae7..b462c104d 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1252,9 +1252,9 @@ the :ref:`general workflow figure
 output, in part, consists of images. This section takes a closer look at
 this output:
=20
-.. image:: figures/images.png
+.. image:: svg/images.*
    :align: center
-   :width: 75%
+   :width: 100%
=20
 .. note::
=20
diff --git a/documentation/overview-manual/figures/images.png b/documenta=
tion/overview-manual/figures/images.png
deleted file mode 100644
index 20c01307d587b1f6e5a4e93ac8080abc02c1516e..0000000000000000000000000=
000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 32674
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
g
zbw=3Dsk<sUM4{9ka8jYGfEp>)y~3(nU6FIU@|n}7fJ_jihsWbwRLytCeZY1h0wb>~4g
zj?+S`4rgqcHEZP_u1if{UR~8*7_cMZVAKD!<s7Cy6+-J1AGEH2c~SdCv2Og_!`$(g
z7ncXPwC>f2oRhHi$+Ks1I|>rd&NB6%ZzsytYGq{=3D7WPy<(V63_f{d;yhs(R|>vJX>
zUi}&R`~173B{@g;YWU7c*g8c{QB=3DRAtn6QJtkVj`1Ditnr>3xdnkgUAJ1c5s=3D<9N6
zp(X~Sol>(u%#@GVwJvOxsM*h%76<2tF<Z76aZj4k+<bU_37=3Dw!s!eA&f9MGwk#zT?
z1-`RqUT_Th@b%4~eS6dXexB)jg5#sMm-wA+2i9*d7ymEJ=3D`-_Xy@ED_z>%AQhBcql
zmOZU^50O#-!F{py(0hI}{}<2homsp0{in&tkCjOjHoBg8cWnJrfoayM;f1Wm#+zSl
z>rBxWzOU}J*Y0fK*`g~eD;m!PSkL=3D&!1m=3DYt-Jp{HEZ(H;=3DcryNBs|tvy<}=3D%Slk=
Z
z8?3UGKZW)CN$<DJk+PfLXZufD`1s_6!$ym_7u%okbXmh++3<CVj$nrZM_}BW&BoEs
zcqXQ??eeoKc${w^EaWI~XGy>`zu;nzJ^Qk*e31@2?Vs~Gf6=3DL*JJKJ$(Vq4Af7Pdd
zXU{%0;}2h7KTG$S+Ft)>Ds{_#zuo=3Dq!Nrpo*;dL=3D;+paC*W&Vd`>MVl(mA%a`Fn6H
zi(=3Da8duArF+h?-wt=3DYcA^L?b%x@)V1@-F>O;nO~v^5>oL_4Rp~qFc*fHMyG=3D^UvE~
zS=3DsvX^I`GiN)|@}rFA#To;>sRcfMzDX=3DU;L%CY+WACJ8GaQE^xmn}C7KA*ik`*g3~
zTaKlcx3Zev<avDgCAX)vWLf)<quVaV&1+8kSE*!S6&>-ldHUSBv6YTY3__htR<DkJ
ze0=3DROjqm=3DCp9-tR&$x5&ecW+j{r=3Dub^IlDr%nHwZAoud*ss-C~Bzv#>*u_0vS*xJD
zWBsQq`?zGgcStGzo!?_!x2w19&Z!CizGkGXE-YHiovNmEt=3D;B8RgsXt(nO7)C8Ars
zgFZZca%-#md-bfX?_LXUsNXq#bKFCdV?v!QE;A=3D?lv#DEQ}eOXT=3DBoPE0$Zzsw{eM
z-sJbmT_*m<;aPkOt`&AHzqQI=3DXI*WG$nm^iw>;nVo)GGEnIkHxTQYNRPDitpr&3_{
z5--JI&rjQ)n)LMuM}IS2GSyn>k$m9An$IVXm0av!p;34FrZ@ZTl}r;#zg{)5U3T_G
zmeb^hRr}1=3DzK{qyyXTiDyGqIObFw}8Pd>M1Zr>goG`A#c&TdB01)lxqmi^z8ndde6
zGH>H_vDo7$tIq_zH{{;Dc;4L|HHE)#tUc|!yC-r}QPUflLwD}nY3G;USM}9PWmQti
z(nX7ket&y=3D=3DFAx>%M8=3DLNs|{pdbH@lsg*fp2bcRxo9C^$DtSax<kSR3=3DQ(rcJXwF=
J
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
*
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
x
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

diff --git a/documentation/overview-manual/svg/images.svg b/documentation=
/overview-manual/svg/images.svg
new file mode 100644
index 000000000..b7e7d92b3
--- /dev/null
+++ b/documentation/overview-manual/svg/images.svg
@@ -0,0 +1,1346 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"580.86932"
+   height=3D"522.50769"
+   viewBox=3D"0 0 580.86933 522.50761"
+   sodipodi:docname=3D"images.svg"
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
+     inkscape:cx=3D"258.75"
+     inkscape:cy=3D"346.5"
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
+       originx=3D"40.749118"
+       originy=3D"-133.92217"
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
+       markerWidth=3D"6.93045855"
+       markerHeight=3D"5.19622541"
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
+     transform=3D"translate(40.749118,-133.9222)">
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
+       width=3D"272.17505"
+       height=3D"200.6955"
+       x=3D"83.137543"
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
+         id=3D"tspan60047-3-7-0-6-69">Image Generation</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"223.81621"
+       y=3D"429.23459"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"223.81621"
+         y=3D"429.23459"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inks=
cape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:norm=
al;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east=
-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wid=
th:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6">Images</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"141.22713"
+       y=3D"452.78152"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0-4"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"141.22713"
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
+       transform=3D"matrix(0.81749427,0,0,0.84489073,182.28627,496.75455=
)"
+       style=3D"fill:#e6e6e6">
+      <rect
+         style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-7-3-3"
+         width=3D"283.26508"
+         height=3D"191.78682"
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
+       x=3D"109.4615"
+       y=3D"484.8324"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"484.8324"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan25">build/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"498.16577"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan4">  tmp/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"511.49915"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan5">    deploy/ &lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 DEPLOY_DIR <=
/tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"524.83252"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan6">      images/</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"538.16589"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan7">        &lt;machine&gt;/ &lt;=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80 DEPLOY_DIR_IMAGE</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"551.49927"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan9">          &lt;kernel-image&gt; &lt;=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80 KERNEL_IMAGETYPE</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"564.83264"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan10">          &lt;root-filesystem-image&gt; &lt;=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80 IMAGE_FSTYPES</tspan><ts=
pan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"578.16602"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan11">          &lt;kernel-modules&gt; &lt;=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80 MODULE_TARBALL_DEPLOY</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"591.49939"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan12">          &lt;bootloaders&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"604.83276"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan13">          &lt;symlinks&gt;</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"109.4615"
+         y=3D"618.16614"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan14">      sdk/</tspan></text>
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
+       y=3D"403.73825"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-9"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"284.22244"
+         y=3D"403.73825"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan14-4">bitbake &lt;image&gt;</tspan></text>
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
+       d=3D"m 273.20629,353.30208 0.17678,93.86842"
+       id=3D"path15"
+       inkscape:connector-type=3D"polyline"
+       inkscape:connector-curvature=3D"0" />
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

--=20
2.54.0


