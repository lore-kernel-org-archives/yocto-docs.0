Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE22CD6E72
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:37:41 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.16701.1697031452012364741
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 06:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pl1UqnU2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC6531BF203;
	Wed, 11 Oct 2023 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697031450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRdgDaxsCRhUDWajb3dIyWxPF+QHzewazfjorQ0cRvk=;
	b=Pl1UqnU2Lm20c9S+ALafLkcJwRKuMN0K6gePNuMZeKuFA8iWDxIpdKHhonza1hFoVgBuI0
	MAQhdH+rY7YYdf0uQZEeeJju5NXkKSE3S5FV0Lmh6lBjzCHGLxBiH0luH+d9DdTRhUio19
	zQBMvq8vKZ8L7AxNpuI6bfxBWK4GHD5wkV8ox9IRsVv3RUgqNY6wODMatQH/6zBmn6mmc3
	IGHxqyleLXSSMZxR+umcmiy4udgAW0+6oUpenHIom+V5wFWI5FKt5aPtUSpgB2m/kPcJVl
	UbN9O5LrkGFemimhA878lbpJ0XzI1LoTQ8xYcdeLij6BMZmKpv45qvFoJu4kNQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [mickledore][PATCH 3/4] overview: Add note about non-reproducibility side effects
Date: Wed, 11 Oct 2023 15:37:19 +0200
Message-Id: <20231011133720.78265-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011133720.78265-1-michael.opdenacker@bootlin.com>
References: <20231011133720.78265-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:37:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4348

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an additional note about some of the side effects that can occur if
recipes are not reproducible and hash equivalence is enabled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 668e002565..80d75dd7c3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1963,6 +1963,15 @@ task output from the Shared State cache.
    the stability of the task's output hash. Therefore, the effectiveness
    of Hash Equivalence strongly depends on it.
 
+   Recipes that are not reproducible may have undesired behavior if hash
+   equivalence is enabled, since the non-reproducible diverging output maybe be
+   remapped to an older sstate object in the cache by the server. If a recipe
+   is non-reproducible in trivial ways, such as different timestamps, this is
+   likely not a problem. However recipes that have more dramatic changes (such
+   as completely different file names) will likely outright fail since the
+   downstream sstate objects are not actually equivalent to what was just
+   built.
+
 This applies to multiple scenarios:
 
 -  A "trivial" change to a recipe that doesn't impact its generated output,
-- 
2.34.1


