Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC91C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.15601.1739869927094320720
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 01:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I5kuK41Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EB1F43290;
	Tue, 18 Feb 2025 09:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739869925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFXoFC8WxavO4FDu0o69TJ3kzexKRkR6IAs1kc+So1A=;
	b=I5kuK41Ys40YdCJufkN6ackCzDVpIAfI6/dwtT56leDd3Z4Os6G30C36IqCvEB8HZgOXGN
	DD3aNTXqEwr1ljBcemmG8XgxX0OOVc8AbeX3XmGePwjyp2yTXnxLkxjX95xrQ5wgT+afxh
	pIrAKV3oDhosNij6EF469699p3/3AIaMw7pOSXY0iJc4w5Dxyuj77wDVye6sO7b6O3KzPa
	cFGXX+zKD+MCF1WgIGQkfgc/rh8xS6qgWaYAvwqN9sEzY074e8xk++1d9x3gjr6/I8BoTk
	BzxjLwF8NdLxSYsT4eEwu8CgKfUpiPaU3iN+0aHfji4KNoZYJWkQ4Spx1R4CPw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Feb 2025 10:11:59 +0100
Subject: [PATCH 4/6] overview-manual: convert
 analysis-for-package-splitting.png to svg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-overview-figures-v1-4-75d23b5e7a88@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
In-Reply-To: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=217933;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jZSw/f6t3Q4XeOd02xMrhZOIFOJREWwMEBMbzViAMLI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntE7j6pU+Juq1icO1gSw9Ca5zrq6Mnz5ouMhzQ
 66jFA/1njSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7RO4wAKCRDRgEFAKaOo
 NrrMEADHcMkEsoXhT9kbCFKHedcipOd2Ln/65MGp8LSPLcpYKwFROlTVmQ3YaPzHJq008j/XTGN
 euJKZrgmxjt7cwRCZPwQnVBELp5bjs6iMqa1BY7x2C8Qy7Tw96D3xC1u5/rHUrB4tvincECVUPR
 nDR3WE1v8VBoSyfVoJnlNNRiWfGnFZ/4/nyiFKMOQqY2opd66udwYoVF9vjPsdMilSZmE4VjBX2
 cN5KATcX/vn9s1pOq5czD0bkRTzADs9gwmwxp5yS+Xt8/zJK5x3+6Sa71rQVKN+n0kfXydqSsit
 I2r3K+i5KAKYVBBZkcpSHqyFzubih5ahpZvdBPm9xeWYxqVYXx/7ZuPFSlxbacU497J+/iMp2G2
 rSSvtCI9WBUlA0vJ/UOQM/oZWsL+Y3eFV1A+trgTFAV4nJXYLml2/B9QokoKrx08MJv+1x7rPc7
 cy6bykLUL+xDsoqmqx4LSUf/6Vg3diixBxcZS6O/E6x7c9l1Wra2w7MLXBfrTTC08nfZtl3Z6xz
 IcMJS5rJFB0Kx/186SLOZ68t7rkuZfGi3ghRtVspovqxKKKlSUcbGNu1tUQid4FosguJF0BxNQN
 9jHVNlW0SeEwJcrxTAhVZu3Ea5CWxWrs/KVvThNsHKmGkwenJDH7a521JSREAr38Mm0wWf9/C83
 lYpXtu9XOxBV3Ig==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6415

Convert the png file to an SVG file, and add the UNPACKDIR reference.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst         |    2 +-
 .../figures/analysis-for-package-splitting.png     |  Bin 68434 -> 0 bytes
 .../svg/analysis-for-package-splitting.svg         | 2111 ++++++++++++++++++++
 3 files changed, 2112 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index a4752eaee57d8c54acf1fe3fb0dfec5373cada95..f0e2eb224908c149aaeada209af99e1477ea1cdd 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -861,7 +861,7 @@ Package Splitting
 After source code is configured, compiled, and staged, the build system
 analyzes the results and splits the output into packages:
 
-.. image:: figures/analysis-for-package-splitting.png
+.. image:: svg/analysis-for-package-splitting.*
    :width: 100%
 
 The :ref:`ref-tasks-package` and
diff --git a/documentation/overview-manual/figures/analysis-for-package-splitting.png b/documentation/overview-manual/figures/analysis-for-package-splitting.png
deleted file mode 100644
index 0cb038666bebabfbefea65ae542187f22be895bb..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 68434
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
PD@a;gL9ANDDER*Y-^QZ#

diff --git a/documentation/overview-manual/svg/analysis-for-package-splitting.svg b/documentation/overview-manual/svg/analysis-for-package-splitting.svg
new file mode 100644
index 0000000000000000000000000000000000000000..88adb9413d2689adbbdaf3cc8a7eba4faf772f25
--- /dev/null
+++ b/documentation/overview-manual/svg/analysis-for-package-splitting.svg
@@ -0,0 +1,2111 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="724.57397"
+   height="802.93744"
+   viewBox="0 0 724.57398 802.93731"
+   sodipodi:docname="analysis-for-package-splitting.svg"
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
+     inkscape:window-height="1919"
+     id="namedview4"
+     showgrid="false"
+     inkscape:zoom="2.0466562"
+     inkscape:cx="282.16756"
+     inkscape:cy="511.07752"
+     inkscape:window-x="2271"
+     inkscape:window-y="195"
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
+     inkscape:connector-spacing="4">
+    <inkscape:grid
+       type="xygrid"
+       id="grid1257"
+       originx="47.75555"
+       originy="-5.6668472"
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
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid">
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
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid">
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
+       inkscape:isstock="true"
+       viewBox="0 0 6.9304588 5.1962256"
+       markerWidth="6.9304585"
+       markerHeight="5.1962256"
+       preserveAspectRatio="xMidYMid">
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
+       id="marker5285-17-4-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-4" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-3" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-0-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-3-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-4-7-0-9-4"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-7-7-3-2-0" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-6-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2-6"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7-0" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-1"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-87" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-0"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-3"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-75" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7-2" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-8-5-2-6-2"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-4-93-1-6-7-0-8" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-6-9"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-1-7" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-7"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Arrow2Mstart"
+       inkscape:isstock="true">
+      <path
+         transform="scale(0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5283-2-45" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-4" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-4-0" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-5" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-5-1" />
+    </marker>
+    <marker
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
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(-0.6)"
+         d="M 8.7185878,4.0337352 -2.2072895,0.01601326 8.7185884,-4.0017078 c -1.7454984,2.3720609 -1.7354408,5.6174519 -6e-7,8.035443 z"
+         style="fill:#000000;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:0.625;stroke-linejoin:round;stroke-opacity:1"
+         id="path5781-4-5-1-7" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(47.755547,-5.6668655)">
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.79915;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
+       id="rect1"
+       width="718.63239"
+       height="797.20856"
+       x="-43.349545"
+       y="9.3217773" />
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304516px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="142.22464"
+       y="565.10297"
+       id="text907"><tspan
+         sodipodi:role="line"
+         id="tspan905"
+         x="142.22464"
+         y="565.10297" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304516px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="98.363503"
+       y="637.8432"
+       id="text911"><tspan
+         sodipodi:role="line"
+         id="tspan909"
+         x="98.363503"
+         y="637.8432" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304516px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="-59.575905"
+       y="580.05695"
+       id="text915"><tspan
+         sodipodi:role="line"
+         id="tspan913"
+         x="-59.575905"
+         y="580.05695" /></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304516px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
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
+         height="116.53151"
+         x="79.029411"
+         y="133.47046"
+         ry="5.8418503" />
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6-5"
+         width="79.107689"
+         height="139.36775"
+         x="77.354088"
+         y="120.6852"
+         ry="6.9866552" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:3.77584285px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.3431px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="77.136833"
+       y="154.30118"
+       id="text1185-3-5-5-9-7"
+       transform="matrix(3.8793701,0,0,3.7611867,-282.17456,-390.84179)"><tspan
+         sodipodi:role="line"
+         x="77.136833"
+         y="154.30118"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:3.77584285px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.3431px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3">BitBake</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304516px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="-16.290483"
+       y="345.7359"
+       id="text3116"><tspan
+         sodipodi:role="line"
+         id="tspan3114"
+         x="-16.290483"
+         y="345.7359" /></text>
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:3.40131;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6"
+       width="311.23941"
+       height="481.69095"
+       x="258.40805"
+       y="239.28131"
+       ry="24.147688" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:1.55846;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27"
+       width="252.62085"
+       height="124.59291"
+       x="-27.615782"
+       y="23.720779"
+       ry="6.245976" />
+    <g
+       id="g3"
+       transform="translate(35.220014,45.500997)">
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
+       width="269.43472"
+       height="444.9303"
+       x="278.89612"
+       y="260.58664"
+       ry="22.304832" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5"
+       width="202.82013"
+       height="485.78915"
+       x="-7.0357914"
+       y="238.39011"
+       ry="24.353132" />
+    <g
+       id="g3-3"
+       transform="translate(116.73881,46.221543)">
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
+       style="font-weight:normal;font-size:14.42304522px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="97.333916"
+       y="56.925354"
+       id="text1185-3-5-5-9-7-93-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="97.333916"
+         y="56.925354"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2-9">Local</tspan><tspan
+         sodipodi:role="line"
+         x="97.333916"
+         y="71.322639"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan5">Projects</tspan></text>
+    <g
+       id="g3-3-4"
+       transform="translate(196.92116,46.722616)">
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
+       style="font-weight:normal;font-size:14.42304522px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="178.98425"
+       y="57.254028"
+       id="text1185-3-5-5-9-7-93-9-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="178.98425"
+         y="57.254028"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2-9-3">SCMs</tspan><tspan
+         sodipodi:role="line"
+         x="178.98425"
+         y="71.651314"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan7">(optional)</tspan></text>
+    <g
+       id="g3-3-0"
+       transform="matrix(3.0548289,0,0,0.817457,154.7927,106.51272)">
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
+       x="67.23761"
+       y="46.18803"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2"
+       width="19.926487"
+       height="18.934353"
+       x="65.122414"
+       y="43.956516"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5"
+       width="19.926487"
+       height="18.934353"
+       x="125.11585"
+       y="-8.3188419"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4"
+       width="19.926487"
+       height="18.934353"
+       x="171.14642"
+       y="37.717709"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-5"
+       width="19.926487"
+       height="18.934353"
+       x="378.89963"
+       y="-79.716248"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2"
+       width="19.926487"
+       height="18.934353"
+       x="223.0507"
+       y="97.172928"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2-5"
+       width="11.829602"
+       height="11.269682"
+       x="548.83148"
+       y="443.72842"
+       ry="0"
+       transform="matrix(0.71126059,0.70292843,-0.67005221,0.74231397,0,0)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4"
+       width="19.926487"
+       height="18.934353"
+       x="123.00065"
+       y="-10.550359"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-7"
+       width="19.926487"
+       height="18.934353"
+       x="183.64206"
+       y="-63.606796"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4-6"
+       width="19.926487"
+       height="18.934353"
+       x="181.52687"
+       y="-65.83831"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#666666;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4-6-7"
+       width="19.926487"
+       height="18.934353"
+       x="160.17146"
+       y="26.363537"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:14.42304522px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="327.32535"
+       y="256.38834"
+       id="text1185-3-5-5-9-7-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="327.32535"
+         y="256.38834"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.42304522px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-1">Build Directory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304522px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="17.109625"
+       y="49.63269"
+       id="text1185-3-5-5-9-7-93"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="17.109625"
+         y="49.63269"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-6">Upstream</tspan><tspan
+         sodipodi:role="line"
+         x="17.109625"
+         y="64.029976"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan1">Project</tspan><tspan
+         sodipodi:role="line"
+         x="17.109623"
+         y="78.427269"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan2">Releases</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4"
+       width="111.94537"
+       height="33.113335"
+       x="14.909211"
+       y="280.46252" />
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-7"
+       width="335.60818"
+       height="86.319359"
+       x="244.38937"
+       y="117.56476" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="72.69371"
+       y="293.32269"
+       id="text1185-3-5-5-9-7-4-3"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="72.69371"
+         y="293.32269"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0">do_package_write_rpm</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:14.4230451px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="420.95044"
+       y="163.41214"
+       id="text1185-3-5-5-9-7-4-3-65"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="420.95044"
+         y="163.41214"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:14.4230451px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Bold';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0-6">Package Feeds</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-0"
+       width="111.94537"
+       height="33.113335"
+       x="15.099504"
+       y="322.04715" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="72.807816"
+       y="332.80719"
+       id="text1185-3-5-5-9-7-4-3-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="72.807816"
+         y="332.80719"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-8">do_package_write_deb</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-0-8"
+       width="111.94537"
+       height="33.113335"
+       x="15.999091"
+       y="363.63174" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="72.896782"
+       y="374.715"
+       id="text1185-3-5-5-9-7-4-3-4-8"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="72.896782"
+         y="374.715"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-8-9">do_package_write_ipk</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66666672px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="289.59558"
+       y="280.73489"
+       id="text1185-3-5-5-9-7-4-3-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="280.73489"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan9">tmp</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="295.01523"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan10">  work</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="309.29556"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan11">    ${PACKAGE_ARCH}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="323.5759"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan13">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="337.85626"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan14">        ${PV}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="352.1366"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan15">          sources-unpack</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="366.41693"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan29">          ${BP}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="380.69727"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan48">          image</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="394.9776"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan54">          package</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="409.25793"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan55">          pkgdata</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="423.5383"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan49">          packages-split</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="437.81863"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan57">            ${PN} </tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="452.09897"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan56">          recipe-sysroot</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="466.3793"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan50">          recipe-sysroot-native</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="480.65964"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan16">    ${MACHINE}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="494.93997"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan17">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="509.22034"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan18">        ${PV}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="523.50067"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19">          sources-unpack</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="537.78101"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan30">          ${BP}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="552.06134"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan51">          image</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="566.34167"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan3">          package</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="580.62201"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan4">          pkgdata</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="594.90234"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan6">          packages-split</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="609.18268"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan8">            ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="623.46301"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan52">          recipe-sysroot</tspan><tspan
+         sodipodi:role="line"
+         x="289.59558"
+         y="637.74335"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan53">          recipe-sysroot-native</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:13.33333339px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="602.93268"
+       y="280.26572"
+       id="text1185-3-5-5-9-7-4-3-6-7"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.93268"
+         y="280.26572"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333339px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3">TMPDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.84039"
+       y="334.38571"
+       id="text1185-3-5-5-9-7-4-3-6-7-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.84039"
+         y="334.38571"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5">WORKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.10083"
+       y="348.6734"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.10083"
+         y="348.6734"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3">UNPACKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.42896"
+       y="362.99097"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.42896"
+         y="362.99097"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8">S / B</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304522px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="96.863083"
+       y="124.2673"
+       id="text1185-3-5-5-9-7-93-9-5"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="96.863083"
+         y="124.2673"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan5-9">Source Mirror(s)</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17)"
+       d="m 317.13432,277.38718 280.74136,-0.76413"
+       id="path5151-2"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.649842;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 129.79938,296.17226 49.97841,-0.002"
+       id="path5151-2-2"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.621359;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 129.82258,340.33495 49.97857,0.099"
+       id="path5151-2-2-5"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9)"
+       d="m 452.3365,344.46256 145.05172,0.44202"
+       id="path5151-2-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2)"
+       d="m 393.03204,359.66053 204.15112,-0.34542"
+       id="path5151-2-9-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="601.99664"
+       y="376.97006"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="601.99664"
+         y="376.97006"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8">D</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8)"
+       d="M 393.51538,373.62138 597.6665,373.27596"
+       id="path5151-2-9-9-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.3905"
+       y="391.89835"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.3905"
+         y="391.89835"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9">PKGD</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-5)"
+       d="m 406.88714,387.7974 190.82489,-0.24994"
+       id="path5151-2-9-9-9-1"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="603.06073"
+       y="406.04541"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="603.06073"
+         y="406.04541"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9-9">PKGDESTWORK</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-5-2)"
+       d="m 407.58516,401.92596 190.82489,-0.24995"
+       id="path5151-2-9-9-9-1-3"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.95068"
+       y="420.34406"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.95068"
+         y="420.34406"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.33333333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9-9-2">PKGDEST</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66666672px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="120.11855"
+       y="446.36307"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="120.11855"
+         y="446.36307"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3-8-8-9-9-2-9">PACKAGES</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:14.42304522px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="219.20634"
+       y="481.05573"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="219.20634"
+         y="481.05573"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.42304522px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3-8-8-9-9-2-9-8">D</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="28.314753"
+       y="575.74854"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="575.74854"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9-9-2-9-4">PKGD</tspan><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="589.08185"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan12">PKGDESTWORK</tspan><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="602.41522"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan20">PKGDEST</tspan><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="615.74854"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan21">STAGING_DIR</tspan><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="629.08185"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan22">STAGING_DIR_HOST</tspan><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="642.41522"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan23">STAGING_DIR_NATIVE</tspan><tspan
+         sodipodi:role="line"
+         x="28.314753"
+         y="655.74854"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan25">STAGING_DIR_TARGET</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66666672px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="124.28681"
+       y="419.56549"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-8-2"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="124.28681"
+         y="419.56549"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666672px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan19-3-5-3-8-8-9-9-2-9-6">FILES</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-5-2-6)"
+       d="m 451.94661,416.20588 145.00298,-0.57075"
+       id="path5151-2-9-9-9-1-3-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-6)"
+       d="m 378.29578,329.61 219.09271,0.44202"
+       id="path5151-2-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="603.08221"
+       y="494.5488"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-3"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="603.08221"
+         y="494.5488"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-6">WORKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.34265"
+       y="508.83649"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-1"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.34265"
+         y="508.83649"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-2">UNPACKDIR</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.67078"
+       y="523.15405"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.67078"
+         y="523.15405"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-3">S / B</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-1)"
+       d="m 452.7065,504.41304 145.05172,0.44202"
+       id="path5151-2-9-1"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-9)"
+       d="m 393.40203,519.611 204.15112,-0.34541"
+       id="path5151-2-9-9-94"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.23846"
+       y="535.17664"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-7"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.23846"
+         y="535.17664"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-8">D</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-0)"
+       d="m 393.88537,531.61744 204.15112,-0.34541"
+       id="path5151-2-9-9-9-4"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.14423"
+       y="548.63757"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-5"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.14423"
+         y="548.63757"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9-0">PKGD</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-5-3)"
+       d="m 406.76854,544.32767 190.82489,-0.24995"
+       id="path5151-2-9-9-9-1-36"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.81445"
+       y="563.76288"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-1"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.81445"
+         y="563.76288"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9-9-0">PKGDESTWORK</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-5-2-9)"
+       d="m 407.46655,559.43343 190.82489,-0.24995"
+       id="path5151-2-9-9-9-1-3-63"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="602.70441"
+       y="576.10504"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-2-2-0-6-2"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="602.70441"
+         y="576.10504"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-8-9-9-2-0">PKGDEST</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-8-5-2-6-2)"
+       d="m 451.82801,571.75894 145.00297,-0.57077"
+       id="path5151-2-9-9-9-1-3-6-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.52261;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-6-9)"
+       d="m 378.66577,489.56048 219.09272,0.44202"
+       id="path5151-2-0-1"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text2"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect2);display:inline;fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none" />
+    <text
+       xml:space="preserve"
+       transform="translate(-82.778014,-165.84268)"
+       id="text28"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:14.423px;line-height:119%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;writing-mode:lr-tb;direction:ltr;white-space:pre;shape-inside:url(#rect28);display:inline;fill:#808080;fill-opacity:1;stroke:#deddda;stroke-width:1.893;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.917803;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5783)"
+       d="m 179.44681,182.32996 64.9845,-0.17816"
+       id="path5151-2-6-0-5-5-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.913896;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5783-8)"
+       d="M 41.22058,465.67609 41.041566,401.55091"
+       id="path5151-2-6-0-5-5-9-3"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.988319;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5783-8-9)"
+       d="m 257.2311,483.05216 -82.5567,0.16261"
+       id="path5151-2-6-0-5-5-9-3-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.05534;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5783-8-9-7)"
+       d="m 152.44193,615.70573 102.2042,-0.14978"
+       id="path5151-2-6-0-5-5-9-3-0-7"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.907432;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 152.6502,583.59639 0.1732,65.33981"
+       id="path5151-2-6-0-5-5-9-3-0-7-2"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.569218;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5783-8-1)"
+       d="m 136.58006,446.88736 -0.003,17.46862"
+       id="path5151-2-6-0-5-5-9-3-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.569218;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5783-8-1-2)"
+       d="m 136.58006,420.83768 -0.003,17.46862"
+       id="path5151-2-6-0-5-5-9-3-9-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-5-4"
+       width="19.926487"
+       height="18.934353"
+       x="492.30664"
+       y="-184.46173"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-7-9"
+       width="19.971395"
+       height="18.892305"
+       x="477.39664"
+       y="-208.26343"
+       transform="rotate(45)" />
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-7-9-3"
+       width="19.971395"
+       height="18.892305"
+       x="368.04031"
+       y="-99.338852"
+       transform="rotate(45)" />
+    <rect
+       style="opacity:1;fill:#000000;fill-opacity:0;stroke:#000000;stroke-width:0.451439;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id="rect8"
+       width="118.01241"
+       height="123.4798"
+       x="11.945589"
+       y="276.81012" />
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-4"
+       width="67.850601"
+       height="33.113335"
+       x="16.189144"
+       y="468.83041" />
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66666663px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="51.281845"
+       y="477.80627"
+       id="text1185-3-5-5-9-7-4-3-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="51.281845"
+         y="477.80627"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666663px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0-4">do_package</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-0-4"
+       width="81.324852"
+       height="33.113335"
+       x="87.165337"
+       y="469.3013" />
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66666663px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="131.18208"
+       y="478.74594"
+       id="text1185-3-5-5-9-7-4-3-4-3"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="131.18208"
+         y="478.74594"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666663px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0-8-0">do_packagedata</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-0-8-7"
+       width="107.7788"
+       height="33.113335"
+       x="16.949968"
+       y="509.84943" />
+    <text
+       xml:space="preserve"
+       style="font-weight:normal;font-size:10.66666663px;line-height:125%;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-style:normal;font-stretch:normal;font-variant:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+       x="71.607956"
+       y="518.28699"
+       id="text1185-3-5-5-9-7-4-3-4-8-8"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="71.607956"
+         y="518.28699"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.66666663px;font-family:'Nimbus Sans';-inkscape-font-specification:'Nimbus Sans, Normal';text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px;font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal"
+         id="tspan60047-3-7-0-8-9-6">do_populate_sysroot</tspan></text>
+    <rect
+       style="fill:#000000;fill-opacity:0;stroke:#000000;stroke-width:0.678708;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none"
+       id="rect8-8"
+       width="160.56584"
+       height="205.13455"
+       x="11.957187"
+       y="465.29163" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.829108px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       d="m 129.83599,383.16132 h 50.20974 V 181.82581"
+       id="path8"
+       inkscape:connector-type="orthogonal"
+       inkscape:connector-curvature="0" />
+  </g>
+  <style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

-- 
2.47.0


