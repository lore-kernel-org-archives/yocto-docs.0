Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26821EE14D3
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 09:34:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9181.1694079274849005100
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 02:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FDi4pqoG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A98301BF20C;
	Thu,  7 Sep 2023 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694079272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LZMXFru09vEd5hoPmaj0pxnxp8eV6n17FbJLxGbWgpw=;
	b=FDi4pqoGqlvRd1E9tyO5AW0XTPw50xapKpoQCn3YzT2vr6rxRht6VWGgddWMjgJkCDik7R
	ojJMl2kxaxw+rksMfgUYa/oWpBRsY43/B0hAbyCTUesHOKwm9TkG/lVOkTkaPHsfZKueF9
	jclAcnCgrVEuKlROR2Ut7yTus/3V716EHf5gfKtBQ19AB/aRzVuQdQfWU11s3MkTKrEU6y
	yHZHIsNauV3AXM1tU5S6MbUaoVwblIfF1aQ6ofZV2qfWdCs4pk5rXDqTGn4faUxzwXMJKE
	xUsIAkaG8eLPzpX9hceLCDNCzqWXAIyiAo5FQkp6+vp6gUuNiYERDY5yNBiR3Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [mickledore][PATCH] README: Update to point to new contributor guide
Date: Thu,  7 Sep 2023 11:33:59 +0200
Message-Id: <20230907093359.197435-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Sep 2023 09:34:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4201

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Now we have a contributor guide combining various wiki pages, point at
that and tweak to match our other READMEs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 README | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/README b/README
index 85d8d837b2..88d7fc5530 100644
--- a/README
+++ b/README
@@ -10,23 +10,22 @@ An online version of the documentation can be found at:
 Contributing
 ============
 
-See https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for generic guidelines for configuring Git and preparing patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/contributor-guide/
+for full details on how to submit changes.
 
-Read the documentation/README and documentation/standards.md files
-for rules to follow when contributing to the documentation.
-
-Where to Send Patches
-=====================
+As a quick guide, patches should be sent to docs@lists.yoctoproject.org
+The git command to do that would be:
 
-When sending single patches, please using something like:
-'git send-email -1 --to docs@lists.yoctoproject.org
+     git send-email -M -1 --to docs@lists.yoctoproject.org
 
 The 'To' header can be set as default for this repository:
 
-$ git config sendemail.to docs@lists.yoctoproject.org
+     git config sendemail.to docs@lists.yoctoproject.org
 
 Now you can just do 'git send-email origin/master..' to send all local patches.
 
+Read the documentation/README and documentation/standards.md files
+for rules to follow when contributing to the documentation.
+
 Git repository: https://git.yoctoproject.org/yocto-docs
 Mailing list: docs@lists.yoctoproject.org
-- 
2.34.1


