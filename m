Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8840DCD8C87
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8007.1780665982619144708
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MjjnPs2j;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5C6AC5847A
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E9A55FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 185BF106A2447;
	Fri,  5 Jun 2026 15:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nJQRCjQtJvFj8CdMLNEnUsJEWDdJPrdcgZE+AHuMQMM=;
	b=MjjnPs2jjO0Ag+YZ2ek9y/6RYduNUiqvhzhMjjW6E/l+9VpfiXZChsZQaicb1irF+R4KF5
	8uBKLK3ift97sLFeH5B5hZXhUToSndS8VplWjbmaqZoTsjjbe+gjAiWg0nROGS/uab3PQz
	fqOAVIBkEPAP9ez4UyMwgq94x9XKXinOPKrPzYXk3G+qgvuBmcNGgePYsqQo+0YQdol0Gi
	/+fBb6HADlDOATHcG7UJgKaPi/FjAagNKgETjsUV0UEPQsRdN8DEVZK6bzCKGjkyaHFc2E
	n8Oo3BrOdSZh7pI6x3MyJlZnIqNPwmYI2bDL4e4T+P/K+k38SqolElYCqiEMAA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:06 +0200
Subject: [PATCH 02/10] overview-manual/concepts: sdk-generation.png:
 convert to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260605-udpate-outdated-graphics-v1-2-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=184520;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EFdvLPcpApUPcPBNBzfxPPAGiJ/1IQeIXkAhGTJvzYU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs54njVHYcWTjQs1lQqUOCWrtLr8vakPvgSgI
 tyxsCBCxECJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeAAKCRDRgEFAKaOo
 NlLKD/4ydvG1QqsNGTJiTQTQ0ktAmL4gUE/+eTevJAtbCNw8Gzi0klM+SN+a60wYR1vM/0uHK/U
 jdXAXURDz8RhErFZIR49FKtDta3yNDBcyoly0xlFNWLrEwkSJZMJ2CEnZgxHv4FYMi0M6UxLoMl
 MOlYucz8E9D4ToarQ8iITOBx1Zhxpt5JzMK6QVVVfbULS5v85UN/5hs4k6B+PPEV6q/tWB3vsft
 ZAChteuDk2IKeR3ZWEVptRCPXK2VWDr7qnT1AHs9OzQuAlDqY3DXAU5STJCe0H8YTDOGBI04CWT
 8vtnuvjaAow8m0XjUMKpGGXF6OWDwH+QWwKofdH9oCesDYc92VxBStyc8b1MlZfeDZahIqbXUkQ
 +hDj44XEya9NCTNgq3VrhRAWUKG3u9hXKeIw71MzHSk6oebmMqr6yiOvGajUEaa0e01ktHtRvwW
 J1/Vmkmgw1Hp5ntVaSr0kc6oBNd1ZJEPYKECb1CB00xtpBH5HGCauQuO2YBwNy8kkejF32GCkQH
 KcnZtFO9t1SgZXIEFnS2gvbru5kCMRJwJX/B6VhgXDXrUOgGf4g1w7HD7THzDzK157e9rTffp9D
 iPkwyG9jb47ATyh8uuRgUmmY+TiKSVQhWIZiWBK8gtgFzKehNNt2r76G5L19XCtPGd7yQahO9wQ
 pZJfrijs4RftDdQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9591

Rename variables that were renamed:

ESDK_CLASS_INHERIT_DISABLE
ESDK_LOCALCONF_ALLOW
ESDK_LOCALCONF_REMOVE

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/sdk-generation.png     |  Bin 60574 -> 0 byt=
es
 .../overview-manual/svg/sdk-generation.svg         | 2020 ++++++++++++++=
++++++
 3 files changed, 2021 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/o=
verview-manual/concepts.rst
index 49c004159..b75851ae7 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1078,7 +1078,7 @@ The OpenEmbedded build system uses BitBake to gener=
ate the Software
 Development Kit (SDK) installer scripts for both the standard SDK and
 the extensible SDK (eSDK):
=20
-.. image:: figures/sdk-generation.png
+.. image:: svg/sdk-generation.*
    :width: 100%
=20
 .. note::
diff --git a/documentation/overview-manual/figures/sdk-generation.png b/d=
ocumentation/overview-manual/figures/sdk-generation.png
deleted file mode 100644
index 939f8391136fca87e4d3ea84b158688981065cb0..0000000000000000000000000=
000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 60574
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
SPh
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
t
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
f
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
!
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
S
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
l
zyNnI5|9Nz3wZYDE4NrER$rlAU4o)pdo#QUw!v1*v?e`bYAAWw>a;wdAn35-Z)#snd
zFqyI>G0keqk}H2VE=3D@iB^|~~#>Qmv%3ssiBTe<svpA@eusI8>3RPWYXZXT7V(x8SG
z)w|fV?8FC5ddul?i6gA`5T}1w_<A{8tJ}gSb=3DSUq`#&ah>P5v@Qc`smg-M~Vu5Rv<
zh4*f6ef{L)<IT3*y%h^HOlG~c%=3Doe9-YwJO(&%mJimAu{9uL!7rSF|TUshH&`}#WH
z{P{l@Zrr$WiAuAyfOXlM8#@Y<pZ$_wc<R)tWxlhgy^YK`Qv80yhAASgS>Db!LH)p|
zM<riu-cxgJP2|h>;m#{puFTBHIPpzq$)6|pz+)Htv|P~#GXBZy-A!CNg|}7#bSt)}
LtDnm{r-UW|Nqa`O

diff --git a/documentation/overview-manual/svg/sdk-generation.svg b/docum=
entation/overview-manual/svg/sdk-generation.svg
new file mode 100644
index 000000000..f235833f2
--- /dev/null
+++ b/documentation/overview-manual/svg/sdk-generation.svg
@@ -0,0 +1,2020 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?>
+<svg
+   version=3D"1.1"
+   id=3D"svg2"
+   width=3D"788.86932"
+   height=3D"758.00769"
+   viewBox=3D"0 0 788.86933 758.0076"
+   sodipodi:docname=3D"sdk-generation.svg"
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
+     inkscape:cx=3D"343.25"
+     inkscape:cy=3D"422"
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
+       originx=3D"45.249119"
+       originy=3D"-7.4221883"
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
+    <marker
+       style=3D"overflow:visible"
+       id=3D"marker5783-7"
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
+         id=3D"path5781-2" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode=3D"layer"
+     inkscape:label=3D"Image"
+     id=3D"g10"
+     transform=3D"translate(45.249118,-7.422207)">
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
+       transform=3D"matrix(3.2001899,0,0,4.5594279,-282.17456,-390.84179=
)">
+      <rect
+         style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-2-4-5-6"
+         width=3D"196.16678"
+         height=3D"99.394424"
+         x=3D"79.029411"
+         y=3D"133.47046"
+         ry=3D"4.9827499" />
+      <rect
+         style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#=
62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-2-4-5-6-5"
+         width=3D"79.107689"
+         height=3D"129.83224"
+         x=3D"77.354088"
+         y=3D"120.6852"
+         ry=3D"6.5086303" />
+    </g>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:3.77584px;line-height:125%;font-family:'Nimb=
us Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-li=
gatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-=
variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mod=
e:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.3431px;=
stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"77.136833"
+       y=3D"154.30118"
+       id=3D"text1185-3-5-5-9-7"
+       transform=3D"matrix(3.8793701,0,0,3.7611867,-282.17456,-390.84179=
)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"77.136833"
+         y=3D"154.30118"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:3.77584px;font-family:'Nimbus Sans';-inksc=
ape-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;=
font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:=
0.3431px"
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
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:1.55846;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27"
+       width=3D"252.62085"
+       height=3D"124.59291"
+       x=3D"-27.615782"
+       y=3D"23.720779"
+       ry=3D"6.245976" />
+    <g
+       id=3D"g3"
+       transform=3D"translate(35.220014,45.500997)">
+      <rect
+         style=3D"fill:#a0a0a0;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0"
+         width=3D"77.51136"
+         height=3D"60.565445"
+         x=3D"-57.536053"
+         y=3D"-15.779959"
+         ry=3D"3.0362105" />
+    </g>
+    <g
+       id=3D"g3-3"
+       transform=3D"translate(116.73881,46.221543)">
+      <rect
+         style=3D"fill:#a0a0a0;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61"
+         width=3D"77.51136"
+         height=3D"60.565445"
+         x=3D"-57.536053"
+         y=3D"-15.779959"
+         ry=3D"3.0362105" />
+    </g>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.=
42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"97.333916"
+       y=3D"56.925354"
+       id=3D"text1185-3-5-5-9-7-93-9"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"97.333916"
+         y=3D"56.925354"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan2-9">Local</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"97.333916"
+         y=3D"74.954109"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan5">Projects</tspan></text>
+    <g
+       id=3D"g3-3-4"
+       transform=3D"translate(196.92116,46.722616)">
+      <rect
+         style=3D"fill:#a0a0a0;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-7"
+         width=3D"77.51136"
+         height=3D"60.565445"
+         x=3D"-57.536053"
+         y=3D"-15.779959"
+         ry=3D"3.0362105" />
+    </g>
+    <g
+       id=3D"g3-3-4-0"
+       transform=3D"matrix(1,0,0,0.84489073,390.64256,283.38753)"
+       style=3D"fill:#e6e6e6">
+      <rect
+         style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-7-3"
+         width=3D"246.5676"
+         height=3D"436.78885"
+         x=3D"-57.536053"
+         y=3D"-15.779959"
+         ry=3D"21.896692" />
+    </g>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.=
42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"178.98425"
+       y=3D"57.254028"
+       id=3D"text1185-3-5-5-9-7-93-9-4"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"178.98425"
+         y=3D"57.254028"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan2-9-3">SCMs</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"178.98425"
+         y=3D"75.282784"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan7">(optional)</tspan></text>
+    <g
+       id=3D"g3-3-0"
+       transform=3D"matrix(3.0548289,0,0,0.817457,154.7927,106.51272)">
+      <rect
+         style=3D"fill:#656565;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-6"
+         width=3D"77.51136"
+         height=3D"60.565445"
+         x=3D"-57.536053"
+         y=3D"-15.779959"
+         ry=3D"2.4245923"
+         rx=3D"0.72017127" />
+    </g>
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"67.23761"
+       y=3D"46.18803"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-2"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"65.122414"
+       y=3D"43.956516"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"125.11585"
+       y=3D"-8.3188419"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"171.14642"
+       y=3D"37.717709"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"413.79514"
+       y=3D"-112.67522"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"450.98605"
+       y=3D"-73.119347"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-1"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"820.27295"
+       y=3D"84.850525"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
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
+       x=3D"563.11652"
+       y=3D"-179.8026"
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
+       style=3D"fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-2-4"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"123.00065"
+       y=3D"-10.550359"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"183.64206"
+       y=3D"-63.606796"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-2-4-6"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"181.52687"
+       y=3D"-65.83831"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#666666;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-2-4-6-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"160.17146"
+       y=3D"26.363537"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.=
42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"17.109625"
+       y=3D"49.63269"
+       id=3D"text1185-3-5-5-9-7-93"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"17.109625"
+         y=3D"49.63269"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan60047-3-6">Upstream</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"17.109625"
+         y=3D"67.661446"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan1">Project</tspan><tspan
+         sodipodi:role=3D"line"
+         x=3D"17.109625"
+         y=3D"85.690193"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan2">Releases</tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7"
+       width=3D"335.60818"
+       height=3D"86.319359"
+       x=3D"244.38937"
+       y=3D"117.56476" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6"
+       width=3D"82.871109"
+       height=3D"53.319359"
+       x=3D"363.22354"
+       y=3D"365.97845" />
+    <rect
+       style=3D"fill:#d35f5f;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-4"
+       width=3D"154.17505"
+       height=3D"70.195496"
+       x=3D"435.13754"
+       y=3D"682.96783" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"420.95044"
+       y=3D"163.41214"
+       id=3D"text1185-3-5-5-9-7-4-3-65"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"420.95044"
+         y=3D"163.41214"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inks=
cape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:norm=
al;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east=
-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wid=
th:0.84771px"
+         id=3D"tspan60047-3-7-0-6">Package Feeds</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:104.3%;font-family:'=
Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word=
-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline=
-size:66.3902;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;s=
troke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"499.23807"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,-83.803658,27.683784=
)"><tspan
+         x=3D"499.23807"
+         y=3D"355.35999"
+         id=3D"tspan29"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan28">Target Path</tspan><tspan
+   y=3D"355.35999"
+   id=3D"tspan30"> </tspan></tspan><tspan
+         x=3D"499.23807"
+         y=3D"366.48534"
+         id=3D"tspan32"><tspan
+           style=3D"line-height:104.3%;stroke:none"
+           id=3D"tspan31">Construction</tspan></tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-8"
+       width=3D"141.87111"
+       height=3D"53.319359"
+       x=3D"387.25089"
+       y=3D"490.92221" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:104.3%;font-family:'=
Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word=
-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline=
-size:117.482;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;s=
troke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"524.784"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-7"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,-55.855795,146.94342=
)"><tspan
+         x=3D"524.784"
+         y=3D"355.35999"
+         id=3D"tspan34"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan33">Environment script and</tspan><tspan
+   y=3D"355.35999"
+   id=3D"tspan35"> </tspan></tspan><tspan
+         x=3D"524.784"
+         y=3D"366.48534"
+         id=3D"tspan37"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan36">Configuration file</tspan><tspan
+   y=3D"366.48534"
+   id=3D"tspan38"> </tspan></tspan><tspan
+         x=3D"524.784"
+         y=3D"377.61071"
+         id=3D"tspan40"><tspan
+           style=3D"line-height:104.3%;stroke:none"
+           id=3D"tspan39">Creation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-5"
+       width=3D"82.871109"
+       height=3D"53.319359"
+       x=3D"363.22354"
+       y=3D"422.92221" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:87%;font-family:'Nim=
bus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-sp=
acing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-si=
ze:66.3902;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stro=
ke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opaci=
ty:1"
+       x=3D"499.23807"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-6"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,-83.821931,88.943756=
)"><tspan
+         x=3D"499.23807"
+         y=3D"355.35999"
+         id=3D"tspan42"><tspan
+           style=3D"line-height:87%;stroke:none"
+           id=3D"tspan41">Cleanup</tspan></tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"466.3187"
+       y=3D"293.62314"
+       id=3D"text1185-3-5-5-9-7-4-3-65-9"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"466.3187"
+         y=3D"293.62314"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:12px;font-family:'Nimbus Sans L';-inkscape=
-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asi=
an:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0=
.84771px"
+         id=3D"tspan60047-3-7-0-6-69">Standard SDK Generation</tspan></t=
ext>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"523.1192"
+       y=3D"700.62781"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"523.1192"
+         y=3D"700.62781"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inks=
cape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:norm=
al;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east=
-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wid=
th:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6">Standard SDK</tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nim=
bus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-var=
iant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:norma=
l;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writ=
ing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.=
42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"96.863083"
+       y=3D"124.2673"
+       id=3D"text1185-3-5-5-9-7-93-9-5"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"96.863083"
+         y=3D"124.2673"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-in=
kscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:=
normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-=
opacity:1;stroke:none;stroke-width:1.42682px"
+         id=3D"tspan5-9">Source Mirror(s)</tspan></text>
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
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-4"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"527.20215"
+       y=3D"-217.42072"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-9"
+       width=3D"19.971395"
+       height=3D"18.892305"
+       x=3D"511.3378"
+       y=3D"-242.20459"
+       transform=3D"rotate(45)" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-9-3"
+       width=3D"19.971395"
+       height=3D"18.892305"
+       x=3D"401.98148"
+       y=3D"-133.28001"
+       transform=3D"rotate(45)" />
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
+       x=3D"453.86203"
+       y=3D"732.10333"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-5"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"453.86203"
+         y=3D"732.10333"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan25-9">tmp/deploy/sdk/*.sh<tspan
+   style=3D"font-style:italic"
+   id=3D"tspan10-2" /></tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'Nimb=
us Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Bold';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-=
spacing:0px;writing-mode:lr-tb;white-space:pre;inline-size:417.976;displa=
y:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682p=
x;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"609.60291"
+       y=3D"373.70792"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-2-2-8"
+       transform=3D"matrix(1.0010629,0,0,0.99893822,-43,54.225106)"><tsp=
an
+         x=3D"609.60291"
+         y=3D"373.70792"
+         id=3D"tspan44"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan43">&lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 DEPLOY_DIR
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"384.37462"
+         id=3D"tspan46"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan45">&lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 SDKIMAGE_FEATURES
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"395.0413"
+         id=3D"tspan48"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan47">&lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 SDKMACHINE
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"405.70799"
+         id=3D"tspan50"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan49">&lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 TOOLCHAIN_HOST_TASK
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"416.37468"
+         id=3D"tspan52"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan51">&lt;=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80 TOOLCHAIN_TARGET_TASK</tspan></tspan></text>
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
+       x=3D"352.20834"
+       y=3D"346.92816"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-8"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"352.20834"
+         y=3D"346.92816"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:9.33333px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan25-0">do_populate_sdk</tspan></text>
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-6-6"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"850.47833"
+       y=3D"116.83086"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-6"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"841.8656"
+       y=3D"107.71201"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#d35f5f;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-4-7"
+       width=3D"154.17505"
+       height=3D"70.195496"
+       x=3D"239.43327"
+       y=3D"683.10327" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"323.14261"
+       y=3D"701.10626"
+       id=3D"text1185-3-5-5-9-7-4-3-65-0-4"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"323.14261"
+         y=3D"701.10626"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inks=
cape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:norm=
al;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east=
-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-wid=
th:0.84771px"
+         id=3D"tspan60047-3-7-0-6-6-5">Extensible SDK</tspan></text>
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
+       x=3D"258.3656"
+       y=3D"732.59277"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-5-2"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"258.3656"
+         y=3D"732.59277"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan25-9-5">tmp/deploy/sdk/*.sh<tspan
+   style=3D"font-style:italic"
+   id=3D"tspan10-2-4" /></tspan></text>
+    <rect
+       style=3D"fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-6-6-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"653.04413"
+       y=3D"303.49356"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-6-4"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"644.4314"
+       y=3D"294.37469"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.4=
94224;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id=3D"rect10"
+       width=3D"220.35515"
+       height=3D"221.2979"
+       x=3D"346.51862"
+       y=3D"336.17017" />
+    <rect
+       style=3D"fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.4=
37;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id=3D"rect10-2"
+       width=3D"96.412384"
+       height=3D"123.35513"
+       x=3D"356.46939"
+       y=3D"359.14072" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-0"
+       width=3D"82.871109"
+       height=3D"53.319359"
+       x=3D"467.22354"
+       y=3D"365.97845" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:104.3%;font-family:'=
Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word=
-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline=
-size:66.3902;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;s=
troke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"499.23807"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-9"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,20.196342,27.683784)=
"><tspan
+         x=3D"499.23807"
+         y=3D"355.35999"
+         id=3D"tspan54"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan53">Target Path</tspan><tspan
+   y=3D"355.35999"
+   id=3D"tspan55"> </tspan></tspan><tspan
+         x=3D"499.23807"
+         y=3D"366.48534"
+         id=3D"tspan57"><tspan
+           style=3D"line-height:104.3%;stroke:none"
+           id=3D"tspan56">Construction</tspan></tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-5-0"
+       width=3D"82.871109"
+       height=3D"53.319359"
+       x=3D"467.22354"
+       y=3D"422.92221" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:87%;font-family:'Nim=
bus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-sp=
acing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-si=
ze:66.3902;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stro=
ke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opaci=
ty:1"
+       x=3D"499.23807"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-6-6"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,20.178059,88.943746)=
"><tspan
+         x=3D"499.23807"
+         y=3D"355.35999"
+         id=3D"tspan59"><tspan
+           style=3D"line-height:87%;stroke:none"
+           id=3D"tspan58">Cleanup</tspan></tspan></text>
+    <rect
+       style=3D"fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.4=
37;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id=3D"rect10-2-6"
+       width=3D"96.412384"
+       height=3D"123.35513"
+       x=3D"460.46939"
+       y=3D"359.14072" />
+    <g
+       id=3D"g3-3-4-0-3"
+       transform=3D"matrix(1,0,0,0.84489073,118.15311,283.60419)"
+       style=3D"fill:#e6e6e6">
+      <rect
+         style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#=
9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id=3D"rect917-0-6-27-0-61-7-3-0"
+         width=3D"188.58482"
+         height=3D"436.37039"
+         x=3D"0.44670337"
+         y=3D"-15.361498"
+         ry=3D"21.896692" />
+    </g>
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-7"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"253.03683"
+       y=3D"114.14158"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#e6e6e6;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-1-8"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"622.32373"
+       y=3D"272.11145"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-mite=
rlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-27-0-6-3-5-4-5-0-9-6"
+       width=3D"19.926487"
+       height=3D"18.934353"
+       x=3D"365.1673"
+       y=3D"7.4583316"
+       ry=3D"0"
+       transform=3D"rotate(43.365087)" />
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-88"
+       width=3D"82.871109"
+       height=3D"53.319359"
+       x=3D"171.5858"
+       y=3D"366.1951" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:104.3%;font-family:'=
Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word=
-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline=
-size:66.3902;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;s=
troke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"499.23807"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-4"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,-276.02075,21.153601=
)"><tspan
+         x=3D"499.23807"
+         y=3D"355.35999"
+         id=3D"tspan61"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan60">Encapsulated</tspan><tspan
+   y=3D"355.35999"
+   id=3D"tspan62"> </tspan></tspan><tspan
+         x=3D"499.23807"
+         y=3D"366.48534"
+         id=3D"tspan64"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan63">Body of Build</tspan><tspan
+   y=3D"366.48534"
+   id=3D"tspan65"> </tspan></tspan><tspan
+         x=3D"499.23807"
+         y=3D"377.61071"
+         id=3D"tspan67"><tspan
+           style=3D"line-height:104.3%;stroke:none"
+           id=3D"tspan66">System</tspan></tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-8-6"
+       width=3D"141.87111"
+       height=3D"53.319359"
+       x=3D"142.0858"
+       y=3D"491.13885" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:104.3%;font-family:'=
Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word=
-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline=
-size:117.482;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;s=
troke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-op=
acity:1"
+       x=3D"524.784"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-7-8"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,-301.02088,147.16006=
)"><tspan
+         x=3D"524.784"
+         y=3D"355.35999"
+         id=3D"tspan69"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan68">Environment script and</tspan><tspan
+   y=3D"355.35999"
+   id=3D"tspan70"> </tspan></tspan><tspan
+         x=3D"524.784"
+         y=3D"366.48534"
+         id=3D"tspan72"><tspan
+   style=3D"line-height:104.3%;stroke:none"
+   id=3D"tspan71">Configuration file</tspan><tspan
+   y=3D"366.48534"
+   id=3D"tspan73"> </tspan></tspan><tspan
+         x=3D"524.784"
+         y=3D"377.61071"
+         id=3D"tspan75"><tspan
+           style=3D"line-height:104.3%;stroke:none"
+           id=3D"tspan74">Creation</tspan></tspan></text>
+    <rect
+       style=3D"fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a=
9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id=3D"rect917-0-6-2-5-4-7-6-5-9"
+       width=3D"82.871109"
+       height=3D"53.319359"
+       x=3D"171.5858"
+       y=3D"423.13885" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:normal=
;font-stretch:normal;font-size:10.6667px;line-height:87%;font-family:'Nim=
bus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-sp=
acing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-si=
ze:66.3902;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stro=
ke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opaci=
ty:1"
+       x=3D"499.23807"
+       y=3D"355.35999"
+       id=3D"text1185-3-5-5-9-7-4-3-65-00-6-2"
+       transform=3D"matrix(0.97863561,0,0,1.0218308,-275.57841,89.160411=
)"><tspan
+         x=3D"499.23807"
+         y=3D"355.35999"
+         id=3D"tspan77"><tspan
+           style=3D"line-height:87%;stroke:none"
+           id=3D"tspan76">Cleanup</tspan></tspan></text>
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbu=
s Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant=
-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-=
mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.8477=
1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"220.57909"
+       y=3D"297.74973"
+       id=3D"text1185-3-5-5-9-7-4-3-65-9-6"
+       transform=3D"scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"220.57909"
+         y=3D"297.74973"
+         style=3D"font-style:normal;font-variant:normal;font-weight:bold=
;font-stretch:normal;font-size:12px;font-family:'Nimbus Sans L';-inkscape=
-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asi=
an:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0=
.84771px"
+         id=3D"tspan60047-3-7-0-6-69-4">Extensible SDK Generation</tspan=
></text>
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
+       x=3D"137.94667"
+       y=3D"347.14505"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-8-9"
+       transform=3D"scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role=3D"line"
+         x=3D"137.94667"
+         y=3D"347.14505"
+         style=3D"font-style:normal;font-variant:normal;font-weight:norm=
al;font-stretch:normal;font-size:9.33333px;font-family:'Nimbus Mono PS';-=
inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatur=
es:normal;font-variant-caps:normal;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-align:start;text-anchor:start;stroke:none;strok=
e-width:1.42682px"
+         id=3D"tspan25-0-5">do_populate_sdk_ext</tspan></text>
+    <rect
+       style=3D"fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.4=
94224;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id=3D"rect10-0"
+       width=3D"162.72597"
+       height=3D"223.4192"
+       x=3D"131.65837"
+       y=3D"334.2655" />
+    <rect
+       style=3D"fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.4=
37;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id=3D"rect10-2-4"
+       width=3D"96.412384"
+       height=3D"123.35513"
+       x=3D"164.81516"
+       y=3D"359.35736" />
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
0;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opaci=
ty:1;marker-end:url(#marker5783)"
+       d=3D"m 472.35305,557.90484 h 0.35355 v 124.45079"
+       id=3D"path13"
+       inkscape:connector-type=3D"orthogonal"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:10.6667px;line-height:100%;font-family:'Nimb=
us Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Bold';font-vari=
ant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-=
spacing:0px;writing-mode:lr-tb;white-space:pre;inline-size:417.976;displa=
y:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682p=
x;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x=3D"609.60291"
+       y=3D"373.70792"
+       id=3D"text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6-2-2-8-0"
+       transform=3D"matrix(1.0010629,0,0,0.99893822,-635.5833,48.053416)=
"><tspan
+         x=3D"609.60291"
+         y=3D"373.70792"
+         id=3D"tspan79"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan78">           DEPLOY_DIR =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"384.37462"
+         id=3D"tspan81"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan80">         SDK_EXT_TYPE =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"395.0413"
+         id=3D"tspan83"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan82">  SDK_INCLUDE_PKGDATA =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"405.70799"
+         id=3D"tspan85"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan84">SDK_INCLUDE_TOOLCHAIN =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"416.37468"
+         id=3D"tspan87"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan86"> ESDK_LOCALCONF_ALLOW =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;
+</tspan></tspan><tspan
+         x=3D"609.60291"
+         y=3D"427.04136"
+         id=3D"tspan89"><tspan
+           style=3D"font-size:9.33333px;line-height:100%;stroke:none"
+           id=3D"tspan88">ESDK_LOCALCONF_REMOVE =E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80&gt;</tspan></tspan></text>
+    <path
+       style=3D"display:inline;fill:none;fill-rule:evenodd;stroke:#00000=
0;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opaci=
ty:1;marker-end:url(#marker5783-7)"
+       d=3D"m 246.98583,557.90484 h 0.35355 v 124.45079"
+       id=3D"path13-6"
+       inkscape:connector-type=3D"orthogonal"
+       inkscape:connector-curvature=3D"0" />
+    <text
+       xml:space=3D"preserve"
+       style=3D"font-style:normal;font-variant:normal;font-weight:bold;f=
ont-stretch:normal;font-size:12px;line-height:87%;font-family:'Nimbus Mon=
o PS';-inkscape-font-specification:'Nimbus Mono PS, Bold';font-variant-li=
gatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-=
variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;fill:#e6e6e6;s=
troke:#000000;stroke-width:0.462;stroke-linejoin:bevel;stroke-miterlimit:=
0"
+       x=3D"103.50089"
+       y=3D"423.42221"
+       id=3D"text14"><tspan
+         sodipodi:role=3D"line"
+         id=3D"tspan14"
+         x=3D"103.50089"
+         y=3D"423.42221" /></text>
+  </g>
+  <style
+     type=3D"text/css"
+     id=3D"style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

--=20
2.54.0


