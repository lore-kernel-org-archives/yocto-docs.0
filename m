Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B776C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:22:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.4225.1675876919735770365
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 09:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b3i2sZXi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 474F4C000C;
	Wed,  8 Feb 2023 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675876917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1zsvsvNEDF9MBvDuai4e/uVjL/6VGlK292g8iS6HkVY=;
	b=b3i2sZXijOyv8HOJgctjcJTRz2ILt20+7nw2OudQ5fL12O9IgW44Iz10jJp9bnO6ko6nEU
	+NQy0fN1r+eUAw9w4MjLYe73q9yuupq4mHfDNbsi5bNz8dxMOudUloLDZl52bKpfybSFBi
	/lR8sBG4XdiHs2OPDros3Hca97dK1ySyW9ZeexYZJoRJ3BfINR1MZBU4YiqwOeK2qSzLUd
	pMefcv5AnLQabd2vCe6I0cKRK/J7NSTr0J2iUirxX30I17rKN4+Hhpe1ElPPcjoLlc+mXu
	fOQkaIPWxPnQoUrx5PMYy9tB8YmcEpGLx9oqeMuN5orOf8WgWeZP8IswNXYHgg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: improve "devtool check-upgrade-status" explanations
Date: Wed,  8 Feb 2023 18:21:55 +0100
Message-Id: <20230208172155.101239-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Feb 2023 17:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3650

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Fix broken link to a .bb file
- Clarify the explanations

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/devtool-reference.rst          | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 6aa09f6d6f..32e64d02a2 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -378,14 +378,7 @@ command::
 Unless you provide a specific recipe name on the command line, the
 command checks all recipes in all configured layers.
 
-Following is a partial example table that reports on all the recipes.
-Notice the reported reason for not upgrading the ``base-passwd`` recipe.
-In this example, while a new version is available upstream, you do not
-want to use it because the dependency on ``cdebconf`` is not easily
-satisfied. Maintainers can explicit the reason that is shown by adding
-the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
-See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb>`
-for an example::
+Following is a partial example table that reports on all the recipes::
 
    $ devtool check-upgrade-status
    ...
@@ -396,6 +389,16 @@ for an example::
    INFO: base-passwd               3.5.29          3.5.51          Anuj Mittal <anuj.mittal@intel.com>  cannot be updated due to: Version 3.5.38 requires cdebconf for update-passwd utility
    ...
 
+Notice the reported reason for not upgrading the ``base-passwd`` recipe.
+In this example, while a new version is available upstream, you do not
+want to use it because the dependency on ``cdebconf`` is not easily
+satisfied. Maintainers can explicit the reason that is shown by adding
+the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
+See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb?h=kirkstone>`
+for an example::
+
+   RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
+
 Last but not least, you may set :term:`UPSTREAM_VERSION_UNKNOWN` to ``1``
 in a recipe when there's currently no way to determine its latest upstream
 version.
-- 
2.37.2


