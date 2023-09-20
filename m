Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE848CE79AF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.31932.1695197285412559411
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mpvKCfF9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 609281C0007;
	Wed, 20 Sep 2023 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIjO9+raJ6G0uzyu+816OyfR9YEttvbSTcIccq3aNQQ=;
	b=mpvKCfF9FvY/UEhn2p5tmcVXxW6VnuSTZ5ytTZ9Q1Ece1pW4+6krfFS5XtRVUtigK/PE6S
	T2E4FoEilBZQFe3DobHZ9F3TFM7anrrzauJ9La2dmANQsQO38IbJDUJmbqXrN0iyEMFOEc
	FeGMUOXywkQiDQhKNYdMHY13fBZqyCvE3z/9EovFbIaAMZ32TkRgHhj4Wao/PcST9zM+NQ
	xiXtQT2+k7+snmbOPtZm6iWF95iUyA80OC0pnEeHVoPMVahmB7sR8lHA1INDRGp22oUeUQ
	Hx1xCw/EOPUMtFM0PGimGNujqlZomZHZYiaA4/NgAmX10YBigWQYg4qN0K9X9Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 3/7] dev-manual: new-recipe.rst fix inconsistency with contributor guide
Date: Wed, 20 Sep 2023 10:07:50 +0200
Message-Id: <20230920080754.1225508-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
References: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4242

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This document was suggesting a way to version pre-releases
which doesn't match the latest recommendations from the
contributor guide.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index ab3e193aaf..39ee9683b0 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1082,13 +1082,14 @@ build system and package managers, so the resulting packages will not
 correctly trigger an upgrade.
 
 In order to ensure the versions compare properly, the recommended
-convention is to set :term:`PV` within the
-recipe to "previous_version+current_version". You can use an additional
-variable so that you can use the current version elsewhere. Here is an
-example::
+convention is to use a tilde (``~``) character as follows::
 
-   REALPV = "0.8.16-rc1"
-   PV = "0.8.15+${REALPV}"
+  PV = 0.8.16~rc1
+
+This way ``0.8.16~rc1`` sorts before ``0.8.16``. See the
+":ref:`contributor-guide/recipe-style-guide:version policy`" section in the
+Yocto Project and OpenEmbedded Contributor Guide for more details about
+versioning code corresponding to a pre-release or to a specific Git commit.
 
 Post-Installation Scripts
 =========================
-- 
2.34.1


