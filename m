Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B13DC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 17:16:36 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.516.1699982192530897631
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 09:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F8rK1rSO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01E3560006;
	Tue, 14 Nov 2023 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699982190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i7cIFqgIdJiNcf5y7FAVHqqd+HIY0NaC3TsvTY8dMKQ=;
	b=F8rK1rSOCebWFEc6QR9MhfDSGl9m70VRdZYfBU1GDqRnCT3oP1yngaLlv99MpIS3lWIC0n
	X40nO6AWzE+sorwnxUCoV4e/y3WvHl708ze2fWmojsWwDW/vg1OXYQKKBsrkf6kTurB7IU
	64iYMxXGDBP/DraQsU1aCEHAA3hoC9tBd/+c8Iq8jWbbVgcMC4uG6k+u78drE7CXeRgH00
	HbV803TVG7Uj9VHgngX61hYkTKegoq7znkIMkZuiIcdDFHK7ag+FH9Bsxr+nK/PBG4EOxV
	GYj5Ps84kQoXULBWRkDTtbRwGxcuqTvWOeErWR4J9tWB71GWj6DYor8g4fLkzg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: releases.svg: update nanbield release status
Date: Tue, 14 Nov 2023 18:16:27 +0100
Message-Id: <20231114171627.136288-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 17:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4628

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- nanbield is now released
- update the start and end dates

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 32 +++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index 5333498d1f..198d4632b1 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -404,15 +404,15 @@
      guidetolerance="10"
      inkscape:pageopacity="0"
      inkscape:pageshadow="2"
-     inkscape:window-width="1846"
-     inkscape:window-height="1016"
+     inkscape:window-width="1920"
+     inkscape:window-height="1043"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="0.51166405"
-     inkscape:cx="-43.974166"
-     inkscape:cy="311.72798"
-     inkscape:window-x="1994"
-     inkscape:window-y="27"
+     inkscape:zoom="1.4472045"
+     inkscape:cx="736.24703"
+     inkscape:cy="312.32629"
+     inkscape:window-x="1728"
+     inkscape:window-y="0"
      inkscape:window-maximized="1"
      inkscape:current-layer="g10"
      inkscape:document-rotation="0"
@@ -669,28 +669,28 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
     <g
-       id="g32107">
+       id="g1379">
       <rect
-         style="opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-         id="rect917-0-0-4-4-9-4-5-3"
-         width="140.00014"
+         style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+         id="rect917-0-0-4-4-9-4-5-38"
+         width="140.00003"
          height="45.000004"
-         x="1199.9999"
-         y="-229.99998"
+         x="1220"
+         y="-230.00005"
          ry="2.2558987" />
       <text
          xml:space="preserve"
          style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-         x="1247.2329"
+         x="1269.2329"
          y="-210.32925"
          id="text1185-3-55-4-0-0-0-1-1"><tspan
            sodipodi:role="line"
-           x="1247.2329"
+           x="1269.2329"
            y="-210.32925"
            style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
            id="tspan957-2-8-6-3-9-7-4">Nanbield</tspan><tspan
            sodipodi:role="line"
-           x="1247.2329"
+           x="1269.2329"
            y="-192.33258"
            style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
            id="tspan10317-2-9-1-4-6">4.3</tspan></text>
-- 
2.34.1


