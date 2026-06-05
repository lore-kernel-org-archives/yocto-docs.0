Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEE4CD8C88
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:26:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8181.1780665988198629788
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qgp/HGTz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 63B04C58479
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD13F5FED1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:26:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E6D0106A1058;
	Fri,  5 Jun 2026 15:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780665986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AZglzB4ClKQUHwwhsigxmtxnq/eB7r3ZJdqPHEIFfeE=;
	b=Qgp/HGTzVz5Oy+17dr15PseFlMF4BWciS7tqX0Z59zjP2Oh9UVFEu0i+OifeiStXyPQycP
	ceuYwQuZCl3QnYgqwNnz6MEWbaVD1qzoCXpyjIfzZ59h9Llp9MXv6fFDpQncdL4E1RaA9p
	0GZhN3A8yg4SKKqDbJESjouCBVncld5NIBuEY8iboPH71wkqzZO3Gu/6sxmUmgqZ3LOKqA
	gI4b+g3Q1QRT8JES9oAB4kmHQ/pNeWFKCsUTVYIO+H99d1AxHtCaoZ4jWtcpn6OSg3586v
	4pqp5qBiMxu44kzuyfnLTWjkB3UyKQGz0/tRBIjzuw+GNp1eHVNWqWLtQb3GNQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 05 Jun 2026 15:26:12 +0200
Subject: [PATCH 08/10] overview-manual/concepts: source-input.png: convert
 to SVG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-udpate-outdated-graphics-v1-8-16f2c348222c@bootlin.com>
References: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
In-Reply-To: <20260605-udpate-outdated-graphics-v1-0-16f2c348222c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=175811;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zwEdRXB9GNZD/LNugvmjbTAXdiTuh1EVhSvYsGmH+0s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqIs558F/OVKt0d6cH2rgeDDwlEcpdaID3grDHL
 rEHb4wC+QSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaiLOeQAKCRDRgEFAKaOo
 NvgdD/9iCjTNEC3Tn1C1Xa3Rajunlfx2T3DRo+sQaNM5BgQK4lqiM1imrQHqg6IGCAhfB6m0UC8
 NbdxpVlxuKREwufGtzAXshUBwLAf2iOS+xHAD21IfJbVABGrJzmyOMQpcYMlysEOa8tRvkUfAfD
 UD8ZO244u+T7lNVCOah3yuc800aDtvaQSCdw3jOKyCsEtDfHx9m88b7zH1DhmSrx6rmhCjHhkDR
 QrD0CSXr0+5FAjEkgPDfSUfUL5s1MA7mfwBwtGFmkJYt4Nv2veHX7bu1dMBCfc9NLU+cVWQ5AKV
 I9G8kLeoEV5OhV1guRPekCfnZ8OsKug5EMMkZOaaTHjn78Lp36/TWo5DHCcPfpHjD8OuqRNP8U+
 x7xUhwJTnFZH0hVP0PX8PmOClCRmMfvQjSQ1qIUNPp8AFQtYDW9ZQcSXGEfzwQudoPmM1+fhLn/
 NGgFPSC8ignN2581qCHa6Y/8Fkmsqr8zUnQrz5JKUBYwFkx0ldMzVDGbC03DZibd9mzBN1cNNru
 EeqRDTdBJSpGBY1H6p2dEBOd3hJowGj7Fa3s+GvrHuDcZZvwX0TRToLuPjD6QPYgCagl9jWcr4Y
 KFsMO7sgbFHd76u/ef0cvaYNgC1GQRGB0IVA1lZW+AQdvcAS5u2j2SV+5lpVQ2mAxdqJTslobv+
 sQPG6g2pnBibK8g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9598

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../overview-manual/figures/source-input.png       |  Bin 51170 -> 0 bytes
 documentation/overview-manual/svg/source-input.svg | 1751 ++++++++++++++++++++
 3 files changed, 1752 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 16d3f2ef5..16d220ff7 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -505,7 +505,7 @@ The remainder of this section provides a deeper look into the source
 files and the mirrors. Here is a more detailed look at the source file
 area of the :ref:`general workflow figure <overview-manual/concepts:openembedded build system concepts>`:
 
-.. image:: figures/source-input.png
+.. image:: svg/source-input.*
    :align: center
    :width: 70%
 
diff --git a/documentation/overview-manual/figures/source-input.png b/documentation/overview-manual/figures/source-input.png
deleted file mode 100644
index 6b6ba4b3389d2aa7e7bd78f176b2b25e77bf9d3a..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 51170
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
Ofx*+&&t;ucLK6UgL_q!k

diff --git a/documentation/overview-manual/svg/source-input.svg b/documentation/overview-manual/svg/source-input.svg
new file mode 100644
index 000000000..669ce7da9
--- /dev/null
+++ b/documentation/overview-manual/svg/source-input.svg
@@ -0,0 +1,1751 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="630.73926"
+   height="779.93872"
+   viewBox="0 0 630.73926 779.9386"
+   sodipodi:docname="source-input.svg"
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
+     inkscape:zoom="1"
+     inkscape:cx="-271"
+     inkscape:cy="274"
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
+     id="defs6"><rect
+       x="229.99999"
+       y="620.99998"
+       width="76.999998"
+       height="65.999998"
+       id="rect13" /><rect
+       x="470.22601"
+       y="101.82337"
+       width="156.97771"
+       height="131.52187"
+       id="rect8" /><rect
+       x="450.427"
+       y="113.13708"
+       width="156.27058"
+       height="135.05739"
+       id="rect7" /><linearGradient
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
+         id="path5159-5-1" /></marker><marker
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
+         id="path5159-5-1-4" /></marker><marker
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
+         id="path5159-5-1-6-6" /></marker><marker
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
+       xlink:href="#linearGradient1"
+       id="linearGradient4"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="translate(-300.12078,-23.858598)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient5"
+       gradientUnits="userSpaceOnUse"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><rect
+       x="470.22601"
+       y="101.82337"
+       width="156.97771"
+       height="131.52187"
+       id="rect8-1" /><rect
+       x="470.22601"
+       y="101.82337"
+       width="156.97771"
+       height="131.52187"
+       id="rect8-3" /><rect
+       x="450.427"
+       y="113.13708"
+       width="156.27058"
+       height="135.05739"
+       id="rect7-4" /><rect
+       x="470.22601"
+       y="101.82337"
+       width="36.769562"
+       height="28.991388"
+       id="rect8-9" /><rect
+       x="470.22601"
+       y="101.82337"
+       width="156.97771"
+       height="131.52187"
+       id="rect8-3-0" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient9"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="translate(-300.12078,-23.858598)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient10"
+       gradientUnits="userSpaceOnUse"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><rect
+       x="450.427"
+       y="113.13708"
+       width="156.27058"
+       height="135.05739"
+       id="rect7-4-6" /><rect
+       x="470.22601"
+       y="101.82337"
+       width="36.769562"
+       height="28.991388"
+       id="rect8-9-4" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient11"
+       gradientUnits="userSpaceOnUse"
+       gradientTransform="translate(-300.12078,-23.858598)"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><linearGradient
+       inkscape:collect="always"
+       xlink:href="#linearGradient1"
+       id="linearGradient12"
+       gradientUnits="userSpaceOnUse"
+       x1="63.501534"
+       y1="-81.300072"
+       x2="63.501534"
+       y2="243.73267" /><marker
+       style="overflow:visible"
+       id="Triangle-3-4-1"
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
+         id="path135-3-7-0" /></marker><marker
+       style="overflow:visible"
+       id="Triangle-3-4-1-7"
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
+         id="path135-3-7-0-7" /></marker><marker
+       style="overflow:visible"
+       id="Triangle-3-4-9"
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
+         id="path135-3-7-3" /></marker></defs><g
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
+         width="197.43489"
+         height="242.55882"
+         x="-398.63571"
+         y="-56.208744"
+         ry="0" /></g><text
+       xml:space="preserve"
+       transform="translate(-45.24912,7.4222032)"
+       id="text19"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:9.33333px;line-height:119%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect19);display:inline;fill:none;fill-opacity:1;stroke:#000000;stroke-width:0.5;stroke-linejoin:bevel;stroke-miterlimit:0" /><g
+       id="g5"
+       transform="translate(-135.21275,-23.334524)"><g
+         id="g3-3-4-0-4-2"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7"
+           width="131.2997"
+           height="36.134903"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-451.54962"
+         y="317.60059"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-8"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-451.54962"
+           y="317.60059"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48-7">busybox-1.28.3.tar.bz2</tspan></text></g><g
+       id="g3-3-4-0-4-2-4-2"
+       transform="matrix(1.5783087,0,0,1.1274538,39.82036,422.14561)"
+       style="fill:#b3b3b3;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1" /><g
+       id="g5-9"
+       transform="translate(-109.621,143.59294)" /><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-565.14502"
+       y="213.92305"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-565.14502"
+         y="213.92305"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0">Upstream Project Releases</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-655.03748"
+       y="554.37195"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-655.03748"
+         y="554.37195"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-0">Source Material</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-669.50592"
+       y="263.78635"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-669.50592"
+         y="263.78635"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8">busybox</tspan></text><g
+       id="g5-2"
+       transform="translate(-135.21275,44.036808)"><g
+         id="g3-3-4-0-4-2-5"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4"
+           width="131.2997"
+           height="36.134903"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-465.27795"
+         y="317.60059"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-8-4"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-465.27795"
+           y="317.60059"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48-7-9">qtbase-5.5.1.tar.gz</tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-689.85254"
+       y="329.71832"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-9"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-689.85254"
+         y="329.71832"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-3">qt</tspan></text><g
+       id="g5-2-0"
+       transform="translate(-135.21275,113.9485)"><g
+         id="g3-3-4-0-4-2-5-5"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-0"
+           width="131.2997"
+           height="36.134903"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-463.83286"
+         y="316.9086"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-8-4-2"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-463.83286"
+           y="316.9086"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48-7-9-9">dbus-1.13.2.tar.xz</tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-680.85254"
+       y="398.13641"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-9-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-680.85254"
+         y="398.13641"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-3-3">dbus</tspan></text><g
+       id="g5-2-0-1"
+       transform="translate(-135.21275,179.24137)"><g
+         id="g3-3-4-0-4-2-5-5-7"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-0-4"
+           width="156.38857"
+           height="33.626217"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-430.49326"
+         y="316.21661"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-8-4-2-3"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-430.49326"
+           y="316.21661"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48-7-9-9-1">Tarball, ZIP file, or other archive files</tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-668.82587"
+       y="462.03433"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-9-4-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-668.82587"
+         y="462.03433"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-3-3-6">&lt;recipe&gt;</tspan></text><g
+       id="g3-3-4-0-4-0"
+       transform="matrix(1.4319561,0,0,1.2585,177.70453,300.5533)"
+       style="fill:url(#linearGradient5);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:url(#linearGradient4);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3-3"
+         width="97.19252"
+         height="243.68256"
+         x="-398.63571"
+         y="-56.208744"
+         ry="0" /></g><g
+       id="g5-3"
+       transform="translate(165.8107,-24.795627)"><g
+         id="g3-3-4-0-4-2-3"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-7"
+           width="68.577522"
+           height="89.444473"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         transform="translate(-876.89706,209.62952)"
+         id="text7"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect7);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388" /><text
+         xml:space="preserve"
+         transform="translate(-1008.4189,208.21531)"
+         id="text8"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect8);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"><tspan
+           x="470.22656"
+           y="112.33859"
+           id="tspan2"><tspan
+             style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+             id="tspan1">src/
+</tspan></tspan><tspan
+           x="470.22656"
+           y="128.57888"
+           id="tspan4"><tspan
+             style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+             id="tspan3">test/
+</tspan></tspan><tspan
+           x="470.22656"
+           y="144.81918"
+           id="tspan6"><tspan
+             style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+             id="tspan5">README.md
+</tspan></tspan><tspan
+           x="470.22656"
+           y="161.05947"
+           id="tspan9"><tspan
+             style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+             id="tspan7">...</tspan></tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-330.91696"
+       y="213.92305"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-6"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-330.91696"
+         y="213.92305"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-5">Local Projects</tspan></text><rect
+       style="fill:url(#linearGradient11);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1;fill-opacity:1;fill-rule:evenodd"
+       id="rect917-0-6-27-0-61-7-3-3-3-6"
+       width="418.65945"
+       height="80.741798"
+       x="-398.63571"
+       y="-56.208744"
+       ry="0"
+       transform="matrix(1.4319561,0,0,1.2585,-123.7986,647.19161)" /><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-331.56406"
+       y="262.35648"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-2"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-331.56406"
+         y="262.35648"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-6">Local Source Tree</tspan></text><rect
+       style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:1.33371;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-61-7-3-3-7-7-7"
+       width="108.2365"
+       height="100.84451"
+       x="-379.88535"
+       y="405.29327"
+       ry="0" /><text
+       xml:space="preserve"
+       transform="translate(-842.06122,313.43943)"
+       id="text8-8"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect8-3);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"><tspan
+         x="470.22656"
+         y="112.33859"
+         id="tspan11"><tspan
+           style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+           id="tspan10">src/
+</tspan></tspan><tspan
+         x="470.22656"
+         y="128.57888"
+         id="tspan13"><tspan
+           style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+           id="tspan12">test/
+</tspan></tspan><tspan
+         x="470.22656"
+         y="144.81918"
+         id="tspan15"><tspan
+           style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+           id="tspan14">README.md
+</tspan></tspan><tspan
+         x="470.22656"
+         y="161.05947"
+         id="tspan17"><tspan
+           style="font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';fill:#000000"
+           id="tspan16">...</tspan></tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-331.00516"
+       y="389.59842"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-2-9"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-331.00516"
+         y="389.59842"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-6-7">Local Source Tree</tspan></text><g
+       id="g3-3-4-0-4-0-0"
+       transform="matrix(1.4319561,0,0,1.2585,336.23649,300.5533)"
+       style="fill:url(#linearGradient10);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:url(#linearGradient9);fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-61-7-3-3-3-1"
+         width="97.19252"
+         height="243.68256"
+         x="-398.63571"
+         y="-56.208744"
+         ry="0" /></g><g
+       id="g5-3-9"
+       transform="translate(324.34266,-26.500638)"><g
+         id="g3-3-4-0-4-2-3-6"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-7-2"
+           width="67.233467"
+           height="36.762077"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         transform="translate(-876.89706,209.62952)"
+         id="text7-1"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect7-4);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388" /><text
+         xml:space="preserve"
+         transform="translate(-974.47778,213.87216)"
+         id="text8-2"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect8-9);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"><tspan
+           x="470.22656"
+           y="112.33859"
+           id="tspan19"><tspan
+             style="fill:#000000"
+             id="tspan18">Git</tspan></tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-168.92412"
+       y="215.41582"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-6-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-168.92412"
+         y="215.41582"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-5-3">SCMs</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-197.75041"
+       y="261.37988"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-2-1"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-197.75041"
+         y="261.37988"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-6-1">meta-qt6</tspan></text><g
+       id="g5-3-9-4"
+       transform="translate(324.18161,38.895362)"><g
+         id="g3-3-4-0-4-2-3-6-8"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-7-2-5"
+           width="67.233467"
+           height="36.762077"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         transform="translate(-876.89706,209.62952)"
+         id="text7-1-8"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect7-4-6);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388" /><text
+         xml:space="preserve"
+         transform="translate(-974.47778,213.87216)"
+         id="text8-2-2"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect8-9-4);display:inline;fill:none;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"><tspan
+           x="470.22656"
+           y="112.33859"
+           id="tspan21"><tspan
+             style="fill:#000000"
+             id="tspan20">Git</tspan></tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-168.29071"
+       y="325.37872"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-2-1-6"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-168.29071"
+         y="325.37872"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-6-1-6">meta-raspberrypi</tspan></text><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3-4)"
+       d="m -561.1797,536.26595 -3e-5,25.45584"
+       id="path5151-1-2-3-0-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3-4-9)"
+       d="m -501.69437,678.65958 -0.0884,17.94283"
+       id="path5151-1-2-3-0-8-8"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3-4-1)"
+       d="m -324.62488,537.17701 -3e-5,25.45584"
+       id="path5151-1-2-3-0-8-3"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><path
+       style="display:inline;fill:#99c1f1;fill-rule:evenodd;stroke:#82c1f1;stroke-width:4;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#Triangle-3-4-1-7)"
+       d="m -166.11869,537.17701 -3e-5,25.45584"
+       id="path5151-1-2-3-0-8-3-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" /><g
+       id="g72820-3"
+       transform="matrix(3.2001899,0,0,4.5594279,-851.0044,187.40622)"><rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6"
+         width="109.58257"
+         height="27.67444"
+         x="80.324936"
+         y="126.42556"
+         ry="0" /><rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6-5"
+         width="46.503666"
+         height="52.3773"
+         x="70.012787"
+         y="114.7747"
+         ry="0" /></g><g
+       id="g5-2-0-1-4"
+       transform="translate(-131.65808,312.76109)"><g
+         id="g3-3-4-0-4-2-5-5-7-5"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-0-4-1"
+           width="156.38857"
+           height="33.626217"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-430.49326"
+         y="316.21661"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-8-4-2-3-0"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-430.49326"
+           y="316.21661"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48-7-9-9-1-3">Remotely Stored Archive Files</tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-665.1936"
+       y="592.70148"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-9-4-4-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-665.1936"
+         y="592.70148"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-3-3-6-8">Mirrors</tspan></text><g
+       id="g5-2-0-1-4-6"
+       transform="translate(151.95923,312.46107)"><g
+         id="g3-3-4-0-4-2-5-5-7-5-0"
+         transform="matrix(1.5783087,0,0,1.1274538,-138.70372,297.1726)"
+         style="fill:#b3b3b3;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+           style="fill:#b3b3b3;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"
+           id="rect917-0-6-27-0-61-7-3-3-7-4-0-4-1-4"
+           width="156.38857"
+           height="33.626217"
+           x="-258.21268"
+           y="2.5691159"
+           ry="0" /></g><text
+         xml:space="preserve"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.423px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="-430.49326"
+         y="316.21661"
+         id="text1185-3-5-5-9-7-4-3-65-0-6-0-50-8-4-2-3-0-6"
+         transform="scale(0.97863561,1.0218308)"><tspan
+           sodipodi:role="line"
+           x="-430.49326"
+           y="316.21661"
+           style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+           id="tspan60047-3-7-0-6-6-7-6-48-7-9-9-1-3-7">Locally Stored Archive Files</tspan></text></g><g
+       id="g3-3-4-0-4-0-9"
+       transform="matrix(1.4319561,0,0,1.2585,-123.7986,647.19161)"
+       style="fill:url(#linearGradient12);stroke:#000000;stroke-width:0.999808;stroke-dasharray:none;stroke-opacity:1"><rect
+         style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-2-5"
+         width="73.435295"
+         height="98.634186"
+         x="-335.03879"
+         y="92.479912"
+         ry="5.490119" /><rect
+         style="fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-6-3-5-4-2-5"
+         width="14.850742"
+         height="14.215063"
+         x="-117.9604"
+         y="345.79385"
+         ry="0"
+         transform="matrix(0.68121349,0.73208482,-0.63871044,0.76944719,0,0)" /><rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-0-6-27-0-6-3-5-4-2-5-7"
+         width="14.850742"
+         height="14.215063"
+         x="-181.85126"
+         y="278.37546"
+         ry="0"
+         transform="matrix(0.68121349,0.73208482,-0.63871044,0.76944719,0,0)" /><text
+         xml:space="preserve"
+         transform="matrix(0.69834543,0,0,0.79459674,-485.55103,-365.79875)"
+         id="text13"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:100%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect13);display:inline;fill:#00b0f0;fill-opacity:1;stroke:none;stroke-width:4;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:5.97552, 1.49388"
+         x="38"
+         y="0"><tspan
+           x="247.37338"
+           y="630.71998"
+           id="tspan23"><tspan
+             style="fill:#000000"
+             id="tspan22">Source </tspan></tspan><tspan
+           x="230.24678"
+           y="644.05329"
+           id="tspan26"><tspan
+             style="fill:#000000"
+             id="tspan25">Fetching and </tspan></tspan><tspan
+           x="236.95341"
+           y="657.3866"
+           id="tspan28"><tspan
+             style="fill:#000000"
+             id="tspan27">Unpacking</tspan></tspan></text></g><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:12px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-365.16635"
+       y="592.4079"
+       id="text1185-3-5-5-9-7-4-3-65-0-6-8-1-4-9-4-4-7-6"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-365.16635"
+         y="592.4079"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:Sans;-inkscape-font-specification:'Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-6-6-7-8-0-8-3-3-6-8-0">Premirrors</tspan></text><text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-573.16071"
+       y="745.91125"
+       id="text1185-3-5-5-9-7"
+       transform="scale(1.0155894,0.9846499)"><tspan
+         sodipodi:role="line"
+         x="-573.16071"
+         y="745.91125"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.31058px"
+         id="tspan60047-3">BitBake</tspan></text></g><style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style></svg>

-- 
2.54.0


