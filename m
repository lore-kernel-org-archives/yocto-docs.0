Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C49C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 05:51:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.101028.1683525066255818900
 for <docs@lists.yoctoproject.org>;
 Sun, 07 May 2023 22:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C/G0zELZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F20C060006;
	Mon,  8 May 2023 05:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683525064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uTKHJ26iGYSaXpxf+iQoYinxfXw71cAQgOwns9RiDR0=;
	b=C/G0zELZ202SXsXD+RlO45Hz53IW5cOSJWitQCNQ50qrorro9Q9xIEZKnDf9rq1gsWytrO
	P4h9hblFSW1OCYbl3GmHvWfMXAcEtQ5LrMwkDOLNFyYCaQpQ/0BJD7OCTJKygJDfkc8zSn
	ulQNG3dFzBLaMb0FMNWBWkHm3OCwSgwSVvbvGfhGHFfQLIRcyffyfWeg2I0pRmroDpLsLB
	wnnCG4UffEbJ+74AaVnMDDLFaf7oqxUqJMmSAy039LWCDMtfJiHIXEbmkESjeSOBAZaHSp
	rbqWlp2VppUUhehPLKwbJ844N2ghGUotgZt3UM+x6BLyYiaf/b6IwL30Yi6gPw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] releases.svg: update according to latest release
Date: Mon,  8 May 2023 07:51:00 +0200
Message-Id: <20230508055100.2204477-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 May 2023 05:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3923

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Update the Mickledore starting and ending time
- Mickledore is no longer a future release

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/svg/releases.svg | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
index f2607244c8..50e3728ee9 100644
--- a/documentation/ref-manual/svg/releases.svg
+++ b/documentation/ref-manual/svg/releases.svg
@@ -383,9 +383,9 @@
      inkscape:window-height="1016"
      id="namedview4"
      showgrid="true"
-     inkscape:zoom="0.72360224"
-     inkscape:cx="889.30073"
-     inkscape:cy="397.31773"
+     inkscape:zoom="1.4472045"
+     inkscape:cx="777.01528"
+     inkscape:cy="286.41426"
      inkscape:window-x="1994"
      inkscape:window-y="27"
      inkscape:window-maximized="1"
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
-- 
2.34.1


