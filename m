Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04C8CA6C9D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6064.1769501995459286196
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=u9TP6aiY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E55B94E422CC
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB9AF606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CA45119A8689;
	Tue, 27 Jan 2026 09:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rmIrF+MW7Xl0UUsWDwOrLpEGoeQV53EawFhd/Hpkp9M=;
	b=u9TP6aiYw/EaSwpFW61YrYlphR1h1R1oJOOnFzmMP3SyvQik/XKfkuGtQvetm0Z/UCsif3
	AJR+h9vcj/nXPgwdoFI37RvhxtKYcxq4LlWJAfujDC4BGTxlWOMkDmH6HhFpTPfRy4tO9i
	sPWnL4fCiVBcHKSSVi9GZJ5W5JceNHlosYAvxwyIfakISGp5tCBG16vD26iOQzNkaZnlwZ
	zOjQtII+UhKE1mQj3Hzz5E2mRdpFiQo25ZtNoaSkNBq2JN/cvh1tEYG5EkkSrgeCHBIDf6
	ARlnRtQccWJResWLQRarKX+emgyrcmLNQNMASkXQgzzJjWeS78KZjZj1r3/NJg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:41 +0100
Subject: [PATCH v2 46/56] ref-manual/devtool-reference.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-46-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2677;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LmoVfPFNrfoZkufD4cmmhlGk+eTaezCq2C7zHOj/NAI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUFs0ljp5d+R4Dl5ZCQ9ODstGzhdDBJOJedU
 jAqaRi6EA2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 Nm26D/9/cQPWA7fHmxo6Su3X3EU7v6sAdgM3Imydi4tWIQzfUA0zkySpOFlSf9ch+r9x5BP4Mcr
 MelYRZ/dfcoZO7EqmVHSJVL2DTvfjd2ar17SOXKdFF3qHae+3E2Mdrl0VA4OyLrb/kXy6xR7fmn
 Qruq/rgwBTljeArSy1PlSrTznPaCDAHEAfKpr70j96h1CoawJEARFD/jAgpbCgIXRF+x6w8XIS+
 9ZyC5amBMsRp48jiZjEfWTadUZhNYQTxsbuJc8e7eYBhSZyhngetXWfoM8bb9yy1KfRZS5cewft
 xJv4xgeawkwl1DT/VD32Wl5M8ViQ+o8hVSSCVULcue8gp7296e0Vw20OZI8iQuz4azo5XvPK0Pw
 Mk2bo4f1xS4sZmZsGnzIfhCkGeF7JKq3qxRuSHqmgh3mDGyeUwJWlaCyJHKcXxQvsr4DDR2jXLi
 U8R0Gys7cSbZ8mc7gVdoNrsaPi5FV3nlxtwq+OSnnFB2qSCZ6/DxP+I4eOq5QUlDE6MnsLZVQXb
 pl9bru13yBY2QocnmTcN72tQU/lbmpYE8ecDq/yK3Nb9COg+FiUMgvedQpuQxuqE0j/VpPn+880
 TJgr28JDCHT3wp88tIEebOkNN7g8jmmcHozoODhOWrFRnfwq/BjoP5j/EIDO1NXYgI0HpFvyTdk
 qyXfAGdROk5RbWg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8707

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5ac567591..863825b06 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -346,7 +346,7 @@ variables in package recipes.
       mechanisms cannot find the new upstream versions.
 
    -  For the ``oe-core`` layer, recipe maintainers come from the
-      :yocto_git:`maintainers.inc </poky/tree/meta/conf/distro/include/maintainers.inc>`
+      :oe_git:`maintainers.inc </openembedded-core/tree/meta/conf/distro/include/maintainers.inc>`
       file.
 
    -  If the recipe is using the :ref:`bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
@@ -390,8 +390,8 @@ In this example, while a new version is available upstream, you do not
 want to use it because the dependency on ``cdebconf`` is not easily
 satisfied. Maintainers can explicit the reason that is shown by adding
 the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
-See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb?h=kirkstone>`
-for an example::
+See the :oe_git:`base-passwd_*.bb </openembedded-core/tree/meta/recipes-core/base-passwd/>`
+recipe for an example::
 
    RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
 
@@ -460,7 +460,7 @@ Here is an example that resets the workspace directory that contains the
 
    $ devtool reset mtr
    NOTE: Cleaning sysroot for recipe mtr...
-   NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
+   NOTE: Leaving source tree /home/scottrif/bitbake-builds/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
    $
 
 .. _devtool-finish-working-on-a-recipe:
@@ -633,7 +633,7 @@ Here is sample output after using
 to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
    $ devtool status
-   mtr:/home/scottrif/poky/build/workspace/sources/mtr (/home/scottrif/poky/build/workspace/recipes/mtr/mtr_0.86.bb)
+   mtr:/home/scottrif/bitbake-builds/build/workspace/sources/mtr (/home/scottrif/bitbake-builds/build/workspace/recipes/mtr/mtr_0.86.bb)
    $
 
 .. _devtool-search-for-available-target-recipes:

-- 
2.52.0


