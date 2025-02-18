Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF9CC021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15636.1739869926321398117
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 01:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g8ERaA39;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B276F4328A;
	Tue, 18 Feb 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739869925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=waSZFXfR8NyGaqQqbEdTLYf1FWervMvMmp3xVAnXt+w=;
	b=g8ERaA39ZWjoXDC7oxvIS2Kqnsh+Q92uLcRJqXNG5Mmw4DkHHe9W+LdbFRdsGHAuMQnl4W
	mzhxMjfNkDHNNFG1z69BmeFLA55NtagZtHzDAbio7I5yVmQaTgWdLZZ508GkaZJbobo4j7
	bhOm9iZmLgq/0kVYyrcjCXsoLSVUUQs8PN08F4prhULKaJvHOyPUJURxlYMhVsaDqEv807
	vbU6HlnfYqshVbUXRWMwuB4hsFmYpo9fteUNOhaSHmr1HiO3nlPvpZgdPTqWTLCHPgOWW0
	WtIH9tgYyBkf7x1lUVCBX5dfLsQ83TSa3VtADD92lejCohS+XcyyaMJNLQQaEQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Feb 2025 10:11:57 +0100
Subject: [PATCH 2/6] overview-manual: convert patching.png to svg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-overview-figures-v1-2-75d23b5e7a88@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
In-Reply-To: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=152299;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RG2OHBxyzMxiwVA0CeFRdgcmiHm+vJbrnuEO1jFQGIA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntE7jKXM7sgjzFpnWjoa8paQDD/5TXobEB79Bj
 uSMQ1bkFeWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7RO4wAKCRDRgEFAKaOo
 NiGMD/48odCeQNY2RLundLJmxwH6m1HojDg95m9UmmyPEQm3QoQwCyTDJG0jsqO6g5admkaIVKP
 XuAlmXv5Mb97DswRKiVKp+IYgUbgNDoRCRqtBwiR+/m5wko7leWovB5Pi+Kkxs0oNlRjhCR6f5u
 3t2RgbQMKd0aD6s3AQFI+ubQE1xZN79/MwRYtPXvMstVhfINg/FTaxQowoO1bdwkl1nDieF5axp
 60/q/1+AYNqrRK1r9AS4cXhIYcBnN9xsEFbV0GTDT3qcZJcF+yXP//tJNwbk/7CN0BgorPbEFLV
 VQVX1pGFZjxp0yQMdmgKulOF58t6VDkpWzYfCt0ciCbn8n8nWTGVLZuBHBi7zjXMXpBisHdq0tr
 Gi11rLTU9U/l7FOO2jW6IwvGJpXZDkqKdjL/zAd5o+NXhFZD/AabWRrUWTe+7okn2IcL+ImpNIv
 ih1MSiFZtnXEOqVvIxNFWkqvD9g+yO/iiJT++bFugh6z6oMvvtLRPVAvhbQHj5Gz9AiTjBPw6S/
 qVlFrtDwHvOK51/21ERVWToeg2HlWkPmNXpC5BvlibRC4q1ewAP1dZRtLwfg3+NILtc9XbLUSPj
 ljRviIUuPVAgiVOxDCxRMHQ1FHyNyGs5bkO+k8Yv+telx/YHkoWwW2kMd9UF3Y3nGa+PSVtIkUB
 ovyEIY0ytgfNkqQ==
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
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 09:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6412

Convert the png file to an SVG file, and add the UNPACKDIR reference.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 documentation/overview-manual/figures/patching.png |  Bin 57414 -> 0 bytes
 documentation/overview-manual/svg/patching.svg     | 1350 ++++++++++++++++++++
 3 files changed, 1351 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 55669cd3f61449043de9fa6de79b39ae7596bcfe..5c6af847e57c4dba10296a34a73ef08d47a947d3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -764,7 +764,7 @@ Patching
 Once source code is fetched and unpacked, BitBake locates patch files
 and applies them to the source files:
 
-.. image:: figures/patching.png
+.. image:: svg/patching.*
    :width: 100%
 
 The :ref:`ref-tasks-patch` task uses a
diff --git a/documentation/overview-manual/figures/patching.png b/documentation/overview-manual/figures/patching.png
deleted file mode 100644
index 80fba7e7cf1e49e0fd0ea033c73f6edaac0d7967..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 57414
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
PpaGCB*g(5f%P!(SFPg-0

diff --git a/documentation/overview-manual/svg/patching.svg b/documentation/overview-manual/svg/patching.svg
new file mode 100644
index 0000000000000000000000000000000000000000..c9b14779fce4d452b6cace0f92a91ae5ab636a43
--- /dev/null
+++ b/documentation/overview-manual/svg/patching.svg
@@ -0,0 +1,1350 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="722.07703"
+   height="533.2287"
+   viewBox="0 0 722.07703 533.2286"
+   sodipodi:docname="patching.svg"
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
+     inkscape:cx="311.98079"
+     inkscape:cy="489.21904"
+     inkscape:window-x="2271"
+     inkscape:window-y="175"
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
+  </defs>
+  <g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(69.846747,14.267592)">
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.09493;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
+       id="rect1"
+       width="718.9325"
+       height="528.83362"
+       x="-68.305695"
+       y="-11.621885" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="142.22464"
+       y="565.10297"
+       id="text907"><tspan
+         sodipodi:role="line"
+         id="tspan905"
+         x="142.22464"
+         y="565.10297" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="98.363503"
+       y="637.8432"
+       id="text911"><tspan
+         sodipodi:role="line"
+         id="tspan909"
+         x="98.363503"
+         y="637.8432" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-59.575905"
+       y="580.05695"
+       id="text915"><tspan
+         sodipodi:role="line"
+         id="tspan913"
+         x="-59.575905"
+         y="580.05695" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
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
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.31058px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-13.062568"
+       y="158.6487"
+       id="text1185-3-5-5-9-7"
+       transform="scale(1.0155894,0.9846499)"><tspan
+         sodipodi:role="line"
+         x="-13.062568"
+         y="158.6487"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:16px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.31058px"
+         id="tspan60047-3">BitBake</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:42.5884px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
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
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0.868487;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-4"
+       width="111.60363"
+       height="87.583687"
+       x="-29.059187"
+       y="313.23886"
+       ry="4.3906641" />
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
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3"
+       width="98.558929"
+       height="60.359337"
+       x="-21.630077"
+       y="334.39767"
+       ry="3.0258784" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5"
+       width="121.85956"
+       height="92.953278"
+       x="-31.285583"
+       y="204.8772"
+       ry="4.6598477" />
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
+       style="font-weight:normal;font-size:9.75161652px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="73.865288"
+       y="29.948204"
+       id="text1185-3-5-5-9-7-93-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="73.865288"
+         y="29.948204"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.75161652px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2-9">Local</tspan><tspan
+         sodipodi:role="line"
+         x="73.865288"
+         y="44.345493"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.75161652px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
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
+       style="font-weight:normal;font-size:9.75161652px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="155.51562"
+       y="30.276878"
+       id="text1185-3-5-5-9-7-93-9-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="155.51562"
+         y="30.276878"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.75161652px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2-9-3">SCMs</tspan><tspan
+         sodipodi:role="line"
+         x="155.51562"
+         y="44.674168"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.75161652px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
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
+       x="151.0392"
+       y="118.62856"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2-5"
+       width="11.829602"
+       height="11.269682"
+       x="214.60315"
+       y="185.23712"
+       ry="0"
+       transform="matrix(0.71126059,0.70292843,-0.67005221,0.74231397,0,0)" />
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
+       style="font-weight:bold;font-size:10.976224px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="314.59457"
+       y="200.0639"
+       id="text1185-3-5-5-9-7-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="314.59457"
+         y="200.0639"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.976224px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-1">Build Directory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.6666px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="-6.3590012"
+       y="22.655539"
+       id="text1185-3-5-5-9-7-93"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="-6.3590002"
+         y="22.655539"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66660028px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-6">Upstream</tspan><tspan
+         sodipodi:role="line"
+         x="-6.3590002"
+         y="37.05283"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66660028px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan1">Project</tspan><tspan
+         sodipodi:role="line"
+         x="-6.3590021"
+         y="51.450119"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66660028px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2">Releases</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4"
+       width="72.495255"
+       height="33.113335"
+       x="-6.165905"
+       y="246.60416" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:10.97622368px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="29.038769"
+       y="233.26717"
+       id="text1185-3-5-5-9-7-4"
+       transform="scale(0.97863565,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="29.038769"
+         y="233.26717"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.97622368px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7">Patch application</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:10.9762239px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="-20.573158"
+       y="320.02142"
+       id="text1185-3-5-5-9-7-4-9"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-20.573158"
+         y="320.02142"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762239px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-7">Recipes</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:9.75161624px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="30.556973"
+       y="260.6658"
+       id="text1185-3-5-5-9-7-4-3"
+       transform="scale(0.97863565,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="30.556973"
+         y="260.6658"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:9.75161624px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0">do_patch</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="283.34647"
+       y="251.46193"
+       id="text1185-3-5-5-9-7-4-3-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="251.46193"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan9">tmp</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="264.79532"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan10">  work</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="278.12869"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan11">    ${PACKAGE_ARCH}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="291.46207"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan13">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="304.79544"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan14">        ${PV}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="318.12881"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan15">          sources-unpack</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="331.46219"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan29">          ${BP}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="344.79559"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan16">    ${MACHINE}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="358.12897"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan17">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="371.46234"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan18">        ${PV}</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="384.79572"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19">          sources-unpack</tspan><tspan
+         sodipodi:role="line"
+         x="283.34647"
+         y="398.12909"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan30">          ${BP}</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-17.667521"
+       y="352.20374"
+       id="text1185-3-5-5-9-7-4-3-6-1"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="-17.667521"
+         y="352.20374"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan30-1">SRC_URI = &quot;.... \</tspan><tspan
+         sodipodi:role="line"
+         x="-17.667521"
+         y="363.31485"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan41">  &lt;patch_file&gt; \</tspan><tspan
+         sodipodi:role="line"
+         x="-17.667521"
+         y="374.42599"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan42">  ... \</tspan><tspan
+         sodipodi:role="line"
+         x="-17.667521"
+         y="385.53711"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.8889px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan43">&quot;</tspan></text>
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0.536476;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-4-5"
+       width="65.639488"
+       height="56.821266"
+       x="51.129642"
+       y="416.6058"
+       ry="2.848511" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-3-3"
+       width="49.498829"
+       height="29.610401"
+       x="58.23616"
+       y="436.46481"
+       ry="1.4844012" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="58.540276"
+       y="422.2988"
+       id="text1185-3-5-5-9-7-4-9-8"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="58.540276"
+         y="422.2988"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.9762px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-7-8">Patch files</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:8.88889984px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="62.508091"
+       y="450.11035"
+       id="text1185-3-5-5-9-7-4-3-6-1-3"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="62.508091"
+         y="450.11035"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.88889984px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan43-6">*.patch</tspan><tspan
+         sodipodi:role="line"
+         x="62.508091"
+         y="460.82059"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8.88889984px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan46">*.diff</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="581.10162"
+       y="251.27928"
+       id="text1185-3-5-5-9-7-4-3-6-7"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="581.10162"
+         y="251.27928"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3">TMPDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="584.03009"
+       y="303.93213"
+       id="text1185-3-5-5-9-7-4-3-6-7-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="584.03009"
+         y="303.93213"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5">WORKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="584.03009"
+       y="318.21982"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="584.03009"
+         y="318.21982"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3">UNPACKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="583.23248"
+       y="332.53738"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="583.23248"
+         y="332.53738"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3-8">S</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.6666px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="73.394455"
+       y="97.290146"
+       id="text1185-3-5-5-9-7-93-9-5"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="73.394455"
+         y="97.290146"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66660028px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan5-9">Source Mirror(s)</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17)"
+       d="M 310.33967,249.08366 580.2025,248.31935"
+       id="path5151-2"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.29211;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4)"
+       d="m 51.194833,311.64332 -0.167856,-31.5431"
+       id="path5151-2-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.950312;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4)"
+       d="M 66.523353,415.18574 66.316201,401.36017"
+       id="path5151-2-6-3"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.49388;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-4-3)"
+       d="m 241.85857,448.04118 -125.1646,0.0642"
+       id="path5151-2-6-3-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9)"
+       d="m 443.70414,314.71078 139.43107,0.44213"
+       id="path5151-2-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2)"
+       d="M 386.69768,329.9125 582.93809,329.567"
+       id="path5151-2-9-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-6)"
+       d="m 372.53244,299.85455 210.60303,0.44213"
+       id="path5151-2-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="583.914"
+       y="372.32635"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="583.914"
+         y="372.32635"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-8">WORKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="583.914"
+       y="386.61404"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="583.914"
+         y="386.61404"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3-81">UNPACKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66670041px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="583.11639"
+       y="400.93161"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-0"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="583.11639"
+         y="400.93161"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66670041px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3-8-3">S</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-3)"
+       d="M 443.58793,383.03239 583.019,383.47452"
+       id="path5151-2-9-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-5)"
+       d="m 386.58147,398.23411 196.24041,-0.3455"
+       id="path5151-2-9-9-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.493;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-6-1)"
+       d="m 372.41623,368.17616 210.60303,0.44213"
+       id="path5151-2-0-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
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
+  </g>
+  <style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

-- 
2.47.0


