Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9E5CCFA00
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:29:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.2035.1761841755980806432
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PsSP79QJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9EE1E4E413FF
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 764B260331
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04E4111808BEA;
	Thu, 30 Oct 2025 17:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761841754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VXeEtP7UQv1EkC9OfkxhS3k1XQimZbs8zCQO2qHuXkg=;
	b=PsSP79QJ/w25Xg9UcQDKikC1ERB8cWoag51bndM5A5InBYlmxrvAs6sDr93n0o7WLWHfR2
	DqvT4xfeEWuJUUl3wOpvJhUvR31woNcBM/148gOJt2BuBgHiUd4aPHLTCO/ZVfSy+B4vww
	hGJ3sGzE4QI3fkbYHVos/b8SZurIkIyoqmDbQlvygbV0Y0lP9lb6mmH+c2H3pI1Yew+kgm
	Q5PHlH6Mi1kHN4zlbK/PYvFC/HzqwXynSwRwQd/Yl7NceNzBe9yezDUOjQtthuyyW666Xf
	yw2DOUT65h/wBHqX6NUv+2OeCSz/n1g6cv31aPBazX6KzkDeeD0F+eejyQq/bg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 30 Oct 2025 17:28:35 +0100
Subject: [PATCH 6/6] ref-manual/terms.rst: update Poky description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-bitbake-setup-v1-6-f44a8a2b7c0b@bootlin.com>
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=uEHzqAKXqc7JJMqCqzTjRdy94fUsCEFbaZDd6cPSWsI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpA5JWPQuuPT0U0dzOPYSi6GFJyaKwG9UM7wSL9
 cSnPxwx/iKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQOSVgAKCRDRgEFAKaOo
 Nj9vD/90PqRTyvXHeEs0+boANmLq487eQwJKwzExscTEkj3W1ld910wY624e5ejobK/ncJjoEqv
 dnXxiI3ZiZoBaYw3oWGDGQ5cdII/quQNpyWyjUy78djvK9Ryix84dI0/069zwX8TE/Xy40JQK5Y
 G2Elz+gG3rw7VN9hzaEDyXs7tuN8TUsC0o0dCYlUj6gJQVQnSVZASeSQsmofnayayx3iVOV2pMc
 r8VafAXGzlXdWV/zqKbsJNkx9ZOdZ2CJBrl8ZZPyYpVn0allktWKyThEEVvaby035Q0+FtnkfLm
 svraDw/GihKJaw7vgO22F8JtNgLVk8Q+8hK1HPpMx+paN9kn8TLOZobp/UAsOx7X7CDCiJajSO8
 gVBgnvGkoGPz4UaIuwtrYbqHblVtv7Hr0CyLAI2Gx+ZOo/ELhFnatzAKHjQ3d5Oalqbv6Su154s
 IyCdA0Etz8iOp+hMBSe5N2FgTifOluAceHAiNJ3VjhWhSjLWvFug8zc9/jZKde9FuGeZ32ALErY
 VlEctHz2AjcG/gG6dLG6rtl4EcEmwROwYclhFmn8V3/4XkVucHdxkndbw30q1Mjs6Yn26ZFxWN3
 GTAH324X4jUpf0NQmhGSONY/B/XlfmDWzFHpg3fbV+/plA7+iYrg+NeVamysRbl7B5N3LhLdGnI
 2xDT2BYLTgcGtXQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7931

Poky as in the repository will no longer be updated. Update the
description of Poky to remove the last bullet point, and add a note to
say that Poky was used before.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index e25c714d9..6a9f88061 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -461,11 +461,26 @@ universal, the list includes them just in case:
       -  A means by which to test the Yocto Project components (i.e. Poky
          is used to validate the Yocto Project).
 
-      -  A vehicle through which you can download the Yocto Project.
-
       Poky is not a product level distro. Rather, it is a good starting
       point for customization.
 
+      .. note::
+
+         Poky also used to be a repository containing the combination of
+         :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
+         :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
+         documentation -- which were combined with the :yocto_git:`combo-layer
+         </poky-config>` tool.
+
+         This repository is still hosted at :yocto_git:`/poky` and is still
+         updated for maintained releases that are older than Whinlatter (5.3).
+         Newer releases now use ``bitbake-setup`` to clone and setup the initial
+         :term:`OpenEmbedded Build System` environment. For more information on
+         how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
+         document. An alternative can be to setup the above repositories
+         manually, by following the :doc:`/dev-manual/poky-manual-setup`
+         section of the Yocto Project Development Tasks Manual.
+
       .. note::
 
          Poky began as an open-source project initially developed by

-- 
2.51.0


