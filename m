Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED95E776F5
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123741.1766593941262908475
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oopedrWp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BB3514E41D90
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E56E6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2EF010AB1375;
	Wed, 24 Dec 2025 17:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Y3pXgqgK2JNGP2rnsQcOlAzBDhMCho05PbyZ0r6bjs=;
	b=oopedrWpK0uzBSVYhL2VnTGxTu0ROnQ7R5theZmZTo8YhaBf+tP0eR+LK0XYmHipx4uHMd
	isSB+5y9kycjIkRxNl3ATwCh0t2Z08xcQD3JF74TPo1W+sH6C/JVgKY72Ax3kQ/iVxesn1
	tsVJyZ7ukarDMW6HuRxab9zvQ6J5QDy4kElwOPLyZ4k70wATi548wZimym7yCB5s0HCPr0
	O+zznJ7Ag1K86HUojnmBQI2mdGDzrP4aEt5mPBXbJoEgS1eXXMsY1JM251mu39t3UPP9Ph
	Cnk1p44gbWpE/wsdrbpweNMjRMBIFM2sHJJrx+nBxh5h6jgUsFce15kJWBbZNA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:11 +0100
Subject: [PATCH 45/53] ref-manual/devtool-reference.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-45-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2651;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HypVyfUQTsdfrr6PYUszF0J/+gwlzUcMUVliVCg3Cdw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVv4aNmkqpM2Kiq4GpRXZLBfMG8a18JALagB
 4J34tL0stiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbwAKCRDRgEFAKaOo
 Nr0CEACXMhRo1WGXv7dLeT2Fu0/Nh51bILqmFa5FRJEKtOQndXb5AUokDVmCooEGUD4jpSDzqVe
 IEXokqA6TlCh/WLpk/fc1Nu+sRVttgwembjBQuifRBvyNMoJDzB+urRqEt0orU9srdpDBu6xTD6
 T5z59Yykbrkk8Fho+qPFmG6i0fdaY7GpU75GM74uU7FCHVwFmJT6mYVRChUgGIX8pyG5pPTiwWA
 I7LdXelFDzRVXL1BZX3vTKL83FlmQRhQ0/njRn/7+ch1PQURmDLgBzkYI67eqrO7lulHap2ipXI
 slOFohy0QeNjkdx6BARBizFuc5IB3csjhJ8Sxv7zWn6rei+R8/YJY7T6CEAhCuyMJ9w/gmz5tdD
 ifyh1XhSnnwPBr6m9wQCkX0VOWK224wklg2bTKzhl1YDBXa+peBXWe2ZhrCjFC83wHTCKpkJGYJ
 pFxQ58AXHR1kxe2dsyWkPU0Br64UwRraJIxiUgC/5dAGffueXeMiDajCQM/HiiVGDh1MsOvCxgh
 9EJPNH18sjpnvc9uHSACVrcIUhH2aw/xhHwgXGbBP1r8iOmM6m6HEQ64t50bb0mrNhH6YPDEp0j
 Rc2SNLDx7tVg4rkbakS3DCgbpki/nnVEcPPRq+op5uwjvlsdLbkDGrxU4sIUinm+shTVXCseaV6
 +ddM5xupvzBJifg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8374

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 5ac567591..69288744a 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -346,7 +346,7 @@ variables in package recipes.
       mechanisms cannot find the new upstream versions.
 
    -  For the ``oe-core`` layer, recipe maintainers come from the
-      :yocto_git:`maintainers.inc </poky/tree/meta/conf/distro/include/maintainers.inc>`
+      :oe_git:`maintainers.inc </openembedded-core/tree/meta/conf/distro/include/maintainers.inc>`
       file.
 
    -  If the recipe is using the :ref:`bitbake-user-manual/bitbake-user-manual-fetching:git fetcher (\`\`git://\`\`)`
@@ -390,7 +390,7 @@ In this example, while a new version is available upstream, you do not
 want to use it because the dependency on ``cdebconf`` is not easily
 satisfied. Maintainers can explicit the reason that is shown by adding
 the :term:`RECIPE_NO_UPDATE_REASON` variable to the corresponding recipe.
-See :yocto_git:`base-passwd.bb </poky/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb?h=kirkstone>`
+See :oe_git:`base-passwd.bb </openembedded-core/tree/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb?h=kirkstone>`
 for an example::
 
    RECIPE_NO_UPDATE_REASON = "Version 3.5.38 requires cdebconf for update-passwd utility"
@@ -460,7 +460,7 @@ Here is an example that resets the workspace directory that contains the
 
    $ devtool reset mtr
    NOTE: Cleaning sysroot for recipe mtr...
-   NOTE: Leaving source tree /home/scottrif/poky/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
+   NOTE: Leaving source tree /home/scottrif/project/build/workspace/sources/mtr as-is; if you no longer need it then please delete it manually
    $
 
 .. _devtool-finish-working-on-a-recipe:
@@ -633,7 +633,7 @@ Here is sample output after using
 to create and add the ``mtr_0.86.bb`` recipe to the ``workspace`` directory::
 
    $ devtool status
-   mtr:/home/scottrif/poky/build/workspace/sources/mtr (/home/scottrif/poky/build/workspace/recipes/mtr/mtr_0.86.bb)
+   mtr:/home/scottrif/project/build/workspace/sources/mtr (/home/scottrif/project/build/workspace/recipes/mtr/mtr_0.86.bb)
    $
 
 .. _devtool-search-for-available-target-recipes:

-- 
2.51.0


