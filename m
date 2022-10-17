Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF6CC43219
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 17:06:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.175.1666026386443993773
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 10:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lChMiRmW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3DEF7E0006;
	Mon, 17 Oct 2022 17:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666026383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9NWA6t0OshqZADcAeX4XRi8DOQFNOvrJv47+ohTorIo=;
	b=lChMiRmWo9cSMHfuNIylgHvD5CCFXvYXRxwpU6AFFHvuykJymlElxefkjjnPU/eRsY7WLF
	UFAWXWp5xZm5HB+MolfHcOlQmr+9WcQs9D4hxXmZr1WQSP7KKvkpzWpXNH+0Okdd8Gx5gW
	6GKf6ag3WRi7NnnDkrWlAYl8rq8A18+W1ChraVlVCEyVOgEDoyiC3jXDo58wv8Z+KFLiMP
	zX0tcE8aqEjgAgc37MeL6z8Vx8+MKP/DIsunySef5t8dFGoUmTLSMAQ0HeDHyX87P9mvv5
	2DQ93t/NKNXadh6Hz91rtnlnJF7yikUII4IBj4jLXMUghswN6kRHoryqcZM5lQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] migration-guides: add known issues for 4.1
Date: Mon, 17 Oct 2022 19:06:13 +0200
Message-Id: <20221017170613.244775-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Oct 2022 17:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3369

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.1.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 4639d04cb4..be722356d1 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -187,7 +187,17 @@ New Features / Enhancements in 4.1
 Known Issues in 4.1
 ~~~~~~~~~~~~~~~~~~~
 
-
+- The change to :ref:`migration-4.1-complementary-deps` means that images
+  built with the ``ptest-pkgs`` :term:`IMAGE_FEATURES` don’t automatically
+  install ``ptest-runner``, as that package is a recommendation of the
+  individual ``-ptest`` packages.  This will be resolved in the next point
+  release, and can be worked around by explicitly installing ``ptest-runner``
+  into the image.  Filed as :yocto_bugs:`bug 14928 </show_bug.cgi?id=14928>`.
+
+- There is a known issue with eSDKs where sstate objects may be missing,
+  resulting in packages being unavailable to install in the sysroot. This is
+  under investigation and appears to be related to hash equivalence. Filed as
+  :yocto_bugs:`bug 14626 </show_bug.cgi?id=14626>`.
 
 Recipe License changes in 4.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.34.1


