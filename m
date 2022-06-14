Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB85C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 18:04:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.135.1655229843217615528
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 11:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WRe2JoEP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 91FC620007;
	Tue, 14 Jun 2022 18:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655229840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bWd86a3DXTvy30dEP4uR238jVBXj4K1HEbX9cnB+fHE=;
	b=WRe2JoEPyjhTekm9I+evZuQhiALsmcxbefiakPDI5nTMABddsiQyRd7xyJvPrvPKa1AJWQ
	YIPWKeyXh0ghbketB+HTr83vAQDpjpLnOHDE+xTG6PLz0bMMMQTD1j+KTJad5nqLRJJHf/
	wI+R05aSjXAAFztBriyJ+OIvTDhqd3Wvq56RsPdhxTq70wV5O7oMdRePtTcwGgI3KSwsop
	GvBBRELg1Sn3P9hG26U/j+BRwJiCfwRlOo5eULe65kaEk1m+GtTUiXl/xGnYzwBbrBTn2U
	92Gb+blxvH2vPs5k9/d9ePlKG7ouWHMikWvYpI6lUQ5bD1x/m8nq4/eRriZjrg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc: standard for bulleted lists
Date: Tue, 14 Jun 2022 20:03:51 +0200
Message-Id: <20220614180351.1071851-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jun 2022 18:04:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2998

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/standards.md | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/documentation/standards.md b/documentation/standards.md
index abdebc82bf..9f4771ebd9 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -7,6 +7,31 @@ It is currently a work in progress.
 
 ## Text standards
 
+### Bulleted lists
+
+Though Sphinx supports both the ``*`` and ``-`` characters
+for introducing bulleted lists, we have chosen to use
+only ``-`` for this purpose.
+
+Though not strictly required by Sphinx, we have also chosen
+to use two space characters after ``-`` to introduce each
+list item:
+
+    -  Paragraph 1
+
+    -  Paragraph 2
+
+As shown in the above example, there should also be an empty
+line between each list item.
+
+An exception to this rule is when the list items are just made
+of a few words, instead of entire paragraphs:
+
+    -  Item 1
+    -  Item 2
+
+This is again a matter of style, not syntax.
+
 ### Line wrapping
 
 Source code for the documentation shouldn't have lines
-- 
2.34.1


