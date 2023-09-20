Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD6CCE79AF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.32192.1695197766086350768
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iflYvpLr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 669251BF20C;
	Wed, 20 Sep 2023 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dy6vj9cx4Dzq5RMk2phPQyqsCSq+mrcchiYplXaRzWI=;
	b=iflYvpLrV+YV8hxa1WRv/D416wVgz6ByrDMeJFVyGNk0QVLJcL+65MOFvwRYqb1rE8D8pN
	ABC7V5vc0EafBslqYOOiuk/Sd+ZonoaLi4MOOPxti8SdglapsxU3BmUZ+ayfLBjsJMImKd
	H37eThrT/CVLL/fZSpQpwWQ32QAkxRNRwbXrzvLCw/lLy0lo5db68E1Sr5JLjtrjf+JVjB
	rYwmVI0QVJ80MfkfaW9HeI2ZhpO2lv35PRNDv+NVIlSa0OoiXGkyPHn3QJLypuLuVs9GcH
	5newAK5ulzhorDASwwOz9vFFbjGQsuQkcuPLmHjbFwiVhAskBqQ7fyvjANRkVw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 04/10] dev-manual: new-recipe.rst fix inconsistency with contributor guide
Date: Wed, 20 Sep 2023 10:15:38 +0200
Message-Id: <20230920081544.1226760-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4251

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This document was suggesting a way to version pre-releases
which doesn't match the latest recommendations from the
contributor guide.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 2c1101ec2b..8c471699a7 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1036,13 +1036,14 @@ build system and package managers, so the resulting packages will not
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


