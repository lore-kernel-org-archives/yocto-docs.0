Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323F1C43217
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:14:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.25664.1647440070187848963
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 07:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ehYgByWM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E9BB140003;
	Wed, 16 Mar 2022 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647440068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GMX8XuqlANeq03+JaEtKVD+0RgHPHRidq2Eb5EZ+ghY=;
	b=ehYgByWMm3xM0bMKs75eyjkKwJLJkPjJiDE45I+YFp670SSIq0jpjP+dlz8whKAUlscSuG
	bIPShHPFpA5rFTHxcBgVNTjCKqSy18nRYTLIVg/R2aL3AdblWI0dnDNmWzQ5aieBKTz8Tx
	8jg1EQqfgw6MN/xvM719zyJ+509Yn/bWJZxspjCziX1fKaPegDkJYRMmeONqT1szAu+yGC
	g8Mil9hJvfdVl/rzxCcMGA73gp0WEBG+tRbgKS2ENbn1lNdwPo98tfeWJY1e/8ZKKMc2kF
	4pfosc/160cz9D/sdxrbhHB6KwWkE7nDu5wY805rqstKYjGEt6M7SUz2urUflg==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] doc: migration-3.5: move the distutils changes to the class
 changes section
Date: Wed, 16 Mar 2022 15:14:25 +0100
Message-Id: <20220316141425.185394-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Mar 2022 14:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2608

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/migration-3.5.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index da09b6f449..8380ffbf4a 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -54,12 +54,12 @@ Recipe changes
 - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
   which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
 
-- The `distutils*.bbclasses` have been moved to `meta-python`. The classes and
-  `DISTUTILS*` variables have been removed from the documentation.
-
 Class changes
 -------------
 
+- The `distutils*.bbclasses` have been moved to `meta-python`. The classes and
+  `DISTUTILS*` variables have been removed from the documentation.
+
 - ``blacklist.bbclass`` is removed and the functionality moved to the
   :ref:`base <ref-classes-base>` class with a more descriptive
   ``varflag`` named :term:`SKIP_RECIPE` which will use the `SkipRecipe()`
-- 
2.25.1


