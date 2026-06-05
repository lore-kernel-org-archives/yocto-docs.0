Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A537CD8C85
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8009.1780665985235658096
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=OuGndiEs;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 707DCC58479
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCA5D5FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE360106A21AE;
	Fri,  5 Jun 2026 15:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JBC4GxUZgp7NjRoT4rk070wI5k7ofZ/BKz15+JLw2qM=;
	b=OuGndiEsz4KiWBm0aEHSnr9m8FWiw9GKVWqq8g2I3mr7/AiXMPZxHGByf1UjGWn47bNHxC
	C+B1uIbnObceDoIrsy7VZFQRKY0yjFhzvfe8wat+6ey59Heht9s/xPJ0w6NaCCyENB6G+Q
	90Sz0ZfJkshEAKYn19DguHs47mn+ZDdYQqpwC3haQlYucIhr6H5fwQrsXouoDJ3WQrEr3k
	dnsALhXzUTHBdF6V/v+zTTLfwSXmoCjXGjQOYPXlkESa1jCWSKacBnGp0SVU5oKff+MP+h
	vVu8biUUM/lYcKfs8f83omSkfA6aCXyMhmBk9YcwIXKKYX+FBtC6SwtzjycJmA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:09 +0200
Subject: [PATCH 05/10] overview-manual/concepts:
 cross-development-toolchains.png: convert to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-udpate-outdated-graphics-v1-5-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=264876;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wFnkgmIwT//1veY3ry9avPKNgt6eJ4cK6mMrtDSc1Co=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs55u1OR5wT6wV6XAuQraivKUy2RwAIixt8I9
 aJMFYavZHWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeQAKCRDRgEFAKaOo
 Nm4lD/40iqAzHtPK5SzWIRjUj3mC2tkgtXL0F7gCnF5UPcHG7FJ1my/68f00/fVktxeUbITuqCG
 8G3Rr/+p/65evd82RagsGUM3lXBtG1I7kBezHLMBHrvj0Kg2JdoQG5ZTZCpS+zrZZuXNQterodA
 UF6tdIVREFoyp/5XRxWraPuNym66fT2kGoFFqCkne2zRpZcA9BYdFY8fhB06o4ibKNY2oCOmKB3
 +hJWAh+eo0WO6t8SD+V8xTrZzIEiu1DAS6qVvDrkTqeCS/inJBiJHDWnoQ+cPaYXOQcpLpQSW6W
 9ruZ0BUQpffL5Jz/lWkNJ2SXW++qQH3w9SAgnACf9uHS/nc4jWNijr0SYnpyQDR2007a0I0gepP
 fJTFirdpFnI8pJiEBsQWiOmPddQLg96h5LtQQC/b3gSJCDWw2tfQy26D6NT97AI72BGsqjBTyWc
 zfmsnKyQvGjDhsCEP15qYqauMfdx0ySHCCyio4nARRDOYFAaNPNjvRbm/7KU+Js2t8fljwbrZ2d
 Cd3inzurqMJvFZSg+wpubfUn1WwdpYRKaA6J6FlHw3rEJTODyyzeqrV64QgtJR489XctQ/+jSHR
 EYLI6tJRPwInFk/6bZcXQcjSbkex4lGKygzyFZTgdmGeB3VagmwTchMsVo7aSdbGCMKiRoq6+e4
 cUz8gvdpknU94wQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9595

Source of electronic circuit:
https://openclipart.org/detail/275110/circuit-board

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../figures/cross-development-toolchains.png       |  Bin 82633 -> 0 bytes
 .../svg/cross-development-toolchains.svg           | 2136 ++++++++++++++++++++
 3 files changed, 2137 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 4e3c9c23f..4cb7a17a9 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1427,7 +1427,7 @@ creates these necessary toolchains for you.
 The following figure shows a high-level build environment regarding
 toolchain construction and use.
 
-.. image:: figures/cross-development-toolchains.png
+.. image:: svg/cross-development-toolchains.*
    :width: 100%
 
 Most of the work occurs on the Build Host. This is the machine used to
diff --git a/documentation/overview-manual/figures/cross-development-toolchains.png b/documentation/overview-manual/figures/cross-development-toolchains.png
deleted file mode 100644
index cbe8371c057834466cb02fe0ddf98547d46aa179..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 82633
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
a?Vr8Z`PAsQwwQr|fx*+&&t;ucLK6U6yR(}B

diff --git a/documentation/overview-manual/svg/cross-development-toolchains.svg b/documentation/overview-manual/svg/cross-development-toolchains.svg
new file mode 100644
index 000000000..9a69fe342
--- /dev/null
+++ b/documentation/overview-manual/svg/cross-development-toolchains.svg
@@ -0,0 +1,2136 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="861.25604"
+   height="732.56262"
+   viewBox="0 0 861.25605 732.56251"
+   sodipodi:docname="cross-development-toolchains.svg"
+   inkscape:version="1.4.4 (dcaf3e7d9e, 2026-05-05)"
+   xml:space="preserve"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns:xlink="http://www.w3.org/1999/xlink"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg"
+   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
+   xmlns:cc="http://creativecommons.org/ns#"
+   xmlns:dc="http://purl.org/dc/elements/1.1/"><sodipodi:namedview
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
+     inkscape:zoom="1.4142136"
+     inkscape:cx="229.8097"
+     inkscape:cy="298.39905"
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
+     inkscape:deskcolor="#d1d1d1"
+     inkscape:connector-spacing="4"
+     showguides="false"><inkscape:grid
+       type="xygrid"
+       id="grid1257"
+       originx="711.08637"
+       originy="-184.83385"
+       spacingy="1"
+       spacingx="1"
+       units="px"
+       visible="false" /></sodipodi:namedview><metadata
+     id="metadata8"><rdf:RDF><cc:Work
+         rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
+           rdf:resource="http://purl.org/dc/dcmitype/StillImage" /></cc:Work></rdf:RDF></metadata><defs
+     id="defs6"><marker
+       style="overflow:visible"
+       id="Triangle"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path135" /></marker><linearGradient
+       id="linearGradient1"
+       inkscape:collect="always"><stop
+         style="stop-color:#fafafa;stop-opacity:1;"
+         offset="0"
+         id="stop1" /><stop
+         style="stop-color:#bebebe;stop-opacity:1;"
+         offset="1"
+         id="stop2" /></linearGradient><rect
+       x="264.33359"
+       y="250.16414"
+       width="500.81689"
+       height="466.12616"
+       id="rect19" /><rect
+       x="695.28046"
+       y="296.58133"
+       width="394.3017"
+       height="334.69226"
+       id="rect37" /><rect
+       x="-345.93011"
+       y="-568.73254"
+       width="776.87695"
+       height="667.43011"
+       id="rect28" /><rect
+       x="23.839064"
+       y="148.04404"
+       width="87.237152"
+       height="79.809036"
+       id="rect2" /><inkscape:path-effect
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
+       message="" /><marker
+       style="overflow:visible"
+       id="marker5783"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781" /></marker><marker
+       style="overflow:visible"
+       id="marker5623"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5621" /></marker><marker
+       style="overflow:visible"
+       id="marker5487"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5485" /></marker><marker
+       style="overflow:visible"
+       id="marker5285"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283" /></marker><marker
+       style="overflow:visible"
+       id="marker5161"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159" /></marker><marker
+       style="overflow:visible"
+       id="marker4860"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4858" /></marker><marker
+       style="overflow:visible"
+       id="marker4504"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4502" /></marker><marker
+       style="overflow:visible"
+       id="Arrow1Mend"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Mend"
+       inkscape:isstock="true"><path
+         transform="matrix(-0.4,0,0,-0.4,-4,0)"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:1pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path3318" /></marker><marker
+       style="overflow:visible"
+       id="marker4174"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4172" /></marker><marker
+       style="overflow:visible"
+       id="Arrow2Mend"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3336" /></marker><marker
+       style="overflow:visible"
+       id="Arrow1Mstart"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Mstart"
+       inkscape:isstock="true"><path
+         transform="matrix(0.4,0,0,0.4,4,0)"
+         style="fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:1pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path3315" /></marker><marker
+       style="overflow:visible"
+       id="Arrow2Lstart"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Lstart"
+       inkscape:isstock="true"><path
+         transform="matrix(1.1,0,0,1.1,1.1,0)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3327" /></marker><marker
+       style="overflow:visible"
+       id="Arrow1Lstart"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow1Lstart"
+       inkscape:isstock="true"><path
+         transform="matrix(0.8,0,0,0.8,10,0)"
+         style="fill:#ff7800;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:1pt;stroke-opacity:1"
+         d="M 0,0 5,-5 -12.5,0 5,5 Z"
+         id="path3309" /></marker><linearGradient
+       id="linearGradient921"
+       inkscape:swatch="solid"><stop
+         style="stop-color:#deddda;stop-opacity:1;"
+         offset="0"
+         id="stop919" /></linearGradient><linearGradient
+       id="linearGradient6035-4"><stop
+         id="stop6037-2"
+         style="stop-color:#ffffff"
+         offset="0" /><stop
+         id="stop6039-9"
+         style="stop-color:#ffffff;stop-opacity:0"
+         offset="1" /></linearGradient><marker
+       style="overflow:visible"
+       id="Arrow2Mstart-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3333-2" /></marker><marker
+       style="overflow:visible"
+       id="Arrow2Mend-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3336-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5623-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5621-3" /></marker><marker
+       style="overflow:visible"
+       id="Arrow2Mend-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#ffa348;fill-opacity:1;fill-rule:evenodd;stroke:#ffa348;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path3336-3" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-3" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-1-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-7-6" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-4-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-3-4" /></marker><marker
+       style="overflow:visible"
+       id="marker4174-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4172-8" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-5" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="marker5161-0"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-4" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-2" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-6-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1-1" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-9" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-9" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-8" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-5"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-6" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-6-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1-15" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-4-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-3-8" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-4" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-3" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-0-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-3-2" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-0-9-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-3-2-0" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-5-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-6-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7-0" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-87" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-2" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-2" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-75" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7-2" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2-6-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7-0-8" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-6-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5285-17-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-45" /></marker><marker
+       style="overflow:visible"
+       id="marker5783-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4" /></marker><marker
+       style="overflow:visible"
+       id="marker5783-8-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-4" /></marker><marker
+       style="overflow:visible"
+       id="marker5783-8-1-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-4-0" /></marker><marker
+       style="overflow:visible"
+       id="marker5783-8-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-5" /></marker><marker
+       style="overflow:visible"
+       id="marker5783-8-9-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-5-1" /></marker><marker
+       style="overflow:visible"
+       id="marker5783-8-9-7-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-5-1-7" /></marker><linearGradient
+       id="linearGradient11801"
+       y2="511.97"
+       spreadMethod="reflect"
+       gradientUnits="userSpaceOnUse"
+       x2="286.63"
+       gradientTransform="matrix(4.9627,0,0,4.9627,278.63,-3355.4)"
+       y1="511.97"
+       x1="269.97"
+       inkscape:collect="always"><stop
+         id="stop5497-7"
+         style="stop-color:#497bb3"
+         offset="0" /><stop
+         id="stop5501-5"
+         style="stop-color:#a5c4e6"
+         offset=".20485" /><stop
+         id="stop5499-8"
+         style="stop-color:#3b5d8b"
+         offset="1" /></linearGradient><linearGradient
+       id="linearGradient11803"
+       y2="527.34003"
+       gradientUnits="userSpaceOnUse"
+       x2="286.63"
+       y1="518.56"
+       x1="282.35999"
+       inkscape:collect="always"><stop
+         id="stop5468-4"
+         style="stop-color:#a5c4e6"
+         offset="0" /><stop
+         id="stop5470-8"
+         style="stop-color:#497bb3"
+         offset="1" /></linearGradient><linearGradient
+       id="linearGradient11805"
+       y2="520.33002"
+       xlink:href="#linearGradient6035-4"
+       spreadMethod="reflect"
+       gradientUnits="userSpaceOnUse"
+       x2="327.78"
+       gradientTransform="matrix(4.1992,0,0,4.1992,407.33,-3062.9)"
+       y1="522.60999"
+       x1="308.5"
+       inkscape:collect="always" /><linearGradient
+       id="linearGradient11807"
+       y2="520.33002"
+       xlink:href="#linearGradient6035-4"
+       spreadMethod="reflect"
+       gradientUnits="userSpaceOnUse"
+       x2="327.78"
+       gradientTransform="matrix(4.1992,0,0,4.1992,407.33,-3015.8)"
+       y1="522.60999"
+       x1="308.5"
+       inkscape:collect="always" /><linearGradient
+       id="linearGradient11809"
+       y2="520.33002"
+       xlink:href="#linearGradient6035-4"
+       spreadMethod="reflect"
+       gradientUnits="userSpaceOnUse"
+       x2="327.78"
+       gradientTransform="matrix(4.1992,0,0,4.1992,407.33,-2971.6)"
+       y1="522.60999"
+       x1="308.5"
+       inkscape:collect="always" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient2"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267"
+       gradientUnits="userSpaceOnUse" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient3"
+       gradientUnits="userSpaceOnUse"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267"
+       gradientTransform="translate(-300.12078,-23.858598)" /><marker
+       style="overflow:visible"
+       id="marker5285-5"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-54" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-76"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-76-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5-1" /></marker><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient2-5"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267"
+       gradientUnits="userSpaceOnUse" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient8"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(1.3396029,0,0,0.90705439,-79.948046,111.97284)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient2-5-1"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267"
+       gradientUnits="userSpaceOnUse" /><marker
+       style="overflow:visible"
+       id="marker5161-76-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5-3" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-76-6-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5-1-4" /></marker><linearGradient
+       id="linearGradient11803-7"
+       y2="527.34003"
+       gradientUnits="userSpaceOnUse"
+       x2="286.63"
+       y1="518.56"
+       x1="282.35999"
+       inkscape:collect="always"><stop
+         id="stop5468-4-6"
+         style="stop-color:#a5c4e6"
+         offset="0" /><stop
+         id="stop5470-8-3"
+         style="stop-color:#497bb3"
+         offset="1" /></linearGradient><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient17"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(1.4319561,0,0,1.2585,-502.96422,638.76967)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient18"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(1.3396029,0,0,0.90705439,-79.948046,111.97284)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient11801"
+       id="linearGradient19"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(4.9627,0,0,4.9627,278.63,-3355.4)"
+       x1="269.97"
+       y1="511.97"
+       x2="286.63"
+       y2="511.97"
+       spreadMethod="reflect" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient6035-4"
+       id="linearGradient20"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(4.1992,0,0,4.1992,407.33,-3062.9)"
+       x1="308.5"
+       y1="522.60999"
+       x2="327.78"
+       y2="520.33002"
+       spreadMethod="reflect" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient6035-4"
+       id="linearGradient21"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(4.1992,0,0,4.1992,407.33,-3015.8)"
+       x1="308.5"
+       y1="522.60999"
+       x2="327.78"
+       y2="520.33002"
+       spreadMethod="reflect" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient6035-4"
+       id="linearGradient22"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(4.1992,0,0,4.1992,407.33,-2971.6)"
+       x1="308.5"
+       y1="522.60999"
+       x2="327.78"
+       y2="520.33002"
+       spreadMethod="reflect" /><marker
+       style="overflow:visible"
+       id="marker5161-76-6-05"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5-1-6" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-76-0-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5-3-7" /></marker><marker
+       style="overflow:visible"
+       id="marker5161-76-6-05-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mend"
+       inkscape:isstock="true"><path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5159-5-1-6-6" /></marker><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient23"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(1.4319561,0,0,1.2585,10.064021,640.79911)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><marker
+       style="overflow:visible"
+       id="marker4174-8-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true"><path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#62a0ea;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path4172-8-8" /></marker><marker
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
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path135-3" /></marker><marker
+       style="overflow:visible"
+       id="Triangle-3-4"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid"><path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path135-3-7" /></marker><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient11801"
+       id="linearGradient29"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="matrix(4.9627,0,0,4.9627,278.63,-3355.4)"
+       x1="269.97"
+       y1="511.97"
+       x2="286.63"
+       y2="511.97"
+       spreadMethod="reflect" /></defs><g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(711.08636,-184.83389)"><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="142.22464"
+       y="565.10297"
+       id="text907"><tspan
+         sodipodi:role="line"
+         id="tspan905"
+         x="142.22464"
+         y="565.10297" /></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="98.363503"
+       y="637.8432"
+       id="text911"><tspan
+         sodipodi:role="line"
+         id="tspan909"
+         x="98.363503"
+         y="637.8432" /></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-59.575905"
+       y="580.05695"
+       id="text915"><tspan
+         sodipodi:role="line"
+         id="tspan913"
+         x="-59.575905"
+         y="580.05695" /></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="313.46567"
+       y="412.9321"
+       id="text3781"><tspan
+         sodipodi:role="line"
+         id="tspan3779"
+         x="313.46567"
+         y="412.9321" /></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-16.290483"
+       y="345.7359"
+       id="text3116"><tspan
+         sodipodi:role="line"
+         id="tspan3114"
+         x="-16.290483"
+         y="345.7359" /></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-644.98248"
+       y="213.50513"
+       id="text1185-3-5-5-9-7-4-3-65-0-6"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-644.98248"
+         y="213.50513"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7">Build Host</tspan></text><text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text2"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:119%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect2);display:inline;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none" /><text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text28"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:119%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect28);display:inline;fill:#808080;fill-opacity:1;stroke:#deddda;stroke-width:1.893;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1" /><text
+       xml:space="preserve"
+       style="font-size:10.6667px;line-height:119%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:#ffffff;stroke:#000000;stroke-width:0.59;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
+       x="317.23001"
+       y="281.7269"
+       id="text24"><tspan
+         sodipodi:role="line"
+         id="tspan24"
+         x="317.23001"
+         y="281.7269" /></text><text
+       xml:space="preserve"
+       transform="translate(-47.755547,5.6668655)"
+       id="text37"
+       style="font-size:10.6667px;line-height:119%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect37);display:inline;fill:#ffffff;stroke:#000000;stroke-width:0.59;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0" /><g
+       id="g3-3-4-0-4"
+       transform="matrix(1.4319561,0,0,1.2585,-123.31892,301.26041)"
+       style="fill:url(#linearGradient2);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:url(#linearGradient3);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3"
+         width="424.58508"
+         height="256.60544"
+         x="-398.63571"
+         y="-56.208744"
+         ry="0" /></g><g
+       id="g3-3-4-0-4-0"
+       transform="matrix(1.4319561,0,0,1.2585,-58.667427,314.9454)"
+       style="fill:url(#linearGradient2-5);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:url(#linearGradient8);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.1021;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3-9"
+         width="179.64606"
+         height="91.957306"
+         x="-211.91895"
+         y="82.629501"
+         ry="0" /></g><path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5161-76)"
+       d="m -396.92993,299.38519 h 74.95332"
+       id="path5151"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5161-76-6)"
+       d="m -455.79432,457.06621 102.504,-0.70332"
+       id="path5151-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><text
+       xml:space="preserve"
+       transform="translate(-45.24912,7.4222032)"
+       id="text19"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:9.33333px;line-height:119%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect19);display:inline;fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.5;stroke-linejoin:bevel;stroke-miterlimit:0" /><g
+       id="g3925"
+       transform="matrix(0.25691123,0,0,0.25691123,-762.89678,133.73254)"
+       style="stroke-width:2.42556"><g
+         id="layer1-3-5-2"
+         inkscape:label="Capa 1"
+         transform="matrix(1.1196,0,0,1.1196,-122.82057,267.39056)"
+         style="stroke-width:2.42556"><g
+           id="g10-5-2"
+           transform="matrix(0.0423,0,0,0.0423,319.39,59.128)"
+           class="Graphic"
+           style="stroke-width:2.42556"><g
+             id="g12-4-2"
+             style="stroke-width:2.42556"><g
+               id="g14-64-0"
+               style="fill:#c7c7c7;stroke-width:2.42556"><path
+                 id="path16-1-5"
+                 inkscape:connector-curvature="0"
+                 d="m 5903,2361 c 50,82 34,3995 -31,4149 -51,122 -1703,1495 -1789,1531 -1117,-7 -1870,-414 -1995,-629 -48,-270 -7,-4433 38,-4520 40,-76 2153,-833 2227,-851 67,-15 1493,229 1550,320 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g18-6-5"
+               style="fill:#000000;stroke-width:2.42556"><path
+                 id="path20-8-2"
+                 inkscape:connector-curvature="0"
+                 d="m 5881,2374 2,-1 -2,2 c 0,-1 -1,-1 -1,-1 v -2 l 7,-3 -2,2 -5,1 5,-1 -2,2 z m 2,-1 2,-2 2,-2 5,-2 -5,4 5,-4 h 1 l -6,3 v 1 -1 z m 10,-6 h -1 1 -1 l 11,-6 -10,5 z m 11,-4 -11,4 v -1 z m 20,-15 c -2,-3 -4,-6 -7,-9 -2,-3 -5,-5 -8,-7 -5,-4 -12,-8 -20,-12 -7,-4 -15,-7 -24,-11 -9,-4 -19,-7 -30,-11 -21,-8 -47,-16 -75,-24 -29,-8 -61,-16 -95,-25 -136,-34 -313,-72 -494,-106 -181,-35 -364,-66 -511,-90 -73,-11 -138,-21 -189,-27 -25,-3 -47,-6 -65,-8 -9,-1 -17,-1 -24,-2 -4,0 -7,0 -10,-1 h -9 c -3,0 -5,0 -7,1 h -4 c -2,0 -3,0 -4,1 -2,0 -4,1 -7,2 -2,0 -5,1 -8,2 -3,1 -7,2 -11,3 -4,2 -8,3 -13,5 -10,3 -22,7 -35,12 -13,4 -28,9 -44,15 -33,11 -71,25 -115,40 -43,15 -91,32 -144,51 -209,75 -481,173 -753,274 -271,101 -542,203 -747,285 -51,21 -98,40 -140,57 -43,18 -80,34 -111,48 -16,7 -30,14 -42,20 -13,6 -24,12 -33,17 -5,2 -9,5 -13,7 -4,3 -8,5 -10,7 -4,3 -7,5 -9,7 -5,4 -7,8 -9,11 -1,2 -2,5 -4,9 0,3 -1,6 -1,9 -1,3 -1,7 -2,11 -1,4 -1,8 -2,13 0,9 -1,20 -3,32 0,13 -1,27 -2,42 -2,31 -4,69 -6,111
  -2,43 -4,91 -5,144 -7,213 -14,504 -19,835 -11,662 -19,1482 -19,2144 0,308 2,583 5,791 1,52 2,100 3,143 1,43 3,82 4,115 1,34 3,62 4,85 1,12 2,22 3,30 1,5 1,9 1,13 1,3 2,7 2,10 l 1,4 2,4 c 9,15 20,30 33,46 14,16 30,32 48,49 35,32 80,66 135,101 107,70 249,142 423,207 173,65 377,124 608,167 231,43 489,70 769,72 h 6 l 5,-2 8,-4 c 2,-2 5,-3 8,-6 3,-2 6,-4 10,-6 l 12,-9 c 9,-6 19,-13 30,-22 11,-8 23,-17 37,-28 27,-20 58,-45 93,-73 35,-28 74,-59 116,-93 169,-136 385,-315 600,-497 215,-181 430,-366 593,-512 41,-37 79,-71 113,-103 34,-31 64,-59 89,-84 13,-13 24,-24 34,-35 11,-11 20,-20 28,-29 8,-9 14,-17 19,-23 3,-4 5,-8 7,-10 2,-4 4,-8 6,-11 0,-2 1,-5 2,-8 1,-3 2,-5 3,-9 1,-6 2,-13 3,-22 2,-8 3,-17 4,-28 1,-11 2,-22 3,-35 2,-25 4,-55 7,-89 1,-34 3,-72 5,-113 8,-166 14,-391 19,-648 10,-516 16,-1164 16,-1743 0,-389 -3,-747 -8,-1012 -1,-66 -2,-127 -4,-181 -1,-53 -3,-100 -5,-139 -1,-20 -2,-38 -3,-53 -1,-16 -2,-30 -3,-41 -1,-6 -1,-11 -2,-16 -1,-5 -1,-10 -2,-13 -1,-4 -1,-8 -2,-11 -1,-2 -1,-4 -2,-
 5 -1,-3 -2,-5 -3,-6 z m -37,21 12,-12 z m -6,9 c 1,3 1,7 2,11 0,4 1,9 1,15 1,11 3,24 4,39 0,15 1,33 2,52 2,39 4,86 6,139 1,53 2,114 4,180 5,264 7,622 7,1011 0,578 -5,1227 -15,1742 -6,257 -12,481 -19,646 -2,42 -4,79 -6,113 -2,33 -4,63 -6,88 -1,12 -2,24 -4,34 0,10 -2,18 -3,26 -1,7 -2,14 -3,18 0,3 -1,4 -1,6 0,1 -1,2 -1,2 0,1 -1,2 -2,4 -1,1 -3,4 -4,6 -5,6 -10,13 -17,21 -7,7 -16,17 -26,27 l -34,34 c -25,24 -54,52 -88,83 -33,31 -71,66 -112,102 -163,146 -377,330 -592,512 -215,181 -431,360 -598,495 -42,34 -81,65 -116,93 -35,28 -66,52 -93,73 -13,10 -26,20 -37,28 -10,8 -20,15 -28,21 -4,3 -8,6 -12,8 -3,2 -6,4 -8,6 -2,1 -4,2 -5,3 -276,-2 -528,-29 -755,-71 -228,-42 -429,-100 -600,-164 -169,-64 -308,-134 -413,-202 -51,-33 -94,-66 -128,-97 -17,-15 -31,-30 -43,-44 -10,-12 -19,-23 -26,-34 v -4 c -1,-3 -1,-7 -1,-11 -1,-8 -2,-18 -3,-28 -2,-23 -3,-51 -5,-84 -1,-33 -2,-71 -3,-115 -1,-42 -2,-90 -3,-142 -3,-208 -5,-482 -5,-790 0,-662 7,-1481 18,-2143 6,-330 12,-622 19,-834 2,-53 4,-101 6,-144 2,-42 3,-79 
 5,-109 1,-16 2,-30 3,-42 1,-12 2,-22 3,-31 0,-4 1,-8 1,-11 1,-4 1,-6 2,-9 v -2 c 0,-1 1,-1 2,-2 2,-1 4,-3 7,-5 4,-1 7,-4 11,-6 9,-5 19,-10 31,-16 12,-6 26,-12 41,-19 31,-14 67,-29 109,-47 42,-17 89,-37 140,-57 205,-82 475,-184 746,-284 271,-101 543,-200 752,-274 52,-19 101,-36 144,-51 43,-16 82,-29 114,-40 17,-6 31,-11 44,-16 13,-4 25,-8 35,-11 4,-2 9,-3 13,-4 4,-2 7,-3 10,-4 3,-1 5,-1 8,-2 l 3,-1 -2,-8 1,8 h 1 4 7 c 2,0 5,0 8,1 7,0 14,1 23,2 17,1 39,4 64,7 50,6 114,16 187,27 147,23 329,55 509,89 180,35 357,72 492,106 34,9 65,17 92,25 28,8 53,15 73,23 10,3 20,7 28,10 7,3 15,6 20,9 5,3 10,5 13,8 0,0 1,0 1,1 0,1 1,3 1,4 z M 4075,8017 c 1,0 1,-1 2,-1 h 6 v 14 l -8,-13 8,13 v 11 l -10,-23 c 0,0 1,-1 2,-1 z M 2110,7400 c 1,1 1,3 2,4 1,1 1,3 1,4 l -25,4 21,-11 1,-1 -1,1 1,-1 h 2 z m 39,-4498 v 3 c -1,0 -1,1 -2,1 l -5,-6 -17,-4 17,4 -2,-1 4,2 z m -7,-2 2,1 z m -16,-8 14,7 z m 14,7 -10,-11 z m 2217,-841 -2,-17 z m -4,-17 4,17 v 1 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g22-8-9"
+               style="fill:#ffffff;fill-opacity:0.54118;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.54118"><path
+                 id="path24-1-0"
+                 inkscape:connector-curvature="0"
+                 d="m 5822,2442 -52,22 -52,23 -52,23 -53,25 -53,25 -53,26 -53,26 -54,27 -54,27 -54,28 -55,28 -54,29 -55,29 -55,29 -111,60 -112,60 -112,60 -113,61 -114,60 -114,60 -114,59 -57,29 -57,29 -58,28 -57,28 -27,-6 -28,-7 -56,-13 -58,-14 -59,-13 -60,-14 -61,-14 -61,-14 -63,-14 -62,-14 -63,-15 -127,-28 -127,-28 -64,-14 -63,-14 -62,-13 -62,-13 -61,-13 -60,-13 -60,-13 -58,-12 -57,-12 -28,-5 -28,-6 -27,-5 -27,-6 -27,-5 -26,-5 -26,-5 -25,-6 -25,-4 -24,-5 -24,-5 -24,-4 -23,-4 -22,-5 -22,-4 -21,-3 -21,-4 -20,-4 52,16 52,16 53,16 54,15 55,16 55,15 57,16 56,15 57,16 58,15 116,31 117,30 118,31 118,31 117,30 116,31 58,15 57,16 57,15 56,16 55,15 55,16 54,15 53,16 52,16 52,16 1,60 2,61 1,61 1,63 1,64 2,64 1,65 1,66 1,67 1,67 1,68 v 69 l 1,69 1,70 1,70 v 71 l 1,71 v 72 l 1,72 1,73 1,146 1,147 v 149 l 1,149 2,299 1,300 1,149 1,148 1,147 1,146 1,73 v 72 l 1,72 1,71 v 71 l 1,71 1,69 1,70 v 68 l 1,68 1,67 1,67 1,66 1,65 1,65 2,63 1,63 1,62 2,61 1,60 1,-61 1,-61 v -63 l 1,-63 1,-64 1,-65 1,-66 1
 ,-67 1,-67 1,-68 1,-69 2,-69 1,-70 1,-71 1,-71 1,-72 1,-72 2,-73 1,-73 1,-73 3,-148 3,-149 2,-151 3,-151 6,-303 5,-303 3,-151 3,-150 2,-149 3,-149 1,-73 2,-73 1,-73 1,-72 1,-71 1,-72 1,-70 2,-70 1,-70 1,-68 1,-68 1,-68 1,-66 1,-66 1,-65 1,-64 1,-64 v -62 l 1,-62 1,-60 110,-59 109,-59 109,-57 109,-58 108,-57 107,-58 107,-57 107,-58 105,-58 105,-58 104,-60 103,-60 51,-30 50,-31 51,-31 50,-31 50,-31 50,-32 49,-32 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g28-1-8"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path30-7-3"
+                 inkscape:connector-curvature="0"
+                 d="m 5822,2442 c -549,232 -1156,606 -1768,901 -580,-138 -1417,-322 -1839,-396 543,169 1257,327 1800,496 32,1271 16,3196 48,4467 16,-1282 59,-3238 75,-4519 586,-317 1161,-601 1684,-949 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g32-7-8"
+               style="fill:#000000;fill-opacity:0.16078;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.16078"><path
+                 id="path34-1-0"
+                 inkscape:connector-curvature="0"
+                 d="m 2420,6628 10,14 10,13 11,13 12,13 12,12 12,12 14,12 13,12 14,12 15,11 15,11 16,11 15,11 17,10 16,10 17,11 18,9 18,10 18,9 18,8 19,9 19,8 19,8 19,8 40,15 40,14 41,12 41,11 42,10 41,9 42,8 41,6 41,6 41,3 21,2 20,1 19,1 h 20 20 19 l 19,-1 19,-1 18,-1 19,-1 17,-2 18,-3 17,-2 17,-3 17,-4 16,-4 15,-4 15,-4 15,-5 15,-5 -2,-1 h -1 l -5,-2 -6,-1 -7,-2 -8,-2 -10,-3 -10,-3 -12,-3 -13,-4 -14,-3 -15,-4 -16,-5 -16,-4 -18,-5 -18,-5 -19,-5 -20,-6 -20,-5 -21,-6 -22,-6 -22,-6 -22,-6 -23,-7 -24,-6 -48,-13 -49,-14 -50,-14 -50,-13 -50,-15 -50,-13 -49,-14 -49,-13 -23,-7 -24,-6 -23,-7 -22,-6 -22,-6 -21,-6 -21,-6 -20,-5 -19,-6 -19,-5 -18,-5 -17,-5 -16,-4 -15,-5 -15,-4 -13,-4 -12,-3 -12,-3 -10,-3 -9,-3 -7,-2 -7,-2 -5,-2 h -2 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g38-5-0"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path40-7-9"
+                 inkscape:connector-curvature="0"
+                 d="m 2420,6628 c 201,289 833,431 1133,315 -53,-14 -1066,-293 -1133,-315 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g42-6-1"
+               style="fill:#ffffff;fill-opacity:0.38824;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.38824"><path
+                 id="path44-7-9"
+                 inkscape:connector-curvature="0"
+                 d="m 3454,6093 -936,-361 -9,4 -8,4 -8,4 -6,5 -6,6 -6,6 -5,7 -5,6 -4,7 -4,7 -3,7 -3,8 -3,8 -2,7 -3,15 -2,15 -2,14 v 6 7 5 6 5 4 4 l 1,4 v 2 2 1 1 l 146,51 1,1 1,1 1,1 1,2 2,2 1,3 3,3 2,3 3,4 3,4 3,4 4,5 4,4 4,6 5,4 10,12 10,11 13,12 13,12 14,13 15,12 17,13 17,12 19,12 19,11 21,11 22,10 11,4 11,5 12,4 12,4 13,3 12,3 13,3 13,3 13,2 13,1 14,2 14,1 h 14 15 15 l 15,-1 15,-2 15,-2 16,-2 16,-3 16,-4 16,-4 17,-5 17,-6 h 1 l 2,1 h 3 l 6,1 6,1 7,1 8,1 9,1 10,1 11,1 12,1 12,1 h 12 l 13,1 h 26 l 14,-1 13,-1 14,-1 13,-2 13,-2 12,-3 12,-3 12,-3 10,-5 11,-5 9,-6 8,-6 8,-8 3,-4 3,-4 3,-4 2,-4 2,-5 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g48-57-2"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path50-0-5"
+                 inkscape:connector-curvature="0"
+                 d="m 3454,6093 -936,-361 c -97,34 -78,177 -78,177 l 146,51 c 0,0 204,319 566,194 0,0 269,48 302,-61 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g52-5-4"
+               style="fill:#606060;stroke-width:2.42556"><path
+                 id="path54-7-4"
+                 inkscape:connector-curvature="0"
+                 d="m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 -13,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,48 26,-51 33,-72 15,-134 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g56-7-9"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path58-8-9"
+                 inkscape:connector-curvature="0"
+                 d="m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 -13,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,48 26,-51 33,-72 15,-134 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g60-5-3"
+               style="fill:#ffffff;fill-opacity:0.4;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.4"><path
+                 id="path62-2-6"
+                 inkscape:connector-curvature="0"
+                 d="m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g66-2-5"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path68-9-0"
+                 inkscape:connector-curvature="0"
+                 d="m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g70-9-2"
+               style="fill:#000000;fill-opacity:0.16078;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.16078"><path
+                 id="path72-9-9"
+                 inkscape:connector-curvature="0"
+                 d="m 2525,6916 10,13 11,12 10,13 11,11 11,12 11,11 12,11 12,10 12,10 12,10 13,10 12,9 13,9 13,8 27,17 28,15 28,14 28,13 29,11 29,11 30,9 30,8 29,8 30,6 30,5 30,4 30,3 30,2 29,2 h 29 l 29,-1 27,-2 28,-2 27,-3 26,-5 25,-5 24,-6 24,-6 22,-8 -2,-1 h -4 l -4,-2 -5,-1 -6,-2 -8,-2 -8,-2 -9,-2 -10,-3 -10,-3 -11,-3 -12,-3 -13,-4 -13,-3 -14,-4 -15,-4 -15,-4 -15,-5 -16,-4 -16,-5 -17,-4 -18,-5 -35,-10 -36,-10 -38,-10 -38,-10 -38,-11 -76,-21 -37,-10 -37,-11 -36,-10 -17,-4 -17,-5 -17,-5 -16,-4 -16,-5 -15,-4 -15,-4 -14,-4 -14,-4 -13,-4 -12,-3 -11,-3 -12,-3 -10,-3 -9,-3 -8,-2 -8,-3 -7,-1 -6,-2 -5,-2 -4,-1 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g76-2-3"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path78-7-5"
+                 inkscape:connector-curvature="0"
+                 d="m 2525,6916 c 209,276 627,323 861,239 -39,-10 -810,-222 -861,-239 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g80-6-1"
+               style="fill:#000000;fill-opacity:0.16078;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.16078"><path
+                 id="path82-0-7"
+                 inkscape:connector-curvature="0"
+                 d="m 2680,7199 12,15 12,14 13,14 14,12 14,13 14,11 15,11 16,11 15,9 17,9 16,9 17,7 18,7 17,7 18,5 18,5 18,5 19,3 18,4 19,2 18,2 19,1 h 19 19 l 18,-1 19,-2 18,-2 19,-3 18,-4 18,-4 18,-5 17,-6 h -1 l -2,-1 h -3 l -4,-1 -3,-1 -5,-2 -5,-1 -6,-2 -6,-1 -6,-2 -7,-2 -8,-2 -8,-2 -8,-3 -9,-2 -9,-2 -19,-6 -20,-5 -22,-6 -22,-6 -23,-6 -23,-7 -48,-13 -48,-13 -23,-7 -23,-6 -23,-6 -21,-6 -21,-6 -19,-6 -9,-2 -9,-3 -9,-2 -8,-2 -8,-2 -7,-2 -7,-2 -6,-2 -6,-2 -5,-2 -5,-1 -5,-1 -3,-1 -3,-1 -3,-1 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g86-0-3"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path88-3-1"
+                 inkscape:connector-curvature="0"
+                 d="m 2680,7199 c 121,163 355,213 540,149 -25,-6 -507,-139 -540,-149 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g90-5-4"
+               style="fill:#fcfcfc;fill-opacity:0.43922;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.43922"><path
+                 id="path92-9-6"
+                 inkscape:connector-curvature="0"
+                 d="m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369,-365 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g96-7-4"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path98-7-2"
+                 inkscape:connector-curvature="0"
+                 d="m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369,-365 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g100-1-2"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path102-64-6"
+                 inkscape:connector-curvature="0"
+                 d="m 3700,4065 -2,61 -1340,-386 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g106-1-1"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path108-3-2"
+                 inkscape:connector-curvature="0"
+                 d="m 3720,4507 -3,61 -1339,-386 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g112-9-8"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path114-09-9"
+                 inkscape:connector-curvature="0"
+                 d="m 3700,4916 -2,61 -1340,-386 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g118-8-8"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path120-3-8"
+                 inkscape:connector-curvature="0"
+                 d="m 3700,5318 -2,61 -1340,-387 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g124-5-6"
+               style="fill:#9e9e9e;stroke-width:2.42556"><path
+                 id="path126-3-8"
+                 inkscape:connector-curvature="0"
+                 d="m 2361,3309 1332,333 -11,2197 h 11 11 l 11,-2205 v -9 l -8,-2 -1341,-335 -2,11 z m 1340,335 -8,-2 v -8 h 11 z"
+                 style="stroke-width:2.42556" /></g></g></g></g><g
+         id="g16724-3"
+         transform="matrix(0.52218647,0,0,0.42933357,-400.52138,1028.8214)"
+         style="stroke-width:2.42556"><path
+           id="path5488-8"
+           d="m 1618.4,-890.85 v 126.36 h 0.5249 c -0.3385,1.0131 -0.5249,1.975 -0.5249,3.0182 0,15.228 36.989,27.557 82.672,27.557 45.683,0 82.672,-12.33 82.672,-27.557 0,-1.0447 -0.1856,-2.0037 -0.5249,-3.0182 h 0.5249 v -126.36 h -165.34 z"
+           sodipodi:nodetypes="cccssscccc"
+           style="fill:url(#linearGradient29);stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><ellipse
+           id="path5460-3"
+           style="fill:url(#linearGradient11803);stroke-width:2.42556"
+           transform="matrix(4.9627,0,0,4.9627,278.63,-3481.3)"
+           cx="286.6308"
+           cy="521.77954"
+           rx="16.667517"
+           ry="5.5558391" /><path
+           id="path6026-3"
+           d="m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82.672,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z"
+           style="fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><path
+           id="path6030-3"
+           d="m 1618.3,-891.51 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -0.9058,0.77052 -1.8509,1.4911 -2.8869,2.2308 -0.038,0.0491 -0.091,0.0823 -0.131,0.13101 -9.6253,11.663 -41.587,20.209 -79.654,20.209 -38.306,0 -70.487,-8.6955 -79.917,-20.471 -0.1046,-0.0752 -0.1596,-0.18729 -0.2625,-0.26245 -0.9185,-0.67058 -1.8123,-1.2733 -2.6245,-1.9684 z"
+           style="fill:url(#linearGradient11805);stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><path
+           id="path6022-8"
+           style="fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature="0"
+           d="m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82.672,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z" /><path
+           id="path6043-0"
+           d="m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -0.6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55,-10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 z"
+           style="fill:url(#linearGradient11807);stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><path
+           id="path6054-4"
+           style="fill:url(#linearGradient11809);stroke-width:2.42556"
+           inkscape:connector-curvature="0"
+           d="m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -0.6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55,-10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 z" /><path
+           id="path6060-7"
+           d="m 1618.8,-754.64 c 4.7284,13.732 39.813,24.277 82.279,24.277 42.079,0 76.8,-10.464 82.016,-24.014 -14.766,12.043 -45.892,20.34 -82.016,20.34 -36.314,0 -67.608,-8.4562 -82.279,-20.602 z"
+           style="fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature="0" /></g></g><g
+       id="g1125-0"
+       transform="matrix(0.17240838,0,0,0.17001607,-644.25066,214.26936)"
+       style="stroke:none;stroke-width:2.38399"><rect
+         style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:4.76797;stroke-opacity:1"
+         id="rect1061-9"
+         width="452.00439"
+         height="192.0562"
+         x="11.609296"
+         y="276.44562"
+         ry="4.0176301" /><g
+         id="g1109-1"
+         transform="translate(-2.7615661,-1.7576335)"
+         style="stroke:none;stroke-width:2.38399"><path
+           id="path14-9"
+           class="st0"
+           d="m 439.74452,358.11274 c 0,4.22 -3.41,7.64 -7.64,7.64 -4.22,0 -7.63,-3.42 -7.63,-7.64 0,-4.22 3.41,-7.64 7.63,-7.64 4.23,0 7.64,3.42 7.64,7.64 v 0"
+           style="fill:#4a97d2;fill-opacity:1;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path16-6"
+           class="st1"
+           d="m 114.56452,324.94274 -11.13,-6.3 -22.409996,45.41 -23.9,-45.41 -11.27,6.3 28.41,53.38 c -0.21,0.51 -0.86,1.9 -1.95,4.22 -1.11,2.21 -2.25,4.41 -3.46,6.62 -2.11,3.81 -4.26,6.91 -6.46,9.32 -2.21,2.51 -4.46,4.51 -6.78,6.02 -2.3,1.51 -4.7,2.65 -7.21,3.46 -2.41,0.8 -4.87,1.45 -7.38,1.95 l 5.12,10.68 c 1.6,-0.21 3.75,-0.71 6.46,-1.51 2.81,-0.7 5.86,-2.06 9.17,-4.06 3.3,-2 6.67,-4.86 10.07,-8.57 3.52,-3.71 6.78,-8.62 9.78,-14.73 l 32.939996,-66.78"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path18-2"
+           class="st1"
+           d="m 175.39452,358.18274 c 0,3.51 -0.6,6.76 -1.81,9.78 -1.21,3 -2.86,5.62 -4.95,7.81 -2.01,2.11 -4.41,3.81 -7.22,5.12 -2.71,1.19 -5.67,1.8 -8.87,1.8 -3.21,0 -6.22,-0.6 -9.02,-1.8 -2.81,-1.31 -5.27,-3.01 -7.38,-5.12 -2,-2.19 -3.6,-4.81 -4.81,-7.81 -1.21,-3.01 -1.81,-6.27 -1.81,-9.78 0,-3.51 0.6,-6.76 1.81,-9.77 1.21,-3 2.81,-5.61 4.81,-7.82 2.11,-2.21 4.57,-3.92 7.38,-5.11 2.8,-1.32 5.81,-1.97 9.02,-1.97 3.21,0 6.16,0.65 8.87,1.97 2.81,1.19 5.21,2.9 7.22,5.11 2.1,2.21 3.75,4.81 4.95,7.82 1.2,3.01 1.81,6.26 1.81,9.77 m 13.98,0 c 0,-5.21 -0.95,-10.08 -2.86,-14.59 -1.81,-4.51 -4.36,-8.42 -7.67,-11.73 -3.32,-3.3 -7.22,-5.86 -11.73,-7.67 -4.51,-1.9 -9.38,-2.86 -14.59,-2.86 -5.21,0 -10.08,0.95 -14.59,2.86 -4.51,1.81 -8.43,4.36 -11.73,7.67 -3.3,3.31 -5.92,7.22 -7.82,11.73 -1.9,4.51 -2.86,9.38 -2.86,14.59 0,5.21 0.95,10.08 2.86,14.59 1.9,4.41 4.52,8.27 7.82,11.57 3.3,3.32 7.22,5.92 11.73,7.82 4.51,1.81 9.38,2.71 14.59,2.71 5.21,0 10.08,-0.9 14.59,-2.71 4.51,-1.91 8.41,-4.51 11.73,
 -7.82 3.3,-3.3 5.86,-7.16 7.67,-11.57 1.91,-4.51 2.86,-9.38 2.86,-14.59"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path20-5"
+           class="st1"
+           d="m 373.22452,358.18274 c 0,3.51 -0.6,6.76 -1.81,9.78 -1.21,3 -2.86,5.62 -4.97,7.81 -2,2.11 -4.4,3.81 -7.21,5.12 -2.71,1.19 -5.67,1.8 -8.87,1.8 -3.21,0 -6.22,-0.6 -9.03,-1.8 -2.8,-1.31 -5.26,-3.01 -7.37,-5.12 -2,-2.19 -3.61,-4.81 -4.81,-7.81 -1.21,-3.01 -1.81,-6.27 -1.81,-9.78 0,-3.51 0.6,-6.76 1.81,-9.77 1.21,-3 2.81,-5.61 4.81,-7.82 2.11,-2.21 4.57,-3.92 7.37,-5.11 2.81,-1.32 5.82,-1.97 9.03,-1.97 3.21,0 6.16,0.65 8.87,1.97 2.81,1.19 5.21,2.9 7.21,5.11 2.11,2.21 3.76,4.81 4.97,7.82 1.21,3.01 1.81,6.26 1.81,9.77 m 13.98,0 c 0,-5.21 -0.95,-10.08 -2.86,-14.59 -1.81,-4.51 -4.36,-8.42 -7.67,-11.73 -3.32,-3.3 -7.22,-5.86 -11.73,-7.67 -4.51,-1.9 -9.38,-2.86 -14.59,-2.86 -5.22,0 -10.08,0.95 -14.59,2.86 -4.51,1.81 -8.43,4.36 -11.73,7.67 -3.3,3.31 -5.92,7.22 -7.82,11.73 -1.9,4.51 -2.86,9.38 -2.86,14.59 0,5.21 0.95,10.08 2.86,14.59 1.9,4.41 4.52,8.27 7.82,11.57 3.3,3.32 7.22,5.92 11.73,7.82 4.51,1.81 9.37,2.71 14.59,2.71 5.21,0 10.08,-0.9 14.59,-2.71 4.51,-1.91 8.41,-4.51 11.73,-
 7.82 3.3,-3.3 5.86,-7.16 7.67,-11.57 1.91,-4.51 2.86,-9.38 2.86,-14.59"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path22-4"
+           class="st1"
+           d="m 288.05452,298.59274 -13.39,7.52 v 16.45 h -36.21 c -26.15,0 -41.9,12.74 -41.9,35.95 0,36.04 37.55,42.84 64.25,29.96 l -5.63,-10.92 c -21.13,9.23 -44.53,5.3 -44.53,-19.28 0,-15.86 8.26,-24.54 27.49,-24.54 h 36.54 v 43.82 c 0,19.37 22.19,19.81 35.95,11.86 l -5.29,-10.45 c -8.85,4.48 -17.26,5.06 -17.26,-3.53 v -41.7 h 18.32 v -11.17 h -18.32 l -0.02,-23.97 v 0"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path24-4"
+           class="st1"
+           d="m 136.79452,428.30274 h 3.35 c 1.69,-0.01 3.34,1.19 3.34,2.9 0,2.87 -3.23,3.3 -3.23,3.3 l -3.46,0.02 z m -4.84,-4.1 v 25.3 h 4.83 l 0.06,-10.67 c 8.62,0.54 11.84,-2.46 11.84,-7.75 0,-4.75 -4.26,-6.88 -8.34,-6.88 h -8.39 v 0"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path26-9"
+           class="st1"
+           d="m 224.38452,436.87274 c 0,1.23 -0.23,2.39 -0.69,3.46 -0.42,1.04 -1.02,1.95 -1.81,2.74 -0.78,0.78 -1.7,1.4 -2.75,1.86 -1.04,0.42 -2.17,0.64 -3.38,0.64 -1.22,0 -2.35,-0.22 -3.39,-0.64 -1.05,-0.46 -1.96,-1.07 -2.75,-1.86 -0.76,-0.78 -1.36,-1.7 -1.81,-2.74 -0.46,-1.07 -0.69,-2.23 -0.69,-3.46 0,-1.23 0.23,-2.37 0.69,-3.42 0.45,-1.06 1.05,-1.99 1.81,-2.77 0.78,-0.78 1.7,-1.39 2.75,-1.82 1.04,-0.45 2.17,-0.67 3.39,-0.67 1.21,0 2.34,0.23 3.38,0.67 1.05,0.43 1.96,1.04 2.75,1.82 0.78,0.78 1.39,1.71 1.81,2.77 0.46,1.05 0.69,2.19 0.69,3.42 m 4.9,0 c 0,-1.81 -0.35,-3.5 -1.06,-5.06 -0.69,-1.59 -1.65,-2.97 -2.89,-4.12 -1.21,-1.17 -2.64,-2.09 -4.3,-2.75 -1.64,-0.69 -3.41,-1.04 -5.3,-1.04 -1.9,0 -3.69,0.35 -5.35,1.04 -1.64,0.66 -3.06,1.58 -4.27,2.75 -1.22,1.16 -2.17,2.53 -2.89,4.12 -0.69,1.57 -1.03,3.25 -1.03,5.06 0,1.83 0.34,3.53 1.03,5.1 0.72,1.57 1.68,2.94 2.89,4.12 1.21,1.17 2.63,2.09 4.27,2.75 1.66,0.66 3.45,1 5.35,1 1.89,0 3.67,-0.34 5.3,-1 1.66,-0.66 3.1,-1.58 4.3,-2.75 1.24,-1.
 18 2.21,-2.55 2.89,-4.12 0.71,-1.56 1.06,-3.26 1.06,-5.1"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path28-9"
+           class="st1"
+           d="m 249.02452,424.25274 v 19.18 c 0,0.77 -0.57,1.63 -1.51,1.65 l -1.51,0.06 0.08,4.7 1.41,0.02 c 4.73,0.07 6.36,-4.37 6.36,-6.45 v -19.13"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path30-3"
+           class="st1"
+           d="m 290.20452,424.19274 h -16.13 v 25.22 h 16.2 l -0.07,-4.06 h -11.28 v -6.58 h 9.44 v -4.06 h -9.44 v -6.38 h 11.21 l 0.07,-4.14"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path32-6"
+           class="st1"
+           d="m 327.39452,430.24274 c -8.26,-4.53 -16.39,-1.78 -16.39,6.52 0,6.69 6.43,11.84 17,6.31 l 1.53,4.13 c -10.15,5.58 -23.51,1.6 -23.51,-10.44 0,-10.91 11.85,-16.59 23.36,-10.61 l -1.99,4.09"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path34-0"
+           class="st1"
+           d="m 366.07452,424.19274 0.01,4.13 h -8.05 v 21.16 h -4.85 v -21.15 h -7.73 l 0.11,-4.13 h 20.51"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /><path
+           id="path36-5"
+           class="st1"
+           d="m 172.67452,428.30274 h 3.35 c 1.69,-0.01 3.34,1.19 3.34,2.9 0,2.87 -3.23,3.3 -3.23,3.3 l -3.46,0.02 z m -4.82,-4.1 v 25.3 h 4.82 v -10.89 h 3.2 l 5.59,10.89 h 5.5 l -6.67,-12.2 c 2.64,-1.18 4.01,-3.26 4.01,-6.22 0,-4.94 -4.33,-6.88 -9.09,-6.88 h -7.36 v 0"
+           style="fill:#ffffff;stroke:none;stroke-width:0.238399;stroke-opacity:1" /></g></g><g
+       id="g5"
+       transform="translate(-27.376154,-16.970563)"><g
+         id="g3-3-4-0-4-2"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7"
+           width="95.906448"
+           height="45.542469"
+           x="-241.63611"
+           y="-4.9569407"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-455.34195"
+         y="312.25342"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-455.34195"
+           y="312.25342"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6">virtual/cross-cc</tspan></text><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-473.19095"
+         y="351.5986"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-4"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-473.19095"
+           y="351.5986"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-4">bitbake &lt;target&gt;</tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-557.909"
+       y="487.1283"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-0-4-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-557.909"
+         y="487.1283"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-6-4-5">bitbake meta-toolchain</tspan><tspan
+         sodipodi:role="line"
+         x="-557.909"
+         y="507.36124"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan1">bitbake &lt;image&gt; -c populate_sdk[_ext]</tspan></text><g
+       id="g5-6"
+       transform="translate(-87.94604,140.02178)"><g
+         id="g3-3-4-0-4-2-4"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-9"
+           width="95.906448"
+           height="45.542469"
+           x="-241.63611"
+           y="-4.9569407"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-455.34195"
+         y="312.25342"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-455.34195"
+           y="312.25342"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48">virtual/cross-cc</tspan></text></g><g
+       id="g3-3-4-0-4-2-4-7"
+       transform="matrix(1.9678686,0,0,2.2330592,126.77939,443.0288)"
+       style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3-7-9-7"
+         width="117.1067"
+         height="40.159355"
+         x="-241.63611"
+         y="-4.9569407"
+         ry="0" /></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-238.62984"
+       y="461.319"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-1"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-238.62984"
+         y="461.319"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-6-48-5">gcc/clang-cross-canadian</tspan><tspan
+         sodipodi:role="line"
+         x="-238.62984"
+         y="481.16504"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan15"><tspan
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+   id="tspan16">Other</tspan> nativesdk-* <tspan
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+   id="tspan17">tools</tspan></tspan></text><g
+       id="g3-3-4-0-4-2-4-2"
+       transform="matrix(1.5783087,0,0,1.1274538,39.82036,422.14561)"
+       style="fill:#b3b3b3;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1" /><g
+       id="g5-9"
+       transform="translate(-109.621,143.59294)" /><g
+       id="g5-3"
+       transform="translate(159.66398,-16.970563)"><g
+         id="g3-3-4-0-4-2-7"
+         transform="matrix(1.1528692,0,0,1.1316675,-197.06241,297.09753)"
+         style="fill:#92d050;fill-opacity:1;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4"
+           width="95.906448"
+           height="45.542469"
+           x="-241.63611"
+           y="-4.9569407"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-429.37146"
+         y="314.16446"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-429.37146"
+           y="314.16446"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-2">Target Image</tspan></text></g><g
+       id="g17"
+       transform="translate(-96.5,48)"><ellipse
+         style="fill:#92d050;fill-opacity:1;stroke:#000000;stroke-width:0.850696;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+         id="path17"
+         cx="-323.98355"
+         cy="-108.7312"
+         rx="7.3326268"
+         ry="8.3432655"
+         transform="matrix(1.4319561,0,0,1.2585,-123.31892,301.26041)" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-599.29761"
+         y="166.12332"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5-5"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-599.29761"
+           y="166.12332"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-2-9">1</tspan></text></g><rect
+       style="fill:url(#linearGradient17);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.34217;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-61-7-3-3-8"
+       width="411.4115"
+       height="292.53241"
+       x="-644.03326"
+       y="598.05701"
+       ry="0" /><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-304.97855"
+       y="400.22531"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-304.97855"
+         y="400.22531"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8">Relocatable SDK</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-575.38116"
+       y="573.18823"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-9"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-575.38116"
+         y="573.18823"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-62">SDKMACHINE</tspan></text><g
+       id="g3-3-4-0-4-0-1"
+       transform="matrix(1.4319561,0,0,1.2585,-205.55295,543.48071)"
+       style="fill:url(#linearGradient2-5-1);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:url(#linearGradient18);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.1021;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3-9-7"
+         width="179.64606"
+         height="91.957306"
+         x="-211.91895"
+         y="82.629501"
+         ry="0" /></g><g
+       id="g3925-7"
+       transform="matrix(0.25691123,0,0,0.25691123,-712.7823,501.26785)"
+       style="stroke-width:2.42556"><g
+         id="layer1-3-5-2-4"
+         inkscape:label="Capa 1"
+         transform="matrix(1.1196,0,0,1.1196,-122.82057,267.39056)"
+         style="stroke-width:2.42556"><g
+           id="g10-5-2-1"
+           transform="matrix(0.0423,0,0,0.0423,319.39,59.128)"
+           class="Graphic"
+           style="stroke-width:2.42556"><g
+             id="g12-4-2-8"
+             style="stroke-width:2.42556"><g
+               id="g14-64-0-5"
+               style="fill:#c7c7c7;stroke-width:2.42556"><path
+                 id="path16-1-5-9"
+                 inkscape:connector-curvature="0"
+                 d="m 5903,2361 c 50,82 34,3995 -31,4149 -51,122 -1703,1495 -1789,1531 -1117,-7 -1870,-414 -1995,-629 -48,-270 -7,-4433 38,-4520 40,-76 2153,-833 2227,-851 67,-15 1493,229 1550,320 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g18-6-5-7"
+               style="fill:#000000;stroke-width:2.42556"><path
+                 id="path20-8-2-5"
+                 inkscape:connector-curvature="0"
+                 d="m 5881,2374 2,-1 -2,2 c 0,-1 -1,-1 -1,-1 v -2 l 7,-3 -2,2 -5,1 5,-1 -2,2 z m 2,-1 2,-2 2,-2 5,-2 -5,4 5,-4 h 1 l -6,3 v 1 -1 z m 10,-6 h -1 1 -1 l 11,-6 -10,5 z m 11,-4 -11,4 v -1 z m 20,-15 c -2,-3 -4,-6 -7,-9 -2,-3 -5,-5 -8,-7 -5,-4 -12,-8 -20,-12 -7,-4 -15,-7 -24,-11 -9,-4 -19,-7 -30,-11 -21,-8 -47,-16 -75,-24 -29,-8 -61,-16 -95,-25 -136,-34 -313,-72 -494,-106 -181,-35 -364,-66 -511,-90 -73,-11 -138,-21 -189,-27 -25,-3 -47,-6 -65,-8 -9,-1 -17,-1 -24,-2 -4,0 -7,0 -10,-1 h -9 c -3,0 -5,0 -7,1 h -4 c -2,0 -3,0 -4,1 -2,0 -4,1 -7,2 -2,0 -5,1 -8,2 -3,1 -7,2 -11,3 -4,2 -8,3 -13,5 -10,3 -22,7 -35,12 -13,4 -28,9 -44,15 -33,11 -71,25 -115,40 -43,15 -91,32 -144,51 -209,75 -481,173 -753,274 -271,101 -542,203 -747,285 -51,21 -98,40 -140,57 -43,18 -80,34 -111,48 -16,7 -30,14 -42,20 -13,6 -24,12 -33,17 -5,2 -9,5 -13,7 -4,3 -8,5 -10,7 -4,3 -7,5 -9,7 -5,4 -7,8 -9,11 -1,2 -2,5 -4,9 0,3 -1,6 -1,9 -1,3 -1,7 -2,11 -1,4 -1,8 -2,13 0,9 -1,20 -3,32 0,13 -1,27 -2,42 -2,31 -4,69 -6,111
  -2,43 -4,91 -5,144 -7,213 -14,504 -19,835 -11,662 -19,1482 -19,2144 0,308 2,583 5,791 1,52 2,100 3,143 1,43 3,82 4,115 1,34 3,62 4,85 1,12 2,22 3,30 1,5 1,9 1,13 1,3 2,7 2,10 l 1,4 2,4 c 9,15 20,30 33,46 14,16 30,32 48,49 35,32 80,66 135,101 107,70 249,142 423,207 173,65 377,124 608,167 231,43 489,70 769,72 h 6 l 5,-2 8,-4 c 2,-2 5,-3 8,-6 3,-2 6,-4 10,-6 l 12,-9 c 9,-6 19,-13 30,-22 11,-8 23,-17 37,-28 27,-20 58,-45 93,-73 35,-28 74,-59 116,-93 169,-136 385,-315 600,-497 215,-181 430,-366 593,-512 41,-37 79,-71 113,-103 34,-31 64,-59 89,-84 13,-13 24,-24 34,-35 11,-11 20,-20 28,-29 8,-9 14,-17 19,-23 3,-4 5,-8 7,-10 2,-4 4,-8 6,-11 0,-2 1,-5 2,-8 1,-3 2,-5 3,-9 1,-6 2,-13 3,-22 2,-8 3,-17 4,-28 1,-11 2,-22 3,-35 2,-25 4,-55 7,-89 1,-34 3,-72 5,-113 8,-166 14,-391 19,-648 10,-516 16,-1164 16,-1743 0,-389 -3,-747 -8,-1012 -1,-66 -2,-127 -4,-181 -1,-53 -3,-100 -5,-139 -1,-20 -2,-38 -3,-53 -1,-16 -2,-30 -3,-41 -1,-6 -1,-11 -2,-16 -1,-5 -1,-10 -2,-13 -1,-4 -1,-8 -2,-11 -1,-2 -1,-4 -2,-
 5 -1,-3 -2,-5 -3,-6 z m -37,21 12,-12 z m -6,9 c 1,3 1,7 2,11 0,4 1,9 1,15 1,11 3,24 4,39 0,15 1,33 2,52 2,39 4,86 6,139 1,53 2,114 4,180 5,264 7,622 7,1011 0,578 -5,1227 -15,1742 -6,257 -12,481 -19,646 -2,42 -4,79 -6,113 -2,33 -4,63 -6,88 -1,12 -2,24 -4,34 0,10 -2,18 -3,26 -1,7 -2,14 -3,18 0,3 -1,4 -1,6 0,1 -1,2 -1,2 0,1 -1,2 -2,4 -1,1 -3,4 -4,6 -5,6 -10,13 -17,21 -7,7 -16,17 -26,27 l -34,34 c -25,24 -54,52 -88,83 -33,31 -71,66 -112,102 -163,146 -377,330 -592,512 -215,181 -431,360 -598,495 -42,34 -81,65 -116,93 -35,28 -66,52 -93,73 -13,10 -26,20 -37,28 -10,8 -20,15 -28,21 -4,3 -8,6 -12,8 -3,2 -6,4 -8,6 -2,1 -4,2 -5,3 -276,-2 -528,-29 -755,-71 -228,-42 -429,-100 -600,-164 -169,-64 -308,-134 -413,-202 -51,-33 -94,-66 -128,-97 -17,-15 -31,-30 -43,-44 -10,-12 -19,-23 -26,-34 v -4 c -1,-3 -1,-7 -1,-11 -1,-8 -2,-18 -3,-28 -2,-23 -3,-51 -5,-84 -1,-33 -2,-71 -3,-115 -1,-42 -2,-90 -3,-142 -3,-208 -5,-482 -5,-790 0,-662 7,-1481 18,-2143 6,-330 12,-622 19,-834 2,-53 4,-101 6,-144 2,-42 3,-79 
 5,-109 1,-16 2,-30 3,-42 1,-12 2,-22 3,-31 0,-4 1,-8 1,-11 1,-4 1,-6 2,-9 v -2 c 0,-1 1,-1 2,-2 2,-1 4,-3 7,-5 4,-1 7,-4 11,-6 9,-5 19,-10 31,-16 12,-6 26,-12 41,-19 31,-14 67,-29 109,-47 42,-17 89,-37 140,-57 205,-82 475,-184 746,-284 271,-101 543,-200 752,-274 52,-19 101,-36 144,-51 43,-16 82,-29 114,-40 17,-6 31,-11 44,-16 13,-4 25,-8 35,-11 4,-2 9,-3 13,-4 4,-2 7,-3 10,-4 3,-1 5,-1 8,-2 l 3,-1 -2,-8 1,8 h 1 4 7 c 2,0 5,0 8,1 7,0 14,1 23,2 17,1 39,4 64,7 50,6 114,16 187,27 147,23 329,55 509,89 180,35 357,72 492,106 34,9 65,17 92,25 28,8 53,15 73,23 10,3 20,7 28,10 7,3 15,6 20,9 5,3 10,5 13,8 0,0 1,0 1,1 0,1 1,3 1,4 z M 4075,8017 c 1,0 1,-1 2,-1 h 6 v 14 l -8,-13 8,13 v 11 l -10,-23 c 0,0 1,-1 2,-1 z M 2110,7400 c 1,1 1,3 2,4 1,1 1,3 1,4 l -25,4 21,-11 1,-1 -1,1 1,-1 h 2 z m 39,-4498 v 3 c -1,0 -1,1 -2,1 l -5,-6 -17,-4 17,4 -2,-1 4,2 z m -7,-2 2,1 z m -16,-8 14,7 z m 14,7 -10,-11 z m 2217,-841 -2,-17 z m -4,-17 4,17 v 1 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g22-8-9-3"
+               style="fill:#ffffff;fill-opacity:0.54118;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.54118"><path
+                 id="path24-1-0-8"
+                 inkscape:connector-curvature="0"
+                 d="m 5822,2442 -52,22 -52,23 -52,23 -53,25 -53,25 -53,26 -53,26 -54,27 -54,27 -54,28 -55,28 -54,29 -55,29 -55,29 -111,60 -112,60 -112,60 -113,61 -114,60 -114,60 -114,59 -57,29 -57,29 -58,28 -57,28 -27,-6 -28,-7 -56,-13 -58,-14 -59,-13 -60,-14 -61,-14 -61,-14 -63,-14 -62,-14 -63,-15 -127,-28 -127,-28 -64,-14 -63,-14 -62,-13 -62,-13 -61,-13 -60,-13 -60,-13 -58,-12 -57,-12 -28,-5 -28,-6 -27,-5 -27,-6 -27,-5 -26,-5 -26,-5 -25,-6 -25,-4 -24,-5 -24,-5 -24,-4 -23,-4 -22,-5 -22,-4 -21,-3 -21,-4 -20,-4 52,16 52,16 53,16 54,15 55,16 55,15 57,16 56,15 57,16 58,15 116,31 117,30 118,31 118,31 117,30 116,31 58,15 57,16 57,15 56,16 55,15 55,16 54,15 53,16 52,16 52,16 1,60 2,61 1,61 1,63 1,64 2,64 1,65 1,66 1,67 1,67 1,68 v 69 l 1,69 1,70 1,70 v 71 l 1,71 v 72 l 1,72 1,73 1,146 1,147 v 149 l 1,149 2,299 1,300 1,149 1,148 1,147 1,146 1,73 v 72 l 1,72 1,71 v 71 l 1,71 1,69 1,70 v 68 l 1,68 1,67 1,67 1,66 1,65 1,65 2,63 1,63 1,62 2,61 1,60 1,-61 1,-61 v -63 l 1,-63 1,-64 1,-65 1,-66 1
 ,-67 1,-67 1,-68 1,-69 2,-69 1,-70 1,-71 1,-71 1,-72 1,-72 2,-73 1,-73 1,-73 3,-148 3,-149 2,-151 3,-151 6,-303 5,-303 3,-151 3,-150 2,-149 3,-149 1,-73 2,-73 1,-73 1,-72 1,-71 1,-72 1,-70 2,-70 1,-70 1,-68 1,-68 1,-68 1,-66 1,-66 1,-65 1,-64 1,-64 v -62 l 1,-62 1,-60 110,-59 109,-59 109,-57 109,-58 108,-57 107,-58 107,-57 107,-58 105,-58 105,-58 104,-60 103,-60 51,-30 50,-31 51,-31 50,-31 50,-31 50,-32 49,-32 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g28-1-8-8"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path30-7-3-3"
+                 inkscape:connector-curvature="0"
+                 d="m 5822,2442 c -549,232 -1156,606 -1768,901 -580,-138 -1417,-322 -1839,-396 543,169 1257,327 1800,496 32,1271 16,3196 48,4467 16,-1282 59,-3238 75,-4519 586,-317 1161,-601 1684,-949 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g32-7-8-1"
+               style="fill:#000000;fill-opacity:0.16078;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.16078"><path
+                 id="path34-1-0-8"
+                 inkscape:connector-curvature="0"
+                 d="m 2420,6628 10,14 10,13 11,13 12,13 12,12 12,12 14,12 13,12 14,12 15,11 15,11 16,11 15,11 17,10 16,10 17,11 18,9 18,10 18,9 18,8 19,9 19,8 19,8 19,8 40,15 40,14 41,12 41,11 42,10 41,9 42,8 41,6 41,6 41,3 21,2 20,1 19,1 h 20 20 19 l 19,-1 19,-1 18,-1 19,-1 17,-2 18,-3 17,-2 17,-3 17,-4 16,-4 15,-4 15,-4 15,-5 15,-5 -2,-1 h -1 l -5,-2 -6,-1 -7,-2 -8,-2 -10,-3 -10,-3 -12,-3 -13,-4 -14,-3 -15,-4 -16,-5 -16,-4 -18,-5 -18,-5 -19,-5 -20,-6 -20,-5 -21,-6 -22,-6 -22,-6 -22,-6 -23,-7 -24,-6 -48,-13 -49,-14 -50,-14 -50,-13 -50,-15 -50,-13 -49,-14 -49,-13 -23,-7 -24,-6 -23,-7 -22,-6 -22,-6 -21,-6 -21,-6 -20,-5 -19,-6 -19,-5 -18,-5 -17,-5 -16,-4 -15,-5 -15,-4 -13,-4 -12,-3 -12,-3 -10,-3 -9,-3 -7,-2 -7,-2 -5,-2 h -2 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g38-5-0-9"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path40-7-9-6"
+                 inkscape:connector-curvature="0"
+                 d="m 2420,6628 c 201,289 833,431 1133,315 -53,-14 -1066,-293 -1133,-315 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g42-6-1-4"
+               style="fill:#ffffff;fill-opacity:0.38824;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.38824"><path
+                 id="path44-7-9-3"
+                 inkscape:connector-curvature="0"
+                 d="m 3454,6093 -936,-361 -9,4 -8,4 -8,4 -6,5 -6,6 -6,6 -5,7 -5,6 -4,7 -4,7 -3,7 -3,8 -3,8 -2,7 -3,15 -2,15 -2,14 v 6 7 5 6 5 4 4 l 1,4 v 2 2 1 1 l 146,51 1,1 1,1 1,1 1,2 2,2 1,3 3,3 2,3 3,4 3,4 3,4 4,5 4,4 4,6 5,4 10,12 10,11 13,12 13,12 14,13 15,12 17,13 17,12 19,12 19,11 21,11 22,10 11,4 11,5 12,4 12,4 13,3 12,3 13,3 13,3 13,2 13,1 14,2 14,1 h 14 15 15 l 15,-1 15,-2 15,-2 16,-2 16,-3 16,-4 16,-4 17,-5 17,-6 h 1 l 2,1 h 3 l 6,1 6,1 7,1 8,1 9,1 10,1 11,1 12,1 12,1 h 12 l 13,1 h 26 l 14,-1 13,-1 14,-1 13,-2 13,-2 12,-3 12,-3 12,-3 10,-5 11,-5 9,-6 8,-6 8,-8 3,-4 3,-4 3,-4 2,-4 2,-5 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g48-57-2-3"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path50-0-5-3"
+                 inkscape:connector-curvature="0"
+                 d="m 3454,6093 -936,-361 c -97,34 -78,177 -78,177 l 146,51 c 0,0 204,319 566,194 0,0 269,48 302,-61 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g52-5-4-8"
+               style="fill:#606060;stroke-width:2.42556"><path
+                 id="path54-7-4-6"
+                 inkscape:connector-curvature="0"
+                 d="m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 -13,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,48 26,-51 33,-72 15,-134 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g56-7-9-0"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path58-8-9-4"
+                 inkscape:connector-curvature="0"
+                 d="m 3446,5971 c -311,-81 -622,-161 -933,-242 -12,44 -13,107 6,140 47,23 142,41 189,64 136,131 255,142 472,124 84,17 168,31 251,48 26,-51 33,-72 15,-134 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g60-5-3-8"
+               style="fill:#ffffff;fill-opacity:0.4;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.4"><path
+                 id="path62-2-6-8"
+                 inkscape:connector-curvature="0"
+                 d="m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g66-2-5-8"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path68-9-0-9"
+                 inkscape:connector-curvature="0"
+                 d="m 5856,2414 -1813,1017 7,4549 1775,-1494 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g70-9-2-7"
+               style="fill:#000000;fill-opacity:0.16078;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.16078"><path
+                 id="path72-9-9-7"
+                 inkscape:connector-curvature="0"
+                 d="m 2525,6916 10,13 11,12 10,13 11,11 11,12 11,11 12,11 12,10 12,10 12,10 13,10 12,9 13,9 13,8 27,17 28,15 28,14 28,13 29,11 29,11 30,9 30,8 29,8 30,6 30,5 30,4 30,3 30,2 29,2 h 29 l 29,-1 27,-2 28,-2 27,-3 26,-5 25,-5 24,-6 24,-6 22,-8 -2,-1 h -4 l -4,-2 -5,-1 -6,-2 -8,-2 -8,-2 -9,-2 -10,-3 -10,-3 -11,-3 -12,-3 -13,-4 -13,-3 -14,-4 -15,-4 -15,-4 -15,-5 -16,-4 -16,-5 -17,-4 -18,-5 -35,-10 -36,-10 -38,-10 -38,-10 -38,-11 -76,-21 -37,-10 -37,-11 -36,-10 -17,-4 -17,-5 -17,-5 -16,-4 -16,-5 -15,-4 -15,-4 -14,-4 -14,-4 -13,-4 -12,-3 -11,-3 -12,-3 -10,-3 -9,-3 -8,-2 -8,-3 -7,-1 -6,-2 -5,-2 -4,-1 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g76-2-3-6"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path78-7-5-4"
+                 inkscape:connector-curvature="0"
+                 d="m 2525,6916 c 209,276 627,323 861,239 -39,-10 -810,-222 -861,-239 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g80-6-1-3"
+               style="fill:#000000;fill-opacity:0.16078;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.16078"><path
+                 id="path82-0-7-0"
+                 inkscape:connector-curvature="0"
+                 d="m 2680,7199 12,15 12,14 13,14 14,12 14,13 14,11 15,11 16,11 15,9 17,9 16,9 17,7 18,7 17,7 18,5 18,5 18,5 19,3 18,4 19,2 18,2 19,1 h 19 19 l 18,-1 19,-2 18,-2 19,-3 18,-4 18,-4 18,-5 17,-6 h -1 l -2,-1 h -3 l -4,-1 -3,-1 -5,-2 -5,-1 -6,-2 -6,-1 -6,-2 -7,-2 -8,-2 -8,-2 -8,-3 -9,-2 -9,-2 -19,-6 -20,-5 -22,-6 -22,-6 -23,-6 -23,-7 -48,-13 -48,-13 -23,-7 -23,-6 -23,-6 -21,-6 -21,-6 -19,-6 -9,-2 -9,-3 -9,-2 -8,-2 -8,-2 -7,-2 -7,-2 -6,-2 -6,-2 -5,-2 -5,-1 -5,-1 -3,-1 -3,-1 -3,-1 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g86-0-3-3"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path88-3-1-0"
+                 inkscape:connector-curvature="0"
+                 d="m 2680,7199 c 121,163 355,213 540,149 -25,-6 -507,-139 -540,-149 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g90-5-4-9"
+               style="fill:#fcfcfc;fill-opacity:0.43922;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.43922"><path
+                 id="path92-9-6-2"
+                 inkscape:connector-curvature="0"
+                 d="m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369,-365 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g96-7-4-5"
+               style="fill:none;stroke-width:2.42556"><path
+                 id="path98-7-2-4"
+                 inkscape:connector-curvature="0"
+                 d="m 2356,3259 -92,13 -17,2173 1425,399 35,-116 -1369,-365 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g100-1-2-0"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path102-64-6-5"
+                 inkscape:connector-curvature="0"
+                 d="m 3700,4065 -2,61 -1340,-386 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g106-1-1-9"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path108-3-2-4"
+                 inkscape:connector-curvature="0"
+                 d="m 3720,4507 -3,61 -1339,-386 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g112-9-8-6"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path114-09-9-9"
+                 inkscape:connector-curvature="0"
+                 d="m 3700,4916 -2,61 -1340,-386 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g118-8-8-2"
+               style="fill:#000000;fill-opacity:0.23137;stroke:#ffffff;stroke-width:2.42556;stroke-opacity:0.23137"><path
+                 id="path120-3-8-2"
+                 inkscape:connector-curvature="0"
+                 d="m 3700,5318 -2,61 -1340,-387 z"
+                 style="stroke-width:2.42556" /></g><g
+               id="g124-5-6-4"
+               style="fill:#9e9e9e;stroke-width:2.42556"><path
+                 id="path126-3-8-7"
+                 inkscape:connector-curvature="0"
+                 d="m 2361,3309 1332,333 -11,2197 h 11 11 l 11,-2205 v -9 l -8,-2 -1341,-335 -2,11 z m 1340,335 -8,-2 v -8 h 11 z"
+                 style="stroke-width:2.42556" /></g></g></g></g><g
+         id="g16724-3-7"
+         transform="matrix(0.52218647,0,0,0.42933357,-400.52138,1028.8214)"
+         style="stroke-width:2.42556"><path
+           id="path5488-8-5"
+           d="m 1618.4,-890.85 v 126.36 h 0.5249 c -0.3385,1.0131 -0.5249,1.975 -0.5249,3.0182 0,15.228 36.989,27.557 82.672,27.557 45.683,0 82.672,-12.33 82.672,-27.557 0,-1.0447 -0.1856,-2.0037 -0.5249,-3.0182 h 0.5249 v -126.36 h -165.34 z"
+           sodipodi:nodetypes="cccssscccc"
+           style="fill:url(#linearGradient19);stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><ellipse
+           id="path5460-3-4"
+           style="fill:url(#linearGradient11803-7);stroke-width:2.42556"
+           transform="matrix(4.9627,0,0,4.9627,278.63,-3481.3)"
+           cx="286.6308"
+           cy="521.77954"
+           rx="16.667517"
+           ry="5.5558391" /><path
+           id="path6026-3-8"
+           d="m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82.672,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z"
+           style="fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><path
+           id="path6030-3-1"
+           d="m 1618.3,-891.51 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -0.9058,0.77052 -1.8509,1.4911 -2.8869,2.2308 -0.038,0.0491 -0.091,0.0823 -0.131,0.13101 -9.6253,11.663 -41.587,20.209 -79.654,20.209 -38.306,0 -70.487,-8.6955 -79.917,-20.471 -0.1046,-0.0752 -0.1596,-0.18729 -0.2625,-0.26245 -0.9185,-0.67058 -1.8123,-1.2733 -2.6245,-1.9684 z"
+           style="fill:url(#linearGradient20);stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><path
+           id="path6022-8-2"
+           style="fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature="0"
+           d="m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -14.494,12.328 -46.02,20.865 -82.672,20.865 -36.727,0 -68.35,-8.6271 -82.804,-20.996 z" /><path
+           id="path6043-0-8"
+           d="m 1618.3,-844.36 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -0.6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55,-10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 z"
+           style="fill:url(#linearGradient21);stroke-width:2.42556"
+           inkscape:connector-curvature="0" /><path
+           id="path6054-4-9"
+           style="fill:url(#linearGradient22);stroke-width:2.42556"
+           inkscape:connector-curvature="0"
+           d="m 1618.3,-800.18 c 0.6187,15.05 37.507,27.164 82.804,27.164 45.168,0 81.851,-12.042 82.672,-27.033 -0.2087,0.17721 -0.4427,0.3519 -0.6561,0.52491 -5.2161,13.55 -39.937,24.014 -82.016,24.014 -42.466,0 -77.55,-10.545 -82.279,-24.277 -0.1684,-0.13312 -0.3624,-0.2549 -0.5249,-0.39347 z" /><path
+           id="path6060-7-3"
+           d="m 1618.8,-754.64 c 4.7284,13.732 39.813,24.277 82.279,24.277 42.079,0 76.8,-10.464 82.016,-24.014 -14.766,12.043 -45.892,20.34 -82.016,20.34 -36.314,0 -67.608,-8.4562 -82.279,-20.602 z"
+           style="fill:#3b5d8b;stroke-width:2.42556"
+           inkscape:connector-curvature="0" /></g></g><g
+       id="g3-3-4-0-4-2-4-7-9"
+       transform="matrix(1.9678686,0,0,2.2330592,-18.60613,665.06411)"
+       style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3-7-9-7-0"
+         width="117.1067"
+         height="40.159355"
+         x="-242.58891"
+         y="-2.1021125"
+         ry="0" /></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-388.72198"
+       y="684.9718"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-1-8"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-388.72198"
+         y="684.9718"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-6-48-5-1">gcc/clang-cross-canadian</tspan><tspan
+         sodipodi:role="line"
+         x="-388.72198"
+         y="704.81787"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan15-3"><tspan
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+   id="tspan16-1">Other</tspan> nativesdk-* <tspan
+   style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+   id="tspan17-1">tools</tspan></tspan></text><g
+       id="g5-3-0"
+       transform="translate(67.77846,532.06475)"><g
+         id="g3-3-4-0-4-2-7-3"
+         transform="matrix(1.1528692,0,0,1.1316675,-197.06241,297.09753)"
+         style="fill:#92d050;fill-opacity:1;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-4"
+           width="95.906448"
+           height="45.542469"
+           x="-241.63611"
+           y="-4.9569407"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:90.0944;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-429.37146"
+         y="314.16446"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5-0"
+         transform="matrix(0.97863561,0,0,1.0218308,0.01378061,-9.2111823)"><tspan
+           x="-429.37146"
+           y="314.16446"
+           id="tspan18"><tspan
+   style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+   id="tspan14">Target</tspan><tspan
+   y="314.16446"
+   id="tspan19"> </tspan></tspan><tspan
+           x="-429.37146"
+           y="332.19322"
+           id="tspan21"><tspan
+             style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+             id="tspan20">Applications</tspan></tspan></text></g><path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:3;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5161-76-6-05)"
+       d="m -370.74912,763.9222 v 55"
+       id="path5151-6-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><g
+       id="g17-9"
+       transform="translate(-46.38552,415.53531)"><ellipse
+         style="fill:#92d050;fill-opacity:1;stroke:#000000;stroke-width:0.850696;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+         id="path17-1"
+         cx="-323.98355"
+         cy="-108.7312"
+         rx="7.3326268"
+         ry="8.3432655"
+         transform="matrix(1.4319561,0,0,1.2585,-123.31892,301.26041)" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-599.29761"
+         y="166.12332"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5-5-9"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-599.29761"
+           y="166.12332"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-2-9-6">2</tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-469.3764"
+       y="623.87811"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-9"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-469.3764"
+         y="623.87811"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-3">Installed SDK</tspan></text><rect
+       style="fill:url(#linearGradient23);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:1.34217;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-61-7-3-3-8-2"
+       width="259.41153"
+       height="181.53241"
+       x="-130.00502"
+       y="710.08643"
+       ry="0" /><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="78.619431"
+       y="682.82428"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-9-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="78.619431"
+         y="682.82428"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-62-6">Target Device</tspan></text><g
+       id="g5-3-0-6"
+       transform="translate(373.8067,339.09419)"><g
+         id="g3-3-4-0-4-2-7-3-9"
+         transform="matrix(1.1528692,0,0,1.1316675,-208.06241,393.09753)"
+         style="fill:#92d050;fill-opacity:1;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-4-4"
+           width="95.906448"
+           height="45.542469"
+           x="-241.63611"
+           y="-4.9569407"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:90.0944;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-429.37146"
+         y="314.16446"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5-0-2"
+         transform="matrix(0.97863561,0,0,1.0218308,-11.000342,95.99999)"><tspan
+           x="-429.37146"
+           y="314.16446"
+           id="tspan23"><tspan
+             style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+             id="tspan22">Target Image</tspan></tspan></text><g
+         id="g3-3-4-0-4-2-7-3-9-8"
+         transform="matrix(1.1528692,0,0,1.1316675,-209.06241,490.43762)"
+         style="fill:#92d050;fill-opacity:1;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-4-4-8"
+           width="95.906448"
+           height="45.542469"
+           x="-241.63611"
+           y="-4.9569407"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;white-space:pre;inline-size:90.0944;display:inline;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-429.37146"
+         y="314.16446"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5-0-2-6"
+         transform="matrix(0.97863561,0,0,1.0218308,-11.986219,184.12891)"><tspan
+           x="-429.37146"
+           y="314.16446"
+           id="tspan26"><tspan
+   style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+   id="tspan25">Target</tspan><tspan
+   y="314.16446"
+   id="tspan27"> </tspan></tspan><tspan
+           x="-429.37146"
+           y="332.19322"
+           id="tspan29"><tspan
+             style="font-weight:normal;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';stroke:none"
+             id="tspan28">Applications</tspan></tspan></text></g><g
+       id="g17-9-6"
+       transform="translate(599.64272,527.56475)"><ellipse
+         style="fill:#92d050;fill-opacity:1;stroke:#000000;stroke-width:0.850696;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+         id="path17-1-4"
+         cx="-323.98355"
+         cy="-108.7312"
+         rx="7.3326268"
+         ry="8.3432655"
+         transform="matrix(1.4319561,0,0,1.2585,-123.31892,301.26041)" /><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-599.29761"
+         y="166.12332"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-5-5-9-1"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-599.29761"
+           y="166.12332"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-2-9-6-2">3</tspan></text></g><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle)"
+       d="m -298.21361,848.74536 169.46449,0.17684"
+       id="path5151-1-2-3"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3)"
+       d="m -331.74912,534.9222 v 109"
+       id="path5151-1-2-3-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3-4)"
+       d="m -55.59836,297.26387 0.818956,415.69134"
+       id="path5151-1-2-3-0-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m -205.49912,299.1722 148.736546,0.006"
+       id="path5151-1-2-3-0-8-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><g
+       transform="matrix(0.51423951,0,0,0.51423951,-188.53505,528.17984)"
+       id="layer1"><path
+         id="rect4253-1"
+         d="m 436.43049,406.2147 c -2.8764,0 -5.192,2.31561 -5.192,5.19196 v 245.61603 c 0,2.8764 2.3156,5.192 5.192,5.192 h 99.3367 c 2.8763,0 5.192,-2.3156 5.192,-5.192 v -7.4309 h 3.7033 c 2.8763,0 5.1919,-2.316 5.1919,-5.1919 v -5.4153 h -11.2519 -91.2811 l -8.7857,-8.7856 V 428.54011 l 5.2811,-5.28126 h 4.8148 v -5.07835 c 0,-2.87635 2.3156,-5.19196 5.1919,-5.19196 h 14.0913 c 2.8764,0 5.192,2.31561 5.192,5.19196 v 6.48994 h 8.0759 7.6865 v -5.00525 c 0,-1.64377 1.3256,-2.96918 2.9692,-2.96918 h 1.8537 c 1.6436,0 2.9651,1.32541 2.9651,2.96918 v 11.86445 c 0,1.64336 -1.3215,2.96897 -2.9651,2.96897 h -1.8537 c -1.6436,0 -2.9692,-1.32561 -2.9692,-2.96897 v -4.78241 h -5.6097 v 43.45833 l 5.411,5.41106 h 30.2147 l 8.3031,8.30298 v 79.73308 l 11.8442,11.8441 h 10.8219 v -8.16114 h -11.6819 l -5.9302,-5.93004 V 430.3087 l -3.5451,-3.54528 h -1.0749 v 5.50846 c 0,2.87635 -2.3156,5.19196 -5.1919,5.19196 h -6.2304 v 20.48787 l -9.1954,9.19953 v 6.79419 h -2.0768 v -7.65419 l 9.1954,-9.1
 9952 v -19.62788 h -5.7841 c -2.8764,0 -5.192,-2.31561 -5.192,-5.19196 V 418.1805 c 0,-2.87635 2.3156,-5.19196 5.192,-5.19196 h 14.0913 c 2.8763,0 5.1919,2.31561 5.1919,5.19196 v 6.50614 h 1.9348 l 4.762,4.76206 v 131.0969 l 4.7134,4.71326 h 10.8219 v -5.41085 c 0,-2.87634 -2.3156,-5.19195 -5.1919,-5.19195 h -3.7033 v -143.2494 c 0,-2.87635 -2.3157,-5.19196 -5.192,-5.19196 z m 8.2463,19.12094 -4.0644,4.06447 v 199.93888 l 7.5689,7.5689 h 90.4212 11.2519 v -8.157 h -11.2519 -71.3448 l -6.9158,-6.9118 v -9.51598 h -5.0662 c -1.6437,0 -2.9651,-1.32561 -2.9651,-2.96896 v -1.85374 c 0,-1.64377 1.3214,-2.96523 2.9651,-2.96523 h 1.0343 v -25.08753 l -10.7733,-10.77331 V 448.00995 l 7.3336,-7.33374 v -3.30977 c -2.4155,-0.44713 -4.2387,-2.54572 -4.2387,-5.09456 v -6.93624 z m 28.43,1.41159 v 5.52465 c 0,2.74032 -2.1085,4.94628 -4.7945,5.15125 v 4.27132 l 9.6376,9.63752 v 21.56697 l 7.9705,7.97443 h 7.8487 l 4.762,4.76206 v 10.98016 h 4.9932 c 1.6437,0 2.9692,1.32146 2.9692,2.96502 v 1.85789
  c 0,1.64357 -1.3255,2.96502 -2.9692,2.96502 h -5.0175 v 5.60981 l -7.4918,7.49179 h -10.8301 l -5.269,5.269 v -2.93678 l 4.4091,-4.40901 h 10.8301 l 6.2749,-6.275 v -4.74981 h -4.7701 c -1.6436,0 -2.9691,-1.32145 -2.9691,-2.96502 v -1.85789 c 0,-1.64356 1.3255,-2.96502 2.9691,-2.96502 h 4.7945 v -10.12037 l -3.5452,-3.54507 h -7.8488 l -9.1873,-9.19142 v -21.56676 l -9.6375,-9.63773 v -5.0904 h -11.2885 v 4.07236 l -7.3336,7.33374 v 118.9444 l 10.7733,10.77331 v 25.94753 h 5.4596 V 530.9068 l 5.695,-5.69495 v 2.93678 l -3.6182,3.61817 v 72.76838 h 1.2209 c 1.6437,0 2.9651,1.32146 2.9651,2.96523 v 1.85374 c 0,1.64335 -1.3214,2.96896 -2.9651,2.96896 h -4.7254 v 8.65598 l 5.6989,5.695 h 70.4849 11.2519 v -8.157 h -11.2519 -48.7152 l -8.2138,-8.21385 v -13.98173 l -10.4731,-10.47322 V 476.38731 l -8.5262,-8.52228 h -4.0278 v 4.83101 c 0,1.64357 -1.3256,2.96523 -2.9692,2.96523 h -1.8537 c -1.6436,0 -2.965,-1.32166 -2.965,-2.96523 v -11.8684 c 0,-1.64377 1.3214,-2.96523 2.965,-2.96523 h 
 1.8537 c 1.6436,0 2.9692,1.32146 2.9692,2.96523 v 4.96061 h 4.8877 l 9.7431,9.73907 V 584.9883 l 10.4731,10.47321 v 13.98173 l 6.997,6.9971 h 47.8552 11.2519 v -8.16114 h -11.2519 -35.2323 l -25.5258,-25.52573 v -47.07651 l 21.6927,-21.69677 h 7.8731 l 7.3864,-7.38628 v -9.33742 l -9.8688,-9.87282 v -8.06373 h 2.0768 v 7.20373 l 9.8687,9.87282 v 11.05721 l -8.6032,8.60327 h -7.869 l -20.4799,20.47978 v 45.35257 l 24.3089,24.3131 h 34.3724 11.2519 v -8.15719 h -11.2519 -33.3948 l -10.4975,-10.4973 v -24.36585 h -6.0235 c -2.8763,0 -5.1919,-2.31561 -5.1919,-5.19196 v -14.09118 c 0,-2.87634 2.3156,-5.19195 5.1919,-5.19195 h 5.8937 v -11.02086 l 6.3398,-6.3398 h 12.3228 l 6.6198,6.61975 v 38.59887 l 19.1697,19.16579 h 10.8219 v -8.15718 h -11.6819 l -13.061,-13.06089 v -79.73308 l -7.0862,-7.08619 h -30.2147 l -6.6279,-6.6239 v -44.32227 z m 32.2672,20.91382 a 4.450248,4.450248 0 0 1 4.4496,4.45387 4.450248,4.450248 0 0 1 -4.4496,4.4495 4.450248,4.450248 0 0 1 -4.4497,-4.4495 4.450248,4
 .450248 0 0 1 4.4497,-4.45387 z m 17.7987,1.78894 h 1.8536 c 1.6437,0 2.9692,1.3254 2.9692,2.96897 v 11.86445 c 0,1.64377 -1.3255,2.96918 -2.9692,2.96918 h -1.8536 c -1.6437,0 -2.9651,-1.32541 -2.9651,-2.96918 v -11.86445 c 0,-1.64357 1.3214,-2.96897 2.9651,-2.96897 z m -54.5156,6.55889 a 4.450248,4.450248 0 0 1 4.4497,4.44951 4.450248,4.450248 0 0 1 -4.4497,4.44972 4.450248,4.450248 0 0 1 -4.4497,-4.44972 4.450248,4.450248 0 0 1 4.4497,-4.44951 z m 12.6027,40.05096 a 4.450248,4.450248 0 0 1 4.4537,4.44972 4.450248,4.450248 0 0 1 -4.4537,4.44971 4.450248,4.450248 0 0 1 -4.4497,-4.44971 4.450248,4.450248 0 0 1 4.4497,-4.44972 z m 20.5204,27.36327 -5.123,5.12301 v 10.16087 h 6.1249 c 2.8763,0 5.1919,2.31561 5.1919,5.19195 v 14.09118 c 0,2.87635 -2.3156,5.19196 -5.1919,5.19196 h -5.9951 v 23.5017 l 9.2806,9.28467 h 32.5349 11.2519 v -8.16092 h -11.6819 l -20.3865,-20.38258 v -38.59888 l -5.4029,-5.40296 z m -45.9286,10.27447 a 4.450248,4.450248 0 0 1 4.4497,4.45366 4.450248,4.450248 0 
 0 1 -4.4497,4.44972 4.450248,4.450248 0 0 1 -4.4496,-4.44972 4.450248,4.450248 0 0 1 4.4496,-4.45366 z m -0.9288,13.36119 h 1.8537 c 1.6436,0 2.9691,1.32146 2.9691,2.96502 v 11.8684 c 0,1.64377 -1.3255,2.96523 -2.9691,2.96523 h -1.8537 c -1.6437,0 -2.9651,-1.32146 -2.9651,-2.96523 v -11.8684 c 0,-1.64356 1.3214,-2.96502 2.9651,-2.96502 z m 55.059,31.23273 a 4.450248,4.450248 0 0 1 4.4497,4.44972 4.450248,4.450248 0 0 1 -4.4497,4.45366 4.450248,4.450248 0 0 1 -4.4496,-4.45366 4.450248,4.450248 0 0 1 4.4496,-4.44972 z m -54.6737,69.07729 a 4.450248,4.450248 0 0 1 4.4497,4.4497 4.450248,4.450248 0 0 1 -4.4497,4.4498 4.450248,4.450248 0 0 1 -4.4496,-4.4498 4.450248,4.450248 0 0 1 4.4496,-4.4497 z m 15.5759,0 a 4.450248,4.450248 0 0 1 4.4496,4.4497 4.450248,4.450248 0 0 1 -4.4496,4.4498 4.450248,4.450248 0 0 1 -4.4497,-4.4498 4.450248,4.450248 0 0 1 4.4497,-4.4497 z m 37.4551,0.5558 h 11.8685 c 1.6436,0 2.9651,1.3214 2.9651,2.9652 v 1.8535 c 0,1.6438 -1.3215,2.9692 -2.9651,2.9692 h -11.8
 685 c -1.6437,0 -2.9651,-1.3254 -2.9651,-2.9692 v -1.8535 c 0,-1.6438 1.3214,-2.9652 2.9651,-2.9652 z"
+         style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;color-interpolation:sRGB;color-interpolation-filters:linearRGB;fill:#808080;fill-opacity:1;stroke:none;stroke-width:2.5;marker:none;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate" /></g></g><style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style></svg>

-- 
2.54.0


