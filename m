Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04541EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 13:00:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.12263.1689858013906071290
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Jul 2023 06:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JjLaeHgS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 029C4FF804;
	Thu, 20 Jul 2023 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689858012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y367jgj6tSxyYUGdoChWb757QUiPU81YqAh/WdPkbvQ=;
	b=JjLaeHgSqCgJQgAy9qRci4HxgEvgsG9pqbfM3G1UFFtedMYXpdq7ByT5cNvKy0FIrgx1PP
	Zd6WfU8iSVQNvEHiAFD8iNG6dFYsdRFirGbeeB3O1leVb/yBoTRY/eYNKkAKbEBJa5hVYE
	p7b804sxGVyWl4JAe9t3vCOzCMoUaKE3IpDFzJij7lFZ/uLw5b9BSv5xXi3Ne7ICI5DzKk
	5x+eWXyf8QlCSF6J8hYhAt9RjBnqba3ghyZgnFxDHDrnj/sq8tD9BKQ1T0VPwxnuwBegyG
	PVsgC3taYfNV1zfbHu9Lg6qChX4RJvhqG++hqqarUUPEhWxTxtck1s5Spo/CGw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [mickledore] ref-manual: LTS releases now supported for 4 years
Date: Thu, 20 Jul 2023 15:00:08 +0200
Message-Id: <20230720130008.334508-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Jul 2023 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4072

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 21 ++++++++++----------
 documentation/ref-manual/terms.rst           |  2 +-
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 2ffbd935c7..81c0cdb36d 100644
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
index 8f7281676c..046eed6359 100644
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


