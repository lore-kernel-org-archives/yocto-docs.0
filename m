Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ED3D6B076
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17118.1769700277591879057
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Lsiy6N9o;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F40A3C22F48
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F366A606FD;
	Thu, 29 Jan 2026 15:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 322C7119A868D;
	Thu, 29 Jan 2026 16:24:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hKE6HB7aYaQaJ2IAafNrZUmTeBp03N16vkYYMxNa2TE=;
	b=Lsiy6N9oNpYaVvqf4pErslna3giKQYsA1Itz43Mc+8Xz7LpunpZZbCSHi7DRXnU80jTDgE
	9zRBkU/RQ5/mYL4gtX7M5Avy3abfMrECq1yM1Z7Nb0HMAQ6ut13wjXwAUpXxQ+Gby58BWy
	i5f1m2Brc8DVIVhcoq3QapUmCcle/JahprbeWAljPpvvAu+JIhJ5HfSW6JzWPg3ctLJzpZ
	5qE8oYLEAYMvGOh9jPAEV1zsQRIdcncggo2VlAubvK3LHUqLKnfFE+dBzJXLpxGjx4TPzk
	PIa9avgk5AuJLRb8PgtDYykd+pkefjQAInbeibekKaPq0ZyeT+dAwTy1UG0+5A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:38 +0100
Subject: [PATCH v3 47/57] ref-manual/devtool-reference.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-47-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2733;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=O1d1vrrLrjx45L1rC17Pkv8av6MfKUXVpV2snsBEALk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uQJPBm+hZF2XvI8/3ZFo+LXl8OvBUPxQ7uT
 ffDy+MumIGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7kAAKCRDRgEFAKaOo
 Nj5JD/9wAmWUYILJ0UF4P7zajJF/NeyfFTDwWH/sbJysSGxcEaRJSwSfnDkeb7ncNenvK9B8ROa
 /4H0Sztq/yOuALr7eX2vlAvDFm6bn1nQOFcm06TZWsIAH3Dl2rufa1IJ4IKnwFbbo9zGWHLHaoV
 UI2xrBuGHN5+VjKQa5S2qoYKY9HKjjcqjtPXF1gFLuYPtCTH+vTmatYGwpszMx/vWW8uXbqwtGl
 e8rr27knswlrky0jOT65WRpnIPYsWOl1N+jjL6MjWta/OFYABI/df/ksbvHXjrkku8POalIgfRT
 c8+HLNCap5zGhsCY7wAH7P+Y4F3UVZuPpr03LtfTfWGLoO4t3h1BTiTMaeuTCRMddqKfTtPqb4y
 4AjA1hXOzf2pRREuxTk3dSqJP2kB1E5ZqajuayhgpwGcaG7JjGhRwYVSv5nk5REQ/EBI0nwz6S6
 Knl2u0maj0QAhWAQ9dMb+XTksJ9YkvQnIhB3g96ubPe4PUWrXU7NheCz+EwIrvOY4ZdiXOlAqPT
 hqjtW4n9P9PKkWzEvo1/tar9KZQOko1j559rwW6/aks+76cDqPwLtlCxY8PCfs3okmtVjK91Zho
 tPAGKG5fY9GTDTim4Ged6Hcyrc+iMefG87V6HbcGb0iJCVYTfIZyBv4m5sx+XWLTFdKk8QsswIu
 UENXQUZyD0V5s9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8833

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


