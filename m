Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EE2C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:02:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.1963.1646841770603402425
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 08:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ovWq9JJz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C32ED1C0002;
	Wed,  9 Mar 2022 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646841768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FNLZLJZVp0ilSwaHsoXFiOII5Ycb46fgVhYiVUpD4I8=;
	b=ovWq9JJzlp+yqueSCdqCfQbiKe92kNoatmLE0kkvI4UerUHxrHMQG/f9zdrxvRQ13nfMtD
	fpiu9mwT0zo6gujSBI9DZM3BUfo1CxyvUUZLrBCaJLJyMVbygLKg6iW2C4CmBM2dF/A7A9
	fnnW9Km7vuCxCYUy2KDuKVXgycoBdHskouz9sbjWk12pXaJUYU+YCPpos0ABlKu4OpnVW0
	XK0uFB/JXISO2QOSajY6tTgggwaY+4sB8ZnBe/pSEULP8s6b8KBfXAEJdC6YEEFNvZ9JLz
	v2HDQ9vUa+9Me7XmW2+28HN70oPmg4NJLnkXCn67OgimuBHCjE8eEnpfoFIDzQ==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: details about using firewalls and limiting fetch
 threads
Date: Wed,  9 Mar 2022 17:02:42 +0100
Message-Id: <20220309160242.616026-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 16:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2558

Fixes [YOCTO #13235]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 1caf953901..609e38cbcd 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -1481,6 +1481,24 @@ compressed suffixes such as ``diff.gz`` and ``patch.bz2``, for example.
 The build system automatically applies patches as described in the
 ":ref:`dev-manual/common-tasks:patching code`" section.
 
+Fetching Code Through Firewalls
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Some users are behind firewalls and need to fetch code through a proxy.
+See the ":doc:`/ref-manual/faq`" chapter for advice.
+
+Limiting the Number of Parallel Connections
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Some users are behind firewalls or use servers where the number of parallel connections
+is limited. In such cases, you can limit the number of fetch tasks which run in parallel by
+setting the below option in your ``local.conf`` file.
+
+The :yocto_git:`meta-poky/conf/local.conf.sample.extended </poky/tree/meta-poky/conf/local.conf.sample.extended>`
+file shows how to set a maximum of four fetch tasks in parallel::
+
+   do_fetch[number_threads] = "4"
+
 Unpacking Code
 --------------
 
-- 
2.25.1


