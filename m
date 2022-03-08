Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4258C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:04:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.8391.1646748291520686117
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oh5Itbr5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 005BD24000E;
	Tue,  8 Mar 2022 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646748289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dCtfy3zxV49LTgwxkVjpQlmwMOUe1FezWGiQBoOl9T8=;
	b=oh5Itbr5LMn1JFX/DgBNjvDdC/wYkrxXPeFc6gEW18Mc7IdBMXJWIdexpBFvSshsZakmcV
	5ez2kAiEGb23aiQs/62Qb6A0hToo63aCzW/vvcTesJ+K5I5vKU9J4Hu+YTxqX2kJcfgaqh
	z1dXYhoJDHKmPZuXWB13cVBVIlmg8zXCwIasi3LoeoQzzAwJvAez1nry+XcVdzRGc9cGVT
	dXApAZdZRuWYBprgzsRJCZqP1+Yzpj/Dc0zf6aLXlhvtJq1YGL67G+l95Mm6ps98FvNpvk
	ntZBGiEv8xKz0Lgv9EM3kBOVzcTYVOTlainwHXq8CM40Mctjge0+/I5nRQB4GA==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: overview-manual: formating fixes
Date: Tue,  8 Mar 2022 15:04:25 +0100
Message-Id: <20220308140425.581011-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 14:04:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2542

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 47493786d9..ae35687ee5 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -300,13 +300,8 @@ in the ``meta-poky`` layer:
 
 .. note::
 
-   Configurations set in the
-   conf/local.conf
-   file can also be set in the
-   conf/site.conf
-   and
-   conf/auto.conf
-   configuration files.
+   Configurations set in the ``conf/local.conf`` file can also be set
+   in the ``conf/site.conf`` and ``conf/auto.conf`` configuration files.
 
 The ``bblayers.conf`` file tells BitBake what layers you want considered
 during the build. By default, the layers listed in this file include
-- 
2.25.1


