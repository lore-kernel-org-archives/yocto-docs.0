Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2B3C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:24:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.2314.1646843067164514404
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 08:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NhcFvErv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 472691C0005;
	Wed,  9 Mar 2022 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646843065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4wpeFkUqppoY1KUlZxJt//luhPf8oERRTa9hf/fiaRE=;
	b=NhcFvErv1vT6pn/MEEkt70/WsnkjfVgHrE3oVGdP+V8Vg3oDExp1t+nUwhDejQSJjz4cft
	LQSxfE44NMt2+SJi+2/ogZSXug41GjBvb1lTy/Px6qVw4epOSGTSVPFMPMoVODmDWk+SmV
	1VEv+D40hvcHema6MnwJOw4VNMF5PimAgnkHnWIGd/t7rk3ps4c+IF+gXB1oSyDJrDW4If
	FM/cSJWVwh00mNZw3nvj2ARpVqKenOXEbiTM3bX8NiVMz8gHNU8OMqtSI9Br+ebPc+dh/7
	b3mSLnY4AMBzdv6FIgtpkmitpQ4JDHosiSPWr3Q61IvNQLs/gUg6ew/wcIpu3g==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] documentation/REAMDE: correct heading styles actually used in
 the YP manuals
Date: Wed,  9 Mar 2022 17:24:22 +0100
Message-Id: <20220309162422.616698-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 16:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2560

Sphinx seems to offer flexibility in heading styles definitions,
but the new text matches the way subsubsections and subsubsubsections
are defined in the current manuals.

Note that it's not possible to mix different definitions, for example
by using "~~~~" and "^^^^" for subsubsections in different places.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/documentation/README b/documentation/README
index 123812dcac..6f6a8ec842 100644
--- a/documentation/README
+++ b/documentation/README
@@ -175,17 +175,18 @@ The layout of the Yocto Project manuals is organized as follows
     Book
       Chapter
         Section
-          Section
-            Section
-
-Here are the heading styles defined in Sphinx:
-
-    Book              => overline ===
-      Chapter         => overline ***
-        Section       => ====
-          Section     => ----
-            Section   => ^^^^
-              Section => """" or ~~~~
+          Subsection
+            Subsubsection
+              Subsubsubsection
+
+Here are the heading styles that we use in the manuals:
+
+    Book                       => overline ===
+      Chapter                  => overline ***
+        Section                => ====
+          Subsection           => ----
+            Subsubsection      => ~~~~
+              Subsubsubsection => ^^^^
 
 With this proposal, we preserve the same TOCs between Sphinx and Docbook.
 
-- 
2.25.1


