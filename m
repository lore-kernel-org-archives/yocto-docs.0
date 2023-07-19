Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855D6C00528
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 05:23:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.7563.1689744214746078383
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 22:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vuhj0SFN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C71CC0002;
	Wed, 19 Jul 2023 05:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689744212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gBtixqpYetHqgbazVQpUArc9RWqxyxE1vHg6RhEv/I4=;
	b=Vuhj0SFNWJ4KTr8Xex++gwip9niUj9rM33+7t86WKHC2jkskj793MGhcri2uZ5PMifj9bV
	rnf5XPElFJ8OeMfOfvLMHB/7Ai0xpt05LYCrfeldMdaY+QLr5EQ4bmOlHv0pSR5DsPEmIX
	fLOKU0wfUSBmPrNiQ1tH6juPslXOmIFu5Kdtt6qfpwf2QSuY7gwD0oulwarqCPinhZkFqA
	M0PJ8o/9VfiEJfHb9iiApdIgKoLA90Lid0y/b9vBBPO+t0fYM+cWSFX45owAaRj3QyB2AW
	scC2nyGFIZjFLJPgSTU+/KJydcLbR/52f5zDw+minFblFwHMa2sZlkjmfkkKAQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: LTS releases now supported for 4 years
Date: Wed, 19 Jul 2023 07:23:21 +0200
Message-Id: <20230719052321.255614-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Jul 2023 05:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4062

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 21 ++++++++++----------
 documentation/ref-manual/terms.rst           |  2 +-
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 50e7d39629..c861feaa9d 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -96,22 +96,21 @@ While stable releases are supported for a duration of seven months,
 some specific ones are now supported for a longer period by the Yocto
 Project, and are called Long Term Support (:term:`LTS`) releases.
 
-This started with version 3.1 ("Dunfell"), released in April 2020, that
-the project committed to supporting until the next :term:`LTS` release was out.
-This next :term:`LTS` release, version 4.0 ("Kirkstone"), was released in May 2022
-and offered with two years of support too.
-
-However, as an experiment, support for "Dunfell" was extended to four years, until
-April 2024, therefore offering more stability to projects and leaving more time
-to upgrade to the latest :term:`LTS` release. The project hasn't made any commitment to
-extending "Kirkstone" support too, as this will also depend on available funding
-for such an effort.
-
 When significant issues are found, :term:`LTS` releases allow to publish
 fixes not only for the current stable release, but also to the
 :term:`LTS` releases that are still supported. Older stable releases which
 have reached their End of Life (EOL) won't receive such updates.
 
+This started with version 3.1 ("Dunfell"), released in April 2020, which
+the project initially committed to supporting for two years, but this duration
+was later extended to four years. Similarly, the following :term:`LTS` release,
+version 4.0 ("Kirkstone"), was released two years later in May 2022 and the
+project committed to supporting it for four years too.
+
+Therefore, a new :term:`LTS` release is made every two years and is supported
+for four years. This offers more stability to project users and leaves more
+time to upgrade to the following :term:`LTS` release.
+
 See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
 of stable and :term:`LTS` releases.
 
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index b5d5f1dbdf..31ddeae009 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -276,7 +276,7 @@ universal, the list includes them just in case:
    :term:`LTS`
       This term means "Long Term Support", and in the context of the Yocto
       Project, it corresponds to selected stable releases for which bug and
-      security fixes are provided for at least two years. See
+      security fixes are provided for at least four years. See
       the :ref:`ref-long-term-support-releases` section for details.
 
    :term:`Metadata`
-- 
2.34.1


