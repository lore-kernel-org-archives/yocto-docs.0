Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDEACD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8010.1780665986175456598
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A5uKtX9i;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 634F6C5847A
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B00785FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A66BC106A2447;
	Fri,  5 Jun 2026 15:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dUw+blTgs+h24NRfbny9yAHu0N0zz+u8s/c4eZ+yv0M=;
	b=A5uKtX9ipX/8+OTuKrkYL1ebghOY5TjHNFhuzuxMI9R8LYEsXocL3d0sXrHoIdqZuYxEq7
	rQW5V3mf3SEBDkkASazypiLjsv7L3h5/y18JGvmkP0r6/hGQ0vrhQv0lgvf4Xu5mVJ2A8u
	t9Rjic5A4206Vh6icFpWmIUnOybQRFt6XN3tlItG6OO6LoD7B1Czkws1KUjIqGu2oQpZ8b
	KCGNjS917DJOTZ8d6UJ3JYH3EydHfoEeKvfxQK9J8LS4/Z1rK0QI55eD2Utqsi0WDWT63F
	abzET51cQpl0vVY7BQL6rpv3nS2PKBhoahXHgDtoKMi4bKm8sKkaMaO2dcqkhg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:10 +0200
Subject: [PATCH 06/10] overview-manual/concepts: user-configuration.png:
 convert to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-udpate-outdated-graphics-v1-6-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=129855;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MqwJr/IPJOaAlhVWlzWHzRbPRvD+mWGJbr/e1Tad9qs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs55UNgnFsRX8YItRMnrpVs7oeLl36Fy1ovuC
 Bd8q9HK3keJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeQAKCRDRgEFAKaOo
 NugFD/9v/zb/8LVr9kwLDYg1IPqVG0hMHNonSmtVYDgS/ntBfWybNeuek2/1v1igq8kJLLTXcM0
 i32zmkQYI2JwT7pFo1/08PH6FbSWFZ2XhouY6b6lu6NfToFjQqZfb4HVHN2kvpor9sSawDejJAL
 HbNj/XrDVHZchmMuUDpQ2ekin/HoCgR4rFy4w6SywMz7S7N01uKSN5MPwhQH4bMESmic0xWA6uO
 d92Dg7R8KniA6oZT/rWjeNY7uiFBkx6VFNKpEK2TklXlBnqj/uCK5jSB7RTTHxc215+VmtYRCxz
 QLmJ3wGbDcKXA40wh/FLf0iptkPvlQmX5IsMRHJDpyQ3IgHV3EGctO6bJCi/kO76yqnyBT0Lhiz
 S3O+MSVhNbjg67FOx3+LM2ekcderOaMGl+mjJeoaNFUmt2R46bBPG6DmcANl7tXLjQaN/oJ9Iay
 5eXgSydId86rVUgPw/QN9H/zhyeq/blc8b4QzInBOBCaWw4oMBujBWiJC9+oGmI0Ubm1VmNXg4g
 m9G9c0fy0TuRXqcTPcbiyVAks/SorkmT8AUQbKA1iOun8lmw2rlFCsAvY7pyk1G8J+/vR6biryD
 WplWz9t0tV+ESPSrLGcojXqdziQKYB8mPRhnTlSGCCaz+djTHaasYnRDUeqyM64D2e1YihVGwLh
 FBLu3a0UqEuL2vQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9596

Convert to an SVG and update to new directory layout after Poky's
removal (as a repository). Mention oe-init-build-env and bitbake-setup
for setting up the build directory.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/user-configuration.png |  Bin 51171 -> 0 bytes
 .../overview-manual/svg/user-configuration.svg     | 1162 ++++++++++++++++++++
 3 files changed, 1163 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4cb7a17a9..c30b39680 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -205,7 +205,7 @@ The following figure shows an expanded representation of the "User
 Configuration" box of the :ref:`general workflow
 figure <overview-manual/concepts:openembedded build system concepts>`:
 
-.. image:: figures/user-configuration.png
+.. image:: svg/user-configuration.*
    :width: 100%
 
 BitBake needs some basic configuration files in order to complete a
diff --git a/documentation/overview-manual/figures/user-configuration.png b/documentation/overview-manual/figures/user-configuration.png
deleted file mode 100644
index 142454715bd722beea85a45a3819d3fb3e8b4642..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 51171
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
X|7uzo-Ppmt6%=Tmu6{1-oD!M<@_VL8

diff --git a/documentation/overview-manual/svg/user-configuration.svg b/documentation/overview-manual/svg/user-configuration.svg
new file mode 100644
index 000000000..566d5c062
--- /dev/null
+++ b/documentation/overview-manual/svg/user-configuration.svg
@@ -0,0 +1,1162 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="948.67126"
+   height="468.35776"
+   viewBox="0 0 948.67127 468.35767"
+   sodipodi:docname="user-configuration.svg"
+   inkscape:version="1.4.4 (dcaf3e7d9e, 2026-05-05)"
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
+     inkscape:window-width="3826"
+     inkscape:window-height="1718"
+     id="namedview4"
+     showgrid="false"
+     inkscape:zoom="2.0466562"
+     inkscape:cx="451.71241"
+     inkscape:cy="234.52889"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="0"
+     inkscape:current-layer="g10"
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
+       originx="293.2769"
+       originy="-59.9335"
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
+       x="259.81125"
+       y="653.67401"
+       width="812.60114"
+       height="444.99585"
+       id="rect37" />
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
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3-8" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3-8-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3-8-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3-8-7-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3-8-7-0" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3-8-7-3-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3-8-7-0-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3-8-7-3-9-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3-8-7-0-2-5" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(293.2769,-59.93353)">
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="142.22464"
+       y="565.10297"
+       id="text907"><tspan
+         sodipodi:role="line"
+         id="tspan905"
+         x="142.22464"
+         y="565.10297" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="98.363503"
+       y="637.8432"
+       id="text911"><tspan
+         sodipodi:role="line"
+         id="tspan909"
+         x="98.363503"
+         y="637.8432" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-59.575905"
+       y="580.05695"
+       id="text915"><tspan
+         sodipodi:role="line"
+         id="tspan913"
+         x="-59.575905"
+         y="580.05695" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="313.46567"
+       y="412.9321"
+       id="text3781"><tspan
+         sodipodi:role="line"
+         id="tspan3779"
+         x="313.46567"
+         y="412.9321" /></text>
+    <g
+       id="g72820-3"
+       transform="matrix(3.2001899,0,0,4.5594279,34.297645,-252.64432)">
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6"
+         width="109.58257"
+         height="27.67444"
+         x="80.324936"
+         y="126.42556"
+         ry="0" />
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6-5"
+         width="46.503666"
+         height="52.3773"
+         x="70.012787"
+         y="114.7747"
+         ry="0" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="298.55176"
+       y="299.00058"
+       id="text1185-3-5-5-9-7"
+       transform="scale(1.0155894,0.9846499)"><tspan
+         sodipodi:role="line"
+         x="298.55176"
+         y="299.00058"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.31058px"
+         id="tspan60047-3">BitBake</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-16.290483"
+       y="345.7359"
+       id="text3116"><tspan
+         sodipodi:role="line"
+         id="tspan3114"
+         x="-16.290483"
+         y="345.7359" /></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-6"
+       width="140.21204"
+       height="79.409477"
+       x="272.01169"
+       y="147.17873" />
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-6-5"
+       width="149.00687"
+       height="79.40947"
+       x="81.937431"
+       y="75.75824" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:136.623;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="376.14267"
+       y="175.59077"
+       id="text1185-3-5-5-9-7-5"
+       transform="matrix(1.0155894,0,0,0.9846499,-39.840963,6.5755685)"><tspan
+         x="376.14267"
+         y="175.59077"
+         id="tspan31"><tspan
+   style="font-weight:normal;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';stroke:none"
+   id="tspan2">bitbake</tspan><tspan
+   y="175.59077"
+   id="tspan32"> </tspan></tspan><tspan
+         x="376.14267"
+         y="197.60678"
+         id="tspan34"><tspan
+           style="font-weight:normal;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';stroke:none"
+           id="tspan33">&lt;target&gt;</tspan></tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-6-7"
+       width="183.209"
+       height="87.715721"
+       x="29.442005"
+       y="398.23544" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:166.451;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="391.05667"
+       y="175.59077"
+       id="text1185-3-5-5-9-7-5-5"
+       transform="matrix(1.0155894,0,0,0.9846499,-271.78016,252.78567)"><tspan
+         x="391.05667"
+         y="175.59077"
+         id="tspan37"><tspan
+           style="font-weight:normal;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';stroke:none"
+           id="tspan35">oe-init-build-env
+</tspan></tspan><tspan
+         x="391.05667"
+         y="197.60678"
+         id="tspan39"><tspan
+   style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal'"
+   id="tspan38">or</tspan>
+</tspan><tspan
+         x="391.05667"
+         y="217.60678"
+         id="tspan41"><tspan
+           style="font-weight:normal;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';stroke:none"
+           id="tspan40">bitbake-setup</tspan></tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:136.623;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="376.14267"
+       y="175.59077"
+       id="text1185-3-5-5-9-7-5-7"
+       transform="matrix(1.0155894,0,0,0.9846499,-226.25713,-61.694028)"><tspan
+         x="376.14267"
+         y="175.59077"
+         id="tspan43"><tspan
+   style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+   id="tspan42">User configuration</tspan><tspan
+   y="175.59077"
+   id="tspan44"> </tspan></tspan><tspan
+         x="376.14267"
+         y="195.59077"
+         id="tspan46"><tspan
+           style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+           id="tspan45">Edits</tspan></tspan></text>
+    <text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text2"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:119%;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect2);display:inline;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none" />
+    <text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text28"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:119%;font-family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono';text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect28);display:inline;fill:#808080;fill-opacity:1;stroke:#deddda;stroke-width:1.893;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0.868487;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-4-8"
+       width="200.23453"
+       height="160.34816"
+       x="17.351446"
+       y="201.47566"
+       ry="4.3906641" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-4"
+       width="180.31467"
+       height="129.66887"
+       x="24.780554"
+       y="222.63448"
+       ry="3.0258784" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="26.850668"
+       y="210.64598"
+       id="text1185-3-5-5-9-7-4-9-5"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="26.850668"
+         y="210.64598"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0">Build Directory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="48.020943"
+       y="259.68994"
+       id="text1185-3-5-5-9-7-4-3-6-1-36"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="48.020943"
+         y="259.68994"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan43-3">conf/</tspan><tspan
+         sodipodi:role="line"
+         x="48.020943"
+         y="270.80106"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan7">  bblayers.conf</tspan><tspan
+         sodipodi:role="line"
+         x="48.020943"
+         y="281.9122"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan9">  local.conf</tspan><tspan
+         sodipodi:role="line"
+         x="48.020943"
+         y="293.02332"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#666666;stroke:none;stroke-width:1.42682px"
+         id="tspan10">  site.conf</tspan><tspan
+         sodipodi:role="line"
+         x="48.020943"
+         y="304.13443"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#666666;stroke:none;stroke-width:1.42682px"
+         id="tspan11">  auto.conf</tspan><tspan
+         sodipodi:role="line"
+         x="48.020943"
+         y="315.24557"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#666666;stroke:none;stroke-width:1.42682px"
+         id="tspan13">  toolcfg.conf</tspan></text>
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0.868487;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-4-8-7"
+       width="232.48225"
+       height="181.84663"
+       x="-277.35855"
+       y="165.07851"
+       ry="4.3906641" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-4-8"
+       width="215.98259"
+       height="150.19016"
+       x="-269.92944"
+       y="186.23732"
+       ry="3.0258784" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-274.29309"
+       y="175.02643"
+       id="text1185-3-5-5-9-7-4-9-5-5"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-274.29309"
+         y="175.02643"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0-7">Source Directory</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8)"
+       d="m 14.681371,215.86387 -227.759001,0.10332"
+       id="path5151-2-6-3-6-1"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:5.97552, 1.49388;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8)"
+       d="M 28.362223,456.74458 -130.92198,294.04017"
+       id="path5151-2-6-3-6-1-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:5.97552, 1.49388;stroke-dashoffset:0;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3)"
+       d="M 28.101141,424.27166 -131.18306,261.56725"
+       id="path5151-2-6-3-6-1-4-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8)"
+       d="m 122.17378,364.88744 0.4886,33.71352"
+       id="path5151-2-6-3-6-1-4-8-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8-7)"
+       d="m 194.97545,157.72026 -0.19294,43.71248"
+       id="path5151-2-6-3-6-1-4-8-9-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8-7-3)"
+       d="M 143.18366,199.25141 V 155.76585"
+       id="path5151-2-6-3-6-1-4-8-9-4-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8-7-3-9)"
+       d="m 270.22013,215.86387 h -53.2576"
+       id="path5151-2-6-3-6-1-4-8-9-4-0-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8-7-3-9-0)"
+       d="M 329.82956,269.61008 V 225.63591"
+       id="path5151-2-6-3-6-1-4-8-9-4-0-4-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-246.37614"
+       y="218.85201"
+       id="text1185-3-5-5-9-7-4-3-6-1-36-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="218.85201"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan25">build/</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="229.96313"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan26">layers/</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="241.07425"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19">  bitbake/</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="252.18538"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan30">    ...</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="263.29651"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan36">    bin/bitbake-setup</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="274.40762"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan27">  openembedded-core/</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="285.51877"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan28">    ...</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="296.62988"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan29">    oe-init-build-env</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="307.741"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan23">  yocto-docs/</tspan><tspan
+         sodipodi:role="line"
+         x="-246.37614"
+         y="318.85214"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan13-5">  meta-yocto/</tspan></text>
+    <rect
+       style="fill:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0"
+       id="rect29"
+       width="0.97720367"
+       height="1.9544073"
+       x="19.078791"
+       y="419.12225"
+       ry="0.48860183" />
+    <text
+       xml:space="preserve"
+       transform="translate(-69.846747,-14.267592)"
+       id="text37"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect37);display:inline;fill:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388;stroke-dashoffset:0" />
+  </g>
+  <style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

-- 
2.54.0


