Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20079C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 14:05:09 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.12929.1642514707777170935
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 06:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D3332240018;
	Tue, 18 Jan 2022 14:05:05 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: stop mentioning the Angstrom distribution
Date: Tue, 18 Jan 2022 15:05:03 +0100
Message-Id: <20220118140503.3466088-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jan 2022 14:05:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2424

Now defunct

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index d465c2f440..938a580cd3 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6131,7 +6131,7 @@ layer. The following steps provide some more detail:
       variables that differ as compared to ``defaultsetup.conf``.
       Alternatively, you can create a distribution configuration file
       from scratch using the ``defaultsetup.conf`` file or configuration files
-      from other distributions such as Poky or Angstrom as references.
+      from another distribution such as Poky as a reference.
 
 -  *Provide miscellaneous variables:* Be sure to define any other
    variables for which you want to create a default or enforce as part
@@ -7540,7 +7540,7 @@ Setting up Effective Mirrors
 
 A good deal that goes into a Yocto Project build is simply downloading
 all of the source tarballs. Maybe you have been working with another
-build system (OpenEmbedded or Angstrom) for which you have built up a
+build system for which you have built up a
 sizable directory of source tarballs. Or, perhaps someone else has such
 a directory for which you have read access. If so, you can save time by
 adding statements to your configuration file so that the build process
-- 
2.25.1


