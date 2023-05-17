Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CF6C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 15:42:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.53733.1684338146922947797
 for <docs@lists.yoctoproject.org>;
 Wed, 17 May 2023 08:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pHF5T03H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DA53B20013;
	Wed, 17 May 2023 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684338145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dSHY2DyA5BGxbRP29Qc3XMeQ2Gw68K0hDaHyjGY+Jck=;
	b=pHF5T03HK+mzuvpcDguW521YtA7A9x71lqtM2E4ETpoIBeEi9aAliyeuTwomGLKBSQuubY
	VGlXastXX4BoNStTO7u7TTXxnGZplZ+j0UfGU48KLxh/gmYLkcOhNneQ69co4WO65NvEZy
	/dZJwgKWRMb5yoGZCsX2GiCW31VOkYojhN7JwU/+VUW/JJflY8NP4HaTYoTvxumBylJQJ3
	TGc8njjLQ1XowpR3nMc9fcn9xn5tcaFsh6E37Erbz1Xe4h6OfCv5Pqmx+napdr579xrV2+
	UBLO1cdzJ/EfNIWB1dA7aQJXeOvaVxIvCwO3HYE7Q5e6Ahz9wTSDNtwDPSeucg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Takayasu Ito <ito@lineo.co.jp>
Subject: [PATCH] [mickledore] releases.svg: fix and explain duration of Hardknott 3.3
Date: Wed, 17 May 2023 17:42:21 +0200
Message-Id: <20230517154221.2061106-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 May 2023 15:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3949

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Takayasu Ito <ito@lineo.co.jp>
---
 documentation/ref-manual/svg/releases.svg | 77 ++++++++++++++---------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index f2607244c8..d41edc1cb0 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -383,9 +383,9 @@
      inkscape:window-height="1016"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="0.72360224"
-     inkscape:cx="889.30073"
-     inkscape:cy="397.31773"
+     inkscape:zoom="2.0466562"
+     inkscape:cx="450.4909"
+     inkscape:cy="286.56498"
      inkscape:window-x="1994"
      inkscape:window-y="27"
      inkscape:window-maximized="1"
@@ -530,7 +530,7 @@
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4"
-       width="140.00002"
+       width="260"
        height="45.000004"
        x="599.99994"
        y="45.000011"
@@ -562,9 +562,9 @@
     <rect
        style="fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4"
-       width="140.00002"
+       width="160.00002"
        height="45.000004"
-       x="960"
+       x="959.99994"
        y="-120"
        ry="2.2558987" />
     <text
@@ -584,26 +584,26 @@
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1">4.1</tspan></text>
     <rect
-       style="opacity:0.75;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
+       style="opacity:1;fill:#333333;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:2;stroke-opacity:1"
        id="rect917-0-0-4-4-9-4-5"
        width="140.00002"
        height="45.000004"
-       x="1080"
-       y="-174.99998"
+       x="1100"
+       y="-175.00003"
        ry="2.2558987" />
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="1134.2344"
+       x="1156.057"
        y="-155.49881"
        id="text1185-3-55-4-0-0-0-1"><tspan
          sodipodi:role="line"
-         x="1134.2344"
+         x="1156.057"
          y="-155.49881"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan957-2-8-6-3-9-7">Mickledore</tspan><tspan
          sodipodi:role="line"
-         x="1134.2344"
+         x="1156.057"
          y="-137.50214"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-1-4">4.2</tspan></text>
@@ -658,17 +658,17 @@
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="650.42737"
-       y="64.633629"
+       x="653.72168"
+       y="64.866302"
        id="text1185-3-55-4-0-0-7"><tspan
          sodipodi:role="line"
-         x="650.42737"
-         y="64.633629"
+         x="653.72168"
+         y="64.866302"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
-         id="tspan957-2-8-6-3-2">Hardknott</tspan><tspan
+         id="tspan957-2-8-6-3-2">Hardknott </tspan><tspan
          sodipodi:role="line"
-         x="650.42737"
-         y="82.63031"
+         x="653.72168"
+         y="82.862984"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans Bold';text-align:center;text-anchor:middle;fill:#fffefe;fill-opacity:1;stroke:none"
          id="tspan10317-2-9-8">3.3</tspan></text>
     <g
@@ -777,20 +777,41 @@
          id="tspan49906">2023</tspan></text>
     <text
        xml:space="preserve"
-       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-       x="962.71832"
-       y="250.21216"
+       style="font-weight:bold;font-size:6.66667px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="849.49744"
+       y="61.106953"
        id="text1185-9-7-1-1-0"><tspan
          sodipodi:role="line"
-         x="962.71832"
-         y="250.21216"
+         x="849.49744"
+         y="61.106953"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:6.66667px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:end;text-anchor:end;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan46212">Support for this version was extended to leave</tspan><tspan
+         sodipodi:role="line"
+         x="849.49744"
+         y="70.105324"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:6.66667px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:end;text-anchor:end;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan120364">users more time to adapt to override syntax</tspan><tspan
+         sodipodi:role="line"
+         x="849.49744"
+         y="79.103691"
+         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:6.66667px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:end;text-anchor:end;fill:#fffefe;fill-opacity:1;stroke:none"
+         id="tspan123280">changes in the 3.4 release.</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
+       x="972.71832"
+       y="260.21216"
+       id="text1185-9-7-1-1-0-7"><tspan
+         sodipodi:role="line"
+         x="972.71832"
+         y="260.21216"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan31345-42">Oct.</tspan><tspan
+         id="tspan31345-42-7">Oct.</tspan><tspan
          sodipodi:role="line"
-         x="962.71832"
-         y="268.20883"
+         x="972.71832"
+         y="278.20883"
          style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans, Bold';font-variant-ligatures:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-east-asian:normal;text-align:center;text-anchor:middle;stroke:none"
-         id="tspan49906-9">2022</tspan></text>
+         id="tspan49906-9-6">2022</tspan></text>
     <text
        xml:space="preserve"
        style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#000000;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
-- 
2.34.1


