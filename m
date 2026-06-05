Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B2ACD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8011.1780665987144704548
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CHUgKAuh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A181C58478
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A56215FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FF7B106A244E;
	Fri,  5 Jun 2026 15:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AhkGjlIPVyYQ3iaQBr1IOv5X302BBKmxlu/hvif0fqs=;
	b=CHUgKAuhsbOjd5Y6bwWZEtyh0jq7EDmlXmxcoqt3PwmYi9nh5MchaqrixBP3F4LNMeGTAD
	1QOhxcTh49uYCDN8j5u31cBwFMDUXLZzw3cNgftDlsnKXAU9eW7tRYTRqHfuEpdUG1YFwz
	aGwbCJY4MpynOWmjwYlqspYGRt8mbchYGcU16LjYYeLkp3/YCipOA20BvL0Xri53nk2l0W
	SnmSBEdKj+ma3bviZ4IenoRmPmiAddVG/W2DBot0ArfzUkC6dj2X6CrGYlpzStkdEDtf7E
	CjVoKe0ZE7sL57J/Br6ek41sveLAMCqkkyMXoDkGK2e98L7/9EsB7m7gzkJhgg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:11 +0200
Subject: [PATCH 07/10] overview-manual/concepts: layer-input.png: convert
 to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-udpate-outdated-graphics-v1-7-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=168805;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=F5D2A/+yO742CmXKlXBmcFmh3/D2z3hT4zs1F3byp6w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs55M0pFO3cmR8d7i350uhySS6M/4mun5B3lf
 fmVaPXLCzCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeQAKCRDRgEFAKaOo
 NvxbD/45waBZu7t38QQT8FEv2d+0gHoo0KBV37tq3e+PdyFHfG0K0PGA+U5vjwabjvvcckTfE4I
 eeh+BHyGuu2LApLh+e9MicyPlfDeYIUufaPK3/djDZucHOB+dheyrIGPARfpI3MtqpLDfQ1hdTy
 oBvjlxQR13tBU39T0fLvemc4iauMAft3bhn7Prdv3ATHTbf0+F4XzWT4lUNV8k5U/gwUXWTPlKx
 /1WDUcyoEeE24kd0BI6B9TgELQcHfBGrLqGkB8OYt80zpn2jygnbi59JZVBQAKQuqGg0m44n2pm
 avP6QNbIRDxo2oXvgQWI9pRxONcM23grZXGs1IjHqtIWiesvnT3sOQjVm8sfqGg93/kVXaUdD6i
 zSpRE8GrF9DxOBKSEOzEWMHWebukZtJKFCqHR9ohijtAlNwGZQVqE88F7WyTGjyxKD9RUl0LFIk
 wZaqI03HU7YgOwGXR6xOV4eeNBPZZdImTRD8C3+6IY0sRS4xJbbn44SghHW9qjFX+D955r/Rcqh
 McNh9elzM0GRRK3EZZgxLjy2gWhOyJ0M8638jOC35nuaCbID6Jr9YGX0RUjCBE9z7+q7sJvKKk+
 lagDf+VtR8rC34YQwXMJ8xA8iWHHDKRrdjPtcKTHOdQ8dTz0J+i/inV+XJ+dWZywW2HV26BPmaR
 QMI69licKLpAvUQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9597

Slightly simplify the content of the layers, we don't need to put too
much at this point, but focus on the essential for each layer type.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    5 +-
 .../overview-manual/figures/layer-input.png        |  Bin 62330 -> 0 bytes
 documentation/overview-manual/svg/layer-input.svg  | 1375 ++++++++++++++++++++
 3 files changed, 1377 insertions(+), 3 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index c30b39680..16d3f2ef5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -353,9 +353,8 @@ The following figure shows an expanded representation of these three
 layers from the :ref:`general workflow figure
 <overview-manual/concepts:openembedded build system concepts>`:
 
-.. image:: figures/layer-input.png
-   :align: center
-   :width: 70%
+.. image:: svg/layer-input.*
+   :width: 100%
 
 In general, all layers have a similar structure. They all contain a
 licensing file (e.g. ``COPYING.MIT``) if the layer is to be distributed,
diff --git a/documentation/overview-manual/figures/layer-input.png b/documentation/overview-manual/figures/layer-input.png
deleted file mode 100644
index 29b56f9ea14a62512591cd42b003071c47eb6982..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 62330
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
HQ$iB}#RF;N

diff --git a/documentation/overview-manual/svg/layer-input.svg b/documentation/overview-manual/svg/layer-input.svg
new file mode 100644
index 000000000..d38b63edb
--- /dev/null
+++ b/documentation/overview-manual/svg/layer-input.svg
@@ -0,0 +1,1375 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="836.73132"
+   height="509.81702"
+   viewBox="0 0 836.73133 509.81692"
+   sodipodi:docname="layer-input.svg"
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
+     inkscape:zoom="0.72360225"
+     inkscape:cx="293.66962"
+     inkscape:cy="301.27048"
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
+       originx="178.57298"
+       originy="-64.079425"
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
+    <marker
+       style="overflow:visible"
+       id="Triangle-3"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path135-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3-8-8-3-8-7-3-9-0-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8-8-9-3-8-7-0-2-5-3" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(178.57299,-64.079458)">
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
+       transform="matrix(3.2001899,0,0,4.5594279,106.93594,-145.15192)">
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6"
+         width="85.459282"
+         height="16.100845"
+         x="82.46244"
+         y="121.28174"
+         ry="0" />
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6-5"
+         width="43.75544"
+         height="29.230095"
+         x="70.012787"
+         y="114.7747"
+         ry="0" />
+      <rect
+         style="fill:none;stroke-width:1.04717;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:1.56435, 0.391086"
+         id="rect38"
+         width="2.4428642"
+         height="4.9294968"
+         x="174.2934"
+         y="142.71315" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="370.07501"
+       y="408.16873"
+       id="text1185-3-5-5-9-7"
+       transform="scale(1.0155894,0.9846499)"><tspan
+         sodipodi:role="line"
+         x="370.07501"
+         y="408.16873"
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
+       x="330.64996"
+       y="254.67113" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:136.623;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="376.14267"
+       y="175.59077"
+       id="text1185-3-5-5-9-7-5"
+       transform="matrix(1.0155894,0,0,0.9846499,18.797342,114.06798)"><tspan
+         x="376.14267"
+         y="175.59077"
+         id="tspan3"><tspan
+   style="font-weight:normal;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';stroke:none"
+   id="tspan1">bitbake</tspan><tspan
+   y="175.59077"
+   id="tspan4"> </tspan></tspan><tspan
+         x="376.14267"
+         y="197.60678"
+         id="tspan6"><tspan
+           style="font-weight:normal;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';stroke:none"
+           id="tspan5">&lt;target&gt;</tspan></tspan></text>
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
+       id="rect917-0-6-4-8-7"
+       width="343.88348"
+       height="463.28125"
+       x="-159.11691"
+       y="93.742638"
+       ry="4.3906641" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-4-8"
+       width="138.29491"
+       height="225.92346"
+       x="-151.68781"
+       y="114.90145"
+       ry="3.0258784" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-153.47014"
+       y="105.21461"
+       id="text1185-3-5-5-9-7-4-9-5-5"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-153.47014"
+         y="105.21461"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0-7">Distro Layer</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-12.823189"
+       y="84.563988"
+       id="text1185-3-5-5-9-7-4-9-5-5-2"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-12.823189"
+         y="84.563988"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0-7-2">Layers</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8-7-3-9-0)"
+       d="m 388.46786,376.85818 -0.0643,-42.81902"
+       id="path5151-2-6-3-6-1-4-8-9-4-0-4-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3-8-8-3-8-7-3-9-0-9)"
+       d="M 386.07519,252.50648 V 208.53231"
+       id="path5151-2-6-3-6-1-4-8-9-4-0-4-4-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-144.36678"
+       y="127.38634"
+       id="text1185-3-5-5-9-7-4-3-6-1-36-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="127.38634"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan13-5">COPYING.MIT</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="138.49747"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan14">README</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="149.60858"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan15">classes/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="160.71971"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan16">  &lt;class1&gt;.bbclass</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="171.83084"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan17">  &lt;class2&gt;.bbclass</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="182.94196"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan18">conf/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="194.05309"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan19">  layer.conf</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="205.16422"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan20">  distro/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="216.27533"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan21">    &lt;distro1&gt;.conf</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="227.38646"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan22">    &lt;distro2&gt;.conf</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="238.49759"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan23">    include/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="249.6087"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan24">      *.inc</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="260.71985"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan25">recipes-*/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="271.83096"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan26">  &lt;recipe1&gt;/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="282.94208"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan27">    &lt;recipe1&gt;.bb</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="294.05322"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan28">  &lt;recipe2&gt;/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="305.16434"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan29">    &lt;recipe2&gt;.bbappend</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="316.27545"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan31">    files/</tspan><tspan
+         sodipodi:role="line"
+         x="-144.36678"
+         y="327.3866"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan32">      config</tspan></text>
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-4-8-2"
+       width="134.38609"
+       height="174.62024"
+       x="-149.21552"
+       y="362.79489"
+       ry="3.0258784" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-150.94389"
+       y="347.81195"
+       id="text1185-3-5-5-9-7-4-9-5-5-5"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-150.94389"
+         y="347.81195"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0-7-86">Software Layer</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-141.89711"
+       y="375.5433"
+       id="text1185-3-5-5-9-7-4-3-6-1-36-4-2"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="375.5433"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan13-5-8">COPYING.MIT</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="386.65442"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan14-4">README</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="397.76556"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan15-7">classes/</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="408.87668"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan16-2">  &lt;class1&gt;.bbclass</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="419.98779"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan17-4">  &lt;class2&gt;.bbclass</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="431.09894"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan18-0">conf/</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="442.21005"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan24-3">  layer.conf</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="453.32117"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan25-11">recipes-*/</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="464.43231"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan26-03">  &lt;recipe1&gt;/</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="475.54343"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan27-4">    &lt;recipe1&gt;.bb</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="486.65454"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan28-0">  &lt;recipe2&gt;/</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="497.76569"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan29-3">    &lt;recipe2&gt;.bbappend</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="508.8768"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan31-9">    files/</tspan><tspan
+         sodipodi:role="line"
+         x="-141.89711"
+         y="519.98792"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan32-1">      *.patch</tspan></text>
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-4-8-5"
+       width="172.00844"
+       height="204.91357"
+       x="0.51944679"
+       y="113.33718"
+       ry="3.0258784" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="2.0599082"
+       y="103.68375"
+       id="text1185-3-5-5-9-7-4-9-5-5-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="2.0599082"
+         y="103.68375"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0-7-8">BSP Layer</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="7.6788816"
+       y="125.82041"
+       id="text1185-3-5-5-9-7-4-3-6-1-36-4-1"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="125.82041"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan13-5-2">COPYING.MIT</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="136.93153"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan17-6">README</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="148.04266"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan18-8">conf/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="159.15379"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan19-0">  layer.conf</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="170.26491"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan20-2">  machine/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="181.37604"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan21-1">    &lt;machine1&gt;.conf</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="192.48717"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan22-0">    &lt;machine2&gt;.conf</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="203.59828"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan23-5">    include/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="214.70941"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan24-1">      *.inc</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="225.82054"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan25-1">recipes-bsp/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="236.93166"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan26-0">  &lt;recipe&gt;/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="248.04279"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan27-8">    &lt;recipe&gt;.bb</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="259.1539"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan34">recipes-kernel/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="270.26505"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan28-5">  linux/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="281.37616"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan29-0">    linux_&lt;version&gt;.bbappend</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="292.48727"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan31-6">    files/</tspan><tspan
+         sodipodi:role="line"
+         x="7.6788816"
+         y="303.59842"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan32-4">      defconfig</tspan></text>
+    <text
+       xml:space="preserve"
+       transform="translate(-69.846747,-14.267592)"
+       id="text37"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:16px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect37);display:inline;fill:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388;stroke-dashoffset:0" />
+    <path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3)"
+       d="m 184.5757,184.0384 137.81713,0.27285"
+       id="path5151-1-2-3-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0.868487;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-4-8"
+       width="131.83028"
+       height="84.126274"
+       x="337.64594"
+       y="144.72722"
+       ry="4.3906641" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-4"
+       width="113.86481"
+       height="49.538158"
+       x="345.07504"
+       y="165.88602"
+       ry="3.0258784" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="354.13788"
+       y="155.10992"
+       id="text1185-3-5-5-9-7-4-9-5"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="354.13788"
+         y="155.10992"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0">Build Directory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="202.70947"
+       y="140.15742"
+       id="text1185-3-5-5-9-7-4-9-5-56"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="202.70947"
+         y="140.15742"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.33333px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-0-6">Metadata</tspan><tspan
+         sodipodi:role="line"
+         x="202.70947"
+         y="154.25389"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.33333px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan38">Machine BSP Configuration</tspan><tspan
+         sodipodi:role="line"
+         x="202.70947"
+         y="168.35036"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.33333px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan39">Policy Configuration</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="357.23688"
+       y="184.29456"
+       id="text1185-3-5-5-9-7-4-3-6-1-36"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="357.23688"
+         y="184.29456"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan43-3">conf/</tspan><tspan
+         sodipodi:role="line"
+         x="357.23688"
+         y="195.40569"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;fill:#000000;stroke:none;stroke-width:1.42682px"
+         id="tspan13">  bblayers.conf</tspan></text>
+  </g>
+  <style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

-- 
2.54.0


