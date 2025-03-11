Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D997C35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:31:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8981.1741699883159748351
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Sfe1kKeX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D5CC44199;
	Tue, 11 Mar 2025 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741699881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugUTTNUmLFrukf0tIp4rg8qvlDYOrZR5mCAwdKtyCAc=;
	b=Sfe1kKeXvtrJLhDgkNSJBuyodz4PXAWy1ZBMtt2xYFVhmVJyTEhc/y3c+DZhflCQN5G1fP
	fCU6ncuBQaVprZ0g/oE2cxl5dDV33msEJYJuPBJY4TRn9gUjwcWRayWfL79NnxHgGPh3Li
	olga1HkmnXtxuEJ3ptgae0qNY6C+27MR2S8fqbGxjJB/kOEyDR8LHGsDXi+tgyfVdnXD93
	CzNfNeZ3GttFs9nr6kIDtw47cEeXA+gueOieU1pM72Ew265I7otlyb/iBC0uNfhOtuDRKH
	AK8zCaH6aZysqeeC5K1n5Eyk4ozKfGZ9OVAYXlesQHX+dl/WIv3j43xx7UTbXQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Mar 2025 14:31:04 +0100
Subject: [PATCH v2 3/6] overview-manual: convert
 configuration-compile-autoreconf.png to svg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250311-overview-figures-v2-3-63f0c89fab98@bootlin.com>
References: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
In-Reply-To: <20250311-overview-figures-v2-0-63f0c89fab98@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=177478;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pdmw/9rrnSPbpQ1XT9smJfp01dl+D/IIRr1ejdUdquA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0Dsn956vt03I1CIK5TaPQ7zjmYpTmvDNmNGf3
 PA3O8qFfHmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9A7JwAKCRDRgEFAKaOo
 NsaAD/418J3EDkuxv4Qt0vUUkzyDkLcw3DWk/wWcBUoz3fklCZOHohUrRNuqiOE/pVxG+Xq0qg0
 Rshx9+mVLW81y8Ea4q6qwix4/858IZTdmN9CyEPM/mauCxrjpcYQFTlwPSDy1edzTlAsG+gFe+L
 f/u7mYeMMsdTllO9YwX1I5YMryHAoIOEfSKIPnodPOuTgwoU+pwfIRP68IoCfuXzOdhdh35rMX8
 k7hdBudzRgX2rkc/qfTshNtaZmxscMb5K9ZBifW7Dzkaus6tOUGK/UfHgODuxHIZLbDVaCeRT6J
 RZwA1R44w29ET/9ugJsO0hwowFPrDgFFYLeJELiY8r14HXkYq6MqPGLb9a1a+XOtQCwMcp2AY6N
 Drom4pUCULGTofWQbt0KtWfFzz9BqPlr/fzah8hcBOeacbkoROFNJV0xQV2aUeW9FDXHhtil7KS
 14qiWaYqtub1zScZ+Rk5FCvWAyLyfu4U7lXpEomGI2vxigRunxVrfqidAZI/3TqwciRW+p8V/2e
 tnOoUwb2HvwL4BTtDdK9IlVKBayYlThfSAT7HGtVfrRZabrqylYU6YJo0fh8HbjkVrxvYPxThBu
 irksG+QYVgPGYjjllJHvNiYiD2tsBP19BynE7aYpst0OOrzS5GiM9jGeQzlqdKusrSJ4Fm44Pai
 CxVdy3Mr6BMJ1Cw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhheegleegfeeifeehtdfgudetjeffudekffeggeeuhfehheegteduieeihfenucffohhmrghinhepihhnkhhstggrphgvrdhorhhgpdhsohhurhgtvghfohhrghgvrdhnvghtpdiffedrohhrghdptghrvggrthhivhgvtghomhhmohhnshdrohhrghdpphhurhhlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrt
 ghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6538

From: Antonin Godard <antonin.godard@bootlin.com>

- Convert the png file to an SVG file
- Add the UNPACKDIR reference.
- Remove ${PR} from WORKDIR value, after cc83e4548465 ("bitbake.conf:
  Drop PE and PR from WORKDIR and STAMP") on OE-Core.
- Change S value to BP (equal to ${BPN}-${PV}, but more accurate).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/overview-manual/concepts.rst    |    2 +-
 .../configuration-compile-autoreconf.png      |  Bin 70877 -> 0 bytes
 .../svg/configuration-compile-autoreconf.svg  | 1497 +++++++++++++++++
 3 files changed, 1498 insertions(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 5c6af847e5..a4752eaee5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -805,7 +805,7 @@ After source code is patched, BitBake executes tasks that configure and
 compile the source code. Once compilation occurs, the files are copied
 to a holding area (staged) in preparation for packaging:
 
-.. image:: figures/configuration-compile-autoreconf.png
+.. image:: svg/configuration-compile-autoreconf.*
    :width: 100%
 
 This step in the build process consists of the following tasks:
diff --git a/documentation/overview-manual/figures/configuration-compile-autoreconf.png b/documentation/overview-manual/figures/configuration-compile-autoreconf.png
deleted file mode 100644
index 043d195a33c8cfd87406139f8071283678f5c654..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 70877
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

diff --git a/documentation/overview-manual/svg/configuration-compile-autoreconf.svg b/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
new file mode 100644
index 0000000000..c0de45681a
--- /dev/null
+++ b/documentation/overview-manual/svg/configuration-compile-autoreconf.svg
@@ -0,0 +1,1497 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<svg
+   version="1.1"
+   id="svg2"
+   width="715.68933"
+   height="568.14496"
+   viewBox="0 0 715.68933 568.14495"
+   sodipodi:docname="configuration-compile-autoreconf.svg"
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
+     inkscape:window-width="2255"
+     inkscape:window-height="1999"
+     id="namedview4"
+     showgrid="false"
+     inkscape:zoom="1.4472045"
+     inkscape:cx="219.38849"
+     inkscape:cy="537.58817"
+     inkscape:window-x="2271"
+     inkscape:window-y="115"
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
+       originx="56.164611"
+       originy="6.8221063"
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
+       viewBox="0 0 6.93045877 5.19622555"
+       markerWidth="6.93045877"
+       markerHeight="5.19622555"
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
+       id="marker5285-17-9-2-8-3"
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
+       id="marker5285-17-9-2-5-5"
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
+         id="path5283-2-4-93-6-6" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker5285-17-9-2-5-5-7"
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
+         id="path5283-2-4-93-6-6-4" />
+    </marker>
+  </defs>
+  <g
+     inkscape:groupmode="layer"
+     inkscape:label="Image"
+     id="g10"
+     transform="translate(56.164608,6.8220881)">
+    <rect
+       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:3.18457;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-opacity:0"
+       id="rect1"
+       width="712.50476"
+       height="564.96039"
+       x="-54.572323"
+       y="-5.2298031" />
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
+       transform="matrix(3.2001899,0,0,4.5594279,-282.17456,-390.84179)">
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6"
+         width="196.16678"
+         height="75.164169"
+         x="74.926918"
+         y="125.14306"
+         ry="3.7680609" />
+      <rect
+         style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#62a0ea;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+         id="rect917-2-4-5-6-5"
+         width="79.107689"
+         height="90.871338"
+         x="73.251595"
+         y="116.89642"
+         ry="4.5554776" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.07299px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.3431px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="72.493103"
+       y="148.14941"
+       id="text1185-3-5-5-9-7"
+       transform="matrix(3.87937,0,0,3.7611867,-282.17456,-390.84179)"><tspan
+         sodipodi:role="line"
+         x="72.493103"
+         y="148.14941"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.07299px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.3431px"
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
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:2.77342;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6"
+       width="311.86728"
+       height="319.61835"
+       x="255.71458"
+       y="192.37657"
+       ry="16.022812" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:1.55846;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27"
+       width="252.62085"
+       height="124.59291"
+       x="-40.744541"
+       y="6.4460955"
+       ry="6.245976" />
+    <g
+       id="g3"
+       transform="translate(22.091254,28.226313)">
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
+       width="270.12872"
+       height="275.32745"
+       x="276.16855"
+       y="220.72719"
+       ry="13.80246" />
+    <rect
+       style="fill:#deddda;fill-opacity:1;fill-rule:evenodd;stroke:#deddda;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5"
+       width="121.85956"
+       height="217.05815"
+       x="23.647911"
+       y="220.42442"
+       ry="10.881358" />
+    <g
+       id="g3-3"
+       transform="translate(103.61005,28.946859)">
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
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="84.219093"
+       y="39.632309"
+       id="text1185-3-5-5-9-7-93-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="84.219093"
+         y="39.632309"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan2-9">Local</tspan><tspan
+         sodipodi:role="line"
+         x="84.219093"
+         y="52.965641"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan5">Projects</tspan></text>
+    <g
+       id="g3-3-4"
+       transform="translate(183.7924,29.447932)">
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
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="165.86943"
+       y="39.960983"
+       id="text1185-3-5-5-9-7-93-9-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="165.86943"
+         y="39.960983"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan2-9-3">SCMs</tspan><tspan
+         sodipodi:role="line"
+         x="165.86943"
+         y="53.294315"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan7">(optional)</tspan></text>
+    <g
+       id="g3-3-0"
+       transform="matrix(3.0548289,0,0,0.817457,141.66394,89.23804)">
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
+       x="45.831524"
+       y="42.644245"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2"
+       width="19.926487"
+       height="18.934353"
+       x="43.716328"
+       y="40.412731"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5"
+       width="19.926487"
+       height="18.934353"
+       x="103.70976"
+       y="-11.862627"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4"
+       width="19.926487"
+       height="18.934353"
+       x="149.74034"
+       y="34.173923"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#00b0f0;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2"
+       width="19.926487"
+       height="18.934353"
+       x="202.05275"
+       y="91.83194"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#dddcd9;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-4-2-5"
+       width="11.829602"
+       height="11.269682"
+       x="350.43219"
+       y="246.40115"
+       ry="0"
+       transform="matrix(0.71126059,0.70292843,-0.67005221,0.74231397,0,0)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4"
+       width="19.926487"
+       height="18.934353"
+       x="101.59456"
+       y="-14.094144"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#ffffff;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-5-7"
+       width="19.926487"
+       height="18.934353"
+       x="162.23598"
+       y="-67.150581"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#a1a1a1;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4-6"
+       width="19.926487"
+       height="18.934353"
+       x="160.12079"
+       y="-69.382095"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <rect
+       style="fill:#666666;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-linecap:butt;stroke-linejoin:bevel;stroke-miterlimit:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-27-0-6-3-2-4-6-7"
+       width="19.926487"
+       height="18.934353"
+       x="138.76538"
+       y="22.819752"
+       ry="0"
+       transform="rotate(43.365087)" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:15.5581px;line-height:119%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="324.94836"
+       y="209.74802"
+       id="text1185-3-5-5-9-7-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="324.94836"
+         y="209.74802"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:15.5581px;line-height:119%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:1.42682px"
+         id="tspan60047-3-1">Build Directory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="3.9948041"
+       y="32.339645"
+       id="text1185-3-5-5-9-7-93"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="3.9948034"
+         y="32.339645"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan60047-3-6">Upstream</tspan><tspan
+         sodipodi:role="line"
+         x="3.9948037"
+         y="45.672977"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan1">Project</tspan><tspan
+         sodipodi:role="line"
+         x="3.9948041"
+         y="59.006313"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan2">Releases</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4"
+       width="72.495255"
+       height="33.113335"
+       x="48.76759"
+       y="262.15137" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.92165px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="88.260292"
+       y="240.17499"
+       id="text1185-3-5-5-9-7-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="88.260292"
+         y="240.17499"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.92165px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7">Configure / Compile / </tspan><tspan
+         sodipodi:role="line"
+         x="88.260292"
+         y="250.07706"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.92165px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan46">Autoreconf as needed</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="92.404968"
+       y="485.89694"
+       id="text1185-3-5-5-9-7-4-2"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="92.404968"
+         y="485.89694"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan46-0">EXTRA_OECONF = &quot;&lt;extra configure script options&gt;&quot;</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="-25.569267"
+       y="482.02933"
+       id="text1185-3-5-5-9-7-4-2-7"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="-25.569267"
+         y="482.02933"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:8px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan46-0-8">*</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="86.689705"
+       y="275.88089"
+       id="text1185-3-5-5-9-7-4-3"
+       transform="scale(0.97863562,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="86.689705"
+         y="275.88089"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0">do_configure*</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-0"
+       width="72.495255"
+       height="33.113335"
+       x="49.58181"
+       y="318.39053" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="87.521706"
+       y="330.91858"
+       id="text1185-3-5-5-9-7-4-3-4"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="87.521706"
+         y="330.91858"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-8">do_compile</tspan></text>
+    <rect
+       style="fill:#92d050;fill-opacity:1;fill-rule:evenodd;stroke:#9a9996;stroke-width:0;stroke-dasharray:none;stroke-opacity:1"
+       id="rect917-0-6-2-5-4-0-8"
+       width="72.495255"
+       height="33.113335"
+       x="50.855366"
+       y="379.17896" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:0.84771px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="88.823059"
+       y="390.40823"
+       id="text1185-3-5-5-9-7-4-3-4-8"
+       transform="scale(0.97863561,1.0218308)"><tspan
+         sodipodi:role="line"
+         x="88.823059"
+         y="390.40823"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none;stroke-width:0.84771px"
+         id="tspan60047-3-7-0-8-9">do_install</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="287.2186"
+       y="234.09459"
+       id="text1185-3-5-5-9-7-4-3-6"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="234.09459"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan4">tmp &lt;───────────────────────────────────────── TMPDIR</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="247.42796"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan6">  work</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="260.76135"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan8">    ${PACKAGE_ARCH}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="274.09473"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan12">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="287.4281"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan20">        ${PV} &lt;──────────────────────────────── WORKDIR</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="300.76147"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan21">          sources-unpack &lt;───────────────────── UNPACKDIR</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="314.09485"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan22">          ${BP} &lt;────────────────────────────── S / B</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="327.42822"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan26">          image &lt;────────────────────────────── D</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="340.7616"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan27">            ${PN} </tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="354.09497"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan28">          recipe-sysroot</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="367.42834"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan31">          recipe-sysroot-native</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="380.76172"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan32">    ${MACHINE}-poky-${TARGET_OS}</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="394.09509"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan33">      ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="407.42847"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan34">        ${PV} &lt;──────────────────────────────── WORKDIR</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="420.76184"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan35">          sources-unpack &lt;───────────────────── UNPACKDIR</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="434.09521"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan36">          ${BP} &lt;────────────────────────────── S / B</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="447.42859"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan40">          image &lt;────────────────────────────── D</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="460.76196"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan41">            ${PN}</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="474.09534"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan42">          recipe-sysroot</tspan><tspan
+         sodipodi:role="line"
+         x="287.2186"
+         y="487.42871"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan43">          recipe-sysroot-native</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="193.64195"
+       y="301.45981"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="193.64195"
+         y="301.45981"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-6">S</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="193.36331"
+       y="340.31906"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-4-2"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="193.36331"
+         y="340.31906"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-6-2">B</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="193.43362"
+       y="400.95511"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-4-2-5"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="193.43362"
+         y="400.95511"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-6-2-4">D</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;line-height:125%;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="83.74826"
+       y="106.97425"
+       id="text1185-3-5-5-9-7-93-9-5"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="83.74826"
+         y="106.97425"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.6667px;font-family:'Nimbus Sans L';-inkscape-font-specification:'Nimbus Sans L, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:1.42682px"
+         id="tspan5-9">Source Mirror(s)</tspan></text>
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
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.13623;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-7)"
+       d="M 84.107321,316.8924 83.916347,295.45352"
+       id="path5151-2-6"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.13623;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-7-0)"
+       d="m 121.84721,276.95178 21.43888,-0.19098"
+       id="path5151-2-6-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.13623;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-7-0-9)"
+       d="m 122.16274,332.20494 21.43888,-0.19098"
+       id="path5151-2-6-0-5"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.20639;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 142.72419,276.78776 0.18052,55.11154"
+       id="path5151-2-6-0-5-5"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.197;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
+       d="m 142.8223,303.82265 111.46136,-0.17668"
+       id="path5151-2-6-0-5-5-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.18805;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-5);marker-end:url(#marker5783)"
+       d="m 123.78754,341.99278 129.49107,-0.17595"
+       id="path5151-2-6-0-5-5-9-9"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="193.32457"
+       y="266.90759"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-4-2-9"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="193.32457"
+         y="266.90759"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-6-2-3">B</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.19251;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-5-5)"
+       d="m 122.88894,268.65887 131.39539,-0.17471"
+       id="path5151-2-6-0-5-5-9-9-74"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;line-height:125%;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1.42682px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="193.47418"
+       y="382.88867"
+       id="text1185-3-5-5-9-7-4-3-6-7-6-6-0-4-2-9-4"
+       transform="scale(1.0010629,0.99893822)"><tspan
+         sodipodi:role="line"
+         x="193.47418"
+         y="382.88867"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:10.4555px;font-family:'Nimbus Mono PS';-inkscape-font-specification:'Nimbus Mono PS, Normal';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:start;text-anchor:start;stroke:none;stroke-width:1.42682px"
+         id="tspan19-3-5-3-8-6-2-3-3">B</tspan></text>
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.18751;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-9-2-5-5-7)"
+       d="M 124.73989,384.51678 254.4195,384.34124"
+       id="path5151-2-6-0-5-5-9-9-74-0"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.19;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#marker5623)"
+       d="m 123.0117,403.26392 130.52871,-0.17513"
+       id="path5151-2-6-0-5-5-9-9-7"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+    <path
+       style="display:inline;fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.20636;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-start:url(#marker5285-17-4-7-6)"
+       d="M 84.096686,377.39393 83.919385,351.36334"
+       id="path5151-2-6-3"
+       inkscape:connector-type="polyline"
+       inkscape:connector-curvature="0" />
+  </g>
+  <style
+     type="text/css"
+     id="style1021"> .st0{fill:#4A97D2;} .st1{fill:#333333;} </style>
+</svg>

-- 
2.47.0


