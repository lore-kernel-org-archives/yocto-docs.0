Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6667DC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:45:38 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.220.1651005930933663363
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LMl55jiF;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E56F6100005;
	Tue, 26 Apr 2022 20:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651005929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4AGEQ04v54c395z+1rhxR400ZLXkfUmN7uJnxdqpUyw=;
	b=LMl55jiFD+lg3OrFQIfgBl43d+1QiX9DhmTuQU0DX22Taa5XxgSpr8Y/lNw6OWv9ylYr2p
	7S+YNM2xyDi3oyo6eUsvYTSQEliN5C6Ft8QgMMZcd0LQVejPQz1D9DFxih/KFC29jYNDtQ
	rp+kKw7aItVk1kcceVwXQjIa8n+ZLgmTjMUzCudiqM4Z8Spl1Y7ErEmAvuFZaxPJZf1khV
	4IptmuJFqQzNr+2eKj1G+ZoKSKZ0k8xYjtER8m3yV4m9udTn8ns8EDvMzY4WahsnGpAgQl
	bgHJsHQs3GjMRMp8n6Hfld1vTYT/MuD9LjBn/TRJqtJnNye4fUqn7ZJVqaVBcQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: remove confusing and unnecessary paragraph
 about site.conf
Date: Tue, 26 Apr 2022 22:45:26 +0200
Message-Id: <20220426204526.191666-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2868

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The explanations which precede and follow are sufficient.

The removed text seemed to suggest to use conf/site.conf to specify
the location of another conf/site.conf file.

Another issue was that the way to override conf/site.conf settings
through conf/local.conf was described before explaining that
conf/site.conf is processed before conf/local.conf.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 065d9586c6..441cd13bc3 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -313,7 +313,7 @@ section in the Yocto Project Development Tasks Manual.
 
 The files ``site.conf`` and ``auto.conf`` are not created by the
 environment initialization script. If you want the ``site.conf`` file,
-you need to create that yourself. The ``auto.conf`` file is typically
+you need to create it yourself. The ``auto.conf`` file is typically
 created by an autobuilder:
 
 -  *site.conf:* You can use the ``conf/site.conf`` configuration
@@ -321,17 +321,7 @@ created by an autobuilder:
    you had several build environments and they shared some common
    features. You can set these default build properties here. A good
    example is perhaps the packaging format to use through the
-   :term:`PACKAGE_CLASSES`
-   variable.
-
-   One useful scenario for using the ``conf/site.conf`` file is to
-   extend your :term:`BBPATH` variable
-   to include the path to a ``conf/site.conf``. Then, when BitBake looks
-   for Metadata using :term:`BBPATH`, it finds the ``conf/site.conf`` file
-   and applies your common configurations found in the file. To override
-   configurations in a particular build directory, alter the similar
-   configurations within that build directory's ``conf/local.conf``
-   file.
+   :term:`PACKAGE_CLASSES` variable.
 
 -  *auto.conf:* The file is usually created and written to by an
    autobuilder. The settings put into the file are typically the same as
-- 
2.25.1


