Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0F1C25B4F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:55:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7645.1714632936228275643
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YE36qawr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45380240008;
	Thu,  2 May 2024 06:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714632934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xXceQCtsBTTaNiFIn313n+h06++UuUJN0QS1QAxcou4=;
	b=YE36qawroQ/bdqEQDoFTrrjN1vG/xdkKei7s9LeUonmwrQSTX7euLOFobVHn5KDG7eovPD
	mst6LzmjVBU3uFSSQG3+U+ykr98Qk2/NYdlAg0QYy3SarSJi4KvkuuLXvgqVpdXXBdNhHx
	FqIKdEuLnf75SELU+ZXTLvR4hHxHsXmhqs8c1k03gWlGMbQmaTPl2AJ2qomL5LpyXnj75S
	DzefRONIBZ/o7Ypoi1nnqb5YhOlDRMlIkqZ3h2579u4TSLETptpURtrQhCdFTZCcoXqJKO
	ANHEAAsv1IuNl03QHA5b0A1uEdinI/99fHl3VfUCqdWmdBqmekY+7/1I3QM5vQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [scarthgap][PATCH 5/5] ref-manual: update releases.svg
Date: Thu,  2 May 2024 08:55:28 +0200
Message-Id: <20240502065528.22559-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
References: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:55:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5191

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Make Scarthgap a current release
- Add Styhead

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 99 ++++++++++++++---------
 1 file changed, 61 insertions(+), 38 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index 198d4632b1..036aa467cc 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -3,8 +3,8 @@
    version="1.1"
    id="svg2"
    width="2040.0006"
-   height="624.30518"
-   viewBox="0 0 2040.0006 624.30515"
+   height="669.30511"
+   viewBox="0 0 2040.0006 669.30509"
    sodipodi:docname="releases.svg"
    inkscape:version="1.1.2 (0a00cf5339, 2022-02-04)"
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
@@ -409,8 +409,8 @@
      id="namedview4"
      showgrid="true"
      inkscape:zoom="1.4472045"
-     inkscape:cx="736.24703"
-     inkscape:cy="312.32629"
+     inkscape:cx="987.76641"
+     inkscape:cy="357.93145"
      inkscape:window-x="1728"
      inkscape:window-y="0"
      inkscape:window-maximized="1"
@@ -427,13 +427,13 @@
        type="xygrid"
        id="grid1257"
        originx="-289.99936"
-       originy="325" />
+       originy="369.99998" />
   </sodipodi:namedview>
   <g
      inkscape:groupmode="layer"
      inkscape:label="Image"
      id="g10"
-     transform="translate(-289.99936,325.00004)">
+     transform="translate(-289.99936,370.00003)">
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.5;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 1080,220.00003 v -515.00007 0 0"
@@ -669,11 +669,11 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
     <g
-       id="g1379">
+       id="g1258">
       <rect
          style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
          id="rect917-0-0-4-4-9-4-5-38"
-         width="140.00003"
+         width="120.00002"
          height="45.000004"
          x="1220"
          y="-230.00005"
@@ -696,53 +696,76 @@
            id="tspan10317-2-9-1-4-6">4.3</tspan></text>
     </g>
     <rect
-       style="opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4-4-9-4-5-3-9"
-       width="979.99994"
+       style="opacity:0.75;fill:#241f31;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       id="rect917-0-0-4-4-9-4-5-3-9-2"
+       width="140"
        height="45.000004"
-       x="1320"
-       y="-285.00003"
+       x="1440"
+       y="-340.00003"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1373.233"
-       y="-265.32928"
-       id="text1185-3-55-4-0-0-0-1-1-6"><tspan
+       x="1487.233"
+       y="-320.32928"
+       id="text1185-3-55-4-0-0-0-1-1-6-4"><tspan
          sodipodi:role="line"
-         x="1373.233"
-         y="-265.32928"
+         x="1487.233"
+         y="-320.32928"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3-9-7-4-2">Scarthgap</tspan><tspan
+         id="tspan957-2-8-6-3-9-7-4-2-0">Styhead</tspan><tspan
          sodipodi:role="line"
-         x="1373.233"
-         y="-247.33261"
+         x="1487.233"
+         y="-302.33261"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-1-4-6-5">5.0</tspan></text>
-    <rect
+         id="tspan10317-2-9-1-4-6-5-6">5.1</tspan></text>
+    <g
+       id="g1591">
+      <rect
+         style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+         id="rect917-0-0-4-4-9-9"
+         width="960.00012"
+         height="45.000004"
+         x="859.99994"
+         y="-64.999992"
+         ry="2.2558987" />
+      <text
+         xml:space="preserve"
+         style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+         x="928.49872"
+         y="-45.648258"
+         id="text1185-3-55-4-0-0-9"><tspan
+           sodipodi:role="line"
+           x="928.49872"
+           y="-45.648258"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+           id="tspan957-2-8-6-3-6">Kirkstone (LTS)</tspan><tspan
+           sodipodi:role="line"
+           x="928.49872"
+           y="-27.651579"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
+           id="tspan10317-2-9-0">4.0</tspan></text>
+    </g>
+    <path
+       id="rect917-0-0-4-4-9-9-9"
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
-       id="rect917-0-0-4-4-9-9"
-       width="960.00012"
-       height="45.000004"
-       x="859.99994"
-       y="-64.999992"
-       ry="2.2558987" />
+       d="m 1322.3015,-285.00003 c -1.2753,0 -2.302,1.00609 -2.302,2.25586 v 40.48828 c 0,1.24977 1.0267,2.25586 2.302,2.25586 h 975.0412 c 1.2754,0 2.302,-1.00609 2.302,-2.25586 v -40.48828 c 0,-1.24977 -1.0266,-2.25586 -2.302,-2.25586 z" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="928.49872"
-       y="-45.648258"
-       id="text1185-3-55-4-0-0-9"><tspan
+       x="1390.4988"
+       y="-265.64832"
+       id="text1185-3-55-4-0-0-9-0"><tspan
          sodipodi:role="line"
-         x="928.49872"
-         y="-45.648258"
+         x="1390.4988"
+         y="-265.64832"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3-6">Kirkstone (LTS)</tspan><tspan
+         id="tspan957-2-8-6-3-6-8">Scarthgap (LTS)</tspan><tspan
          sodipodi:role="line"
-         x="928.49872"
-         y="-27.651579"
+         x="1390.4988"
+         y="-247.65164"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan10317-2-9-0">4.0</tspan></text>
+         id="tspan10317-2-9-0-1">5.0</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-- 
2.34.1


