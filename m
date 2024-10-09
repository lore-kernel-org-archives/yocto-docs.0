Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410D4CED621
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10722.1728459696481490254
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lBpTUsuT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 077CD1BF20F;
	Wed,  9 Oct 2024 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0xPTuZ00YCTugRTa7doF6u5Z109huadeuOFsB1B5t0=;
	b=lBpTUsuTImdQVtjNdgLtugSbopkbi1FJGJe+XMADmP/8HTC1T/hnJWt8qnoryWsHikMO9E
	o3xVZmmwVzN240nExXLRFqmC3iAjO99ToxG0iiWEwXWaSwVBUiGn72ylaJ80TldNL9d2uA
	tC8CasgcHYPUWDXwlpUAni0ECdKrCKT1WYPwDT4mUMdSN8Mz5Ny6gQDWOZ6mG8ZXaOJWSf
	giwl1sB5Ez6yFj4u1cnBm1C3roaen+2UHLCJ8ljV6b8jHHLFv20rqlUXfujXVOzrY1jmDs
	rE60lZs6qpPTvQY8sAr0RPBOFpJBcXPtH2GYwbsXokc8ucWKsVnuF8kyP/Z2Wg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 13/16] ref-manual: merge patch-status-* to patch-status
Date: Wed,  9 Oct 2024 09:41:11 +0200
Message-ID: <20241009074120.866786-14-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5420

From: Antonin Godard <antonin.godard@bootlin.com>

These are not distinct anymore and check for any patches in any layer.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 121887d1f..0fce37cfa 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1461,12 +1461,8 @@ The tests you can list with the :term:`WARN_QA` and
 -  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
    them to apply incorrectly if the underlying code changes.
 
--  ``patch-status-core:`` Checks that the Upstream-Status is specified
-   and valid in the headers of patches for recipes in the OE-Core layer.
-
--  ``patch-status-noncore:`` Checks that the Upstream-Status is specified
-   and valid in the headers of patches for recipes in layers other than
-   OE-Core.
+-  ``patch-status:`` Checks that the Upstream-Status is specified and valid in
+   the headers of patches for recipes.
 
 -  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
    installed and packaged by a recipe.
-- 
2.46.0


